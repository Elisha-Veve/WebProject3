<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Notifications\MessageSent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'users';
    protected $guarded = ['id'];


    protected $hidden = [
        'password',
        'remember_token',
    ];


    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    const AUTH_TOKEN = 'userToken';
    public function chats(): HasMany
    {
        return $this->hasMany(Chat::class, 'created_by');
    }
    public function chatMessages(): HasMany
    {
        return $this->hasMany(ChatMessage::class, 'sent_by');
    }
    public function lastMessage(): HasMany
    {
        return $this->hasMany(ChatMessage::class, 'sent_by')->latest();
    }

    public function routeNotificationForOneSignal(): array
    {
        return [
            'tags' => [
                'key' => 'user_id',
                'relation' => '=',
                'value' => (string)(1)
            ]
        ];
    }

    public function sendNewMessageNotification($data): void
    {
        $this->notify(new MessageSent($data));
    }
}
