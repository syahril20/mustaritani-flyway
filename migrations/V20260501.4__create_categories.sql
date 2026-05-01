CREATE TABLE IF NOT EXISTS public.categories (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now() NOT NULL
);

INSERT INTO public.categories (name)
VALUES ('Buah'), ('Sayur'), ('Hias'), ('Bibit')
ON CONFLICT (name) DO NOTHING;

-- Backfill existing gallery rows without category
UPDATE public.gallery SET category = 'Buah' WHERE category IS NULL OR category = '';

ALTER TABLE public.gallery ALTER COLUMN category SET NOT NULL;
ALTER TABLE public.gallery ALTER COLUMN category SET DEFAULT 'Buah';
