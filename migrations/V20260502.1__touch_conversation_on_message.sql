-- Trigger: conversations.updated_at auto-update on UPDATE
CREATE OR REPLACE TRIGGER trigger_conversations_updated_at
    BEFORE UPDATE ON public.conversations
    FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

-- Function: bump conversations.updated_at setiap pesan baru masuk
CREATE OR REPLACE FUNCTION touch_conversation_on_message()
    RETURNS TRIGGER AS $$
BEGIN
    UPDATE public.conversations
    SET updated_at = NOW()
    WHERE id = NEW.conversation_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_touch_conversation_on_message
    AFTER INSERT ON public.messages
    FOR EACH ROW
EXECUTE FUNCTION touch_conversation_on_message();

-- Backfill: set updated_at ke waktu pesan terakhir untuk conversation yang sudah ada
UPDATE public.conversations c
SET updated_at = (
    SELECT MAX(m.created_at)
    FROM public.messages m
    WHERE m.conversation_id = c.id
)
WHERE EXISTS (
    SELECT 1 FROM public.messages m WHERE m.conversation_id = c.id
);
