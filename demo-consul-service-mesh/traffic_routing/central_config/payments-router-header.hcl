kind = "service-router"
name = "payments"
routes = [
  {
    match {
      http {
        path_prefix = "/currency"
        header = [
          {
            name  = "x-v2-beta"
            exact = "true"
          },
        ]
      }
    }

    destination {
      service = "currency"
    }
  },
  {
    match {
      http {
        path_prefix = "/xxx"
      }
    }

    destination {
      service = "payments"
    }
  }
]
