# Configure the GitHub provider
provider "github" {
  token = env("GITHUB_TOKEN")
}

# Define a data source to list users in the organization (optional)
data "github_user" "all_users" {
  organization = var.organization_name
}

# Define a squad
resource "github_team" "data_platform_squad" {
  name        = "squad-data-platform"
  description = "Squad responsible for the data platform"
  privacy     = "secret"

  # Replace with usernames from your data source or directly define them here
  members = [
    data.github_user.all_users.user1.login,
    data.github_user.all_users.user2.login,
  ]
}

# Define an engineering discipline
resource "github_team" "sre_team" {
  name        = "eng-sre"
  description = "Site Reliability Engineering discipline"
  privacy     = "secret"

  # Replace with usernames from your data source or directly define them here
  members = [
    data.github_user.all_users.user3.login,
    data.github_user.all_users.user4.login,
  ]
}
