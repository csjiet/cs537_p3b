
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2a:	68 48 07 00 00       	push   $0x748
  2f:	6a 01                	push   $0x1
  31:	e8 62 04 00 00       	call   498 <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 34 01 00 00       	call   180 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 dd 02 00 00       	call   33b <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 5b 07 00 00       	push   $0x75b
  70:	6a 01                	push   $0x1
  72:	e8 21 04 00 00       	call   498 <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 f8 02 00 00       	call   383 <open>
  8b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 b7 02 00 00       	call   363 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 ab 02 00 00       	call   36b <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 65 07 00 00       	push   $0x765
  c8:	6a 01                	push   $0x1
  ca:	e8 c9 03 00 00       	call   498 <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 a6 02 00 00       	call   383 <open>
  dd:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
    read(fd, data, sizeof(data));
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 5d 02 00 00       	call   35b <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 59 02 00 00       	call   36b <close>

  wait();
 112:	e8 34 02 00 00       	call   34b <wait>

  exit();
 117:	e8 27 02 00 00       	call   343 <exit>

0000011c <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	56                   	push   %esi
 120:	53                   	push   %ebx
 121:	8b 75 08             	mov    0x8(%ebp),%esi
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 127:	89 f0                	mov    %esi,%eax
 129:	89 d1                	mov    %edx,%ecx
 12b:	83 c2 01             	add    $0x1,%edx
 12e:	89 c3                	mov    %eax,%ebx
 130:	83 c0 01             	add    $0x1,%eax
 133:	0f b6 09             	movzbl (%ecx),%ecx
 136:	88 0b                	mov    %cl,(%ebx)
 138:	84 c9                	test   %cl,%cl
 13a:	75 ed                	jne    129 <strcpy+0xd>
    ;
  return os;
}
 13c:	89 f0                	mov    %esi,%eax
 13e:	5b                   	pop    %ebx
 13f:	5e                   	pop    %esi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    

00000142 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	8b 4d 08             	mov    0x8(%ebp),%ecx
 148:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14b:	eb 06                	jmp    153 <strcmp+0x11>
    p++, q++;
 14d:	83 c1 01             	add    $0x1,%ecx
 150:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 153:	0f b6 01             	movzbl (%ecx),%eax
 156:	84 c0                	test   %al,%al
 158:	74 04                	je     15e <strcmp+0x1c>
 15a:	3a 02                	cmp    (%edx),%al
 15c:	74 ef                	je     14d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 15e:	0f b6 c0             	movzbl %al,%eax
 161:	0f b6 12             	movzbl (%edx),%edx
 164:	29 d0                	sub    %edx,%eax
}
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    

00000168 <strlen>:

uint
strlen(const char *s)
{
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 16e:	b8 00 00 00 00       	mov    $0x0,%eax
 173:	eb 03                	jmp    178 <strlen+0x10>
 175:	83 c0 01             	add    $0x1,%eax
 178:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 17c:	75 f7                	jne    175 <strlen+0xd>
    ;
  return n;
}
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	89 d7                	mov    %edx,%edi
 189:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18c:	8b 45 0c             	mov    0xc(%ebp),%eax
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 7d fc             	mov    -0x4(%ebp),%edi
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <strchr>:

char*
strchr(const char *s, char c)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1a3:	eb 03                	jmp    1a8 <strchr+0xf>
 1a5:	83 c0 01             	add    $0x1,%eax
 1a8:	0f b6 10             	movzbl (%eax),%edx
 1ab:	84 d2                	test   %dl,%dl
 1ad:	74 06                	je     1b5 <strchr+0x1c>
    if(*s == c)
 1af:	38 ca                	cmp    %cl,%dl
 1b1:	75 f2                	jne    1a5 <strchr+0xc>
 1b3:	eb 05                	jmp    1ba <strchr+0x21>
      return (char*)s;
  return 0;
 1b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    

000001bc <gets>:

char*
gets(char *buf, int max)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	57                   	push   %edi
 1c0:	56                   	push   %esi
 1c1:	53                   	push   %ebx
 1c2:	83 ec 1c             	sub    $0x1c,%esp
 1c5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 1cd:	89 de                	mov    %ebx,%esi
 1cf:	83 c3 01             	add    $0x1,%ebx
 1d2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d5:	7d 2e                	jge    205 <gets+0x49>
    cc = read(0, &c, 1);
 1d7:	83 ec 04             	sub    $0x4,%esp
 1da:	6a 01                	push   $0x1
 1dc:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1df:	50                   	push   %eax
 1e0:	6a 00                	push   $0x0
 1e2:	e8 74 01 00 00       	call   35b <read>
    if(cc < 1)
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	85 c0                	test   %eax,%eax
 1ec:	7e 17                	jle    205 <gets+0x49>
      break;
    buf[i++] = c;
 1ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f2:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1f5:	3c 0a                	cmp    $0xa,%al
 1f7:	0f 94 c2             	sete   %dl
 1fa:	3c 0d                	cmp    $0xd,%al
 1fc:	0f 94 c0             	sete   %al
 1ff:	08 c2                	or     %al,%dl
 201:	74 ca                	je     1cd <gets+0x11>
    buf[i++] = c;
 203:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 205:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 209:	89 f8                	mov    %edi,%eax
 20b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20e:	5b                   	pop    %ebx
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <stat>:

int
stat(const char *n, struct stat *st)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 218:	83 ec 08             	sub    $0x8,%esp
 21b:	6a 00                	push   $0x0
 21d:	ff 75 08             	push   0x8(%ebp)
 220:	e8 5e 01 00 00       	call   383 <open>
  if(fd < 0)
 225:	83 c4 10             	add    $0x10,%esp
 228:	85 c0                	test   %eax,%eax
 22a:	78 24                	js     250 <stat+0x3d>
 22c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	push   0xc(%ebp)
 234:	50                   	push   %eax
 235:	e8 61 01 00 00       	call   39b <fstat>
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	89 1c 24             	mov    %ebx,(%esp)
 23f:	e8 27 01 00 00       	call   36b <close>
  return r;
 244:	83 c4 10             	add    $0x10,%esp
}
 247:	89 f0                	mov    %esi,%eax
 249:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb f0                	jmp    247 <stat+0x34>

00000257 <atoi>:

int
atoi(const char *s)
{
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	53                   	push   %ebx
 25b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 25e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 263:	eb 10                	jmp    275 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 265:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 268:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 26b:	83 c1 01             	add    $0x1,%ecx
 26e:	0f be c0             	movsbl %al,%eax
 271:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	8d 58 d0             	lea    -0x30(%eax),%ebx
 27b:	80 fb 09             	cmp    $0x9,%bl
 27e:	76 e5                	jbe    265 <atoi+0xe>
  return n;
}
 280:	89 d0                	mov    %edx,%eax
 282:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	8b 75 08             	mov    0x8(%ebp),%esi
 28f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 292:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 295:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 297:	eb 0d                	jmp    2a6 <memmove+0x1f>
    *dst++ = *src++;
 299:	0f b6 01             	movzbl (%ecx),%eax
 29c:	88 02                	mov    %al,(%edx)
 29e:	8d 49 01             	lea    0x1(%ecx),%ecx
 2a1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2a4:	89 d8                	mov    %ebx,%eax
 2a6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2a9:	85 c0                	test   %eax,%eax
 2ab:	7f ec                	jg     299 <memmove+0x12>
  return vdst;
}
 2ad:	89 f0                	mov    %esi,%eax
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    

000002b3 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 2b3:	55                   	push   %ebp
 2b4:	89 e5                	mov    %esp,%ebp
 2b6:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 2b9:	68 00 10 00 00       	push   $0x1000
 2be:	e8 fb 03 00 00       	call   6be <malloc>

  return clone(start_routine, arg1, arg2, stack);
 2c3:	50                   	push   %eax
 2c4:	ff 75 10             	push   0x10(%ebp)
 2c7:	ff 75 0c             	push   0xc(%ebp)
 2ca:	ff 75 08             	push   0x8(%ebp)
 2cd:	e8 11 01 00 00       	call   3e3 <clone>
}
 2d2:	c9                   	leave  
 2d3:	c3                   	ret    

000002d4 <thread_join>:

int thread_join(){
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	53                   	push   %ebx
 2d8:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 2db:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2de:	50                   	push   %eax
 2df:	e8 07 01 00 00       	call   3eb <join>
  if (x < 0) {
 2e4:	83 c4 10             	add    $0x10,%esp
 2e7:	85 c0                	test   %eax,%eax
 2e9:	78 17                	js     302 <thread_join+0x2e>
 2eb:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 2ed:	83 ec 0c             	sub    $0xc,%esp
 2f0:	ff 75 f4             	push   -0xc(%ebp)
 2f3:	e8 06 03 00 00       	call   5fe <free>
  return x;
 2f8:	83 c4 10             	add    $0x10,%esp
}
 2fb:	89 d8                	mov    %ebx,%eax
 2fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 300:	c9                   	leave  
 301:	c3                   	ret    
    return -1;
 302:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 307:	eb f2                	jmp    2fb <thread_join+0x27>

00000309 <lock_init>:

void lock_init(lock_t *spin){
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 30c:	8b 45 08             	mov    0x8(%ebp),%eax
 30f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 315:	5d                   	pop    %ebp
 316:	c3                   	ret    

00000317 <lock_acquire>:

void lock_acquire(lock_t *spin){
 317:	55                   	push   %ebp
 318:	89 e5                	mov    %esp,%ebp
 31a:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 31d:	b8 01 00 00 00       	mov    $0x1,%eax
 322:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 325:	85 c0                	test   %eax,%eax
 327:	75 f4                	jne    31d <lock_acquire+0x6>

}
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    

0000032b <lock_release>:

void lock_release(lock_t *spin){
 32b:	55                   	push   %ebp
 32c:	89 e5                	mov    %esp,%ebp
 32e:	8b 55 08             	mov    0x8(%ebp),%edx
 331:	b8 00 00 00 00       	mov    $0x0,%eax
 336:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <exit>:
SYSCALL(exit)
 343:	b8 02 00 00 00       	mov    $0x2,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <wait>:
SYSCALL(wait)
 34b:	b8 03 00 00 00       	mov    $0x3,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <pipe>:
SYSCALL(pipe)
 353:	b8 04 00 00 00       	mov    $0x4,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <read>:
SYSCALL(read)
 35b:	b8 05 00 00 00       	mov    $0x5,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <write>:
SYSCALL(write)
 363:	b8 10 00 00 00       	mov    $0x10,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <close>:
SYSCALL(close)
 36b:	b8 15 00 00 00       	mov    $0x15,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <kill>:
SYSCALL(kill)
 373:	b8 06 00 00 00       	mov    $0x6,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <exec>:
SYSCALL(exec)
 37b:	b8 07 00 00 00       	mov    $0x7,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <open>:
SYSCALL(open)
 383:	b8 0f 00 00 00       	mov    $0xf,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <mknod>:
SYSCALL(mknod)
 38b:	b8 11 00 00 00       	mov    $0x11,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <unlink>:
SYSCALL(unlink)
 393:	b8 12 00 00 00       	mov    $0x12,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <fstat>:
SYSCALL(fstat)
 39b:	b8 08 00 00 00       	mov    $0x8,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <link>:
SYSCALL(link)
 3a3:	b8 13 00 00 00       	mov    $0x13,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mkdir>:
SYSCALL(mkdir)
 3ab:	b8 14 00 00 00       	mov    $0x14,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <chdir>:
SYSCALL(chdir)
 3b3:	b8 09 00 00 00       	mov    $0x9,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <dup>:
SYSCALL(dup)
 3bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <getpid>:
SYSCALL(getpid)
 3c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <sbrk>:
SYSCALL(sbrk)
 3cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <sleep>:
SYSCALL(sleep)
 3d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <uptime>:
SYSCALL(uptime)
 3db:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <clone>:
SYSCALL(clone)
 3e3:	b8 16 00 00 00       	mov    $0x16,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <join>:
 3eb:	b8 17 00 00 00       	mov    $0x17,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	83 ec 1c             	sub    $0x1c,%esp
 3f9:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3fc:	6a 01                	push   $0x1
 3fe:	8d 55 f4             	lea    -0xc(%ebp),%edx
 401:	52                   	push   %edx
 402:	50                   	push   %eax
 403:	e8 5b ff ff ff       	call   363 <write>
}
 408:	83 c4 10             	add    $0x10,%esp
 40b:	c9                   	leave  
 40c:	c3                   	ret    

0000040d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 40d:	55                   	push   %ebp
 40e:	89 e5                	mov    %esp,%ebp
 410:	57                   	push   %edi
 411:	56                   	push   %esi
 412:	53                   	push   %ebx
 413:	83 ec 2c             	sub    $0x2c,%esp
 416:	89 45 d0             	mov    %eax,-0x30(%ebp)
 419:	89 d0                	mov    %edx,%eax
 41b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 421:	0f 95 c1             	setne  %cl
 424:	c1 ea 1f             	shr    $0x1f,%edx
 427:	84 d1                	test   %dl,%cl
 429:	74 44                	je     46f <printint+0x62>
    neg = 1;
    x = -xx;
 42b:	f7 d8                	neg    %eax
 42d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 42f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 436:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 43b:	89 c8                	mov    %ecx,%eax
 43d:	ba 00 00 00 00       	mov    $0x0,%edx
 442:	f7 f6                	div    %esi
 444:	89 df                	mov    %ebx,%edi
 446:	83 c3 01             	add    $0x1,%ebx
 449:	0f b6 92 cc 07 00 00 	movzbl 0x7cc(%edx),%edx
 450:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 454:	89 ca                	mov    %ecx,%edx
 456:	89 c1                	mov    %eax,%ecx
 458:	39 d6                	cmp    %edx,%esi
 45a:	76 df                	jbe    43b <printint+0x2e>
  if(neg)
 45c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 460:	74 31                	je     493 <printint+0x86>
    buf[i++] = '-';
 462:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 467:	8d 5f 02             	lea    0x2(%edi),%ebx
 46a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 46d:	eb 17                	jmp    486 <printint+0x79>
    x = xx;
 46f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 471:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 478:	eb bc                	jmp    436 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 47a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 47f:	89 f0                	mov    %esi,%eax
 481:	e8 6d ff ff ff       	call   3f3 <putc>
  while(--i >= 0)
 486:	83 eb 01             	sub    $0x1,%ebx
 489:	79 ef                	jns    47a <printint+0x6d>
}
 48b:	83 c4 2c             	add    $0x2c,%esp
 48e:	5b                   	pop    %ebx
 48f:	5e                   	pop    %esi
 490:	5f                   	pop    %edi
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    
 493:	8b 75 d0             	mov    -0x30(%ebp),%esi
 496:	eb ee                	jmp    486 <printint+0x79>

00000498 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 498:	55                   	push   %ebp
 499:	89 e5                	mov    %esp,%ebp
 49b:	57                   	push   %edi
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4a1:	8d 45 10             	lea    0x10(%ebp),%eax
 4a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4a7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4ac:	bb 00 00 00 00       	mov    $0x0,%ebx
 4b1:	eb 14                	jmp    4c7 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4b3:	89 fa                	mov    %edi,%edx
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 4b8:	e8 36 ff ff ff       	call   3f3 <putc>
 4bd:	eb 05                	jmp    4c4 <printf+0x2c>
      }
    } else if(state == '%'){
 4bf:	83 fe 25             	cmp    $0x25,%esi
 4c2:	74 25                	je     4e9 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4c4:	83 c3 01             	add    $0x1,%ebx
 4c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ca:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4ce:	84 c0                	test   %al,%al
 4d0:	0f 84 20 01 00 00    	je     5f6 <printf+0x15e>
    c = fmt[i] & 0xff;
 4d6:	0f be f8             	movsbl %al,%edi
 4d9:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4dc:	85 f6                	test   %esi,%esi
 4de:	75 df                	jne    4bf <printf+0x27>
      if(c == '%'){
 4e0:	83 f8 25             	cmp    $0x25,%eax
 4e3:	75 ce                	jne    4b3 <printf+0x1b>
        state = '%';
 4e5:	89 c6                	mov    %eax,%esi
 4e7:	eb db                	jmp    4c4 <printf+0x2c>
      if(c == 'd'){
 4e9:	83 f8 25             	cmp    $0x25,%eax
 4ec:	0f 84 cf 00 00 00    	je     5c1 <printf+0x129>
 4f2:	0f 8c dd 00 00 00    	jl     5d5 <printf+0x13d>
 4f8:	83 f8 78             	cmp    $0x78,%eax
 4fb:	0f 8f d4 00 00 00    	jg     5d5 <printf+0x13d>
 501:	83 f8 63             	cmp    $0x63,%eax
 504:	0f 8c cb 00 00 00    	jl     5d5 <printf+0x13d>
 50a:	83 e8 63             	sub    $0x63,%eax
 50d:	83 f8 15             	cmp    $0x15,%eax
 510:	0f 87 bf 00 00 00    	ja     5d5 <printf+0x13d>
 516:	ff 24 85 74 07 00 00 	jmp    *0x774(,%eax,4)
        printint(fd, *ap, 10, 1);
 51d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 520:	8b 17                	mov    (%edi),%edx
 522:	83 ec 0c             	sub    $0xc,%esp
 525:	6a 01                	push   $0x1
 527:	b9 0a 00 00 00       	mov    $0xa,%ecx
 52c:	8b 45 08             	mov    0x8(%ebp),%eax
 52f:	e8 d9 fe ff ff       	call   40d <printint>
        ap++;
 534:	83 c7 04             	add    $0x4,%edi
 537:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 53a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 53d:	be 00 00 00 00       	mov    $0x0,%esi
 542:	eb 80                	jmp    4c4 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 544:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 547:	8b 17                	mov    (%edi),%edx
 549:	83 ec 0c             	sub    $0xc,%esp
 54c:	6a 00                	push   $0x0
 54e:	b9 10 00 00 00       	mov    $0x10,%ecx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	e8 b2 fe ff ff       	call   40d <printint>
        ap++;
 55b:	83 c7 04             	add    $0x4,%edi
 55e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 561:	83 c4 10             	add    $0x10,%esp
      state = 0;
 564:	be 00 00 00 00       	mov    $0x0,%esi
 569:	e9 56 ff ff ff       	jmp    4c4 <printf+0x2c>
        s = (char*)*ap;
 56e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 571:	8b 30                	mov    (%eax),%esi
        ap++;
 573:	83 c0 04             	add    $0x4,%eax
 576:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 579:	85 f6                	test   %esi,%esi
 57b:	75 15                	jne    592 <printf+0xfa>
          s = "(null)";
 57d:	be 6b 07 00 00       	mov    $0x76b,%esi
 582:	eb 0e                	jmp    592 <printf+0xfa>
          putc(fd, *s);
 584:	0f be d2             	movsbl %dl,%edx
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	e8 64 fe ff ff       	call   3f3 <putc>
          s++;
 58f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 592:	0f b6 16             	movzbl (%esi),%edx
 595:	84 d2                	test   %dl,%dl
 597:	75 eb                	jne    584 <printf+0xec>
      state = 0;
 599:	be 00 00 00 00       	mov    $0x0,%esi
 59e:	e9 21 ff ff ff       	jmp    4c4 <printf+0x2c>
        putc(fd, *ap);
 5a3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5a6:	0f be 17             	movsbl (%edi),%edx
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	e8 42 fe ff ff       	call   3f3 <putc>
        ap++;
 5b1:	83 c7 04             	add    $0x4,%edi
 5b4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5b7:	be 00 00 00 00       	mov    $0x0,%esi
 5bc:	e9 03 ff ff ff       	jmp    4c4 <printf+0x2c>
        putc(fd, c);
 5c1:	89 fa                	mov    %edi,%edx
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	e8 28 fe ff ff       	call   3f3 <putc>
      state = 0;
 5cb:	be 00 00 00 00       	mov    $0x0,%esi
 5d0:	e9 ef fe ff ff       	jmp    4c4 <printf+0x2c>
        putc(fd, '%');
 5d5:	ba 25 00 00 00       	mov    $0x25,%edx
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	e8 11 fe ff ff       	call   3f3 <putc>
        putc(fd, c);
 5e2:	89 fa                	mov    %edi,%edx
 5e4:	8b 45 08             	mov    0x8(%ebp),%eax
 5e7:	e8 07 fe ff ff       	call   3f3 <putc>
      state = 0;
 5ec:	be 00 00 00 00       	mov    $0x0,%esi
 5f1:	e9 ce fe ff ff       	jmp    4c4 <printf+0x2c>
    }
  }
}
 5f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f9:	5b                   	pop    %ebx
 5fa:	5e                   	pop    %esi
 5fb:	5f                   	pop    %edi
 5fc:	5d                   	pop    %ebp
 5fd:	c3                   	ret    

000005fe <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5fe:	55                   	push   %ebp
 5ff:	89 e5                	mov    %esp,%ebp
 601:	57                   	push   %edi
 602:	56                   	push   %esi
 603:	53                   	push   %ebx
 604:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 607:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60a:	a1 1c 0b 00 00       	mov    0xb1c,%eax
 60f:	eb 02                	jmp    613 <free+0x15>
 611:	89 d0                	mov    %edx,%eax
 613:	39 c8                	cmp    %ecx,%eax
 615:	73 04                	jae    61b <free+0x1d>
 617:	39 08                	cmp    %ecx,(%eax)
 619:	77 12                	ja     62d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61b:	8b 10                	mov    (%eax),%edx
 61d:	39 c2                	cmp    %eax,%edx
 61f:	77 f0                	ja     611 <free+0x13>
 621:	39 c8                	cmp    %ecx,%eax
 623:	72 08                	jb     62d <free+0x2f>
 625:	39 ca                	cmp    %ecx,%edx
 627:	77 04                	ja     62d <free+0x2f>
 629:	89 d0                	mov    %edx,%eax
 62b:	eb e6                	jmp    613 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 62d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 630:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 633:	8b 10                	mov    (%eax),%edx
 635:	39 d7                	cmp    %edx,%edi
 637:	74 19                	je     652 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 639:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 63c:	8b 50 04             	mov    0x4(%eax),%edx
 63f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 642:	39 ce                	cmp    %ecx,%esi
 644:	74 1b                	je     661 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 646:	89 08                	mov    %ecx,(%eax)
  freep = p;
 648:	a3 1c 0b 00 00       	mov    %eax,0xb1c
}
 64d:	5b                   	pop    %ebx
 64e:	5e                   	pop    %esi
 64f:	5f                   	pop    %edi
 650:	5d                   	pop    %ebp
 651:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 652:	03 72 04             	add    0x4(%edx),%esi
 655:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 658:	8b 10                	mov    (%eax),%edx
 65a:	8b 12                	mov    (%edx),%edx
 65c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 65f:	eb db                	jmp    63c <free+0x3e>
    p->s.size += bp->s.size;
 661:	03 53 fc             	add    -0x4(%ebx),%edx
 664:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 667:	8b 53 f8             	mov    -0x8(%ebx),%edx
 66a:	89 10                	mov    %edx,(%eax)
 66c:	eb da                	jmp    648 <free+0x4a>

0000066e <morecore>:

static Header*
morecore(uint nu)
{
 66e:	55                   	push   %ebp
 66f:	89 e5                	mov    %esp,%ebp
 671:	53                   	push   %ebx
 672:	83 ec 04             	sub    $0x4,%esp
 675:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 677:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 67c:	77 05                	ja     683 <morecore+0x15>
    nu = 4096;
 67e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 683:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 68a:	83 ec 0c             	sub    $0xc,%esp
 68d:	50                   	push   %eax
 68e:	e8 38 fd ff ff       	call   3cb <sbrk>
  if(p == (char*)-1)
 693:	83 c4 10             	add    $0x10,%esp
 696:	83 f8 ff             	cmp    $0xffffffff,%eax
 699:	74 1c                	je     6b7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 69b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 69e:	83 c0 08             	add    $0x8,%eax
 6a1:	83 ec 0c             	sub    $0xc,%esp
 6a4:	50                   	push   %eax
 6a5:	e8 54 ff ff ff       	call   5fe <free>
  return freep;
 6aa:	a1 1c 0b 00 00       	mov    0xb1c,%eax
 6af:	83 c4 10             	add    $0x10,%esp
}
 6b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6b5:	c9                   	leave  
 6b6:	c3                   	ret    
    return 0;
 6b7:	b8 00 00 00 00       	mov    $0x0,%eax
 6bc:	eb f4                	jmp    6b2 <morecore+0x44>

000006be <malloc>:

void*
malloc(uint nbytes)
{
 6be:	55                   	push   %ebp
 6bf:	89 e5                	mov    %esp,%ebp
 6c1:	53                   	push   %ebx
 6c2:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	8d 58 07             	lea    0x7(%eax),%ebx
 6cb:	c1 eb 03             	shr    $0x3,%ebx
 6ce:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6d1:	8b 0d 1c 0b 00 00    	mov    0xb1c,%ecx
 6d7:	85 c9                	test   %ecx,%ecx
 6d9:	74 04                	je     6df <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6db:	8b 01                	mov    (%ecx),%eax
 6dd:	eb 4a                	jmp    729 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6df:	c7 05 1c 0b 00 00 20 	movl   $0xb20,0xb1c
 6e6:	0b 00 00 
 6e9:	c7 05 20 0b 00 00 20 	movl   $0xb20,0xb20
 6f0:	0b 00 00 
    base.s.size = 0;
 6f3:	c7 05 24 0b 00 00 00 	movl   $0x0,0xb24
 6fa:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6fd:	b9 20 0b 00 00       	mov    $0xb20,%ecx
 702:	eb d7                	jmp    6db <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 704:	74 19                	je     71f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 706:	29 da                	sub    %ebx,%edx
 708:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 70b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 70e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 711:	89 0d 1c 0b 00 00    	mov    %ecx,0xb1c
      return (void*)(p + 1);
 717:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 71a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 71d:	c9                   	leave  
 71e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 71f:	8b 10                	mov    (%eax),%edx
 721:	89 11                	mov    %edx,(%ecx)
 723:	eb ec                	jmp    711 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 725:	89 c1                	mov    %eax,%ecx
 727:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 729:	8b 50 04             	mov    0x4(%eax),%edx
 72c:	39 da                	cmp    %ebx,%edx
 72e:	73 d4                	jae    704 <malloc+0x46>
    if(p == freep)
 730:	39 05 1c 0b 00 00    	cmp    %eax,0xb1c
 736:	75 ed                	jne    725 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 738:	89 d8                	mov    %ebx,%eax
 73a:	e8 2f ff ff ff       	call   66e <morecore>
 73f:	85 c0                	test   %eax,%eax
 741:	75 e2                	jne    725 <malloc+0x67>
 743:	eb d5                	jmp    71a <malloc+0x5c>
