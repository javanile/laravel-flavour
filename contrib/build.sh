#!/usr/bin/env bash
set -e

[ ! -d laravel/framework ] && git clone https://github.com/laravel/framework --branch v12.32.4 --single-branch laravel/framework

mkdir -p src/Illuminate/Support
#mkdir -p src/Illuminate/Support/Traits
mkdir -p src/Illuminate/Collections
mkdir -p src/Illuminate/Foundation
mkdir -p src/Illuminate/Container
mkdir -p src/Illuminate/Contracts/Container
mkdir -p src/Illuminate/Contracts/Config
mkdir -p src/Illuminate/Macroable/Traits
mkdir -p src/Illuminate/Config

cp laravel/framework/src/Illuminate/Support/Env.php src/Illuminate/Support/Env.php
#cp laravel/framework/src/Illuminate/Support/Traits/*.php src/Illuminate/Support/Traits/
cp laravel/framework/src/Illuminate/Macroable/Traits/*.php src/Illuminate/Macroable/Traits/
cp laravel/framework/src/Illuminate/Container/*.php src/Illuminate/Container/
cp laravel/framework/src/Illuminate/Contracts/Container/*.php src/Illuminate/Contracts/Container/
cp laravel/framework/src/Illuminate/Contracts/Config/*.php src/Illuminate/Contracts/Config/
cp laravel/framework/src/Illuminate/Config/*.php src/Illuminate/Config/
cp laravel/framework/src/Illuminate/Collections/*.php src/Illuminate/Collections/

cp laravel/framework/src/Illuminate/Support/helpers.php src/Illuminate/Support/helpers.php
cp laravel/framework/src/Illuminate/Foundation/helpers.php src/Illuminate/Foundation/helpers.php
