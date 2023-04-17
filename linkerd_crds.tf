resource "helm_release" "linkerd-crds" {
  name = "linkerd-crds"

  repository = "https://helm.linkerd.io/stable"
  chart      = "linkerd-crds"
  # version    = "2.12.3"

  atomic           = true
  namespace        = "linkerd"
  create_namespace = true
}