select * from member;
select * from memo;
select * from send_memo_record;
select * from receive_memo_record;


 select
            smr.send_id,
            smr.receiver_id,
            me.name as receiver_name,
            me.email as receiver_email,
            mo.title,
            smr.send_time
        from
        	send_memo_record smr
            join memo mo on (smr.memo_id = mo.memo_id)
            left join member me on (smr.receiver_id = me.member_id)
        where
            smr.sender_id = sender_id
        order by
            smr.send_time desc;
            
            
select
            rmr.receive_id,
            rmr.sender_id,
            me.name as sender_name,
            me.email as sender_email,
            mo.title,
            rmr.is_read
        from
        	receive_memo_record rmr
            join memo mo on (rmr.memo_id = mo.memo_id)
            left join member me on (rmr.sender_id = me.member_id)
        where
            rmr.receiver_id = receiver_id
        order by
            rmr.is_read, rmr.receive_id desc;