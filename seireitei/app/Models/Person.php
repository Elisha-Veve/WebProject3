<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Person extends Model
{
    use HasFactory;

    protected $table = 'people';
    protected $guarded = ['id'];

    public function user()
    {
        return $this->morphOne(User::class, 'userable');
    }

    public function role(): HasOne
    {
        if ($this->hasOne(Lecturer::class, 'person_id')->exists()) {
            return $this->hasOne(Lecturer::class, 'person_id');
        } elseif ($this->hasOne(Student::class, 'person_id')->exists()) {
            return $this->hasOne(Student::class, 'person_id');
        } elseif ($this->hasOne(Assistant::class, 'person_id')->exists()) {
            return $this->hasOne(Assistant::class, 'person_id');
        }
    }
}
