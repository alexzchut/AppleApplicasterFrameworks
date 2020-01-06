# :green_apple: Apple Frameworks

![CircleCI](https://circleci.com/gh/applicaster/AppleApplicasterFrameworks.svg?style=svg&circle-token=8fedcc78af0010cec307b550771857ed27eee835)
![Platforms](https://img.shields.io/badge/Platforms-iOS%20|%20tvOS-f6b854.svg)
[![GitHub license](https://img.shields.io/github/license/applicaster/AppleApplicasterFrameworks)](https://github.com/applicaster/AppleApplicasterFrameworks/blob/master/LICENSE)

- **OS:** iOS 10+, tvOS 12+
- **Languages:** Swift 5.1, frameworks can be used in Swift and Objective-C
- **Tool requirements:** Xcode 11.3, Cocoapods 1.8.3
- **License:** [Appache 2.0](https://github.com/applicaster/AppleApplicasterFrameworks/blob/master/LICENSE)

**Note:** Please do not change this document directly. If you need to update documentation use template `README.md.ejs` file.

## :paperclip: Table of contents

- [Overview](#eyeglasses-overview)
- [Frameworks List](#fax-frameworks-list)
- [Usage](#pencil2-usage)
- [Folder Structure](#file_folder-folder-structure)
- [How to add new framework?](#page_facing_up-how-to-add-new-framework)
- [How to update existing framework?](#page_with_curl-how-to-update-existing-framework)
- [How it works?](#mortar_board-how-it-works)

## :eyeglasses: Overview

This respository is the main container for general frameworks and plugins for [ZappApple](https://github.com/applicaster/AppleApplicasterFrameworks) project. Each frameworks defined here support `cocoapods` as a dependency manager.

## :fax: Frameworks List

##### ZappCore: <%= ZappCore %>
- **Description:** Contain plugin protocols, helper methods that can be used by any Zapp plugin or framework
- [**Documentation**](https://applicaster.github.io/AppleApplicasterFrameworks/ZappCore/index.html)

### Zapp Plugins

#### Type: Crashlogs

##### MS App Center: <%= ZappCrashlogsMsAppCenter %>
- **Description:** [App center](https://appcenter.ms) crash logs service.
- [**Documentation**](https://applicaster.github.io/AppleApplicasterFrameworks/ZappCrashlogsMsAppCenter/index.html)
- **Manifest:**
	- [iOS](https://zapp.applicaster.com/admin/plugin_versions?id=crashlogs_appcenter&platform=ios)

## :pencil2: Usage

To use any framework availible in this repo add cocoapods dependency in podfile.
List of all frameworks can be checked [here](https://applicaster.github.io/AppleApplicasterFrameworks/FrameworksList.md)

**Example:**
```ruby
pod 'ZappCore', :git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => '2020.15.0.20-1-6'
```
## :file_folder: Folder Structure
Repository has predefined structure if you want to add something, please conform to the strict structure rules defined below

```swift
Apple Framworks
├── docs // Contains generated documentation for the frameworks. Content is generated automatically.
├── fastlane // Configuration of the fastlane deployment tool used in CI.
├── Frameworks // Frameworks data seperated by folders.
│   ├── *FrameworkName // All Frameworks, not part of ZAPP PLUGINS type.
│   │   ├── Files // Files that are relevant for the framework.
│   │   │   ├── ios // Files that can be used in iOS only
│   │   │   ├── tvos // Files that can be used in tvOS only
│   │   │   └── Universal // Files that can be used in iOS and tvOS
│   │   ├── Project // Xcode Project created to generate documentation.
│   │   │   ├── .jazzy.yaml // Jazzy configuration file that defined to create auto generated docs
│   │   │   └── * // Files relevant to project
│   │   └── Templates // Template files relevant for framework automation.
│   │   │   ├── .jazzy.yaml.ejs // Jazzy template configuration file that is defined to create auto generated docs.
│   │   │   └── FrameworkName.podpec.ejs  // Cocoapods template dependency.
│   └── PluginType // Type of the plugin, please check availible plugin list below
│       ├── *FrameworkName // All Frameworks, is part of ZAPP PLUGINS type.
│       │   ├── Files // Files that are relevant for the framework.
│       │   │   ├── ios // Files that can be used in iOS only
│       │   │   ├── tvos // Files that can be used in tvOS only
│       │   │   └── Universal // Files that can be used in iOS and tvOS
│       │   ├── Manifest // ZAPP PLUGINS manifest describes plugin created by Zappifest.
│       │   ├── Project // Xcode Project created to generate documentation.
│       │   │   ├── .jazzy.yaml // Jazzy configuration file that is defined to create auto generated docs
│       │   │   └── * // Files relevant to project
│       │   ├── Templates // Template files relevant for framework automation.
│       │   │   ├── .ios.json.ejs // Template manifest for ios ZAPP PLUGIN structure.
│       │   │   ├── .tvos.json.ejs // Template manifest for tvos ZAPP PLUGIN structure.
│       │   │   ├── .jazzy.yaml.ejs // Jazzy template configuration file that is defined to create auto generated docs.
│       └── └── └── FrameworkName.podpec.ejs  // Cocoapods template dependency.
├── FrameworksApp // General client app that has defined all availible frameworks.
├── Scripts // Automotization scripts. All scripts defined in JavaScript.
├── .versions_automation.json // Automation file, must not be changed by user. Contains JSON with title and version of each framework.
├── DrameworksData.plist // Contains information about frameworks: title, version and etc.
├── Gemfile // Ruby packages.
├── LICENSE // Repo licence type.
├── package.json // Java Script packages.
├── README.md // Git documentations file.
├── README.md.ejs // Git documentations template file.
└── *.podspec // Cocoapods dependency files for all frameworks.
```

## :page_facing_up: How to add new framework

- Create branch `framework_name_new_version_id`
- Create folder for the new framework
	- If framework: `./Frameworks/YourFrameworkName`.
	- If it is Zapp plugin: `./Frameworks/Plugin/PluginType/YourFrameworkName`.
	- Defined folder will be called framework root folder
- Use [Folder Structure](#folder_structure) article to verify place for your items
- Open `FrameworksData.plist` file.
	- Add new value in array of frameworks. Value must be dictionary.
	- Add key `framework` with value `YourFrameworkName`
	- Add key `version_id` with value `version number` based on `major/minor/bug` `1.0.0` convention.
	- Add key `folder_path` with value `General path to your framework`.  Example: `./Frameworks/Plugins/Analytics/GoogleAnalytics`
	- Add key `is_plugin` with value `true/false` in case if it is `Zapp Plugin`.
- Create `Files` folder in your framework's root folder. Add files that are needed for framework.
	- If files for the framework can be used with `ios` and `tvos` add to folder `Universal`
	- If files for the framework `ios` only add to folder `ios`
	- If files for the framework `tvos` only add to folder `tvos`
	- One framework can have all three types of folders if it supports `ios` and `tvos`.
- Create `podspec` file for your framework in root of the repo folder.
	- `podspec` name must be same name of the `plugin` or `framework`.
	- Prepare `podspec` defined files and dependencies if needed.
	- If framework supports `tvos` and `ios` dependency must be defined in same `podspec` file. For instructions please refer to [Cocoapods](https://guides.cocoapods.org/) documentation
	- Example
	```ruby
    Pod::Spec.new do |s|
      s.name             = "ZappFirebaseAnalytics"
      s.version          = '0.2.0'
      s.summary          = "ZappFirebaseAnalytics"
      s.swift_versions = '5.1'
      s.description      = <<-DESC
                          ZappFirebaseAnalytics container.
                           DESC
      s.homepage         = "https://applicaster.com"
      s.license = 'Appache 2.0'
      s.author           = { "cmps" => "a.kononenko@applicaster.com" }
      s.source = { :git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => '1' }
      s.platform = :tvos, :ios
      s.tvos.deployment_target = "10.0"
      s.ios.deployment_target = '10.0'

      s.dependency 'ZappCore'
      s.dependency 'Firebase/Analytics', '= 6.14.0'

      s.requires_arc = true

      s.source_files = ['Frameworks/Plugins/Analytics/Firebase/Files/Universal/**/*.{swift}']

      s.xcconfig =  {
        'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
        'ENABLE_BITCODE' => 'YES',
        'OTHER_CFLAGS'  => '-fembed-bitcode',
        'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}"/Firebase/**',
        'OTHER_LDFLAGS' => '$(inherited) -objc -framework "FIRAnalyticsConnector" -framework "FirebaseAnalytics" -framework "FirebaseCore" -framework "FirebaseCoreDiagnostics" -framework "FirebaseInstanceID" -framework "GoogleAppMeasurement" -framework "GoogleDataTransport" -framework "GoogleDataTransportCCTSupport" -framework "GoogleUtilities" -framework "nanopb"',
        'USER_HEADER_SEARCH_PATHS' => '"$(inherited)" "${PODS_ROOT}"/Firebase/**'
      }
    end
	```
- Create `Project` folder in your framework's root folder.
	- Create xCode project with your framework's name title.
	- If the framework has [cocoapods](https://cocoapods.org) dependecies, create `podfile` and configure it for the project. Do not add `Pods` folder to git repo.
	- Create file `.jazzy.yaml` with configuration of [Jazzy documentation](https://github.com/realm/jazzy). Details configure [Jazzy](https://github.com/realm/jazzy) can be founded in [Jazzy Repo](https://github.com/realm/jazzy) or copied from existing frameworks.
		- Example:
		```swift
		module: ZappFirebaseAnalytics
        module_version: "0.2.0"

        author: "Applicaster ltd."
        copyright: "© 2019 [Applicaster ltd.](http://bustoutsolutions.com) under [Appache 2.0](https://github.com/applicaster/AppleApplicasterFrameworks/blob/master/LICENSE)."

        author_url: https://www.applicaster.com
        github_url: https://github.com/applicaster/AppleApplicasterFrameworks/tree/master/Frameworks/Plugins/Analytics/Firebase/ZappFirebaseAnalytics

        output: "../../../../../docs/ZappFirebaseAnalytics"
        clean: true
        min_acl: "private"
        sdk: [iphone, appletv]
        theme: jony
		```
- If framework is Zapp Plugin. Create `Manifest` folder in your framework's root folder. Next step should only be done on the relevant platforms.
	- Create manifest file using [Zappifest](https://github.com/applicaster/zappifest) for `ios` plugin if needed. Rename it to `ios.json`. As dependency use
    ```ruby
      "extra_dependencies": [
        {
          "FrameworkName": ":git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => 'tag_number'"
        }
      ],
    ```
    - Create manifest file using [Zappifest](https://github.com/applicaster/zappifest) for `tvos` plugin if needed. Rename it to `tvos.json`. As dependency use
    ```ruby
      "extra_dependencies": [
        {
          "FrameworkName": ":git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => 'tag_number'"
        }
      ],
    ```
    Example:
    ```JSON
    {
      "api": {
        "require_startup_execution": false,
        "class_name": "ZappFirebaseAnalytics.FirebaseAnalyticsPluginAdapter",
        "modules": []
      },
      "dependency_repository_url": [],
      "platform": "ios",
      "author_name": "Anton Kononenko",
      "author_email": "a.kononenko@applicaster.com",
      "manifest_version": "<%%= version_id %>",
      "name": "Zapp Firebase Analytics QuickBrick",
      "description": "Provide Firebase Analytics as agent. Please use this plugin only if you are using quick brick",
      "type": "analytics",
      "identifier": "zapp_firebase_analytics",
      "ui_builder_support": true,
      "whitelisted_account_ids": ["5ae06cef8fba0f00084bd3c6"],
      "min_zapp_sdk": "14.0.0-Dev",
      "deprecated_since_zapp_sdk": "",
      "unsupported_since_zapp_sdk": "",
      "react_native": false,
      "extra_dependencies": [
        {
          "ZappFirebaseAnalytics": ":git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => '1.0'"
        }
  ],
      "custom_configuration_fields": [],
      "targets": ["mobile"]
	}
    ```
- Create `Templates` folder in your framework's root folder. In this folder you will be provided data for automated deployment. Templates files use structure of [ejs](https://ejs.co).
	- Copy the `.jazzy.yaml` file created before and rename it to `.jazzy.yaml.ejs`. Change field to `module_version: "<%%= version_id %>"`.
	- Copy `FrameworkName.podspec` file created before from root repo folder and rename it to `FrameworkName.podspec.ejs`.
		- Change field to `s.version = '<%%= version_id %>'`.
		- Change field to `s.source = { :git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => '<%%= new_tag %>' }`
	- If framework is Zapp Plugin. Next step should only be used on relevant platforms
		- Copy `ios.json` file created before from root repo folder and rename it to `ios.json.ejs`.
			- Change field to `"manifest_version": "<%%= version_id %>"`
			- Change field to `:git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => '<%%= new_tag %>'"`
		- Copy `tvos.json` file created before from root repo folder and rename it to `ios.json.ejs`.
			- Change field to `"manifest_version": "<%%= version_id %>"`
			- Change field to `"FrameworkName": ":git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => '<%%= new_tag %>'"`
- Open `Readme.md.ejs` file:
	- If Zapp plugin
		- Find plugin type. Example `### Type: Analytics`
		- If type does not exist under section. `## Zapp Plugins` add new type `### Type: New Type`
		- Add new framework title with format `#### Framework readable name: <%%= framework_id %>`.   Where `framework_id` must be a value defined in `FrameworksData.plist`
		- Add description.
		- Add link to generated documentation.
		- Add links to Zapp manifests.
		- Example:
		```swift
	        ### Type: Analytics

            #### Google Analytics: <%%= ZappGoogleAnalytics %>
            - **Description:** Google Analytics provider, deliver passed analytics data to service [Google Analytics](https://analytics.google.com/)
            - [**Documentation**](https://applicaster.github.io/AppleApplicasterFrameworks/ZappGoogleAnalytics/index.html)
            - **Manifest:**
                - [iOS](https://zapp.applicaster.com/admin/plugin_versions?id=zapp_google_analytics&platform=ios)
                - [tvOS](https://zapp.applicaster.com/admin/plugin_versions?id=zapp_google_analytics&platform=tvos)
		```
	- If not Zapp plugin
		- Add new framework under `# Frameworks List` title with format `#### Framework readable name: <%%= framework_id %>`.   Where `framework_id` must be value defined in `FrameworksData.plist`
		- Add description.
		- Add link to generated documentation.
		- Add links to Zapp manifests.
		- Example:
		```swift
	        # Frameworks List

            #### ZappCore: <%%= ZappCore %>
            - **Description:** Contain plugin protocols, helper methods that can be used by any Zapp plugin or framework
            - [**Documentation**](https://applicaster.github.io/AppleApplicasterFrameworks/ZappCore/index.html)
		```
- Push code and create PR. Fill PR template.
- After review merge code.

## :page_with_curl: How to update existing framework

- Create branch `framework_name_update_version_id`
- Update framework code. Based on rules described in [creation new framework](#how-to-add-new-framework)
- Update version of your framework in `frameworksData.plist` based on `major/minor/bug` `1.0.0` convension.
- Push code and create PR. Fill PR template.
- After review merge code.

## :mortar_board: How it works?

- All of the automation scripts are contained inside of the `Scripts` folder
- Automation contains two main scripts.
	- Validate Frameworks: It checks if defined frameworks in `FrameworksData.plist` has all files that needed to support framework. This script is called on each commit. If validation failed CI build will be finished with fail
	- Publish Frameworks: Script checks if framework needs to be published. Previous frameworks data saved in `.versions_automation.json`. It compares new data in `FrameworksData.plist` and  `.versions_automation.json` all diffs in frameworks or not existing will be published. This script is called on `master` branch only. Script is will do the following:
		- Get current date in format `2020.15.0.20-1-6` This string will be used as `git tag`
		- Go throught all templates that are in [ejs](https://ejs.co) format for frameworks that need to be updated. It updates to a new `version number` in `ejs` key `<%%= version_id %>` and `git tag` in `ejs` key` <%%= new_tag %>`.

		** Template List**

		| File name | Description | Zapp plugins only |
        |--------|--------|--------|
        | .jazzy.yaml.ejs |Documentation generator templte|NO|
        | framework_name.podspec.ejs |Cocoapods podspec template|NO|
        | ios.json.ejs |iOS Zapp plugin manifest template|YES|
        | tvos.json.ejs |tvOS Zapp plugin manifest template|YES|

        - Generate documentation for framework and saves it to `docs` folder.
        - Upload manifest to Zapp with [Zappifest](https://github.com/applicaster/zappifest) (Zapp plugins only).
        - Update Frameworks list template `Readme.md.ejs` to update latest availible framework version for documentation.
        - Update file `.versions_automation.json` with latest changes if format `{framework_name:version_id}`
        - Commit, push and create tag git repo
