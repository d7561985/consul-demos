service {
  name = "web"
  id = "web-v1"
  address = "10.5.0.3"
  port = 9090

  check = {
    name = "Check web health 9090"
    http= "http://10.5.0.3:9090/health"
    method= "GET"
    interval= "10s"
    timeout=  "1s"
  }

  connect { 
    sidecar_service {
      port = 20000
      
      check {
        name = "Connect Envoy Sidecar"
        tcp = "10.5.0.3:20000"
        interval ="10s"
      }

      proxy {
        upstreams {
          destination_name = "payments"
          local_bind_address = "127.0.0.1"
          local_bind_port = 9091
        }
      }
    }  
  }
}
