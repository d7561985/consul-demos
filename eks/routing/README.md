# EKS Routing

Check if EKS Consul cluster was properly installed.

install
```bash
kubectl apply -f ./manifests
```

Check if everything is OK
```bash
kubectl exec -it  deployment/web -c web  -- /bin/sh -c "apk add curl;curl http://127.0.0.1:9090"
```

yoy should get something like:

```bash
OK: 7 MiB in 18 packages
{
  "name": "web",
  "uri": "/",
  "type": "HTTP",
  "start_time": "2023-07-16T11:39:58.300851",
  "end_time": "2023-07-16T11:39:58.305391",
  "duration": "4.54ms",
  "body": "Hello World",
  "upstream_calls": [
    {
      "name": "payments-v1",
      "uri": "http://127.0.0.1:9091",
      "type": "HTTP",
      "start_time": "2023-07-16T11:39:58.302557",
      "end_time": "2023-07-16T11:39:58.304674",
      "duration": "2.1166ms",
      "body": "PAYMENTS V1",
      "upstream_calls": [
        {
          "name": "currency-v1",
          "uri": "http://127.0.0.1:9091",
          "type": "HTTP",
          "start_time": "2023-07-16T11:39:58.303806",
          "end_time": "2023-07-16T11:39:58.303967",
          "duration": "160.551µs",
          "body": "2 USD for 1 GBP",
          "code": 200
        }
      ],
      "code": 200
    }
  ],
  "code": 200
}
```