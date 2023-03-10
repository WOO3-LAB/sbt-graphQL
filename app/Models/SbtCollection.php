<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class SbtCollection extends Model
{
    public $incrementing = false;
    protected $connection = 'sbt_mysql';
    protected $table = 'sbt_collections';
    protected $fillable = [
        'id',
        'arweave_tx',
        'name',
        'type',
        'description',
        'image',
        'issuer_name',
        'issuer_id',
        'managers',
        'max_amount',
        'issued_amount', //用户已经持有，此值才增长
        'destroyed_amount',
        'distribute_amount', //仅 custom sbt 需用此值 ，管理员分发出去就增长，但分发出去 不代表用户已持有，需要认领之后持有
        //  所以始终 issued_amount<=distribute_amount
        'no_end_time',
        'start_time',
        'end_time',
        'validity_period', //有效期，以日为单位
        'get_rules',
        'init_score',
        'data_source',
        'owner',
        'status',
        'membership_tag',
        'to_discord_role',
        'to_discord_role_type',
    ];
    protected $casts = [
        'managers' => 'array',
        'data_source' => 'array',
    ];


    public function collectionLevel()
    {
        return $this->hasMany(SbtCollectionsLevel::class, 'collections_id', 'id');
    }


}



