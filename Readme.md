# XCUITestExample
> Simple example for displaying iOS automation skills

## How to use

#### 1. Preparation for launch
* Install [Xcode](https://apps.apple.com/ru/app/xcode/id497799835?l=en&mt=12) 
* Install [XCTestHTMLReport](https://github.com/TitouanVanBelle/XCTestHTMLReport)

#### 2. Run tests
```
xcodebuild test clean -scheme XCUITestExampleUITests -derivedDataPath DerivedData/Data -destination 'platform=iOS Simulator,name=iPhone 8,OS=12.1' -resultBundlePath DerivedData/Result
```
#### 3. Report generation 
```
xchtmlreport -r DerivedData/Result
```
