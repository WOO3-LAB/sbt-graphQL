<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SbtIssuedListDestroyed extends Model
{
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_issued_list_destroyed';
    const UPDATED_AT = null;
    protected $fillable = [
        'collections_id',
        'token_id',
        'destroy_time',
        'eth_tx',
        'eth_chain_id',
        'description',
    ];

}
