<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Selection extends Model
{
    protected $table = 'selection';
    protected $fillable = [ 'subject_fk', 'profile_fk', 'competence_fk', 'value' ];
    protected $hidden = [];
}
