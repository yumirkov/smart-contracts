job "cancel-distribution-stage" {
  datacenters = ["ator-fin"]
  type = "batch"

  reschedule {
    attempts = 0
  }

  task "cancel-distribution-stage-task" {
    driver = "docker"

        config {
      network_mode = "host"
      image = "ghcr.io/ator-development/smart-contracts:0.2.3"
      entrypoint = ["npx"]
      command = "ts-node"
      args = ["scripts/distribution/cancel-distribution.ts"]
    }

    vault {
      policies = ["distribution-stage"]
    }

    template {
      data = <<EOH
      {{with secret "kv/distribution/stage"}}
        DISTRIBUTION_OWNER_KEY="{{.Data.data.DISTRIBUTION_OWNER_KEY}}"
        CONSUL_TOKEN="{{.Data.data.CONSUL_TOKEN}}"
      {{end}}
      EOH
      destination = "secrets/file.env"
      env         = true
    }

    env {
      PHASE="stage"
      CONSUL_IP="127.0.0.1"
      CONSUL_PORT="8500"
      DISTRIBUTION_ADDRESS_CONSUL_KEY="smart-contracts/stage/distribution-address"
      DISTRIBUTION_TIMESTAMP=""
    }

    restart {
      attempts = 0
      mode = "fail"
    }

    resources {
      cpu = 4096
      memory = 4096
    }
  }
}
