<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\User;

class Lesson extends Model
{
    use SoftDeletes;
	
	protected $table = 'lessons';
	
	protected $hidden = [
        
    ];

	protected $guarded = [];

	protected $dates = ['deleted_at'];


	public function course()
    {
        return $this->belongsTo(Course::class, 'course_id')->withTrashed();
    }

    public function students()
    {
        return $this->belongsToMany('App\User', 'lesson_students')->withTimestamps();
    }

    public function learning_objects()
    {
        return $this->hasMany(Learning_Object::class)->orderBy('id');
    }
}
