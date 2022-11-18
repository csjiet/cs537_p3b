
_echo:     file format elf32-i386


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
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  20:	ba 7e 06 00 00       	mov    $0x67e,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 80 06 00 00       	push   $0x680
  2e:	6a 01                	push   $0x1
  30:	e8 98 03 00 00       	call   3cd <printf>
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba 7c 06 00 00       	mov    $0x67c,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 27 02 00 00       	call   278 <exit>

00000051 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	56                   	push   %esi
  55:	53                   	push   %ebx
  56:	8b 75 08             	mov    0x8(%ebp),%esi
  59:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  5c:	89 f0                	mov    %esi,%eax
  5e:	89 d1                	mov    %edx,%ecx
  60:	83 c2 01             	add    $0x1,%edx
  63:	89 c3                	mov    %eax,%ebx
  65:	83 c0 01             	add    $0x1,%eax
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	88 0b                	mov    %cl,(%ebx)
  6d:	84 c9                	test   %cl,%cl
  6f:	75 ed                	jne    5e <strcpy+0xd>
    ;
  return os;
}
  71:	89 f0                	mov    %esi,%eax
  73:	5b                   	pop    %ebx
  74:	5e                   	pop    %esi
  75:	5d                   	pop    %ebp
  76:	c3                   	ret    

00000077 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  77:	55                   	push   %ebp
  78:	89 e5                	mov    %esp,%ebp
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  80:	eb 06                	jmp    88 <strcmp+0x11>
    p++, q++;
  82:	83 c1 01             	add    $0x1,%ecx
  85:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  88:	0f b6 01             	movzbl (%ecx),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 04                	je     93 <strcmp+0x1c>
  8f:	3a 02                	cmp    (%edx),%al
  91:	74 ef                	je     82 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  93:	0f b6 c0             	movzbl %al,%eax
  96:	0f b6 12             	movzbl (%edx),%edx
  99:	29 d0                	sub    %edx,%eax
}
  9b:	5d                   	pop    %ebp
  9c:	c3                   	ret    

0000009d <strlen>:

uint
strlen(const char *s)
{
  9d:	55                   	push   %ebp
  9e:	89 e5                	mov    %esp,%ebp
  a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  a3:	b8 00 00 00 00       	mov    $0x0,%eax
  a8:	eb 03                	jmp    ad <strlen+0x10>
  aa:	83 c0 01             	add    $0x1,%eax
  ad:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  b1:	75 f7                	jne    aa <strlen+0xd>
    ;
  return n;
}
  b3:	5d                   	pop    %ebp
  b4:	c3                   	ret    

000000b5 <memset>:

void*
memset(void *dst, int c, uint n)
{
  b5:	55                   	push   %ebp
  b6:	89 e5                	mov    %esp,%ebp
  b8:	57                   	push   %edi
  b9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  bc:	89 d7                	mov    %edx,%edi
  be:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  c4:	fc                   	cld    
  c5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  c7:	89 d0                	mov    %edx,%eax
  c9:	8b 7d fc             	mov    -0x4(%ebp),%edi
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strchr>:

char*
strchr(const char *s, char c)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	8b 45 08             	mov    0x8(%ebp),%eax
  d4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  d8:	eb 03                	jmp    dd <strchr+0xf>
  da:	83 c0 01             	add    $0x1,%eax
  dd:	0f b6 10             	movzbl (%eax),%edx
  e0:	84 d2                	test   %dl,%dl
  e2:	74 06                	je     ea <strchr+0x1c>
    if(*s == c)
  e4:	38 ca                	cmp    %cl,%dl
  e6:	75 f2                	jne    da <strchr+0xc>
  e8:	eb 05                	jmp    ef <strchr+0x21>
      return (char*)s;
  return 0;
  ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    

000000f1 <gets>:

char*
gets(char *buf, int max)
{
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	57                   	push   %edi
  f5:	56                   	push   %esi
  f6:	53                   	push   %ebx
  f7:	83 ec 1c             	sub    $0x1c,%esp
  fa:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 102:	89 de                	mov    %ebx,%esi
 104:	83 c3 01             	add    $0x1,%ebx
 107:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 10a:	7d 2e                	jge    13a <gets+0x49>
    cc = read(0, &c, 1);
 10c:	83 ec 04             	sub    $0x4,%esp
 10f:	6a 01                	push   $0x1
 111:	8d 45 e7             	lea    -0x19(%ebp),%eax
 114:	50                   	push   %eax
 115:	6a 00                	push   $0x0
 117:	e8 74 01 00 00       	call   290 <read>
    if(cc < 1)
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	7e 17                	jle    13a <gets+0x49>
      break;
    buf[i++] = c;
 123:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 127:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 12a:	3c 0a                	cmp    $0xa,%al
 12c:	0f 94 c2             	sete   %dl
 12f:	3c 0d                	cmp    $0xd,%al
 131:	0f 94 c0             	sete   %al
 134:	08 c2                	or     %al,%dl
 136:	74 ca                	je     102 <gets+0x11>
    buf[i++] = c;
 138:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 13a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 13e:	89 f8                	mov    %edi,%eax
 140:	8d 65 f4             	lea    -0xc(%ebp),%esp
 143:	5b                   	pop    %ebx
 144:	5e                   	pop    %esi
 145:	5f                   	pop    %edi
 146:	5d                   	pop    %ebp
 147:	c3                   	ret    

00000148 <stat>:

int
stat(const char *n, struct stat *st)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	56                   	push   %esi
 14c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 14d:	83 ec 08             	sub    $0x8,%esp
 150:	6a 00                	push   $0x0
 152:	ff 75 08             	push   0x8(%ebp)
 155:	e8 5e 01 00 00       	call   2b8 <open>
  if(fd < 0)
 15a:	83 c4 10             	add    $0x10,%esp
 15d:	85 c0                	test   %eax,%eax
 15f:	78 24                	js     185 <stat+0x3d>
 161:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 163:	83 ec 08             	sub    $0x8,%esp
 166:	ff 75 0c             	push   0xc(%ebp)
 169:	50                   	push   %eax
 16a:	e8 61 01 00 00       	call   2d0 <fstat>
 16f:	89 c6                	mov    %eax,%esi
  close(fd);
 171:	89 1c 24             	mov    %ebx,(%esp)
 174:	e8 27 01 00 00       	call   2a0 <close>
  return r;
 179:	83 c4 10             	add    $0x10,%esp
}
 17c:	89 f0                	mov    %esi,%eax
 17e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 181:	5b                   	pop    %ebx
 182:	5e                   	pop    %esi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
    return -1;
 185:	be ff ff ff ff       	mov    $0xffffffff,%esi
 18a:	eb f0                	jmp    17c <stat+0x34>

0000018c <atoi>:

int
atoi(const char *s)
{
 18c:	55                   	push   %ebp
 18d:	89 e5                	mov    %esp,%ebp
 18f:	53                   	push   %ebx
 190:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 193:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 198:	eb 10                	jmp    1aa <atoi+0x1e>
    n = n*10 + *s++ - '0';
 19a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 19d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	0f be c0             	movsbl %al,%eax
 1a6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1aa:	0f b6 01             	movzbl (%ecx),%eax
 1ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1b0:	80 fb 09             	cmp    $0x9,%bl
 1b3:	76 e5                	jbe    19a <atoi+0xe>
  return n;
}
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ba:	c9                   	leave  
 1bb:	c3                   	ret    

000001bc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	56                   	push   %esi
 1c0:	53                   	push   %ebx
 1c1:	8b 75 08             	mov    0x8(%ebp),%esi
 1c4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1c7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ca:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1cc:	eb 0d                	jmp    1db <memmove+0x1f>
    *dst++ = *src++;
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	88 02                	mov    %al,(%edx)
 1d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 1d6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1d9:	89 d8                	mov    %ebx,%eax
 1db:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1de:	85 c0                	test   %eax,%eax
 1e0:	7f ec                	jg     1ce <memmove+0x12>
  return vdst;
}
 1e2:	89 f0                	mov    %esi,%eax
 1e4:	5b                   	pop    %ebx
 1e5:	5e                   	pop    %esi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    

000001e8 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 1ee:	68 00 10 00 00       	push   $0x1000
 1f3:	e8 fb 03 00 00       	call   5f3 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 1f8:	50                   	push   %eax
 1f9:	ff 75 10             	push   0x10(%ebp)
 1fc:	ff 75 0c             	push   0xc(%ebp)
 1ff:	ff 75 08             	push   0x8(%ebp)
 202:	e8 11 01 00 00       	call   318 <clone>
}
 207:	c9                   	leave  
 208:	c3                   	ret    

00000209 <thread_join>:

int thread_join(){
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
 20c:	53                   	push   %ebx
 20d:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 210:	8d 45 f4             	lea    -0xc(%ebp),%eax
 213:	50                   	push   %eax
 214:	e8 07 01 00 00       	call   320 <join>
  if (x < 0) {
 219:	83 c4 10             	add    $0x10,%esp
 21c:	85 c0                	test   %eax,%eax
 21e:	78 17                	js     237 <thread_join+0x2e>
 220:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 222:	83 ec 0c             	sub    $0xc,%esp
 225:	ff 75 f4             	push   -0xc(%ebp)
 228:	e8 06 03 00 00       	call   533 <free>
  return x;
 22d:	83 c4 10             	add    $0x10,%esp
}
 230:	89 d8                	mov    %ebx,%eax
 232:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 235:	c9                   	leave  
 236:	c3                   	ret    
    return -1;
 237:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 23c:	eb f2                	jmp    230 <thread_join+0x27>

0000023e <lock_init>:

void lock_init(lock_t *spin){
 23e:	55                   	push   %ebp
 23f:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <lock_acquire>:

void lock_acquire(lock_t *spin){
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 252:	b8 01 00 00 00       	mov    $0x1,%eax
 257:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 25a:	85 c0                	test   %eax,%eax
 25c:	75 f4                	jne    252 <lock_acquire+0x6>

}
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    

00000260 <lock_release>:

void lock_release(lock_t *spin){
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 55 08             	mov    0x8(%ebp),%edx
 266:	b8 00 00 00 00       	mov    $0x0,%eax
 26b:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    

00000270 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 270:	b8 01 00 00 00       	mov    $0x1,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <exit>:
SYSCALL(exit)
 278:	b8 02 00 00 00       	mov    $0x2,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <wait>:
SYSCALL(wait)
 280:	b8 03 00 00 00       	mov    $0x3,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <pipe>:
SYSCALL(pipe)
 288:	b8 04 00 00 00       	mov    $0x4,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <read>:
SYSCALL(read)
 290:	b8 05 00 00 00       	mov    $0x5,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <write>:
SYSCALL(write)
 298:	b8 10 00 00 00       	mov    $0x10,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <close>:
SYSCALL(close)
 2a0:	b8 15 00 00 00       	mov    $0x15,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <kill>:
SYSCALL(kill)
 2a8:	b8 06 00 00 00       	mov    $0x6,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <exec>:
SYSCALL(exec)
 2b0:	b8 07 00 00 00       	mov    $0x7,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <open>:
SYSCALL(open)
 2b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <mknod>:
SYSCALL(mknod)
 2c0:	b8 11 00 00 00       	mov    $0x11,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <unlink>:
SYSCALL(unlink)
 2c8:	b8 12 00 00 00       	mov    $0x12,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <fstat>:
SYSCALL(fstat)
 2d0:	b8 08 00 00 00       	mov    $0x8,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <link>:
SYSCALL(link)
 2d8:	b8 13 00 00 00       	mov    $0x13,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <mkdir>:
SYSCALL(mkdir)
 2e0:	b8 14 00 00 00       	mov    $0x14,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <chdir>:
SYSCALL(chdir)
 2e8:	b8 09 00 00 00       	mov    $0x9,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <dup>:
SYSCALL(dup)
 2f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <getpid>:
SYSCALL(getpid)
 2f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <sbrk>:
SYSCALL(sbrk)
 300:	b8 0c 00 00 00       	mov    $0xc,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <sleep>:
SYSCALL(sleep)
 308:	b8 0d 00 00 00       	mov    $0xd,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <uptime>:
SYSCALL(uptime)
 310:	b8 0e 00 00 00       	mov    $0xe,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <clone>:
SYSCALL(clone)
 318:	b8 16 00 00 00       	mov    $0x16,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <join>:
 320:	b8 17 00 00 00       	mov    $0x17,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	83 ec 1c             	sub    $0x1c,%esp
 32e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 331:	6a 01                	push   $0x1
 333:	8d 55 f4             	lea    -0xc(%ebp),%edx
 336:	52                   	push   %edx
 337:	50                   	push   %eax
 338:	e8 5b ff ff ff       	call   298 <write>
}
 33d:	83 c4 10             	add    $0x10,%esp
 340:	c9                   	leave  
 341:	c3                   	ret    

00000342 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	57                   	push   %edi
 346:	56                   	push   %esi
 347:	53                   	push   %ebx
 348:	83 ec 2c             	sub    $0x2c,%esp
 34b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 34e:	89 d0                	mov    %edx,%eax
 350:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 352:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 356:	0f 95 c1             	setne  %cl
 359:	c1 ea 1f             	shr    $0x1f,%edx
 35c:	84 d1                	test   %dl,%cl
 35e:	74 44                	je     3a4 <printint+0x62>
    neg = 1;
    x = -xx;
 360:	f7 d8                	neg    %eax
 362:	89 c1                	mov    %eax,%ecx
    neg = 1;
 364:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 36b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 370:	89 c8                	mov    %ecx,%eax
 372:	ba 00 00 00 00       	mov    $0x0,%edx
 377:	f7 f6                	div    %esi
 379:	89 df                	mov    %ebx,%edi
 37b:	83 c3 01             	add    $0x1,%ebx
 37e:	0f b6 92 e4 06 00 00 	movzbl 0x6e4(%edx),%edx
 385:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 389:	89 ca                	mov    %ecx,%edx
 38b:	89 c1                	mov    %eax,%ecx
 38d:	39 d6                	cmp    %edx,%esi
 38f:	76 df                	jbe    370 <printint+0x2e>
  if(neg)
 391:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 395:	74 31                	je     3c8 <printint+0x86>
    buf[i++] = '-';
 397:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 39c:	8d 5f 02             	lea    0x2(%edi),%ebx
 39f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3a2:	eb 17                	jmp    3bb <printint+0x79>
    x = xx;
 3a4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3a6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3ad:	eb bc                	jmp    36b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3af:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3b4:	89 f0                	mov    %esi,%eax
 3b6:	e8 6d ff ff ff       	call   328 <putc>
  while(--i >= 0)
 3bb:	83 eb 01             	sub    $0x1,%ebx
 3be:	79 ef                	jns    3af <printint+0x6d>
}
 3c0:	83 c4 2c             	add    $0x2c,%esp
 3c3:	5b                   	pop    %ebx
 3c4:	5e                   	pop    %esi
 3c5:	5f                   	pop    %edi
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    
 3c8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3cb:	eb ee                	jmp    3bb <printint+0x79>

000003cd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	57                   	push   %edi
 3d1:	56                   	push   %esi
 3d2:	53                   	push   %ebx
 3d3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3d6:	8d 45 10             	lea    0x10(%ebp),%eax
 3d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3dc:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3e1:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e6:	eb 14                	jmp    3fc <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3e8:	89 fa                	mov    %edi,%edx
 3ea:	8b 45 08             	mov    0x8(%ebp),%eax
 3ed:	e8 36 ff ff ff       	call   328 <putc>
 3f2:	eb 05                	jmp    3f9 <printf+0x2c>
      }
    } else if(state == '%'){
 3f4:	83 fe 25             	cmp    $0x25,%esi
 3f7:	74 25                	je     41e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3f9:	83 c3 01             	add    $0x1,%ebx
 3fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ff:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 403:	84 c0                	test   %al,%al
 405:	0f 84 20 01 00 00    	je     52b <printf+0x15e>
    c = fmt[i] & 0xff;
 40b:	0f be f8             	movsbl %al,%edi
 40e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 411:	85 f6                	test   %esi,%esi
 413:	75 df                	jne    3f4 <printf+0x27>
      if(c == '%'){
 415:	83 f8 25             	cmp    $0x25,%eax
 418:	75 ce                	jne    3e8 <printf+0x1b>
        state = '%';
 41a:	89 c6                	mov    %eax,%esi
 41c:	eb db                	jmp    3f9 <printf+0x2c>
      if(c == 'd'){
 41e:	83 f8 25             	cmp    $0x25,%eax
 421:	0f 84 cf 00 00 00    	je     4f6 <printf+0x129>
 427:	0f 8c dd 00 00 00    	jl     50a <printf+0x13d>
 42d:	83 f8 78             	cmp    $0x78,%eax
 430:	0f 8f d4 00 00 00    	jg     50a <printf+0x13d>
 436:	83 f8 63             	cmp    $0x63,%eax
 439:	0f 8c cb 00 00 00    	jl     50a <printf+0x13d>
 43f:	83 e8 63             	sub    $0x63,%eax
 442:	83 f8 15             	cmp    $0x15,%eax
 445:	0f 87 bf 00 00 00    	ja     50a <printf+0x13d>
 44b:	ff 24 85 8c 06 00 00 	jmp    *0x68c(,%eax,4)
        printint(fd, *ap, 10, 1);
 452:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 455:	8b 17                	mov    (%edi),%edx
 457:	83 ec 0c             	sub    $0xc,%esp
 45a:	6a 01                	push   $0x1
 45c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	e8 d9 fe ff ff       	call   342 <printint>
        ap++;
 469:	83 c7 04             	add    $0x4,%edi
 46c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 46f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 472:	be 00 00 00 00       	mov    $0x0,%esi
 477:	eb 80                	jmp    3f9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 479:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 47c:	8b 17                	mov    (%edi),%edx
 47e:	83 ec 0c             	sub    $0xc,%esp
 481:	6a 00                	push   $0x0
 483:	b9 10 00 00 00       	mov    $0x10,%ecx
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	e8 b2 fe ff ff       	call   342 <printint>
        ap++;
 490:	83 c7 04             	add    $0x4,%edi
 493:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 496:	83 c4 10             	add    $0x10,%esp
      state = 0;
 499:	be 00 00 00 00       	mov    $0x0,%esi
 49e:	e9 56 ff ff ff       	jmp    3f9 <printf+0x2c>
        s = (char*)*ap;
 4a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a6:	8b 30                	mov    (%eax),%esi
        ap++;
 4a8:	83 c0 04             	add    $0x4,%eax
 4ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4ae:	85 f6                	test   %esi,%esi
 4b0:	75 15                	jne    4c7 <printf+0xfa>
          s = "(null)";
 4b2:	be 85 06 00 00       	mov    $0x685,%esi
 4b7:	eb 0e                	jmp    4c7 <printf+0xfa>
          putc(fd, *s);
 4b9:	0f be d2             	movsbl %dl,%edx
 4bc:	8b 45 08             	mov    0x8(%ebp),%eax
 4bf:	e8 64 fe ff ff       	call   328 <putc>
          s++;
 4c4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4c7:	0f b6 16             	movzbl (%esi),%edx
 4ca:	84 d2                	test   %dl,%dl
 4cc:	75 eb                	jne    4b9 <printf+0xec>
      state = 0;
 4ce:	be 00 00 00 00       	mov    $0x0,%esi
 4d3:	e9 21 ff ff ff       	jmp    3f9 <printf+0x2c>
        putc(fd, *ap);
 4d8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4db:	0f be 17             	movsbl (%edi),%edx
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
 4e1:	e8 42 fe ff ff       	call   328 <putc>
        ap++;
 4e6:	83 c7 04             	add    $0x4,%edi
 4e9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4ec:	be 00 00 00 00       	mov    $0x0,%esi
 4f1:	e9 03 ff ff ff       	jmp    3f9 <printf+0x2c>
        putc(fd, c);
 4f6:	89 fa                	mov    %edi,%edx
 4f8:	8b 45 08             	mov    0x8(%ebp),%eax
 4fb:	e8 28 fe ff ff       	call   328 <putc>
      state = 0;
 500:	be 00 00 00 00       	mov    $0x0,%esi
 505:	e9 ef fe ff ff       	jmp    3f9 <printf+0x2c>
        putc(fd, '%');
 50a:	ba 25 00 00 00       	mov    $0x25,%edx
 50f:	8b 45 08             	mov    0x8(%ebp),%eax
 512:	e8 11 fe ff ff       	call   328 <putc>
        putc(fd, c);
 517:	89 fa                	mov    %edi,%edx
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	e8 07 fe ff ff       	call   328 <putc>
      state = 0;
 521:	be 00 00 00 00       	mov    $0x0,%esi
 526:	e9 ce fe ff ff       	jmp    3f9 <printf+0x2c>
    }
  }
}
 52b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 52e:	5b                   	pop    %ebx
 52f:	5e                   	pop    %esi
 530:	5f                   	pop    %edi
 531:	5d                   	pop    %ebp
 532:	c3                   	ret    

00000533 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 533:	55                   	push   %ebp
 534:	89 e5                	mov    %esp,%ebp
 536:	57                   	push   %edi
 537:	56                   	push   %esi
 538:	53                   	push   %ebx
 539:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 53c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 53f:	a1 38 0a 00 00       	mov    0xa38,%eax
 544:	eb 02                	jmp    548 <free+0x15>
 546:	89 d0                	mov    %edx,%eax
 548:	39 c8                	cmp    %ecx,%eax
 54a:	73 04                	jae    550 <free+0x1d>
 54c:	39 08                	cmp    %ecx,(%eax)
 54e:	77 12                	ja     562 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 550:	8b 10                	mov    (%eax),%edx
 552:	39 c2                	cmp    %eax,%edx
 554:	77 f0                	ja     546 <free+0x13>
 556:	39 c8                	cmp    %ecx,%eax
 558:	72 08                	jb     562 <free+0x2f>
 55a:	39 ca                	cmp    %ecx,%edx
 55c:	77 04                	ja     562 <free+0x2f>
 55e:	89 d0                	mov    %edx,%eax
 560:	eb e6                	jmp    548 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 562:	8b 73 fc             	mov    -0x4(%ebx),%esi
 565:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 568:	8b 10                	mov    (%eax),%edx
 56a:	39 d7                	cmp    %edx,%edi
 56c:	74 19                	je     587 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 56e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 571:	8b 50 04             	mov    0x4(%eax),%edx
 574:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 577:	39 ce                	cmp    %ecx,%esi
 579:	74 1b                	je     596 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 57b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 57d:	a3 38 0a 00 00       	mov    %eax,0xa38
}
 582:	5b                   	pop    %ebx
 583:	5e                   	pop    %esi
 584:	5f                   	pop    %edi
 585:	5d                   	pop    %ebp
 586:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 587:	03 72 04             	add    0x4(%edx),%esi
 58a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 58d:	8b 10                	mov    (%eax),%edx
 58f:	8b 12                	mov    (%edx),%edx
 591:	89 53 f8             	mov    %edx,-0x8(%ebx)
 594:	eb db                	jmp    571 <free+0x3e>
    p->s.size += bp->s.size;
 596:	03 53 fc             	add    -0x4(%ebx),%edx
 599:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 59c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 59f:	89 10                	mov    %edx,(%eax)
 5a1:	eb da                	jmp    57d <free+0x4a>

000005a3 <morecore>:

static Header*
morecore(uint nu)
{
 5a3:	55                   	push   %ebp
 5a4:	89 e5                	mov    %esp,%ebp
 5a6:	53                   	push   %ebx
 5a7:	83 ec 04             	sub    $0x4,%esp
 5aa:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5ac:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5b1:	77 05                	ja     5b8 <morecore+0x15>
    nu = 4096;
 5b3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5b8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5bf:	83 ec 0c             	sub    $0xc,%esp
 5c2:	50                   	push   %eax
 5c3:	e8 38 fd ff ff       	call   300 <sbrk>
  if(p == (char*)-1)
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ce:	74 1c                	je     5ec <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5d3:	83 c0 08             	add    $0x8,%eax
 5d6:	83 ec 0c             	sub    $0xc,%esp
 5d9:	50                   	push   %eax
 5da:	e8 54 ff ff ff       	call   533 <free>
  return freep;
 5df:	a1 38 0a 00 00       	mov    0xa38,%eax
 5e4:	83 c4 10             	add    $0x10,%esp
}
 5e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ea:	c9                   	leave  
 5eb:	c3                   	ret    
    return 0;
 5ec:	b8 00 00 00 00       	mov    $0x0,%eax
 5f1:	eb f4                	jmp    5e7 <morecore+0x44>

000005f3 <malloc>:

void*
malloc(uint nbytes)
{
 5f3:	55                   	push   %ebp
 5f4:	89 e5                	mov    %esp,%ebp
 5f6:	53                   	push   %ebx
 5f7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	8d 58 07             	lea    0x7(%eax),%ebx
 600:	c1 eb 03             	shr    $0x3,%ebx
 603:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 606:	8b 0d 38 0a 00 00    	mov    0xa38,%ecx
 60c:	85 c9                	test   %ecx,%ecx
 60e:	74 04                	je     614 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 610:	8b 01                	mov    (%ecx),%eax
 612:	eb 4a                	jmp    65e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 614:	c7 05 38 0a 00 00 3c 	movl   $0xa3c,0xa38
 61b:	0a 00 00 
 61e:	c7 05 3c 0a 00 00 3c 	movl   $0xa3c,0xa3c
 625:	0a 00 00 
    base.s.size = 0;
 628:	c7 05 40 0a 00 00 00 	movl   $0x0,0xa40
 62f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 632:	b9 3c 0a 00 00       	mov    $0xa3c,%ecx
 637:	eb d7                	jmp    610 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 639:	74 19                	je     654 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 63b:	29 da                	sub    %ebx,%edx
 63d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 640:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 643:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 646:	89 0d 38 0a 00 00    	mov    %ecx,0xa38
      return (void*)(p + 1);
 64c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 64f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 652:	c9                   	leave  
 653:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 654:	8b 10                	mov    (%eax),%edx
 656:	89 11                	mov    %edx,(%ecx)
 658:	eb ec                	jmp    646 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 65a:	89 c1                	mov    %eax,%ecx
 65c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 65e:	8b 50 04             	mov    0x4(%eax),%edx
 661:	39 da                	cmp    %ebx,%edx
 663:	73 d4                	jae    639 <malloc+0x46>
    if(p == freep)
 665:	39 05 38 0a 00 00    	cmp    %eax,0xa38
 66b:	75 ed                	jne    65a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 66d:	89 d8                	mov    %ebx,%eax
 66f:	e8 2f ff ff ff       	call   5a3 <morecore>
 674:	85 c0                	test   %eax,%eax
 676:	75 e2                	jne    65a <malloc+0x67>
 678:	eb d5                	jmp    64f <malloc+0x5c>
