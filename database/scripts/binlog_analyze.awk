BEGIN { FS = " "}
#POS号
/^# at/ {printf( "\n%s|||||",$3)}

#141023 18:00:00 server id 1  end_log_pos 484113053 Querythread_id=4056499172exec_time=0error_code=0

/^#[0-9][0-9](0[0-9]|1[0-2])([0-2][0-9]|3[0-1])/ && /Intvar/  {printf("20%s/%s/%s %s|||||%s|||||%s|||||%s|||||",substr($1,2,2),substr($1,4,2),substr($1,6,2),$2,$5,$7,$8)} match($8, /Querythread_id=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+15,RLENGTH-15 )} match($8, /exec_time=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+10,RLENGTH-10 )} match($8, /error_code=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+11,RLENGTH-11 )}

/^#[0-9][0-9](0[0-9]|1[0-2])([0-2][0-9]|3[0-1])/ && /Query/  {printf("20%s/%s/%s %s|||||%s|||||%s|||||%s|||||",substr($1,2,2),substr($1,4,2),substr($1,6,2),$2,$5,$7,$8)} match($8, /Querythread_id=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+15,RLENGTH-15 )} match($8, /exec_time=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+10,RLENGTH-10 )} match($8, /error_code=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+11,RLENGTH-11 )}

/^#[0-9][0-9](0[0-9]|1[0-2])([0-2][0-9]|3[0-1])/ && /Xid/  {printf("20%s/%s/%s %s|||||%s|||||%s|||||%s|||||",substr($1,2,2),substr($1,4,2),substr($1,6,2),$2,$5,$7,$8)}  match($8, /Querythread_id=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+15,RLENGTH-15 )} match($8, /exec_time=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+10,RLENGTH-10 )} match($8, /error_code=[0-9]+/){printf("%s|||||"),substr( $8, RSTART+11,RLENGTH-11 )}


#/^#[0-9][0-9](0[0-9]|1[0-2])([0-2][0-9]|3[0-1])/ && /Query/ {for (i=1;i<NF;i++) {if($i~/thread_id=/) {thread_id=$i} else if($i~/exec_time=/) {exec_time=$i} else if($i~/error_code=/) {error_code=$i}} {printf("20%s/%s/%s %s|||||%s|||||%s|||||",substr($1,2,2),substr($1,4,2),substr($1,6,2),thread_id,exec_time,error_code)}}

#DML操作
/^insert|^INSERT/ {split($3,table,"(");printf("insert|||||%s|||||%s",table[1],$0)}
/^replace|^REPLACE/ {split($3,table,"(");printf("insert|||||%s|||||%s",table[1],$0)}
/^update|^UPDATE/ {printf("update|||||%s|||||%s",$2,$0)}
/^delete|^DELETE/ {printf("delete|||||%s|||||%s",$3,$0)}
#/^begin|^BEGIN/ {printf("begin|||||%s|||||BEGIN",0)}
#/^commit|^COMMIT/ {printf("commit|||||%s|||||COMMIT",0)}
END {printf("\n")}