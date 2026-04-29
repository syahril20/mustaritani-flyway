-- Ubah tipe kolom dari UUID ke VARCHAR di roles
ALTER TABLE public.roles
    ALTER COLUMN created_by TYPE VARCHAR(100) USING NULL,
    ALTER COLUMN updated_by TYPE VARCHAR(100) USING NULL;

-- Ubah tipe kolom dari UUID ke VARCHAR di users
ALTER TABLE public.users
    ALTER COLUMN created_by TYPE VARCHAR(100) USING NULL,
    ALTER COLUMN updated_by TYPE VARCHAR(100) USING NULL;

-- Backfill existing data
UPDATE public.roles
SET created_by = 'system',
    updated_by = 'system'
WHERE created_by IS NULL
   OR updated_by IS NULL;

UPDATE public.users
SET created_by = 'system',
    updated_by = 'system'
WHERE created_by IS NULL
   OR updated_by IS NULL;

-- Set default untuk rows baru
ALTER TABLE public.roles
    ALTER COLUMN created_by SET DEFAULT 'system',
    ALTER COLUMN updated_by SET DEFAULT 'system';

ALTER TABLE public.users
    ALTER COLUMN created_by SET DEFAULT 'system',
    ALTER COLUMN updated_by SET DEFAULT 'system';
