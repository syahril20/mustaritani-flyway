-- Drop broken policies (referencing non-existent columns)
DROP POLICY IF EXISTS "Gallery read (published)" ON public.gallery;
DROP POLICY IF EXISTS "Gallery modify (owner)" ON public.gallery;

-- Allow public read for all gallery items
CREATE POLICY "Gallery public read"
ON public.gallery
FOR SELECT
TO anon, authenticated
USING (true);
