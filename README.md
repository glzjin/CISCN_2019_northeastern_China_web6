# CISCN 2019 华东北 Web6

## 题目详情

- **2019 CISCN 2019 华东北 Web6**

## 感谢
- Pdsdt 和 菠萝吹雪 师傅供题和提供帮助，能让我正确复现这个题目。

## 考点

- Redis 弱密码
- Python 反序列化

## 启动

	docker-compose up -d
	open http://127.0.0.1:8083/

## WriteUp & Exp

1. 爆破 redis 密码。
2. 修改 redis 键值，将其设置为序列化之后的值。
3. 访问，RCE，拿到 flag。

exp 文件夹自取。

## 版权

该题目复现环境尚未取得主办方及出题人相关授权，如果侵权，请联系本人删除（ i@zhaoj.in ）
