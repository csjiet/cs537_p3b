
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
  11:	e8 3a 02 00 00       	call   250 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 39 02 00 00       	call   258 <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 bf 02 00 00       	call   2e8 <sleep>
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
  f4:	e8 77 01 00 00       	call   270 <read>
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
 132:	e8 61 01 00 00       	call   298 <open>
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
 147:	e8 64 01 00 00       	call   2b0 <fstat>
 14c:	89 c6                	mov    %eax,%esi
  close(fd);
 14e:	89 1c 24             	mov    %ebx,(%esp)
 151:	e8 2a 01 00 00       	call   280 <close>
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

  void* stack = malloc(2 * PGSIZE);
 1cb:	68 00 20 00 00       	push   $0x2000
 1d0:	e8 fe 03 00 00       	call   5d3 <malloc>
  if ((uint)stack%PGSIZE){
 1d5:	83 c4 10             	add    $0x10,%esp
 1d8:	a9 ff 0f 00 00       	test   $0xfff,%eax
 1dd:	74 0a                	je     1e9 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 1df:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 1e4:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 1e9:	50                   	push   %eax
 1ea:	ff 75 10             	push   0x10(%ebp)
 1ed:	ff 75 0c             	push   0xc(%ebp)
 1f0:	ff 75 08             	push   0x8(%ebp)
 1f3:	e8 00 01 00 00       	call   2f8 <clone>
}
 1f8:	c9                   	leave  
 1f9:	c3                   	ret    

000001fa <thread_join>:

int thread_join(){
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
 1fd:	53                   	push   %ebx
 1fe:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 201:	8d 45 f4             	lea    -0xc(%ebp),%eax
 204:	50                   	push   %eax
 205:	e8 f6 00 00 00       	call   300 <join>
 20a:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 20c:	83 c4 04             	add    $0x4,%esp
 20f:	ff 75 f4             	push   -0xc(%ebp)
 212:	e8 fc 02 00 00       	call   513 <free>
  return x;
}
 217:	89 d8                	mov    %ebx,%eax
 219:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21c:	c9                   	leave  
 21d:	c3                   	ret    

0000021e <lock_init>:

void lock_init(lock_t *spin){
 21e:	55                   	push   %ebp
 21f:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    

0000022c <lock_acquire>:

void lock_acquire(lock_t *spin){
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 232:	b8 01 00 00 00       	mov    $0x1,%eax
 237:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 23a:	85 c0                	test   %eax,%eax
 23c:	75 f4                	jne    232 <lock_acquire+0x6>

}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    

00000240 <lock_release>:

void lock_release(lock_t *spin){
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
 246:	b8 00 00 00 00       	mov    $0x0,%eax
 24b:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    

00000250 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 250:	b8 01 00 00 00       	mov    $0x1,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret    

00000258 <exit>:
SYSCALL(exit)
 258:	b8 02 00 00 00       	mov    $0x2,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret    

00000260 <wait>:
SYSCALL(wait)
 260:	b8 03 00 00 00       	mov    $0x3,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret    

00000268 <pipe>:
SYSCALL(pipe)
 268:	b8 04 00 00 00       	mov    $0x4,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret    

00000270 <read>:
SYSCALL(read)
 270:	b8 05 00 00 00       	mov    $0x5,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <write>:
SYSCALL(write)
 278:	b8 10 00 00 00       	mov    $0x10,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <close>:
SYSCALL(close)
 280:	b8 15 00 00 00       	mov    $0x15,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <kill>:
SYSCALL(kill)
 288:	b8 06 00 00 00       	mov    $0x6,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <exec>:
SYSCALL(exec)
 290:	b8 07 00 00 00       	mov    $0x7,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <open>:
SYSCALL(open)
 298:	b8 0f 00 00 00       	mov    $0xf,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <mknod>:
SYSCALL(mknod)
 2a0:	b8 11 00 00 00       	mov    $0x11,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <unlink>:
SYSCALL(unlink)
 2a8:	b8 12 00 00 00       	mov    $0x12,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <fstat>:
SYSCALL(fstat)
 2b0:	b8 08 00 00 00       	mov    $0x8,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <link>:
SYSCALL(link)
 2b8:	b8 13 00 00 00       	mov    $0x13,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <mkdir>:
SYSCALL(mkdir)
 2c0:	b8 14 00 00 00       	mov    $0x14,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <chdir>:
SYSCALL(chdir)
 2c8:	b8 09 00 00 00       	mov    $0x9,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <dup>:
SYSCALL(dup)
 2d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <getpid>:
SYSCALL(getpid)
 2d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <sbrk>:
SYSCALL(sbrk)
 2e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <sleep>:
SYSCALL(sleep)
 2e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <uptime>:
SYSCALL(uptime)
 2f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <clone>:
SYSCALL(clone)
 2f8:	b8 16 00 00 00       	mov    $0x16,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <join>:
 300:	b8 17 00 00 00       	mov    $0x17,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 308:	55                   	push   %ebp
 309:	89 e5                	mov    %esp,%ebp
 30b:	83 ec 1c             	sub    $0x1c,%esp
 30e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 311:	6a 01                	push   $0x1
 313:	8d 55 f4             	lea    -0xc(%ebp),%edx
 316:	52                   	push   %edx
 317:	50                   	push   %eax
 318:	e8 5b ff ff ff       	call   278 <write>
}
 31d:	83 c4 10             	add    $0x10,%esp
 320:	c9                   	leave  
 321:	c3                   	ret    

00000322 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 322:	55                   	push   %ebp
 323:	89 e5                	mov    %esp,%ebp
 325:	57                   	push   %edi
 326:	56                   	push   %esi
 327:	53                   	push   %ebx
 328:	83 ec 2c             	sub    $0x2c,%esp
 32b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 32e:	89 d0                	mov    %edx,%eax
 330:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 332:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 336:	0f 95 c1             	setne  %cl
 339:	c1 ea 1f             	shr    $0x1f,%edx
 33c:	84 d1                	test   %dl,%cl
 33e:	74 44                	je     384 <printint+0x62>
    neg = 1;
    x = -xx;
 340:	f7 d8                	neg    %eax
 342:	89 c1                	mov    %eax,%ecx
    neg = 1;
 344:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 34b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 350:	89 c8                	mov    %ecx,%eax
 352:	ba 00 00 00 00       	mov    $0x0,%edx
 357:	f7 f6                	div    %esi
 359:	89 df                	mov    %ebx,%edi
 35b:	83 c3 01             	add    $0x1,%ebx
 35e:	0f b6 92 bc 06 00 00 	movzbl 0x6bc(%edx),%edx
 365:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 369:	89 ca                	mov    %ecx,%edx
 36b:	89 c1                	mov    %eax,%ecx
 36d:	39 d6                	cmp    %edx,%esi
 36f:	76 df                	jbe    350 <printint+0x2e>
  if(neg)
 371:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 375:	74 31                	je     3a8 <printint+0x86>
    buf[i++] = '-';
 377:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 37c:	8d 5f 02             	lea    0x2(%edi),%ebx
 37f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 382:	eb 17                	jmp    39b <printint+0x79>
    x = xx;
 384:	89 c1                	mov    %eax,%ecx
  neg = 0;
 386:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 38d:	eb bc                	jmp    34b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 38f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 394:	89 f0                	mov    %esi,%eax
 396:	e8 6d ff ff ff       	call   308 <putc>
  while(--i >= 0)
 39b:	83 eb 01             	sub    $0x1,%ebx
 39e:	79 ef                	jns    38f <printint+0x6d>
}
 3a0:	83 c4 2c             	add    $0x2c,%esp
 3a3:	5b                   	pop    %ebx
 3a4:	5e                   	pop    %esi
 3a5:	5f                   	pop    %edi
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    
 3a8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ab:	eb ee                	jmp    39b <printint+0x79>

000003ad <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3ad:	55                   	push   %ebp
 3ae:	89 e5                	mov    %esp,%ebp
 3b0:	57                   	push   %edi
 3b1:	56                   	push   %esi
 3b2:	53                   	push   %ebx
 3b3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3b6:	8d 45 10             	lea    0x10(%ebp),%eax
 3b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3bc:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3c1:	bb 00 00 00 00       	mov    $0x0,%ebx
 3c6:	eb 14                	jmp    3dc <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3c8:	89 fa                	mov    %edi,%edx
 3ca:	8b 45 08             	mov    0x8(%ebp),%eax
 3cd:	e8 36 ff ff ff       	call   308 <putc>
 3d2:	eb 05                	jmp    3d9 <printf+0x2c>
      }
    } else if(state == '%'){
 3d4:	83 fe 25             	cmp    $0x25,%esi
 3d7:	74 25                	je     3fe <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3d9:	83 c3 01             	add    $0x1,%ebx
 3dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3df:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3e3:	84 c0                	test   %al,%al
 3e5:	0f 84 20 01 00 00    	je     50b <printf+0x15e>
    c = fmt[i] & 0xff;
 3eb:	0f be f8             	movsbl %al,%edi
 3ee:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3f1:	85 f6                	test   %esi,%esi
 3f3:	75 df                	jne    3d4 <printf+0x27>
      if(c == '%'){
 3f5:	83 f8 25             	cmp    $0x25,%eax
 3f8:	75 ce                	jne    3c8 <printf+0x1b>
        state = '%';
 3fa:	89 c6                	mov    %eax,%esi
 3fc:	eb db                	jmp    3d9 <printf+0x2c>
      if(c == 'd'){
 3fe:	83 f8 25             	cmp    $0x25,%eax
 401:	0f 84 cf 00 00 00    	je     4d6 <printf+0x129>
 407:	0f 8c dd 00 00 00    	jl     4ea <printf+0x13d>
 40d:	83 f8 78             	cmp    $0x78,%eax
 410:	0f 8f d4 00 00 00    	jg     4ea <printf+0x13d>
 416:	83 f8 63             	cmp    $0x63,%eax
 419:	0f 8c cb 00 00 00    	jl     4ea <printf+0x13d>
 41f:	83 e8 63             	sub    $0x63,%eax
 422:	83 f8 15             	cmp    $0x15,%eax
 425:	0f 87 bf 00 00 00    	ja     4ea <printf+0x13d>
 42b:	ff 24 85 64 06 00 00 	jmp    *0x664(,%eax,4)
        printint(fd, *ap, 10, 1);
 432:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 435:	8b 17                	mov    (%edi),%edx
 437:	83 ec 0c             	sub    $0xc,%esp
 43a:	6a 01                	push   $0x1
 43c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 441:	8b 45 08             	mov    0x8(%ebp),%eax
 444:	e8 d9 fe ff ff       	call   322 <printint>
        ap++;
 449:	83 c7 04             	add    $0x4,%edi
 44c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 44f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 452:	be 00 00 00 00       	mov    $0x0,%esi
 457:	eb 80                	jmp    3d9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 459:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 45c:	8b 17                	mov    (%edi),%edx
 45e:	83 ec 0c             	sub    $0xc,%esp
 461:	6a 00                	push   $0x0
 463:	b9 10 00 00 00       	mov    $0x10,%ecx
 468:	8b 45 08             	mov    0x8(%ebp),%eax
 46b:	e8 b2 fe ff ff       	call   322 <printint>
        ap++;
 470:	83 c7 04             	add    $0x4,%edi
 473:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 476:	83 c4 10             	add    $0x10,%esp
      state = 0;
 479:	be 00 00 00 00       	mov    $0x0,%esi
 47e:	e9 56 ff ff ff       	jmp    3d9 <printf+0x2c>
        s = (char*)*ap;
 483:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 486:	8b 30                	mov    (%eax),%esi
        ap++;
 488:	83 c0 04             	add    $0x4,%eax
 48b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 48e:	85 f6                	test   %esi,%esi
 490:	75 15                	jne    4a7 <printf+0xfa>
          s = "(null)";
 492:	be 5c 06 00 00       	mov    $0x65c,%esi
 497:	eb 0e                	jmp    4a7 <printf+0xfa>
          putc(fd, *s);
 499:	0f be d2             	movsbl %dl,%edx
 49c:	8b 45 08             	mov    0x8(%ebp),%eax
 49f:	e8 64 fe ff ff       	call   308 <putc>
          s++;
 4a4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4a7:	0f b6 16             	movzbl (%esi),%edx
 4aa:	84 d2                	test   %dl,%dl
 4ac:	75 eb                	jne    499 <printf+0xec>
      state = 0;
 4ae:	be 00 00 00 00       	mov    $0x0,%esi
 4b3:	e9 21 ff ff ff       	jmp    3d9 <printf+0x2c>
        putc(fd, *ap);
 4b8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4bb:	0f be 17             	movsbl (%edi),%edx
 4be:	8b 45 08             	mov    0x8(%ebp),%eax
 4c1:	e8 42 fe ff ff       	call   308 <putc>
        ap++;
 4c6:	83 c7 04             	add    $0x4,%edi
 4c9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4cc:	be 00 00 00 00       	mov    $0x0,%esi
 4d1:	e9 03 ff ff ff       	jmp    3d9 <printf+0x2c>
        putc(fd, c);
 4d6:	89 fa                	mov    %edi,%edx
 4d8:	8b 45 08             	mov    0x8(%ebp),%eax
 4db:	e8 28 fe ff ff       	call   308 <putc>
      state = 0;
 4e0:	be 00 00 00 00       	mov    $0x0,%esi
 4e5:	e9 ef fe ff ff       	jmp    3d9 <printf+0x2c>
        putc(fd, '%');
 4ea:	ba 25 00 00 00       	mov    $0x25,%edx
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
 4f2:	e8 11 fe ff ff       	call   308 <putc>
        putc(fd, c);
 4f7:	89 fa                	mov    %edi,%edx
 4f9:	8b 45 08             	mov    0x8(%ebp),%eax
 4fc:	e8 07 fe ff ff       	call   308 <putc>
      state = 0;
 501:	be 00 00 00 00       	mov    $0x0,%esi
 506:	e9 ce fe ff ff       	jmp    3d9 <printf+0x2c>
    }
  }
}
 50b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50e:	5b                   	pop    %ebx
 50f:	5e                   	pop    %esi
 510:	5f                   	pop    %edi
 511:	5d                   	pop    %ebp
 512:	c3                   	ret    

00000513 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 513:	55                   	push   %ebp
 514:	89 e5                	mov    %esp,%ebp
 516:	57                   	push   %edi
 517:	56                   	push   %esi
 518:	53                   	push   %ebx
 519:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 51c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 51f:	a1 00 0a 00 00       	mov    0xa00,%eax
 524:	eb 02                	jmp    528 <free+0x15>
 526:	89 d0                	mov    %edx,%eax
 528:	39 c8                	cmp    %ecx,%eax
 52a:	73 04                	jae    530 <free+0x1d>
 52c:	39 08                	cmp    %ecx,(%eax)
 52e:	77 12                	ja     542 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 530:	8b 10                	mov    (%eax),%edx
 532:	39 c2                	cmp    %eax,%edx
 534:	77 f0                	ja     526 <free+0x13>
 536:	39 c8                	cmp    %ecx,%eax
 538:	72 08                	jb     542 <free+0x2f>
 53a:	39 ca                	cmp    %ecx,%edx
 53c:	77 04                	ja     542 <free+0x2f>
 53e:	89 d0                	mov    %edx,%eax
 540:	eb e6                	jmp    528 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 542:	8b 73 fc             	mov    -0x4(%ebx),%esi
 545:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 548:	8b 10                	mov    (%eax),%edx
 54a:	39 d7                	cmp    %edx,%edi
 54c:	74 19                	je     567 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 54e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 551:	8b 50 04             	mov    0x4(%eax),%edx
 554:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 557:	39 ce                	cmp    %ecx,%esi
 559:	74 1b                	je     576 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 55b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 55d:	a3 00 0a 00 00       	mov    %eax,0xa00
}
 562:	5b                   	pop    %ebx
 563:	5e                   	pop    %esi
 564:	5f                   	pop    %edi
 565:	5d                   	pop    %ebp
 566:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 567:	03 72 04             	add    0x4(%edx),%esi
 56a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 56d:	8b 10                	mov    (%eax),%edx
 56f:	8b 12                	mov    (%edx),%edx
 571:	89 53 f8             	mov    %edx,-0x8(%ebx)
 574:	eb db                	jmp    551 <free+0x3e>
    p->s.size += bp->s.size;
 576:	03 53 fc             	add    -0x4(%ebx),%edx
 579:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 57c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 57f:	89 10                	mov    %edx,(%eax)
 581:	eb da                	jmp    55d <free+0x4a>

00000583 <morecore>:

static Header*
morecore(uint nu)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	53                   	push   %ebx
 587:	83 ec 04             	sub    $0x4,%esp
 58a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 58c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 591:	77 05                	ja     598 <morecore+0x15>
    nu = 4096;
 593:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 598:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 59f:	83 ec 0c             	sub    $0xc,%esp
 5a2:	50                   	push   %eax
 5a3:	e8 38 fd ff ff       	call   2e0 <sbrk>
  if(p == (char*)-1)
 5a8:	83 c4 10             	add    $0x10,%esp
 5ab:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ae:	74 1c                	je     5cc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5b3:	83 c0 08             	add    $0x8,%eax
 5b6:	83 ec 0c             	sub    $0xc,%esp
 5b9:	50                   	push   %eax
 5ba:	e8 54 ff ff ff       	call   513 <free>
  return freep;
 5bf:	a1 00 0a 00 00       	mov    0xa00,%eax
 5c4:	83 c4 10             	add    $0x10,%esp
}
 5c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ca:	c9                   	leave  
 5cb:	c3                   	ret    
    return 0;
 5cc:	b8 00 00 00 00       	mov    $0x0,%eax
 5d1:	eb f4                	jmp    5c7 <morecore+0x44>

000005d3 <malloc>:

void*
malloc(uint nbytes)
{
 5d3:	55                   	push   %ebp
 5d4:	89 e5                	mov    %esp,%ebp
 5d6:	53                   	push   %ebx
 5d7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	8d 58 07             	lea    0x7(%eax),%ebx
 5e0:	c1 eb 03             	shr    $0x3,%ebx
 5e3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5e6:	8b 0d 00 0a 00 00    	mov    0xa00,%ecx
 5ec:	85 c9                	test   %ecx,%ecx
 5ee:	74 04                	je     5f4 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5f0:	8b 01                	mov    (%ecx),%eax
 5f2:	eb 4a                	jmp    63e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 5f4:	c7 05 00 0a 00 00 04 	movl   $0xa04,0xa00
 5fb:	0a 00 00 
 5fe:	c7 05 04 0a 00 00 04 	movl   $0xa04,0xa04
 605:	0a 00 00 
    base.s.size = 0;
 608:	c7 05 08 0a 00 00 00 	movl   $0x0,0xa08
 60f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 612:	b9 04 0a 00 00       	mov    $0xa04,%ecx
 617:	eb d7                	jmp    5f0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 619:	74 19                	je     634 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 61b:	29 da                	sub    %ebx,%edx
 61d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 620:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 623:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 626:	89 0d 00 0a 00 00    	mov    %ecx,0xa00
      return (void*)(p + 1);
 62c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 62f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 632:	c9                   	leave  
 633:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 634:	8b 10                	mov    (%eax),%edx
 636:	89 11                	mov    %edx,(%ecx)
 638:	eb ec                	jmp    626 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 63a:	89 c1                	mov    %eax,%ecx
 63c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 63e:	8b 50 04             	mov    0x4(%eax),%edx
 641:	39 da                	cmp    %ebx,%edx
 643:	73 d4                	jae    619 <malloc+0x46>
    if(p == freep)
 645:	39 05 00 0a 00 00    	cmp    %eax,0xa00
 64b:	75 ed                	jne    63a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 64d:	89 d8                	mov    %ebx,%eax
 64f:	e8 2f ff ff ff       	call   583 <morecore>
 654:	85 c0                	test   %eax,%eax
 656:	75 e2                	jne    63a <malloc+0x67>
 658:	eb d5                	jmp    62f <malloc+0x5c>
