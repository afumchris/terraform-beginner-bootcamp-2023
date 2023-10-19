terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "Donniedarko"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
    organization = "Donniedarko"
    workspaces {
      name = "terra-house-1"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "paris-texas_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.paris-texas.public_path
  content_version = var.paris-texas.content_version
}

resource "terratowns_home" "paris-texas" {
  name = "Review on the Movie Paris Texas by Wim Wenders"
  description = <<DESCRIPTION
One of the best road trip movie i have seen!!
DESCRIPTION
  domain_name = module.paris-texas_hosting.domain_name
  town = "video-valley"
  content_version = var.paris-texas.content_version
}

module "study-music_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.study-music.public_path
  content_version = var.study-music.content_version
}

resource "terratowns_home" "study-music" {
  name = "Playlist and Albums i use to Study"
  description = <<DESCRIPTION
This is for all the Einsamer Hirte. LOL
DESCRIPTION
  domain_name = module.study-music_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = var.study-time.content_version
}