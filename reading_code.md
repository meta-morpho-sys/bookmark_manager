"create" is a DataMapper method
User.create = puts a row in the table User with the following params

Arguments passed into the create method
                    'hash' 'key - to which a value was assigned from the "email html element in the form"
User.create(email: params[:email],
              password: params[:password])
