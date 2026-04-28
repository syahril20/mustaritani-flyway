CREATE TABLE IF NOT EXISTS public.users
(
    id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name       VARCHAR(255)        NOT NULL,
    email      VARCHAR(255) UNIQUE NOT NULL,
    password   VARCHAR(255)        NOT NULL,
    salt       VARCHAR(255)        NOT NULL,
    role       VARCHAR(50) DEFAULT 'user' CHECK (role IN ('admin', 'user')),
    is_active  BOOLEAN     DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
