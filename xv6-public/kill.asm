
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
  28:	68 88 06 00 00       	push   $0x688
  2d:	6a 02                	push   $0x2
  2f:	e8 a6 03 00 00       	call   3da <printf>
    exit();
  34:	e8 4c 02 00 00       	call   285 <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 52 01 00 00       	call   196 <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 69 02 00 00       	call   2b5 <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 2a 02 00 00       	call   285 <exit>

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
 121:	e8 77 01 00 00       	call   29d <read>
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
 15f:	e8 61 01 00 00       	call   2c5 <open>
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
 174:	e8 64 01 00 00       	call   2dd <fstat>
 179:	89 c6                	mov    %eax,%esi
  close(fd);
 17b:	89 1c 24             	mov    %ebx,(%esp)
 17e:	e8 2a 01 00 00       	call   2ad <close>
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

  void* stack = malloc(2 * PGSIZE);
 1f8:	68 00 20 00 00       	push   $0x2000
 1fd:	e8 fe 03 00 00       	call   600 <malloc>
  if ((uint)stack%PGSIZE){
 202:	83 c4 10             	add    $0x10,%esp
 205:	a9 ff 0f 00 00       	test   $0xfff,%eax
 20a:	74 0a                	je     216 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 20c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 211:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 216:	50                   	push   %eax
 217:	ff 75 10             	push   0x10(%ebp)
 21a:	ff 75 0c             	push   0xc(%ebp)
 21d:	ff 75 08             	push   0x8(%ebp)
 220:	e8 00 01 00 00       	call   325 <clone>
}
 225:	c9                   	leave  
 226:	c3                   	ret    

00000227 <thread_join>:

int thread_join(){
 227:	55                   	push   %ebp
 228:	89 e5                	mov    %esp,%ebp
 22a:	53                   	push   %ebx
 22b:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 22e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 231:	50                   	push   %eax
 232:	e8 f6 00 00 00       	call   32d <join>
 237:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 239:	83 c4 04             	add    $0x4,%esp
 23c:	ff 75 f4             	push   -0xc(%ebp)
 23f:	e8 fc 02 00 00       	call   540 <free>
  return x;
}
 244:	89 d8                	mov    %ebx,%eax
 246:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 249:	c9                   	leave  
 24a:	c3                   	ret    

0000024b <lock_init>:

void lock_init(lock_t *spin){
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    

00000259 <lock_acquire>:

void lock_acquire(lock_t *spin){
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 25f:	b8 01 00 00 00       	mov    $0x1,%eax
 264:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 267:	85 c0                	test   %eax,%eax
 269:	75 f4                	jne    25f <lock_acquire+0x6>

}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <lock_release>:

void lock_release(lock_t *spin){
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	8b 55 08             	mov    0x8(%ebp),%edx
 273:	b8 00 00 00 00       	mov    $0x0,%eax
 278:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    

0000027d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27d:	b8 01 00 00 00       	mov    $0x1,%eax
 282:	cd 40                	int    $0x40
 284:	c3                   	ret    

00000285 <exit>:
SYSCALL(exit)
 285:	b8 02 00 00 00       	mov    $0x2,%eax
 28a:	cd 40                	int    $0x40
 28c:	c3                   	ret    

0000028d <wait>:
SYSCALL(wait)
 28d:	b8 03 00 00 00       	mov    $0x3,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <pipe>:
SYSCALL(pipe)
 295:	b8 04 00 00 00       	mov    $0x4,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <read>:
SYSCALL(read)
 29d:	b8 05 00 00 00       	mov    $0x5,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <write>:
SYSCALL(write)
 2a5:	b8 10 00 00 00       	mov    $0x10,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <close>:
SYSCALL(close)
 2ad:	b8 15 00 00 00       	mov    $0x15,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <kill>:
SYSCALL(kill)
 2b5:	b8 06 00 00 00       	mov    $0x6,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <exec>:
SYSCALL(exec)
 2bd:	b8 07 00 00 00       	mov    $0x7,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <open>:
SYSCALL(open)
 2c5:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <mknod>:
SYSCALL(mknod)
 2cd:	b8 11 00 00 00       	mov    $0x11,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <unlink>:
SYSCALL(unlink)
 2d5:	b8 12 00 00 00       	mov    $0x12,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <fstat>:
SYSCALL(fstat)
 2dd:	b8 08 00 00 00       	mov    $0x8,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <link>:
SYSCALL(link)
 2e5:	b8 13 00 00 00       	mov    $0x13,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <mkdir>:
SYSCALL(mkdir)
 2ed:	b8 14 00 00 00       	mov    $0x14,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <chdir>:
SYSCALL(chdir)
 2f5:	b8 09 00 00 00       	mov    $0x9,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <dup>:
SYSCALL(dup)
 2fd:	b8 0a 00 00 00       	mov    $0xa,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <getpid>:
SYSCALL(getpid)
 305:	b8 0b 00 00 00       	mov    $0xb,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <sbrk>:
SYSCALL(sbrk)
 30d:	b8 0c 00 00 00       	mov    $0xc,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <sleep>:
SYSCALL(sleep)
 315:	b8 0d 00 00 00       	mov    $0xd,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <uptime>:
SYSCALL(uptime)
 31d:	b8 0e 00 00 00       	mov    $0xe,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <clone>:
SYSCALL(clone)
 325:	b8 16 00 00 00       	mov    $0x16,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <join>:
 32d:	b8 17 00 00 00       	mov    $0x17,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	83 ec 1c             	sub    $0x1c,%esp
 33b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 33e:	6a 01                	push   $0x1
 340:	8d 55 f4             	lea    -0xc(%ebp),%edx
 343:	52                   	push   %edx
 344:	50                   	push   %eax
 345:	e8 5b ff ff ff       	call   2a5 <write>
}
 34a:	83 c4 10             	add    $0x10,%esp
 34d:	c9                   	leave  
 34e:	c3                   	ret    

0000034f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 34f:	55                   	push   %ebp
 350:	89 e5                	mov    %esp,%ebp
 352:	57                   	push   %edi
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
 355:	83 ec 2c             	sub    $0x2c,%esp
 358:	89 45 d0             	mov    %eax,-0x30(%ebp)
 35b:	89 d0                	mov    %edx,%eax
 35d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 35f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 363:	0f 95 c1             	setne  %cl
 366:	c1 ea 1f             	shr    $0x1f,%edx
 369:	84 d1                	test   %dl,%cl
 36b:	74 44                	je     3b1 <printint+0x62>
    neg = 1;
    x = -xx;
 36d:	f7 d8                	neg    %eax
 36f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 371:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 378:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 37d:	89 c8                	mov    %ecx,%eax
 37f:	ba 00 00 00 00       	mov    $0x0,%edx
 384:	f7 f6                	div    %esi
 386:	89 df                	mov    %ebx,%edi
 388:	83 c3 01             	add    $0x1,%ebx
 38b:	0f b6 92 fc 06 00 00 	movzbl 0x6fc(%edx),%edx
 392:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 396:	89 ca                	mov    %ecx,%edx
 398:	89 c1                	mov    %eax,%ecx
 39a:	39 d6                	cmp    %edx,%esi
 39c:	76 df                	jbe    37d <printint+0x2e>
  if(neg)
 39e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3a2:	74 31                	je     3d5 <printint+0x86>
    buf[i++] = '-';
 3a4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3a9:	8d 5f 02             	lea    0x2(%edi),%ebx
 3ac:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3af:	eb 17                	jmp    3c8 <printint+0x79>
    x = xx;
 3b1:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3b3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3ba:	eb bc                	jmp    378 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3bc:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3c1:	89 f0                	mov    %esi,%eax
 3c3:	e8 6d ff ff ff       	call   335 <putc>
  while(--i >= 0)
 3c8:	83 eb 01             	sub    $0x1,%ebx
 3cb:	79 ef                	jns    3bc <printint+0x6d>
}
 3cd:	83 c4 2c             	add    $0x2c,%esp
 3d0:	5b                   	pop    %ebx
 3d1:	5e                   	pop    %esi
 3d2:	5f                   	pop    %edi
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret    
 3d5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d8:	eb ee                	jmp    3c8 <printint+0x79>

000003da <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3da:	55                   	push   %ebp
 3db:	89 e5                	mov    %esp,%ebp
 3dd:	57                   	push   %edi
 3de:	56                   	push   %esi
 3df:	53                   	push   %ebx
 3e0:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3e3:	8d 45 10             	lea    0x10(%ebp),%eax
 3e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3e9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3ee:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f3:	eb 14                	jmp    409 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3f5:	89 fa                	mov    %edi,%edx
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	e8 36 ff ff ff       	call   335 <putc>
 3ff:	eb 05                	jmp    406 <printf+0x2c>
      }
    } else if(state == '%'){
 401:	83 fe 25             	cmp    $0x25,%esi
 404:	74 25                	je     42b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 406:	83 c3 01             	add    $0x1,%ebx
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 410:	84 c0                	test   %al,%al
 412:	0f 84 20 01 00 00    	je     538 <printf+0x15e>
    c = fmt[i] & 0xff;
 418:	0f be f8             	movsbl %al,%edi
 41b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 41e:	85 f6                	test   %esi,%esi
 420:	75 df                	jne    401 <printf+0x27>
      if(c == '%'){
 422:	83 f8 25             	cmp    $0x25,%eax
 425:	75 ce                	jne    3f5 <printf+0x1b>
        state = '%';
 427:	89 c6                	mov    %eax,%esi
 429:	eb db                	jmp    406 <printf+0x2c>
      if(c == 'd'){
 42b:	83 f8 25             	cmp    $0x25,%eax
 42e:	0f 84 cf 00 00 00    	je     503 <printf+0x129>
 434:	0f 8c dd 00 00 00    	jl     517 <printf+0x13d>
 43a:	83 f8 78             	cmp    $0x78,%eax
 43d:	0f 8f d4 00 00 00    	jg     517 <printf+0x13d>
 443:	83 f8 63             	cmp    $0x63,%eax
 446:	0f 8c cb 00 00 00    	jl     517 <printf+0x13d>
 44c:	83 e8 63             	sub    $0x63,%eax
 44f:	83 f8 15             	cmp    $0x15,%eax
 452:	0f 87 bf 00 00 00    	ja     517 <printf+0x13d>
 458:	ff 24 85 a4 06 00 00 	jmp    *0x6a4(,%eax,4)
        printint(fd, *ap, 10, 1);
 45f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 462:	8b 17                	mov    (%edi),%edx
 464:	83 ec 0c             	sub    $0xc,%esp
 467:	6a 01                	push   $0x1
 469:	b9 0a 00 00 00       	mov    $0xa,%ecx
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	e8 d9 fe ff ff       	call   34f <printint>
        ap++;
 476:	83 c7 04             	add    $0x4,%edi
 479:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 47c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 47f:	be 00 00 00 00       	mov    $0x0,%esi
 484:	eb 80                	jmp    406 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 486:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 489:	8b 17                	mov    (%edi),%edx
 48b:	83 ec 0c             	sub    $0xc,%esp
 48e:	6a 00                	push   $0x0
 490:	b9 10 00 00 00       	mov    $0x10,%ecx
 495:	8b 45 08             	mov    0x8(%ebp),%eax
 498:	e8 b2 fe ff ff       	call   34f <printint>
        ap++;
 49d:	83 c7 04             	add    $0x4,%edi
 4a0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4a6:	be 00 00 00 00       	mov    $0x0,%esi
 4ab:	e9 56 ff ff ff       	jmp    406 <printf+0x2c>
        s = (char*)*ap;
 4b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b3:	8b 30                	mov    (%eax),%esi
        ap++;
 4b5:	83 c0 04             	add    $0x4,%eax
 4b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4bb:	85 f6                	test   %esi,%esi
 4bd:	75 15                	jne    4d4 <printf+0xfa>
          s = "(null)";
 4bf:	be 9c 06 00 00       	mov    $0x69c,%esi
 4c4:	eb 0e                	jmp    4d4 <printf+0xfa>
          putc(fd, *s);
 4c6:	0f be d2             	movsbl %dl,%edx
 4c9:	8b 45 08             	mov    0x8(%ebp),%eax
 4cc:	e8 64 fe ff ff       	call   335 <putc>
          s++;
 4d1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4d4:	0f b6 16             	movzbl (%esi),%edx
 4d7:	84 d2                	test   %dl,%dl
 4d9:	75 eb                	jne    4c6 <printf+0xec>
      state = 0;
 4db:	be 00 00 00 00       	mov    $0x0,%esi
 4e0:	e9 21 ff ff ff       	jmp    406 <printf+0x2c>
        putc(fd, *ap);
 4e5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e8:	0f be 17             	movsbl (%edi),%edx
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ee:	e8 42 fe ff ff       	call   335 <putc>
        ap++;
 4f3:	83 c7 04             	add    $0x4,%edi
 4f6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4f9:	be 00 00 00 00       	mov    $0x0,%esi
 4fe:	e9 03 ff ff ff       	jmp    406 <printf+0x2c>
        putc(fd, c);
 503:	89 fa                	mov    %edi,%edx
 505:	8b 45 08             	mov    0x8(%ebp),%eax
 508:	e8 28 fe ff ff       	call   335 <putc>
      state = 0;
 50d:	be 00 00 00 00       	mov    $0x0,%esi
 512:	e9 ef fe ff ff       	jmp    406 <printf+0x2c>
        putc(fd, '%');
 517:	ba 25 00 00 00       	mov    $0x25,%edx
 51c:	8b 45 08             	mov    0x8(%ebp),%eax
 51f:	e8 11 fe ff ff       	call   335 <putc>
        putc(fd, c);
 524:	89 fa                	mov    %edi,%edx
 526:	8b 45 08             	mov    0x8(%ebp),%eax
 529:	e8 07 fe ff ff       	call   335 <putc>
      state = 0;
 52e:	be 00 00 00 00       	mov    $0x0,%esi
 533:	e9 ce fe ff ff       	jmp    406 <printf+0x2c>
    }
  }
}
 538:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53b:	5b                   	pop    %ebx
 53c:	5e                   	pop    %esi
 53d:	5f                   	pop    %edi
 53e:	5d                   	pop    %ebp
 53f:	c3                   	ret    

00000540 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 549:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 54c:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 551:	eb 02                	jmp    555 <free+0x15>
 553:	89 d0                	mov    %edx,%eax
 555:	39 c8                	cmp    %ecx,%eax
 557:	73 04                	jae    55d <free+0x1d>
 559:	39 08                	cmp    %ecx,(%eax)
 55b:	77 12                	ja     56f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 55d:	8b 10                	mov    (%eax),%edx
 55f:	39 c2                	cmp    %eax,%edx
 561:	77 f0                	ja     553 <free+0x13>
 563:	39 c8                	cmp    %ecx,%eax
 565:	72 08                	jb     56f <free+0x2f>
 567:	39 ca                	cmp    %ecx,%edx
 569:	77 04                	ja     56f <free+0x2f>
 56b:	89 d0                	mov    %edx,%eax
 56d:	eb e6                	jmp    555 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 56f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 572:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 575:	8b 10                	mov    (%eax),%edx
 577:	39 d7                	cmp    %edx,%edi
 579:	74 19                	je     594 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 57b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 57e:	8b 50 04             	mov    0x4(%eax),%edx
 581:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 584:	39 ce                	cmp    %ecx,%esi
 586:	74 1b                	je     5a3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 588:	89 08                	mov    %ecx,(%eax)
  freep = p;
 58a:	a3 4c 0a 00 00       	mov    %eax,0xa4c
}
 58f:	5b                   	pop    %ebx
 590:	5e                   	pop    %esi
 591:	5f                   	pop    %edi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 594:	03 72 04             	add    0x4(%edx),%esi
 597:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 59a:	8b 10                	mov    (%eax),%edx
 59c:	8b 12                	mov    (%edx),%edx
 59e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5a1:	eb db                	jmp    57e <free+0x3e>
    p->s.size += bp->s.size;
 5a3:	03 53 fc             	add    -0x4(%ebx),%edx
 5a6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5a9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5ac:	89 10                	mov    %edx,(%eax)
 5ae:	eb da                	jmp    58a <free+0x4a>

000005b0 <morecore>:

static Header*
morecore(uint nu)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	53                   	push   %ebx
 5b4:	83 ec 04             	sub    $0x4,%esp
 5b7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5b9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5be:	77 05                	ja     5c5 <morecore+0x15>
    nu = 4096;
 5c0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5c5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5cc:	83 ec 0c             	sub    $0xc,%esp
 5cf:	50                   	push   %eax
 5d0:	e8 38 fd ff ff       	call   30d <sbrk>
  if(p == (char*)-1)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	83 f8 ff             	cmp    $0xffffffff,%eax
 5db:	74 1c                	je     5f9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5dd:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5e0:	83 c0 08             	add    $0x8,%eax
 5e3:	83 ec 0c             	sub    $0xc,%esp
 5e6:	50                   	push   %eax
 5e7:	e8 54 ff ff ff       	call   540 <free>
  return freep;
 5ec:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 5f1:	83 c4 10             	add    $0x10,%esp
}
 5f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f7:	c9                   	leave  
 5f8:	c3                   	ret    
    return 0;
 5f9:	b8 00 00 00 00       	mov    $0x0,%eax
 5fe:	eb f4                	jmp    5f4 <morecore+0x44>

00000600 <malloc>:

void*
malloc(uint nbytes)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	53                   	push   %ebx
 604:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	8d 58 07             	lea    0x7(%eax),%ebx
 60d:	c1 eb 03             	shr    $0x3,%ebx
 610:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 613:	8b 0d 4c 0a 00 00    	mov    0xa4c,%ecx
 619:	85 c9                	test   %ecx,%ecx
 61b:	74 04                	je     621 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 61d:	8b 01                	mov    (%ecx),%eax
 61f:	eb 4a                	jmp    66b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 621:	c7 05 4c 0a 00 00 50 	movl   $0xa50,0xa4c
 628:	0a 00 00 
 62b:	c7 05 50 0a 00 00 50 	movl   $0xa50,0xa50
 632:	0a 00 00 
    base.s.size = 0;
 635:	c7 05 54 0a 00 00 00 	movl   $0x0,0xa54
 63c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 63f:	b9 50 0a 00 00       	mov    $0xa50,%ecx
 644:	eb d7                	jmp    61d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 646:	74 19                	je     661 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 648:	29 da                	sub    %ebx,%edx
 64a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 64d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 650:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 653:	89 0d 4c 0a 00 00    	mov    %ecx,0xa4c
      return (void*)(p + 1);
 659:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 65c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65f:	c9                   	leave  
 660:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 661:	8b 10                	mov    (%eax),%edx
 663:	89 11                	mov    %edx,(%ecx)
 665:	eb ec                	jmp    653 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 667:	89 c1                	mov    %eax,%ecx
 669:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 66b:	8b 50 04             	mov    0x4(%eax),%edx
 66e:	39 da                	cmp    %ebx,%edx
 670:	73 d4                	jae    646 <malloc+0x46>
    if(p == freep)
 672:	39 05 4c 0a 00 00    	cmp    %eax,0xa4c
 678:	75 ed                	jne    667 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 67a:	89 d8                	mov    %ebx,%eax
 67c:	e8 2f ff ff ff       	call   5b0 <morecore>
 681:	85 c0                	test   %eax,%eax
 683:	75 e2                	jne    667 <malloc+0x67>
 685:	eb d5                	jmp    65c <malloc+0x5c>
