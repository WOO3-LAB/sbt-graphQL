<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SbtCollectionsDestroyed extends Model
{
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_collections_destroyed';
    const UPDATED_AT = null;
    protected $fillable = [
        'collections_id',
        'destroy_time',
        'arweave_tx',
        'description',
    ];

}
