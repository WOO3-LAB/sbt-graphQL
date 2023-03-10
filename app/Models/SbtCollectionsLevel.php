<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SbtCollectionsLevel extends Model
{
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_collections_level';
    protected $fillable = [
        'cid',
        'collections_id',
        'name',
        'amount',
        'issued_amount',
        'key',
        'image',
        'grade',
        'task_data',
        'status',
        'description',
    ];

    protected $casts = [
        'task_data' => 'array',
    ];

}
