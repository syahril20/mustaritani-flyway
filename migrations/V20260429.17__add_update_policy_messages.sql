DROP POLICY IF EXISTS "allow update messages" ON public.messages;
CREATE POLICY "allow update messages" ON public.messages
    FOR UPDATE USING (true);
