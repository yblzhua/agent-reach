# 小红书配置指南

## 功能说明
读取和搜索小红书笔记。通过 [xiaohongshu-mcp](https://github.com/xpzouying/xiaohongshu-mcp) 实现（⭐9k+，Go 语言，Docker 部署）

## Agent 可自动完成的步骤

1. 检查 Docker 是否安装：
```bash
docker --version
```

2. 启动小红书 MCP 服务：
```bash
docker run -d \
  --name xiaohongshu-mcp \
  -p 18060:18060 \
  xpzouying/xiaohongshu-mcp
```

3. 配置 mcporter：
```bash
mcporter config add xiaohongshu http://localhost:18060/mcp
```

4. 验证：
```bash
mcporter call 'xiaohongshu.search_feeds(keyword: "test")'
```

## 需要用户手动做的步骤

> ⚠️ **重要提醒：** 小红书有封号风险，请务必使用**专用小号**，不要用主账号！

### Cookie 获取（Cookie-Editor 方式）

1. 安装 [Cookie-Editor](https://chromewebstore.google.com/detail/cookie-editor/hlkenndednhfkekhgcdicdfddnkalmdm) Chrome 扩展
2. 登录小红书网页版（xiaohongshu.com）
3. 点击 Cookie-Editor 图标 → Export → 复制 Header String
4. 发给 Agent

### Cookie 配置

收到用户发的 Cookie 后：

```bash
# 设置环境变量（Docker 容器会读取）
export XHS_COOKIE="用户发的cookie"
```

或者重新启动 Docker 容器时传入：

```bash
docker run -d \
  --name xiaohongshu-mcp \
  -p 18060:18060 \
  -e XHS_COOKIE="用户发的cookie" \
  xpzouying/xiaohongshu-mcp
```

## 常见问题

**Q: Docker 镜像不支持 ARM64 / Apple Silicon？**

A: 上游镜像暂无 ARM64 版本，两种解决办法：

方法一：使用 Rosetta 模拟运行（推荐，最简单）
```bash
docker run -d \
  --name xiaohongshu-mcp \
  -p 18060:18060 \
  --platform linux/amd64 \
  xpzouying/xiaohongshu-mcp
```

方法二：从源码编译原生 ARM64 版本
```bash
git clone https://github.com/xpzouying/xiaohongshu-mcp
cd xiaohongshu-mcp
docker build -t xiaohongshu-mcp .
docker run -d --name xiaohongshu-mcp -p 18060:18060 xiaohongshu-mcp
```

**Q: 我不想用 Docker？**

A: 可以从源码编译：https://github.com/xpzouying/xiaohongshu-mcp
