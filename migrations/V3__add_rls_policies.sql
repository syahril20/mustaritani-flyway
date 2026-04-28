ALTER TABLE public.users
    ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "allow insert" ON public.users;
CREATE POLICY "allow insert" ON public.users
    FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "allow select" ON public.users;
CREATE POLICY "allow select" ON public.users
    FOR SELECT USING (true);
