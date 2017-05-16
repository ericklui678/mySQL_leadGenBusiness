-- 1) Run query to get total revenue for March of 2012
-- SELECT DATE_FORMAT(billing.charged_datetime, '%b') as month, SUM(billing.amount) FROM billing
-- WHERE charged_datetime LIKE '2012-03%'
-- ORDER BY charged_datetime

-- 2) Run query to get total revenues collected from client_id = 2
-- SELECT clients.client_id, SUM(billing.amount)
-- FROM clients
-- LEFT JOIN  billing ON clients.client_id = billing.client_id
-- WHERE clients.client_id = 2

-- 3) Run query to get all sites that clients = 10 owns
-- SELECT sites.domain_name, clients.client_id
-- FROM clients
-- LEFT JOIN sites ON clients.client_id = sites.client_id
-- LEFT JOIN leads ON  sites.site_id = leads.site_id
-- WHERE clients.client_id = 10
-- GROUP BY sites.domain_name

-- 4) Run query to get total # of sites created per month per year for client_id = 1 or client_id = 20
-- SELECT clients.client_id, COUNT(sites.site_id), DATE_FORMAT(sites.created_datetime, '%b'), DATE_FORMAT(sites.created_datetime, '%Y')
-- FROM clients
-- LEFT JOIN sites on clients.client_id = sites.client_id
-- WHERE clients.client_id = 1 or clients.client_id = 20
-- GROUP BY sites.site_id

-- 5) Run query to get total # of leads generated for each of the site between Jan 1, 2011 to Feb 15, 2011
-- SELECT sites.domain_name, COUNT(leads.leads_id) as number_of_leads, leads.registered_datetime as date_generated
-- FROM sites
-- LEFT JOIN leads ON sites.site_id = leads.leads_id
-- WHERE (leads.registered_datetime BETWEEN '2011-01-01' AND '2011-02-15')
-- GROUP BY leads.leads_id

-- 6) Run query to get a list of client names and total # of leads we've generated for each client each month between 01-01-2011 to 06-01-2011
-- SELECT CONCAT_WS(' ', clients.first_name, clients.last_name) as client_name,  COUNT(clients.client_id) as number_of_leads
-- FROM clients
-- LEFT JOIN sites ON clients.client_id = sites.client_id
-- LEFT JOIN leads ON sites.site_id = leads.site_id
-- WHERE (leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31')
-- GROUP BY client_name
-- ORDER BY clients.last_name

-- 7) Run query to get all cilent names and total # leads generated for each client each month from 01-01-2011 to 06-01-2011
-- SELECT CONCAT_WS(' ', clients.first_name, clients.last_name) as name, COUNT(leads.leads_id), DATE_FORMAT(leads.registered_datetime, '%M') as month
-- FROM clients
-- LEFT JOIN sites ON clients.client_id = sites.client_id
-- LEFT JOIN leads ON sites.site_id = leads.site_id
-- WHERE (leads.registered_datetime BETWEEN '2011-01-01' AND '2011-06-31')
-- GROUP BY leads.leads_id
-- ORDER BY leads.registered_datetime

-- 8) Run query to get list of client names and total # of leads we've generated for each of our clients' sites between 01-01-2011 to 12-31-2011. Order by client_id.
-- SELECT CONCAT_WS(' ', clients.first_name, clients.last_name) as client_name, sites.domain_name, COUNT(sites.domain_name) as num_of_leads, DATE_FORMAT(leads.registered_datetime, '%M %d, %Y') as date_generated
-- FROM clients
-- LEFT JOIN sites ON clients.client_id = sites.client_id
-- LEFT JOIN leads ON sites.site_id = leads.site_id
-- WHERE (leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31')
-- GROUP BY sites.domain_name, client_name
-- ORDER BY clients.client_id

-- 8) Also make 2nd query to show all clients, site names, and total number of leads generated from each site for all time
-- SELECT CONCAT_WS(' ', clients.first_name, clients.last_name) as client_name, sites.domain_name, leads.leads_id, COUNT(sites.domain_name)
-- FROM clients
-- LEFT JOIN sites ON clients.client_id = sites.client_id
-- LEFT JOIN leads ON sites.site_id = leads.site_id
-- GROUP BY sites.domain_name, client_name
-- ORDER BY clients.client_id

-- 9) Run a query that retrieves total revenue collected from each client for each month of the year. Order by client_id
-- SELECT CONCAT_WS(' ', clients.first_name, clients.last_name) as client_name, SUM(billing.amount) as amount, DATE_FORMAT(billing.charged_datetime, '%M') as month, DATE_FORMAT(billing.charged_datetime, '%Y') as year
-- FROM clients
-- LEFT JOIN billing ON clients.client_id = billing.client_id
-- GROUP BY client_name, month, year
-- ORDER BY clients.client_id, billing.charged_datetime

-- 10) Run a single query that retrives all the sites that each client owns. Group results so that each row shows a new client. It will become clearer when you add a new field called 'sites' that has all the sites the client owns
-- SELECT CONCAT_WS(' ', clients.first_name, clients.last_name) as client_name, GROUP_CONCAT(sites.domain_name ORDER BY sites.domain_name SEPARATOR ' / ')
-- FROM clients
-- LEFT JOIN sites ON clients.client_id = sites.client_id
-- GROUP BY client_name
-- ORDER BY clients.client_id
-- 