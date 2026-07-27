# burns 🐝

This is a git repository for my homelab kubernetes cluster called `burns`. This is the third iteration of my homelab. This iteration is primarily focused around building security and production oriented solutions.

## Architecture

### Nodes

Each node runs Ubuntu as the base OS with [k3s](https://k3s.io).

| Node        | Role   | RAM  | Disk  |
| ----------- | ------ | ---- | ----- |
| lisa-master | Master | 16GB | 512GB |
| lisa-node-1 | Worker | 16GB | 512GB |
| lisa-node-2 | Worker | 16GB | 512GB |

### Network & Access

There are both public and private services running on this cluster. Some services are required to be accessed on the public internet, like authentik, while other services should only be accessible by certain parties who maintain the cluster. While there are lots of ways to restrict this access I went with tailscale as my PAM solution. It allows me to connect multiple devices, nodes, and services within the tailnet. I run two instances of traefik for internal and public traffic so it's as easy as changing the `ingressClassName` to either `internal` or `public` to determine the route of access.

### Internal Network

![Internal Network Diagram](./images/burns_internal-network.png)

### Public Access

![Public Access Diagram](./images/burns_public-access.png)

### Private Access

![Private Access Diagram](./images/burns_private-access.png)

## Currently Running

Applications are deployed and managed through ArgoCD. This is a list of applications running on-prem.

| Component            | Purpose                                        | Logo                                                       |
| -------------------- | ---------------------------------------------- | ---------------------------------------------------------- |
| ArgoCD               | GitOps continuous delivery                     | <img src="images/logo_argocd.png" height="100"/>           |
| Authentik            | Identity provider (OIDC/SSO)                   | <img src="images/logo_authentik.png" height="100"/>        |
| cert-manager         | TLS certificate management                     | <img src="images/logo_cert-manager.png" height="100"/>     |
| CloudNativePG        | PostgreSQL operator                            | <img src="images/logo_cloudnative-pg.png" height="100"/>   |
| Cluster Secret Store | Cluster-wide secret store for External Secrets | <img src="images/logo_external-secrets.png" height="100"/> |
| External Secrets     | Syncs secrets from external backends           | <img src="images/logo_external-secrets.png" height="100"/> |
| 1Password Connect    | Secret backend for External Secrets            | <img src="images/logo_onepassword.png" height="100"/>      |
| Renovate             | Automated dependency updates                   | <img src="images/logo_renovate.png" height="100"/>         |
| Tailscale            | Private network access (tailnet)               | <img src="images/logo_tailscale.png" height="100"/>        |
| Traefik (internal)   | Ingress for internal services                  | <img src="images/logo_traefik.png" height="100"/>          |
| Traefik (public)     | Ingress for public services                    | <img src="images/logo_traefik.png" height="100"/>          |
| Umami                | Web analytics                                  | <img src="images/logo_umami.png" height="100"/>            |

## Repository structure

```txt
.
├── argocd-applications # argocd application manifests
├── bootstrap           # stores bootstrap configuration
├── configurations      # stores values.yaml files for helm
├── images              # stores diagrams and logos
├── manifests           # stores kubernetes manifests
├── README.md           # what you're reading right now!
├── renovate.json       # renovate configuration file
└── terraform           # stores terraform infrastructure
```
