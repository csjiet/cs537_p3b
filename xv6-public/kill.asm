
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
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

  if(argc < 2){
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 07                	jle    25 <main+0x25>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 2d                	jmp    52 <main+0x52>
    printf(2, "usage: kill pid...\n");
  25:	83 ec 08             	sub    $0x8,%esp
  28:	68 84 06 00 00       	push   $0x684
  2d:	6a 02                	push   $0x2
  2f:	e8 a3 03 00 00       	call   3d7 <printf>
    exit();
  34:	e8 49 02 00 00       	call   282 <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 52 01 00 00       	call   196 <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 66 02 00 00       	call   2b2 <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 27 02 00 00       	call   282 <exit>

0000005b <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  5b:	55                   	push   %ebp
  5c:	89 e5                	mov    %esp,%ebp
  5e:	56                   	push   %esi
  5f:	53                   	push   %ebx
  60:	8b 75 08             	mov    0x8(%ebp),%esi
  63:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  66:	89 f0                	mov    %esi,%eax
  68:	89 d1                	mov    %edx,%ecx
  6a:	83 c2 01             	add    $0x1,%edx
  6d:	89 c3                	mov    %eax,%ebx
  6f:	83 c0 01             	add    $0x1,%eax
  72:	0f b6 09             	movzbl (%ecx),%ecx
  75:	88 0b                	mov    %cl,(%ebx)
  77:	84 c9                	test   %cl,%cl
  79:	75 ed                	jne    68 <strcpy+0xd>
    ;
  return os;
}
  7b:	89 f0                	mov    %esi,%eax
  7d:	5b                   	pop    %ebx
  7e:	5e                   	pop    %esi
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    

00000081 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  81:	55                   	push   %ebp
  82:	89 e5                	mov    %esp,%ebp
  84:	8b 4d 08             	mov    0x8(%ebp),%ecx
  87:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8a:	eb 06                	jmp    92 <strcmp+0x11>
    p++, q++;
  8c:	83 c1 01             	add    $0x1,%ecx
  8f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  92:	0f b6 01             	movzbl (%ecx),%eax
  95:	84 c0                	test   %al,%al
  97:	74 04                	je     9d <strcmp+0x1c>
  99:	3a 02                	cmp    (%edx),%al
  9b:	74 ef                	je     8c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  9d:	0f b6 c0             	movzbl %al,%eax
  a0:	0f b6 12             	movzbl (%edx),%edx
  a3:	29 d0                	sub    %edx,%eax
}
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    

000000a7 <strlen>:

uint
strlen(const char *s)
{
  a7:	55                   	push   %ebp
  a8:	89 e5                	mov    %esp,%ebp
  aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  ad:	b8 00 00 00 00       	mov    $0x0,%eax
  b2:	eb 03                	jmp    b7 <strlen+0x10>
  b4:	83 c0 01             	add    $0x1,%eax
  b7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bb:	75 f7                	jne    b4 <strlen+0xd>
    ;
  return n;
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <memset>:

void*
memset(void *dst, int c, uint n)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	57                   	push   %edi
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c6:	89 d7                	mov    %edx,%edi
  c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ce:	fc                   	cld    
  cf:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d1:	89 d0                	mov    %edx,%eax
  d3:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d6:	c9                   	leave  
  d7:	c3                   	ret    

000000d8 <strchr>:

char*
strchr(const char *s, char c)
{
  d8:	55                   	push   %ebp
  d9:	89 e5                	mov    %esp,%ebp
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  e2:	eb 03                	jmp    e7 <strchr+0xf>
  e4:	83 c0 01             	add    $0x1,%eax
  e7:	0f b6 10             	movzbl (%eax),%edx
  ea:	84 d2                	test   %dl,%dl
  ec:	74 06                	je     f4 <strchr+0x1c>
    if(*s == c)
  ee:	38 ca                	cmp    %cl,%dl
  f0:	75 f2                	jne    e4 <strchr+0xc>
  f2:	eb 05                	jmp    f9 <strchr+0x21>
      return (char*)s;
  return 0;
  f4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <gets>:

char*
gets(char *buf, int max)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	57                   	push   %edi
  ff:	56                   	push   %esi
 100:	53                   	push   %ebx
 101:	83 ec 1c             	sub    $0x1c,%esp
 104:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 107:	bb 00 00 00 00       	mov    $0x0,%ebx
 10c:	89 de                	mov    %ebx,%esi
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 114:	7d 2e                	jge    144 <gets+0x49>
    cc = read(0, &c, 1);
 116:	83 ec 04             	sub    $0x4,%esp
 119:	6a 01                	push   $0x1
 11b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11e:	50                   	push   %eax
 11f:	6a 00                	push   $0x0
 121:	e8 74 01 00 00       	call   29a <read>
    if(cc < 1)
 126:	83 c4 10             	add    $0x10,%esp
 129:	85 c0                	test   %eax,%eax
 12b:	7e 17                	jle    144 <gets+0x49>
      break;
    buf[i++] = c;
 12d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 131:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 134:	3c 0a                	cmp    $0xa,%al
 136:	0f 94 c2             	sete   %dl
 139:	3c 0d                	cmp    $0xd,%al
 13b:	0f 94 c0             	sete   %al
 13e:	08 c2                	or     %al,%dl
 140:	74 ca                	je     10c <gets+0x11>
    buf[i++] = c;
 142:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 144:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 148:	89 f8                	mov    %edi,%eax
 14a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    

00000152 <stat>:

int
stat(const char *n, struct stat *st)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	56                   	push   %esi
 156:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 157:	83 ec 08             	sub    $0x8,%esp
 15a:	6a 00                	push   $0x0
 15c:	ff 75 08             	push   0x8(%ebp)
 15f:	e8 5e 01 00 00       	call   2c2 <open>
  if(fd < 0)
 164:	83 c4 10             	add    $0x10,%esp
 167:	85 c0                	test   %eax,%eax
 169:	78 24                	js     18f <stat+0x3d>
 16b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 16d:	83 ec 08             	sub    $0x8,%esp
 170:	ff 75 0c             	push   0xc(%ebp)
 173:	50                   	push   %eax
 174:	e8 61 01 00 00       	call   2da <fstat>
 179:	89 c6                	mov    %eax,%esi
  close(fd);
 17b:	89 1c 24             	mov    %ebx,(%esp)
 17e:	e8 27 01 00 00       	call   2aa <close>
  return r;
 183:	83 c4 10             	add    $0x10,%esp
}
 186:	89 f0                	mov    %esi,%eax
 188:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18b:	5b                   	pop    %ebx
 18c:	5e                   	pop    %esi
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
    return -1;
 18f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 194:	eb f0                	jmp    186 <stat+0x34>

00000196 <atoi>:

int
atoi(const char *s)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 19d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1a2:	eb 10                	jmp    1b4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1a4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1aa:	83 c1 01             	add    $0x1,%ecx
 1ad:	0f be c0             	movsbl %al,%eax
 1b0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1b4:	0f b6 01             	movzbl (%ecx),%eax
 1b7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1ba:	80 fb 09             	cmp    $0x9,%bl
 1bd:	76 e5                	jbe    1a4 <atoi+0xe>
  return n;
}
 1bf:	89 d0                	mov    %edx,%eax
 1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c4:	c9                   	leave  
 1c5:	c3                   	ret    

000001c6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	56                   	push   %esi
 1ca:	53                   	push   %ebx
 1cb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1d4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1d6:	eb 0d                	jmp    1e5 <memmove+0x1f>
    *dst++ = *src++;
 1d8:	0f b6 01             	movzbl (%ecx),%eax
 1db:	88 02                	mov    %al,(%edx)
 1dd:	8d 49 01             	lea    0x1(%ecx),%ecx
 1e0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1e3:	89 d8                	mov    %ebx,%eax
 1e5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7f ec                	jg     1d8 <memmove+0x12>
  return vdst;
}
 1ec:	89 f0                	mov    %esi,%eax
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    

000001f2 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 1f8:	68 00 10 00 00       	push   $0x1000
 1fd:	e8 fb 03 00 00       	call   5fd <malloc>

  return clone(start_routine, arg1, arg2, stack);
 202:	50                   	push   %eax
 203:	ff 75 10             	push   0x10(%ebp)
 206:	ff 75 0c             	push   0xc(%ebp)
 209:	ff 75 08             	push   0x8(%ebp)
 20c:	e8 11 01 00 00       	call   322 <clone>
}
 211:	c9                   	leave  
 212:	c3                   	ret    

00000213 <thread_join>:

int thread_join(){
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	53                   	push   %ebx
 217:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 21a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 21d:	50                   	push   %eax
 21e:	e8 07 01 00 00       	call   32a <join>
  if (x < 0) {
 223:	83 c4 10             	add    $0x10,%esp
 226:	85 c0                	test   %eax,%eax
 228:	78 17                	js     241 <thread_join+0x2e>
 22a:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 22c:	83 ec 0c             	sub    $0xc,%esp
 22f:	ff 75 f4             	push   -0xc(%ebp)
 232:	e8 06 03 00 00       	call   53d <free>
  return x;
 237:	83 c4 10             	add    $0x10,%esp
}
 23a:	89 d8                	mov    %ebx,%eax
 23c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 23f:	c9                   	leave  
 240:	c3                   	ret    
    return -1;
 241:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 246:	eb f2                	jmp    23a <thread_join+0x27>

00000248 <lock_init>:

void lock_init(lock_t *spin){
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 24b:	8b 45 08             	mov    0x8(%ebp),%eax
 24e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 254:	5d                   	pop    %ebp
 255:	c3                   	ret    

00000256 <lock_acquire>:

void lock_acquire(lock_t *spin){
 256:	55                   	push   %ebp
 257:	89 e5                	mov    %esp,%ebp
 259:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 25c:	b8 01 00 00 00       	mov    $0x1,%eax
 261:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 264:	85 c0                	test   %eax,%eax
 266:	75 f4                	jne    25c <lock_acquire+0x6>

}
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    

0000026a <lock_release>:

void lock_release(lock_t *spin){
 26a:	55                   	push   %ebp
 26b:	89 e5                	mov    %esp,%ebp
 26d:	8b 55 08             	mov    0x8(%ebp),%edx
 270:	b8 00 00 00 00       	mov    $0x0,%eax
 275:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    

0000027a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27a:	b8 01 00 00 00       	mov    $0x1,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <exit>:
SYSCALL(exit)
 282:	b8 02 00 00 00       	mov    $0x2,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <wait>:
SYSCALL(wait)
 28a:	b8 03 00 00 00       	mov    $0x3,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <pipe>:
SYSCALL(pipe)
 292:	b8 04 00 00 00       	mov    $0x4,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <read>:
SYSCALL(read)
 29a:	b8 05 00 00 00       	mov    $0x5,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <write>:
SYSCALL(write)
 2a2:	b8 10 00 00 00       	mov    $0x10,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <close>:
SYSCALL(close)
 2aa:	b8 15 00 00 00       	mov    $0x15,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <kill>:
SYSCALL(kill)
 2b2:	b8 06 00 00 00       	mov    $0x6,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <exec>:
SYSCALL(exec)
 2ba:	b8 07 00 00 00       	mov    $0x7,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <open>:
SYSCALL(open)
 2c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <mknod>:
SYSCALL(mknod)
 2ca:	b8 11 00 00 00       	mov    $0x11,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <unlink>:
SYSCALL(unlink)
 2d2:	b8 12 00 00 00       	mov    $0x12,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <fstat>:
SYSCALL(fstat)
 2da:	b8 08 00 00 00       	mov    $0x8,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <link>:
SYSCALL(link)
 2e2:	b8 13 00 00 00       	mov    $0x13,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <mkdir>:
SYSCALL(mkdir)
 2ea:	b8 14 00 00 00       	mov    $0x14,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <chdir>:
SYSCALL(chdir)
 2f2:	b8 09 00 00 00       	mov    $0x9,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <dup>:
SYSCALL(dup)
 2fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <getpid>:
SYSCALL(getpid)
 302:	b8 0b 00 00 00       	mov    $0xb,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <sbrk>:
SYSCALL(sbrk)
 30a:	b8 0c 00 00 00       	mov    $0xc,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <sleep>:
SYSCALL(sleep)
 312:	b8 0d 00 00 00       	mov    $0xd,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <uptime>:
SYSCALL(uptime)
 31a:	b8 0e 00 00 00       	mov    $0xe,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <clone>:
SYSCALL(clone)
 322:	b8 16 00 00 00       	mov    $0x16,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <join>:
 32a:	b8 17 00 00 00       	mov    $0x17,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 1c             	sub    $0x1c,%esp
 338:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 33b:	6a 01                	push   $0x1
 33d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 340:	52                   	push   %edx
 341:	50                   	push   %eax
 342:	e8 5b ff ff ff       	call   2a2 <write>
}
 347:	83 c4 10             	add    $0x10,%esp
 34a:	c9                   	leave  
 34b:	c3                   	ret    

0000034c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 34c:	55                   	push   %ebp
 34d:	89 e5                	mov    %esp,%ebp
 34f:	57                   	push   %edi
 350:	56                   	push   %esi
 351:	53                   	push   %ebx
 352:	83 ec 2c             	sub    $0x2c,%esp
 355:	89 45 d0             	mov    %eax,-0x30(%ebp)
 358:	89 d0                	mov    %edx,%eax
 35a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 35c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 360:	0f 95 c1             	setne  %cl
 363:	c1 ea 1f             	shr    $0x1f,%edx
 366:	84 d1                	test   %dl,%cl
 368:	74 44                	je     3ae <printint+0x62>
    neg = 1;
    x = -xx;
 36a:	f7 d8                	neg    %eax
 36c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 36e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 375:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 37a:	89 c8                	mov    %ecx,%eax
 37c:	ba 00 00 00 00       	mov    $0x0,%edx
 381:	f7 f6                	div    %esi
 383:	89 df                	mov    %ebx,%edi
 385:	83 c3 01             	add    $0x1,%ebx
 388:	0f b6 92 f8 06 00 00 	movzbl 0x6f8(%edx),%edx
 38f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 393:	89 ca                	mov    %ecx,%edx
 395:	89 c1                	mov    %eax,%ecx
 397:	39 d6                	cmp    %edx,%esi
 399:	76 df                	jbe    37a <printint+0x2e>
  if(neg)
 39b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 39f:	74 31                	je     3d2 <printint+0x86>
    buf[i++] = '-';
 3a1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3a6:	8d 5f 02             	lea    0x2(%edi),%ebx
 3a9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ac:	eb 17                	jmp    3c5 <printint+0x79>
    x = xx;
 3ae:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3b7:	eb bc                	jmp    375 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3b9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3be:	89 f0                	mov    %esi,%eax
 3c0:	e8 6d ff ff ff       	call   332 <putc>
  while(--i >= 0)
 3c5:	83 eb 01             	sub    $0x1,%ebx
 3c8:	79 ef                	jns    3b9 <printint+0x6d>
}
 3ca:	83 c4 2c             	add    $0x2c,%esp
 3cd:	5b                   	pop    %ebx
 3ce:	5e                   	pop    %esi
 3cf:	5f                   	pop    %edi
 3d0:	5d                   	pop    %ebp
 3d1:	c3                   	ret    
 3d2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d5:	eb ee                	jmp    3c5 <printint+0x79>

000003d7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3d7:	55                   	push   %ebp
 3d8:	89 e5                	mov    %esp,%ebp
 3da:	57                   	push   %edi
 3db:	56                   	push   %esi
 3dc:	53                   	push   %ebx
 3dd:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3e0:	8d 45 10             	lea    0x10(%ebp),%eax
 3e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3e6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3eb:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f0:	eb 14                	jmp    406 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3f2:	89 fa                	mov    %edi,%edx
 3f4:	8b 45 08             	mov    0x8(%ebp),%eax
 3f7:	e8 36 ff ff ff       	call   332 <putc>
 3fc:	eb 05                	jmp    403 <printf+0x2c>
      }
    } else if(state == '%'){
 3fe:	83 fe 25             	cmp    $0x25,%esi
 401:	74 25                	je     428 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 403:	83 c3 01             	add    $0x1,%ebx
 406:	8b 45 0c             	mov    0xc(%ebp),%eax
 409:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 40d:	84 c0                	test   %al,%al
 40f:	0f 84 20 01 00 00    	je     535 <printf+0x15e>
    c = fmt[i] & 0xff;
 415:	0f be f8             	movsbl %al,%edi
 418:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 41b:	85 f6                	test   %esi,%esi
 41d:	75 df                	jne    3fe <printf+0x27>
      if(c == '%'){
 41f:	83 f8 25             	cmp    $0x25,%eax
 422:	75 ce                	jne    3f2 <printf+0x1b>
        state = '%';
 424:	89 c6                	mov    %eax,%esi
 426:	eb db                	jmp    403 <printf+0x2c>
      if(c == 'd'){
 428:	83 f8 25             	cmp    $0x25,%eax
 42b:	0f 84 cf 00 00 00    	je     500 <printf+0x129>
 431:	0f 8c dd 00 00 00    	jl     514 <printf+0x13d>
 437:	83 f8 78             	cmp    $0x78,%eax
 43a:	0f 8f d4 00 00 00    	jg     514 <printf+0x13d>
 440:	83 f8 63             	cmp    $0x63,%eax
 443:	0f 8c cb 00 00 00    	jl     514 <printf+0x13d>
 449:	83 e8 63             	sub    $0x63,%eax
 44c:	83 f8 15             	cmp    $0x15,%eax
 44f:	0f 87 bf 00 00 00    	ja     514 <printf+0x13d>
 455:	ff 24 85 a0 06 00 00 	jmp    *0x6a0(,%eax,4)
        printint(fd, *ap, 10, 1);
 45c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 45f:	8b 17                	mov    (%edi),%edx
 461:	83 ec 0c             	sub    $0xc,%esp
 464:	6a 01                	push   $0x1
 466:	b9 0a 00 00 00       	mov    $0xa,%ecx
 46b:	8b 45 08             	mov    0x8(%ebp),%eax
 46e:	e8 d9 fe ff ff       	call   34c <printint>
        ap++;
 473:	83 c7 04             	add    $0x4,%edi
 476:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 479:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 47c:	be 00 00 00 00       	mov    $0x0,%esi
 481:	eb 80                	jmp    403 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 483:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 486:	8b 17                	mov    (%edi),%edx
 488:	83 ec 0c             	sub    $0xc,%esp
 48b:	6a 00                	push   $0x0
 48d:	b9 10 00 00 00       	mov    $0x10,%ecx
 492:	8b 45 08             	mov    0x8(%ebp),%eax
 495:	e8 b2 fe ff ff       	call   34c <printint>
        ap++;
 49a:	83 c7 04             	add    $0x4,%edi
 49d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4a3:	be 00 00 00 00       	mov    $0x0,%esi
 4a8:	e9 56 ff ff ff       	jmp    403 <printf+0x2c>
        s = (char*)*ap;
 4ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b0:	8b 30                	mov    (%eax),%esi
        ap++;
 4b2:	83 c0 04             	add    $0x4,%eax
 4b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4b8:	85 f6                	test   %esi,%esi
 4ba:	75 15                	jne    4d1 <printf+0xfa>
          s = "(null)";
 4bc:	be 98 06 00 00       	mov    $0x698,%esi
 4c1:	eb 0e                	jmp    4d1 <printf+0xfa>
          putc(fd, *s);
 4c3:	0f be d2             	movsbl %dl,%edx
 4c6:	8b 45 08             	mov    0x8(%ebp),%eax
 4c9:	e8 64 fe ff ff       	call   332 <putc>
          s++;
 4ce:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4d1:	0f b6 16             	movzbl (%esi),%edx
 4d4:	84 d2                	test   %dl,%dl
 4d6:	75 eb                	jne    4c3 <printf+0xec>
      state = 0;
 4d8:	be 00 00 00 00       	mov    $0x0,%esi
 4dd:	e9 21 ff ff ff       	jmp    403 <printf+0x2c>
        putc(fd, *ap);
 4e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e5:	0f be 17             	movsbl (%edi),%edx
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	e8 42 fe ff ff       	call   332 <putc>
        ap++;
 4f0:	83 c7 04             	add    $0x4,%edi
 4f3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4f6:	be 00 00 00 00       	mov    $0x0,%esi
 4fb:	e9 03 ff ff ff       	jmp    403 <printf+0x2c>
        putc(fd, c);
 500:	89 fa                	mov    %edi,%edx
 502:	8b 45 08             	mov    0x8(%ebp),%eax
 505:	e8 28 fe ff ff       	call   332 <putc>
      state = 0;
 50a:	be 00 00 00 00       	mov    $0x0,%esi
 50f:	e9 ef fe ff ff       	jmp    403 <printf+0x2c>
        putc(fd, '%');
 514:	ba 25 00 00 00       	mov    $0x25,%edx
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	e8 11 fe ff ff       	call   332 <putc>
        putc(fd, c);
 521:	89 fa                	mov    %edi,%edx
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	e8 07 fe ff ff       	call   332 <putc>
      state = 0;
 52b:	be 00 00 00 00       	mov    $0x0,%esi
 530:	e9 ce fe ff ff       	jmp    403 <printf+0x2c>
    }
  }
}
 535:	8d 65 f4             	lea    -0xc(%ebp),%esp
 538:	5b                   	pop    %ebx
 539:	5e                   	pop    %esi
 53a:	5f                   	pop    %edi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    

0000053d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	57                   	push   %edi
 541:	56                   	push   %esi
 542:	53                   	push   %ebx
 543:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 546:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 549:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 54e:	eb 02                	jmp    552 <free+0x15>
 550:	89 d0                	mov    %edx,%eax
 552:	39 c8                	cmp    %ecx,%eax
 554:	73 04                	jae    55a <free+0x1d>
 556:	39 08                	cmp    %ecx,(%eax)
 558:	77 12                	ja     56c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 55a:	8b 10                	mov    (%eax),%edx
 55c:	39 c2                	cmp    %eax,%edx
 55e:	77 f0                	ja     550 <free+0x13>
 560:	39 c8                	cmp    %ecx,%eax
 562:	72 08                	jb     56c <free+0x2f>
 564:	39 ca                	cmp    %ecx,%edx
 566:	77 04                	ja     56c <free+0x2f>
 568:	89 d0                	mov    %edx,%eax
 56a:	eb e6                	jmp    552 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 56c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 56f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 572:	8b 10                	mov    (%eax),%edx
 574:	39 d7                	cmp    %edx,%edi
 576:	74 19                	je     591 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 578:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 57b:	8b 50 04             	mov    0x4(%eax),%edx
 57e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 581:	39 ce                	cmp    %ecx,%esi
 583:	74 1b                	je     5a0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 585:	89 08                	mov    %ecx,(%eax)
  freep = p;
 587:	a3 4c 0a 00 00       	mov    %eax,0xa4c
}
 58c:	5b                   	pop    %ebx
 58d:	5e                   	pop    %esi
 58e:	5f                   	pop    %edi
 58f:	5d                   	pop    %ebp
 590:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 591:	03 72 04             	add    0x4(%edx),%esi
 594:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 597:	8b 10                	mov    (%eax),%edx
 599:	8b 12                	mov    (%edx),%edx
 59b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 59e:	eb db                	jmp    57b <free+0x3e>
    p->s.size += bp->s.size;
 5a0:	03 53 fc             	add    -0x4(%ebx),%edx
 5a3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5a6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5a9:	89 10                	mov    %edx,(%eax)
 5ab:	eb da                	jmp    587 <free+0x4a>

000005ad <morecore>:

static Header*
morecore(uint nu)
{
 5ad:	55                   	push   %ebp
 5ae:	89 e5                	mov    %esp,%ebp
 5b0:	53                   	push   %ebx
 5b1:	83 ec 04             	sub    $0x4,%esp
 5b4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5b6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5bb:	77 05                	ja     5c2 <morecore+0x15>
    nu = 4096;
 5bd:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5c2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5c9:	83 ec 0c             	sub    $0xc,%esp
 5cc:	50                   	push   %eax
 5cd:	e8 38 fd ff ff       	call   30a <sbrk>
  if(p == (char*)-1)
 5d2:	83 c4 10             	add    $0x10,%esp
 5d5:	83 f8 ff             	cmp    $0xffffffff,%eax
 5d8:	74 1c                	je     5f6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5da:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5dd:	83 c0 08             	add    $0x8,%eax
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	50                   	push   %eax
 5e4:	e8 54 ff ff ff       	call   53d <free>
  return freep;
 5e9:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 5ee:	83 c4 10             	add    $0x10,%esp
}
 5f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f4:	c9                   	leave  
 5f5:	c3                   	ret    
    return 0;
 5f6:	b8 00 00 00 00       	mov    $0x0,%eax
 5fb:	eb f4                	jmp    5f1 <morecore+0x44>

000005fd <malloc>:

void*
malloc(uint nbytes)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	53                   	push   %ebx
 601:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 604:	8b 45 08             	mov    0x8(%ebp),%eax
 607:	8d 58 07             	lea    0x7(%eax),%ebx
 60a:	c1 eb 03             	shr    $0x3,%ebx
 60d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 610:	8b 0d 4c 0a 00 00    	mov    0xa4c,%ecx
 616:	85 c9                	test   %ecx,%ecx
 618:	74 04                	je     61e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 61a:	8b 01                	mov    (%ecx),%eax
 61c:	eb 4a                	jmp    668 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 61e:	c7 05 4c 0a 00 00 50 	movl   $0xa50,0xa4c
 625:	0a 00 00 
 628:	c7 05 50 0a 00 00 50 	movl   $0xa50,0xa50
 62f:	0a 00 00 
    base.s.size = 0;
 632:	c7 05 54 0a 00 00 00 	movl   $0x0,0xa54
 639:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 63c:	b9 50 0a 00 00       	mov    $0xa50,%ecx
 641:	eb d7                	jmp    61a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 643:	74 19                	je     65e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 645:	29 da                	sub    %ebx,%edx
 647:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 64a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 64d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 650:	89 0d 4c 0a 00 00    	mov    %ecx,0xa4c
      return (void*)(p + 1);
 656:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 659:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65c:	c9                   	leave  
 65d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 65e:	8b 10                	mov    (%eax),%edx
 660:	89 11                	mov    %edx,(%ecx)
 662:	eb ec                	jmp    650 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 664:	89 c1                	mov    %eax,%ecx
 666:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 668:	8b 50 04             	mov    0x4(%eax),%edx
 66b:	39 da                	cmp    %ebx,%edx
 66d:	73 d4                	jae    643 <malloc+0x46>
    if(p == freep)
 66f:	39 05 4c 0a 00 00    	cmp    %eax,0xa4c
 675:	75 ed                	jne    664 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 677:	89 d8                	mov    %ebx,%eax
 679:	e8 2f ff ff ff       	call   5ad <morecore>
 67e:	85 c0                	test   %eax,%eax
 680:	75 e2                	jne    664 <malloc+0x67>
 682:	eb d5                	jmp    659 <malloc+0x5c>
