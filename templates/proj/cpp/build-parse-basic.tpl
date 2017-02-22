<b>Build and parse simple data types</b> (return number of bytes processed)<br>
<%code_start("cpp")%>
#include <string.h>
int build_int1(void *buf,int s,unsigned char v){
  if (s<1) return -1;
  ((unsigned char*)buf)[0]=v;
  return 1;
}
int build_int2(void *buf,int s,unsigned short v){
  if (s<2) return -1;
  ((unsigned char*)buf)[0]=v>>8;
  ((unsigned char*)buf)[1]=v;
  return 2;
}
int build_int4(void *buf,int s,unsigned long v){
  unsigned char i;
  if (s<4) return -1;
  for (i=0; i<4; v>>=8,++i)
    ((unsigned char*)buf)[3-i]=v;
  return 4;
}
int build_string(void *buf,int s,const char *str,unsigned short l){
  if (s<2+l) return -1;
  build_int2(buf,s,l);
  memcpy(buf+2,str,l);
  return l+2;
}
int parse_int1(void *buf,int s,unsigned char *v){
  if (s<1) return -1;
  *v=((unsigned char*)buf)[0];
  return 1;
}
int parse_int2(void *buf,int s,unsigned short *v){
  if (s<2) return -1;
  *v=((unsigned char*)buf)[0]<<8;
  *v|=((unsigned char*)buf)[1];
  return 2;
}
int parse_int4(void *buf,int s,unsigned long *v){
  unsigned char i;
  if (s<4) return -1;
  for (*v=0,i=0; i<4; ++i)
    {*v<<=8;*v|=((unsigned char*)buf)[i];}
  return 4;
}
int parse_string(void *buf,int s,char *str,unsigned short *sl){
  unsigned short l;
  if (parse_int2(buf,s,&l)<0) return -1;
  if (s<2+l) return -1;
  if (*sl>l) *sl=l;
  memcpy(str,buf+2,*sl);
  return l+2;
}
<%code_stop()%>
