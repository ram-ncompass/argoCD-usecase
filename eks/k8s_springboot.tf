# resource "kubernetes_deployment" "springboot" {
#   metadata {
#     name      = "springboot"
#     namespace = "default"
#   }

#   spec {
#     replicas = 1

#     selector {
#       match_labels = {
#         app = "springboot"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "springboot"
#         }
#       }

#       spec {
#         container {
#           name  = "springboot"
#           image = "ramkumar58059/himadri-node:1.0.0"
#           env {
#             name = "SQL_HOST"
#             value = "l1-adept.ctqnawjozhfg.ap-southeast-2.rds.amazonaws.com"
#           }
#           env {
#             name = "SQL_USER"
#             value = "admin"
#           }
#           env {
#             name = "SQL_DB"
#             value = "Himadri"
#           }
#           env {
#             name = "SQL_PASS"
#             value = "Adept!1qaz"
#           }
#           port {
#             container_port = 3001
#           }
#         }
#       }
#     }
#   }

#   depends_on = [ aws_eks_cluster.cluster, helm_release.aws_load_balancer_controller ]
# }

# resource "kubernetes_service" "springboot" {
#   metadata {
#     name      = "springboot"
#     namespace = "default"
#     annotations = {
#       "service.beta.kubernetes.io/aws-load-balancer-type" = "external"
#       "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type" = "ip"
#       "service.beta.kubernetes.io/aws-load-balancer-scheme" = "internet-facing"
#     }
#   }

#   spec {
#     port {
#       protocol    = "TCP"
#       port        = 80
#       target_port = "3001"
#     }

#     selector = {
#       app = "springboot"
#     }

#     type = "LoadBalancer"
#   }
#   depends_on = [ aws_eks_cluster.cluster, helm_release.aws_load_balancer_controller ]
# }