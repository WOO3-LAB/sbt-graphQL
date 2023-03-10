<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SbtIssuedVariableDataUpgradeLog extends Model
{
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_issued_variable_data_upgrade_log';
    protected $fillable = [
        'issued_list_id',
        'arweave_tx',
        'eth_chain_id',
        'eth_tx',
        'from_key',
        'to_key',
        'send_data',
        'tags_data',
    ];

    protected $casts = [
        "send_data" => 'array',
        "tags_data" => 'array',
    ];

}
