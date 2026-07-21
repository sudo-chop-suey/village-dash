-- ─────────────────────────────────────────────────────────────
--  Village SF — Priority Funders shared board
--  Run this ONCE in Supabase: Dashboard → SQL Editor → New query
--  → paste all of this → Run.
-- ─────────────────────────────────────────────────────────────

-- One row per funder. The whole funder object lives in `data`,
-- so adding fields later never needs a migration.
create table if not exists public.prospects (
  id         text primary key,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

-- OPEN BOARD: anyone with the anon key may read and write.
-- (You chose the open setup. To lock this down later, swap these
--  four policies for auth-based ones and turn on Supabase Auth
--  logins — the app is already built to support that upgrade.)
alter table public.prospects enable row level security;

drop policy if exists "open read"   on public.prospects;
drop policy if exists "open insert" on public.prospects;
drop policy if exists "open update" on public.prospects;
drop policy if exists "open delete" on public.prospects;

create policy "open read"   on public.prospects for select using (true);
create policy "open insert" on public.prospects for insert with check (true);
create policy "open update" on public.prospects for update using (true) with check (true);
create policy "open delete" on public.prospects for delete using (true);

-- Let teammates see each other's changes without a hard refresh.
-- (Safe to re-run — ignores "already a member" if you run it twice.)
do $$
begin
  alter publication supabase_realtime add table public.prospects;
exception
  when duplicate_object then null;
end $$;
