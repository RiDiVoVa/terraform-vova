# Terraform AWS MVP — EPAM Test Project

Учебный проект по Terraform.  
Создаёт инфраструктуру в AWS:  
- **VPC** через официальный модуль  
- **2 EC2 инстанса** (через `count`)  
- **Classic ELB**, который балансирует трафик на эти инстансы  

---

## 📂 Структура проекта

```
epam-task-terraform-by-reznik/
├── backend.tf        # backend для state (S3)
├── versions.tf       # версии Terraform и provider
├── providers.tf      # провайдер AWS
├── variables.tf      # входные переменные
├── terraform.tfvars  # значения переменных (регион, профиль и т.п.)
├── vpc.tf            # модуль VPC
├── security.tf       # security groups
├── ec2.tf            # EC2 инстансы
├── elb.tf            # Classic ELB
├── outputs.tf        # outputs (DNS ELB и др.)
└── my-site.sh        # user_data (nginx "It works!")
```
---

## ⚙️ Требования
---
- Terraform >= 1.6  
- AWS CLI с настроенным профилем (например, `vova`)  
- Аккаунт AWS с правами на создание VPC, EC2, ELB, S3  

---

## ▶️ Запуск проекта

```
terraform init -reconfigure
terraform validate
terraform plan
terraform apply
После apply выведется DNS-имя ELB:echo "http://$(terraform output -raw elb_dns)"
Открой его в браузере — увидишь страницу "It works!" от Nginx.
```
## 🧹 Удаление ресурсов
terraform destroy


## 👤 Автор
Vova Reznik
