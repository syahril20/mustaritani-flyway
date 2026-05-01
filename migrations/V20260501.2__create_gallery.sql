CREATE TABLE IF NOT EXISTS public.gallery (
  id           UUID        DEFAULT gen_random_uuid() PRIMARY KEY,
  title        TEXT,
  image_url    TEXT        NOT NULL,
  storage_path TEXT        NOT NULL,
  created_at   TIMESTAMPTZ DEFAULT now() NOT NULL
);

-- Storage bucket (public read)
INSERT INTO storage.buckets (id, name, public)
VALUES ('gallery', 'gallery', true)
ON CONFLICT (id) DO NOTHING;

-- Public read policy for gallery storage
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'storage' AND tablename = 'objects' AND policyname = 'Gallery public read'
  ) THEN
    CREATE POLICY "Gallery public read" ON storage.objects
      FOR SELECT USING (bucket_id = 'gallery');
  END IF;
END $$;
