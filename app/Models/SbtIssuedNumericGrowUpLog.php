<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SbtIssuedNumericGrowUpLog extends Model
{
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_issued_numeric_grow_up_log';
    protected $fillable = [
        'data_id',
        'add_score',
        'type',
        'arweave_tx',
        'eth_tx',
        'eth_chain_id',
        'remark',
    ];

}
