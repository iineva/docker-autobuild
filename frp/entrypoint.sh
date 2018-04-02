if [ $MODE == "server" ]; then
    echo running frp server...
    /app/frps
else
    echo running frp client...
    /app/frpc
fi