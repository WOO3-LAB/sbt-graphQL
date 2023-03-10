<?php

namespace App\GraphQL\Queries;

class Hello
{
    public function __invoke(): array
    {
        return ["a" => 'world!', "b" => 'world!', "c" => 'world!'];
    }
    
}
