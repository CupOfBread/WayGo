# waygo

## 项目简介

waygo 是一个基于 Flutter 的移动应用项目，支持 Android 和 iOS 平台。

## 环境要求

- Flutter SDK（建议使用最新稳定版）
- Dart SDK
- Android Studio 或 Xcode（根据目标平台选择）
- Android/iOS 模拟器或真机

## 安装与运行

1. 克隆本项目：
   ```bash
   git clone <本项目地址>
   cd waygo
   ```
2. 获取依赖包：
   ```bash
   flutter pub get
   ```
3. 运行项目：
   ```bash
   flutter run
   ```

## 打包APK说明

执行以下命令打包安卓APK安装包：
```bash
flutter build apk --release
```
打包完成后，APK 文件位于：
```
build/app/outputs/flutter-apk/app-release.apk
```
如需调试包，可用：
```bash
flutter build apk --debug
```

## 目录结构

```
lib/                # Dart 源码目录
  common/           # 通用工具类
  component/        # 组件
  pages/            # 页面
  route/            # 路由配置
  service/          # 服务类
assets/             # 静态资源
android/            # Android 原生工程
ios/                # iOS 原生工程
pubspec.yaml        # Flutter 配置文件
```

## 相关链接

- [Flutter 官方文档](https://docs.flutter.dev/)
- [Dart 官方文档](https://dart.dev/guides)

如有问题欢迎提 Issue 或交流！
