-- EDUGURU / Sistem Administrasi Pembelajaran V4.4.1
-- Jalankan sekali di Supabase > SQL Editor pada project yang dipakai aplikasi.
create extension if not exists pgcrypto;

create table if not exists public.schools (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  npsn text,
  address text,
  principal_name text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists public.classes (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  school_id uuid not null references public.schools(id) on delete cascade,
  name text not null,
  homeroom_teacher text,
  created_at timestamptz not null default now()
);
create table if not exists public.students (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  school_id uuid not null references public.schools(id) on delete cascade,
  class_id uuid references public.classes(id) on delete set null,
  nisn text,
  nis text,
  full_name text not null,
  gender text,
  archived boolean not null default false,
  created_at timestamptz not null default now()
);
create table if not exists public.app_settings (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  school_id uuid references public.schools(id) on delete cascade,
  setting_key text not null,
  setting_value jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  unique(owner_id, setting_key)
);

alter table public.schools enable row level security;
alter table public.classes enable row level security;
alter table public.students enable row level security;
alter table public.app_settings enable row level security;

drop policy if exists schools_owner_all on public.schools;
create policy schools_owner_all on public.schools for all to authenticated using (owner_id=auth.uid()) with check (owner_id=auth.uid());
drop policy if exists classes_owner_all on public.classes;
create policy classes_owner_all on public.classes for all to authenticated using (owner_id=auth.uid()) with check (owner_id=auth.uid());
drop policy if exists students_owner_all on public.students;
create policy students_owner_all on public.students for all to authenticated using (owner_id=auth.uid()) with check (owner_id=auth.uid());
drop policy if exists app_settings_owner_all on public.app_settings;
create policy app_settings_owner_all on public.app_settings for all to authenticated using (owner_id=auth.uid()) with check (owner_id=auth.uid());

create index if not exists schools_owner_idx on public.schools(owner_id);
create index if not exists classes_owner_school_idx on public.classes(owner_id,school_id);
create index if not exists students_owner_school_idx on public.students(owner_id,school_id);
create index if not exists app_settings_owner_key_idx on public.app_settings(owner_id,setting_key);
