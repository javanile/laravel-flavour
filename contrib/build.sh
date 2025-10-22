#!/usr/bin/env bash


[ ! -d laravel/framework ] && git clone https://github.com/laravel/framework --branch v12.32.4 --single-branch laravel/framework

mkdir -p src/Illuminate/Support

cp laravel/framework/src/Illuminate/Support/helpers.php src/Illuminate/Support/helpers.php
