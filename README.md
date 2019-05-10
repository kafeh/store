# SNACK STORE
This an API for a Snack Store. If you are an Administrator you can manage the CRUD of the products. If you are a User you can buy Snacks, give a like to products, see the list available and sort them by name and likes and also search products by name.

# Prerequisites
This API currently works with:
* Ruby 2.6.0
* Rails 5.2.3
* PosgreSQL 10.6
# Installation
For running a copy of the API on a local machine you have to follow in order these steps.

Install the required gems
```
bundle
```
For test purpose I had upload the **_.env_** file (this file must be added on the .gitignore), you can modified the values of these variables with the info of you local PostgreSQL setup.
```
POSTGRES_USER='postgres'
POSTGRES_PASSWORD='1234'
POSTGRES_HOST='localhost'
POSTGRES_DB='store_development'
POSTGRES_TEST_DB='store_test'
```
The **_database.yml_** (only uploaded for test purpose, this file must be added on the .gitignore too) is setting with the variables of the .env.

After making the changes in the **_.env_** file for your local machine, execute the database creation
```
rake db:create
```
Now you have to run migrations
```
rake db:migrate
```

For making things easy, I create with Faker gem, a **collection of data** for testing purpose, this way you don’t have to waste your time creating records or restoring a .dump file. For adding the Collection execute:
```
rake db:seed
```
The previous command will add records for all the models in the API.

# Models

The list of models used are:

* **Admin**
* **User**
* **ProductType**
* **Product**
* **PriceProduct**
* **LikeProduct** 
* **Order**
* **OrderItem**.

# Deployment
Now that you have everything setup in your API is time for deployment, you have to execute the command:
```
rails s
```
# Authentication
Users and Admins need to get a **_token_** and put it on the header with **_Authorization_** as key for access to some request.

The token is obtained by login either as a user or as an administrator and it will be expired after 24 hour.

# Sort
With the symbols *+* and *-* you can order the records **descending** or **ascending**. The sorting can be by multiple fields separated by commas, for this add the **_sort_** param follow by the field in your request.

* Adding *-* will be order descending
* Not adding a symbol will by order ascending
### Url Params
```
sort=[value] or sort=[-value]
```
### Example
**Descending** by name, **Ascending** by likes.
```
/api/v1/products?sort=-name,likes
```
**Ascending** by name, **Descending** by likes.
```
/api/v1/products?sort=name,-likes
```

# Pagination
Add the **_page_** param follow by the number of page you want to retrieve in your request.
### Url Params
```
page=[value]
```
### Example
```
/api/v1/products?page=2&&sort=name,-likes
```
# Search by Name
Add the **_name_** param follow by the name of the product
### Url
```/api/v1/products/search_by_name```
### Url Params
```
name=[value]
```
### Example
```
/api/v1/products/search_by_name?name=cinnamon
```
# Login as User
### Url
```
/users/auth/login
```
### Method
`POST`
### Data Params
```
{
   "email":  [email],
   "password": [password]
}
```

## Login as Admin
### Url
```
/admins/auth/login
```
### Method
`POST`
### Data Params
```
{
   "email":  [email],
   "password": [password]
}
```

# Create a Product
### Url
```
/api/v1/products
```
### Method
`POST`

### Data Params
```
{
   "name": [name]
   "product_type_id": [product_type_id],
   "stock": [stock]
}
```

# Destroy a Product
### Url
```
/api/v1/products/:id
```
### Method
`DELETE`

### Url Params
```
id=[value]
```

# Update a Product
### Url
```
/api/v1/products/:id
```
### Method
`PATCH`
### Url Params
```
id=[value]
```
### Data Params
```
{
   "name": [name]
   "product_type_id": [product_type_id],
   "stock": [stock]
}
```

# Add Like to Product
### Url
```
/api/v1/products/:id/add_like
```
### Method
`GET`
### Url Params
```
id=[value]
```

# Modify a Price of Product
### Url
```
/api/v1/products/:id/set_price
```
### Method
`POST`
### Url Params
```
id=[value]
```
### Data Params
```
{  
   "price_product":{  
      "price": [price]
   }
}
```
# Product List
### Url
```
/api/v1/products
```
### Method
`GET`

# Show Product
### Url
```
/api/v1/products/:id
```
### Method
`GET`
### Url Params
```
id=[value]
```

# Add Item to Order
### Url
```
/api/v1/order_items/
```
### Method
`POST`
### Data Params
```
{  
   "order_item":{  
      "product_id": [product_id],
      "quantity": [quantity]
   }
}
```
# Remove Item from Order
### Url
```
/api/v1/order_items/:id
```
### Method
`DELETE`
### Url Params
```
id=[value]
```

# Update quantity of Item
### Url
```
/api/v1/order_items/:id
```
### Method
`PATCH`
### Url Params
```
id=[value]
```
### Data Params
```
{
   "quantity": [quantity]
}
```

# Buy Items
**Important** <br>
User can only have one **_active_** Order, it will be change to **_finished_** once the User buy Items.

### Url
```
/api/v1/orders/buy
```
### Method
`PATCH`

# Show Order Log to Admin
### Url
```
api/v1/orders/:id/log
```
### Method
`GET`
### Url Params
```
id=[value]
```

# Show Order Log to User
### Url
```
/api/v1/orders/:id
```
### Method
`GET`
### Url Params
```
id=[value]
```

# Destroy Order
### Url
```
/api/v1/orders/:id
```
### Method
`DELETE`
### Url Params
```
id=[value]
```

