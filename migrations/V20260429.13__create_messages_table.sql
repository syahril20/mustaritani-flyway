CREATE TABLE IF NOT EXISTS public.messages
(
    id              UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    conversation_id UUID         NOT NULL REFERENCES public.conversations (id) ON DELETE CASCADE,
    sender_type     VARCHAR(10)  NOT NULL CHECK (sender_type IN ('guest', 'admin')),
    sender_id       UUID REFERENCES public.users (id) ON DELETE SET NULL,
    content         TEXT         NOT NULL,
    created_at      TIMESTAMPTZ  DEFAULT NOW(),
    created_by      VARCHAR(100) DEFAULT 'system',
    updated_at      TIMESTAMPTZ  DEFAULT NOW(),
    updated_by      VARCHAR(100) DEFAULT 'system'
);

CREATE INDEX idx_messages_conversation_id ON public.messages (conversation_id);
