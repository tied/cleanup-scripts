-- If you have a huge number of customisation
-- with scripts, SQL scripts to SLA you can meet with inconsistency


-- let's check consistency 2 tables
-- query via NOT IN
SELECT count(*)
FROM "AO_54307E_SLAAUDITLOG"
where "ID" not in (SELECT "SLA_AUDIT_LOG_ID"
                    FROM "AO_54307E_SLAAUDITLOGDATA");

-- query via Left Join
SELECT count(*)
FROM "AO_54307E_SLAAUDITLOG"  AL
LEFT JOIN "AO_54307E_SLAAUDITLOGDATA" AD
        ON AD."SLA_AUDIT_LOG_ID" = AL."ID"
WHERE AD."SLA_AUDIT_LOG_ID" is null;


/*
    -- not recommended for pgsql
    DELETE
    FROM "AO_54307E_SLAAUDITLOG"
    WHERE "ID" not in (SELECT "SLA_AUDIT_LOG_ID"
                    FROM "AO_54307E_SLAAUDITLOGDATA");
*/


SELECT count(*)
FROM "AO_54307E_SLAAUDITLOGDATA"
WHERE "SLA_AUDIT_LOG_ID" NOT IN (SELECT "ID"
			                    FROM "AO_54307E_SLAAUDITLOG")
			                    ;


SELECT count("SLA_AUDIT_LOG_ID")
FROM "AO_54307E_SLAAUDITLOGDATA" AD
LEFT JOIN "AO_54307E_SLAAUDITLOG" AL
    ON AD."SLA_AUDIT_LOG_ID" = AL."ID"
WHERE AL."ID" is null;





-- Let's cleanup older than 4 months audit logs in one transaction

SELECT count("SLA_AUDIT_LOG_ID")
FROM "AO_54307E_SLAAUDITLOGDATA" AD
where "SLA_AUDIT_LOG_ID" in (select "ID"
                FROM "AO_54307E_SLAAUDITLOG"
                WHERE to_timestamp("EVENT_TIME"/1000) < NOW() - INTERVAL '120 days');


SELECT count(*)
FROM "AO_54307E_SLAAUDITLOG"
WHERE to_timestamp("EVENT_TIME"/1000) < NOW() - INTERVAL '120 days';





-- detect orphaned SLA Audit log
SELECT count("SLA_AUDIT_LOG_ID")
FROM "AO_54307E_SLAAUDITLOGDATA"
WHERE "SLA_AUDIT_LOG_ID" in (SELECT "ID"
                             FROM "AO_54307E_SLAAUDITLOG"
                             WHERE "ISSUE_ID" is null);

SELECT count(*)
FROM "AO_54307E_SLAAUDITLOG"
WHERE "ISSUE_ID" is null;


/*
DELETE
FROM "AO_54307E_SLAAUDITLOGDATA"
WHERE "SLA_AUDIT_LOG_ID" in (SELECT "ID"
                             FROM "AO_54307E_SLAAUDITLOG"
                             WHERE "ISSUE_ID" is null);

DELETE
FROM "AO_54307E_SLAAUDITLOG"
WHERE "ISSUE_ID" is null;
*/

