<?php

test('testing config(...) function', function () {
    //app()->instance('config', new \Illuminate\Config\Repository());
    $url = 'https://example.com';
    config(['app.url' => $url]);
    expect(config('app.url'))->toBe($url);
});
