# Info about global layouts

## everything under "layouts" folder is global
will show up in all pages defined in "main"

## all files with "_" prefix is a partial
mostly for code cleanup, will still be part of global
make sure it is included in application.html.erb: <%= render partial: 'layouts/<partial_name_here>' %>
