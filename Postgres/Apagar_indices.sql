DO
$$BEGIN
EXECUTE (
  SELECT 'DROP INDEX ' || string_agg(indexrelid::regclass::text, ', ')
  FROM pg_index i
  LEFT JOIN pg_depend d ON d.objid = i.indexrelid
  AND d.deptype = 'i'
  WHERE i.indrelid = 'schema.tabela'::regclass
  AND d.objid IS NULL
);
END$$;

 
