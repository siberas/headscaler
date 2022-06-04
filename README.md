# HeadscaleR
A ruby library/implementation of the headscale grpc api.
It contains a rudimentary implementation of the headscale-cli to show how to use the api. It's not 
intendend to replace the original cli, thus it's not fully tested and might not support all functions 
because of missing options.

# How-To
## Connection settings
To make headscaler connect to your headscaler grpc interface it needs the url and the apikey.
Those parameters can be set via the headscale environment variables HEADSCALE_CLI_ADDRESS and HEADSCALE_CLI_API_KEY.
They work similar the the environment variables used by the original headscale-cli.

When using the ruby headscale.rb programm they can be set via command parameters which will overwrite
the environment variables.



 