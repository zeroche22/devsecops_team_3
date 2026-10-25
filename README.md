# DevSecOps Team 3 Project

Проєкт автоматизації інфраструктури (IaC) та керування конфігурацією (CaC) за принципами DevSecOps та Shift-Left Security.

## Структура інфраструктури (3 ВМ)

Виділений пул IP для команди: `192.168.5.102` – `192.168.5.199`.

1. **`Study3-setup` (`192.168.5.103`)** — Вузол керування (Bastion, Ansible, Terraform, CI/CD, Shift-Left перевірки безпеки).
2. **`Study3-minikube` (`192.168.5.104`)** — Вузол середовища Kubernetes (Docker, Minikube, веб-додаток у контейнері).
3. **`Study3-observability` (`192.168.5.105`)** — Вузол спостережуваності (Prometheus, Grafana, Loki).

Кожна віртуальна машина сконфігурована з лімітами: **2 vCPU, 2048 MB RAM, 25 GB Thin Disk**.

## Структура репозиторію

- `terraform/` — Маніфести Terraform для розгортання віртуальних машин у VMware vSphere / ESXi.
  - `providers.tf` — Конфігурація провайдера `vmware/vsphere`.
  - `variables.tf` — Змінні конфігурації та параметри пулу ВМ.
  - `main.tf` — Опис ресурсів ВМ з використанням `for_each`.
  - `outputs.tf` — Вихідні параметри (імена, IP-адреси, ID машин).
  - `terraform.tfvars.example` — Шаблон файлу змінних без секретів.
- `ansible/` — Плейбуки та ролі Ansible для конфігурації хостів та базового захисту.
  - `ansible.cfg` — Базові параметри запуску Ansible.
  - `inventory/hosts.ini` — Інвентар хостів за групами (`control_nodes`, `k8s_nodes`, `monitoring_nodes`).
  - `playbooks/bootstrap.yml` — Первинна ініціалізація користувачів `devops` і `dev` через обліковий запис `student`.
  - `playbooks/site.yml` — Основний плейбук налаштування хостів, безпеки та Minikube.
  - `roles/` — Модульні ролі (`common`, `users`, `security`, `docker`, `minikube`, `webapp`).
- `.gitignore` — Захист від потрапляння конфіденційних даних (секретів, ключів WireGuard, tfstate).

## Швидкий старт

### 1. Налаштування змінних Terraform
Скопіюйте приклад змінних та заповніть облікові дані:
```bash
cp terraform/terraform.tfvars.example terraform/terraform.tfvars
```

### 2. Ініціалізація та розгортання ВМ
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 3. Первинна ініціалізація та конфігурація хостів через Ansible
```bash
cd ../ansible
ansible-playbook playbooks/site.yml
```

Після завершення плейбука підключення до будь-якої машини здійснюється без пароля:
```bash
ssh Study3-setup
ssh Study3-minikube
ssh Study3-observability
```
