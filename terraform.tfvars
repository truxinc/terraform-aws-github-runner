aws_region = "us-east-1"
prefix = "gha-runner"
tags = {
  Project = "github-self-hosted-runner"
}
runner_group_name = "Default"

webhook_lambda_zip                = "webhook.zip"
runners_lambda_zip                = "runners.zip"
runner_binaries_syncer_lambda_zip = "runner-binaries-syncer.zip"

#Runner settings
instance_types = ["t3.medium", "t2.medium"]

#Default runner settings
enable_organization_runners     = true
enable_ephemeral_runners        = false
enable_user_data_debug_logging_runner = true
enable_job_queued_check         = true
enable_ssm_on_runners           = true
enable_fifo_build_queue = true
delay_webhook_event             = 5
runners_maximum_count           = 3
log_level                       = "debug"
scale_down_schedule_expression = "cron(* * * * ? *)"
runner_binaries_s3_versioning = "Enabled"