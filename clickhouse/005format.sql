CREATE TABLE nestedt
(
    `id` UInt8,
    `aux` Nested(
        a UInt8,
        b String
        )
)ENGINE = TinyLog;

INSERT INTO nestedt
Values (1, [1], ['a']);

SELECT *
FROM nestedt;

