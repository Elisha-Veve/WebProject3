<?php

namespace App\Http\Controllers;

use App\Events\NewMessageSent;
use App\Http\Requests\GetChatMessageRequest;
use App\Http\Requests\StoreChatMessageRequest;
use App\Models\Chat;
use App\Models\ChatMessage;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\User;

class ChatMessageController extends Controller
{
    public function index(GetChatMessageRequest $request)
    {
        $data = $request->validated();
        $chatId = $data['chat_id'];
        $currentPage = $data['page'];
        $perPage = $data['per_page'] ?? 15;

        $messages = ChatMessage::where('chat_id', $chatId)
            ->with('user')
            ->latest('created_at')
            ->simplePaginate(
                $perPage,
                ['*'],
                'page',
                $currentPage
            );

        return $this->success($messages->getCollection());
    }


    public function store(StoreChatMessageRequest $request): JsonResponse
    {
        $data = $request->validated();
        $chatId = $data['chat_id'];
        $message = $data['message'];
        $userId = auth()->user()->id;

        $chatMessage = ChatMessage::create([
            'chat_id' => $chatId,
            'sent_by' => $userId,
            'message' => $message
        ]);

        $chatMessage->refresh()->load('user');
        // TODO send broadcast event to pusher and send notification to one signal

        $this->sendNotificationToOther($chatMessage);
        return $this->success($chatMessage);
    }

    public function sendNotificationToOther(ChatMessage $chatMessage): void
    {
        broadcast(new NewMessageSent($chatMessage))->toOthers();

        $user = auth()->user();
        $userId = $user->id;

        $chat = Chat::where('id', $chatMessage->chat_id)->with(['chatMembers' => function ($query) use ($userId) {
            $query->where('user_id', '!=', $userId);
        }])->first();

        if (count($chat->chatMembers) > 0) {
            $otherUserId = $chat->chatMembers[0]->user_id;
            $otherUser = User::where('id', $otherUserId)->first();
            $otherUser->sendNewMessageNotification(
                ['messageData' => [
                    'senderName' => $user->username,
                    'message' => $chatMessage->message,
                    'chatId' => $chatMessage->chat_id,
                ]]
            );
        }
    }
}
