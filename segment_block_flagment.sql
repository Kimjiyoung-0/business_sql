
/*
bind 변수로 file_id값을 주면,
select * from DBA_EXTENTS;
에서 file_id값을 동일하게 맞추고,
owner = owner 
SEGMENT_NAME
SEGMENT_TYPE
fragment = 순서
startblock = BLOCK_ID
endblcok = BLOCK_ID+BLOCKS-1 
*/

select owner, SEGMENT_NAME,SEGMENT_TYPE,rownum as fragment,startblock, endblock 
from(
select owner, SEGMENT_NAME, SEGMENT_TYPE, block_id as startblock, BLOCK_ID+BLOCKS-1 as endblock 
from DBA_EXTENTS
where FILE_ID = :file_id 
order by block_id
) a;