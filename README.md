[![Build Status](https://travis-ci.org/kuleszaj/chef_testing_example.svg)](https://travis-ci.org/kuleszaj/chef_testing_example)

# Chef Testing Example

DevOps West Michigan

Test cookbook that sets up Apache2 with mod_rewrite.

## Supported Platforms

  - Ubuntu 14.04 LTS

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef_testing_example']['hostname']</tt></td>
    <td>String</td>
    <td>FQDN Apache should respond to.</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Testing

### Getting started...

 - `bundle install`

### ChefSpec tests

 - `bundle exec rake spec`

### Test-Kitchen w/Serverspec tests on local vagrant

 - `bundle exec rake kitchen:all`

### Foodcritic linting

 - `bundle exec rake foodcritic`

### Rubocop linting

 - `bundle exec rake rubocop`

## Usage

### chef_testing_example::default

Include `chef_testing_example` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef_testing_example::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Justin Kulesza (justin.kulesza@atomicobject.com)
