package main

import (
    "net"
    "net/http"
    "net/http/fcgi"
)

// replace with a real http.Handler
type FastCGIServer struct{}

func (s FastCGIServer) ServeHTTP(resp http.ResponseWriter, req *http.Request) {
    resp.Write([]byte("<h1>Hello World</h1>"))
}

func main() {
    listener, _ := net.Listen("tcp", ":9000")
    srv := new(FastCGIServer)
    fcgi.Serve(listener, srv)
}
