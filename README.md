false_destroy
======================

when mark a record deleted in DB, eg: 0 is not deleted, 1 is deleted

we can call `false_destroy`,then will run callback after_false_destroy like after_destroy in rails.

## Install

```ruby
gem "false_destroy", "0.1.0"
```

## Usage

```ruby
class Orgunit < ActiveRecord::Base
  after_false_destroy do
    # do blabla
  end
end

orgunit = Orgunit.first
orgunit.false_destroy
```

## Config

you can config DB column_name and when_name as the db column name 

column_name: destroyed mark column

when_name: false destroy time

```ruby
FalseDestroy.column_name = 'destroyed'
FalseDestroy.when_name = 'destroyed_at'
```

That's ALL, Enjoy it!!!