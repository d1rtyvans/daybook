# Daybook
Markdown supported CLI journal.

## Usage

### Writing an entry
```bash
daybook
> # Learning Go
> Today I wrote some Go. It was fun.
>
> ## Testing in Go
> I wrote a few tests. They were useful.
> ^D
```

1 daybook entry exists per day. Writing another entry on the same day will append it to the existing entry.

```bash
daybook
> # Learning Rust
> I had to stop, and got Rusty

> ## Compiling in Rust
> I compiled lots of Rust code.
```

Viewing entries
```bash
ls entries

2024-07-07.md
```

```
cat 2024-07-07.md

# Learning Go
Today I wrote some Go. It was fun.

## Testing in Go
I wrote a few tests. They were useful.

# Learning Rust
I had to stop, and got Rusty

## Compiling in Rust
I compiled lots of Rust code.
```

### Customization

```ruby
Daybook.configure do |config|
  config.file_extension = "txt"
end

```

## Contributing

Setup

```bash
bin/setup
```

Running tests

```bash
bundle exec rspec
```

Checking test coverage

```ruby
open coverage/index.html
```
