# **RECIPE PROJECT**

## Version Information
**Ruby**: 3.2.2  
**Rails**: 7.1.0  
**Node**: 20.8.0  
**Yarn**: 1.22.19  
**PostgreSQL**: 14.9  

## MVC Description

### **Model**  
* Users - for posting recipes
* Ingredients - for recipes  

### **View**  
* main - home, surprise page
* admin - ingredient/user management page
* ingredient - view, create, edit recipe page
* session - login/logout and self user management page
* registration - signup page
* layouts - global

### **Controller**  
* main - manage which recipe to display in home/surprise page
* application - check session cookie (logged in?)
* admin - get/post and delete request for users/ingredients
* ingredients - get, post, and delete request for ingredients (only if user_id = ingredient.user_id)
* session - get, delete for self ingredient and get/post and delete for self user
* registration - post new user
