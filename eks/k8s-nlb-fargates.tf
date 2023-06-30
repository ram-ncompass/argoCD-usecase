# resource "kubernetes_deployment" "echoserver" {
#   metadata {
#     name      = "echoserver"
#     namespace = "default"
#   }

#   spec {
#     replicas = 2

#     selector {
#       match_labels = {
#         app = "echoserver"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "echoserver"
#         }
#       }

#       spec {
#         container {
#           name  = "echoserver"
#           image = "ramkumar58059/node-l2-image:recent"

#           port {
#             container_port = 3002
#           }
#         }
#       }
#     }
#   }

#   depends_on = [ aws_eks_cluster.cluster, helm_release.aws_load_balancer_controller ]
# }

# resource "kubernetes_service" "echoserver" {
#   metadata {
#     name      = "echoserver"
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
#       target_port = "3002"
#     }

#     selector = {
#       app = "echoserver"
#     }

#     type = "LoadBalancer"
#   }
#   depends_on = [ aws_eks_cluster.cluster, helm_release.aws_load_balancer_controller ]
# }

# ##################################################### NGINX #####################################################

# resource "kubernetes_deployment" "nginx" {
#   metadata {
#     name = "nginx"
#   }

#   spec {
#     replicas = 1

#     selector {
#       match_labels = {
#         app = "nginx"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "nginx"
#         }
#       }

#       spec {
#         container {
#           name  = "nginx"
#           image = "nginx"

#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "nginx" {
#   metadata {
#     name = "nginx"
#   }

#   spec {
#     port {
#       port = 80
#     }

#     selector = {
#       app = "nginx"
#     }
#   }
# }