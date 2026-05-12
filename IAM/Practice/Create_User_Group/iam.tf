# create 3 users
resource "aws_iam_user" "users" {
    for_each = toset(var.user)

    # Pass a list value to toset to convert it to a set Beacuse for each loop only accept 
    # set value not the list value
    name=each.value

}


# Create 3 Groups and attach the policy to the group

resource "aws_iam_group" "groups" {
  for_each = var.groups

  name = each.key
}


resource "aws_iam_group_policy_attachment" "policy-attach" {
    
    for_each = var.groups
  group      = aws_iam_group.groups[each.key].name
  policy_arn = each.value
}

resource "aws_iam_user_group_membership" "mitumemb" {
  user = aws_iam_user.users["mitu"].name

  groups = [
    aws_iam_group.groups["DevOps"].name
  ]
}

resource "aws_iam_user_group_membership" "nilmemb" {
  user = aws_iam_user.users["nilima"].name

  groups = [
    aws_iam_group.groups["Developer"].name
  ]
}

resource "aws_iam_user_group_membership" "goumemb" {
  user = aws_iam_user.users["goutam"].name

  groups = [
    aws_iam_group.groups["ReadOnly"].name
  ]
}