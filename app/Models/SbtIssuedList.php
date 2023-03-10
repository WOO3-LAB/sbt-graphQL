<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class SbtIssuedList extends Model
{


    const UPDATED_AT = null;
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_issued_list';


    public function levelData()
    {
        return $this->hasOne(SbtIssuedVariableData::class, 'issued_list_id', 'id');
    }

    public function scoreData()
    {
        return $this->hasOne(SbtIssuedNumericData::class, 'issued_list_id', 'id');

    }


    public function dao()
    {
        $instance = new Dao();
        $instance->setConnection('mysql');
        $query = $instance->newQuery();
        return new HasOne($query, $this, 'id', 'issuer_id');

    }

}
