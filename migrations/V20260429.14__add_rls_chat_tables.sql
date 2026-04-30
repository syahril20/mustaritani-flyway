-- RLS conversations
ALTER TABLE public.conversations ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "allow insert conversations" ON public.conversations;
CREATE POLICY "allow insert conversations" ON public.conversations
    FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "allow select conversations" ON public.conversations;
CREATE POLICY "allow select conversations" ON public.conversations
    FOR SELECT USING (true);

DROP POLICY IF EXISTS "allow update conversations" ON public.conversations;
CREATE POLICY "allow update conversations" ON public.conversations
    FOR UPDATE USING (true);

-- RLS messages
ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "allow insert messages" ON public.messages;
CREATE POLICY "allow insert messages" ON public.messages
    FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "allow select messages" ON public.messages;
CREATE POLICY "allow select messages" ON public.messages
    FOR SELECT USING (true);
