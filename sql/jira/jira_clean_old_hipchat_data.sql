-- detect old HipChat history
SELECT count(id)
FROM entity_property
WHERE ENTITY_NAME = 'hipchat.integration.caches.issue-mentions';


/*
-- cleaning that old data
DELETE
FROM entity_property
WHERE ENTITY_NAME = 'hipchat.integration.caches.issue-mentions';

*/