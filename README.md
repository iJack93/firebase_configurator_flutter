# --->UNDER DEVELOPMENT<---
For the moment, supports only iOS and Android. More platforms will be added in the near future.

# Firebase Configurator for Flutter

This script automates the configuration of Firebase for different environments (development, staging, and production) in a Flutter project. It utilizes the flutterfire command-line tool to generate configuration files for Firebase across different environments and platforms (Android and iOS).

## Table of Contents

* Requirements
* Installation
* Usage
* Examples
* License
* Requirements

To use this script, you must have the following installed:

* Flutter (v2.5.0 or later)
* FlutterFire CLI (flutterfire)
* A Firebase account and Firebase projects set up for development, staging, and production environments.
  Installation

## Clone the Repository
To download the script, clone this repository to your local machine:

```shell
git clone https://github.com/iJack93/firebase_configurator_flutter.git
cd firebase_configurator_flutter
```

Or, you can download the script directly:

```shell
curl -O https://raw.githubusercontent.com/iJack93/firebase_configurator_flutter/main/firebase_configurator_flutter.sh
chmod +x firebase_configurator_flutter.sh
```

## Usage

This script allows you to easily configure Firebase across multiple environments for a Flutter project. You need to pass in the following parameters:

```shell
--user-email: Your Firebase account email.
--firebase-project-dev: Firebase project ID for the development environment.
--firebase-project-stg: Firebase project ID for the staging environment.
--firebase-project-prod: Firebase project ID for the production environment.
--bundle-id: The base app bundle ID.
```

|    | Variable                  | Description                                         |
|----|---------------------------|-----------------------------------------------------|
| 1. | --user-email              | Your Firebase account email                         |
| 2. | --firebase-project-dev    | Firebase project ID for the development environment |
| 3. | --firebase-project-stg    | Firebase project ID for the staging environment     |
| 4. | --firebase-project-prod   | Firebase project ID for the production environment  |
| 5. | --bundle-id               | The base app bundle ID                              |

## Running the Script
You can run the script using the following command:

```shell
./firebase_configurator_flutter.sh \
--user-email="your-email@example.com" \
--firebase-project-dev="firebase-project-id-dev" \
--firebase-project-stg="firebase-project-id-stg" \
--firebase-project-prod="firebase-project-id-prod" \
--bundle-id="com.example.app"
```

### Running from Another Folder
You can run the script from any directory by providing the full or relative path to the script:

```shell
/path/to/repo/firebase_configurator_flutter.sh \
--user-email="your-email@example.com" \
--firebase-project-dev="firebase-project-id-dev" \
--firebase-project-stg="firebase-project-id-stg" \
--firebase-project-prod="firebase-project-id-prod" \
--bundle-id="com.example.app"
```

### Running Directly from GitHub
You can also run the script directly from the GitHub repository using curl or wget without cloning the repository:


## Using curl:

```shell
curl -s https://raw.githubusercontent.com/<username>/<repository>/main/firebase_configurator_flutter.sh | bash -s -- \
--user-email="your-email@example.com" \
--firebase-project-dev="firebase-project-id-dev" \
--firebase-project-stg="firebase-project-id-stg" \
--firebase-project-prod="firebase-project-id-prod" \
--bundle-id="com.example.app"
```

## Using wget:

```shell
wget -qO- https://raw.githubusercontent.com/<username>/<repository>/main/firebase_configurator_flutter.sh | bash -s -- \
--user-email="your-email@example.com" \
--firebase-project-dev="firebase-project-id-dev" \
--firebase-project-stg="firebase-project-id-stg" \
--firebase-project-prod="firebase-project-id-prod" \
--bundle-id="com.example.app"
```

License

This project is licensed under the MIT License - see the LICENSE file for details.
