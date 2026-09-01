provider "aws" {
  region = "us-east-1"
  access_key = secrets.AWS_ACCESS_KEY_ID
  secret_key = secrets.AWS_SECRET_ACCESS_KEY
  session_token = secrets.AWS_SESSION_TOKEN
}

# Crear la API HTTP
resource "aws_apigatewayv2_api" "api" {
  name          = "tutorial-api"
  protocol_type = "HTTP"
}

# Crear la etapa (Stage) de despliegue automático
resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = "$default"
  auto_deploy = true
}

# Mostrar la URL final en la consola
output "api_url" {
  value       = aws_apigatewayv2_api.api.api_endpoint
  description = "La URL pública de tu API Gateway"
}