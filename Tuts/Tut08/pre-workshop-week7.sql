-- ZIXIN HAO
--30758017

--Q1

SELECT STUDID,STUDFNAME || ' ' || STUDLNAME as NAME,
to_char(STUDDOB,'yyyy--mon--dd') as DOB

FROM UNI.STUDENT

ORDER BY STUDDOB;

--Q2
SELECT STUDID, STUDFNAME || ' ' || STUDLNAME as NAME, 
UNITCODE, to_char(ofyear,'YYYY')AS Year,semester

FROM uni.student natural join uni.enrolment

WHERE mark IS NULL

ORDER BY UNITCODE, STUDID;
