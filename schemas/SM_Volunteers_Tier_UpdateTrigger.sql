-- SM_Volunteers_Tier_UpdateTrigger() function statement
--DROP FUNCTION SM_Volunteers_Tier_UpdateTrigger()
--DROP TRIGGER SM_Volunteers_Tier_UpdateTrigger

CREATE FUNCTION SM_Volunteers_Tier_UpdateTrigger() RETURNS trigger AS
$BODY$
BEGIN
    IF NEW.campaign_count <> OLD.campaign_count AND NEW.campaign_count <= 2 THEN
        UPDATE SM_Volunteers
        SET tier = 1
        WHERE s_id = NEW.s_id;
    END IF;
    IF NEW.campaign_count <> OLD.campaign_count AND NEW.campaign_count >= 3 THEN
        UPDATE SM_Volunteers
        SET tier = 2
        WHERE s_id = NEW.s_id;
    END IF;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

-- SM_Volunteers_Tier_UpdateTrigger function
CREATE TRIGGER SM_Volunteers_Tier_UpdateTrigger
    AFTER UPDATE
    ON S_Members
    FOR EACH ROW
    EXECUTE PROCEDURE SM_Volunteers_Tier_UpdateTrigger();
