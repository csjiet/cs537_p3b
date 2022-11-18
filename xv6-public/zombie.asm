
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 37 02 00 00       	call   24d <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 36 02 00 00       	call   255 <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 bc 02 00 00       	call   2e5 <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  2e:	55                   	push   %ebp
  2f:	89 e5                	mov    %esp,%ebp
  31:	56                   	push   %esi
  32:	53                   	push   %ebx
  33:	8b 75 08             	mov    0x8(%ebp),%esi
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  39:	89 f0                	mov    %esi,%eax
  3b:	89 d1                	mov    %edx,%ecx
  3d:	83 c2 01             	add    $0x1,%edx
  40:	89 c3                	mov    %eax,%ebx
  42:	83 c0 01             	add    $0x1,%eax
  45:	0f b6 09             	movzbl (%ecx),%ecx
  48:	88 0b                	mov    %cl,(%ebx)
  4a:	84 c9                	test   %cl,%cl
  4c:	75 ed                	jne    3b <strcpy+0xd>
    ;
  return os;
}
  4e:	89 f0                	mov    %esi,%eax
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    

00000054 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	8b 4d 08             	mov    0x8(%ebp),%ecx
  5a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  5d:	eb 06                	jmp    65 <strcmp+0x11>
    p++, q++;
  5f:	83 c1 01             	add    $0x1,%ecx
  62:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  65:	0f b6 01             	movzbl (%ecx),%eax
  68:	84 c0                	test   %al,%al
  6a:	74 04                	je     70 <strcmp+0x1c>
  6c:	3a 02                	cmp    (%edx),%al
  6e:	74 ef                	je     5f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  70:	0f b6 c0             	movzbl %al,%eax
  73:	0f b6 12             	movzbl (%edx),%edx
  76:	29 d0                	sub    %edx,%eax
}
  78:	5d                   	pop    %ebp
  79:	c3                   	ret    

0000007a <strlen>:

uint
strlen(const char *s)
{
  7a:	55                   	push   %ebp
  7b:	89 e5                	mov    %esp,%ebp
  7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  80:	b8 00 00 00 00       	mov    $0x0,%eax
  85:	eb 03                	jmp    8a <strlen+0x10>
  87:	83 c0 01             	add    $0x1,%eax
  8a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8e:	75 f7                	jne    87 <strlen+0xd>
    ;
  return n;
}
  90:	5d                   	pop    %ebp
  91:	c3                   	ret    

00000092 <memset>:

void*
memset(void *dst, int c, uint n)
{
  92:	55                   	push   %ebp
  93:	89 e5                	mov    %esp,%ebp
  95:	57                   	push   %edi
  96:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  99:	89 d7                	mov    %edx,%edi
  9b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  a1:	fc                   	cld    
  a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  a4:	89 d0                	mov    %edx,%eax
  a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
  a9:	c9                   	leave  
  aa:	c3                   	ret    

000000ab <strchr>:

char*
strchr(const char *s, char c)
{
  ab:	55                   	push   %ebp
  ac:	89 e5                	mov    %esp,%ebp
  ae:	8b 45 08             	mov    0x8(%ebp),%eax
  b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  b5:	eb 03                	jmp    ba <strchr+0xf>
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	0f b6 10             	movzbl (%eax),%edx
  bd:	84 d2                	test   %dl,%dl
  bf:	74 06                	je     c7 <strchr+0x1c>
    if(*s == c)
  c1:	38 ca                	cmp    %cl,%dl
  c3:	75 f2                	jne    b7 <strchr+0xc>
  c5:	eb 05                	jmp    cc <strchr+0x21>
      return (char*)s;
  return 0;
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  cc:	5d                   	pop    %ebp
  cd:	c3                   	ret    

000000ce <gets>:

char*
gets(char *buf, int max)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	57                   	push   %edi
  d2:	56                   	push   %esi
  d3:	53                   	push   %ebx
  d4:	83 ec 1c             	sub    $0x1c,%esp
  d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  da:	bb 00 00 00 00       	mov    $0x0,%ebx
  df:	89 de                	mov    %ebx,%esi
  e1:	83 c3 01             	add    $0x1,%ebx
  e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  e7:	7d 2e                	jge    117 <gets+0x49>
    cc = read(0, &c, 1);
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	6a 01                	push   $0x1
  ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
  f1:	50                   	push   %eax
  f2:	6a 00                	push   $0x0
  f4:	e8 74 01 00 00       	call   26d <read>
    if(cc < 1)
  f9:	83 c4 10             	add    $0x10,%esp
  fc:	85 c0                	test   %eax,%eax
  fe:	7e 17                	jle    117 <gets+0x49>
      break;
    buf[i++] = c;
 100:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 104:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c2             	sete   %dl
 10c:	3c 0d                	cmp    $0xd,%al
 10e:	0f 94 c0             	sete   %al
 111:	08 c2                	or     %al,%dl
 113:	74 ca                	je     df <gets+0x11>
    buf[i++] = c;
 115:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 117:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 11b:	89 f8                	mov    %edi,%eax
 11d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 120:	5b                   	pop    %ebx
 121:	5e                   	pop    %esi
 122:	5f                   	pop    %edi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <stat>:

int
stat(const char *n, struct stat *st)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 12a:	83 ec 08             	sub    $0x8,%esp
 12d:	6a 00                	push   $0x0
 12f:	ff 75 08             	push   0x8(%ebp)
 132:	e8 5e 01 00 00       	call   295 <open>
  if(fd < 0)
 137:	83 c4 10             	add    $0x10,%esp
 13a:	85 c0                	test   %eax,%eax
 13c:	78 24                	js     162 <stat+0x3d>
 13e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 140:	83 ec 08             	sub    $0x8,%esp
 143:	ff 75 0c             	push   0xc(%ebp)
 146:	50                   	push   %eax
 147:	e8 61 01 00 00       	call   2ad <fstat>
 14c:	89 c6                	mov    %eax,%esi
  close(fd);
 14e:	89 1c 24             	mov    %ebx,(%esp)
 151:	e8 27 01 00 00       	call   27d <close>
  return r;
 156:	83 c4 10             	add    $0x10,%esp
}
 159:	89 f0                	mov    %esi,%eax
 15b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 15e:	5b                   	pop    %ebx
 15f:	5e                   	pop    %esi
 160:	5d                   	pop    %ebp
 161:	c3                   	ret    
    return -1;
 162:	be ff ff ff ff       	mov    $0xffffffff,%esi
 167:	eb f0                	jmp    159 <stat+0x34>

00000169 <atoi>:

int
atoi(const char *s)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	53                   	push   %ebx
 16d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 170:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 175:	eb 10                	jmp    187 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 177:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 17a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 17d:	83 c1 01             	add    $0x1,%ecx
 180:	0f be c0             	movsbl %al,%eax
 183:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 187:	0f b6 01             	movzbl (%ecx),%eax
 18a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 18d:	80 fb 09             	cmp    $0x9,%bl
 190:	76 e5                	jbe    177 <atoi+0xe>
  return n;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	8b 75 08             	mov    0x8(%ebp),%esi
 1a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1a9:	eb 0d                	jmp    1b8 <memmove+0x1f>
    *dst++ = *src++;
 1ab:	0f b6 01             	movzbl (%ecx),%eax
 1ae:	88 02                	mov    %al,(%edx)
 1b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 1b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1b6:	89 d8                	mov    %ebx,%eax
 1b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7f ec                	jg     1ab <memmove+0x12>
  return vdst;
}
 1bf:	89 f0                	mov    %esi,%eax
 1c1:	5b                   	pop    %ebx
 1c2:	5e                   	pop    %esi
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    

000001c5 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 1c5:	55                   	push   %ebp
 1c6:	89 e5                	mov    %esp,%ebp
 1c8:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 1cb:	68 00 10 00 00       	push   $0x1000
 1d0:	e8 fb 03 00 00       	call   5d0 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 1d5:	50                   	push   %eax
 1d6:	ff 75 10             	push   0x10(%ebp)
 1d9:	ff 75 0c             	push   0xc(%ebp)
 1dc:	ff 75 08             	push   0x8(%ebp)
 1df:	e8 11 01 00 00       	call   2f5 <clone>
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <thread_join>:

int thread_join(){
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	53                   	push   %ebx
 1ea:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 1ed:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1f0:	50                   	push   %eax
 1f1:	e8 07 01 00 00       	call   2fd <join>
  if (x < 0) {
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	85 c0                	test   %eax,%eax
 1fb:	78 17                	js     214 <thread_join+0x2e>
 1fd:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 1ff:	83 ec 0c             	sub    $0xc,%esp
 202:	ff 75 f4             	push   -0xc(%ebp)
 205:	e8 06 03 00 00       	call   510 <free>
  return x;
 20a:	83 c4 10             	add    $0x10,%esp
}
 20d:	89 d8                	mov    %ebx,%eax
 20f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 212:	c9                   	leave  
 213:	c3                   	ret    
    return -1;
 214:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 219:	eb f2                	jmp    20d <thread_join+0x27>

0000021b <lock_init>:

void lock_init(lock_t *spin){
 21b:	55                   	push   %ebp
 21c:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret    

00000229 <lock_acquire>:

void lock_acquire(lock_t *spin){
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
 22c:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 22f:	b8 01 00 00 00       	mov    $0x1,%eax
 234:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 237:	85 c0                	test   %eax,%eax
 239:	75 f4                	jne    22f <lock_acquire+0x6>

}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    

0000023d <lock_release>:

void lock_release(lock_t *spin){
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
 240:	8b 55 08             	mov    0x8(%ebp),%edx
 243:	b8 00 00 00 00       	mov    $0x0,%eax
 248:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    

0000024d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 24d:	b8 01 00 00 00       	mov    $0x1,%eax
 252:	cd 40                	int    $0x40
 254:	c3                   	ret    

00000255 <exit>:
SYSCALL(exit)
 255:	b8 02 00 00 00       	mov    $0x2,%eax
 25a:	cd 40                	int    $0x40
 25c:	c3                   	ret    

0000025d <wait>:
SYSCALL(wait)
 25d:	b8 03 00 00 00       	mov    $0x3,%eax
 262:	cd 40                	int    $0x40
 264:	c3                   	ret    

00000265 <pipe>:
SYSCALL(pipe)
 265:	b8 04 00 00 00       	mov    $0x4,%eax
 26a:	cd 40                	int    $0x40
 26c:	c3                   	ret    

0000026d <read>:
SYSCALL(read)
 26d:	b8 05 00 00 00       	mov    $0x5,%eax
 272:	cd 40                	int    $0x40
 274:	c3                   	ret    

00000275 <write>:
SYSCALL(write)
 275:	b8 10 00 00 00       	mov    $0x10,%eax
 27a:	cd 40                	int    $0x40
 27c:	c3                   	ret    

0000027d <close>:
SYSCALL(close)
 27d:	b8 15 00 00 00       	mov    $0x15,%eax
 282:	cd 40                	int    $0x40
 284:	c3                   	ret    

00000285 <kill>:
SYSCALL(kill)
 285:	b8 06 00 00 00       	mov    $0x6,%eax
 28a:	cd 40                	int    $0x40
 28c:	c3                   	ret    

0000028d <exec>:
SYSCALL(exec)
 28d:	b8 07 00 00 00       	mov    $0x7,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <open>:
SYSCALL(open)
 295:	b8 0f 00 00 00       	mov    $0xf,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <mknod>:
SYSCALL(mknod)
 29d:	b8 11 00 00 00       	mov    $0x11,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <unlink>:
SYSCALL(unlink)
 2a5:	b8 12 00 00 00       	mov    $0x12,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <fstat>:
SYSCALL(fstat)
 2ad:	b8 08 00 00 00       	mov    $0x8,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <link>:
SYSCALL(link)
 2b5:	b8 13 00 00 00       	mov    $0x13,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <mkdir>:
SYSCALL(mkdir)
 2bd:	b8 14 00 00 00       	mov    $0x14,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <chdir>:
SYSCALL(chdir)
 2c5:	b8 09 00 00 00       	mov    $0x9,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <dup>:
SYSCALL(dup)
 2cd:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <getpid>:
SYSCALL(getpid)
 2d5:	b8 0b 00 00 00       	mov    $0xb,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <sbrk>:
SYSCALL(sbrk)
 2dd:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <sleep>:
SYSCALL(sleep)
 2e5:	b8 0d 00 00 00       	mov    $0xd,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <uptime>:
SYSCALL(uptime)
 2ed:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <clone>:
SYSCALL(clone)
 2f5:	b8 16 00 00 00       	mov    $0x16,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <join>:
 2fd:	b8 17 00 00 00       	mov    $0x17,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 305:	55                   	push   %ebp
 306:	89 e5                	mov    %esp,%ebp
 308:	83 ec 1c             	sub    $0x1c,%esp
 30b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 30e:	6a 01                	push   $0x1
 310:	8d 55 f4             	lea    -0xc(%ebp),%edx
 313:	52                   	push   %edx
 314:	50                   	push   %eax
 315:	e8 5b ff ff ff       	call   275 <write>
}
 31a:	83 c4 10             	add    $0x10,%esp
 31d:	c9                   	leave  
 31e:	c3                   	ret    

0000031f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 31f:	55                   	push   %ebp
 320:	89 e5                	mov    %esp,%ebp
 322:	57                   	push   %edi
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	83 ec 2c             	sub    $0x2c,%esp
 328:	89 45 d0             	mov    %eax,-0x30(%ebp)
 32b:	89 d0                	mov    %edx,%eax
 32d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 32f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 333:	0f 95 c1             	setne  %cl
 336:	c1 ea 1f             	shr    $0x1f,%edx
 339:	84 d1                	test   %dl,%cl
 33b:	74 44                	je     381 <printint+0x62>
    neg = 1;
    x = -xx;
 33d:	f7 d8                	neg    %eax
 33f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 341:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 348:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 34d:	89 c8                	mov    %ecx,%eax
 34f:	ba 00 00 00 00       	mov    $0x0,%edx
 354:	f7 f6                	div    %esi
 356:	89 df                	mov    %ebx,%edi
 358:	83 c3 01             	add    $0x1,%ebx
 35b:	0f b6 92 b8 06 00 00 	movzbl 0x6b8(%edx),%edx
 362:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 366:	89 ca                	mov    %ecx,%edx
 368:	89 c1                	mov    %eax,%ecx
 36a:	39 d6                	cmp    %edx,%esi
 36c:	76 df                	jbe    34d <printint+0x2e>
  if(neg)
 36e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 372:	74 31                	je     3a5 <printint+0x86>
    buf[i++] = '-';
 374:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 379:	8d 5f 02             	lea    0x2(%edi),%ebx
 37c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 37f:	eb 17                	jmp    398 <printint+0x79>
    x = xx;
 381:	89 c1                	mov    %eax,%ecx
  neg = 0;
 383:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 38a:	eb bc                	jmp    348 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 38c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 391:	89 f0                	mov    %esi,%eax
 393:	e8 6d ff ff ff       	call   305 <putc>
  while(--i >= 0)
 398:	83 eb 01             	sub    $0x1,%ebx
 39b:	79 ef                	jns    38c <printint+0x6d>
}
 39d:	83 c4 2c             	add    $0x2c,%esp
 3a0:	5b                   	pop    %ebx
 3a1:	5e                   	pop    %esi
 3a2:	5f                   	pop    %edi
 3a3:	5d                   	pop    %ebp
 3a4:	c3                   	ret    
 3a5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3a8:	eb ee                	jmp    398 <printint+0x79>

000003aa <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	57                   	push   %edi
 3ae:	56                   	push   %esi
 3af:	53                   	push   %ebx
 3b0:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3b3:	8d 45 10             	lea    0x10(%ebp),%eax
 3b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3b9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3be:	bb 00 00 00 00       	mov    $0x0,%ebx
 3c3:	eb 14                	jmp    3d9 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3c5:	89 fa                	mov    %edi,%edx
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	e8 36 ff ff ff       	call   305 <putc>
 3cf:	eb 05                	jmp    3d6 <printf+0x2c>
      }
    } else if(state == '%'){
 3d1:	83 fe 25             	cmp    $0x25,%esi
 3d4:	74 25                	je     3fb <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3d6:	83 c3 01             	add    $0x1,%ebx
 3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dc:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3e0:	84 c0                	test   %al,%al
 3e2:	0f 84 20 01 00 00    	je     508 <printf+0x15e>
    c = fmt[i] & 0xff;
 3e8:	0f be f8             	movsbl %al,%edi
 3eb:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3ee:	85 f6                	test   %esi,%esi
 3f0:	75 df                	jne    3d1 <printf+0x27>
      if(c == '%'){
 3f2:	83 f8 25             	cmp    $0x25,%eax
 3f5:	75 ce                	jne    3c5 <printf+0x1b>
        state = '%';
 3f7:	89 c6                	mov    %eax,%esi
 3f9:	eb db                	jmp    3d6 <printf+0x2c>
      if(c == 'd'){
 3fb:	83 f8 25             	cmp    $0x25,%eax
 3fe:	0f 84 cf 00 00 00    	je     4d3 <printf+0x129>
 404:	0f 8c dd 00 00 00    	jl     4e7 <printf+0x13d>
 40a:	83 f8 78             	cmp    $0x78,%eax
 40d:	0f 8f d4 00 00 00    	jg     4e7 <printf+0x13d>
 413:	83 f8 63             	cmp    $0x63,%eax
 416:	0f 8c cb 00 00 00    	jl     4e7 <printf+0x13d>
 41c:	83 e8 63             	sub    $0x63,%eax
 41f:	83 f8 15             	cmp    $0x15,%eax
 422:	0f 87 bf 00 00 00    	ja     4e7 <printf+0x13d>
 428:	ff 24 85 60 06 00 00 	jmp    *0x660(,%eax,4)
        printint(fd, *ap, 10, 1);
 42f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 432:	8b 17                	mov    (%edi),%edx
 434:	83 ec 0c             	sub    $0xc,%esp
 437:	6a 01                	push   $0x1
 439:	b9 0a 00 00 00       	mov    $0xa,%ecx
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	e8 d9 fe ff ff       	call   31f <printint>
        ap++;
 446:	83 c7 04             	add    $0x4,%edi
 449:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 44c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 44f:	be 00 00 00 00       	mov    $0x0,%esi
 454:	eb 80                	jmp    3d6 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 456:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 459:	8b 17                	mov    (%edi),%edx
 45b:	83 ec 0c             	sub    $0xc,%esp
 45e:	6a 00                	push   $0x0
 460:	b9 10 00 00 00       	mov    $0x10,%ecx
 465:	8b 45 08             	mov    0x8(%ebp),%eax
 468:	e8 b2 fe ff ff       	call   31f <printint>
        ap++;
 46d:	83 c7 04             	add    $0x4,%edi
 470:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 473:	83 c4 10             	add    $0x10,%esp
      state = 0;
 476:	be 00 00 00 00       	mov    $0x0,%esi
 47b:	e9 56 ff ff ff       	jmp    3d6 <printf+0x2c>
        s = (char*)*ap;
 480:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 483:	8b 30                	mov    (%eax),%esi
        ap++;
 485:	83 c0 04             	add    $0x4,%eax
 488:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 48b:	85 f6                	test   %esi,%esi
 48d:	75 15                	jne    4a4 <printf+0xfa>
          s = "(null)";
 48f:	be 58 06 00 00       	mov    $0x658,%esi
 494:	eb 0e                	jmp    4a4 <printf+0xfa>
          putc(fd, *s);
 496:	0f be d2             	movsbl %dl,%edx
 499:	8b 45 08             	mov    0x8(%ebp),%eax
 49c:	e8 64 fe ff ff       	call   305 <putc>
          s++;
 4a1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4a4:	0f b6 16             	movzbl (%esi),%edx
 4a7:	84 d2                	test   %dl,%dl
 4a9:	75 eb                	jne    496 <printf+0xec>
      state = 0;
 4ab:	be 00 00 00 00       	mov    $0x0,%esi
 4b0:	e9 21 ff ff ff       	jmp    3d6 <printf+0x2c>
        putc(fd, *ap);
 4b5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b8:	0f be 17             	movsbl (%edi),%edx
 4bb:	8b 45 08             	mov    0x8(%ebp),%eax
 4be:	e8 42 fe ff ff       	call   305 <putc>
        ap++;
 4c3:	83 c7 04             	add    $0x4,%edi
 4c6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4c9:	be 00 00 00 00       	mov    $0x0,%esi
 4ce:	e9 03 ff ff ff       	jmp    3d6 <printf+0x2c>
        putc(fd, c);
 4d3:	89 fa                	mov    %edi,%edx
 4d5:	8b 45 08             	mov    0x8(%ebp),%eax
 4d8:	e8 28 fe ff ff       	call   305 <putc>
      state = 0;
 4dd:	be 00 00 00 00       	mov    $0x0,%esi
 4e2:	e9 ef fe ff ff       	jmp    3d6 <printf+0x2c>
        putc(fd, '%');
 4e7:	ba 25 00 00 00       	mov    $0x25,%edx
 4ec:	8b 45 08             	mov    0x8(%ebp),%eax
 4ef:	e8 11 fe ff ff       	call   305 <putc>
        putc(fd, c);
 4f4:	89 fa                	mov    %edi,%edx
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	e8 07 fe ff ff       	call   305 <putc>
      state = 0;
 4fe:	be 00 00 00 00       	mov    $0x0,%esi
 503:	e9 ce fe ff ff       	jmp    3d6 <printf+0x2c>
    }
  }
}
 508:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50b:	5b                   	pop    %ebx
 50c:	5e                   	pop    %esi
 50d:	5f                   	pop    %edi
 50e:	5d                   	pop    %ebp
 50f:	c3                   	ret    

00000510 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 519:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 51c:	a1 00 0a 00 00       	mov    0xa00,%eax
 521:	eb 02                	jmp    525 <free+0x15>
 523:	89 d0                	mov    %edx,%eax
 525:	39 c8                	cmp    %ecx,%eax
 527:	73 04                	jae    52d <free+0x1d>
 529:	39 08                	cmp    %ecx,(%eax)
 52b:	77 12                	ja     53f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 52d:	8b 10                	mov    (%eax),%edx
 52f:	39 c2                	cmp    %eax,%edx
 531:	77 f0                	ja     523 <free+0x13>
 533:	39 c8                	cmp    %ecx,%eax
 535:	72 08                	jb     53f <free+0x2f>
 537:	39 ca                	cmp    %ecx,%edx
 539:	77 04                	ja     53f <free+0x2f>
 53b:	89 d0                	mov    %edx,%eax
 53d:	eb e6                	jmp    525 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 53f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 542:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 545:	8b 10                	mov    (%eax),%edx
 547:	39 d7                	cmp    %edx,%edi
 549:	74 19                	je     564 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 54b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 54e:	8b 50 04             	mov    0x4(%eax),%edx
 551:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 554:	39 ce                	cmp    %ecx,%esi
 556:	74 1b                	je     573 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 558:	89 08                	mov    %ecx,(%eax)
  freep = p;
 55a:	a3 00 0a 00 00       	mov    %eax,0xa00
}
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 564:	03 72 04             	add    0x4(%edx),%esi
 567:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 56a:	8b 10                	mov    (%eax),%edx
 56c:	8b 12                	mov    (%edx),%edx
 56e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 571:	eb db                	jmp    54e <free+0x3e>
    p->s.size += bp->s.size;
 573:	03 53 fc             	add    -0x4(%ebx),%edx
 576:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 579:	8b 53 f8             	mov    -0x8(%ebx),%edx
 57c:	89 10                	mov    %edx,(%eax)
 57e:	eb da                	jmp    55a <free+0x4a>

00000580 <morecore>:

static Header*
morecore(uint nu)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	83 ec 04             	sub    $0x4,%esp
 587:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 589:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 58e:	77 05                	ja     595 <morecore+0x15>
    nu = 4096;
 590:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 595:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 59c:	83 ec 0c             	sub    $0xc,%esp
 59f:	50                   	push   %eax
 5a0:	e8 38 fd ff ff       	call   2dd <sbrk>
  if(p == (char*)-1)
 5a5:	83 c4 10             	add    $0x10,%esp
 5a8:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ab:	74 1c                	je     5c9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5ad:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5b0:	83 c0 08             	add    $0x8,%eax
 5b3:	83 ec 0c             	sub    $0xc,%esp
 5b6:	50                   	push   %eax
 5b7:	e8 54 ff ff ff       	call   510 <free>
  return freep;
 5bc:	a1 00 0a 00 00       	mov    0xa00,%eax
 5c1:	83 c4 10             	add    $0x10,%esp
}
 5c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5c7:	c9                   	leave  
 5c8:	c3                   	ret    
    return 0;
 5c9:	b8 00 00 00 00       	mov    $0x0,%eax
 5ce:	eb f4                	jmp    5c4 <morecore+0x44>

000005d0 <malloc>:

void*
malloc(uint nbytes)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	53                   	push   %ebx
 5d4:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5d7:	8b 45 08             	mov    0x8(%ebp),%eax
 5da:	8d 58 07             	lea    0x7(%eax),%ebx
 5dd:	c1 eb 03             	shr    $0x3,%ebx
 5e0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5e3:	8b 0d 00 0a 00 00    	mov    0xa00,%ecx
 5e9:	85 c9                	test   %ecx,%ecx
 5eb:	74 04                	je     5f1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5ed:	8b 01                	mov    (%ecx),%eax
 5ef:	eb 4a                	jmp    63b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 5f1:	c7 05 00 0a 00 00 04 	movl   $0xa04,0xa00
 5f8:	0a 00 00 
 5fb:	c7 05 04 0a 00 00 04 	movl   $0xa04,0xa04
 602:	0a 00 00 
    base.s.size = 0;
 605:	c7 05 08 0a 00 00 00 	movl   $0x0,0xa08
 60c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 60f:	b9 04 0a 00 00       	mov    $0xa04,%ecx
 614:	eb d7                	jmp    5ed <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 616:	74 19                	je     631 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 618:	29 da                	sub    %ebx,%edx
 61a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 61d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 620:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 623:	89 0d 00 0a 00 00    	mov    %ecx,0xa00
      return (void*)(p + 1);
 629:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 62c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 62f:	c9                   	leave  
 630:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 631:	8b 10                	mov    (%eax),%edx
 633:	89 11                	mov    %edx,(%ecx)
 635:	eb ec                	jmp    623 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 637:	89 c1                	mov    %eax,%ecx
 639:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 63b:	8b 50 04             	mov    0x4(%eax),%edx
 63e:	39 da                	cmp    %ebx,%edx
 640:	73 d4                	jae    616 <malloc+0x46>
    if(p == freep)
 642:	39 05 00 0a 00 00    	cmp    %eax,0xa00
 648:	75 ed                	jne    637 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 64a:	89 d8                	mov    %ebx,%eax
 64c:	e8 2f ff ff ff       	call   580 <morecore>
 651:	85 c0                	test   %eax,%eax
 653:	75 e2                	jne    637 <malloc+0x67>
 655:	eb d5                	jmp    62c <malloc+0x5c>
