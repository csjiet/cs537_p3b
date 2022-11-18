
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 14                	je     2b <main+0x2b>
    printf(2, "Usage: ln old new\n");
  17:	83 ec 08             	sub    $0x8,%esp
  1a:	68 88 06 00 00       	push   $0x688
  1f:	6a 02                	push   $0x2
  21:	e8 b2 03 00 00       	call   3d8 <printf>
    exit();
  26:	e8 58 02 00 00       	call   283 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 aa 02 00 00       	call   2e3 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 3e 02 00 00       	call   283 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 9b 06 00 00       	push   $0x69b
  50:	6a 02                	push   $0x2
  52:	e8 81 03 00 00       	call   3d8 <printf>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	eb e4                	jmp    40 <main+0x40>

0000005c <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  5c:	55                   	push   %ebp
  5d:	89 e5                	mov    %esp,%ebp
  5f:	56                   	push   %esi
  60:	53                   	push   %ebx
  61:	8b 75 08             	mov    0x8(%ebp),%esi
  64:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  67:	89 f0                	mov    %esi,%eax
  69:	89 d1                	mov    %edx,%ecx
  6b:	83 c2 01             	add    $0x1,%edx
  6e:	89 c3                	mov    %eax,%ebx
  70:	83 c0 01             	add    $0x1,%eax
  73:	0f b6 09             	movzbl (%ecx),%ecx
  76:	88 0b                	mov    %cl,(%ebx)
  78:	84 c9                	test   %cl,%cl
  7a:	75 ed                	jne    69 <strcpy+0xd>
    ;
  return os;
}
  7c:	89 f0                	mov    %esi,%eax
  7e:	5b                   	pop    %ebx
  7f:	5e                   	pop    %esi
  80:	5d                   	pop    %ebp
  81:	c3                   	ret    

00000082 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  82:	55                   	push   %ebp
  83:	89 e5                	mov    %esp,%ebp
  85:	8b 4d 08             	mov    0x8(%ebp),%ecx
  88:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8b:	eb 06                	jmp    93 <strcmp+0x11>
    p++, q++;
  8d:	83 c1 01             	add    $0x1,%ecx
  90:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  93:	0f b6 01             	movzbl (%ecx),%eax
  96:	84 c0                	test   %al,%al
  98:	74 04                	je     9e <strcmp+0x1c>
  9a:	3a 02                	cmp    (%edx),%al
  9c:	74 ef                	je     8d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  9e:	0f b6 c0             	movzbl %al,%eax
  a1:	0f b6 12             	movzbl (%edx),%edx
  a4:	29 d0                	sub    %edx,%eax
}
  a6:	5d                   	pop    %ebp
  a7:	c3                   	ret    

000000a8 <strlen>:

uint
strlen(const char *s)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  ae:	b8 00 00 00 00       	mov    $0x0,%eax
  b3:	eb 03                	jmp    b8 <strlen+0x10>
  b5:	83 c0 01             	add    $0x1,%eax
  b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bc:	75 f7                	jne    b5 <strlen+0xd>
    ;
  return n;
}
  be:	5d                   	pop    %ebp
  bf:	c3                   	ret    

000000c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c7:	89 d7                	mov    %edx,%edi
  c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  cf:	fc                   	cld    
  d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d2:	89 d0                	mov    %edx,%eax
  d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d7:	c9                   	leave  
  d8:	c3                   	ret    

000000d9 <strchr>:

char*
strchr(const char *s, char c)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	8b 45 08             	mov    0x8(%ebp),%eax
  df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  e3:	eb 03                	jmp    e8 <strchr+0xf>
  e5:	83 c0 01             	add    $0x1,%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	84 d2                	test   %dl,%dl
  ed:	74 06                	je     f5 <strchr+0x1c>
    if(*s == c)
  ef:	38 ca                	cmp    %cl,%dl
  f1:	75 f2                	jne    e5 <strchr+0xc>
  f3:	eb 05                	jmp    fa <strchr+0x21>
      return (char*)s;
  return 0;
  f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  fa:	5d                   	pop    %ebp
  fb:	c3                   	ret    

000000fc <gets>:

char*
gets(char *buf, int max)
{
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	57                   	push   %edi
 100:	56                   	push   %esi
 101:	53                   	push   %ebx
 102:	83 ec 1c             	sub    $0x1c,%esp
 105:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 108:	bb 00 00 00 00       	mov    $0x0,%ebx
 10d:	89 de                	mov    %ebx,%esi
 10f:	83 c3 01             	add    $0x1,%ebx
 112:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 115:	7d 2e                	jge    145 <gets+0x49>
    cc = read(0, &c, 1);
 117:	83 ec 04             	sub    $0x4,%esp
 11a:	6a 01                	push   $0x1
 11c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11f:	50                   	push   %eax
 120:	6a 00                	push   $0x0
 122:	e8 74 01 00 00       	call   29b <read>
    if(cc < 1)
 127:	83 c4 10             	add    $0x10,%esp
 12a:	85 c0                	test   %eax,%eax
 12c:	7e 17                	jle    145 <gets+0x49>
      break;
    buf[i++] = c;
 12e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 132:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 135:	3c 0a                	cmp    $0xa,%al
 137:	0f 94 c2             	sete   %dl
 13a:	3c 0d                	cmp    $0xd,%al
 13c:	0f 94 c0             	sete   %al
 13f:	08 c2                	or     %al,%dl
 141:	74 ca                	je     10d <gets+0x11>
    buf[i++] = c;
 143:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 145:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 149:	89 f8                	mov    %edi,%eax
 14b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14e:	5b                   	pop    %ebx
 14f:	5e                   	pop    %esi
 150:	5f                   	pop    %edi
 151:	5d                   	pop    %ebp
 152:	c3                   	ret    

00000153 <stat>:

int
stat(const char *n, struct stat *st)
{
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
 156:	56                   	push   %esi
 157:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 158:	83 ec 08             	sub    $0x8,%esp
 15b:	6a 00                	push   $0x0
 15d:	ff 75 08             	push   0x8(%ebp)
 160:	e8 5e 01 00 00       	call   2c3 <open>
  if(fd < 0)
 165:	83 c4 10             	add    $0x10,%esp
 168:	85 c0                	test   %eax,%eax
 16a:	78 24                	js     190 <stat+0x3d>
 16c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 16e:	83 ec 08             	sub    $0x8,%esp
 171:	ff 75 0c             	push   0xc(%ebp)
 174:	50                   	push   %eax
 175:	e8 61 01 00 00       	call   2db <fstat>
 17a:	89 c6                	mov    %eax,%esi
  close(fd);
 17c:	89 1c 24             	mov    %ebx,(%esp)
 17f:	e8 27 01 00 00       	call   2ab <close>
  return r;
 184:	83 c4 10             	add    $0x10,%esp
}
 187:	89 f0                	mov    %esi,%eax
 189:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18c:	5b                   	pop    %ebx
 18d:	5e                   	pop    %esi
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    
    return -1;
 190:	be ff ff ff ff       	mov    $0xffffffff,%esi
 195:	eb f0                	jmp    187 <stat+0x34>

00000197 <atoi>:

int
atoi(const char *s)
{
 197:	55                   	push   %ebp
 198:	89 e5                	mov    %esp,%ebp
 19a:	53                   	push   %ebx
 19b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 19e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1a3:	eb 10                	jmp    1b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1ab:	83 c1 01             	add    $0x1,%ecx
 1ae:	0f be c0             	movsbl %al,%eax
 1b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1b5:	0f b6 01             	movzbl (%ecx),%eax
 1b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1bb:	80 fb 09             	cmp    $0x9,%bl
 1be:	76 e5                	jbe    1a5 <atoi+0xe>
  return n;
}
 1c0:	89 d0                	mov    %edx,%eax
 1c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c5:	c9                   	leave  
 1c6:	c3                   	ret    

000001c7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1c7:	55                   	push   %ebp
 1c8:	89 e5                	mov    %esp,%ebp
 1ca:	56                   	push   %esi
 1cb:	53                   	push   %ebx
 1cc:	8b 75 08             	mov    0x8(%ebp),%esi
 1cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1d7:	eb 0d                	jmp    1e6 <memmove+0x1f>
    *dst++ = *src++;
 1d9:	0f b6 01             	movzbl (%ecx),%eax
 1dc:	88 02                	mov    %al,(%edx)
 1de:	8d 49 01             	lea    0x1(%ecx),%ecx
 1e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1e4:	89 d8                	mov    %ebx,%eax
 1e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e9:	85 c0                	test   %eax,%eax
 1eb:	7f ec                	jg     1d9 <memmove+0x12>
  return vdst;
}
 1ed:	89 f0                	mov    %esi,%eax
 1ef:	5b                   	pop    %ebx
 1f0:	5e                   	pop    %esi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    

000001f3 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 1f9:	68 00 10 00 00       	push   $0x1000
 1fe:	e8 fb 03 00 00       	call   5fe <malloc>

  return clone(start_routine, arg1, arg2, stack);
 203:	50                   	push   %eax
 204:	ff 75 10             	push   0x10(%ebp)
 207:	ff 75 0c             	push   0xc(%ebp)
 20a:	ff 75 08             	push   0x8(%ebp)
 20d:	e8 11 01 00 00       	call   323 <clone>
}
 212:	c9                   	leave  
 213:	c3                   	ret    

00000214 <thread_join>:

int thread_join(){
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	53                   	push   %ebx
 218:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 21b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 21e:	50                   	push   %eax
 21f:	e8 07 01 00 00       	call   32b <join>
  if (x < 0) {
 224:	83 c4 10             	add    $0x10,%esp
 227:	85 c0                	test   %eax,%eax
 229:	78 17                	js     242 <thread_join+0x2e>
 22b:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 22d:	83 ec 0c             	sub    $0xc,%esp
 230:	ff 75 f4             	push   -0xc(%ebp)
 233:	e8 06 03 00 00       	call   53e <free>
  return x;
 238:	83 c4 10             	add    $0x10,%esp
}
 23b:	89 d8                	mov    %ebx,%eax
 23d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 240:	c9                   	leave  
 241:	c3                   	ret    
    return -1;
 242:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 247:	eb f2                	jmp    23b <thread_join+0x27>

00000249 <lock_init>:

void lock_init(lock_t *spin){
 249:	55                   	push   %ebp
 24a:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    

00000257 <lock_acquire>:

void lock_acquire(lock_t *spin){
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 25d:	b8 01 00 00 00       	mov    $0x1,%eax
 262:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 265:	85 c0                	test   %eax,%eax
 267:	75 f4                	jne    25d <lock_acquire+0x6>

}
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    

0000026b <lock_release>:

void lock_release(lock_t *spin){
 26b:	55                   	push   %ebp
 26c:	89 e5                	mov    %esp,%ebp
 26e:	8b 55 08             	mov    0x8(%ebp),%edx
 271:	b8 00 00 00 00       	mov    $0x0,%eax
 276:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    

0000027b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sbrk>:
SYSCALL(sbrk)
 30b:	b8 0c 00 00 00       	mov    $0xc,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sleep>:
SYSCALL(sleep)
 313:	b8 0d 00 00 00       	mov    $0xd,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <uptime>:
SYSCALL(uptime)
 31b:	b8 0e 00 00 00       	mov    $0xe,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <clone>:
SYSCALL(clone)
 323:	b8 16 00 00 00       	mov    $0x16,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <join>:
 32b:	b8 17 00 00 00       	mov    $0x17,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	83 ec 1c             	sub    $0x1c,%esp
 339:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 33c:	6a 01                	push   $0x1
 33e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 341:	52                   	push   %edx
 342:	50                   	push   %eax
 343:	e8 5b ff ff ff       	call   2a3 <write>
}
 348:	83 c4 10             	add    $0x10,%esp
 34b:	c9                   	leave  
 34c:	c3                   	ret    

0000034d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	57                   	push   %edi
 351:	56                   	push   %esi
 352:	53                   	push   %ebx
 353:	83 ec 2c             	sub    $0x2c,%esp
 356:	89 45 d0             	mov    %eax,-0x30(%ebp)
 359:	89 d0                	mov    %edx,%eax
 35b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 35d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 361:	0f 95 c1             	setne  %cl
 364:	c1 ea 1f             	shr    $0x1f,%edx
 367:	84 d1                	test   %dl,%cl
 369:	74 44                	je     3af <printint+0x62>
    neg = 1;
    x = -xx;
 36b:	f7 d8                	neg    %eax
 36d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 36f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 376:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 37b:	89 c8                	mov    %ecx,%eax
 37d:	ba 00 00 00 00       	mov    $0x0,%edx
 382:	f7 f6                	div    %esi
 384:	89 df                	mov    %ebx,%edi
 386:	83 c3 01             	add    $0x1,%ebx
 389:	0f b6 92 10 07 00 00 	movzbl 0x710(%edx),%edx
 390:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 394:	89 ca                	mov    %ecx,%edx
 396:	89 c1                	mov    %eax,%ecx
 398:	39 d6                	cmp    %edx,%esi
 39a:	76 df                	jbe    37b <printint+0x2e>
  if(neg)
 39c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3a0:	74 31                	je     3d3 <printint+0x86>
    buf[i++] = '-';
 3a2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3a7:	8d 5f 02             	lea    0x2(%edi),%ebx
 3aa:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ad:	eb 17                	jmp    3c6 <printint+0x79>
    x = xx;
 3af:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3b1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3b8:	eb bc                	jmp    376 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3ba:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3bf:	89 f0                	mov    %esi,%eax
 3c1:	e8 6d ff ff ff       	call   333 <putc>
  while(--i >= 0)
 3c6:	83 eb 01             	sub    $0x1,%ebx
 3c9:	79 ef                	jns    3ba <printint+0x6d>
}
 3cb:	83 c4 2c             	add    $0x2c,%esp
 3ce:	5b                   	pop    %ebx
 3cf:	5e                   	pop    %esi
 3d0:	5f                   	pop    %edi
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret    
 3d3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d6:	eb ee                	jmp    3c6 <printint+0x79>

000003d8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3d8:	55                   	push   %ebp
 3d9:	89 e5                	mov    %esp,%ebp
 3db:	57                   	push   %edi
 3dc:	56                   	push   %esi
 3dd:	53                   	push   %ebx
 3de:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3e1:	8d 45 10             	lea    0x10(%ebp),%eax
 3e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3e7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3ec:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f1:	eb 14                	jmp    407 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3f3:	89 fa                	mov    %edi,%edx
 3f5:	8b 45 08             	mov    0x8(%ebp),%eax
 3f8:	e8 36 ff ff ff       	call   333 <putc>
 3fd:	eb 05                	jmp    404 <printf+0x2c>
      }
    } else if(state == '%'){
 3ff:	83 fe 25             	cmp    $0x25,%esi
 402:	74 25                	je     429 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 404:	83 c3 01             	add    $0x1,%ebx
 407:	8b 45 0c             	mov    0xc(%ebp),%eax
 40a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 40e:	84 c0                	test   %al,%al
 410:	0f 84 20 01 00 00    	je     536 <printf+0x15e>
    c = fmt[i] & 0xff;
 416:	0f be f8             	movsbl %al,%edi
 419:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 41c:	85 f6                	test   %esi,%esi
 41e:	75 df                	jne    3ff <printf+0x27>
      if(c == '%'){
 420:	83 f8 25             	cmp    $0x25,%eax
 423:	75 ce                	jne    3f3 <printf+0x1b>
        state = '%';
 425:	89 c6                	mov    %eax,%esi
 427:	eb db                	jmp    404 <printf+0x2c>
      if(c == 'd'){
 429:	83 f8 25             	cmp    $0x25,%eax
 42c:	0f 84 cf 00 00 00    	je     501 <printf+0x129>
 432:	0f 8c dd 00 00 00    	jl     515 <printf+0x13d>
 438:	83 f8 78             	cmp    $0x78,%eax
 43b:	0f 8f d4 00 00 00    	jg     515 <printf+0x13d>
 441:	83 f8 63             	cmp    $0x63,%eax
 444:	0f 8c cb 00 00 00    	jl     515 <printf+0x13d>
 44a:	83 e8 63             	sub    $0x63,%eax
 44d:	83 f8 15             	cmp    $0x15,%eax
 450:	0f 87 bf 00 00 00    	ja     515 <printf+0x13d>
 456:	ff 24 85 b8 06 00 00 	jmp    *0x6b8(,%eax,4)
        printint(fd, *ap, 10, 1);
 45d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 460:	8b 17                	mov    (%edi),%edx
 462:	83 ec 0c             	sub    $0xc,%esp
 465:	6a 01                	push   $0x1
 467:	b9 0a 00 00 00       	mov    $0xa,%ecx
 46c:	8b 45 08             	mov    0x8(%ebp),%eax
 46f:	e8 d9 fe ff ff       	call   34d <printint>
        ap++;
 474:	83 c7 04             	add    $0x4,%edi
 477:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 47a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 47d:	be 00 00 00 00       	mov    $0x0,%esi
 482:	eb 80                	jmp    404 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 484:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 487:	8b 17                	mov    (%edi),%edx
 489:	83 ec 0c             	sub    $0xc,%esp
 48c:	6a 00                	push   $0x0
 48e:	b9 10 00 00 00       	mov    $0x10,%ecx
 493:	8b 45 08             	mov    0x8(%ebp),%eax
 496:	e8 b2 fe ff ff       	call   34d <printint>
        ap++;
 49b:	83 c7 04             	add    $0x4,%edi
 49e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4a4:	be 00 00 00 00       	mov    $0x0,%esi
 4a9:	e9 56 ff ff ff       	jmp    404 <printf+0x2c>
        s = (char*)*ap;
 4ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b1:	8b 30                	mov    (%eax),%esi
        ap++;
 4b3:	83 c0 04             	add    $0x4,%eax
 4b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4b9:	85 f6                	test   %esi,%esi
 4bb:	75 15                	jne    4d2 <printf+0xfa>
          s = "(null)";
 4bd:	be af 06 00 00       	mov    $0x6af,%esi
 4c2:	eb 0e                	jmp    4d2 <printf+0xfa>
          putc(fd, *s);
 4c4:	0f be d2             	movsbl %dl,%edx
 4c7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ca:	e8 64 fe ff ff       	call   333 <putc>
          s++;
 4cf:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4d2:	0f b6 16             	movzbl (%esi),%edx
 4d5:	84 d2                	test   %dl,%dl
 4d7:	75 eb                	jne    4c4 <printf+0xec>
      state = 0;
 4d9:	be 00 00 00 00       	mov    $0x0,%esi
 4de:	e9 21 ff ff ff       	jmp    404 <printf+0x2c>
        putc(fd, *ap);
 4e3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e6:	0f be 17             	movsbl (%edi),%edx
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ec:	e8 42 fe ff ff       	call   333 <putc>
        ap++;
 4f1:	83 c7 04             	add    $0x4,%edi
 4f4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4f7:	be 00 00 00 00       	mov    $0x0,%esi
 4fc:	e9 03 ff ff ff       	jmp    404 <printf+0x2c>
        putc(fd, c);
 501:	89 fa                	mov    %edi,%edx
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	e8 28 fe ff ff       	call   333 <putc>
      state = 0;
 50b:	be 00 00 00 00       	mov    $0x0,%esi
 510:	e9 ef fe ff ff       	jmp    404 <printf+0x2c>
        putc(fd, '%');
 515:	ba 25 00 00 00       	mov    $0x25,%edx
 51a:	8b 45 08             	mov    0x8(%ebp),%eax
 51d:	e8 11 fe ff ff       	call   333 <putc>
        putc(fd, c);
 522:	89 fa                	mov    %edi,%edx
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	e8 07 fe ff ff       	call   333 <putc>
      state = 0;
 52c:	be 00 00 00 00       	mov    $0x0,%esi
 531:	e9 ce fe ff ff       	jmp    404 <printf+0x2c>
    }
  }
}
 536:	8d 65 f4             	lea    -0xc(%ebp),%esp
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5f                   	pop    %edi
 53c:	5d                   	pop    %ebp
 53d:	c3                   	ret    

0000053e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 53e:	55                   	push   %ebp
 53f:	89 e5                	mov    %esp,%ebp
 541:	57                   	push   %edi
 542:	56                   	push   %esi
 543:	53                   	push   %ebx
 544:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 547:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 54a:	a1 5c 0a 00 00       	mov    0xa5c,%eax
 54f:	eb 02                	jmp    553 <free+0x15>
 551:	89 d0                	mov    %edx,%eax
 553:	39 c8                	cmp    %ecx,%eax
 555:	73 04                	jae    55b <free+0x1d>
 557:	39 08                	cmp    %ecx,(%eax)
 559:	77 12                	ja     56d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 55b:	8b 10                	mov    (%eax),%edx
 55d:	39 c2                	cmp    %eax,%edx
 55f:	77 f0                	ja     551 <free+0x13>
 561:	39 c8                	cmp    %ecx,%eax
 563:	72 08                	jb     56d <free+0x2f>
 565:	39 ca                	cmp    %ecx,%edx
 567:	77 04                	ja     56d <free+0x2f>
 569:	89 d0                	mov    %edx,%eax
 56b:	eb e6                	jmp    553 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 56d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 570:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 573:	8b 10                	mov    (%eax),%edx
 575:	39 d7                	cmp    %edx,%edi
 577:	74 19                	je     592 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 579:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 57c:	8b 50 04             	mov    0x4(%eax),%edx
 57f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 582:	39 ce                	cmp    %ecx,%esi
 584:	74 1b                	je     5a1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 586:	89 08                	mov    %ecx,(%eax)
  freep = p;
 588:	a3 5c 0a 00 00       	mov    %eax,0xa5c
}
 58d:	5b                   	pop    %ebx
 58e:	5e                   	pop    %esi
 58f:	5f                   	pop    %edi
 590:	5d                   	pop    %ebp
 591:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 592:	03 72 04             	add    0x4(%edx),%esi
 595:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 598:	8b 10                	mov    (%eax),%edx
 59a:	8b 12                	mov    (%edx),%edx
 59c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 59f:	eb db                	jmp    57c <free+0x3e>
    p->s.size += bp->s.size;
 5a1:	03 53 fc             	add    -0x4(%ebx),%edx
 5a4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5a7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5aa:	89 10                	mov    %edx,(%eax)
 5ac:	eb da                	jmp    588 <free+0x4a>

000005ae <morecore>:

static Header*
morecore(uint nu)
{
 5ae:	55                   	push   %ebp
 5af:	89 e5                	mov    %esp,%ebp
 5b1:	53                   	push   %ebx
 5b2:	83 ec 04             	sub    $0x4,%esp
 5b5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5b7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5bc:	77 05                	ja     5c3 <morecore+0x15>
    nu = 4096;
 5be:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5c3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5ca:	83 ec 0c             	sub    $0xc,%esp
 5cd:	50                   	push   %eax
 5ce:	e8 38 fd ff ff       	call   30b <sbrk>
  if(p == (char*)-1)
 5d3:	83 c4 10             	add    $0x10,%esp
 5d6:	83 f8 ff             	cmp    $0xffffffff,%eax
 5d9:	74 1c                	je     5f7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5db:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5de:	83 c0 08             	add    $0x8,%eax
 5e1:	83 ec 0c             	sub    $0xc,%esp
 5e4:	50                   	push   %eax
 5e5:	e8 54 ff ff ff       	call   53e <free>
  return freep;
 5ea:	a1 5c 0a 00 00       	mov    0xa5c,%eax
 5ef:	83 c4 10             	add    $0x10,%esp
}
 5f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f5:	c9                   	leave  
 5f6:	c3                   	ret    
    return 0;
 5f7:	b8 00 00 00 00       	mov    $0x0,%eax
 5fc:	eb f4                	jmp    5f2 <morecore+0x44>

000005fe <malloc>:

void*
malloc(uint nbytes)
{
 5fe:	55                   	push   %ebp
 5ff:	89 e5                	mov    %esp,%ebp
 601:	53                   	push   %ebx
 602:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	8d 58 07             	lea    0x7(%eax),%ebx
 60b:	c1 eb 03             	shr    $0x3,%ebx
 60e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 611:	8b 0d 5c 0a 00 00    	mov    0xa5c,%ecx
 617:	85 c9                	test   %ecx,%ecx
 619:	74 04                	je     61f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 61b:	8b 01                	mov    (%ecx),%eax
 61d:	eb 4a                	jmp    669 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 61f:	c7 05 5c 0a 00 00 60 	movl   $0xa60,0xa5c
 626:	0a 00 00 
 629:	c7 05 60 0a 00 00 60 	movl   $0xa60,0xa60
 630:	0a 00 00 
    base.s.size = 0;
 633:	c7 05 64 0a 00 00 00 	movl   $0x0,0xa64
 63a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 63d:	b9 60 0a 00 00       	mov    $0xa60,%ecx
 642:	eb d7                	jmp    61b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 644:	74 19                	je     65f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 646:	29 da                	sub    %ebx,%edx
 648:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 64b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 64e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 651:	89 0d 5c 0a 00 00    	mov    %ecx,0xa5c
      return (void*)(p + 1);
 657:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 65a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65d:	c9                   	leave  
 65e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 65f:	8b 10                	mov    (%eax),%edx
 661:	89 11                	mov    %edx,(%ecx)
 663:	eb ec                	jmp    651 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 665:	89 c1                	mov    %eax,%ecx
 667:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 669:	8b 50 04             	mov    0x4(%eax),%edx
 66c:	39 da                	cmp    %ebx,%edx
 66e:	73 d4                	jae    644 <malloc+0x46>
    if(p == freep)
 670:	39 05 5c 0a 00 00    	cmp    %eax,0xa5c
 676:	75 ed                	jne    665 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 678:	89 d8                	mov    %ebx,%eax
 67a:	e8 2f ff ff ff       	call   5ae <morecore>
 67f:	85 c0                	test   %eax,%eax
 681:	75 e2                	jne    665 <malloc+0x67>
 683:	eb d5                	jmp    65a <malloc+0x5c>
