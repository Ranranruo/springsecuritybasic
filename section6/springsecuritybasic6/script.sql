
CREATE TABLE `customer` (
    `customer_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `mobile_number` VARCHAR(20) NOT NULL,
    `pwd` VARCHAR(500) NOT NULL,
    `role` VARCHAR(100) NOT NULL,
    `create_dt` DATE DEFAULT NULl,
    PRIMARY KEY(`customer_id`)
);

INSERT INTO `customer` (`name`, `email`, `mobile_number`, `pwd`, `role`, `create_dt`)
VALUES ('Happy', 'happy@example.com', '9876548337', '$2y$12$oRRbkNfwuR8ug4MlzH5FOeui.//1mkd.RsOAJMbykTSupVy.x/vb2', 'admin', CURDATE());

CREATE TABLE accounts (
  customer_id INT NOT NULL,
  account_number BIGINT NOT NULL,
  account_type VARCHAR(100) NOT NULL,
  branch_address VARCHAR(200) NOT NULL,
  create_dt DATE DEFAULT NULL,
  PRIMARY KEY (account_number),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO accounts (customer_id, account_number, account_type, branch_address, create_dt)
VALUES (1, 186576453434, 'Savings', '123 Main Street, New York', CURRENT_DATE)

CREATE TABLE account_transactions (
  transaction_id VARCHAR(200) NOT NULL,
  account_number BIGINT NOT NULL,  -- BIGINT로 변경
  customer_id INT NOT NULL,
  transaction_dt DATE NOT NULL,
  transaction_summary VARCHAR(200) NOT NULL,
  transaction_type VARCHAR(100) NOT NULL,
  transaction_amt INT NOT NULL,
  closing_balance INT NOT NULL,
  create_dt DATE DEFAULT NULL,
  PRIMARY KEY (transaction_id),
  FOREIGN KEY (account_number) REFERENCES accounts (account_number) ON DELETE CASCADE,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (UUID(), 1865764534, 1, DATEADD('DAY', -7, CURRENT_DATE), 'Coffee Shop', 'Withdrawal', 30, 34500, DATEADD('DAY', -7, CURRENT_DATE));

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (UUID(), 1865764534, 1, DATEADD('DAY', -6, CURRENT_DATE), 'Uber', 'Withdrawal', 100, 34400, DATEADD('DAY', -6, CURRENT_DATE));

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (UUID(), 1865764534, 1, DATEADD('DAY', -5, CURRENT_DATE), 'Self Deposit', 'Deposit', 500, 34900, DATEADD('DAY', -5, CURRENT_DATE));

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (UUID(), 1865764534, 1, DATEADD('DAY', -4, CURRENT_DATE), 'Ebay', 'Withdrawal', 600, 34300, DATEADD('DAY', -4, CURRENT_DATE));

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (UUID(), 1865764534, 1, DATEADD('DAY', -2, CURRENT_DATE), 'OnlineTransfer', 'Deposit', 700, 35000, DATEADD('DAY', -2, CURRENT_DATE));

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (UUID(), 1865764534, 1, DATEADD('DAY', -1, CURRENT_DATE), 'Amazon.com', 'Withdrawal', 100, 34900, DATEADD('DAY', -1, CURRENT_DATE));

CREATE TABLE loans (
  loan_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- H2에서는 AUTO_INCREMENT 대신 IDENTITY 사용
  customer_id INT NOT NULL,
  start_dt DATE NOT NULL,
  loan_type VARCHAR(100) NOT NULL,
  total_loan INT NOT NULL,
  amount_paid INT NOT NULL,
  outstanding_amount INT NOT NULL,
  create_dt DATE DEFAULT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');

CREATE TABLE cards (
  card_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- H2에서는 AUTO_INCREMENT 대신 IDENTITY 사용
  card_number VARCHAR(100) NOT NULL,
  customer_id INT NOT NULL,
  card_type VARCHAR(100) NOT NULL,
  total_limit INT NOT NULL,
  amount_used INT NOT NULL,
  available_amount INT NOT NULL,
  create_dt DATE DEFAULT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, CURRENT_DATE);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('3455XXXX8673', 1, 'Credit', 7500, 600, 6900, CURRENT_DATE);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('2359XXXX9346', 1, 'Credit', 20000, 4000, 16000, CURRENT_DATE);


CREATE TABLE notice_details (
  notice_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- H2에서는 AUTO_INCREMENT 대신 IDENTITY 사용
  notice_summary VARCHAR(200) NOT NULL,
  notice_details VARCHAR(500) NOT NULL,
  notic_beg_dt DATE NOT NULL,
  notic_end_dt DATE DEFAULT NULL,
  create_dt DATE DEFAULT NULL,
  update_dt DATE DEFAULT NULL
);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Home Loan Interest rates reduced', 'Home loan interest rates are reduced as per the government guidelines. The updated rates will be effective immediately',
CURRENT_DATE - INTERVAL '30' DAY, CURRENT_DATE + INTERVAL '30' DAY, CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Net Banking Offers', 'Customers who will opt for Internet banking while opening a saving account will get a $50 amazon voucher',
CURRENT_DATE - INTERVAL '30' DAY, CURRENT_DATE + INTERVAL '30' DAY, CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Mobile App Downtime', 'The mobile application of the EazyBank will be down from 2AM-5AM on 12/05/2020 due to maintenance activities',
CURRENT_DATE - INTERVAL '30' DAY, CURRENT_DATE + INTERVAL '30' DAY, CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('E Auction notice', 'There will be a e-auction on 12/08/2020 on the Bank website for all the stubborn arrears. Interested parties can participate in the e-auction',
CURRENT_DATE - INTERVAL '30' DAY, CURRENT_DATE + INTERVAL '30' DAY, CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Launch of Millennia Cards', 'Millennia Credit Cards are launched for the premium customers of EazyBank. With these cards, you will get 5% cashback for each purchase',
CURRENT_DATE - INTERVAL '30' DAY, CURRENT_DATE + INTERVAL '30' DAY, CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('COVID-19 Insurance', 'EazyBank launched an insurance policy which will cover COVID-19 expenses. Please reach out to the branch for more details',
CURRENT_DATE - INTERVAL '30' DAY, CURRENT_DATE + INTERVAL '30' DAY, CURRENT_DATE, NULL);

CREATE TABLE contact_messages (
  contact_id VARCHAR(50) NOT NULL,
  contact_name VARCHAR(50) NOT NULL,
  contact_email VARCHAR(100) NOT NULL,
  subject VARCHAR(500) NOT NULL,
  message VARCHAR(2000) NOT NULL,
  create_dt DATE DEFAULT NULL,
  PRIMARY KEY (contact_id)
);
