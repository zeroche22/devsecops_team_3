# DevSecOps Team 3 Project

Проєкт автоматизації інфраструктури (IaC) та керування конфігурацією (CaC) за принципами DevSecOps та Shift-Left Security.

## Структура репозиторію

- `terraform/` — Маніфести Terraform для створення віртуальної машини `Study3-k8s-setup` у VMware vSphere / ESXi.
  - `providers.tf` — Конфігурація провайдера `vmware/vsphere`.
  - `variables.tf` — Змінні конфігурації із встановленими обмеженнями (1 vCPU, 1024 MB RAM).
  - `main.tf` — Опис ресурсів ВМ, створення користувача `dev` та налаштування мережі.
  - `outputs.tf` — Вихідні параметри (IP-адреса, ID машини).
  - `terraform.tfvars.example` — Шаблон файлу змінних без секретів.
- `ansible/` — Плейбуки та ролі Ansible для конфігурації хоста та базового захисту.
  - `ansible.cfg` — Базові параметри запуску Ansible.
  - `inventory/hosts.ini` — Інвентар цільових хостів.
  - `playbooks/site.yml` — Основний плейбук налаштування хоста.
  - `roles/` — Модульні ролі (`common`, `security`, `docker`, `webapp`).
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

### 3. Конфігурація хоста через Ansible
```bash
cd ../ansible
ansible-playbook playbooks/site.yml
```
