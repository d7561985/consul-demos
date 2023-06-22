service {
  name = "currency"
  id = "currency-v1"
  address = "10.5.0.5"
  port = 9090

  check = {
    name = "Check currency health 9090"
    http= "http://10.5.0.5:9090/health"
    method= "GET"
    interval= "10s"
    timeout=  "1s"
  }

  connect { 
    sidecar_service {
      port = 20000
      
      check {
        name = "Connect Envoy Sidecar"
        tcp = "10.5.0.5:20000"
        interval ="10s"
      }
    }  
  }
}
