<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Competence extends Model
{
    protected $table = 'competence';
    protected $fillable = [ 'id', 'name', 'description', 'page', 'xpos', 'ypos' ];
    protected $hidden = [];
}
