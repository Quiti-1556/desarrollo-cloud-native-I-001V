provider "aws" {
  region = "us-east-1"


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