<?php

namespace App\GraphQL\Queries;

class User
{
    public function __invoke(): array
    {
        return ["id" => 'world!', "name" => 'world!'];
    }
}
