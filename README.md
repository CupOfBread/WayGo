# 🌟 WayGo - 你的贴心旅行伙伴 ✈️

<div align="center">
  <img src="assets/branding.png" alt="WayGo Logo" width="200"/>

[![Flutter](https://img.shields.io/badge/Flutter-3.19.0-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.3.0-blue.svg)](https://dart.dev/)

*让每一次旅行都充满惊喜和温暖* 💕
</div>

---

## 🎯 项目简介

**WayGo** 是一款专为旅行爱好者打造的智能旅行管理应用！无论是周末短途游还是长途旅行，WayGo都能帮你轻松规划行程、管理行李、记录美好时光
✨

### 🌈 为什么选择 WayGo？

- 🎨 **超可爱的界面设计** - 萌萌哒的UI让你爱不释手
- 📱 **智能行程规划** - 帮你合理安排每一天的行程
- 🧳 **行李清单管理** - 再也不用担心忘带重要物品
- 📍 **足迹记录** - 记录你去过的每一个地方
- 💰 **费用管理** - 轻松掌控旅行预算
- 🎵 **旅行电台** - 为你的旅程增添音乐色彩

---

## ✨ 主要功能

### 🗺️ 智能行程规划

- 📅 创建个性化旅行计划
- 🎯 智能推荐景点和路线
- ⏰ 时间管理和提醒功能
- 🌤️ 天气信息集成

### 🧳 行李清单管理

- 📋 分类管理行李物品
- ✅ 智能打包提醒
- 🎒 行李重量和体积计算
- 🔄 行李清单模板

### 📍 足迹记录

- 🌍 记录访问过的国家和地区
- 🏙️ 城市足迹统计
- 🏛️ 景点打卡功能
- 📊 旅行数据可视化

### 💰 费用管理

- 💳 多账户管理
- 📊 费用分类统计
- 💸 预算控制提醒
- 📈 消费趋势分析

### 🎵 旅行电台

- 🎶 精选旅行音乐
- 🎧 离线音乐下载
- 🎼 个性化推荐
- 🎤 语音播报功能

---

## 🛠️ 技术栈

<div align="center">

| 技术                    | 版本     | 说明      |
|-----------------------|--------|---------|
| **Flutter**           | 3.19.0 | 跨平台UI框架 |
| **Dart**              | 3.3.0  | 编程语言    |
| **GetX**              | 4.6.5  | 状态管理    |
| **SharedPreferences** | 2.2.2  | 本地存储    |
| **json_annotation**   | 4.8.1  | JSON序列化 |
| **build_runner**      | 2.4.7  | 代码生成    |

</div>

---

## 🚀 快速开始

### 📋 环境要求

- Flutter SDK: 3.19.0 或更高版本
- Dart SDK: 3.3.0 或更高版本
- Android Studio / VS Code
- Android SDK / Xcode (用于移动端开发)

### 🔧 安装步骤

1. **克隆项目** 🐑
   ```bash
   git clone https://github.com/your-username/waygo.git
   cd waygo
   ```

2. **安装依赖** 📦
   ```bash
   flutter pub get
   ```

3. **生成代码** ⚙️
   ```bash
   flutter packages pub run build_runner build
   ```

4. **运行应用** 🎉
   ```bash
   flutter run
   ```

### 📱 支持的平台

- ✅ **Android** - API 21+ (Android 5.0+)
- ✅ **iOS** - iOS 12.0+

---

## 📁 项目结构

```
waygo/
├── 📁 lib/
│   ├── 📁 common/           # 通用工具类
│   ├── 📁 component/        # 公共组件
│   ├── 📁 model/           # 数据模型
│   │   ├── 📁 account/     # 账户相关模型
│   │   ├── 📁 travel/      # 旅行相关模型
│   │   └── 📁 user/        # 用户相关模型
│   ├── 📁 pages/           # 页面文件
│   │   ├── 📁 account/     # 账户页面
│   │   ├── 📁 home/        # 首页
│   │   ├── 📁 map/         # 地图页面
│   │   ├── 📁 my/          # 个人中心
│   │   ├── 📁 radio/       # 电台页面
│   │   ├── 📁 root/        # 根页面
│   │   ├── 📁 scenic_spot/ # 景点页面
│   │   ├── 📁 store/       # 商店页面
│   │   └── 📁 travel/      # 旅行页面
│   ├── 📁 route/           # 路由配置
│   ├── 📁 service/         # 服务层
│   └── main.dart           # 应用入口
├── 📁 assets/              # 静态资源
├── 📁 android/             # Android平台配置
├── 📁 ios/                 # iOS平台配置
└── 📁 test/                # 测试文件
```

## 🙏 致谢

感谢所有为这个项目做出贡献的开发者们！你们的每一行代码都让WayGo变得更加美好 💖

### 🌟 特别感谢

- **Flutter团队** - 提供了优秀的跨平台框架
- **GetX团队** - 强大的状态管理解决方案
- **所有贡献者** - 你们的支持是我们前进的动力

---

<div align="center">
  <p>💕 让WayGo陪伴你的每一次旅行 💕</p>
</div>
