# Clear all users except for ADMIN
Open rails console
* rails console | OR | rails c  

delete all but admin
* UserInfo.where.not(admin: true).destroy_all  

check with
* UserInfo.all  