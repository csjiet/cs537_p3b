
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
  21:	e8 b5 03 00 00       	call   3db <printf>
    exit();
  26:	e8 5b 02 00 00       	call   286 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 ad 02 00 00       	call   2e6 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 41 02 00 00       	call   286 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 9b 06 00 00       	push   $0x69b
  50:	6a 02                	push   $0x2
  52:	e8 84 03 00 00       	call   3db <printf>
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
 122:	e8 77 01 00 00       	call   29e <read>
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
 160:	e8 61 01 00 00       	call   2c6 <open>
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
 175:	e8 64 01 00 00       	call   2de <fstat>
 17a:	89 c6                	mov    %eax,%esi
  close(fd);
 17c:	89 1c 24             	mov    %ebx,(%esp)
 17f:	e8 2a 01 00 00       	call   2ae <close>
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

  void* stack = malloc(2 * PGSIZE);
 1f9:	68 00 20 00 00       	push   $0x2000
 1fe:	e8 fe 03 00 00       	call   601 <malloc>
  if ((uint)stack%PGSIZE){
 203:	83 c4 10             	add    $0x10,%esp
 206:	a9 ff 0f 00 00       	test   $0xfff,%eax
 20b:	74 0a                	je     217 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 20d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 212:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 217:	50                   	push   %eax
 218:	ff 75 10             	push   0x10(%ebp)
 21b:	ff 75 0c             	push   0xc(%ebp)
 21e:	ff 75 08             	push   0x8(%ebp)
 221:	e8 00 01 00 00       	call   326 <clone>
}
 226:	c9                   	leave  
 227:	c3                   	ret    

00000228 <thread_join>:

int thread_join(){
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	53                   	push   %ebx
 22c:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	e8 f6 00 00 00       	call   32e <join>
 238:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 23a:	83 c4 04             	add    $0x4,%esp
 23d:	ff 75 f4             	push   -0xc(%ebp)
 240:	e8 fc 02 00 00       	call   541 <free>
  return x;
}
 245:	89 d8                	mov    %ebx,%eax
 247:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24a:	c9                   	leave  
 24b:	c3                   	ret    

0000024c <lock_init>:

void lock_init(lock_t *spin){
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
 252:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    

0000025a <lock_acquire>:

void lock_acquire(lock_t *spin){
 25a:	55                   	push   %ebp
 25b:	89 e5                	mov    %esp,%ebp
 25d:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 260:	b8 01 00 00 00       	mov    $0x1,%eax
 265:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 268:	85 c0                	test   %eax,%eax
 26a:	75 f4                	jne    260 <lock_acquire+0x6>

}
 26c:	5d                   	pop    %ebp
 26d:	c3                   	ret    

0000026e <lock_release>:

void lock_release(lock_t *spin){
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	8b 55 08             	mov    0x8(%ebp),%edx
 274:	b8 00 00 00 00       	mov    $0x0,%eax
 279:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 27c:	5d                   	pop    %ebp
 27d:	c3                   	ret    

0000027e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27e:	b8 01 00 00 00       	mov    $0x1,%eax
 283:	cd 40                	int    $0x40
 285:	c3                   	ret    

00000286 <exit>:
SYSCALL(exit)
 286:	b8 02 00 00 00       	mov    $0x2,%eax
 28b:	cd 40                	int    $0x40
 28d:	c3                   	ret    

0000028e <wait>:
SYSCALL(wait)
 28e:	b8 03 00 00 00       	mov    $0x3,%eax
 293:	cd 40                	int    $0x40
 295:	c3                   	ret    

00000296 <pipe>:
SYSCALL(pipe)
 296:	b8 04 00 00 00       	mov    $0x4,%eax
 29b:	cd 40                	int    $0x40
 29d:	c3                   	ret    

0000029e <read>:
SYSCALL(read)
 29e:	b8 05 00 00 00       	mov    $0x5,%eax
 2a3:	cd 40                	int    $0x40
 2a5:	c3                   	ret    

000002a6 <write>:
SYSCALL(write)
 2a6:	b8 10 00 00 00       	mov    $0x10,%eax
 2ab:	cd 40                	int    $0x40
 2ad:	c3                   	ret    

000002ae <close>:
SYSCALL(close)
 2ae:	b8 15 00 00 00       	mov    $0x15,%eax
 2b3:	cd 40                	int    $0x40
 2b5:	c3                   	ret    

000002b6 <kill>:
SYSCALL(kill)
 2b6:	b8 06 00 00 00       	mov    $0x6,%eax
 2bb:	cd 40                	int    $0x40
 2bd:	c3                   	ret    

000002be <exec>:
SYSCALL(exec)
 2be:	b8 07 00 00 00       	mov    $0x7,%eax
 2c3:	cd 40                	int    $0x40
 2c5:	c3                   	ret    

000002c6 <open>:
SYSCALL(open)
 2c6:	b8 0f 00 00 00       	mov    $0xf,%eax
 2cb:	cd 40                	int    $0x40
 2cd:	c3                   	ret    

000002ce <mknod>:
SYSCALL(mknod)
 2ce:	b8 11 00 00 00       	mov    $0x11,%eax
 2d3:	cd 40                	int    $0x40
 2d5:	c3                   	ret    

000002d6 <unlink>:
SYSCALL(unlink)
 2d6:	b8 12 00 00 00       	mov    $0x12,%eax
 2db:	cd 40                	int    $0x40
 2dd:	c3                   	ret    

000002de <fstat>:
SYSCALL(fstat)
 2de:	b8 08 00 00 00       	mov    $0x8,%eax
 2e3:	cd 40                	int    $0x40
 2e5:	c3                   	ret    

000002e6 <link>:
SYSCALL(link)
 2e6:	b8 13 00 00 00       	mov    $0x13,%eax
 2eb:	cd 40                	int    $0x40
 2ed:	c3                   	ret    

000002ee <mkdir>:
SYSCALL(mkdir)
 2ee:	b8 14 00 00 00       	mov    $0x14,%eax
 2f3:	cd 40                	int    $0x40
 2f5:	c3                   	ret    

000002f6 <chdir>:
SYSCALL(chdir)
 2f6:	b8 09 00 00 00       	mov    $0x9,%eax
 2fb:	cd 40                	int    $0x40
 2fd:	c3                   	ret    

000002fe <dup>:
SYSCALL(dup)
 2fe:	b8 0a 00 00 00       	mov    $0xa,%eax
 303:	cd 40                	int    $0x40
 305:	c3                   	ret    

00000306 <getpid>:
SYSCALL(getpid)
 306:	b8 0b 00 00 00       	mov    $0xb,%eax
 30b:	cd 40                	int    $0x40
 30d:	c3                   	ret    

0000030e <sbrk>:
SYSCALL(sbrk)
 30e:	b8 0c 00 00 00       	mov    $0xc,%eax
 313:	cd 40                	int    $0x40
 315:	c3                   	ret    

00000316 <sleep>:
SYSCALL(sleep)
 316:	b8 0d 00 00 00       	mov    $0xd,%eax
 31b:	cd 40                	int    $0x40
 31d:	c3                   	ret    

0000031e <uptime>:
SYSCALL(uptime)
 31e:	b8 0e 00 00 00       	mov    $0xe,%eax
 323:	cd 40                	int    $0x40
 325:	c3                   	ret    

00000326 <clone>:
SYSCALL(clone)
 326:	b8 16 00 00 00       	mov    $0x16,%eax
 32b:	cd 40                	int    $0x40
 32d:	c3                   	ret    

0000032e <join>:
 32e:	b8 17 00 00 00       	mov    $0x17,%eax
 333:	cd 40                	int    $0x40
 335:	c3                   	ret    

00000336 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	83 ec 1c             	sub    $0x1c,%esp
 33c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 33f:	6a 01                	push   $0x1
 341:	8d 55 f4             	lea    -0xc(%ebp),%edx
 344:	52                   	push   %edx
 345:	50                   	push   %eax
 346:	e8 5b ff ff ff       	call   2a6 <write>
}
 34b:	83 c4 10             	add    $0x10,%esp
 34e:	c9                   	leave  
 34f:	c3                   	ret    

00000350 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 2c             	sub    $0x2c,%esp
 359:	89 45 d0             	mov    %eax,-0x30(%ebp)
 35c:	89 d0                	mov    %edx,%eax
 35e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 360:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 364:	0f 95 c1             	setne  %cl
 367:	c1 ea 1f             	shr    $0x1f,%edx
 36a:	84 d1                	test   %dl,%cl
 36c:	74 44                	je     3b2 <printint+0x62>
    neg = 1;
    x = -xx;
 36e:	f7 d8                	neg    %eax
 370:	89 c1                	mov    %eax,%ecx
    neg = 1;
 372:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 379:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 37e:	89 c8                	mov    %ecx,%eax
 380:	ba 00 00 00 00       	mov    $0x0,%edx
 385:	f7 f6                	div    %esi
 387:	89 df                	mov    %ebx,%edi
 389:	83 c3 01             	add    $0x1,%ebx
 38c:	0f b6 92 10 07 00 00 	movzbl 0x710(%edx),%edx
 393:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 397:	89 ca                	mov    %ecx,%edx
 399:	89 c1                	mov    %eax,%ecx
 39b:	39 d6                	cmp    %edx,%esi
 39d:	76 df                	jbe    37e <printint+0x2e>
  if(neg)
 39f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3a3:	74 31                	je     3d6 <printint+0x86>
    buf[i++] = '-';
 3a5:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3aa:	8d 5f 02             	lea    0x2(%edi),%ebx
 3ad:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3b0:	eb 17                	jmp    3c9 <printint+0x79>
    x = xx;
 3b2:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3b4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3bb:	eb bc                	jmp    379 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3bd:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3c2:	89 f0                	mov    %esi,%eax
 3c4:	e8 6d ff ff ff       	call   336 <putc>
  while(--i >= 0)
 3c9:	83 eb 01             	sub    $0x1,%ebx
 3cc:	79 ef                	jns    3bd <printint+0x6d>
}
 3ce:	83 c4 2c             	add    $0x2c,%esp
 3d1:	5b                   	pop    %ebx
 3d2:	5e                   	pop    %esi
 3d3:	5f                   	pop    %edi
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    
 3d6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d9:	eb ee                	jmp    3c9 <printint+0x79>

000003db <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	57                   	push   %edi
 3df:	56                   	push   %esi
 3e0:	53                   	push   %ebx
 3e1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3e4:	8d 45 10             	lea    0x10(%ebp),%eax
 3e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3ea:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3ef:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f4:	eb 14                	jmp    40a <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3f6:	89 fa                	mov    %edi,%edx
 3f8:	8b 45 08             	mov    0x8(%ebp),%eax
 3fb:	e8 36 ff ff ff       	call   336 <putc>
 400:	eb 05                	jmp    407 <printf+0x2c>
      }
    } else if(state == '%'){
 402:	83 fe 25             	cmp    $0x25,%esi
 405:	74 25                	je     42c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 407:	83 c3 01             	add    $0x1,%ebx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 411:	84 c0                	test   %al,%al
 413:	0f 84 20 01 00 00    	je     539 <printf+0x15e>
    c = fmt[i] & 0xff;
 419:	0f be f8             	movsbl %al,%edi
 41c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 41f:	85 f6                	test   %esi,%esi
 421:	75 df                	jne    402 <printf+0x27>
      if(c == '%'){
 423:	83 f8 25             	cmp    $0x25,%eax
 426:	75 ce                	jne    3f6 <printf+0x1b>
        state = '%';
 428:	89 c6                	mov    %eax,%esi
 42a:	eb db                	jmp    407 <printf+0x2c>
      if(c == 'd'){
 42c:	83 f8 25             	cmp    $0x25,%eax
 42f:	0f 84 cf 00 00 00    	je     504 <printf+0x129>
 435:	0f 8c dd 00 00 00    	jl     518 <printf+0x13d>
 43b:	83 f8 78             	cmp    $0x78,%eax
 43e:	0f 8f d4 00 00 00    	jg     518 <printf+0x13d>
 444:	83 f8 63             	cmp    $0x63,%eax
 447:	0f 8c cb 00 00 00    	jl     518 <printf+0x13d>
 44d:	83 e8 63             	sub    $0x63,%eax
 450:	83 f8 15             	cmp    $0x15,%eax
 453:	0f 87 bf 00 00 00    	ja     518 <printf+0x13d>
 459:	ff 24 85 b8 06 00 00 	jmp    *0x6b8(,%eax,4)
        printint(fd, *ap, 10, 1);
 460:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 463:	8b 17                	mov    (%edi),%edx
 465:	83 ec 0c             	sub    $0xc,%esp
 468:	6a 01                	push   $0x1
 46a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
 472:	e8 d9 fe ff ff       	call   350 <printint>
        ap++;
 477:	83 c7 04             	add    $0x4,%edi
 47a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 47d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 480:	be 00 00 00 00       	mov    $0x0,%esi
 485:	eb 80                	jmp    407 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 487:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 48a:	8b 17                	mov    (%edi),%edx
 48c:	83 ec 0c             	sub    $0xc,%esp
 48f:	6a 00                	push   $0x0
 491:	b9 10 00 00 00       	mov    $0x10,%ecx
 496:	8b 45 08             	mov    0x8(%ebp),%eax
 499:	e8 b2 fe ff ff       	call   350 <printint>
        ap++;
 49e:	83 c7 04             	add    $0x4,%edi
 4a1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4a7:	be 00 00 00 00       	mov    $0x0,%esi
 4ac:	e9 56 ff ff ff       	jmp    407 <printf+0x2c>
        s = (char*)*ap;
 4b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b4:	8b 30                	mov    (%eax),%esi
        ap++;
 4b6:	83 c0 04             	add    $0x4,%eax
 4b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4bc:	85 f6                	test   %esi,%esi
 4be:	75 15                	jne    4d5 <printf+0xfa>
          s = "(null)";
 4c0:	be af 06 00 00       	mov    $0x6af,%esi
 4c5:	eb 0e                	jmp    4d5 <printf+0xfa>
          putc(fd, *s);
 4c7:	0f be d2             	movsbl %dl,%edx
 4ca:	8b 45 08             	mov    0x8(%ebp),%eax
 4cd:	e8 64 fe ff ff       	call   336 <putc>
          s++;
 4d2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4d5:	0f b6 16             	movzbl (%esi),%edx
 4d8:	84 d2                	test   %dl,%dl
 4da:	75 eb                	jne    4c7 <printf+0xec>
      state = 0;
 4dc:	be 00 00 00 00       	mov    $0x0,%esi
 4e1:	e9 21 ff ff ff       	jmp    407 <printf+0x2c>
        putc(fd, *ap);
 4e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e9:	0f be 17             	movsbl (%edi),%edx
 4ec:	8b 45 08             	mov    0x8(%ebp),%eax
 4ef:	e8 42 fe ff ff       	call   336 <putc>
        ap++;
 4f4:	83 c7 04             	add    $0x4,%edi
 4f7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4fa:	be 00 00 00 00       	mov    $0x0,%esi
 4ff:	e9 03 ff ff ff       	jmp    407 <printf+0x2c>
        putc(fd, c);
 504:	89 fa                	mov    %edi,%edx
 506:	8b 45 08             	mov    0x8(%ebp),%eax
 509:	e8 28 fe ff ff       	call   336 <putc>
      state = 0;
 50e:	be 00 00 00 00       	mov    $0x0,%esi
 513:	e9 ef fe ff ff       	jmp    407 <printf+0x2c>
        putc(fd, '%');
 518:	ba 25 00 00 00       	mov    $0x25,%edx
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	e8 11 fe ff ff       	call   336 <putc>
        putc(fd, c);
 525:	89 fa                	mov    %edi,%edx
 527:	8b 45 08             	mov    0x8(%ebp),%eax
 52a:	e8 07 fe ff ff       	call   336 <putc>
      state = 0;
 52f:	be 00 00 00 00       	mov    $0x0,%esi
 534:	e9 ce fe ff ff       	jmp    407 <printf+0x2c>
    }
  }
}
 539:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53c:	5b                   	pop    %ebx
 53d:	5e                   	pop    %esi
 53e:	5f                   	pop    %edi
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    

00000541 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 541:	55                   	push   %ebp
 542:	89 e5                	mov    %esp,%ebp
 544:	57                   	push   %edi
 545:	56                   	push   %esi
 546:	53                   	push   %ebx
 547:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 54a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 54d:	a1 58 0a 00 00       	mov    0xa58,%eax
 552:	eb 02                	jmp    556 <free+0x15>
 554:	89 d0                	mov    %edx,%eax
 556:	39 c8                	cmp    %ecx,%eax
 558:	73 04                	jae    55e <free+0x1d>
 55a:	39 08                	cmp    %ecx,(%eax)
 55c:	77 12                	ja     570 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 55e:	8b 10                	mov    (%eax),%edx
 560:	39 c2                	cmp    %eax,%edx
 562:	77 f0                	ja     554 <free+0x13>
 564:	39 c8                	cmp    %ecx,%eax
 566:	72 08                	jb     570 <free+0x2f>
 568:	39 ca                	cmp    %ecx,%edx
 56a:	77 04                	ja     570 <free+0x2f>
 56c:	89 d0                	mov    %edx,%eax
 56e:	eb e6                	jmp    556 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 570:	8b 73 fc             	mov    -0x4(%ebx),%esi
 573:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 576:	8b 10                	mov    (%eax),%edx
 578:	39 d7                	cmp    %edx,%edi
 57a:	74 19                	je     595 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 57c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 57f:	8b 50 04             	mov    0x4(%eax),%edx
 582:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 585:	39 ce                	cmp    %ecx,%esi
 587:	74 1b                	je     5a4 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 589:	89 08                	mov    %ecx,(%eax)
  freep = p;
 58b:	a3 58 0a 00 00       	mov    %eax,0xa58
}
 590:	5b                   	pop    %ebx
 591:	5e                   	pop    %esi
 592:	5f                   	pop    %edi
 593:	5d                   	pop    %ebp
 594:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 595:	03 72 04             	add    0x4(%edx),%esi
 598:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 59b:	8b 10                	mov    (%eax),%edx
 59d:	8b 12                	mov    (%edx),%edx
 59f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5a2:	eb db                	jmp    57f <free+0x3e>
    p->s.size += bp->s.size;
 5a4:	03 53 fc             	add    -0x4(%ebx),%edx
 5a7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5aa:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5ad:	89 10                	mov    %edx,(%eax)
 5af:	eb da                	jmp    58b <free+0x4a>

000005b1 <morecore>:

static Header*
morecore(uint nu)
{
 5b1:	55                   	push   %ebp
 5b2:	89 e5                	mov    %esp,%ebp
 5b4:	53                   	push   %ebx
 5b5:	83 ec 04             	sub    $0x4,%esp
 5b8:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5ba:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5bf:	77 05                	ja     5c6 <morecore+0x15>
    nu = 4096;
 5c1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5c6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5cd:	83 ec 0c             	sub    $0xc,%esp
 5d0:	50                   	push   %eax
 5d1:	e8 38 fd ff ff       	call   30e <sbrk>
  if(p == (char*)-1)
 5d6:	83 c4 10             	add    $0x10,%esp
 5d9:	83 f8 ff             	cmp    $0xffffffff,%eax
 5dc:	74 1c                	je     5fa <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5de:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5e1:	83 c0 08             	add    $0x8,%eax
 5e4:	83 ec 0c             	sub    $0xc,%esp
 5e7:	50                   	push   %eax
 5e8:	e8 54 ff ff ff       	call   541 <free>
  return freep;
 5ed:	a1 58 0a 00 00       	mov    0xa58,%eax
 5f2:	83 c4 10             	add    $0x10,%esp
}
 5f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f8:	c9                   	leave  
 5f9:	c3                   	ret    
    return 0;
 5fa:	b8 00 00 00 00       	mov    $0x0,%eax
 5ff:	eb f4                	jmp    5f5 <morecore+0x44>

00000601 <malloc>:

void*
malloc(uint nbytes)
{
 601:	55                   	push   %ebp
 602:	89 e5                	mov    %esp,%ebp
 604:	53                   	push   %ebx
 605:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	8d 58 07             	lea    0x7(%eax),%ebx
 60e:	c1 eb 03             	shr    $0x3,%ebx
 611:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 614:	8b 0d 58 0a 00 00    	mov    0xa58,%ecx
 61a:	85 c9                	test   %ecx,%ecx
 61c:	74 04                	je     622 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 61e:	8b 01                	mov    (%ecx),%eax
 620:	eb 4a                	jmp    66c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 622:	c7 05 58 0a 00 00 5c 	movl   $0xa5c,0xa58
 629:	0a 00 00 
 62c:	c7 05 5c 0a 00 00 5c 	movl   $0xa5c,0xa5c
 633:	0a 00 00 
    base.s.size = 0;
 636:	c7 05 60 0a 00 00 00 	movl   $0x0,0xa60
 63d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 640:	b9 5c 0a 00 00       	mov    $0xa5c,%ecx
 645:	eb d7                	jmp    61e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 647:	74 19                	je     662 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 649:	29 da                	sub    %ebx,%edx
 64b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 64e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 651:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 654:	89 0d 58 0a 00 00    	mov    %ecx,0xa58
      return (void*)(p + 1);
 65a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 65d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 660:	c9                   	leave  
 661:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 662:	8b 10                	mov    (%eax),%edx
 664:	89 11                	mov    %edx,(%ecx)
 666:	eb ec                	jmp    654 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 668:	89 c1                	mov    %eax,%ecx
 66a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 66c:	8b 50 04             	mov    0x4(%eax),%edx
 66f:	39 da                	cmp    %ebx,%edx
 671:	73 d4                	jae    647 <malloc+0x46>
    if(p == freep)
 673:	39 05 58 0a 00 00    	cmp    %eax,0xa58
 679:	75 ed                	jne    668 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 67b:	89 d8                	mov    %ebx,%eax
 67d:	e8 2f ff ff ff       	call   5b1 <morecore>
 682:	85 c0                	test   %eax,%eax
 684:	75 e2                	jne    668 <malloc+0x67>
 686:	eb d5                	jmp    65d <malloc+0x5c>
