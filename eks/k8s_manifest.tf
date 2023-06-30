# resource "kubernetes_manifest" "deployment_node_l2_single" {
#   manifest = {
#     "apiVersion" = "apps/v1"
#     "kind" = "Deployment"
#     "metadata" = {
#       "name" = "node-l2-single"
#       "namespace" = "default"
#     }
#     "spec" = {
#       "replicas" = 1
#       "selector" = {
#         "matchLabels" = {
#           "app" = "node-l2-single"
#         }
#       }
#       "template" = {
#         "metadata" = {
#           "labels" = {
#             "app" = "node-l2-single"
#           }
#         }
#         "spec" = {
#           "containers" = [
#             {
#               "image" = "ramkumar58059/node-l2-image:latest"
#               "name" = "node-l2"
#               "ports" = [
#                 {
#                   "containerPort" = 3002
#                 },
#               ]
#               "resources" = {
#                 "limits" = {
#                   "cpu" = "256m"
#                   "memory" = "128Mi"
#                 }
#               }
#             },
#             {
#               "image" = "nginx"
#               "name" = "nginx"
#               "ports" = [
#                 {
#                   "containerPort" = 80
#                 },
#               ]
#               "resources" = {
#                 "limits" = {
#                   "cpu" = "256m"
#                   "memory" = "128Mi"
#                 }
#               }
#             },
#           ]
#         }
#       }
#     }
#   }
#   depends_on = [ aws_eks_cluster.cluster ]
# }

# resource "kubernetes_manifest" "service_node_l2_single" {
#   manifest = {
#     "apiVersion" = "v1"
#     "kind" = "Service"
#     "metadata" = {
#       "annotations" = {
#         "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
#       }
#       "name" = "node-l2-single"
#       "namespace" = "default"
#     }
#     "spec" = {
#       "ports" = [
#         {
#           "port" = 3002
#           "targetPort" = 3002
#         },
#       ]
#       "selector" = {
#         "app" = "node-l2-single"
#       }
#       "type" = "LoadBalancer"
#     }
#   }
# }

# resource "kubernetes_manifest" "service_nginx" {
#   manifest = {
#     "apiVersion" = "v1"
#     "kind" = "Service"
#     "metadata" = {
#       "name" = "nginx"
#       "namespace" = "default"
#     }
#     "spec" = {
#       "ports" = [
#         {
#           "port" = 80
#           "targetPort" = 80
#         },
#       ]
#       "selector" = {
#         "app" = "node-l2-single"
#       }
#     }
#   }
# }