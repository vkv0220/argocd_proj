resource "helm_release" "argo-cd" {
  name        = "argo-cd"
  chart       = "argo-cd"
  repository  = "https://argoproj.github.io/argo-helm"
  namespace   = "argocd"
  max_history = 3
  create_namespace = true
  wait             = true
  reset_values     = true
  values = [
    file("${path.module}/argocd-values.yaml")
  ]
}
