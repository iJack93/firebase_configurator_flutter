#!/bin/bash

# Function to show usage
show_usage() {
  echo "Usage: $0 --user-email=<user_email_account> --firebase-project-dev=<firebase_project_id_dev> --firebase-project-stg=<firebase_project_id_stg> --firebase-project-prod=<firebase_project_id_prod> --bundle-id=<base_app_bundle_id>"
  exit 1
}

# Parse command-line arguments
for arg in "$@"; do
  case $arg in
    --user-email=*)
      user_email_account="${arg#*=}"
      shift
      ;;
    --firebase-project-dev=*)
      firebase_project_id_dev="${arg#*=}"
      shift
      ;;
    --firebase-project-stg=*)
      firebase_project_id_stg="${arg#*=}"
      shift
      ;;
    --firebase-project-prod=*)
      firebase_project_id_prod="${arg#*=}"
      shift
      ;;
    --bundle-id=*)
      base_app_bundle_id="${arg#*=}"
      shift
      ;;
    *)
      echo "Invalid option: $arg"
      show_usage
      ;;
  esac
done

# Ensure all variables are set
if [ -z "$user_email_account" ] || [ -z "$firebase_project_id_dev" ] || [ -z "$firebase_project_id_stg" ] || [ -z "$firebase_project_id_prod" ] || [ -z "$base_app_bundle_id" ]; then
  echo "Error: Missing one or more required parameters."
  show_usage
fi

# Function to run a flutterfire configure command
run_flutterfire_configure() {
  local project=$1
  local env=$2
  local build_config=$3
  local out_path="lib/config/firebase/$env/firebase_options.dart"
  local android_out_path="/android/app/src/$env/google-services.json"
  local ios_out_path="/ios/Firebase/$env/GoogleService-Info.plist"

  # Set the correct suffixes for dev and stg environments
  if [ "$env" == "production" ]; then
    local ios_bundle_id="$base_app_bundle_id"
    local android_package_name="$base_app_bundle_id"
  elif [ "$env" == "development" ]; then
    local ios_bundle_id="$base_app_bundle_id.dev"
    local android_package_name="$base_app_bundle_id.dev"
  elif [ "$env" == "staging" ]; then
    local ios_bundle_id="$base_app_bundle_id.stg"
    local android_package_name="$base_app_bundle_id.stg"
  fi

  echo "Running flutterfire configure for environment: $env, build config: $build_config"
  echo 'yes' | flutterfire configure \
    --account="$user_email_account" \
    --project="$project" \
    --out="$out_path" \
    --android-out="$android_out_path" \
    --ios-bundle-id="$ios_bundle_id" \
    --android-package-name="$android_package_name" \
    --ios-out="$ios_out_path" \
    --ios-build-config="$build_config" \
    --platforms=android,ios \
    --yes

  echo "Finished flutterfire configure for $env - $build_config"
}

# Run flutterfire configure for each environment and build configuration

# Development
run_flutterfire_configure "$firebase_project_id_dev" "development" "Debug-development"
run_flutterfire_configure "$firebase_project_id_dev" "development" "Profile-development"
run_flutterfire_configure "$firebase_project_id_dev" "development" "Release-development"

# Staging
run_flutterfire_configure "$firebase_project_id_stg" "staging" "Debug-staging"
run_flutterfire_configure "$firebase_project_id_stg" "staging" "Profile-staging"
run_flutterfire_configure "$firebase_project_id_stg" "staging" "Release-staging"

# Production
run_flutterfire_configure "$firebase_project_id_prod" "production" "Debug-production"
run_flutterfire_configure "$firebase_project_id_prod" "production" "Profile-production"
run_flutterfire_configure "$firebase_project_id_prod" "production" "Release-production"

echo "All flutterfire configurations completed successfully."
