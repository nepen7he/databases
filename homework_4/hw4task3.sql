create or replace view v_first_level_partition_info as
select
    parent_ns.nspname as parent_schema,
    parent_tbl.relname as parent_table,
    child_ns.nspname as child_schema,
    child_tbl.relname as child_table
from
    pg_inherits
    join pg_class parent_tbl on pg_inherits.inhparent = parent_tbl.oid
    join pg_namespace parent_ns on parent_tbl.relnamespace = parent_ns.oid
    join pg_class child_tbl on pg_inherits.inhrelid = child_tbl.oid
    join pg_namespace child_ns on child_tbl.relnamespace = child_ns.oid
where
    parent_tbl.relkind = 'r'
    and child_tbl.relkind = 'r'
    and parent_ns.nspname || '.' || parent_tbl.relname = 'public.people_partitioned'
    and not exists (
        select 1 from pg_inherits i2 where i2.inhparent = child_tbl.oid
    )
order by
    child_schema,
    child_table;