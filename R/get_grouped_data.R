get_grouped_data<-function(n){
a=data.table(temp=rnorm(n, 5, 3))
b=data.table(temp=rnorm(n, 5, 4))
out<-rbindlist(list(a=a,b=b),idcol = "group_id")
out[,ozone:=rnorm(1,temp), by=seq_len(nrow(out))]
out
}
