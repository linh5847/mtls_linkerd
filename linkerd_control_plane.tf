resource "helm_release" "linkerd-control-plane" {
  name       = lookup(var.linkerd_crds_helm, "name", "linkerd-crds")
  repository = lookup(var.linkerd_crds_helm, "repository", join("/", [path.module, "linkerd-crds"]))
  chart      = lookup(var.linkerd_crds_helm, "chart", "linkerd-crds")
  version    = lookup(var.linkerd_crds_helm, "version", "linkerd-crds")

  atomic    = true
  namespace = "linkerd"

  set_sensitive {
    name  = "identityTrustAnchorsPEM"
    value = tls_self_signed_cert.trustanchor_cert.cert_pem
  }

  set_sensitive {
    name  = "identity.issuer.tls.crtPEM"
    value = tls_locally_signed_cert.issuer_cert.cert_pem
  }

  set_sensitive {
    name  = "identity.issuer.tls.keyPEM"
    value = tls_private_key.issuer_key.private_key_pem
  }
}