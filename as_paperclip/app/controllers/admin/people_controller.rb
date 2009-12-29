class Admin::PeopleController < ApplicationController
  layout 'admin'
  active_scaffold :person do |config|
    #restrict all columns to these three
    config.columns = [:name, :avatar]

    #include multipart for create and update forms
    config.create.multipart = true
    config.update.multipart = true
  end
end
