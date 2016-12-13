```
      _ _________  _      _                  _  __          _                         _ 
     | |__  /  _ \(_) ___| |_ _   _ _ __ ___| |/ /___ _   _| |__   ___   __ _ _ __ __| |
  _  | | / /| |_) | |/ __| __| | | | '__/ _ \ ' // _ \ | | | '_ \ / _ \ / _` | '__/ _` |
 | |_| |/ /_|  __/| | (__| |_| |_| | | |  __/ . \  __/ |_| | |_) | (_) | (_| | | | (_| |
  \___//____|_|   |_|\___|\__|\__,_|_|  \___|_|\_\___|\__, |_.__/ \___/ \__,_|_|  \__,_|
                                                      |___/                             
```


# JZPictureKeyboard

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](myGithub)&nbsp;
[![platform](https://img.shields.io/badge/platform-ios-lightgray.svg?style=flat)][myGithub]&nbsp;


## Introduction


JZPictureKeyboard is a custom keyboard with a background image.

![](https://raw.githubusercontent.com/RoyalMjz/JZPictureKeyboard/master/Screenshots/Screenshots.png)

## Usage


1. 将JZPictureKeyboard文件夹导入到项目中

2. 在要用到的视图引入头文件`#import "JZPictureKeyboard.h"`

3. 在viewDidLoad中

```
//初始化数字键盘
JZPictureKeyboard *keyBoard = [[JZPictureKeyboard alloc] initWithTitleColor:nil backGroundImage:[UIImage imageNamed:@"keyboardImage"]];
//输入视图textfield&textView
[keyBoard setInputView:textField];
//添加到主视图中
[self.view addSubview:textField];

```


## LICENSE

JZPictureKeyboard is licensed under the MIT Open Source license. For more information, please see the [LICENSE](https://raw.githubusercontent.com/RoyalMjz/JZPictureKeyboard/master/LICENSE) file in this repository.


[myGithub]: https://github.com/RoyalMjz/JZPictureKeyboard
