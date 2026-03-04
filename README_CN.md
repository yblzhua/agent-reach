# Agent Reach Skill

> 让 Claude Code 拥有互联网访问能力的技能包

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge" alt="MIT License"></a>
  <a href="https://www.python.org/"><img src="https://img.shields.io/badge/Python-3.10+-green.svg?style=for-the-badge&logo=python&logoColor=white" alt="Python 3.10+"></a>
  <a href="https://github.com/yblzhua/agent-reach/stargazers"><img src="https://img.shields.io/github/stars/yblzhua/agent-reach?style=for-the-badge" alt="GitHub Stars"></a>
</p>

<p align="center">
  <a href="https://github.com/yblzhua/agent-reach">项目主页</a> · <a href="README.md">English</a> · <a href="#支持哪些平台">支持平台</a> · <a href="#致谢">致谢</a>
</p>

> **项目来源**：本项目基于 [Agent Reach](https://github.com/Panniantong/agent-reach) 开发

---

## 什么是"Skill"？

**Skill** 就像是 Claude Code 的插件或扩展。它能教会 Claude 之前做不到的事情。

可以这样理解：
- **没有 skill 时**：Claude 只能读取你电脑上的文件
- **有了这个 skill 后**：Claude 可以上网看网页、看视频、搜索 Twitter、读 Reddit，还有更多！

---

## 这个 Skill 能做什么？

这个 skill 让 Claude Code 能够：

| 功能 | 示例 |
|------|------|
| 读取任意网页 | "读一下这篇文章：https://..." |
| 看 YouTube 视频 | "这个视频讲了什么？https://youtube.com/..." |
| 看 B站 视频 | "总结一下这个 B站 视频：https://bilibili.com/..." |
| 搜索网络 | "搜索最好的 Python 教程" |
| 读取 GitHub 项目 | "解释一下这个 GitHub 项目：https://github.com/..." |
| 搜索 Twitter/X | "搜索 Twitter 上关于 AI 的讨论" |
| 读 Reddit | "Reddit 上怎么看 iPhone 16？" |
| 读 RSS 订阅 | "检查这个 RSS 有没有更新" |
| 更多平台... | 小红书、抖音、LinkedIn、微信公众号... |

---

## 安装步骤（一次性设置）

### 第一步：复制这个 Skill

这个 skill 文件夹应该放在以下位置之一：

```
~/.claude/skills/agent-reach/          # 全局安装（推荐）
# 或者
你的项目/.claude/skills/agent-reach/   # 项目内安装
```

**全局安装方法（推荐）：**

```bash
# 创建 skills 目录
mkdir -p ~/.claude/skills

# 复制这个 skill 文件夹到全局 skills 目录
# （把 /path/to/agent-reach 换成实际路径）
cp -r /path/to/agent-reach ~/.claude/skills/
```

### 第二步：安装后端工具

**首先，检查 Python 和 pip 是否已安装：**

```bash
python3 --version
pip --version
```

**如果 pip 未安装，先安装它：**

| 系统 | 命令 |
|------|------|
| Ubuntu/Debian | `sudo apt install -y python3-pip` |
| CentOS/RHEL | `sudo yum install -y python3-pip` |
| macOS | `brew install python3` |
| 通用备选 | `python3 -m ensurepip --upgrade` |

**然后，让 Claude 帮你安装：**

```
请帮我安装 Agent Reach 工具
```

Claude 会自动读取 SKILL.md 文件并指导你完成安装过程。

**或者手动安装：**

```bash
# 进入 skill 目录
cd /path/to/agent-reach

# 运行安装脚本
./install.sh

# 或者手动安装
pip install ./scripts/
agent-reach install --env=auto
```

> **提示：** 如果 `pip` 不工作，试试 `pip3` 或 `python3 -m pip`。

### 第三步：验证安装

让 Claude 检查：

```
检查 Agent Reach 是否正常工作
```

Claude 会运行诊断命令并显示状态。

你会看到类似这样的内容：

```
👁️ Agent Reach 健康检查
============================
✅ Web (Jina Reader)       — 就绪
✅ YouTube (yt-dlp)        — 就绪
✅ GitHub (gh CLI)         — 就绪
✅ Search (Exa)            — 就绪
...
```

---

## 如何使用这个 Skill

### 直接用自然语言告诉 Claude 就行！

安装完成后，直接说你想做什么。**不需要特殊命令！**

#### 示例：

**读取网页：**
```
读一下这篇文章并总结：https://example.com/blog/article
```

**看视频：**
```
这个 YouTube 视频讲了什么？https://www.youtube.com/watch?v=xxxxx
```

**搜索网络：**
```
搜索一下最近关于 ChatGPT 的新闻
```

**读取 GitHub 项目：**
```
这个项目是做什么的？https://github.com/facebook/react
```

**搜索 Twitter：**
```
搜索 Twitter 看看大家对新款 iPhone 怎么看
```

---

## 支持哪些平台？

| 平台 | 状态 | 说明 |
|------|------|------|
| 🌐 任意网站 | ✅ 就绪 | 安装后立即可用 |
| 📺 YouTube | ✅ 就绪 | 安装后立即可用 |
| 📺 B站 | ✅ 就绪 | 安装后立即可用 |
| 📦 GitHub | ✅ 就绪 | 安装后立即可用 |
| 📡 RSS | ✅ 就绪 | 安装后立即可用 |
| 🔍 网络搜索 | ✅ 就绪 | 安装后立即可用 |
| 🐦 Twitter/X | ⚠️ 需配置 | 需要设置 cookie |
| 📖 Reddit | ⚠️ 有限制 | 可能需要代理 |
| 📕 小红书 | ⚠️ 需配置 | 需要 Docker |
| 🎵 抖音 | ⚠️ 需配置 | 需要 Docker |
| 💼 LinkedIn | ⚠️ 需配置 | 需要 Docker |
| 📱 微信公众号 | ⚠️ 需配置 | 需要额外安装包 |

- ✅ **就绪**：安装后直接可用
- ⚠️ **需配置**：让 Claude 帮你配置

---

## 配置高级平台

有些平台需要额外设置。直接告诉 Claude：

```
帮我配置 Twitter 搜索
```

```
帮我设置小红书访问
```

Claude 会读取 `guides/` 文件夹中的设置指南，一步步指导你。

---

## Skill 文件说明

```
agent-reach/
├── SKILL.md              # 主技能指令（Claude 读取这个）
├── README.md             # 英文使用指南
├── README_CN.md          # 中文使用指南（本文件）
└── guides/               # 各平台详细配置指南
    ├── setup-twitter.md
    ├── setup-xiaohongshu.md
    ├── setup-reddit.md
    ├── setup-exa.md
    ├── setup-wechat.md
    └── setup-groq.md
```

---

## 常见问题

### "我让 Claude 读网页但没成功"

1. 让 Claude 检查状态：
   ```
   检查 Agent Reach 是否正常工作
   ```

2. 如果工具缺失，让 Claude 重新安装：
   ```
   请重新安装 Agent Reach 工具
   ```

### "YouTube 显示'登录以确认你不是机器人'"

你的 IP 可能被临时屏蔽了。解决方法：
- 等几个小时
- 使用 VPN
- 让 Claude 配置 YouTube cookie

### "怎么更新这个 skill？"

直接用新版本替换 skill 文件夹即可。

### "我可以在任何电脑上用吗？"

可以！这个 skill 完全可移植。只要：
1. 把 `agent-reach` 文件夹复制到 `~/.claude/skills/`
2. 让 Claude 安装工具

### "我看不到 .claude 文件夹？"

以 `.` 开头的文件夹是隐藏的。
- **Mac/Linux**：在终端运行 `open ~/.claude/skills`
- **或者**：在 Finder 中按 `Cmd + Shift + .` 显示隐藏文件

---

## 快速参考

### 可以对 Claude 说的话

| 说这个 | Claude 会 |
|--------|-----------|
| "读一下这个网页：[链接]" | 读取并总结网页内容 |
| "这个视频讲了什么？[链接]" | 提取并总结视频内容 |
| "帮我搜索[主题]" | 搜索网络并总结结果 |
| "解释一下这个 GitHub 项目：[链接]" | 分析并解释项目内容 |
| "帮我配置[平台名]" | 指导你完成平台设置 |
| "检查 Agent Reach 状态" | 运行诊断并显示什么可用 |

---

## 总结

1. **复制** 这个 skill 到 `~/.claude/skills/agent-reach/`
2. **让 Claude** 安装后端工具
3. **使用** 直接让 Claude 做事情就行！

**就这样！** 现在 Claude 可以为你访问互联网了。

---

## 致谢

本项目基于以下开源项目开发：

- **[Agent Reach](https://github.com/Panniantong/agent-reach)** - Panniantong - 给 AI Agent 一键装上互联网能力
- [Jina Reader](https://github.com/jina-ai/reader) - 网页读取
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - 视频字幕提取
- [xreach](https://www.npmjs.com/package/xreach-cli) - Twitter 访问
- [Exa](https://exa.ai) - 网络搜索
- [mcporter](https://github.com/steipete/mcporter) - MCP 工具集成
- [feedparser](https://github.com/kurtmckee/feedparser) - RSS 解析

特别感谢 **Panniantong** 开发的 [Agent Reach](https://github.com/Panniantong/agent-reach) 项目，为 Claude Code 提供了强大的互联网访问能力。

---

## License

[MIT](LICENSE)
