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
instance_types = ["t3.large", "t2.large"]

#Default runner settings
enable_organization_runners     = true
enable_ephemeral_runners        = false
enable_user_data_debug_logging_runner = true
enable_job_queued_check         = true
enable_ssm_on_runners           = true
delay_webhook_event             = 5
runners_maximum_count           = 10
log_level                       = "debug"
scale_down_schedule_expression = "cron(* * * * ? *)"
runner_binaries_s3_versioning = "Enabled"
github_app = {
  # 1. Private Key SSM details
  key_base64_ssm = {
    name = "/truxinc/gha-runner/app/github_app_key_base64"
    arn  = "arn:aws:ssm:us-east-1:409153725422:parameter/truxinc/gha-runner/app/github_app_key_base64"
  }
  
  # 2. App ID SSM details
  id_ssm = {
    name = "/truxinc/gha-runner/app/github_app_id"
    arn  = "arn:aws:ssm:us-east-1:409153725422:parameter/truxinc/gha-runner/app/github_app_id"
  }

  # 3. Webhook Secret SSM details
  webhook_secret_ssm = {
    name = "/truxinc/gha-runner/app/github_app_webhook_secret"
    arn  = "arn:aws:ssm:us-east-1:409153725422:parameter/truxinc/gha-runner/app/github_app_webhook_secret"
  }

  # Set direct value fields to null since you are using SSM
  key_base64     = null
  id             = null
  webhook_secret = null
}
vpc_id = "vpc-0ff222137146b2424"
subnet_ids = [ "subnet-04c33468a8c2124c8", "subnet-0348514aa58bfc031" ]