## react-native-dialog-progress
[![npm](https://img.shields.io/npm/dm/localeval.svg)](https://github.com/cleandersonlobo/react-native-dialog-progress)
[![npm](https://img.shields.io/npm/dt/express.svg)](https://github.com/cleandersonlobo/react-native-dialog-progress)
[![npm](https://img.shields.io/npm/v/npm.svg)](https://npmjs.org/package/react-native-dialog-progress)
[![npm](https://img.shields.io/npm/l/react-native-smart-badge.svg)](https://github.com/cleandersonlobo/react-native-dialog-progress/blob/master/LICENSE)

## Installation 

First you need to install react-native-dialog:

```javascript
$ npm install react-native-dialog-progress --save
```

### Installation (Android)

## React Native Link 

```javascript
$ react-native link react-native-dialog-progress
```

## Manually
```gradle
...
include ':react-native-dialog-progress'
project(':react-native-dialog-progress').projectDir = new File(settingsDir, '../node_modules/react-native-dialog-progress/android')
```
* In `android/app/build.gradle`

```gradle
...
dependencies {
    ...
    compile project(':react-native-dialog-progress')
}
```

* register module (in MainApplication.java)

```java
......
import com.dialogprogress.DialogProgressPackage;  // <--- import

......

@Override
protected List<ReactPackage> getPackages() {
   ......
   new DialogProgressPackage(),            // <------ add here
   ......
}

```
## Usage

## Show DialogProgress

### Example
```javascript
    import DialogProgress from 'react-native-dialog-progress'
    const options = {
        title:"Loading",
        message:"This is a message!",
        isCancelable:true
    }
    DialogProgress.show(options)
```

![](https://raw.githubusercontent.com/cleandersonlobo/react-native-dialog-progress/master/example.gif)

## Options 
 Name | Description | Default/Required | Type
------|-------------|----------|-----------
title | text for the dialog title | undefined | string
message | text for the dialog message | undefined | string
isCancelable | true if the dialog is cancelable, false otherwise | false | bool

## Hide DialogProgress

### Example
```javascript 
    import DialogProgress from 'react-native-dialog-progress'

    DialogProgress.hide()
```

### Thanks

# License
- [MIT](LICENSE)



