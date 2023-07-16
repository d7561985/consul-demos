kind = "service-splitter",
name = "payments"

splits = [
  {
    weight = 90,
    service_subset = "v1"
  },
  {
    weight = 10,
    service_subset = "v2"
  }
]
