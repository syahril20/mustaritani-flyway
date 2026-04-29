-- Tambah kolom role_id
ALTER TABLE public.users
    ADD COLUMN role_id UUID;

-- Set role_id berdasarkan nilai role lama
UPDATE public.users
SET role_id = '9960076d-9c86-4a5a-8b70-019f2d08601f'
WHERE role = 'admin';

UPDATE public.users
SET role_id = 'f59c9037-9ad2-4d0f-a775-63c03d84833b'
WHERE role = 'user' OR role IS NULL;

-- Set NOT NULL dan Foreign Key
ALTER TABLE public.users
    ALTER COLUMN role_id SET NOT NULL,
    ADD CONSTRAINT fk_users_role_id FOREIGN KEY (role_id) REFERENCES public.roles (id);

-- Hapus kolom role lama
ALTER TABLE public.users
    DROP COLUMN role;
