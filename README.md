# stash-coach-challenge
Challenge project for Stash.

### Features
- Matches designs for a "Coach" feature using a VIPER architecture. 
- There are `DataService`s that allow remote and local fetching of data into the VIPER architecture. The remote service was built out, but the local service (Core Data) was left for future development for the sake of time and brevity.
- The app uses a compiler flag to check if the build is in `DEBUG` or not, and if it is then it reads from a local JSON file. Otherwise it will make a network request. A build configuration was created to match `release` to allow testing of the remote fetching. It can be changed in `Edit Scheme` -> `Test` -> `Build Configuration` -> `Release Test`
- The UI was built to most closely match the provided designs, including colors and fonts. Fonts were unknown and estimated.
- It was built without the use of Storyboards, and is code based layout.
- The UI is split into individual views and then composed together.
- Background images are being downloaded from a URL for the cells.
- A starter page was built to allow navigation. There is a back capability that will show the starter page, but the starter page will immediately push the Coach back onto the navigation stack. The starter module was also built with VIPER architecture.
- The `NavigationController` was customized to most closely match designs.
- A `Constants` struct exists to provide colors and other constants that are app-wide values.
- A `IDETemplatMacros` file was added to control the standard file headers displayed on the top of new files.

### Testing
Tests were built with a (mostly) TDD strategy. The majority of the tests are for the interactor and presenter, with some covering the remote data service and URL service. All unit tests were run during the final merge from `develop` into `main`. Integration tests were left for future development for sake of time and brevity. Mocks were created to control input and output from the class being tested. The JSON data input into the tests can be controlled, as well as triggering certain failures.

### Git strategy
This project was built using a GitFlow strategy. There is a  `main`, `develop`, `feature/`, and `fix/` branches. `feature/` branches contain individual features that, once completed, are merged into `develop`. `develop` then gathers all the features, tests the build for the release, and is merged into `main`. `fix/` branches contain bug fixes and cleanup and are then merged into `develop`.


#### Thank you
I truly appreciate being considered by your company. I appreciate the time given to evaluate my demo project. I am available for any and all questions, comments, and criticisms at `CSarcona8@gmail.com`. Have a wonderful day! :)
