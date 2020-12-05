# README

## How to Test
Create a user and upgrade it to admin using the following endpoints. 
Save the token you get from *creating* or *logging in* a user, and pass it as a **bearer token** in Postman's Authorization tab for the other controller actions

### User Endpoints
**POST /api/v1/users**

_params_
```
{
  email: 'tst@gmail.com',
  first_name: 'test',
  last_name: 'test'
}
```

**PATCH /api/v1/users/:id/login**

**PATCH /api/v1/users/:id/promote_to_admin**

**PATCH /api/v1/users/:id/upgrade_to_premium**

**PATCH /api/v1/users/:id/upgrade_to_professional**

### Learning Modules Endpoints
Standard Rails API endpoints plus the following:

**POST /api/v1/learning_modules/:id/purchase**
