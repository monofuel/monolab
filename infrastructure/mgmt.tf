
# TODO make a template for all this stuff

resource "kubernetes_namespace" "mgmt" {
  provider = kubernetes.mk8s
  metadata {
    name = "mgmt"
  }
}

resource "kubernetes_deployment" "home-assistant" {
  provider = kubernetes.mk8s
  metadata {
    name      = "home-assistant"
    namespace = kubernetes_namespace.mgmt.metadata.0.name
    labels = {
      managed = "terraform"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "home-assistant"
      }
    }

    template {
      metadata {
        labels = {
          app = "home-assistant"
        }
      }
      spec {
        container {
          image = "homeassistant/home-assistant"
          name  = "home-assistant"

          port {
            container_port = 8123
          }
          volume_mount {
            mount_path = "/config"
            name       = "home-assistant-config"
          }

          #   resources {
          #     limits = {
          #       cpu    = "0.5"
          #       memory = "512Mi"
          #     }
          #     requests = {
          #       cpu    = "250m"
          #       memory = "50Mi"
          #     }
          #   }

          #   liveness_probe {
          #     http_get {
          #       path = "/nginx_status"
          #       port = 80

          #       http_header {
          #         name  = "X-Custom-Header"
          #         value = "Awesome"
          #       }
          #     }

          #     initial_delay_seconds = 3
          #     period_seconds        = 3
          #   }
        }
        volume {
          name = "home-assistant-config"
          persistent_volume_claim {
            claim_name = "home-assistant-config"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "home-assistant" {
  provider = kubernetes.mk8s
  metadata {
    name      = "home-assistant"
    namespace = kubernetes_namespace.mgmt.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.home-assistant.spec.0.template.0.metadata.0.labels.app
    }
    type = "NodePort"
    port {
      node_port   = 30123
      port        = 8123
      target_port = 8123
    }
  }
}

resource "kubernetes_persistent_volume" "home-assistant-config" {
  provider = kubernetes.mk8s
  metadata {
    name = "home-assistant-config"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      nfs {
        path   = "/mnt/Crystarium/home/homeAssistant/config/"
        server = "192.168.11.126"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "home-assistant-config" {
  provider = kubernetes.mk8s
  metadata {
    name      = "home-assistant-config"
    namespace = kubernetes_namespace.mgmt.metadata.0.name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    #storage_class_name = kubernetes_storage_class.nfs.metadata[0].name
    volume_name = kubernetes_persistent_volume.home-assistant-config.metadata[0].name
    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}
