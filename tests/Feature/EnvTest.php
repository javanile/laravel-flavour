<?php

test('testing env(...) function', function () {
    expect(env('UNKNOWN_ENVIRONMENT_VARIABLE'))->toBeNull()
        ->and(env('UNKNOWN_ENVIRONMENT_VARIABLE', 'undefined_variable_value'))
            ->toBeString()->toBe('undefined_variable_value');
});
