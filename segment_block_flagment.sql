
/*
bind ������ file_id���� �ָ�,
select * from DBA_EXTENTS;
���� file_id���� �����ϰ� ���߰�,
owner = owner 
SEGMENT_NAME
SEGMENT_TYPE
fragment = ����
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