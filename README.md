# Town square

## How to run the project

    1. First would be to clone this project into your device and open up the project with your preferred code editor/IDE such us vscode,xcode and android studio.
    2. Make sure you already installed the flutter SDK to your device
    3. After all the above step is done, in the terminal head to directory that have a file named pubspec.yaml then run the command `flutter pub get` (if you are using vscode you can open the pubspec.yaml file and then simply press the 'get package' button on the upper right corner menu that looks like a download button) this are used for making sure that all libraries needed are installed
    4. Choose/open the platform where you want to run the project, if you want to run it on android device you can run it on your own device or android emulator, same with iOS but you can only run iphone emulator through xcode. (make sure you have download and install the emulator or have a device that can run this project, for android device you need to enable usb debugging in the setting first)
    5. run the project using this command in the terminal `flutter run` (for vscode you can open the main.dart file and click the run button on the main function or press the run button on the top right corner menu)
    6. wait until the apps open

## Assumptions
    My first assumption was the theme mode,i improvise it by making floating action button for changing the theme mode becuase there aren't any button or swithch in the given figma design.

    Second assuption is attribute for activity itself, based on the design i think it's too complex to implement the business logic in short time, because the activity have many conditions like intensity,category, ages, per hour activity, time, duration and drop-in time, and also i can't find the color system for the category (except childcare and workspace), so because of that i the design for the activity card look incomplete.

## What i would improve with more time
    - First i would like to improve the scrollview for the app because currently the list of activity have its own scrolling function
    - Second would be adding a better animation for the filtering function.
    - Third i want to improve the activity of timeline feature. 
    - Last i want to improve the filtering function for the activity feature.
