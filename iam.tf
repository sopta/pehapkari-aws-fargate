resource "aws_iam_role" "ecs_execution_role" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = "${file("policies/ecs-task-execution-role.json")}"
}

resource "aws_iam_role_policy" "ecs_execution_role_policy" {
  name   = "ecsTaskExecutionRolePolicy"
  policy = "${file("policies/ecs-task-execution-role-policy.json")}"
  role   = "${aws_iam_role.ecs_execution_role.id}"
}
