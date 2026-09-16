CREATE TABLE orders(
 id int,
 number int,
 total_price money
)
ALTER TABLE orders
ADD CONSTRAINT DF_total_price DEFAULT 0 --index
go
ALTER TABLE orders
ADD CONSTRAINT chkRowCount --index
CHECK (Len(total_price) >= 1);