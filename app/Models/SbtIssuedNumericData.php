<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SbtIssuedNumericData extends Model
{
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_issued_numeric_data';
    protected $fillable = [
        'issued_list_id',
        'score',
        'collections_id',
        'address',
        'status'
    ];

    public function scoreGrowLog()
    {
        return $this->hasMany(SbtIssuedNumericGrowUpLog::class, 'data_id', 'id');

    }
}
