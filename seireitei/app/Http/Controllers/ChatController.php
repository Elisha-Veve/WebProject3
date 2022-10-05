<?php

namespace App\Http\Controllers;

use App\Http\Requests\GetChatRequest;
use App\Http\Requests\StoreChatRequest;
use Illuminate\Http\Request;
use App\Models\Chat;
use Illuminate\Http\JsonResponse;
use App\Models\User;

class ChatController extends Controller
{
    public function index(GetChatRequest $request): JsonResponse
    {
        $data = $request->validated();
        $is_group_chat = false;
        if ($request->has('is_group_chat')) {
            $is_group_chat = $data['is_group_chat'];
        }


        $chats = Chat::where('is_group_chat', $is_group_chat)
            ->hasMember(auth()->user()->id)
            ->whereHas('chatMessages')
            ->with('lastMessage.user', 'chatMembers.user')
            ->latest('updated_at')->get();

        return $this->success($chats);
    }


    public function store(StoreChatRequest $request)
    {
        $data = $this->prepareStoreData($request);
        if ($data['user_id'] == $data['otherUserId']) {
            return $this->error(null, 'You cannot chat with yourself', 400);
        }
        $previousChat = $this->getPreviousChat($data['otherUserId']);
        if ($previousChat == null) {
            $chat = Chat::create($data['data']);
            $chat->chatMembers()->createMany(
                [
                    [
                        'user_id' => $data['userId'],
                    ],
                    [
                        'user_id' => $data['otherUserId']
                    ]
                ]
            );

            $chat->refresh()->load('lastMessage.user', 'chatMembers.user');
            return $this->success($chat);
        }
        return $this->success($previousChat->load('lastMessage.user', 'chatMembers.user'));
    }

    private function getPreviousChat($otherUserId): mixed
    {
        $userId = auth()->user()->id;
        return Chat::where('is_group_chat', false)->whereHas('chatMembers', function ($query) use ($userId, $otherUserId) {
            $query->where('user_id', $userId)->orWhere('user_id', $otherUserId);
        })->first();
    }

    private function prepareStoreData(StoreChatRequest $request): array
    {
        $data = $request->validated();
        $otherUserId = (int)$data['user_id'];
        unset($data['user_id']);
        $data['created_by'] = auth()->user()->id;

        return [
            'data' => $data,
            'user_id' => auth()->user()->id,
            'otherUserId' => $otherUserId
        ];
    }
    public function show(Chat $chat): JsonResponse
    {
        $chat->load('lastMessage.user', 'chatMembers.user');

        if (!$chat) {
            return $this->error(null, 'Chat not found', 404);
        }

        return $this->success($chat);
    }
}
