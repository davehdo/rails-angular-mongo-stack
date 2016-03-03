# Introduction
This is a starter template that include the following stack

## Server side
* Rails 4.2.4
* Mongodb

## Client side
* Angular
* Jquery
* Coffee

## Styling
* Sass
* Bootstrap
* Fontawesome ```<i class="fa fa-camera-retro"></i>```


# Getting Started
1. Update config/mongoid.yml to point the database to the correct location. You could use a local mongodb installation or a cloud-based service like MongoLab

# How to add another field to the scaffold

1. Prepare the rails back-end for receiving, storing, and returning the new field

* In app/models/patient.rb, add a line
```
field :field_name, type: String
```

* In app/controllers/patients_controller.rb, scroll to the permit method and whitelist the field name
```
params.require(:patient).permit(:name, :field_name)
```

* In app/views/patients/index.json.jbuilder and app/views/patients/show.json.jbuilder
add the name of the field to the extract method
```
json.extract! @patient, :id, :name, :field_name
```

2. Update the front end form to display the field   

* In assets/javascripts/templates/patients/show.html, add the field to the template
```
{{ patient.field_name}}
```
* In assets/javascripts/templates/_form.html.erb, add a form object to edit the field
