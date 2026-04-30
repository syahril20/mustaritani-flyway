-- RLS untuk tabel roles (read only untuk semua)
ALTER TABLE public.roles ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "allow select roles" ON public.roles;
CREATE POLICY "allow select roles" ON public.roles
    FOR SELECT USING (true);

-- RLS untuk tabel refresh_tokens
ALTER TABLE public.refresh_tokens ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "allow insert refresh_tokens" ON public.refresh_tokens;
CREATE POLICY "allow insert refresh_tokens" ON public.refresh_tokens
    FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "allow select refresh_tokens" ON public.refresh_tokens;
CREATE POLICY "allow select refresh_tokens" ON public.refresh_tokens
    FOR SELECT USING (true);

DROP POLICY IF EXISTS "allow update refresh_tokens" ON public.refresh_tokens;
CREATE POLICY "allow update refresh_tokens" ON public.refresh_tokens
    FOR UPDATE USING (true);

DROP POLICY IF EXISTS "allow delete refresh_tokens" ON public.refresh_tokens;
CREATE POLICY "allow delete refresh_tokens" ON public.refresh_tokens
    FOR DELETE USING (true);
