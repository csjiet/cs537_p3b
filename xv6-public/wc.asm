
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
   9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  10:	be 00 00 00 00       	mov    $0x0,%esi
  15:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  23:	83 ec 04             	sub    $0x4,%esp
  26:	68 00 02 00 00       	push   $0x200
  2b:	68 c0 0b 00 00       	push   $0xbc0
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 69 03 00 00       	call   3a1 <read>
  38:	89 c7                	mov    %eax,%edi
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	7e 54                	jle    95 <wc+0x95>
    for(i=0; i<n; i++){
  41:	bb 00 00 00 00       	mov    $0x0,%ebx
  46:	eb 22                	jmp    6a <wc+0x6a>
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	0f be c0             	movsbl %al,%eax
  4e:	50                   	push   %eax
  4f:	68 8c 07 00 00       	push   $0x78c
  54:	e8 86 01 00 00       	call   1df <strchr>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	85 c0                	test   %eax,%eax
  5e:	74 22                	je     82 <wc+0x82>
        inword = 0;
  60:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  67:	83 c3 01             	add    $0x1,%ebx
  6a:	39 fb                	cmp    %edi,%ebx
  6c:	7d b5                	jge    23 <wc+0x23>
      c++;
  6e:	83 c6 01             	add    $0x1,%esi
      if(buf[i] == '\n')
  71:	0f b6 83 c0 0b 00 00 	movzbl 0xbc0(%ebx),%eax
  78:	3c 0a                	cmp    $0xa,%al
  7a:	75 cc                	jne    48 <wc+0x48>
        l++;
  7c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  80:	eb c6                	jmp    48 <wc+0x48>
      else if(!inword){
  82:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  86:	75 df                	jne    67 <wc+0x67>
        w++;
  88:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
  8c:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  93:	eb d2                	jmp    67 <wc+0x67>
      }
    }
  }
  if(n < 0){
  95:	78 24                	js     bb <wc+0xbb>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  97:	83 ec 08             	sub    $0x8,%esp
  9a:	ff 75 0c             	push   0xc(%ebp)
  9d:	56                   	push   %esi
  9e:	ff 75 dc             	push   -0x24(%ebp)
  a1:	ff 75 e0             	push   -0x20(%ebp)
  a4:	68 a2 07 00 00       	push   $0x7a2
  a9:	6a 01                	push   $0x1
  ab:	e8 2e 04 00 00       	call   4de <printf>
}
  b0:	83 c4 20             	add    $0x20,%esp
  b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  b6:	5b                   	pop    %ebx
  b7:	5e                   	pop    %esi
  b8:	5f                   	pop    %edi
  b9:	5d                   	pop    %ebp
  ba:	c3                   	ret    
    printf(1, "wc: read error\n");
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 92 07 00 00       	push   $0x792
  c3:	6a 01                	push   $0x1
  c5:	e8 14 04 00 00       	call   4de <printf>
    exit();
  ca:	e8 ba 02 00 00       	call   389 <exit>

000000cf <main>:

int
main(int argc, char *argv[])
{
  cf:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  d3:	83 e4 f0             	and    $0xfffffff0,%esp
  d6:	ff 71 fc             	push   -0x4(%ecx)
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	57                   	push   %edi
  dd:	56                   	push   %esi
  de:	53                   	push   %ebx
  df:	51                   	push   %ecx
  e0:	83 ec 18             	sub    $0x18,%esp
  e3:	8b 01                	mov    (%ecx),%eax
  e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  e8:	8b 51 04             	mov    0x4(%ecx),%edx
  eb:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  ee:	83 f8 01             	cmp    $0x1,%eax
  f1:	7e 07                	jle    fa <main+0x2b>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  f3:	be 01 00 00 00       	mov    $0x1,%esi
  f8:	eb 2d                	jmp    127 <main+0x58>
    wc(0, "");
  fa:	83 ec 08             	sub    $0x8,%esp
  fd:	68 a1 07 00 00       	push   $0x7a1
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 7b 02 00 00       	call   389 <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 10e:	83 ec 08             	sub    $0x8,%esp
 111:	ff 37                	push   (%edi)
 113:	50                   	push   %eax
 114:	e8 e7 fe ff ff       	call   0 <wc>
    close(fd);
 119:	89 1c 24             	mov    %ebx,(%esp)
 11c:	e8 90 02 00 00       	call   3b1 <close>
  for(i = 1; i < argc; i++){
 121:	83 c6 01             	add    $0x1,%esi
 124:	83 c4 10             	add    $0x10,%esp
 127:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 12a:	7d 31                	jge    15d <main+0x8e>
    if((fd = open(argv[i], 0)) < 0){
 12c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 12f:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 132:	83 ec 08             	sub    $0x8,%esp
 135:	6a 00                	push   $0x0
 137:	ff 37                	push   (%edi)
 139:	e8 8b 02 00 00       	call   3c9 <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 af 07 00 00       	push   $0x7af
 151:	6a 01                	push   $0x1
 153:	e8 86 03 00 00       	call   4de <printf>
      exit();
 158:	e8 2c 02 00 00       	call   389 <exit>
  }
  exit();
 15d:	e8 27 02 00 00       	call   389 <exit>

00000162 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 162:	55                   	push   %ebp
 163:	89 e5                	mov    %esp,%ebp
 165:	56                   	push   %esi
 166:	53                   	push   %ebx
 167:	8b 75 08             	mov    0x8(%ebp),%esi
 16a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16d:	89 f0                	mov    %esi,%eax
 16f:	89 d1                	mov    %edx,%ecx
 171:	83 c2 01             	add    $0x1,%edx
 174:	89 c3                	mov    %eax,%ebx
 176:	83 c0 01             	add    $0x1,%eax
 179:	0f b6 09             	movzbl (%ecx),%ecx
 17c:	88 0b                	mov    %cl,(%ebx)
 17e:	84 c9                	test   %cl,%cl
 180:	75 ed                	jne    16f <strcpy+0xd>
    ;
  return os;
}
 182:	89 f0                	mov    %esi,%eax
 184:	5b                   	pop    %ebx
 185:	5e                   	pop    %esi
 186:	5d                   	pop    %ebp
 187:	c3                   	ret    

00000188 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 191:	eb 06                	jmp    199 <strcmp+0x11>
    p++, q++;
 193:	83 c1 01             	add    $0x1,%ecx
 196:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 199:	0f b6 01             	movzbl (%ecx),%eax
 19c:	84 c0                	test   %al,%al
 19e:	74 04                	je     1a4 <strcmp+0x1c>
 1a0:	3a 02                	cmp    (%edx),%al
 1a2:	74 ef                	je     193 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1a4:	0f b6 c0             	movzbl %al,%eax
 1a7:	0f b6 12             	movzbl (%edx),%edx
 1aa:	29 d0                	sub    %edx,%eax
}
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    

000001ae <strlen>:

uint
strlen(const char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b4:	b8 00 00 00 00       	mov    $0x0,%eax
 1b9:	eb 03                	jmp    1be <strlen+0x10>
 1bb:	83 c0 01             	add    $0x1,%eax
 1be:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1c2:	75 f7                	jne    1bb <strlen+0xd>
    ;
  return n;
}
 1c4:	5d                   	pop    %ebp
 1c5:	c3                   	ret    

000001c6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	57                   	push   %edi
 1ca:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d5:	fc                   	cld    
 1d6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d8:	89 d0                	mov    %edx,%eax
 1da:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1dd:	c9                   	leave  
 1de:	c3                   	ret    

000001df <strchr>:

char*
strchr(const char *s, char c)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1e9:	eb 03                	jmp    1ee <strchr+0xf>
 1eb:	83 c0 01             	add    $0x1,%eax
 1ee:	0f b6 10             	movzbl (%eax),%edx
 1f1:	84 d2                	test   %dl,%dl
 1f3:	74 06                	je     1fb <strchr+0x1c>
    if(*s == c)
 1f5:	38 ca                	cmp    %cl,%dl
 1f7:	75 f2                	jne    1eb <strchr+0xc>
 1f9:	eb 05                	jmp    200 <strchr+0x21>
      return (char*)s;
  return 0;
 1fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 200:	5d                   	pop    %ebp
 201:	c3                   	ret    

00000202 <gets>:

char*
gets(char *buf, int max)
{
 202:	55                   	push   %ebp
 203:	89 e5                	mov    %esp,%ebp
 205:	57                   	push   %edi
 206:	56                   	push   %esi
 207:	53                   	push   %ebx
 208:	83 ec 1c             	sub    $0x1c,%esp
 20b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20e:	bb 00 00 00 00       	mov    $0x0,%ebx
 213:	89 de                	mov    %ebx,%esi
 215:	83 c3 01             	add    $0x1,%ebx
 218:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21b:	7d 2e                	jge    24b <gets+0x49>
    cc = read(0, &c, 1);
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	6a 01                	push   $0x1
 222:	8d 45 e7             	lea    -0x19(%ebp),%eax
 225:	50                   	push   %eax
 226:	6a 00                	push   $0x0
 228:	e8 74 01 00 00       	call   3a1 <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 17                	jle    24b <gets+0x49>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 23b:	3c 0a                	cmp    $0xa,%al
 23d:	0f 94 c2             	sete   %dl
 240:	3c 0d                	cmp    $0xd,%al
 242:	0f 94 c0             	sete   %al
 245:	08 c2                	or     %al,%dl
 247:	74 ca                	je     213 <gets+0x11>
    buf[i++] = c;
 249:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 24b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 24f:	89 f8                	mov    %edi,%eax
 251:	8d 65 f4             	lea    -0xc(%ebp),%esp
 254:	5b                   	pop    %ebx
 255:	5e                   	pop    %esi
 256:	5f                   	pop    %edi
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    

00000259 <stat>:

int
stat(const char *n, struct stat *st)
{
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	56                   	push   %esi
 25d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 25e:	83 ec 08             	sub    $0x8,%esp
 261:	6a 00                	push   $0x0
 263:	ff 75 08             	push   0x8(%ebp)
 266:	e8 5e 01 00 00       	call   3c9 <open>
  if(fd < 0)
 26b:	83 c4 10             	add    $0x10,%esp
 26e:	85 c0                	test   %eax,%eax
 270:	78 24                	js     296 <stat+0x3d>
 272:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 274:	83 ec 08             	sub    $0x8,%esp
 277:	ff 75 0c             	push   0xc(%ebp)
 27a:	50                   	push   %eax
 27b:	e8 61 01 00 00       	call   3e1 <fstat>
 280:	89 c6                	mov    %eax,%esi
  close(fd);
 282:	89 1c 24             	mov    %ebx,(%esp)
 285:	e8 27 01 00 00       	call   3b1 <close>
  return r;
 28a:	83 c4 10             	add    $0x10,%esp
}
 28d:	89 f0                	mov    %esi,%eax
 28f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 292:	5b                   	pop    %ebx
 293:	5e                   	pop    %esi
 294:	5d                   	pop    %ebp
 295:	c3                   	ret    
    return -1;
 296:	be ff ff ff ff       	mov    $0xffffffff,%esi
 29b:	eb f0                	jmp    28d <stat+0x34>

0000029d <atoi>:

int
atoi(const char *s)
{
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	53                   	push   %ebx
 2a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2a4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2a9:	eb 10                	jmp    2bb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2ab:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2ae:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2b1:	83 c1 01             	add    $0x1,%ecx
 2b4:	0f be c0             	movsbl %al,%eax
 2b7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2bb:	0f b6 01             	movzbl (%ecx),%eax
 2be:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c1:	80 fb 09             	cmp    $0x9,%bl
 2c4:	76 e5                	jbe    2ab <atoi+0xe>
  return n;
}
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	8b 75 08             	mov    0x8(%ebp),%esi
 2d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d8:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2db:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2dd:	eb 0d                	jmp    2ec <memmove+0x1f>
    *dst++ = *src++;
 2df:	0f b6 01             	movzbl (%ecx),%eax
 2e2:	88 02                	mov    %al,(%edx)
 2e4:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2ea:	89 d8                	mov    %ebx,%eax
 2ec:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2ef:	85 c0                	test   %eax,%eax
 2f1:	7f ec                	jg     2df <memmove+0x12>
  return vdst;
}
 2f3:	89 f0                	mov    %esi,%eax
 2f5:	5b                   	pop    %ebx
 2f6:	5e                   	pop    %esi
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    

000002f9 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 2f9:	55                   	push   %ebp
 2fa:	89 e5                	mov    %esp,%ebp
 2fc:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 2ff:	68 00 10 00 00       	push   $0x1000
 304:	e8 fb 03 00 00       	call   704 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 309:	50                   	push   %eax
 30a:	ff 75 10             	push   0x10(%ebp)
 30d:	ff 75 0c             	push   0xc(%ebp)
 310:	ff 75 08             	push   0x8(%ebp)
 313:	e8 11 01 00 00       	call   429 <clone>
}
 318:	c9                   	leave  
 319:	c3                   	ret    

0000031a <thread_join>:

int thread_join(){
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
 31d:	53                   	push   %ebx
 31e:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 321:	8d 45 f4             	lea    -0xc(%ebp),%eax
 324:	50                   	push   %eax
 325:	e8 07 01 00 00       	call   431 <join>
  if (x < 0) {
 32a:	83 c4 10             	add    $0x10,%esp
 32d:	85 c0                	test   %eax,%eax
 32f:	78 17                	js     348 <thread_join+0x2e>
 331:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 333:	83 ec 0c             	sub    $0xc,%esp
 336:	ff 75 f4             	push   -0xc(%ebp)
 339:	e8 06 03 00 00       	call   644 <free>
  return x;
 33e:	83 c4 10             	add    $0x10,%esp
}
 341:	89 d8                	mov    %ebx,%eax
 343:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 346:	c9                   	leave  
 347:	c3                   	ret    
    return -1;
 348:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 34d:	eb f2                	jmp    341 <thread_join+0x27>

0000034f <lock_init>:

void lock_init(lock_t *spin){
 34f:	55                   	push   %ebp
 350:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 352:	8b 45 08             	mov    0x8(%ebp),%eax
 355:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    

0000035d <lock_acquire>:

void lock_acquire(lock_t *spin){
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
 360:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 363:	b8 01 00 00 00       	mov    $0x1,%eax
 368:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 36b:	85 c0                	test   %eax,%eax
 36d:	75 f4                	jne    363 <lock_acquire+0x6>

}
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    

00000371 <lock_release>:

void lock_release(lock_t *spin){
 371:	55                   	push   %ebp
 372:	89 e5                	mov    %esp,%ebp
 374:	8b 55 08             	mov    0x8(%ebp),%edx
 377:	b8 00 00 00 00       	mov    $0x0,%eax
 37c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    

00000381 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 381:	b8 01 00 00 00       	mov    $0x1,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <exit>:
SYSCALL(exit)
 389:	b8 02 00 00 00       	mov    $0x2,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <wait>:
SYSCALL(wait)
 391:	b8 03 00 00 00       	mov    $0x3,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <pipe>:
SYSCALL(pipe)
 399:	b8 04 00 00 00       	mov    $0x4,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <read>:
SYSCALL(read)
 3a1:	b8 05 00 00 00       	mov    $0x5,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <write>:
SYSCALL(write)
 3a9:	b8 10 00 00 00       	mov    $0x10,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <close>:
SYSCALL(close)
 3b1:	b8 15 00 00 00       	mov    $0x15,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <kill>:
SYSCALL(kill)
 3b9:	b8 06 00 00 00       	mov    $0x6,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <exec>:
SYSCALL(exec)
 3c1:	b8 07 00 00 00       	mov    $0x7,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <open>:
SYSCALL(open)
 3c9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <mknod>:
SYSCALL(mknod)
 3d1:	b8 11 00 00 00       	mov    $0x11,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <unlink>:
SYSCALL(unlink)
 3d9:	b8 12 00 00 00       	mov    $0x12,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <fstat>:
SYSCALL(fstat)
 3e1:	b8 08 00 00 00       	mov    $0x8,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <link>:
SYSCALL(link)
 3e9:	b8 13 00 00 00       	mov    $0x13,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <mkdir>:
SYSCALL(mkdir)
 3f1:	b8 14 00 00 00       	mov    $0x14,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <chdir>:
SYSCALL(chdir)
 3f9:	b8 09 00 00 00       	mov    $0x9,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <dup>:
SYSCALL(dup)
 401:	b8 0a 00 00 00       	mov    $0xa,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <getpid>:
SYSCALL(getpid)
 409:	b8 0b 00 00 00       	mov    $0xb,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <sbrk>:
SYSCALL(sbrk)
 411:	b8 0c 00 00 00       	mov    $0xc,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <sleep>:
SYSCALL(sleep)
 419:	b8 0d 00 00 00       	mov    $0xd,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <uptime>:
SYSCALL(uptime)
 421:	b8 0e 00 00 00       	mov    $0xe,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <clone>:
SYSCALL(clone)
 429:	b8 16 00 00 00       	mov    $0x16,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <join>:
 431:	b8 17 00 00 00       	mov    $0x17,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	83 ec 1c             	sub    $0x1c,%esp
 43f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 442:	6a 01                	push   $0x1
 444:	8d 55 f4             	lea    -0xc(%ebp),%edx
 447:	52                   	push   %edx
 448:	50                   	push   %eax
 449:	e8 5b ff ff ff       	call   3a9 <write>
}
 44e:	83 c4 10             	add    $0x10,%esp
 451:	c9                   	leave  
 452:	c3                   	ret    

00000453 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
 456:	57                   	push   %edi
 457:	56                   	push   %esi
 458:	53                   	push   %ebx
 459:	83 ec 2c             	sub    $0x2c,%esp
 45c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 45f:	89 d0                	mov    %edx,%eax
 461:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 463:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 467:	0f 95 c1             	setne  %cl
 46a:	c1 ea 1f             	shr    $0x1f,%edx
 46d:	84 d1                	test   %dl,%cl
 46f:	74 44                	je     4b5 <printint+0x62>
    neg = 1;
    x = -xx;
 471:	f7 d8                	neg    %eax
 473:	89 c1                	mov    %eax,%ecx
    neg = 1;
 475:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 47c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 481:	89 c8                	mov    %ecx,%eax
 483:	ba 00 00 00 00       	mov    $0x0,%edx
 488:	f7 f6                	div    %esi
 48a:	89 df                	mov    %ebx,%edi
 48c:	83 c3 01             	add    $0x1,%ebx
 48f:	0f b6 92 24 08 00 00 	movzbl 0x824(%edx),%edx
 496:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 49a:	89 ca                	mov    %ecx,%edx
 49c:	89 c1                	mov    %eax,%ecx
 49e:	39 d6                	cmp    %edx,%esi
 4a0:	76 df                	jbe    481 <printint+0x2e>
  if(neg)
 4a2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4a6:	74 31                	je     4d9 <printint+0x86>
    buf[i++] = '-';
 4a8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4ad:	8d 5f 02             	lea    0x2(%edi),%ebx
 4b0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b3:	eb 17                	jmp    4cc <printint+0x79>
    x = xx;
 4b5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4b7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4be:	eb bc                	jmp    47c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4c0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4c5:	89 f0                	mov    %esi,%eax
 4c7:	e8 6d ff ff ff       	call   439 <putc>
  while(--i >= 0)
 4cc:	83 eb 01             	sub    $0x1,%ebx
 4cf:	79 ef                	jns    4c0 <printint+0x6d>
}
 4d1:	83 c4 2c             	add    $0x2c,%esp
 4d4:	5b                   	pop    %ebx
 4d5:	5e                   	pop    %esi
 4d6:	5f                   	pop    %edi
 4d7:	5d                   	pop    %ebp
 4d8:	c3                   	ret    
 4d9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4dc:	eb ee                	jmp    4cc <printint+0x79>

000004de <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	57                   	push   %edi
 4e2:	56                   	push   %esi
 4e3:	53                   	push   %ebx
 4e4:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4e7:	8d 45 10             	lea    0x10(%ebp),%eax
 4ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4ed:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4f2:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f7:	eb 14                	jmp    50d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4f9:	89 fa                	mov    %edi,%edx
 4fb:	8b 45 08             	mov    0x8(%ebp),%eax
 4fe:	e8 36 ff ff ff       	call   439 <putc>
 503:	eb 05                	jmp    50a <printf+0x2c>
      }
    } else if(state == '%'){
 505:	83 fe 25             	cmp    $0x25,%esi
 508:	74 25                	je     52f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 50a:	83 c3 01             	add    $0x1,%ebx
 50d:	8b 45 0c             	mov    0xc(%ebp),%eax
 510:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 514:	84 c0                	test   %al,%al
 516:	0f 84 20 01 00 00    	je     63c <printf+0x15e>
    c = fmt[i] & 0xff;
 51c:	0f be f8             	movsbl %al,%edi
 51f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 522:	85 f6                	test   %esi,%esi
 524:	75 df                	jne    505 <printf+0x27>
      if(c == '%'){
 526:	83 f8 25             	cmp    $0x25,%eax
 529:	75 ce                	jne    4f9 <printf+0x1b>
        state = '%';
 52b:	89 c6                	mov    %eax,%esi
 52d:	eb db                	jmp    50a <printf+0x2c>
      if(c == 'd'){
 52f:	83 f8 25             	cmp    $0x25,%eax
 532:	0f 84 cf 00 00 00    	je     607 <printf+0x129>
 538:	0f 8c dd 00 00 00    	jl     61b <printf+0x13d>
 53e:	83 f8 78             	cmp    $0x78,%eax
 541:	0f 8f d4 00 00 00    	jg     61b <printf+0x13d>
 547:	83 f8 63             	cmp    $0x63,%eax
 54a:	0f 8c cb 00 00 00    	jl     61b <printf+0x13d>
 550:	83 e8 63             	sub    $0x63,%eax
 553:	83 f8 15             	cmp    $0x15,%eax
 556:	0f 87 bf 00 00 00    	ja     61b <printf+0x13d>
 55c:	ff 24 85 cc 07 00 00 	jmp    *0x7cc(,%eax,4)
        printint(fd, *ap, 10, 1);
 563:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 566:	8b 17                	mov    (%edi),%edx
 568:	83 ec 0c             	sub    $0xc,%esp
 56b:	6a 01                	push   $0x1
 56d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	e8 d9 fe ff ff       	call   453 <printint>
        ap++;
 57a:	83 c7 04             	add    $0x4,%edi
 57d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 580:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 583:	be 00 00 00 00       	mov    $0x0,%esi
 588:	eb 80                	jmp    50a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 58a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58d:	8b 17                	mov    (%edi),%edx
 58f:	83 ec 0c             	sub    $0xc,%esp
 592:	6a 00                	push   $0x0
 594:	b9 10 00 00 00       	mov    $0x10,%ecx
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	e8 b2 fe ff ff       	call   453 <printint>
        ap++;
 5a1:	83 c7 04             	add    $0x4,%edi
 5a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5aa:	be 00 00 00 00       	mov    $0x0,%esi
 5af:	e9 56 ff ff ff       	jmp    50a <printf+0x2c>
        s = (char*)*ap;
 5b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b7:	8b 30                	mov    (%eax),%esi
        ap++;
 5b9:	83 c0 04             	add    $0x4,%eax
 5bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5bf:	85 f6                	test   %esi,%esi
 5c1:	75 15                	jne    5d8 <printf+0xfa>
          s = "(null)";
 5c3:	be c3 07 00 00       	mov    $0x7c3,%esi
 5c8:	eb 0e                	jmp    5d8 <printf+0xfa>
          putc(fd, *s);
 5ca:	0f be d2             	movsbl %dl,%edx
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	e8 64 fe ff ff       	call   439 <putc>
          s++;
 5d5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5d8:	0f b6 16             	movzbl (%esi),%edx
 5db:	84 d2                	test   %dl,%dl
 5dd:	75 eb                	jne    5ca <printf+0xec>
      state = 0;
 5df:	be 00 00 00 00       	mov    $0x0,%esi
 5e4:	e9 21 ff ff ff       	jmp    50a <printf+0x2c>
        putc(fd, *ap);
 5e9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ec:	0f be 17             	movsbl (%edi),%edx
 5ef:	8b 45 08             	mov    0x8(%ebp),%eax
 5f2:	e8 42 fe ff ff       	call   439 <putc>
        ap++;
 5f7:	83 c7 04             	add    $0x4,%edi
 5fa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5fd:	be 00 00 00 00       	mov    $0x0,%esi
 602:	e9 03 ff ff ff       	jmp    50a <printf+0x2c>
        putc(fd, c);
 607:	89 fa                	mov    %edi,%edx
 609:	8b 45 08             	mov    0x8(%ebp),%eax
 60c:	e8 28 fe ff ff       	call   439 <putc>
      state = 0;
 611:	be 00 00 00 00       	mov    $0x0,%esi
 616:	e9 ef fe ff ff       	jmp    50a <printf+0x2c>
        putc(fd, '%');
 61b:	ba 25 00 00 00       	mov    $0x25,%edx
 620:	8b 45 08             	mov    0x8(%ebp),%eax
 623:	e8 11 fe ff ff       	call   439 <putc>
        putc(fd, c);
 628:	89 fa                	mov    %edi,%edx
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	e8 07 fe ff ff       	call   439 <putc>
      state = 0;
 632:	be 00 00 00 00       	mov    $0x0,%esi
 637:	e9 ce fe ff ff       	jmp    50a <printf+0x2c>
    }
  }
}
 63c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63f:	5b                   	pop    %ebx
 640:	5e                   	pop    %esi
 641:	5f                   	pop    %edi
 642:	5d                   	pop    %ebp
 643:	c3                   	ret    

00000644 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 650:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 655:	eb 02                	jmp    659 <free+0x15>
 657:	89 d0                	mov    %edx,%eax
 659:	39 c8                	cmp    %ecx,%eax
 65b:	73 04                	jae    661 <free+0x1d>
 65d:	39 08                	cmp    %ecx,(%eax)
 65f:	77 12                	ja     673 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 661:	8b 10                	mov    (%eax),%edx
 663:	39 c2                	cmp    %eax,%edx
 665:	77 f0                	ja     657 <free+0x13>
 667:	39 c8                	cmp    %ecx,%eax
 669:	72 08                	jb     673 <free+0x2f>
 66b:	39 ca                	cmp    %ecx,%edx
 66d:	77 04                	ja     673 <free+0x2f>
 66f:	89 d0                	mov    %edx,%eax
 671:	eb e6                	jmp    659 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 673:	8b 73 fc             	mov    -0x4(%ebx),%esi
 676:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 679:	8b 10                	mov    (%eax),%edx
 67b:	39 d7                	cmp    %edx,%edi
 67d:	74 19                	je     698 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 67f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 682:	8b 50 04             	mov    0x4(%eax),%edx
 685:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 688:	39 ce                	cmp    %ecx,%esi
 68a:	74 1b                	je     6a7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 68c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 68e:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 693:	5b                   	pop    %ebx
 694:	5e                   	pop    %esi
 695:	5f                   	pop    %edi
 696:	5d                   	pop    %ebp
 697:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 698:	03 72 04             	add    0x4(%edx),%esi
 69b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 69e:	8b 10                	mov    (%eax),%edx
 6a0:	8b 12                	mov    (%edx),%edx
 6a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6a5:	eb db                	jmp    682 <free+0x3e>
    p->s.size += bp->s.size;
 6a7:	03 53 fc             	add    -0x4(%ebx),%edx
 6aa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ad:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6b0:	89 10                	mov    %edx,(%eax)
 6b2:	eb da                	jmp    68e <free+0x4a>

000006b4 <morecore>:

static Header*
morecore(uint nu)
{
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	53                   	push   %ebx
 6b8:	83 ec 04             	sub    $0x4,%esp
 6bb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6bd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6c2:	77 05                	ja     6c9 <morecore+0x15>
    nu = 4096;
 6c4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6c9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	50                   	push   %eax
 6d4:	e8 38 fd ff ff       	call   411 <sbrk>
  if(p == (char*)-1)
 6d9:	83 c4 10             	add    $0x10,%esp
 6dc:	83 f8 ff             	cmp    $0xffffffff,%eax
 6df:	74 1c                	je     6fd <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6e1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6e4:	83 c0 08             	add    $0x8,%eax
 6e7:	83 ec 0c             	sub    $0xc,%esp
 6ea:	50                   	push   %eax
 6eb:	e8 54 ff ff ff       	call   644 <free>
  return freep;
 6f0:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 6f5:	83 c4 10             	add    $0x10,%esp
}
 6f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6fb:	c9                   	leave  
 6fc:	c3                   	ret    
    return 0;
 6fd:	b8 00 00 00 00       	mov    $0x0,%eax
 702:	eb f4                	jmp    6f8 <morecore+0x44>

00000704 <malloc>:

void*
malloc(uint nbytes)
{
 704:	55                   	push   %ebp
 705:	89 e5                	mov    %esp,%ebp
 707:	53                   	push   %ebx
 708:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70b:	8b 45 08             	mov    0x8(%ebp),%eax
 70e:	8d 58 07             	lea    0x7(%eax),%ebx
 711:	c1 eb 03             	shr    $0x3,%ebx
 714:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 717:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 71d:	85 c9                	test   %ecx,%ecx
 71f:	74 04                	je     725 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 721:	8b 01                	mov    (%ecx),%eax
 723:	eb 4a                	jmp    76f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 725:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 72c:	0d 00 00 
 72f:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 736:	0d 00 00 
    base.s.size = 0;
 739:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 740:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 743:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 748:	eb d7                	jmp    721 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 74a:	74 19                	je     765 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 74c:	29 da                	sub    %ebx,%edx
 74e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 751:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 754:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 757:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 75d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 760:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 763:	c9                   	leave  
 764:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 765:	8b 10                	mov    (%eax),%edx
 767:	89 11                	mov    %edx,(%ecx)
 769:	eb ec                	jmp    757 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 76b:	89 c1                	mov    %eax,%ecx
 76d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 76f:	8b 50 04             	mov    0x4(%eax),%edx
 772:	39 da                	cmp    %ebx,%edx
 774:	73 d4                	jae    74a <malloc+0x46>
    if(p == freep)
 776:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 77c:	75 ed                	jne    76b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 77e:	89 d8                	mov    %ebx,%eax
 780:	e8 2f ff ff ff       	call   6b4 <morecore>
 785:	85 c0                	test   %eax,%eax
 787:	75 e2                	jne    76b <malloc+0x67>
 789:	eb d5                	jmp    760 <malloc+0x5c>
