
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

# NB. lost my config changes for some of these, so I had to recover from state


# resource "kubernetes_deployment" "influxdb" {
#   provider         = kubernetes.mk8s
#   wait_for_rollout = true

#   metadata {
#     labels = {
#       "managed" = "terraform"
#     }
#     name      = "influxdb"
#     namespace = "mgmt"
#   }

#   spec {
#     min_ready_seconds         = 0
#     paused                    = false
#     progress_deadline_seconds = 600
#     replicas                  = "1"
#     revision_history_limit    = 10

#     selector {
#       match_labels = {
#         "app" = "influxdb"
#       }
#     }

#     strategy {
#       type = "RollingUpdate"

#       rolling_update {
#         max_surge       = "25%"
#         max_unavailable = "25%"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           "app" = "influxdb"
#         }
#       }

#       spec {
#         automount_service_account_token  = true
#         dns_policy                       = "ClusterFirst"
#         enable_service_links             = true
#         host_ipc                         = false
#         host_network                     = false
#         host_pid                         = false
#         node_selector                    = {}
#         restart_policy                   = "Always"
#         share_process_namespace          = false
#         termination_grace_period_seconds = 30

#         container {
#           args                       = []
#           command                    = []
#           image                      = "influxdb"
#           image_pull_policy          = "Always"
#           name                       = "influxdb"
#           stdin                      = false
#           stdin_once                 = false
#           termination_message_path   = "/dev/termination-log"
#           termination_message_policy = "File"
#           tty                        = false

#           port {
#             container_port = 8086
#             host_port      = 0
#             protocol       = "TCP"
#           }

#           resources {}

#           volume_mount {
#             mount_path        = "/var/lib/influxdb2"
#             mount_propagation = "None"
#             name              = "influxdb-data"
#             read_only         = false
#           }
#         }

#         volume {
#           name = "influxdb-data"

#           persistent_volume_claim {
#             claim_name = "influxdb-data"
#             read_only  = false
#           }
#         }
#       }
#     }
#   }
# }

# # kubernetes_persistent_volume.influxdb-data will be destroyed
# resource "kubernetes_persistent_volume" "influxdb-data" {
#   provider = kubernetes.mk8s
#   metadata {
#     name = "influxdb-data"
#   }

#   spec {
#     access_modes = [
#       "ReadWriteMany",
#     ]
#     capacity = {
#       "storage" = "50Gi"
#     }
#     mount_options                    = []
#     persistent_volume_reclaim_policy = "Retain"
#     volume_mode                      = "Filesystem"

#     persistent_volume_source {

#       # NB. this doesn't actually seem to work yet
#       # something about iscsi access from k8s host
#       iscsi {
#         iqn             = "iqn.2005-10.org.freenas.ctl:influxdb"
#         iscsi_interface = "default"
#         lun             = 0
#         read_only       = false
#         target_portal   = "192.168.11.126"
#       }
#     }
#   }
# }

# # kubernetes_persistent_volume_claim.influxdb-data will be destroyed
# resource "kubernetes_persistent_volume_claim" "influxdb-data" {
#   provider         = kubernetes.mk8s
#   wait_until_bound = true

#   metadata {
#     name      = "influxdb-data"
#     namespace = "mgmt"
#   }

#   spec {
#     access_modes = [
#       "ReadWriteMany",
#     ]
#     volume_name = "influxdb-data"

#     resources {
#       limits = {}
#       requests = {
#         "storage" = "50Gi"
#       }
#     }
#   }
# }

# # kubernetes_service.influxdb will be destroyed
# resource "kubernetes_service" "influxdb" {
#   provider               = kubernetes.mk8s
#   wait_for_load_balancer = true

#   metadata {
#     name      = "influxdb"
#     namespace = "mgmt"
#   }

#   spec {
#     cluster_ip                  = "10.105.175.49"
#     external_ips                = []
#     external_traffic_policy     = "Cluster"
#     health_check_node_port      = 0
#     load_balancer_source_ranges = []
#     publish_not_ready_addresses = false
#     selector = {
#       "app" = "influxdb"
#     }
#     session_affinity = "None"
#     type             = "NodePort"

#     port {
#       node_port   = 30086
#       port        = 8086
#       protocol    = "TCP"
#       target_port = "8086"
#     }
#   }
# }
