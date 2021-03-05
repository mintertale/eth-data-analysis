CREATE TABLE IF NOT EXISTS transactions (
  hash                        TEXT PRIMARY KEY,
  nonce                       BIGINT,
  transaction_index           BIGINT,
  from_address                TEXT,
  to_address                  TEXT,
  value                       NUMERIC(38),
  gas                         BIGINT,
  gas_price                   BIGINT,
  input                       TEXT,
  receipt_cumulative_gas_used BIGINT,
  receipt_gas_used            BIGINT,
  receipt_contract_address    TEXT,
  receipt_root                TEXT,
  receipt_status              BIGINT,
  block_timestamp             TIMESTAMP,
  block_number                BIGINT,
  block_hash                  TEXT
);

CREATE TABLE IF NOT EXISTS blocks (
  number            BIGINT,
  hash              TEXT PRIMARY KEY,
  parent_hash       TEXT,
  nonce             TEXT,
  sha3_uncles       TEXT,
  logs_bloom        TEXT,
  transactions_root TEXT,
  state_root        TEXT,
  receipts_root     TEXT,
  miner             TEXT,
  difficulty        NUMERIC(38),
  total_difficulty  NUMERIC(38),
  size              BIGINT,
  extra_data        TEXT,
  gas_limit         BIGINT,
  gas_used          BIGINT,
  timestamp         TIMESTAMP,
  transaction_count BIGINT
);

CREATE TABLE IF NOT EXISTS traces (
    transaction_hash TEXT,
    transaction_index bigint,
    from_address TEXT,
    to_address TEXT,
    value numeric(38),
    input TEXT,
    output TEXT,
    trace_type TEXT,
    call_type TEXT,
    reward_type TEXT,
    gas bigint,
    gas_used bigint,
    subtraces bigint,
    trace_address TEXT,
    error TEXT,
    status int,
    block_timestamp TIMESTAMP,
    block_number BIGINT,
    block_hash TEXT,
    trace_id TEXT PRIMARY KEY
);

