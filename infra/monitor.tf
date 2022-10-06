resource "monitor" "blog1-staging-connetions" {
    name = "blog1-staging-connections"
    metric = "Connections"
    target = aws_db_instance.blog1-staging.id

    // frequency in secs
    frequency = 60
    critical = {
        operator = ">="
        threshold = 85
        // How many consecutive metrics above the threshold trigger the alarm
        evaluation_periods = 5
    }

    warning = {
        operator = ">="
        threshold = 60
        // How many consecutive metrics above the threshold trigger the alarm
        evaluation_periods = 5
    }

    alarm_channel = "alarm SNS topic"
    ok_channel = "ok SNS topic"
}

resource "monitor" "blog1-staging-cpu" {
    name = "blog1-staging-cpu"
    metric = "CPUUtilization"
    target = aws_db_instance.blog1-staging.id

    // frequency in secs
    frequency = 60
    critical = {
        operator = ">="
        threshold = 80
        // How many consecutive metrics above the threshold trigger the alarm
        evaluation_periods = 5
    }

    warning = {
        operator = ">="
        threshold = 60
        // How many consecutive metrics above the threshold trigger the alarm
        evaluation_periods = 5
    }

    alarm_channel = "alarm SNS topic"
    ok_channel = "ok SNS topic"
}