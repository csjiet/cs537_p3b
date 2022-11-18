
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 40 0b 00 00       	push   $0xb40
  15:	56                   	push   %esi
  16:	e8 1c 03 00 00       	call   337 <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 40 0b 00 00       	push   $0xb40
  2d:	6a 01                	push   $0x1
  2f:	e8 0b 03 00 00       	call   33f <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 24 07 00 00       	push   $0x724
  43:	6a 01                	push   $0x1
  45:	e8 2a 04 00 00       	call   474 <printf>
      exit();
  4a:	e8 d0 02 00 00       	call   31f <exit>
    }
  }
  if(n < 0){
  4f:	78 07                	js     58 <cat+0x58>
    printf(1, "cat: read error\n");
    exit();
  }
}
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
    printf(1, "cat: read error\n");
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 36 07 00 00       	push   $0x736
  60:	6a 01                	push   $0x1
  62:	e8 0d 04 00 00       	call   474 <printf>
    exit();
  67:	e8 b3 02 00 00       	call   31f <exit>

0000006c <main>:

int
main(int argc, char *argv[])
{
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
    cat(0);
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 79 02 00 00       	call   31f <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
    close(fd);
  af:	89 1c 24             	mov    %ebx,(%esp)
  b2:	e8 90 02 00 00       	call   347 <close>
  for(i = 1; i < argc; i++){
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
    if((fd = open(argv[i], 0)) < 0){
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	push   (%edi)
  cf:	e8 8b 02 00 00       	call   35f <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 47 07 00 00       	push   $0x747
  e7:	6a 01                	push   $0x1
  e9:	e8 86 03 00 00       	call   474 <printf>
      exit();
  ee:	e8 2c 02 00 00       	call   31f <exit>
  }
  exit();
  f3:	e8 27 02 00 00       	call   31f <exit>

000000f8 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	56                   	push   %esi
  fc:	53                   	push   %ebx
  fd:	8b 75 08             	mov    0x8(%ebp),%esi
 100:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 103:	89 f0                	mov    %esi,%eax
 105:	89 d1                	mov    %edx,%ecx
 107:	83 c2 01             	add    $0x1,%edx
 10a:	89 c3                	mov    %eax,%ebx
 10c:	83 c0 01             	add    $0x1,%eax
 10f:	0f b6 09             	movzbl (%ecx),%ecx
 112:	88 0b                	mov    %cl,(%ebx)
 114:	84 c9                	test   %cl,%cl
 116:	75 ed                	jne    105 <strcpy+0xd>
    ;
  return os;
}
 118:	89 f0                	mov    %esi,%eax
 11a:	5b                   	pop    %ebx
 11b:	5e                   	pop    %esi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    

0000011e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	8b 4d 08             	mov    0x8(%ebp),%ecx
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 127:	eb 06                	jmp    12f <strcmp+0x11>
    p++, q++;
 129:	83 c1 01             	add    $0x1,%ecx
 12c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 12f:	0f b6 01             	movzbl (%ecx),%eax
 132:	84 c0                	test   %al,%al
 134:	74 04                	je     13a <strcmp+0x1c>
 136:	3a 02                	cmp    (%edx),%al
 138:	74 ef                	je     129 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 13a:	0f b6 c0             	movzbl %al,%eax
 13d:	0f b6 12             	movzbl (%edx),%edx
 140:	29 d0                	sub    %edx,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

00000144 <strlen>:

uint
strlen(const char *s)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 14a:	b8 00 00 00 00       	mov    $0x0,%eax
 14f:	eb 03                	jmp    154 <strlen+0x10>
 151:	83 c0 01             	add    $0x1,%eax
 154:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 158:	75 f7                	jne    151 <strlen+0xd>
    ;
  return n;
}
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <memset>:

void*
memset(void *dst, int c, uint n)
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	57                   	push   %edi
 160:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 163:	89 d7                	mov    %edx,%edi
 165:	8b 4d 10             	mov    0x10(%ebp),%ecx
 168:	8b 45 0c             	mov    0xc(%ebp),%eax
 16b:	fc                   	cld    
 16c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 16e:	89 d0                	mov    %edx,%eax
 170:	8b 7d fc             	mov    -0x4(%ebp),%edi
 173:	c9                   	leave  
 174:	c3                   	ret    

00000175 <strchr>:

char*
strchr(const char *s, char c)
{
 175:	55                   	push   %ebp
 176:	89 e5                	mov    %esp,%ebp
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17f:	eb 03                	jmp    184 <strchr+0xf>
 181:	83 c0 01             	add    $0x1,%eax
 184:	0f b6 10             	movzbl (%eax),%edx
 187:	84 d2                	test   %dl,%dl
 189:	74 06                	je     191 <strchr+0x1c>
    if(*s == c)
 18b:	38 ca                	cmp    %cl,%dl
 18d:	75 f2                	jne    181 <strchr+0xc>
 18f:	eb 05                	jmp    196 <strchr+0x21>
      return (char*)s;
  return 0;
 191:	b8 00 00 00 00       	mov    $0x0,%eax
}
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    

00000198 <gets>:

char*
gets(char *buf, int max)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	57                   	push   %edi
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a9:	89 de                	mov    %ebx,%esi
 1ab:	83 c3 01             	add    $0x1,%ebx
 1ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b1:	7d 2e                	jge    1e1 <gets+0x49>
    cc = read(0, &c, 1);
 1b3:	83 ec 04             	sub    $0x4,%esp
 1b6:	6a 01                	push   $0x1
 1b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1bb:	50                   	push   %eax
 1bc:	6a 00                	push   $0x0
 1be:	e8 74 01 00 00       	call   337 <read>
    if(cc < 1)
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	85 c0                	test   %eax,%eax
 1c8:	7e 17                	jle    1e1 <gets+0x49>
      break;
    buf[i++] = c;
 1ca:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ce:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	0f 94 c2             	sete   %dl
 1d6:	3c 0d                	cmp    $0xd,%al
 1d8:	0f 94 c0             	sete   %al
 1db:	08 c2                	or     %al,%dl
 1dd:	74 ca                	je     1a9 <gets+0x11>
    buf[i++] = c;
 1df:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1e1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1e5:	89 f8                	mov    %edi,%eax
 1e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5f                   	pop    %edi
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	56                   	push   %esi
 1f3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	6a 00                	push   $0x0
 1f9:	ff 75 08             	push   0x8(%ebp)
 1fc:	e8 5e 01 00 00       	call   35f <open>
  if(fd < 0)
 201:	83 c4 10             	add    $0x10,%esp
 204:	85 c0                	test   %eax,%eax
 206:	78 24                	js     22c <stat+0x3d>
 208:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20a:	83 ec 08             	sub    $0x8,%esp
 20d:	ff 75 0c             	push   0xc(%ebp)
 210:	50                   	push   %eax
 211:	e8 61 01 00 00       	call   377 <fstat>
 216:	89 c6                	mov    %eax,%esi
  close(fd);
 218:	89 1c 24             	mov    %ebx,(%esp)
 21b:	e8 27 01 00 00       	call   347 <close>
  return r;
 220:	83 c4 10             	add    $0x10,%esp
}
 223:	89 f0                	mov    %esi,%eax
 225:	8d 65 f8             	lea    -0x8(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
    return -1;
 22c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 231:	eb f0                	jmp    223 <stat+0x34>

00000233 <atoi>:

int
atoi(const char *s)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	53                   	push   %ebx
 237:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 23a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 23f:	eb 10                	jmp    251 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 241:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 244:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 247:	83 c1 01             	add    $0x1,%ecx
 24a:	0f be c0             	movsbl %al,%eax
 24d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 251:	0f b6 01             	movzbl (%ecx),%eax
 254:	8d 58 d0             	lea    -0x30(%eax),%ebx
 257:	80 fb 09             	cmp    $0x9,%bl
 25a:	76 e5                	jbe    241 <atoi+0xe>
  return n;
}
 25c:	89 d0                	mov    %edx,%eax
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 26e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 271:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 273:	eb 0d                	jmp    282 <memmove+0x1f>
    *dst++ = *src++;
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	88 02                	mov    %al,(%edx)
 27a:	8d 49 01             	lea    0x1(%ecx),%ecx
 27d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 280:	89 d8                	mov    %ebx,%eax
 282:	8d 58 ff             	lea    -0x1(%eax),%ebx
 285:	85 c0                	test   %eax,%eax
 287:	7f ec                	jg     275 <memmove+0x12>
  return vdst;
}
 289:	89 f0                	mov    %esi,%eax
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    

0000028f <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 295:	68 00 10 00 00       	push   $0x1000
 29a:	e8 fb 03 00 00       	call   69a <malloc>

  return clone(start_routine, arg1, arg2, stack);
 29f:	50                   	push   %eax
 2a0:	ff 75 10             	push   0x10(%ebp)
 2a3:	ff 75 0c             	push   0xc(%ebp)
 2a6:	ff 75 08             	push   0x8(%ebp)
 2a9:	e8 11 01 00 00       	call   3bf <clone>
}
 2ae:	c9                   	leave  
 2af:	c3                   	ret    

000002b0 <thread_join>:

int thread_join(){
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 2b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2ba:	50                   	push   %eax
 2bb:	e8 07 01 00 00       	call   3c7 <join>
  if (x < 0) {
 2c0:	83 c4 10             	add    $0x10,%esp
 2c3:	85 c0                	test   %eax,%eax
 2c5:	78 17                	js     2de <thread_join+0x2e>
 2c7:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 2c9:	83 ec 0c             	sub    $0xc,%esp
 2cc:	ff 75 f4             	push   -0xc(%ebp)
 2cf:	e8 06 03 00 00       	call   5da <free>
  return x;
 2d4:	83 c4 10             	add    $0x10,%esp
}
 2d7:	89 d8                	mov    %ebx,%eax
 2d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2dc:	c9                   	leave  
 2dd:	c3                   	ret    
    return -1;
 2de:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 2e3:	eb f2                	jmp    2d7 <thread_join+0x27>

000002e5 <lock_init>:

void lock_init(lock_t *spin){
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 2e8:	8b 45 08             	mov    0x8(%ebp),%eax
 2eb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    

000002f3 <lock_acquire>:

void lock_acquire(lock_t *spin){
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2f9:	b8 01 00 00 00       	mov    $0x1,%eax
 2fe:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 301:	85 c0                	test   %eax,%eax
 303:	75 f4                	jne    2f9 <lock_acquire+0x6>

}
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    

00000307 <lock_release>:

void lock_release(lock_t *spin){
 307:	55                   	push   %ebp
 308:	89 e5                	mov    %esp,%ebp
 30a:	8b 55 08             	mov    0x8(%ebp),%edx
 30d:	b8 00 00 00 00       	mov    $0x0,%eax
 312:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 315:	5d                   	pop    %ebp
 316:	c3                   	ret    

00000317 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 317:	b8 01 00 00 00       	mov    $0x1,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <exit>:
SYSCALL(exit)
 31f:	b8 02 00 00 00       	mov    $0x2,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <wait>:
SYSCALL(wait)
 327:	b8 03 00 00 00       	mov    $0x3,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <pipe>:
SYSCALL(pipe)
 32f:	b8 04 00 00 00       	mov    $0x4,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <read>:
SYSCALL(read)
 337:	b8 05 00 00 00       	mov    $0x5,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <write>:
SYSCALL(write)
 33f:	b8 10 00 00 00       	mov    $0x10,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <close>:
SYSCALL(close)
 347:	b8 15 00 00 00       	mov    $0x15,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <kill>:
SYSCALL(kill)
 34f:	b8 06 00 00 00       	mov    $0x6,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <exec>:
SYSCALL(exec)
 357:	b8 07 00 00 00       	mov    $0x7,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <open>:
SYSCALL(open)
 35f:	b8 0f 00 00 00       	mov    $0xf,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <mknod>:
SYSCALL(mknod)
 367:	b8 11 00 00 00       	mov    $0x11,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <unlink>:
SYSCALL(unlink)
 36f:	b8 12 00 00 00       	mov    $0x12,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <fstat>:
SYSCALL(fstat)
 377:	b8 08 00 00 00       	mov    $0x8,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <link>:
SYSCALL(link)
 37f:	b8 13 00 00 00       	mov    $0x13,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <mkdir>:
SYSCALL(mkdir)
 387:	b8 14 00 00 00       	mov    $0x14,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <chdir>:
SYSCALL(chdir)
 38f:	b8 09 00 00 00       	mov    $0x9,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <dup>:
SYSCALL(dup)
 397:	b8 0a 00 00 00       	mov    $0xa,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <getpid>:
SYSCALL(getpid)
 39f:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <sbrk>:
SYSCALL(sbrk)
 3a7:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <sleep>:
SYSCALL(sleep)
 3af:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <uptime>:
SYSCALL(uptime)
 3b7:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <clone>:
SYSCALL(clone)
 3bf:	b8 16 00 00 00       	mov    $0x16,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <join>:
 3c7:	b8 17 00 00 00       	mov    $0x17,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	83 ec 1c             	sub    $0x1c,%esp
 3d5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3d8:	6a 01                	push   $0x1
 3da:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3dd:	52                   	push   %edx
 3de:	50                   	push   %eax
 3df:	e8 5b ff ff ff       	call   33f <write>
}
 3e4:	83 c4 10             	add    $0x10,%esp
 3e7:	c9                   	leave  
 3e8:	c3                   	ret    

000003e9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e9:	55                   	push   %ebp
 3ea:	89 e5                	mov    %esp,%ebp
 3ec:	57                   	push   %edi
 3ed:	56                   	push   %esi
 3ee:	53                   	push   %ebx
 3ef:	83 ec 2c             	sub    $0x2c,%esp
 3f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3f5:	89 d0                	mov    %edx,%eax
 3f7:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3f9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3fd:	0f 95 c1             	setne  %cl
 400:	c1 ea 1f             	shr    $0x1f,%edx
 403:	84 d1                	test   %dl,%cl
 405:	74 44                	je     44b <printint+0x62>
    neg = 1;
    x = -xx;
 407:	f7 d8                	neg    %eax
 409:	89 c1                	mov    %eax,%ecx
    neg = 1;
 40b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 412:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 417:	89 c8                	mov    %ecx,%eax
 419:	ba 00 00 00 00       	mov    $0x0,%edx
 41e:	f7 f6                	div    %esi
 420:	89 df                	mov    %ebx,%edi
 422:	83 c3 01             	add    $0x1,%ebx
 425:	0f b6 92 bc 07 00 00 	movzbl 0x7bc(%edx),%edx
 42c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 430:	89 ca                	mov    %ecx,%edx
 432:	89 c1                	mov    %eax,%ecx
 434:	39 d6                	cmp    %edx,%esi
 436:	76 df                	jbe    417 <printint+0x2e>
  if(neg)
 438:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 43c:	74 31                	je     46f <printint+0x86>
    buf[i++] = '-';
 43e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 443:	8d 5f 02             	lea    0x2(%edi),%ebx
 446:	8b 75 d0             	mov    -0x30(%ebp),%esi
 449:	eb 17                	jmp    462 <printint+0x79>
    x = xx;
 44b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 44d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 454:	eb bc                	jmp    412 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 456:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 45b:	89 f0                	mov    %esi,%eax
 45d:	e8 6d ff ff ff       	call   3cf <putc>
  while(--i >= 0)
 462:	83 eb 01             	sub    $0x1,%ebx
 465:	79 ef                	jns    456 <printint+0x6d>
}
 467:	83 c4 2c             	add    $0x2c,%esp
 46a:	5b                   	pop    %ebx
 46b:	5e                   	pop    %esi
 46c:	5f                   	pop    %edi
 46d:	5d                   	pop    %ebp
 46e:	c3                   	ret    
 46f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 472:	eb ee                	jmp    462 <printint+0x79>

00000474 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	57                   	push   %edi
 478:	56                   	push   %esi
 479:	53                   	push   %ebx
 47a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 47d:	8d 45 10             	lea    0x10(%ebp),%eax
 480:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 483:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 488:	bb 00 00 00 00       	mov    $0x0,%ebx
 48d:	eb 14                	jmp    4a3 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 48f:	89 fa                	mov    %edi,%edx
 491:	8b 45 08             	mov    0x8(%ebp),%eax
 494:	e8 36 ff ff ff       	call   3cf <putc>
 499:	eb 05                	jmp    4a0 <printf+0x2c>
      }
    } else if(state == '%'){
 49b:	83 fe 25             	cmp    $0x25,%esi
 49e:	74 25                	je     4c5 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4a0:	83 c3 01             	add    $0x1,%ebx
 4a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4aa:	84 c0                	test   %al,%al
 4ac:	0f 84 20 01 00 00    	je     5d2 <printf+0x15e>
    c = fmt[i] & 0xff;
 4b2:	0f be f8             	movsbl %al,%edi
 4b5:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4b8:	85 f6                	test   %esi,%esi
 4ba:	75 df                	jne    49b <printf+0x27>
      if(c == '%'){
 4bc:	83 f8 25             	cmp    $0x25,%eax
 4bf:	75 ce                	jne    48f <printf+0x1b>
        state = '%';
 4c1:	89 c6                	mov    %eax,%esi
 4c3:	eb db                	jmp    4a0 <printf+0x2c>
      if(c == 'd'){
 4c5:	83 f8 25             	cmp    $0x25,%eax
 4c8:	0f 84 cf 00 00 00    	je     59d <printf+0x129>
 4ce:	0f 8c dd 00 00 00    	jl     5b1 <printf+0x13d>
 4d4:	83 f8 78             	cmp    $0x78,%eax
 4d7:	0f 8f d4 00 00 00    	jg     5b1 <printf+0x13d>
 4dd:	83 f8 63             	cmp    $0x63,%eax
 4e0:	0f 8c cb 00 00 00    	jl     5b1 <printf+0x13d>
 4e6:	83 e8 63             	sub    $0x63,%eax
 4e9:	83 f8 15             	cmp    $0x15,%eax
 4ec:	0f 87 bf 00 00 00    	ja     5b1 <printf+0x13d>
 4f2:	ff 24 85 64 07 00 00 	jmp    *0x764(,%eax,4)
        printint(fd, *ap, 10, 1);
 4f9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4fc:	8b 17                	mov    (%edi),%edx
 4fe:	83 ec 0c             	sub    $0xc,%esp
 501:	6a 01                	push   $0x1
 503:	b9 0a 00 00 00       	mov    $0xa,%ecx
 508:	8b 45 08             	mov    0x8(%ebp),%eax
 50b:	e8 d9 fe ff ff       	call   3e9 <printint>
        ap++;
 510:	83 c7 04             	add    $0x4,%edi
 513:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 516:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 519:	be 00 00 00 00       	mov    $0x0,%esi
 51e:	eb 80                	jmp    4a0 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 520:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 523:	8b 17                	mov    (%edi),%edx
 525:	83 ec 0c             	sub    $0xc,%esp
 528:	6a 00                	push   $0x0
 52a:	b9 10 00 00 00       	mov    $0x10,%ecx
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	e8 b2 fe ff ff       	call   3e9 <printint>
        ap++;
 537:	83 c7 04             	add    $0x4,%edi
 53a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 53d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 540:	be 00 00 00 00       	mov    $0x0,%esi
 545:	e9 56 ff ff ff       	jmp    4a0 <printf+0x2c>
        s = (char*)*ap;
 54a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 54d:	8b 30                	mov    (%eax),%esi
        ap++;
 54f:	83 c0 04             	add    $0x4,%eax
 552:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 555:	85 f6                	test   %esi,%esi
 557:	75 15                	jne    56e <printf+0xfa>
          s = "(null)";
 559:	be 5c 07 00 00       	mov    $0x75c,%esi
 55e:	eb 0e                	jmp    56e <printf+0xfa>
          putc(fd, *s);
 560:	0f be d2             	movsbl %dl,%edx
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	e8 64 fe ff ff       	call   3cf <putc>
          s++;
 56b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 56e:	0f b6 16             	movzbl (%esi),%edx
 571:	84 d2                	test   %dl,%dl
 573:	75 eb                	jne    560 <printf+0xec>
      state = 0;
 575:	be 00 00 00 00       	mov    $0x0,%esi
 57a:	e9 21 ff ff ff       	jmp    4a0 <printf+0x2c>
        putc(fd, *ap);
 57f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 582:	0f be 17             	movsbl (%edi),%edx
 585:	8b 45 08             	mov    0x8(%ebp),%eax
 588:	e8 42 fe ff ff       	call   3cf <putc>
        ap++;
 58d:	83 c7 04             	add    $0x4,%edi
 590:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 593:	be 00 00 00 00       	mov    $0x0,%esi
 598:	e9 03 ff ff ff       	jmp    4a0 <printf+0x2c>
        putc(fd, c);
 59d:	89 fa                	mov    %edi,%edx
 59f:	8b 45 08             	mov    0x8(%ebp),%eax
 5a2:	e8 28 fe ff ff       	call   3cf <putc>
      state = 0;
 5a7:	be 00 00 00 00       	mov    $0x0,%esi
 5ac:	e9 ef fe ff ff       	jmp    4a0 <printf+0x2c>
        putc(fd, '%');
 5b1:	ba 25 00 00 00       	mov    $0x25,%edx
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
 5b9:	e8 11 fe ff ff       	call   3cf <putc>
        putc(fd, c);
 5be:	89 fa                	mov    %edi,%edx
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	e8 07 fe ff ff       	call   3cf <putc>
      state = 0;
 5c8:	be 00 00 00 00       	mov    $0x0,%esi
 5cd:	e9 ce fe ff ff       	jmp    4a0 <printf+0x2c>
    }
  }
}
 5d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d5:	5b                   	pop    %ebx
 5d6:	5e                   	pop    %esi
 5d7:	5f                   	pop    %edi
 5d8:	5d                   	pop    %ebp
 5d9:	c3                   	ret    

000005da <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
 5dd:	57                   	push   %edi
 5de:	56                   	push   %esi
 5df:	53                   	push   %ebx
 5e0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e6:	a1 40 0d 00 00       	mov    0xd40,%eax
 5eb:	eb 02                	jmp    5ef <free+0x15>
 5ed:	89 d0                	mov    %edx,%eax
 5ef:	39 c8                	cmp    %ecx,%eax
 5f1:	73 04                	jae    5f7 <free+0x1d>
 5f3:	39 08                	cmp    %ecx,(%eax)
 5f5:	77 12                	ja     609 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f7:	8b 10                	mov    (%eax),%edx
 5f9:	39 c2                	cmp    %eax,%edx
 5fb:	77 f0                	ja     5ed <free+0x13>
 5fd:	39 c8                	cmp    %ecx,%eax
 5ff:	72 08                	jb     609 <free+0x2f>
 601:	39 ca                	cmp    %ecx,%edx
 603:	77 04                	ja     609 <free+0x2f>
 605:	89 d0                	mov    %edx,%eax
 607:	eb e6                	jmp    5ef <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 609:	8b 73 fc             	mov    -0x4(%ebx),%esi
 60c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 60f:	8b 10                	mov    (%eax),%edx
 611:	39 d7                	cmp    %edx,%edi
 613:	74 19                	je     62e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 615:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 618:	8b 50 04             	mov    0x4(%eax),%edx
 61b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 61e:	39 ce                	cmp    %ecx,%esi
 620:	74 1b                	je     63d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 622:	89 08                	mov    %ecx,(%eax)
  freep = p;
 624:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 629:	5b                   	pop    %ebx
 62a:	5e                   	pop    %esi
 62b:	5f                   	pop    %edi
 62c:	5d                   	pop    %ebp
 62d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 62e:	03 72 04             	add    0x4(%edx),%esi
 631:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 634:	8b 10                	mov    (%eax),%edx
 636:	8b 12                	mov    (%edx),%edx
 638:	89 53 f8             	mov    %edx,-0x8(%ebx)
 63b:	eb db                	jmp    618 <free+0x3e>
    p->s.size += bp->s.size;
 63d:	03 53 fc             	add    -0x4(%ebx),%edx
 640:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 643:	8b 53 f8             	mov    -0x8(%ebx),%edx
 646:	89 10                	mov    %edx,(%eax)
 648:	eb da                	jmp    624 <free+0x4a>

0000064a <morecore>:

static Header*
morecore(uint nu)
{
 64a:	55                   	push   %ebp
 64b:	89 e5                	mov    %esp,%ebp
 64d:	53                   	push   %ebx
 64e:	83 ec 04             	sub    $0x4,%esp
 651:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 653:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 658:	77 05                	ja     65f <morecore+0x15>
    nu = 4096;
 65a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 65f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 666:	83 ec 0c             	sub    $0xc,%esp
 669:	50                   	push   %eax
 66a:	e8 38 fd ff ff       	call   3a7 <sbrk>
  if(p == (char*)-1)
 66f:	83 c4 10             	add    $0x10,%esp
 672:	83 f8 ff             	cmp    $0xffffffff,%eax
 675:	74 1c                	je     693 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 677:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 67a:	83 c0 08             	add    $0x8,%eax
 67d:	83 ec 0c             	sub    $0xc,%esp
 680:	50                   	push   %eax
 681:	e8 54 ff ff ff       	call   5da <free>
  return freep;
 686:	a1 40 0d 00 00       	mov    0xd40,%eax
 68b:	83 c4 10             	add    $0x10,%esp
}
 68e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 691:	c9                   	leave  
 692:	c3                   	ret    
    return 0;
 693:	b8 00 00 00 00       	mov    $0x0,%eax
 698:	eb f4                	jmp    68e <morecore+0x44>

0000069a <malloc>:

void*
malloc(uint nbytes)
{
 69a:	55                   	push   %ebp
 69b:	89 e5                	mov    %esp,%ebp
 69d:	53                   	push   %ebx
 69e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a1:	8b 45 08             	mov    0x8(%ebp),%eax
 6a4:	8d 58 07             	lea    0x7(%eax),%ebx
 6a7:	c1 eb 03             	shr    $0x3,%ebx
 6aa:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6ad:	8b 0d 40 0d 00 00    	mov    0xd40,%ecx
 6b3:	85 c9                	test   %ecx,%ecx
 6b5:	74 04                	je     6bb <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b7:	8b 01                	mov    (%ecx),%eax
 6b9:	eb 4a                	jmp    705 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6bb:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 6c2:	0d 00 00 
 6c5:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 6cc:	0d 00 00 
    base.s.size = 0;
 6cf:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 6d6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6d9:	b9 44 0d 00 00       	mov    $0xd44,%ecx
 6de:	eb d7                	jmp    6b7 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6e0:	74 19                	je     6fb <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6e2:	29 da                	sub    %ebx,%edx
 6e4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6e7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6ea:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6ed:	89 0d 40 0d 00 00    	mov    %ecx,0xd40
      return (void*)(p + 1);
 6f3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f9:	c9                   	leave  
 6fa:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6fb:	8b 10                	mov    (%eax),%edx
 6fd:	89 11                	mov    %edx,(%ecx)
 6ff:	eb ec                	jmp    6ed <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 701:	89 c1                	mov    %eax,%ecx
 703:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 705:	8b 50 04             	mov    0x4(%eax),%edx
 708:	39 da                	cmp    %ebx,%edx
 70a:	73 d4                	jae    6e0 <malloc+0x46>
    if(p == freep)
 70c:	39 05 40 0d 00 00    	cmp    %eax,0xd40
 712:	75 ed                	jne    701 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 714:	89 d8                	mov    %ebx,%eax
 716:	e8 2f ff ff ff       	call   64a <morecore>
 71b:	85 c0                	test   %eax,%eax
 71d:	75 e2                	jne    701 <malloc+0x67>
 71f:	eb d5                	jmp    6f6 <malloc+0x5c>
