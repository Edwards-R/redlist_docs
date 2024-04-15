-- Create the schema to put everything into
CREATE SCHEMA bwars_redlist;

-- Refresh sur_mat so we're working on the latest (when we call it)
REFRESH MATERIALIZED VIEW sur_mat;