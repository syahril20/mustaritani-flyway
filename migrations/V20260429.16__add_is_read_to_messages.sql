ALTER TABLE public.messages
    ADD COLUMN IF NOT EXISTS is_read BOOLEAN DEFAULT false;

-- Pesan dari admin dianggap sudah terbaca
UPDATE public.messages SET is_read = true WHERE sender_type = 'admin';
