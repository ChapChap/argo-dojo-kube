## Manual install command

ouctl install-auth-portal -s secret default.yaml

## Plan

:info: Current problem : refresh token isn't working
First kubectl command is ok, after 60s, it fails with 401

- [x] Installer ou
- [x] Ajouter une config GitHub qui permet de se connecter au portail
- [x] Récupérer une Kubeconfig admin qui fonctionne
- [x] récupérer un contexte avec la commande kubectl oulogin --host=k8sou.homelab.lan
- [ ] Installer ou from scratch via ArgoCD
- [ ] Documenter le bootstrap
- [ ] Déployer Keycloak
- [ ] Gérer les droits de l'utilisateur récupéré
- [ ] Ajouter une authmech openID connect avec référentiel Keycloak
- [ ] Ajouter du TLS fonctionnel sur traefik et vers le backend ou

## Troubleshooting

Pour le debug level, passer le log4j2.xml en base64 et l'ajouter à

kind: Secret
metadata:
  name: orchestra
  namespace: openunison
type: Opqaue
data:
  log4j2.xml: <base64>


### Invalid Login
- **Root cause**: AZ bloc is blocking authz
- **Solution**: remove the bloc

### Internal Server Error on homelab URL call
- **Root cause**: traefik trying to call orchestra backend https but fails verifying the cert
- **Solution**: Change to secure : false to call the backend on http

### Wrong certificate
Unable to connect to the server: tls: failed to verify certificate: x509: certificate is valid for d9b3db38a87534d6fb4c82b6080bde4d.11b76d364ab7c471f4f636dbe4b541b6.traefik.default, not k8sapi.homelab.lan
- **Root cause**: tls cert doesn't not contain k8ouapi homelab domain as SAN
- **Solution**: Recreate the cert

### Untrusted cert
Unable to connect to the server: Get "https://k8sou.homelab.lan/auth/idp/k8sIdp/.well-known/openid-configuration": tls: failed to verify certificate: x509: certificate signed by unknown authority (possibly because of "x509: invalid signature: parent certificate cannot sign this kind of certificate" while trying to verify candidate authority certificate "k8sou.homelab.lan")
- **Root cause**: cert not trusted by the system
- **Solution**: Add the cert to the system keychain
