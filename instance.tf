resource "aws_instance" "this" {
  count         = var.instance_count
  ami           = "ami-0f3c9c466bb525749"
  instance_type = "t3.micro"
  tags = {
    Name = "AK-${format("%02d", count.index + 1)}"
  }
  root_block_device { 
    volume_type = "gp3" 
    volume_size = "100" 
    delete_on_termination = true 
    # encrypted = true 
    # kms_key_id = aws_kms_key.snowflakedm-daily-staging-kms-key[0].arn 
    }
}