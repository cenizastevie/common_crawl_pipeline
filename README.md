# AWS Athena Table Creation with Terraform

This project uses Terraform to create an AWS Glue database and table for use with Amazon Athena.

## Prerequisites

- Terraform installed
- AWS account with necessary permissions for creating Glue and Athena resources

## Usage

1. Clone this repository and navigate to the directory in a terminal.

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Apply the Terraform configuration:

    ```bash
    terraform apply
    ```

    Review the plan and type `yes` to proceed.

## Post Terraform Apply Steps

After running `terraform apply`, you will need to manually run the `MSCK REPAIR TABLE` command in the Athena console to load the partitions from S3. Here are the steps to do this:

1. Open the AWS Management Console in your web browser.

2. Navigate to the Athena service. You can find this by typing "Athena" into the service search bar and selecting it from the dropdown.

3. In the Athena query editor, select the database you created from the "Database" dropdown on the left side of the page. This should be "ccindex" if you used the provided Terraform script.

4. In the query editor, type the following command:

    ```sql
    MSCK REPAIR TABLE ccindex;
    ```

5. Click "Run query" or press Ctrl + Enter to execute the command.

This command will load the partitions from the S3 data into the Athena table. This may take a while to complete if you have a large amount of data.

After the command completes, you should be able to query your table in Athena and see the data from S3.