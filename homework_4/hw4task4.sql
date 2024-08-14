create or replace view v_rec_level_partition_info as
with recursive partition_hierarchy as (
    select
        nsp_child.nspname as child_schema,
        child.relname as child_table,
        nsp_parent.nspname as parent_schema,
        parent.relname as parent_table,
        1 as part_level,
        parent.oid as parent_id,
        child.oid as child_id
    from pg_inherits as inherits
        inner join pg_class as child on inherits.inhrelid = child.oid
        inner join pg_class as parent on inherits.inhparent = parent.oid
        inner join pg_namespace as nsp_child on child.relnamespace = nsp_child.oid
        inner join pg_namespace as nsp_parent on parent.relnamespace = nsp_parent.oid

    union all

    select
        partition_hierarchy.child_schema,
        partition_hierarchy.child_table,
        nsp.nspname,
        class.relname,
        partition_hierarchy.part_level + 1,
        class.oid,
        partition_hierarchy.child_id
    from partition_hierarchy
        inner join pg_inherits as inherits on inherits.inhrelid = partition_hierarchy.parent_id
        inner join pg_class as class on inherits.inhparent = class.oid
        inner join pg_namespace as nsp on class.relnamespace = nsp.oid)
select part_level,
       parent_schema,
       parent_table,
       child_schema,
       child_table
from partition_hierarchy
order by
    part_level,
    parent_schema,
    parent_table,
    child_schema,
    child_table;