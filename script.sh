aptos move init --name lesson1

# 生成账户，保存在 .aptos/config.yaml 文件中
aptos init

# clain from faucet
aptos account fund-with-faucet --account default

# compile
aptos move compile --named-address hello_blockchain=default

# test
aptos move test --named-address hello_blockchain=default

# publish
aptos move publish --named-address hello_blockchain=default

# 通过命令行的方式交互
aptos move run --function-id 'default::message::set_message' --args 'string:hello, blockchain'