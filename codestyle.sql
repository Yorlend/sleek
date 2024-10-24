-- К чему стремимся + для тестов
-- CREATE OR REPLACE FUNCTION foo (
--     p_first_param       UUID,
--     p_second_param      UUID,
--     p_third_param       VARCHAR
-- ) RETURNS TABLE (
--     po_first_param      VARCHAR,
--     po_second_param     VARCHAR
-- )
-- LANGUAGE plpgsql
-- AS
-- $$
-- DECLARE
--     v_tmp   BIGINT;
-- BEGIN
--     RETURN QUERY
--         SELECT
--             one AS po_one,
--             two AS po_two,
--             three AS po_three
--         FROM test_table_1 AS tt1
--             INNER JOIN test_table_2 AS tt2
--                 ON tt2.uid = tt1.object_uid
--                 AND tt2.is_active
--             LEFT JOIN test_table_3 AS tt3
--                 ON TRUE
--         WHERE
--             name = 'reserved'
--             AND age > 10
--             OR (
--                 name = 'something'
--                 AND age < 20
--             );
-- END;
-- $$;
--
-- ALTER FUNCTION              foo OWNER TO postgres;
-- GRANT EXECUTE ON FUNCTION   foo TO postgres;
-- REVOKE ALL ON FUNCTION      foo FROM public;

CREATE OR REPLACE FUNCTION foo (
    p_first_param       UUID,
    p_second_param      UUID,
    p_third_param       VARCHAR
) RETURNS TABLE (
    po_first_param      VARCHAR,
    po_second_param     VARCHAR
)
LANGUAGE plpgsql
AS
$$
DECLARE
    v_tmp   BIGINT;
BEGIN
    RETURN QUERY
        SELECT
            one AS po_one,
            two AS po_two,
            three AS po_three
        FROM test_table_1 AS tt1
            INNER JOIN test_table_2 AS tt2
                ON tt2.uid = tt1.object_uid
                AND tt2.is_active
            LEFT JOIN test_table_3 AS tt3
                ON TRUE
        WHERE
            name = 'reserved'
            AND age > 10
            OR (
                name = 'something'
                AND age < 20
            );
END;
$$;

ALTER FUNCTION              foo OWNER TO postgres;
GRANT EXECUTE ON FUNCTION   foo TO postgres;
REVOKE ALL ON FUNCTION      foo FROM public;

SELECT main.get_func (
    p_in => 'some value',
    p_cnt => 12
);

