
output "runners_map" {
  value = { for runner_key, runner in module.runners : runner_key => {
    launch_template_name    = runner.launch_template.name
    launch_template_id      = runner.launch_template.id
    launch_template_version = runner.launch_template.latest_version
    launch_template_ami_id  = runner.launch_template.image_id
    lambda_up               = runner.lambda_scale_up
    lambda_up_log_group     = runner.lambda_scale_up_log_group
    lambda_down             = runner.lambda_scale_down
    lambda_down_log_group   = runner.lambda_scale_down_log_group
    lambda_pool             = runner.lambda_pool
    lambda_pool_log_group   = runner.lambda_pool_log_group
    role_runner             = runner.role_runner
    role_scale_up           = runner.role_scale_up
    role_scale_down         = runner.role_scale_down
    role_pool               = runner.role_pool
    runners_log_groups      = runner.runners_log_groups
    logfiles                = runner.logfiles
    }
  }
}

output "binaries_syncer_map" {
  value = { for runner_binary_key, runner_binary in module.runner_binaries : runner_binary_key => {
    lambda           = runner_binary.lambda
    lambda_log_group = runner_binary.lambda_log_group
    lambda_role      = runner_binary.lambda_role
    location         = "s3://runner_binary.bucket.id}/runner_binary.bucket.key"
    bucket           = runner_binary.bucket
  } }
}

output "webhook" {
  value = {
    gateway          = module.webhook.gateway
    lambda           = module.webhook.lambda
    lambda_log_group = module.webhook.lambda_log_group
    lambda_role      = module.webhook.role
    endpoint         = "${module.webhook.gateway.api_endpoint}/${module.webhook.endpoint_relative_path}"
    webhook          = module.webhook.webhook
    dispatcher       = var.eventbridge.enable ? module.webhook.dispatcher : null
    eventbridge      = var.eventbridge.enable ? module.webhook.eventbridge : null
  }
}

output "ssm_parameters" {
  value = module.ssm.parameters
}

output "instance_termination_watcher" {
  value = var.instance_termination_watcher.enable && var.instance_termination_watcher.features.enable_spot_termination_notification_watcher ? {
    lambda           = module.instance_termination_watcher[0].spot_termination_notification.lambda
    lambda_log_group = module.instance_termination_watcher[0].spot_termination_notification.lambda_log_group
    lambda_role      = module.instance_termination_watcher[0].spot_termination_notification.lambda_role
  } : null
}

output "instance_termination_handler" {
  value = var.instance_termination_watcher.enable && var.instance_termination_watcher.features.enable_spot_termination_handler ? {
    lambda           = module.instance_termination_watcher[0].spot_termination_handler.lambda
    lambda_log_group = module.instance_termination_watcher[0].spot_termination_handler.lambda_log_group
    lambda_role      = module.instance_termination_watcher[0].spot_termination_handler.lambda_role
  } : null
}
