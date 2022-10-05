<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Course extends Model
{
    use HasFactory;

    protected $table = 'courses';
    protected $guarded = ['id'];

    public function students(): HasMany
    {
        return $this->hasMany(CourseStudent::class, 'course_id');
    }

    public function lecturers(): HasMany
    {
        return $this->hasMany(CourseLecturer::class, 'course_id');
    }

    public function assistants(): HasMany
    {
        return $this->hasMany(CourseAssistant::class, 'course_id');
    }
}
