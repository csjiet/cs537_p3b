
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
  2b:	68 a0 06 00 00       	push   $0x6a0
  30:	6a 02                	push   $0x2
  32:	e8 bb 03 00 00       	call   3f2 <printf>
    exit();
  37:	e8 61 02 00 00       	call   29d <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(unlink(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 9a 02 00 00       	call   2ed <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 b4 06 00 00       	push   $0x6b4
  64:	6a 02                	push   $0x2
  66:	e8 87 03 00 00       	call   3f2 <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 2a 02 00 00       	call   29d <exit>

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
 139:	e8 77 01 00 00       	call   2b5 <read>
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
 177:	e8 61 01 00 00       	call   2dd <open>
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
 18c:	e8 64 01 00 00       	call   2f5 <fstat>
 191:	89 c6                	mov    %eax,%esi
  close(fd);
 193:	89 1c 24             	mov    %ebx,(%esp)
 196:	e8 2a 01 00 00       	call   2c5 <close>
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

  void* stack = malloc(2 * PGSIZE);
 210:	68 00 20 00 00       	push   $0x2000
 215:	e8 fe 03 00 00       	call   618 <malloc>
  if ((uint)stack%PGSIZE){
 21a:	83 c4 10             	add    $0x10,%esp
 21d:	a9 ff 0f 00 00       	test   $0xfff,%eax
 222:	74 0a                	je     22e <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 224:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 229:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 22e:	50                   	push   %eax
 22f:	ff 75 10             	push   0x10(%ebp)
 232:	ff 75 0c             	push   0xc(%ebp)
 235:	ff 75 08             	push   0x8(%ebp)
 238:	e8 00 01 00 00       	call   33d <clone>
}
 23d:	c9                   	leave  
 23e:	c3                   	ret    

0000023f <thread_join>:

int thread_join(){
 23f:	55                   	push   %ebp
 240:	89 e5                	mov    %esp,%ebp
 242:	53                   	push   %ebx
 243:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 246:	8d 45 f4             	lea    -0xc(%ebp),%eax
 249:	50                   	push   %eax
 24a:	e8 f6 00 00 00       	call   345 <join>
 24f:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 251:	83 c4 04             	add    $0x4,%esp
 254:	ff 75 f4             	push   -0xc(%ebp)
 257:	e8 fc 02 00 00       	call   558 <free>
  return x;
}
 25c:	89 d8                	mov    %ebx,%eax
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <lock_init>:

void lock_init(lock_t *spin){
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    

00000271 <lock_acquire>:

void lock_acquire(lock_t *spin){
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 277:	b8 01 00 00 00       	mov    $0x1,%eax
 27c:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 27f:	85 c0                	test   %eax,%eax
 281:	75 f4                	jne    277 <lock_acquire+0x6>

}
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    

00000285 <lock_release>:

void lock_release(lock_t *spin){
 285:	55                   	push   %ebp
 286:	89 e5                	mov    %esp,%ebp
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	b8 00 00 00 00       	mov    $0x0,%eax
 290:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 293:	5d                   	pop    %ebp
 294:	c3                   	ret    

00000295 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 295:	b8 01 00 00 00       	mov    $0x1,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <exit>:
SYSCALL(exit)
 29d:	b8 02 00 00 00       	mov    $0x2,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <wait>:
SYSCALL(wait)
 2a5:	b8 03 00 00 00       	mov    $0x3,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <pipe>:
SYSCALL(pipe)
 2ad:	b8 04 00 00 00       	mov    $0x4,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <read>:
SYSCALL(read)
 2b5:	b8 05 00 00 00       	mov    $0x5,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <write>:
SYSCALL(write)
 2bd:	b8 10 00 00 00       	mov    $0x10,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <close>:
SYSCALL(close)
 2c5:	b8 15 00 00 00       	mov    $0x15,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <kill>:
SYSCALL(kill)
 2cd:	b8 06 00 00 00       	mov    $0x6,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <exec>:
SYSCALL(exec)
 2d5:	b8 07 00 00 00       	mov    $0x7,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <open>:
SYSCALL(open)
 2dd:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <mknod>:
SYSCALL(mknod)
 2e5:	b8 11 00 00 00       	mov    $0x11,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <unlink>:
SYSCALL(unlink)
 2ed:	b8 12 00 00 00       	mov    $0x12,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <fstat>:
SYSCALL(fstat)
 2f5:	b8 08 00 00 00       	mov    $0x8,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <link>:
SYSCALL(link)
 2fd:	b8 13 00 00 00       	mov    $0x13,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <mkdir>:
SYSCALL(mkdir)
 305:	b8 14 00 00 00       	mov    $0x14,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <chdir>:
SYSCALL(chdir)
 30d:	b8 09 00 00 00       	mov    $0x9,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <dup>:
SYSCALL(dup)
 315:	b8 0a 00 00 00       	mov    $0xa,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <getpid>:
SYSCALL(getpid)
 31d:	b8 0b 00 00 00       	mov    $0xb,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <sbrk>:
SYSCALL(sbrk)
 325:	b8 0c 00 00 00       	mov    $0xc,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <sleep>:
SYSCALL(sleep)
 32d:	b8 0d 00 00 00       	mov    $0xd,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <uptime>:
SYSCALL(uptime)
 335:	b8 0e 00 00 00       	mov    $0xe,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <clone>:
SYSCALL(clone)
 33d:	b8 16 00 00 00       	mov    $0x16,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <join>:
 345:	b8 17 00 00 00       	mov    $0x17,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	83 ec 1c             	sub    $0x1c,%esp
 353:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 356:	6a 01                	push   $0x1
 358:	8d 55 f4             	lea    -0xc(%ebp),%edx
 35b:	52                   	push   %edx
 35c:	50                   	push   %eax
 35d:	e8 5b ff ff ff       	call   2bd <write>
}
 362:	83 c4 10             	add    $0x10,%esp
 365:	c9                   	leave  
 366:	c3                   	ret    

00000367 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 367:	55                   	push   %ebp
 368:	89 e5                	mov    %esp,%ebp
 36a:	57                   	push   %edi
 36b:	56                   	push   %esi
 36c:	53                   	push   %ebx
 36d:	83 ec 2c             	sub    $0x2c,%esp
 370:	89 45 d0             	mov    %eax,-0x30(%ebp)
 373:	89 d0                	mov    %edx,%eax
 375:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 377:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 37b:	0f 95 c1             	setne  %cl
 37e:	c1 ea 1f             	shr    $0x1f,%edx
 381:	84 d1                	test   %dl,%cl
 383:	74 44                	je     3c9 <printint+0x62>
    neg = 1;
    x = -xx;
 385:	f7 d8                	neg    %eax
 387:	89 c1                	mov    %eax,%ecx
    neg = 1;
 389:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 390:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 395:	89 c8                	mov    %ecx,%eax
 397:	ba 00 00 00 00       	mov    $0x0,%edx
 39c:	f7 f6                	div    %esi
 39e:	89 df                	mov    %ebx,%edi
 3a0:	83 c3 01             	add    $0x1,%ebx
 3a3:	0f b6 92 2c 07 00 00 	movzbl 0x72c(%edx),%edx
 3aa:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3ae:	89 ca                	mov    %ecx,%edx
 3b0:	89 c1                	mov    %eax,%ecx
 3b2:	39 d6                	cmp    %edx,%esi
 3b4:	76 df                	jbe    395 <printint+0x2e>
  if(neg)
 3b6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3ba:	74 31                	je     3ed <printint+0x86>
    buf[i++] = '-';
 3bc:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3c1:	8d 5f 02             	lea    0x2(%edi),%ebx
 3c4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3c7:	eb 17                	jmp    3e0 <printint+0x79>
    x = xx;
 3c9:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3cb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3d2:	eb bc                	jmp    390 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3d4:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3d9:	89 f0                	mov    %esi,%eax
 3db:	e8 6d ff ff ff       	call   34d <putc>
  while(--i >= 0)
 3e0:	83 eb 01             	sub    $0x1,%ebx
 3e3:	79 ef                	jns    3d4 <printint+0x6d>
}
 3e5:	83 c4 2c             	add    $0x2c,%esp
 3e8:	5b                   	pop    %ebx
 3e9:	5e                   	pop    %esi
 3ea:	5f                   	pop    %edi
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
 3ed:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3f0:	eb ee                	jmp    3e0 <printint+0x79>

000003f2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	57                   	push   %edi
 3f6:	56                   	push   %esi
 3f7:	53                   	push   %ebx
 3f8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3fb:	8d 45 10             	lea    0x10(%ebp),%eax
 3fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 401:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 406:	bb 00 00 00 00       	mov    $0x0,%ebx
 40b:	eb 14                	jmp    421 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 40d:	89 fa                	mov    %edi,%edx
 40f:	8b 45 08             	mov    0x8(%ebp),%eax
 412:	e8 36 ff ff ff       	call   34d <putc>
 417:	eb 05                	jmp    41e <printf+0x2c>
      }
    } else if(state == '%'){
 419:	83 fe 25             	cmp    $0x25,%esi
 41c:	74 25                	je     443 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 41e:	83 c3 01             	add    $0x1,%ebx
 421:	8b 45 0c             	mov    0xc(%ebp),%eax
 424:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 428:	84 c0                	test   %al,%al
 42a:	0f 84 20 01 00 00    	je     550 <printf+0x15e>
    c = fmt[i] & 0xff;
 430:	0f be f8             	movsbl %al,%edi
 433:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 436:	85 f6                	test   %esi,%esi
 438:	75 df                	jne    419 <printf+0x27>
      if(c == '%'){
 43a:	83 f8 25             	cmp    $0x25,%eax
 43d:	75 ce                	jne    40d <printf+0x1b>
        state = '%';
 43f:	89 c6                	mov    %eax,%esi
 441:	eb db                	jmp    41e <printf+0x2c>
      if(c == 'd'){
 443:	83 f8 25             	cmp    $0x25,%eax
 446:	0f 84 cf 00 00 00    	je     51b <printf+0x129>
 44c:	0f 8c dd 00 00 00    	jl     52f <printf+0x13d>
 452:	83 f8 78             	cmp    $0x78,%eax
 455:	0f 8f d4 00 00 00    	jg     52f <printf+0x13d>
 45b:	83 f8 63             	cmp    $0x63,%eax
 45e:	0f 8c cb 00 00 00    	jl     52f <printf+0x13d>
 464:	83 e8 63             	sub    $0x63,%eax
 467:	83 f8 15             	cmp    $0x15,%eax
 46a:	0f 87 bf 00 00 00    	ja     52f <printf+0x13d>
 470:	ff 24 85 d4 06 00 00 	jmp    *0x6d4(,%eax,4)
        printint(fd, *ap, 10, 1);
 477:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 47a:	8b 17                	mov    (%edi),%edx
 47c:	83 ec 0c             	sub    $0xc,%esp
 47f:	6a 01                	push   $0x1
 481:	b9 0a 00 00 00       	mov    $0xa,%ecx
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	e8 d9 fe ff ff       	call   367 <printint>
        ap++;
 48e:	83 c7 04             	add    $0x4,%edi
 491:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 494:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 497:	be 00 00 00 00       	mov    $0x0,%esi
 49c:	eb 80                	jmp    41e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 49e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4a1:	8b 17                	mov    (%edi),%edx
 4a3:	83 ec 0c             	sub    $0xc,%esp
 4a6:	6a 00                	push   $0x0
 4a8:	b9 10 00 00 00       	mov    $0x10,%ecx
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	e8 b2 fe ff ff       	call   367 <printint>
        ap++;
 4b5:	83 c7 04             	add    $0x4,%edi
 4b8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4bb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4be:	be 00 00 00 00       	mov    $0x0,%esi
 4c3:	e9 56 ff ff ff       	jmp    41e <printf+0x2c>
        s = (char*)*ap;
 4c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4cb:	8b 30                	mov    (%eax),%esi
        ap++;
 4cd:	83 c0 04             	add    $0x4,%eax
 4d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4d3:	85 f6                	test   %esi,%esi
 4d5:	75 15                	jne    4ec <printf+0xfa>
          s = "(null)";
 4d7:	be cd 06 00 00       	mov    $0x6cd,%esi
 4dc:	eb 0e                	jmp    4ec <printf+0xfa>
          putc(fd, *s);
 4de:	0f be d2             	movsbl %dl,%edx
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	e8 64 fe ff ff       	call   34d <putc>
          s++;
 4e9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4ec:	0f b6 16             	movzbl (%esi),%edx
 4ef:	84 d2                	test   %dl,%dl
 4f1:	75 eb                	jne    4de <printf+0xec>
      state = 0;
 4f3:	be 00 00 00 00       	mov    $0x0,%esi
 4f8:	e9 21 ff ff ff       	jmp    41e <printf+0x2c>
        putc(fd, *ap);
 4fd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 500:	0f be 17             	movsbl (%edi),%edx
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	e8 42 fe ff ff       	call   34d <putc>
        ap++;
 50b:	83 c7 04             	add    $0x4,%edi
 50e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 511:	be 00 00 00 00       	mov    $0x0,%esi
 516:	e9 03 ff ff ff       	jmp    41e <printf+0x2c>
        putc(fd, c);
 51b:	89 fa                	mov    %edi,%edx
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	e8 28 fe ff ff       	call   34d <putc>
      state = 0;
 525:	be 00 00 00 00       	mov    $0x0,%esi
 52a:	e9 ef fe ff ff       	jmp    41e <printf+0x2c>
        putc(fd, '%');
 52f:	ba 25 00 00 00       	mov    $0x25,%edx
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	e8 11 fe ff ff       	call   34d <putc>
        putc(fd, c);
 53c:	89 fa                	mov    %edi,%edx
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
 541:	e8 07 fe ff ff       	call   34d <putc>
      state = 0;
 546:	be 00 00 00 00       	mov    $0x0,%esi
 54b:	e9 ce fe ff ff       	jmp    41e <printf+0x2c>
    }
  }
}
 550:	8d 65 f4             	lea    -0xc(%ebp),%esp
 553:	5b                   	pop    %ebx
 554:	5e                   	pop    %esi
 555:	5f                   	pop    %edi
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    

00000558 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 558:	55                   	push   %ebp
 559:	89 e5                	mov    %esp,%ebp
 55b:	57                   	push   %edi
 55c:	56                   	push   %esi
 55d:	53                   	push   %ebx
 55e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 561:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 564:	a1 7c 0a 00 00       	mov    0xa7c,%eax
 569:	eb 02                	jmp    56d <free+0x15>
 56b:	89 d0                	mov    %edx,%eax
 56d:	39 c8                	cmp    %ecx,%eax
 56f:	73 04                	jae    575 <free+0x1d>
 571:	39 08                	cmp    %ecx,(%eax)
 573:	77 12                	ja     587 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 575:	8b 10                	mov    (%eax),%edx
 577:	39 c2                	cmp    %eax,%edx
 579:	77 f0                	ja     56b <free+0x13>
 57b:	39 c8                	cmp    %ecx,%eax
 57d:	72 08                	jb     587 <free+0x2f>
 57f:	39 ca                	cmp    %ecx,%edx
 581:	77 04                	ja     587 <free+0x2f>
 583:	89 d0                	mov    %edx,%eax
 585:	eb e6                	jmp    56d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 587:	8b 73 fc             	mov    -0x4(%ebx),%esi
 58a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 58d:	8b 10                	mov    (%eax),%edx
 58f:	39 d7                	cmp    %edx,%edi
 591:	74 19                	je     5ac <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 593:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 596:	8b 50 04             	mov    0x4(%eax),%edx
 599:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 59c:	39 ce                	cmp    %ecx,%esi
 59e:	74 1b                	je     5bb <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5a0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5a2:	a3 7c 0a 00 00       	mov    %eax,0xa7c
}
 5a7:	5b                   	pop    %ebx
 5a8:	5e                   	pop    %esi
 5a9:	5f                   	pop    %edi
 5aa:	5d                   	pop    %ebp
 5ab:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5ac:	03 72 04             	add    0x4(%edx),%esi
 5af:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5b2:	8b 10                	mov    (%eax),%edx
 5b4:	8b 12                	mov    (%edx),%edx
 5b6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5b9:	eb db                	jmp    596 <free+0x3e>
    p->s.size += bp->s.size;
 5bb:	03 53 fc             	add    -0x4(%ebx),%edx
 5be:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5c1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5c4:	89 10                	mov    %edx,(%eax)
 5c6:	eb da                	jmp    5a2 <free+0x4a>

000005c8 <morecore>:

static Header*
morecore(uint nu)
{
 5c8:	55                   	push   %ebp
 5c9:	89 e5                	mov    %esp,%ebp
 5cb:	53                   	push   %ebx
 5cc:	83 ec 04             	sub    $0x4,%esp
 5cf:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5d1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5d6:	77 05                	ja     5dd <morecore+0x15>
    nu = 4096;
 5d8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5dd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5e4:	83 ec 0c             	sub    $0xc,%esp
 5e7:	50                   	push   %eax
 5e8:	e8 38 fd ff ff       	call   325 <sbrk>
  if(p == (char*)-1)
 5ed:	83 c4 10             	add    $0x10,%esp
 5f0:	83 f8 ff             	cmp    $0xffffffff,%eax
 5f3:	74 1c                	je     611 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5f5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5f8:	83 c0 08             	add    $0x8,%eax
 5fb:	83 ec 0c             	sub    $0xc,%esp
 5fe:	50                   	push   %eax
 5ff:	e8 54 ff ff ff       	call   558 <free>
  return freep;
 604:	a1 7c 0a 00 00       	mov    0xa7c,%eax
 609:	83 c4 10             	add    $0x10,%esp
}
 60c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 60f:	c9                   	leave  
 610:	c3                   	ret    
    return 0;
 611:	b8 00 00 00 00       	mov    $0x0,%eax
 616:	eb f4                	jmp    60c <morecore+0x44>

00000618 <malloc>:

void*
malloc(uint nbytes)
{
 618:	55                   	push   %ebp
 619:	89 e5                	mov    %esp,%ebp
 61b:	53                   	push   %ebx
 61c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	8d 58 07             	lea    0x7(%eax),%ebx
 625:	c1 eb 03             	shr    $0x3,%ebx
 628:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 62b:	8b 0d 7c 0a 00 00    	mov    0xa7c,%ecx
 631:	85 c9                	test   %ecx,%ecx
 633:	74 04                	je     639 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 635:	8b 01                	mov    (%ecx),%eax
 637:	eb 4a                	jmp    683 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 639:	c7 05 7c 0a 00 00 80 	movl   $0xa80,0xa7c
 640:	0a 00 00 
 643:	c7 05 80 0a 00 00 80 	movl   $0xa80,0xa80
 64a:	0a 00 00 
    base.s.size = 0;
 64d:	c7 05 84 0a 00 00 00 	movl   $0x0,0xa84
 654:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 657:	b9 80 0a 00 00       	mov    $0xa80,%ecx
 65c:	eb d7                	jmp    635 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 65e:	74 19                	je     679 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 660:	29 da                	sub    %ebx,%edx
 662:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 665:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 668:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 66b:	89 0d 7c 0a 00 00    	mov    %ecx,0xa7c
      return (void*)(p + 1);
 671:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 674:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 677:	c9                   	leave  
 678:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 679:	8b 10                	mov    (%eax),%edx
 67b:	89 11                	mov    %edx,(%ecx)
 67d:	eb ec                	jmp    66b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 67f:	89 c1                	mov    %eax,%ecx
 681:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 683:	8b 50 04             	mov    0x4(%eax),%edx
 686:	39 da                	cmp    %ebx,%edx
 688:	73 d4                	jae    65e <malloc+0x46>
    if(p == freep)
 68a:	39 05 7c 0a 00 00    	cmp    %eax,0xa7c
 690:	75 ed                	jne    67f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 692:	89 d8                	mov    %ebx,%eax
 694:	e8 2f ff ff ff       	call   5c8 <morecore>
 699:	85 c0                	test   %eax,%eax
 69b:	75 e2                	jne    67f <malloc+0x67>
 69d:	eb d5                	jmp    674 <malloc+0x5c>
