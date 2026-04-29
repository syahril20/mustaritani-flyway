-- Tambah audit columns ke tabel users
ALTER TABLE public.users
    ADD COLUMN IF NOT EXISTS created_by VARCHAR(100) DEFAULT 'system',
    ADD COLUMN IF NOT EXISTS updated_by VARCHAR(100) DEFAULT 'system';

-- Tambah audit columns ke tabel roles
ALTER TABLE public.roles
    ADD COLUMN IF NOT EXISTS created_by VARCHAR(100) DEFAULT 'system',
    ADD COLUMN IF NOT EXISTS updated_by VARCHAR(100) DEFAULT 'system';
