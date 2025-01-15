Select * from TICKET_SALE_UPDATED;
Select * from TICKET_CATEGORY_UPDATED;


DROP TRIGGER apply_ticket_discount;

CREATE OR REPLACE TRIGGER apply_ticket_discount
BEFORE INSERT ON TICKET_SALE_UPDATED
FOR EACH ROW
DECLARE
  v_discountedPrice DECIMAL(10, 2);
  v_ticketType VARCHAR2(30);
  v_ticketQuantity NUMBER(4, 2);
  v_listedPrice DECIMAL(10, 2);
BEGIN
  
   SELECT ticketType, listedPrice
   INTO v_ticketType, v_listedPrice
   FROM TICKET_CATEGORY_UPDATED
   WHERE ticketCategoryID = :NEW.ticketcategoryID;

  IF v_listedPrice IS NOT NULL THEN
    v_discountedPrice := v_listedPrice * :NEW.ticketQuantity;

    IF v_ticketType IN ('General Admission','Regular') THEN
      IF :NEW.ticketQuantity <= 5 THEN
        v_discountedPrice := v_discountedPrice;
      ELSIF :NEW.ticketQuantity <= 10 THEN
        v_discountedPrice := v_discountedPrice * 0.95;
      ELSIF :NEW.ticketQuantity <= 20 THEN
        v_discountedPrice := v_discountedPrice * 0.85;
      ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Cannot purchase more than 20 tickets');
      END IF;
    ELSE
      v_discountedPrice := v_listedPrice * :NEW.ticketQuantity; 
    END IF;

    :NEW.purchasePrice := v_discountedPrice;
    
  END IF;
END;
/

commit;