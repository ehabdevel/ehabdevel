class QueryMutation {
  // addPerson(
  //   String username,
  //   String firstname,
  //   String lastname,
  //   String email,
  // ) {
  //   return "mutation { addPerson(username: \"$username\", firstname: \"$firstname\", lastName: \"$lastname\", email: $email) { username, firstname, lastname, email } }";
  // }

  getAll() {
    return """
    query{
      allDemands{
        id
        title
        notes
        bloodType
        address1
        address2
        address3
        city
        country
        demanderName
        contactName
        contactTel
        dateCreated
        publishDate
        published
        author{
          id
          user{
            id
            username
            firstName
            lastName
            profile{
              id
            }
          }
        }
        status
      }
    }
    """;
    // return "query { users { username, firstname, lastname, email } }";
  }

  getUsers() {
    return """
    query(\$isDonator: Boolean){
      allProfiles(isDonator: \$isDonator){
        id
        isDonator
        phone
        city
        country
        bloodType
        user{
          id
          password
          lastLogin
          isSuperuser
          username
          firstName
          lastName
          isStaff
          isActive
          dateJoined
          email
        }
      }
    }
    """;
    // return "query { users { username, firstname, lastname, email } }";
  }

  // deletePerson(username) {
  //   return "mutation { deletePerson(username: \"$username\") { username, firstname, lastname, email } }";
  // }

  // editPerson(
  //   String username,
  //   String firstname,
  //   String lastname,
  //   int email,
  // ) {
  //   return "mutation { editPerson(username: \"$username\", firstname: \"$firstname\", lastname: \"$lastname\", email: $email) { username, firstname, lastname, email } }";
  // }

  register(email, user, password) {
    return """ 
      mutation {
        register(
          email: "$email",
          username: "$user",
          password1: "$password",
          password2: "$password",
        ) {
          success,
          errors,
          token,
          refreshToken
        }
      }
    """;
  }
}
