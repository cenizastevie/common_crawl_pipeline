SELECT *
FROM "ccindex"
WHERE crawl = 'CC-MAIN-2020-10'
  AND subset = 'warc'
  AND url_host_name IN (
    'www.straitstimes.com',       -- Singapore
    'www.channelnewsasia.com',    -- Singapore
    'www.todayonline.com',        -- Singapore
    'www.thejakartapost.com',     -- Indonesia
    'www.jakartaglobe.id',        -- Indonesia
    'www.bangkokpost.com',        -- Thailand
    'www.nationthailand.com',     -- Thailand
    'www.philstar.com',           -- Philippines
    'www.manilatimes.net',        -- Philippines
    'www.thestar.com.my',         -- Malaysia
    'www.malaymail.com',          -- Malaysia
    'www.vnexpress.net',          -- Vietnam
    'tuoitrenews.vn',             -- Vietnam
    'asiatimes.com',              -- Asia Times
    'www.channelnewsasia.com',    -- Channel NewsAsia
    'thediplomat.com',            -- The Diplomat
    'aseantoday.com',             -- ASEAN Today
    'www.straitstimes.com',       -- The Straits Times
    'www.scmp.com',               -- South China Morning Post
    'www.thejakartapost.com',     -- Jakarta Post
    'vietnamnews.vn',             -- Vietnam News
    'www.bangkokpost.com',        -- Bangkok Post
    'www.khmertimeskh.com'        -- Khmer Times
  )