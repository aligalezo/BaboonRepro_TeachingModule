SELECT repro_dataset.sname AS female
     , repro_dataset.cycle_day
     , repro_dataset.e2 AS estrogen
     , repro_dataset.size AS swelling_size
     , CASE WHEN highest_rank IS NULL THEN 0
            WHEN highest_rank = 1 THEN 1
            ELSE 0
            END AS alpha_consort
     , CASE WHEN lowest_rank IS NULL THEN 0
            WHEN lowest_rank != 1 THEN 1
            ELSE 0
            END AS nonalpha_consort
FROM
    (SELECT prep.sname
          , prep.date
          , results.e2
          , sexskins.size
          , CASE WHEN ddate_after.until_ddate > ddate_before.since_ddate THEN ddate_before.since_ddate
                 WHEN ddate_after.until_ddate < ddate_before.since_ddate THEN -(ddate_after.until_ddate)
                 END AS cycle_day
          , MIN(ranks.rank) AS highest_rank
          , MAX(ranks.rank) AS lowest_rank
     FROM prep
     LEFT JOIN results
            ON results.sid = prep.sid
     LEFT JOIN (SELECT prep.sname, prep.date, MIN(mtd_cycles.ddate) - prep.date AS until_ddate
                  FROM prep
             LEFT JOIN mtd_cycles
                    ON mtd_cycles.sname = prep.sname
                   AND mtd_cycles.ddate >= prep.date
              GROUP BY prep.sname, prep.date)
            AS ddate_after
            ON ddate_after.sname = prep.sname
           AND ddate_after.date = prep.date
     LEFT JOIN (SELECT prep.sname, prep.date, prep.date - MAX(mtd_cycles.ddate) AS since_ddate
                  FROM prep
             LEFT JOIN mtd_cycles
                    ON mtd_cycles.sname = prep.sname
                   AND mtd_cycles.ddate <= prep.date
              GROUP BY prep.sname, prep.date)
            AS ddate_before
            ON ddate_before.sname = prep.sname
           AND ddate_before.date = prep.date
     LEFT JOIN members
            ON members.sname = prep.sname
           AND members.date = prep.date
     LEFT JOIN actor_actees
            ON actor_actees.date = prep.date
           AND actor_actees.actee = prep.sname
           AND actor_actees.act = 'C'
     LEFT JOIN ranks
            ON ranks.rnkdate = rnkdate(prep.date)
           AND ranks.sname = actor_actees.actor
           AND ranks.rnktype = 'ADM'
           AND ranks.grp = members.grp
     LEFT JOIN (SELECT cycles.sname, sexskins.date, sexskins.size
                  FROM sexskins
             LEFT JOIN cycles
                    ON cycles.cid = sexskins.cid)
            AS sexskins
            ON sexskins.sname = prep.sname
           AND sexskins.date = prep.date
     WHERE results.e2 != 0
       AND prep.date < '01-01-2005' /* to restrict to data used in Gesquire et al. 2007 */
     GROUP BY prep.sname, prep.date, results.e2, sexskins.size, ddate_after.until_ddate, ddate_before.since_ddate
    ) AS repro_dataset
WHERE repro_dataset.cycle_day IS NOT NULL
  AND repro_dataset.cycle_day >= -22
  AND repro_dataset.cycle_day <= 12
  AND repro_dataset.size IS NOT NULL