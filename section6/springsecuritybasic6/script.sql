CREATE TABLE `customer` (
    `idx` INT NOT NULL AUTO_INCREMENT,
    `display_name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `mobile_number` VARCHAR(20) NOT NULL,
    `password` VARCHAR(500) NOT NULL,
    `role` VARCHAR(100) NOT NULL,
    `create_at` DATE DEFAULT NULl,
    PRIMARY KEY(`idx`)
);

INSERT INTO `customer` (`display_name`, `email`, `mobile_number`, `password`, `role`, `create_at`)
VALUES ('Happy', 'happy@example.com', '9876548337', '$2y$12$oRRbkNfwuR8ug4MlzH5FOeui.//1mkd.RsOAJMbykTSupVy.x/vb2', 'admin', CURDATE());

CREATE TABLE `accounts` (
    `idx` INT NOT NULL,

)