# 个人效率中心 - 安装和使用指南

## 🚀 快速开始

### 方法一：本地服务器模式（推荐）

1. **安装 Node.js**
   - 下载：https://nodejs.org/
   - 选择 LTS 版本，安装时勾选 "Add to PATH"

2. **启动应用**
   ```
   双击「启动应用.bat」
   ```
   浏览器会自动打开 http://localhost:8080/personal-hub.html

3. **登录同步**
   - 点击侧边栏底部的「登录同步数据」
   - 使用 Google 账号登录
   - 数据自动同步到云端

---

### 方法二：Windows 桌面应用

1. **安装依赖**
   ```bash
   npm install
   ```

2. **开发模式运行**
   ```bash
   npm run electron
   ```

3. **打包成 .exe 安装包**
   ```bash
   npm run build:electron
   ```
   安装包在 `dist` 文件夹中

---

### 方法三：手机端

#### iOS（需要 Mac 和开发者账号）
```bash
npm install
npm run build:ios
```
然后用 Xcode 打开 `ios/App` 文件夹，打包成 .ipa

#### Android
```bash
npm install
npm run build:android
```
然后用 Android Studio 打开 `android` 文件夹，打包成 .apk

---

## 📱 PWA 安装（无需打包）

### iPhone 安装方法：
1. 用 Safari 打开网页
2. 点击底部分享按钮
3. 选择「添加到主屏幕」
4. 像原生 App 一样使用

### Android 安装方法：
1. 用 Chrome 打开网页
2. 点击右上角菜单
3. 选择「添加到主屏幕」

---

## 🔧 Firebase 配置

### 当前配置：
```
项目ID: tool-77737
```

### 修改为自己的数据库：

1. **创建 Firebase 项目**
   - 访问 https://console.firebase.google.com/
   - 创建新项目

2. **获取配置信息**
   - 项目设置 → 您的应用 → Web 应用
   - 复制配置信息

3. **修改代码**
   - 打开 `www/personal-hub.html`
   - 找到 `firebaseConfig` 变量
   - 替换为你的配置

4. **启用 Google 登录**
   - Firebase 控制台 → Authentication
   - Sign-in method → Google → 启用

5. **创建 Firestore 数据库**
   - Firebase 控制台 → Firestore Database
   - 创建数据库（测试模式）

6. **设置安全规则**
   ```
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /users/{userId} {
         allow read, write: if request.auth != null && request.auth.uid == userId;
       }
     }
   }
   ```

---

## 📂 项目结构

```
personal-hub-app/
├── www/                    # 网页文件
│   ├── personal-hub.html   # 主应用
│   ├── manifest.json       # PWA 配置
│   └── icon-192.png        # 应用图标
├── electron/               # Electron 配置
│   └── main.js            # 主进程
├── ios/                    # iOS 项目（构建后生成）
├── android/                # Android 项目（构建后生成）
├── package.json           # 项目配置
├── capacitor.config.json  # Capacitor 配置
└── 启动应用.bat            # 一键启动脚本
```

---

## ❓ 常见问题

### Q: 登录失败怎么办？
A: 必须通过 HTTP 服务器访问，不能直接双击打开 HTML 文件。请使用「启动应用.bat」

### Q: 如何备份数据？
A: 设置页面 → 导出数据 → 保存 JSON 文件

### Q: 数据存储在哪里？
A: 
- 本地：浏览器 localStorage
- 云端：Firebase Firestore（登录后）

### Q: 没有网络能用吗？
A: 可以！数据优先存储在本地，网络恢复后自动同步

---

## 📞 技术支持

如有问题，请检查：
1. Node.js 是否正确安装
2. 是否通过 HTTP 服务器访问
3. Firebase 配置是否正确
4. 浏览器控制台是否有错误信息
