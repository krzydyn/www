<b>Send and receive over reliable link (like stream socket)</b>
<%code_start("cpp")%>
int tcp_send(int fd,void *buf,int len){
	unsigned char lb[2];
	int r,l;
	if (len<0||len>0x7ffff) {errno=EINVAL;return -1;}
	lb[0]=(len>>8)&0xff; lb[1]=len&0xff;
	l=0;
	do {
		r=send(fd,(char*)lb+l,lb-l,0);
		if (r<0) return r;
		l+=r;
		if (l<2) usleep(1000);
	}while (l<2);
	l=0;
	do {
		r=send(fd,(char*)buf+l,len-l,0);
		if (r<0) return r;
		l+=r;
		if (l<len) usleep(1000);
	}while (l<len);
	return l;
}
int tcp_recv(int fd,void *buf,int len){
	unsigned char lb[2];
	int r,l=0;
	do {
		r=recv(fd,lb+l,2-l,0);
		if (r<0) return r;
		l+=r;
		if (l<2) usleep(1000);
	}while(l<2);
	l=(lb[0]<<8)|lb[1];
	if (l>len) {errno=EINVAL;return -1;}
	len=l; l=0;
	while (l<len) {
		r=recv(fd,(char*)buf+l,len-l,0);
		if (r<0) return r;
		l+=r;
		if (l<len) usleep(1000);
	}
	return l;
}
<%code_stop()%>
