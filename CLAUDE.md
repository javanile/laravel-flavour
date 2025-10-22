# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About This Project

Laravel Flavour is a package that extracts and repackages specific Laravel framework components (Support and Collections helpers) from the official Laravel framework. It tracks Laravel v12.32.4 and provides a subset of Laravel's functionality as a standalone package.

## Development Commands

### Building and Testing
```bash
# Build the project (clones Laravel framework and copies files)
make build

# Run tests using Pest PHP
make test

# Full publish workflow (build + test + push)
make publish
```

### Individual Commands
```bash
# Run tests directly
composer dump-autoload
./vendor/bin/pest

# Build manually
bash contrib/build.sh

# Publish manually
bash contrib/publish.sh
```

## Project Architecture

### Repository Structure
- `src/Illuminate/` - Contains extracted Laravel components
  - `Support/` - Laravel Support utilities (Env.php, helpers.php)
  - `Collections/` - Laravel Collections helpers
- `laravel/framework/` - Complete Laravel framework (cloned during build)
- `contrib/` - Build and publish scripts
- `tests/` - Pest PHP test suite

### Build Process
The build process (`contrib/build.sh`) automatically:
1. Clones Laravel framework v12.32.4 if not present
2. Creates necessary directory structure in `src/`
3. Copies specific files from Laravel framework:
   - `Support/Env.php`
   - `Support/helpers.php` 
   - `Collections/helpers.php`

### Versioning and Publishing
- Tracks specific Laravel versions (currently v12.32.4)
- Uses git tags for version management
- Publishing process reads version from `.env` file
- Automatically commits and tags releases

### Testing Framework
- Uses Pest PHP v4.1 for testing
- Tests are in `tests/` directory with Pest configuration
- Test structure includes Feature and Unit test directories
- PHPUnit XML configuration covers `app/` and `src/` directories

## Key Dependencies

### Runtime Dependencies
- `phpoption/phpoption` ^1.9
- `vlucas/phpdotenv` ^5.6

### Development Dependencies  
- `pestphp/pest` ^4.1

## Important Notes

- This is a derivative package that extracts specific Laravel components
- The Laravel framework is included as a git submodule/clone during build
- Version synchronization with Laravel releases happens through the build process
- All Laravel framework code remains under MIT license