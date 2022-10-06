<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Chat extends Model
{
    use HasFactory;

    protected $table = 'chats';
    protected $guarded = ['id'];

    public function chatMembers(): HasMany
    {
        return $this->hasMany(ChatMember::class, 'chat_id');
    }
    public function chatMessages(): HasMany
    {
        return $this->hasMany(ChatMessage::class, 'chat_id');
    }
    public function lastMessage(): HasOne
    {
        return $this->hasOne(ChatMessage::class, 'chat_id')->latest();
    }

    public function createdBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function scopeHasMember($query, int $user_id)
    {
        return $query->whereHas('chatMembers', function ($q) use ($user_id) {
            $q->where('user_id', $user_id);
        });
    }
}
