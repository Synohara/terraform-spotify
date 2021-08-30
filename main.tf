terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

variable "spotify_api_key" {
  type = string
}

variable "sep_tracks" {
  type = list(string)
  default = [
    "https://open.spotify.com/track/1ZjuJUMz4pFQWlj2TIStfq",
    "https://open.spotify.com/track/33YakJb3aia4lSTxtbuyJt",
    "https://open.spotify.com/track/40pU9WJhTCnorSnWfsSSDf",
    "https://open.spotify.com/track/1QFXEtrrdJQw1d2T0INNeK",
    "https://open.spotify.com/track/5OFEJMirg4NPz7G1zgXDYu",
    "https://open.spotify.com/track/3DL7joEwJDh9Enw9IBSnjp",
    "https://open.spotify.com/track/2B7snFRWcKkZsH7AR4cuRR",
    "https://open.spotify.com/track/5bzREVE5yKY9BWn78R7NbS",
    "https://open.spotify.com/track/1IkigCZtoghOgpJjWm4fqf",
    "https://open.spotify.com/track/1u7cLB3jSUdBTfttKd1LeN",
    "https://open.spotify.com/track/5xHvxOGmmVWSo5CL27zFml",
    "https://open.spotify.com/track/6sZWxaRHOCYIdudcKpHpqB",
    "https://open.spotify.com/track/7C9Az8GQN1KC8UB3SVh2qr",
    "https://open.spotify.com/track/0SYnaKD8ggLLFP8n37YyJw",
    "https://open.spotify.com/track/1RRlUJMxjp2FmkTExBT2T7",
    "https://open.spotify.com/track/33NsFLfr80OVXNzFgztYyx",
    "https://open.spotify.com/track/0vFD2sv5dsjAMDsFBxJ6Tz",
    "https://open.spotify.com/track/7vk3eUgBPUD5kPZfn7HtUB"
  ]
}

variable "aug_tracks" {
  type = list(string)
  default = [
    "https://open.spotify.com/track/2DHzdsBlnCNPH7ROvtIMIQ",
    "https://open.spotify.com/track/7i3vjpWqzThbgHKtieSH6w",
    "https://open.spotify.com/track/4Hta7Oy5W9HD0UgT1P8PPV",
    "https://open.spotify.com/track/5BfayLeEScEePDYXJCnvU1",
    "https://open.spotify.com/track/4ncXLUcIbgwp2Bm9rGzohd",
    "https://open.spotify.com/track/5b43Q2C1Z5yWsG2HvtFX1Z",
    "https://open.spotify.com/track/60BuCXrGETDlWCxwLNOdB6",
    "https://open.spotify.com/track/46CA1H0T1r7u5lDUtVveAh",
    "https://open.spotify.com/track/5kZHE8Ej3Ev5M6bw53prYa",
    "https://open.spotify.com/track/37D9O4De2WL1hA6gyResgl",
    "https://open.spotify.com/track/74YfKCFkYm53BMbpg0EN6z",
    "https://open.spotify.com/track/0B3EJ9gLAmf1TmbSuI3Y6X",
    "https://open.spotify.com/track/7ujpvaMlfeIYssu8mxPqB3",
    "https://open.spotify.com/track/2QgUXfdGUI7NwlC71vB6dL",
  ]
}

variable "jul_tracks" {
  type = list(string)
  default = [
    "https://open.spotify.com/track/39rcIUEmwKXL3wgyWhTokV",
    "https://open.spotify.com/track/3KZavKBydgRJVxd3y28DGD",
    "https://open.spotify.com/track/6Wpgoaf39mZSDfNdcEhoWx",
    "https://open.spotify.com/track/7igkVvaYEmQ5EEbRzYsJIy",
    "https://open.spotify.com/track/3GVYRsAu6o3HGm53ODJT82",
    "https://open.spotify.com/track/7L5T0IutG8MyDnucOVccdU",
    "https://open.spotify.com/track/0taRW8bPp2xW6ewm6PDMTZ",
    "https://open.spotify.com/track/2Er0f1mhO0g1rov9Cdi5Wk",
    "https://open.spotify.com/track/1SNiieXNyv5bRBbY9YAYVM",
    "https://open.spotify.com/track/1X0CGkkSBK6umJGL8PiZeE",
    "https://open.spotify.com/track/1Iaq12cynLNNzNSapNtqW6",
    "https://open.spotify.com/track/0si3SALy7w77nFLPIOmaSH",
    "https://open.spotify.com/track/5FnlmowF3elDo9Psgw1yFq",
    "https://open.spotify.com/track/6HlWKkzNE1WP67OGqtGeBW",
    "https://open.spotify.com/track/6FKXqaLMBXVDtOI7DCauLn"
  ]
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "sep_2021" {
  name        = "sep.2021.terraform"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [for t in data.spotify_track.sep_2021 : t.id]
}

resource "spotify_playlist" "aug_2021" {
  name        = "aug.2021.terraform"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [for t in data.spotify_track.aug_2021 : t.id]
}

resource "spotify_playlist" "jul_2021" {
  name        = "jul.2021.terraform"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [for t in data.spotify_track.jul_2021 : t.id]
}

data "spotify_track" "sep_2021" {
  for_each = toset(var.sep_tracks)
  url      = each.key
}

data "spotify_track" "aug_2021" {
  for_each = toset(var.aug_tracks)
  url      = each.key
}

data "spotify_track" "jul_2021" {
  for_each = toset(var.jul_tracks)
  url      = each.key
}
