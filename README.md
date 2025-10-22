# Laravel Flavour

A lightweight Laravel package that extracts and provides essential Laravel framework components as standalone utilities. This package includes Laravel's Support and Collections helper functions, allowing you to use Laravel's powerful utilities in any PHP project without the full framework.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Supported Components](#supported-components)
  - [Environment Functions](#environment-functions)
  - [Support Helper Functions](#support-helper-functions)
  - [Collection Helper Functions](#collection-helper-functions)
- [Function Reference](#function-reference)
  - [Environment](#environment)
  - [Value Checking](#value-checking)
  - [String & Object Utilities](#string--object-utilities)
  - [Array & Data Manipulation](#array--data-manipulation)
  - [Control Flow](#control-flow)
  - [Utility Functions](#utility-functions)
- [Examples](#examples)
- [Requirements](#requirements)
- [Development](#development)
- [License](#license)

## Installation

Install via Composer:

```bash
composer require javanile/laravel-flavour
```

## Usage

Once installed, you can use any of the included Laravel helper functions in your PHP application:

```php
<?php
require_once 'vendor/autoload.php';

// Environment variables
$dbHost = env('DB_HOST', 'localhost');

// Collections
$collection = collect([1, 2, 3, 4, 5])
    ->filter(fn($item) => $item > 2)
    ->map(fn($item) => $item * 2);

// Helper functions
$result = retry(3, function() {
    // Some operation that might fail
    return api_call();
});

// Value checking
if (filled($userInput)) {
    // Process non-empty input
}

// String utilities
$className = class_basename('App\\Models\\User'); // Returns: "User"
```

## Supported Components

### Environment Functions
Laravel's environment variable handling with type casting and default values.

### Support Helper Functions
Essential utility functions for string manipulation, class inspection, value checking, and control flow.

### Collection Helper Functions
Data manipulation utilities for arrays and objects using Laravel's powerful Collection syntax.

## Function Reference

### Environment

| Function | Description |
|----------|-------------|
| `env($key, $default = null)` | Get environment variable with default value and type casting |

### Value Checking

| Function | Description |
|----------|-------------|
| `blank($value)` | Determine if a value is "blank" (null, empty string, empty array, etc.) |
| `filled($value)` | Determine if a value is "filled" (opposite of blank) |

### String & Object Utilities

| Function | Description |
|----------|-------------|
| `class_basename($class)` | Get the class "basename" of the given object/class |
| `class_uses_recursive($class)` | Get all traits used by a class, its parents and trait of their traits |
| `e($value, $doubleEncode = true)` | Encode HTML special characters in a string |
| `object_get($object, $key, $default = null)` | Get an item from an object using "dot" notation |
| `str($string = null)` | Get a new stringable object from the given string |
| `trait_uses_recursive($trait)` | Get all traits used by a trait and its traits |

### Array & Data Manipulation

| Function | Description |
|----------|-------------|
| `append_config($array)` | Assign high numeric IDs to a config item to force appending |
| `collect($value = [])` | Create a collection from the given value |
| `data_fill(&$target, $key, $value)` | Fill in data where it's missing using dot notation |
| `data_get($target, $key, $default = null)` | Get an item from an array/object using "dot" notation |
| `data_set(&$target, $key, $value, $overwrite = true)` | Set an item on an array/object using dot notation |
| `data_forget(&$target, $key)` | Remove an item from an array/object using "dot" notation |
| `head($array)` | Get the first element of an array |
| `last($array)` | Get the last element from an array |

### Control Flow

| Function | Description |
|----------|-------------|
| `once($callback)` | Ensure a callable is only called once and return cached result |
| `optional($value = null, $callback = null)` | Provide access to optional objects |
| `retry($times, $callback, $sleepMilliseconds = 0, $when = null)` | Retry an operation a given number of times |
| `tap($value, $callback = null)` | Call the given Closure with the given value then return the value |
| `throw_if($condition, $exception, ...$parameters)` | Throw the given exception if the given condition is true |
| `throw_unless($condition, $exception, ...$parameters)` | Throw the given exception unless the given condition is true |
| `transform($value, $callback, $default = null)` | Transform the given value if it is present |
| `when($condition, $value, $default = null)` | Return a value if the given condition is true |
| `with($value, $callback = null)` | Return the given value, optionally passed through the given callback |

### Utility Functions

| Function | Description |
|----------|-------------|
| `fluent($value = null)` | Create a Fluent object from the given value |
| `laravel_cloud()` | Determine if the application is running on Laravel Cloud |
| `literal(...$arguments)` | Return a new literal or anonymous object using named arguments |
| `preg_replace_array($pattern, $replacements, $subject)` | Replace a given pattern with each value in the array sequentially |
| `value($value, ...$args)` | Return the default value of the given value |
| `windows_os()` | Determine whether the current environment is Windows based |

## Examples

### Environment Variables

```php
// Basic usage
$databaseUrl = env('DATABASE_URL', 'sqlite://database.sqlite');

// Type casting (automatic)
$debugMode = env('APP_DEBUG', false); // Returns boolean
$maxConnections = env('MAX_CONNECTIONS', 100); // Returns integer
```

### Collections

```php
$users = collect([
    ['name' => 'John', 'age' => 30],
    ['name' => 'Jane', 'age' => 25],
    ['name' => 'Bob', 'age' => 35]
]);

$adults = $users
    ->filter(fn($user) => $user['age'] >= 30)
    ->pluck('name')
    ->toArray(); // ['John', 'Bob']
```

### Data Manipulation

```php
$config = [];

// Set nested values using dot notation
data_set($config, 'database.connections.mysql.host', 'localhost');
data_set($config, 'database.connections.mysql.port', 3306);

// Get nested values
$host = data_get($config, 'database.connections.mysql.host'); // 'localhost'
$timeout = data_get($config, 'database.timeout', 30); // 30 (default)

// Fill missing values
data_fill($config, 'database.charset', 'utf8mb4');
```

### Control Flow

```php
// Retry with backoff
$result = retry(3, function() use ($api) {
    return $api->getData();
}, sleepMilliseconds: 1000);

// Optional chaining
$userName = optional($user)->profile->name ?? 'Guest';

// Conditional execution
$message = when($user->isAdmin(), 'Admin Panel', 'User Dashboard');

// Transform values
$processedData = transform($rawData, function($data) {
    return json_decode($data, true);
}, []);
```

### Value Checking

```php
// Check if values are filled/blank
if (filled($request->get('email'))) {
    // Process email
}

if (blank($optionalField)) {
    // Set default value
    $optionalField = 'default';
}

// Safe execution with throw_if/throw_unless
throw_if(blank($requiredField), InvalidArgumentException::class, 'Field is required');
throw_unless($user->hasPermission('admin'), UnauthorizedException::class);
```

## Requirements

- PHP 8.2 or higher
- Composer

## Development

### Building the Package

```bash
# Clone Laravel framework and extract components
make build

# Run tests
make test

# Run tests directly with Pest
composer dump-autoload
./vendor/bin/pest
```

### Project Structure

```
src/
├── Illuminate/
│   ├── Support/
│   │   ├── Env.php              # Environment variable handling
│   │   └── helpers.php          # Support helper functions
│   └── Collections/
│       └── helpers.php          # Collection helper functions
tests/                           # Pest PHP test suite
laravel/framework/              # Laravel framework source (auto-downloaded)
```

The build process automatically downloads Laravel v12.32.4 and extracts the necessary components.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

**Francesco Bianco** - [bianco@javanile.org](mailto:bianco@javanile.org)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

*Laravel Flavour extracts components from Laravel Framework v12.32.4. Laravel is a trademark of Taylor Otwell.*