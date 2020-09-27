terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "kipspm"
    region     = "ru-central-1"
    key        = "terraform.tfstate"
    access_key = "tYp5jV0YNXdAPs5djR3r"
    secret_key = "5uZoQwCZjzBg7NUE0_mHSQAiVPgwktWr56AUoXje"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
