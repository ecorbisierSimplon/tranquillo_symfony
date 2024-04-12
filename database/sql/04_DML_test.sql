-- Active: 1712355755551@@localhost@3306@tranquillo
INSERT INTO
    `tpa_users` (
        `email`,
        `lastname`,
        `firstname`,
        `user_password`,
        `roles_code`
    )
VALUES
    (
        'emploi@corbisier.fr',
        'CORBISIER',
        'Eric',
        '1234',
        (
            SELECT
                role_id
            FROM
                tpa_roles r
            WHERE
                r.role_code = 'role@webmaster'
        )
    );