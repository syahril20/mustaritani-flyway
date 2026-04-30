ALTER TABLE public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_user_id_unique UNIQUE (user_id);
