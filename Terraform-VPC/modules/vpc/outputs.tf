output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet-ids" {
  value = aws_subnet.subnet.*.id
}

output "availability_zone_id" {
  value = data.aws_availability_zones.available.all_availability_zones
}