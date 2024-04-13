INSERT INTO
    `tpa_users` (
        `email`,
        `lastname`,
        `firstname`,
        `user_password`,
        `roles_id`
    )
VALUES
    (
        'ecorbisier.simplon@gmail.com',
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