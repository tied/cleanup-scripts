-- DETECT HOW MANY VALUES DO YOU HAVE IN Development panel
-- FYI: that info is like SQL cache

-- mysql dialect
-- SELECT count(ID) FROM AO_575BF5_PROVIDER_ISSUE;
-- truncate AO_575BF5_PROVIDER_ISSUE;


-- PostgreSQL dialect
SELECT count("ID") FROM "AO_575BF5_PROVIDER_ISSUE";
-- truncate "AO_575BF5_PROVIDER_ISSUE;"



-- DETECT AND CLEAN DEV SUMMARY INFO
-- mysql dialect
-- SELECT count(ID) FROM AO_575BF5_DEV_SUMMARY;

-- PostgreSQL dialect
SELECT count("ID") FROM "AO_575BF5_DEV_SUMMARY";


-- truncate AO_575BF5_DEV_SUMMARY;