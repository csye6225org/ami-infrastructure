resource "aws_iam_policy" "create_ami_policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DetachVolume",
                "ec2:AttachVolume",
                "ec2:CreateVolume",
                "ec2:DeleteVolume",
                "ec2:CreateSecurityGroup",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:DeleteSecurityGroup",
                "ec2:DeregisterImage",
                "ec2:RegisterImage",
                "ec2:CreateImage",
                "ec2:CopyImage",
                "ec2:DeleteSnapshot",
                "ec2:CreateSnapshot",
                "ec2:TerminateInstances",
                "ec2:CreateKeyPair",
                "ec2:DeleteKeyPair",
                "ec2:RunInstances",
                "ec2:StopInstances",
                "ec2:ModifyImageAttribute",
                "ec2:ModifySnapshotAttribute",
                "ec2:ModifyInstanceAttribute",
                "ec2:GetPasswordData",
                "ec2:CreateTags"
            ],
            "Resource": "arn:aws:ec2:${var.aws_region}:*:*/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeImages",
                "ec2:DescribeInstances",
                "ec2:DescribeTags",
                "ec2:DescribeRegions",
                "ec2:DescribeVolumes",
                "ec2:DescribeSubnets",
                "ec2:DescribeSnapshots",
                "ec2:DescribeImageAttribute",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeInstanceStatus"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = var.aws_iam_user
  policy_arn = aws_iam_policy.create_ami_policy.arn
}

