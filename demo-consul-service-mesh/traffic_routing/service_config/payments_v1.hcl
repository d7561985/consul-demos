service {
  name = "payments"
  id = "payments-v1"
  address = "10.5.0.4"
  port = 9090

  tags      = ["v1"]
  meta      = {
    version = "1"
  }

  check = {
    name = "Check payments health 9090"
    http= "http://10.5.0.4:9090/health"
    method= "GET"
    interval= "10s"
    timeout=  "1s"
  }

  connect { 
    sidecar_service {
      port = 20000
      
      check {
        name = "Connect Envoy Sidecar"
        tcp = "10.5.0.4:20000"
        interval ="10s"
      }
    }  
  }
}
