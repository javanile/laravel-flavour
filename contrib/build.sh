#!/usr/bin/env bash
set -e

[ ! -d laravel/framework ] && git clone https://github.com/laravel/framework --branch v12.32.4 --single-branch laravel/framework

mkdir -p src/Illuminate/Support
mkdir -p src/Illuminate/Collections
mkdir -p src/Illuminate/Foundation

cp laravel/framework/src/Illuminate/Support/Env.php src/Illuminate/Support/Env.php

cp laravel/framework/src/Illuminate/Support/helpers.php src/Illuminate/Support/helpers.php
cp laravel/framework/src/Illuminate/Collections/helpers.php src/Illuminate/Collections/helpers.php
cp laravel/framework/src/Illuminate/Foundation/helpers.php src/Illuminate/Foundation/helpers.php
