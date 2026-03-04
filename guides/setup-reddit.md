# Reddit 代理配置指南

## 功能说明
Reddit 封锁了大量服务器 IP，直接访问会返回 403。需要 ISP 代理（Residential/ISP Proxy）才能读取完整的 Reddit 帖子和评论。

**注意**：即使没有代理，也可以通过 Exa 搜索找到 Reddit 内容（只需要配 Exa API key）。代理只是用于读取完整帖子+评论。

## Agent 可自动完成的步骤

1. 检查当前状态：
```bash
agent-reach doctor | grep "Reddit"
```

2. 如果用户提供了代理，测试连通性：
```bash
curl -s --proxy "用户提供的代理" \
  -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36" \
  "https://www.reddit.com/r/test.json?limit=1"
```

返回正常 JSON = 代理可用

3. 写入配置：
```python
from agent_reach.config import Config
c = Config()
c.set("reddit_proxy", "用户提供的代理")
```

## 需要用户手动做的步骤

请告诉用户：

> Reddit 在服务器上通常需要代理才能访问（403 问题）。
>
> 推荐住宅代理（Residential Proxy），比数据中心 IP 更稳定。
>
> **推荐**：Webshare.io ($1/月，10GB 流量)
> 1. 打开 https://proxy.webshare.io/proxy/list/download
> 2. 选择 "Username:Password@Host:Port" 格式
> 3. 复制任意一个代理地址给我
>
> 格式示例：`http://用户名:密码@IP:端口`

## Agent 收到代理后的操作

1. 测试代理
2. 写入配置：`config.set("reddit_proxy", proxy)`
3. 运行 `agent-reach doctor` 验证
4. 反馈："✅ Reddit 已配置！现在可以完整读取帖子和评论了。"
