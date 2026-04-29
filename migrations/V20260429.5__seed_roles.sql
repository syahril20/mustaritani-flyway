INSERT INTO public.roles (id, name)
VALUES
    ('9960076d-9c86-4a5a-8b70-019f2d08601f', 'admin'),
    ('f59c9037-9ad2-4d0f-a775-63c03d84833b', 'user')
ON CONFLICT (name) DO NOTHING;
