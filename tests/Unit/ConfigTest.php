<?php

test('config is a function', function () {
    expect(function_exists('config'))->toBeTrue();
});
