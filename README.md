# Agent Reach Skill

> A Claude Code skill that gives your AI assistant internet access capabilities

<p align="center">
  <a href="https://github.com/Panniantong/agent-reach/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge" alt="MIT License"></a>
  <a href="https://www.python.org/"><img src="https://img.shields.io/badge/Python-3.10+-green.svg?style=for-the-badge&logo=python&logoColor=white" alt="Python 3.10+"></a>
  <a href="https://github.com/Panniantong/agent-reach/stargazers"><img src="https://img.shields.io/github/stars/Panniantong/agent-reach?style=for-the-badge" alt="GitHub Stars"></a>
</p>

<p align="center">
  <a href="https://github.com/Panniantong/agent-reach">Project Home</a> · <a href="README_CN.md">中文</a> · <a href="https://github.com/Panniantong/agent-reach#支持的平台">Platforms</a> · <a href="https://github.com/Panniantong/agent-reach#设计理念">Philosophy</a>
</p>

> **Project Source**: This project is based on [Agent Reach](https://github.com/Panniantong/agent-reach)

---

## What is a "Skill"?

A **skill** is like a plugin or extension for Claude Code. It teaches Claude how to do things it couldn't do before.

Think of it this way:
- **Without skills**: Claude can only read files on your computer
- **With this skill**: Claude can browse the web, watch videos, search Twitter, read Reddit, and much more!

---

## What Does This Skill Do?

This skill enables Claude Code to:

| Capability | Example |
|------------|---------|
| Read any webpage | "Read this article: https://..." |
| Watch YouTube videos | "What's this video about? https://youtube.com/..." |
| Watch Bilibili videos | "Summarize this B站 video: https://bilibili.com/..." |
| Search the web | "Search for best Python tutorials" |
| Read GitHub repos | "Explain this GitHub project: https://github.com/..." |
| Search Twitter/X | "Search Twitter for discussions about AI" |
| Read Reddit | "What's Reddit saying about iPhone 16?" |
| Read RSS feeds | "Check this RSS feed for updates" |
| And more platforms... | XiaoHongShu, Douyin, LinkedIn, WeChat... |

---

## Installation (One-Time Setup)

### Step 1: Copy This Skill

This skill folder should be in one of these locations:

```
~/.claude/skills/agent-reach/          # Global (recommended)
# OR
your-project/.claude/skills/agent-reach/  # Project-specific
```

**How to install globally (recommended):**

```bash
# Create the skills directory
mkdir -p ~/.claude/skills

# Copy this skill folder to the global skills directory
# (Replace /path/to/agent-reach with the actual path)
cp -r /path/to/agent-reach ~/.claude/skills/
```

### Step 2: Install the Backend Tools

**First, check if Python and pip are installed:**

```bash
python3 --version
pip --version
```

**If pip is missing, install it first:**

| System | Command |
|--------|---------|
| Ubuntu/Debian | `sudo apt install -y python3-pip` |
| CentOS/RHEL | `sudo yum install -y python3-pip` |
| macOS | `brew install python3` |
| Any (fallback) | `python3 -m ensurepip --upgrade` |

**Then, ask Claude to install:**

```
Please help me install Agent Reach tools
```

Claude will read the SKILL.md file and guide you through the installation process automatically.

**Or install manually:**

```bash
# Navigate to the skill directory
cd /path/to/agent-reach

# Run the installer
./install.sh

# Or install manually
pip install ./scripts/
agent-reach install --env=auto
```

> **Tip:** If `pip` doesn't work, try `pip3` or `python3 -m pip` instead.

### Step 3: Verify Installation

Ask Claude:

```
Check if Agent Reach is working
```

Claude will run the diagnostic command and show you the status.

You should see something like:

```
👁️ Agent Reach Health Check
============================
✅ Web (Jina Reader)       — Ready
✅ YouTube (yt-dlp)        — Ready
✅ GitHub (gh CLI)         — Ready
✅ Search (Exa)            — Ready
...
```

---

## How to Use This Skill

### Just Ask Claude Naturally!

After installation, simply tell Claude what you want. **No special commands needed!**

#### Examples:

**Read a webpage:**
```
Read this article and summarize it: https://example.com/blog/article
```

**Watch a video:**
```
What does this YouTube video explain? https://www.youtube.com/watch?v=xxxxx
```

**Search the web:**
```
Search for recent news about ChatGPT
```

**Read a GitHub repo:**
```
What is this project about? https://github.com/facebook/react
```

**Search Twitter:**
```
Search Twitter to see what people think about the new iPhone
```

---

## What Platforms Are Supported?

| Platform | Status | Notes |
|----------|--------|-------|
| 🌐 Any Website | ✅ Ready | Works immediately |
| 📺 YouTube | ✅ Ready | Works immediately |
| 📺 Bilibili | ✅ Ready | Works immediately |
| 📦 GitHub | ✅ Ready | Works immediately |
| 📡 RSS | ✅ Ready | Works immediately |
| 🔍 Web Search | ✅ Ready | Works immediately |
| 🐦 Twitter/X | ⚠️ Config needed | Needs cookie setup |
| 📖 Reddit | ⚠️ Limited | May need proxy |
| 📕 XiaoHongShu | ⚠️ Config needed | Needs Docker setup |
| 🎵 Douyin | ⚠️ Config needed | Needs Docker setup |
| 💼 LinkedIn | ⚠️ Config needed | Needs Docker setup |
| 📱 WeChat | ⚠️ Config needed | Needs extra packages |

- ✅ **Ready**: Works right after installation
- ⚠️ **Config needed**: Ask Claude to help configure

---

## Configuring Advanced Platforms

Some platforms need extra setup. Just ask Claude:

```
Help me configure Twitter search
```

```
Help me set up XiaoHongShu access
```

Claude will read the setup guides in the `guides/` folder and guide you through the process.

---

## Skill Files Explained

```
agent-reach/
├── SKILL.md              # Main skill instructions (Claude reads this)
├── README.md             # This file - English guide for humans
├── README_CN.md          # Chinese guide for humans
└── guides/               # Platform-specific setup guides
    ├── setup-twitter.md
    ├── setup-xiaohongshu.md
    ├── setup-reddit.md
    ├── setup-exa.md
    ├── setup-wechat.md
    └── setup-groq.md
```

---

## Troubleshooting

### "I asked Claude to read a webpage but it didn't work"

1. Ask Claude to check the status:
   ```
   Check if Agent Reach is working
   ```

2. If tools are missing, ask Claude to reinstall:
   ```
   Please reinstall Agent Reach tools
   ```

### "YouTube shows 'Sign in to confirm you're not a bot'"

Your IP might be temporarily blocked. Solutions:
- Wait a few hours
- Use a VPN
- Ask Claude to configure YouTube cookies

### "How do I update this skill?"

Just replace the skill folder with the new version.

### "Can I use this on any computer?"

Yes! This skill is fully portable. Just:
1. Copy the `agent-reach` folder to `~/.claude/skills/`
2. Ask Claude to install the tools

### "I can't see the .claude folder?"

Folders starting with `.` are hidden.
- **Mac/Linux**: Run `open ~/.claude/skills` in terminal
- **Or**: Press `Cmd + Shift + .` in Finder to show hidden files

---

## Quick Reference

### Things You Can Say to Claude

| Say This | Claude Will |
|----------|-------------|
| "Read this page: [URL]" | Read and summarize the webpage |
| "What's this video about? [URL]" | Extract and summarize video content |
| "Search for [topic]" | Search the web and summarize results |
| "Explain this GitHub repo: [URL]" | Analyze and explain the repository |
| "Help me configure [platform]" | Guide you through platform setup |
| "Check Agent Reach status" | Run diagnostic and show what's working |

---

## Summary

1. **Copy** this skill to `~/.claude/skills/agent-reach/`
2. **Ask Claude** to install the backend tools
3. **Use** by simply asking Claude to do things!

**That's it!** Now Claude can access the internet for you.

---

## Acknowledgments

This project is built upon the following open-source projects:

- **[Agent Reach](https://github.com/Panniantong/agent-reach)** by Panniantong - Give your AI Agent one-click internet capabilities
- [Jina Reader](https://github.com/jina-ai/reader) - Web page reading
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - Video subtitle extraction
- [xreach](https://www.npmjs.com/package/xreach-cli) - Twitter access
- [Exa](https://exa.ai) - Web search
- [mcporter](https://github.com/steipete/mcporter) - MCP tool integration
- [feedparser](https://github.com/kurtmckee/feedparser) - RSS parsing

Special thanks to **Panniantong** for developing the [Agent Reach](https://github.com/Panniantong/agent-reach) project, providing powerful internet access capabilities for Claude Code.

---

## License

[MIT](LICENSE)
