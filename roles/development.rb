name "development"
description "Tools useful for local development"
run_list(
  "recipe[php]",
  "recipe[apache2::mod_php5]",
  "recipe[phpmyadmin]",
  "recipe[cf]"
)
override_attributes(
  "phpmyadmin" => {
    "host" => "127.0.0.1",
    "hostname" => "phpmyadmin.local"
  }
)
