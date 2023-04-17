# resource "helm_release" "linkerd-viz" {
#   name             = "linkerd-viz"
#   chart            = "linkerd-viz"
#   namespace        = "linkerd-viz"
#   create_namespace = true
#   repository       = "https://helm.linkerd.io/stable"
#   # version    = "2.12.3"
# }