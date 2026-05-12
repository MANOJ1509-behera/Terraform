variable user{
    description = "name of the User"
    type = list(string)

    default=["mitu","nilima","goutam"]
}

variable groups{
    description = "Group for Iam user"
    type = map(string)

    default ={
        "DevOps" = "arn:aws:iam::aws:policy/AdministratorAccess",
        "Developer" = "arn:aws:iam::aws:policy/AmazonQDeveloperAccess",
        "ReadOnly" = "arn:aws:iam::aws:policy/AlexaForBusinessFullAccess"
    }


}