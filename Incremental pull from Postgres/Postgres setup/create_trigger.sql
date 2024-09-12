CREATE OR REPLACE FUNCTION update_sales_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_sales_updated_at_trigger
BEFORE UPDATE ON public.sales
FOR EACH ROW
EXECUTE FUNCTION update_sales_updated_at();