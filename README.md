# HeadscaleR
A ruby library/implementation of the headscale grpc api.
It contains a rudimentary implementation of the headscale-cli to show how to use the api. It's not 
intendend to replace the original cli, thus it's not fully tested and might not support all functions 
because of missing options.

# How-To
## Connection settings
To make headscaler connect to your headscaler grpc interface it needs the url and the apikey.
Those parameters can be set via the headscale environment variables HEADSCALE_CLI_ADDRESS and HEADSCALE_CLI_API_KEY.
They work similar like the environment variables used by the original headscale-cli.

When using the ruby headscale.rb programm they can be set via command parameters which will overwrite
the environment variables.

# Build gRPC
```bash
gem install grpc
gem install grpc-tools

cd /tmp/

git clone https://github.com/juanfont/headscale.git
git clone https://github.com/googleapis/googleapis.git
# create the output directory
mkdir grpc_lib
grpc_tools_ruby_protoc -I /tmp/headscale/proto/ -I /tmp/googleapis/ --ruby_out=grpc_lib --grpc_out=grpc_lib /tmp/headscale/proto/headscale/v1/*
```

## Result
```bash
$ tree grpc_lib 
grpc_lib
└── headscale
    └── v1
        ├── apikey_pb.rb
        ├── device_pb.rb
        ├── headscale_pb.rb
        ├── headscale_services_pb.rb
        ├── node_pb.rb
        ├── policy_pb.rb
        ├── preauthkey_pb.rb
        └── user_pb.rb

3 directories, 8 files
```

 now copy the headscale directory into the proto-lib folder.