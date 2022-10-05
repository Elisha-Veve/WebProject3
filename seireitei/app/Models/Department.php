<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory;

    protected $table = 'departments';
    protected $guarded = ['id'];

    public function courses()
    {
        return $this->hasMany(Course::class, 'department_id');
    }

    public function students()
    {
        return $this->hasMany(Student::class, 'department_id');
    }

    public function lecturers()
    {
        return $this->hasMany(Lecturer::class, 'department_id');
    }
}
