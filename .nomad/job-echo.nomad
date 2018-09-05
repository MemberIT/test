job "echo" {
  region = "ru-msk"

  datacenters = [ "dataline" ]

  type = "service"

  update {
    stagger      = "1s"
    max_parallel = 1
  }

  group "webs" {
    count = 3

    task "frontend" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        args = [
          "-text", "hello world",
          "-listen", ":80",
        ]
      }

      resources {
        cpu    = 500 # MHz
        memory = 64 # MB

        network {
          mbits = 100

          port "http" {
            static = 80
          }
        }
      }
    }
  }
}
