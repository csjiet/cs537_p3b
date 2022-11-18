
_rm:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: rm files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 9c 06 00 00       	push   $0x69c
  30:	6a 02                	push   $0x2
  32:	e8 b8 03 00 00       	call   3ef <printf>
    exit();
  37:	e8 5e 02 00 00       	call   29a <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(unlink(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 97 02 00 00       	call   2ea <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 b0 06 00 00       	push   $0x6b0
  64:	6a 02                	push   $0x2
  66:	e8 84 03 00 00       	call   3ef <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 27 02 00 00       	call   29a <exit>

00000073 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	56                   	push   %esi
  77:	53                   	push   %ebx
  78:	8b 75 08             	mov    0x8(%ebp),%esi
  7b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7e:	89 f0                	mov    %esi,%eax
  80:	89 d1                	mov    %edx,%ecx
  82:	83 c2 01             	add    $0x1,%edx
  85:	89 c3                	mov    %eax,%ebx
  87:	83 c0 01             	add    $0x1,%eax
  8a:	0f b6 09             	movzbl (%ecx),%ecx
  8d:	88 0b                	mov    %cl,(%ebx)
  8f:	84 c9                	test   %cl,%cl
  91:	75 ed                	jne    80 <strcpy+0xd>
    ;
  return os;
}
  93:	89 f0                	mov    %esi,%eax
  95:	5b                   	pop    %ebx
  96:	5e                   	pop    %esi
  97:	5d                   	pop    %ebp
  98:	c3                   	ret    

00000099 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  99:	55                   	push   %ebp
  9a:	89 e5                	mov    %esp,%ebp
  9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  a2:	eb 06                	jmp    aa <strcmp+0x11>
    p++, q++;
  a4:	83 c1 01             	add    $0x1,%ecx
  a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  aa:	0f b6 01             	movzbl (%ecx),%eax
  ad:	84 c0                	test   %al,%al
  af:	74 04                	je     b5 <strcmp+0x1c>
  b1:	3a 02                	cmp    (%edx),%al
  b3:	74 ef                	je     a4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  b5:	0f b6 c0             	movzbl %al,%eax
  b8:	0f b6 12             	movzbl (%edx),%edx
  bb:	29 d0                	sub    %edx,%eax
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <strlen>:

uint
strlen(const char *s)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  c5:	b8 00 00 00 00       	mov    $0x0,%eax
  ca:	eb 03                	jmp    cf <strlen+0x10>
  cc:	83 c0 01             	add    $0x1,%eax
  cf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  d3:	75 f7                	jne    cc <strlen+0xd>
    ;
  return n;
}
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    

000000d7 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d7:	55                   	push   %ebp
  d8:	89 e5                	mov    %esp,%ebp
  da:	57                   	push   %edi
  db:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  de:	89 d7                	mov    %edx,%edi
  e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
  e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  e6:	fc                   	cld    
  e7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e9:	89 d0                	mov    %edx,%eax
  eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  ee:	c9                   	leave  
  ef:	c3                   	ret    

000000f0 <strchr>:

char*
strchr(const char *s, char c)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  fa:	eb 03                	jmp    ff <strchr+0xf>
  fc:	83 c0 01             	add    $0x1,%eax
  ff:	0f b6 10             	movzbl (%eax),%edx
 102:	84 d2                	test   %dl,%dl
 104:	74 06                	je     10c <strchr+0x1c>
    if(*s == c)
 106:	38 ca                	cmp    %cl,%dl
 108:	75 f2                	jne    fc <strchr+0xc>
 10a:	eb 05                	jmp    111 <strchr+0x21>
      return (char*)s;
  return 0;
 10c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    

00000113 <gets>:

char*
gets(char *buf, int max)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	56                   	push   %esi
 118:	53                   	push   %ebx
 119:	83 ec 1c             	sub    $0x1c,%esp
 11c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11f:	bb 00 00 00 00       	mov    $0x0,%ebx
 124:	89 de                	mov    %ebx,%esi
 126:	83 c3 01             	add    $0x1,%ebx
 129:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12c:	7d 2e                	jge    15c <gets+0x49>
    cc = read(0, &c, 1);
 12e:	83 ec 04             	sub    $0x4,%esp
 131:	6a 01                	push   $0x1
 133:	8d 45 e7             	lea    -0x19(%ebp),%eax
 136:	50                   	push   %eax
 137:	6a 00                	push   $0x0
 139:	e8 74 01 00 00       	call   2b2 <read>
    if(cc < 1)
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	7e 17                	jle    15c <gets+0x49>
      break;
    buf[i++] = c;
 145:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 149:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 14c:	3c 0a                	cmp    $0xa,%al
 14e:	0f 94 c2             	sete   %dl
 151:	3c 0d                	cmp    $0xd,%al
 153:	0f 94 c0             	sete   %al
 156:	08 c2                	or     %al,%dl
 158:	74 ca                	je     124 <gets+0x11>
    buf[i++] = c;
 15a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 160:	89 f8                	mov    %edi,%eax
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    

0000016a <stat>:

int
stat(const char *n, struct stat *st)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	56                   	push   %esi
 16e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	6a 00                	push   $0x0
 174:	ff 75 08             	push   0x8(%ebp)
 177:	e8 5e 01 00 00       	call   2da <open>
  if(fd < 0)
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	85 c0                	test   %eax,%eax
 181:	78 24                	js     1a7 <stat+0x3d>
 183:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 185:	83 ec 08             	sub    $0x8,%esp
 188:	ff 75 0c             	push   0xc(%ebp)
 18b:	50                   	push   %eax
 18c:	e8 61 01 00 00       	call   2f2 <fstat>
 191:	89 c6                	mov    %eax,%esi
  close(fd);
 193:	89 1c 24             	mov    %ebx,(%esp)
 196:	e8 27 01 00 00       	call   2c2 <close>
  return r;
 19b:	83 c4 10             	add    $0x10,%esp
}
 19e:	89 f0                	mov    %esi,%eax
 1a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a3:	5b                   	pop    %ebx
 1a4:	5e                   	pop    %esi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
    return -1;
 1a7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1ac:	eb f0                	jmp    19e <stat+0x34>

000001ae <atoi>:

int
atoi(const char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	53                   	push   %ebx
 1b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1b5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1ba:	eb 10                	jmp    1cc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1bc:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1bf:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1c2:	83 c1 01             	add    $0x1,%ecx
 1c5:	0f be c0             	movsbl %al,%eax
 1c8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1cc:	0f b6 01             	movzbl (%ecx),%eax
 1cf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1d2:	80 fb 09             	cmp    $0x9,%bl
 1d5:	76 e5                	jbe    1bc <atoi+0xe>
  return n;
}
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1dc:	c9                   	leave  
 1dd:	c3                   	ret    

000001de <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	56                   	push   %esi
 1e2:	53                   	push   %ebx
 1e3:	8b 75 08             	mov    0x8(%ebp),%esi
 1e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1e9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ec:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1ee:	eb 0d                	jmp    1fd <memmove+0x1f>
    *dst++ = *src++;
 1f0:	0f b6 01             	movzbl (%ecx),%eax
 1f3:	88 02                	mov    %al,(%edx)
 1f5:	8d 49 01             	lea    0x1(%ecx),%ecx
 1f8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1fb:	89 d8                	mov    %ebx,%eax
 1fd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 200:	85 c0                	test   %eax,%eax
 202:	7f ec                	jg     1f0 <memmove+0x12>
  return vdst;
}
 204:	89 f0                	mov    %esi,%eax
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5d                   	pop    %ebp
 209:	c3                   	ret    

0000020a <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 20a:	55                   	push   %ebp
 20b:	89 e5                	mov    %esp,%ebp
 20d:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 210:	68 00 10 00 00       	push   $0x1000
 215:	e8 fb 03 00 00       	call   615 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 21a:	50                   	push   %eax
 21b:	ff 75 10             	push   0x10(%ebp)
 21e:	ff 75 0c             	push   0xc(%ebp)
 221:	ff 75 08             	push   0x8(%ebp)
 224:	e8 11 01 00 00       	call   33a <clone>
}
 229:	c9                   	leave  
 22a:	c3                   	ret    

0000022b <thread_join>:

int thread_join(){
 22b:	55                   	push   %ebp
 22c:	89 e5                	mov    %esp,%ebp
 22e:	53                   	push   %ebx
 22f:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 232:	8d 45 f4             	lea    -0xc(%ebp),%eax
 235:	50                   	push   %eax
 236:	e8 07 01 00 00       	call   342 <join>
  if (x < 0) {
 23b:	83 c4 10             	add    $0x10,%esp
 23e:	85 c0                	test   %eax,%eax
 240:	78 17                	js     259 <thread_join+0x2e>
 242:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 244:	83 ec 0c             	sub    $0xc,%esp
 247:	ff 75 f4             	push   -0xc(%ebp)
 24a:	e8 06 03 00 00       	call   555 <free>
  return x;
 24f:	83 c4 10             	add    $0x10,%esp
}
 252:	89 d8                	mov    %ebx,%eax
 254:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 257:	c9                   	leave  
 258:	c3                   	ret    
    return -1;
 259:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 25e:	eb f2                	jmp    252 <thread_join+0x27>

00000260 <lock_init>:

void lock_init(lock_t *spin){
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 26c:	5d                   	pop    %ebp
 26d:	c3                   	ret    

0000026e <lock_acquire>:

void lock_acquire(lock_t *spin){
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 274:	b8 01 00 00 00       	mov    $0x1,%eax
 279:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 27c:	85 c0                	test   %eax,%eax
 27e:	75 f4                	jne    274 <lock_acquire+0x6>

}
 280:	5d                   	pop    %ebp
 281:	c3                   	ret    

00000282 <lock_release>:

void lock_release(lock_t *spin){
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	8b 55 08             	mov    0x8(%ebp),%edx
 288:	b8 00 00 00 00       	mov    $0x0,%eax
 28d:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 290:	5d                   	pop    %ebp
 291:	c3                   	ret    

00000292 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 292:	b8 01 00 00 00       	mov    $0x1,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <exit>:
SYSCALL(exit)
 29a:	b8 02 00 00 00       	mov    $0x2,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <wait>:
SYSCALL(wait)
 2a2:	b8 03 00 00 00       	mov    $0x3,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <pipe>:
SYSCALL(pipe)
 2aa:	b8 04 00 00 00       	mov    $0x4,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <read>:
SYSCALL(read)
 2b2:	b8 05 00 00 00       	mov    $0x5,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <write>:
SYSCALL(write)
 2ba:	b8 10 00 00 00       	mov    $0x10,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <close>:
SYSCALL(close)
 2c2:	b8 15 00 00 00       	mov    $0x15,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <kill>:
SYSCALL(kill)
 2ca:	b8 06 00 00 00       	mov    $0x6,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <exec>:
SYSCALL(exec)
 2d2:	b8 07 00 00 00       	mov    $0x7,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <open>:
SYSCALL(open)
 2da:	b8 0f 00 00 00       	mov    $0xf,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <mknod>:
SYSCALL(mknod)
 2e2:	b8 11 00 00 00       	mov    $0x11,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <unlink>:
SYSCALL(unlink)
 2ea:	b8 12 00 00 00       	mov    $0x12,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <fstat>:
SYSCALL(fstat)
 2f2:	b8 08 00 00 00       	mov    $0x8,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <link>:
SYSCALL(link)
 2fa:	b8 13 00 00 00       	mov    $0x13,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <mkdir>:
SYSCALL(mkdir)
 302:	b8 14 00 00 00       	mov    $0x14,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <chdir>:
SYSCALL(chdir)
 30a:	b8 09 00 00 00       	mov    $0x9,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <dup>:
SYSCALL(dup)
 312:	b8 0a 00 00 00       	mov    $0xa,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <getpid>:
SYSCALL(getpid)
 31a:	b8 0b 00 00 00       	mov    $0xb,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <sbrk>:
SYSCALL(sbrk)
 322:	b8 0c 00 00 00       	mov    $0xc,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <sleep>:
SYSCALL(sleep)
 32a:	b8 0d 00 00 00       	mov    $0xd,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <uptime>:
SYSCALL(uptime)
 332:	b8 0e 00 00 00       	mov    $0xe,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <clone>:
SYSCALL(clone)
 33a:	b8 16 00 00 00       	mov    $0x16,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <join>:
 342:	b8 17 00 00 00       	mov    $0x17,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	83 ec 1c             	sub    $0x1c,%esp
 350:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 353:	6a 01                	push   $0x1
 355:	8d 55 f4             	lea    -0xc(%ebp),%edx
 358:	52                   	push   %edx
 359:	50                   	push   %eax
 35a:	e8 5b ff ff ff       	call   2ba <write>
}
 35f:	83 c4 10             	add    $0x10,%esp
 362:	c9                   	leave  
 363:	c3                   	ret    

00000364 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	56                   	push   %esi
 369:	53                   	push   %ebx
 36a:	83 ec 2c             	sub    $0x2c,%esp
 36d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 370:	89 d0                	mov    %edx,%eax
 372:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 374:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 378:	0f 95 c1             	setne  %cl
 37b:	c1 ea 1f             	shr    $0x1f,%edx
 37e:	84 d1                	test   %dl,%cl
 380:	74 44                	je     3c6 <printint+0x62>
    neg = 1;
    x = -xx;
 382:	f7 d8                	neg    %eax
 384:	89 c1                	mov    %eax,%ecx
    neg = 1;
 386:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 38d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 392:	89 c8                	mov    %ecx,%eax
 394:	ba 00 00 00 00       	mov    $0x0,%edx
 399:	f7 f6                	div    %esi
 39b:	89 df                	mov    %ebx,%edi
 39d:	83 c3 01             	add    $0x1,%ebx
 3a0:	0f b6 92 28 07 00 00 	movzbl 0x728(%edx),%edx
 3a7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3ab:	89 ca                	mov    %ecx,%edx
 3ad:	89 c1                	mov    %eax,%ecx
 3af:	39 d6                	cmp    %edx,%esi
 3b1:	76 df                	jbe    392 <printint+0x2e>
  if(neg)
 3b3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3b7:	74 31                	je     3ea <printint+0x86>
    buf[i++] = '-';
 3b9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3be:	8d 5f 02             	lea    0x2(%edi),%ebx
 3c1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3c4:	eb 17                	jmp    3dd <printint+0x79>
    x = xx;
 3c6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3c8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3cf:	eb bc                	jmp    38d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3d1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3d6:	89 f0                	mov    %esi,%eax
 3d8:	e8 6d ff ff ff       	call   34a <putc>
  while(--i >= 0)
 3dd:	83 eb 01             	sub    $0x1,%ebx
 3e0:	79 ef                	jns    3d1 <printint+0x6d>
}
 3e2:	83 c4 2c             	add    $0x2c,%esp
 3e5:	5b                   	pop    %ebx
 3e6:	5e                   	pop    %esi
 3e7:	5f                   	pop    %edi
 3e8:	5d                   	pop    %ebp
 3e9:	c3                   	ret    
 3ea:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ed:	eb ee                	jmp    3dd <printint+0x79>

000003ef <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3ef:	55                   	push   %ebp
 3f0:	89 e5                	mov    %esp,%ebp
 3f2:	57                   	push   %edi
 3f3:	56                   	push   %esi
 3f4:	53                   	push   %ebx
 3f5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3f8:	8d 45 10             	lea    0x10(%ebp),%eax
 3fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3fe:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 403:	bb 00 00 00 00       	mov    $0x0,%ebx
 408:	eb 14                	jmp    41e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 40a:	89 fa                	mov    %edi,%edx
 40c:	8b 45 08             	mov    0x8(%ebp),%eax
 40f:	e8 36 ff ff ff       	call   34a <putc>
 414:	eb 05                	jmp    41b <printf+0x2c>
      }
    } else if(state == '%'){
 416:	83 fe 25             	cmp    $0x25,%esi
 419:	74 25                	je     440 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 41b:	83 c3 01             	add    $0x1,%ebx
 41e:	8b 45 0c             	mov    0xc(%ebp),%eax
 421:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 425:	84 c0                	test   %al,%al
 427:	0f 84 20 01 00 00    	je     54d <printf+0x15e>
    c = fmt[i] & 0xff;
 42d:	0f be f8             	movsbl %al,%edi
 430:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 433:	85 f6                	test   %esi,%esi
 435:	75 df                	jne    416 <printf+0x27>
      if(c == '%'){
 437:	83 f8 25             	cmp    $0x25,%eax
 43a:	75 ce                	jne    40a <printf+0x1b>
        state = '%';
 43c:	89 c6                	mov    %eax,%esi
 43e:	eb db                	jmp    41b <printf+0x2c>
      if(c == 'd'){
 440:	83 f8 25             	cmp    $0x25,%eax
 443:	0f 84 cf 00 00 00    	je     518 <printf+0x129>
 449:	0f 8c dd 00 00 00    	jl     52c <printf+0x13d>
 44f:	83 f8 78             	cmp    $0x78,%eax
 452:	0f 8f d4 00 00 00    	jg     52c <printf+0x13d>
 458:	83 f8 63             	cmp    $0x63,%eax
 45b:	0f 8c cb 00 00 00    	jl     52c <printf+0x13d>
 461:	83 e8 63             	sub    $0x63,%eax
 464:	83 f8 15             	cmp    $0x15,%eax
 467:	0f 87 bf 00 00 00    	ja     52c <printf+0x13d>
 46d:	ff 24 85 d0 06 00 00 	jmp    *0x6d0(,%eax,4)
        printint(fd, *ap, 10, 1);
 474:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 477:	8b 17                	mov    (%edi),%edx
 479:	83 ec 0c             	sub    $0xc,%esp
 47c:	6a 01                	push   $0x1
 47e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	e8 d9 fe ff ff       	call   364 <printint>
        ap++;
 48b:	83 c7 04             	add    $0x4,%edi
 48e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 491:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 494:	be 00 00 00 00       	mov    $0x0,%esi
 499:	eb 80                	jmp    41b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 49b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 49e:	8b 17                	mov    (%edi),%edx
 4a0:	83 ec 0c             	sub    $0xc,%esp
 4a3:	6a 00                	push   $0x0
 4a5:	b9 10 00 00 00       	mov    $0x10,%ecx
 4aa:	8b 45 08             	mov    0x8(%ebp),%eax
 4ad:	e8 b2 fe ff ff       	call   364 <printint>
        ap++;
 4b2:	83 c7 04             	add    $0x4,%edi
 4b5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4bb:	be 00 00 00 00       	mov    $0x0,%esi
 4c0:	e9 56 ff ff ff       	jmp    41b <printf+0x2c>
        s = (char*)*ap;
 4c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4c8:	8b 30                	mov    (%eax),%esi
        ap++;
 4ca:	83 c0 04             	add    $0x4,%eax
 4cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4d0:	85 f6                	test   %esi,%esi
 4d2:	75 15                	jne    4e9 <printf+0xfa>
          s = "(null)";
 4d4:	be c9 06 00 00       	mov    $0x6c9,%esi
 4d9:	eb 0e                	jmp    4e9 <printf+0xfa>
          putc(fd, *s);
 4db:	0f be d2             	movsbl %dl,%edx
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
 4e1:	e8 64 fe ff ff       	call   34a <putc>
          s++;
 4e6:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4e9:	0f b6 16             	movzbl (%esi),%edx
 4ec:	84 d2                	test   %dl,%dl
 4ee:	75 eb                	jne    4db <printf+0xec>
      state = 0;
 4f0:	be 00 00 00 00       	mov    $0x0,%esi
 4f5:	e9 21 ff ff ff       	jmp    41b <printf+0x2c>
        putc(fd, *ap);
 4fa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4fd:	0f be 17             	movsbl (%edi),%edx
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	e8 42 fe ff ff       	call   34a <putc>
        ap++;
 508:	83 c7 04             	add    $0x4,%edi
 50b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 50e:	be 00 00 00 00       	mov    $0x0,%esi
 513:	e9 03 ff ff ff       	jmp    41b <printf+0x2c>
        putc(fd, c);
 518:	89 fa                	mov    %edi,%edx
 51a:	8b 45 08             	mov    0x8(%ebp),%eax
 51d:	e8 28 fe ff ff       	call   34a <putc>
      state = 0;
 522:	be 00 00 00 00       	mov    $0x0,%esi
 527:	e9 ef fe ff ff       	jmp    41b <printf+0x2c>
        putc(fd, '%');
 52c:	ba 25 00 00 00       	mov    $0x25,%edx
 531:	8b 45 08             	mov    0x8(%ebp),%eax
 534:	e8 11 fe ff ff       	call   34a <putc>
        putc(fd, c);
 539:	89 fa                	mov    %edi,%edx
 53b:	8b 45 08             	mov    0x8(%ebp),%eax
 53e:	e8 07 fe ff ff       	call   34a <putc>
      state = 0;
 543:	be 00 00 00 00       	mov    $0x0,%esi
 548:	e9 ce fe ff ff       	jmp    41b <printf+0x2c>
    }
  }
}
 54d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 550:	5b                   	pop    %ebx
 551:	5e                   	pop    %esi
 552:	5f                   	pop    %edi
 553:	5d                   	pop    %ebp
 554:	c3                   	ret    

00000555 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	57                   	push   %edi
 559:	56                   	push   %esi
 55a:	53                   	push   %ebx
 55b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 55e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 561:	a1 7c 0a 00 00       	mov    0xa7c,%eax
 566:	eb 02                	jmp    56a <free+0x15>
 568:	89 d0                	mov    %edx,%eax
 56a:	39 c8                	cmp    %ecx,%eax
 56c:	73 04                	jae    572 <free+0x1d>
 56e:	39 08                	cmp    %ecx,(%eax)
 570:	77 12                	ja     584 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 572:	8b 10                	mov    (%eax),%edx
 574:	39 c2                	cmp    %eax,%edx
 576:	77 f0                	ja     568 <free+0x13>
 578:	39 c8                	cmp    %ecx,%eax
 57a:	72 08                	jb     584 <free+0x2f>
 57c:	39 ca                	cmp    %ecx,%edx
 57e:	77 04                	ja     584 <free+0x2f>
 580:	89 d0                	mov    %edx,%eax
 582:	eb e6                	jmp    56a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 584:	8b 73 fc             	mov    -0x4(%ebx),%esi
 587:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 58a:	8b 10                	mov    (%eax),%edx
 58c:	39 d7                	cmp    %edx,%edi
 58e:	74 19                	je     5a9 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 590:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 593:	8b 50 04             	mov    0x4(%eax),%edx
 596:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 599:	39 ce                	cmp    %ecx,%esi
 59b:	74 1b                	je     5b8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 59d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 59f:	a3 7c 0a 00 00       	mov    %eax,0xa7c
}
 5a4:	5b                   	pop    %ebx
 5a5:	5e                   	pop    %esi
 5a6:	5f                   	pop    %edi
 5a7:	5d                   	pop    %ebp
 5a8:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5a9:	03 72 04             	add    0x4(%edx),%esi
 5ac:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5af:	8b 10                	mov    (%eax),%edx
 5b1:	8b 12                	mov    (%edx),%edx
 5b3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5b6:	eb db                	jmp    593 <free+0x3e>
    p->s.size += bp->s.size;
 5b8:	03 53 fc             	add    -0x4(%ebx),%edx
 5bb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5be:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5c1:	89 10                	mov    %edx,(%eax)
 5c3:	eb da                	jmp    59f <free+0x4a>

000005c5 <morecore>:

static Header*
morecore(uint nu)
{
 5c5:	55                   	push   %ebp
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	53                   	push   %ebx
 5c9:	83 ec 04             	sub    $0x4,%esp
 5cc:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5ce:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5d3:	77 05                	ja     5da <morecore+0x15>
    nu = 4096;
 5d5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5da:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5e1:	83 ec 0c             	sub    $0xc,%esp
 5e4:	50                   	push   %eax
 5e5:	e8 38 fd ff ff       	call   322 <sbrk>
  if(p == (char*)-1)
 5ea:	83 c4 10             	add    $0x10,%esp
 5ed:	83 f8 ff             	cmp    $0xffffffff,%eax
 5f0:	74 1c                	je     60e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5f2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5f5:	83 c0 08             	add    $0x8,%eax
 5f8:	83 ec 0c             	sub    $0xc,%esp
 5fb:	50                   	push   %eax
 5fc:	e8 54 ff ff ff       	call   555 <free>
  return freep;
 601:	a1 7c 0a 00 00       	mov    0xa7c,%eax
 606:	83 c4 10             	add    $0x10,%esp
}
 609:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 60c:	c9                   	leave  
 60d:	c3                   	ret    
    return 0;
 60e:	b8 00 00 00 00       	mov    $0x0,%eax
 613:	eb f4                	jmp    609 <morecore+0x44>

00000615 <malloc>:

void*
malloc(uint nbytes)
{
 615:	55                   	push   %ebp
 616:	89 e5                	mov    %esp,%ebp
 618:	53                   	push   %ebx
 619:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 61c:	8b 45 08             	mov    0x8(%ebp),%eax
 61f:	8d 58 07             	lea    0x7(%eax),%ebx
 622:	c1 eb 03             	shr    $0x3,%ebx
 625:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 628:	8b 0d 7c 0a 00 00    	mov    0xa7c,%ecx
 62e:	85 c9                	test   %ecx,%ecx
 630:	74 04                	je     636 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 632:	8b 01                	mov    (%ecx),%eax
 634:	eb 4a                	jmp    680 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 636:	c7 05 7c 0a 00 00 80 	movl   $0xa80,0xa7c
 63d:	0a 00 00 
 640:	c7 05 80 0a 00 00 80 	movl   $0xa80,0xa80
 647:	0a 00 00 
    base.s.size = 0;
 64a:	c7 05 84 0a 00 00 00 	movl   $0x0,0xa84
 651:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 654:	b9 80 0a 00 00       	mov    $0xa80,%ecx
 659:	eb d7                	jmp    632 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 65b:	74 19                	je     676 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 65d:	29 da                	sub    %ebx,%edx
 65f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 662:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 665:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 668:	89 0d 7c 0a 00 00    	mov    %ecx,0xa7c
      return (void*)(p + 1);
 66e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 671:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 674:	c9                   	leave  
 675:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 676:	8b 10                	mov    (%eax),%edx
 678:	89 11                	mov    %edx,(%ecx)
 67a:	eb ec                	jmp    668 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 67c:	89 c1                	mov    %eax,%ecx
 67e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 680:	8b 50 04             	mov    0x4(%eax),%edx
 683:	39 da                	cmp    %ebx,%edx
 685:	73 d4                	jae    65b <malloc+0x46>
    if(p == freep)
 687:	39 05 7c 0a 00 00    	cmp    %eax,0xa7c
 68d:	75 ed                	jne    67c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 68f:	89 d8                	mov    %ebx,%eax
 691:	e8 2f ff ff ff       	call   5c5 <morecore>
 696:	85 c0                	test   %eax,%eax
 698:	75 e2                	jne    67c <malloc+0x67>
 69a:	eb d5                	jmp    671 <malloc+0x5c>
