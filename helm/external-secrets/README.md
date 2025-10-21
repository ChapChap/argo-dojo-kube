# Initialize

Create a secret like this in the `external-secret` namespace to store your GitLab personal access token with the `api` scope:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: gitlab-access-token
  namespace: external-secrets
  labels:
    type: gitlab
type: Opaque
stringData:
  token: "<VOTRE_TOKEN_PERSONNEL_GITLAB_AVEC_SCOPE_api>"
```
