CREATE TABLE IF NOT EXISTS public.conversations
(
    id            UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    guest_name    VARCHAR(255) NOT NULL,
    guest_phone   VARCHAR(50)  NOT NULL,
    guest_address TEXT         NOT NULL,
    status        VARCHAR(20)  NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'resolved')),
    assigned_to   UUID REFERENCES public.users (id) ON DELETE SET NULL,
    created_at    TIMESTAMPTZ  DEFAULT NOW(),
    created_by    VARCHAR(100) DEFAULT 'system',
    updated_at    TIMESTAMPTZ  DEFAULT NOW(),
    updated_by    VARCHAR(100) DEFAULT 'system'
);

CREATE INDEX idx_conversations_status ON public.conversations (status);
CREATE INDEX idx_conversations_assigned_to ON public.conversations (assigned_to);
