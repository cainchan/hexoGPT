---
title: Kubernetes访问控制：使用RBAC
tags:
  - Kubernetes
categories:
  - DevOps
date: 2023-05-30 10:25:12
author:
thumbnail:
blogexcerpt:
---
Kubernetes 是一个开源的容器编排平台，可以帮助开发者快速部署和管理应用程序。在 Kubernetes 中，访问控制是非常重要的一部分，通过访问控制可以保障系统的安全性和可靠性。其中，Role-Based Access Control（RBAC）是 Kubernetes 中最常用的访问控制机制之一。

RBAC 为 Kubernetes 集群提供了一种灵活而完善的方式来管理用户、组和服务账户的权限。RBAC 使用角色（Role）和角色绑定（RoleBinding）的方式来实现访问控制。角色定义了一组操作（如创建、删除等），而角色绑定将这些角色分配给用户或服务账户。

在 Kubernetes 中，RBAC 控制着三个方面的资源：API 资源、非 API 资源和名字空间（Namespace）。API 资源即 Kubernetes API 中定义的对象，例如 Pod、Deployment 和 Service 等。非 API 资源包括 Nodes、Persistent Volumes 和 Storage Classes 等。名字空间则是 Kubernetes 集群中用于隔离资源的一种方式。

要使用 RBAC 来控制 Kubernetes 群集中的资源访问，需要完成以下步骤：

1. 创建角色

首先，需要创建一个角色，以指定哪些 API 资源或非 API 资源可以被访问。创建角色时需要指定以下内容：

- `apiVersion`：API 版本号，通常为 "rbac.authorization.k8s.io/v1"。
- `kind`：资源类型，必须为 Role 或 ClusterRole（用于集群范围的角色）。
- `metadata`：角色的元数据，包括名字、命名空间和注释等。
- `rules`：角色需要授权的操作。

例如，创建一个可以读取 Pod 的角色：

```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: default
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

2. 创建角色绑定

接下来，需要创建一个角色绑定，以将上述角色分配给用户或服务账户。创建角色绑定时需要指定以下内容：

- `apiVersion`：API 版本号，通常为 "rbac.authorization.k8s.io/v1"。
- `kind`：资源类型，必须为 RoleBinding 或 ClusterRoleBinding（用于集群范围的角色绑定）。
- `metadata`：角色绑定的元数据，包括名字、命名空间和注释等。
- `roleRef`：引用先前创建的角色的名称和 API 组。
- `subjects`：被分配角色的用户或服务账户。

例如，创建一个将 pod-reader 角色分配给用户 johndoe 的角色绑定：

```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: johndoe
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

3. 测试

最后，可以测试用户或服务账户是否能够成功访问所需资源。例如，可以使用 kubectl 命令行工具来测试 johndoe 用户是否有权限查看 Pod：

```
$ kubectl auth can-i get pods --as johndoe
yes
```

总的来说，RBAC 提供了一个非常灵活的访问控制机制，可以帮助 Kubernetes 管理员精细地控制用户和服务账户的权限。但是，在实际使用 RBAC 时，需要谨
