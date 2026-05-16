# Khai báo provider Vultr
terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.19.0"
    }
  }
}

# Kết nối với Vultr bằng API Key
provider "vultr" {
  api_key = var.vultr_api_key
}

# Khai báo biến API Key
variable "vultr_api_key" {
  description = "Vultr API Key"
}

# Tạo VPS
resource "vultr_instance" "todo_server" {
  plan    = "vc2-2c-2gb"    # 2 CPU, 2GB RAM
  region  = "sgp"            # Singapore
  os_id   = 2284             # Ubuntu 22.04
  label   = "todo-app-server"
}

# In ra IP sau khi tạo xong
output "server_ip" {
  value = vultr_instance.todo_server.main_ip
}