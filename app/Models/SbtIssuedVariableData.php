<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SbtIssuedVariableData extends Model
{
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_issued_variable_data';
    protected $fillable = [
        'issued_list_id',
        'address', //持有者地址
        'collections_id',
        'status',
        'level_key',
        'level_grade',
        'level_name',
        'level_description',
        'level_image',
        'promoted',
    ];

    public function levelUpgradeLog()
    {
        return $this->hasMany(SbtIssuedVariableDataUpgradeLog::class, 'issued_list_id', 'issued_list_id');

    }

    public function issueList()
    {
        return $this->belongsTo(SbtIssuedList::class, 'issued_list_id', 'id');
    }

    public function addressUser()
    {
        $instance = new User();
        $instance->setConnection('mysql');
        $query = $instance->newQuery();
        return new BelongsTo($query, $this, 'address', 'address', 'addressUser');
    }
}
