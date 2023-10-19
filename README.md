# AWS Website module

Terraform module that creates an S3 bucket in AWS supporting:

- Data storage
- Website
- Website redirection

## Usage

```
```

## Input parameters

| Parameter name | Description | Type | Default | Required |
| -------------- | ----------- |:----:|:-------:|:--------:|
| `bucket_name` | | `string` | | no |
| `domain_name` | | `string` | | no |
| `redirect_to` | | `string` | | no |
| `tags` | | `string[]` | `[]` | no |

## Output parameters

| Parameter name | Description | Type |
| -------------- | ----------- |:----:|
| `s3_id` | | `string` |
| `s3_bucket` | | `string` |
| `s3_bucket_arn` | | `string` |
| `s3_bucket_regional_domain_name` | | `string` |
| `s3_bucket_website_endpoint` | | `string` |
| `s3_bucket_hosted_zone_id` | | `string` |

## Contributing

Once you checkout the project, you should install `pre-commit`. Also, the hooks currently defined rely on having `tflint` in your system available:

```
paru pre-commit tflint
```

and once these commands are available, you should install the git hooks:

```
pre-commit install
```

## Authors

Module is maintained by [Daniel Pecos Martínez](https://github.com/dpecos) with help from [these awesome contributors](https://github.com/dplabs/terraform-module-s3-bucket/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](/LICENSE) for full details.
