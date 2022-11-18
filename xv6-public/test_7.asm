
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   exit(); \
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 cc 03 00 00       	call   3e2 <getpid>
  16:	a3 78 0b 00 00       	mov    %eax,0xb78

   int fork_pid = fork();
  1b:	e8 3a 03 00 00       	call   35a <fork>
   if(fork_pid == 0) {
  20:	85 c0                	test   %eax,%eax
  22:	74 63                	je     87 <main+0x87>
     exit();
   }
   assert(fork_pid > 0);
  24:	7e 66                	jle    8c <main+0x8c>

   void *join_stack;
   int join_pid = join(&join_stack);
  26:	83 ec 0c             	sub    $0xc,%esp
  29:	8d 45 f4             	lea    -0xc(%ebp),%eax
  2c:	50                   	push   %eax
  2d:	e8 d8 03 00 00       	call   40a <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 64 07 00 00       	push   $0x764
  45:	68 6d 07 00 00       	push   $0x76d
  4a:	6a 01                	push   $0x1
  4c:	e8 66 04 00 00       	call   4b7 <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 a3 07 00 00       	push   $0x7a3
  59:	68 82 07 00 00       	push   $0x782
  5e:	6a 01                	push   $0x1
  60:	e8 52 04 00 00       	call   4b7 <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 96 07 00 00       	push   $0x796
  6d:	6a 01                	push   $0x1
  6f:	e8 43 04 00 00       	call   4b7 <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 78 0b 00 00    	push   0xb78
  7d:	e8 10 03 00 00       	call   392 <kill>
  82:	e8 db 02 00 00       	call   362 <exit>
     exit();
  87:	e8 d6 02 00 00       	call   362 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 64 07 00 00       	push   $0x764
  93:	68 6d 07 00 00       	push   $0x76d
  98:	6a 01                	push   $0x1
  9a:	e8 18 04 00 00       	call   4b7 <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 75 07 00 00       	push   $0x775
  a7:	68 82 07 00 00       	push   $0x782
  ac:	6a 01                	push   $0x1
  ae:	e8 04 04 00 00       	call   4b7 <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 96 07 00 00       	push   $0x796
  bb:	6a 01                	push   $0x1
  bd:	e8 f5 03 00 00       	call   4b7 <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 78 0b 00 00    	push   0xb78
  cb:	e8 c2 02 00 00       	call   392 <kill>
  d0:	e8 8d 02 00 00       	call   362 <exit>

   assert(wait() > 0);
  d5:	e8 90 02 00 00       	call   36a <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 bd 07 00 00       	push   $0x7bd
  e6:	6a 01                	push   $0x1
  e8:	e8 ca 03 00 00       	call   4b7 <printf>
   exit();
  ed:	e8 70 02 00 00       	call   362 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 64 07 00 00       	push   $0x764
  f9:	68 6d 07 00 00       	push   $0x76d
  fe:	6a 01                	push   $0x1
 100:	e8 b2 03 00 00       	call   4b7 <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 b2 07 00 00       	push   $0x7b2
 10d:	68 82 07 00 00       	push   $0x782
 112:	6a 01                	push   $0x1
 114:	e8 9e 03 00 00       	call   4b7 <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 96 07 00 00       	push   $0x796
 121:	6a 01                	push   $0x1
 123:	e8 8f 03 00 00       	call   4b7 <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 78 0b 00 00    	push   0xb78
 131:	e8 5c 02 00 00       	call   392 <kill>
 136:	e8 27 02 00 00       	call   362 <exit>

0000013b <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	56                   	push   %esi
 13f:	53                   	push   %ebx
 140:	8b 75 08             	mov    0x8(%ebp),%esi
 143:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 146:	89 f0                	mov    %esi,%eax
 148:	89 d1                	mov    %edx,%ecx
 14a:	83 c2 01             	add    $0x1,%edx
 14d:	89 c3                	mov    %eax,%ebx
 14f:	83 c0 01             	add    $0x1,%eax
 152:	0f b6 09             	movzbl (%ecx),%ecx
 155:	88 0b                	mov    %cl,(%ebx)
 157:	84 c9                	test   %cl,%cl
 159:	75 ed                	jne    148 <strcpy+0xd>
    ;
  return os;
}
 15b:	89 f0                	mov    %esi,%eax
 15d:	5b                   	pop    %ebx
 15e:	5e                   	pop    %esi
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    

00000161 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 161:	55                   	push   %ebp
 162:	89 e5                	mov    %esp,%ebp
 164:	8b 4d 08             	mov    0x8(%ebp),%ecx
 167:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 16a:	eb 06                	jmp    172 <strcmp+0x11>
    p++, q++;
 16c:	83 c1 01             	add    $0x1,%ecx
 16f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 172:	0f b6 01             	movzbl (%ecx),%eax
 175:	84 c0                	test   %al,%al
 177:	74 04                	je     17d <strcmp+0x1c>
 179:	3a 02                	cmp    (%edx),%al
 17b:	74 ef                	je     16c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 17d:	0f b6 c0             	movzbl %al,%eax
 180:	0f b6 12             	movzbl (%edx),%edx
 183:	29 d0                	sub    %edx,%eax
}
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    

00000187 <strlen>:

uint
strlen(const char *s)
{
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
 18a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 18d:	b8 00 00 00 00       	mov    $0x0,%eax
 192:	eb 03                	jmp    197 <strlen+0x10>
 194:	83 c0 01             	add    $0x1,%eax
 197:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 19b:	75 f7                	jne    194 <strlen+0xd>
    ;
  return n;
}
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    

0000019f <memset>:

void*
memset(void *dst, int c, uint n)
{
 19f:	55                   	push   %ebp
 1a0:	89 e5                	mov    %esp,%ebp
 1a2:	57                   	push   %edi
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a6:	89 d7                	mov    %edx,%edi
 1a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ae:	fc                   	cld    
 1af:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b1:	89 d0                	mov    %edx,%eax
 1b3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b6:	c9                   	leave  
 1b7:	c3                   	ret    

000001b8 <strchr>:

char*
strchr(const char *s, char c)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1c2:	eb 03                	jmp    1c7 <strchr+0xf>
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	0f b6 10             	movzbl (%eax),%edx
 1ca:	84 d2                	test   %dl,%dl
 1cc:	74 06                	je     1d4 <strchr+0x1c>
    if(*s == c)
 1ce:	38 ca                	cmp    %cl,%dl
 1d0:	75 f2                	jne    1c4 <strchr+0xc>
 1d2:	eb 05                	jmp    1d9 <strchr+0x21>
      return (char*)s;
  return 0;
 1d4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    

000001db <gets>:

char*
gets(char *buf, int max)
{
 1db:	55                   	push   %ebp
 1dc:	89 e5                	mov    %esp,%ebp
 1de:	57                   	push   %edi
 1df:	56                   	push   %esi
 1e0:	53                   	push   %ebx
 1e1:	83 ec 1c             	sub    $0x1c,%esp
 1e4:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e7:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ec:	89 de                	mov    %ebx,%esi
 1ee:	83 c3 01             	add    $0x1,%ebx
 1f1:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f4:	7d 2e                	jge    224 <gets+0x49>
    cc = read(0, &c, 1);
 1f6:	83 ec 04             	sub    $0x4,%esp
 1f9:	6a 01                	push   $0x1
 1fb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1fe:	50                   	push   %eax
 1ff:	6a 00                	push   $0x0
 201:	e8 74 01 00 00       	call   37a <read>
    if(cc < 1)
 206:	83 c4 10             	add    $0x10,%esp
 209:	85 c0                	test   %eax,%eax
 20b:	7e 17                	jle    224 <gets+0x49>
      break;
    buf[i++] = c;
 20d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 211:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 214:	3c 0a                	cmp    $0xa,%al
 216:	0f 94 c2             	sete   %dl
 219:	3c 0d                	cmp    $0xd,%al
 21b:	0f 94 c0             	sete   %al
 21e:	08 c2                	or     %al,%dl
 220:	74 ca                	je     1ec <gets+0x11>
    buf[i++] = c;
 222:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 224:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 228:	89 f8                	mov    %edi,%eax
 22a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22d:	5b                   	pop    %ebx
 22e:	5e                   	pop    %esi
 22f:	5f                   	pop    %edi
 230:	5d                   	pop    %ebp
 231:	c3                   	ret    

00000232 <stat>:

int
stat(const char *n, struct stat *st)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	56                   	push   %esi
 236:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 237:	83 ec 08             	sub    $0x8,%esp
 23a:	6a 00                	push   $0x0
 23c:	ff 75 08             	push   0x8(%ebp)
 23f:	e8 5e 01 00 00       	call   3a2 <open>
  if(fd < 0)
 244:	83 c4 10             	add    $0x10,%esp
 247:	85 c0                	test   %eax,%eax
 249:	78 24                	js     26f <stat+0x3d>
 24b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	ff 75 0c             	push   0xc(%ebp)
 253:	50                   	push   %eax
 254:	e8 61 01 00 00       	call   3ba <fstat>
 259:	89 c6                	mov    %eax,%esi
  close(fd);
 25b:	89 1c 24             	mov    %ebx,(%esp)
 25e:	e8 27 01 00 00       	call   38a <close>
  return r;
 263:	83 c4 10             	add    $0x10,%esp
}
 266:	89 f0                	mov    %esi,%eax
 268:	8d 65 f8             	lea    -0x8(%ebp),%esp
 26b:	5b                   	pop    %ebx
 26c:	5e                   	pop    %esi
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
    return -1;
 26f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 274:	eb f0                	jmp    266 <stat+0x34>

00000276 <atoi>:

int
atoi(const char *s)
{
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	53                   	push   %ebx
 27a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 27d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 282:	eb 10                	jmp    294 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 284:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 287:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 28a:	83 c1 01             	add    $0x1,%ecx
 28d:	0f be c0             	movsbl %al,%eax
 290:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 294:	0f b6 01             	movzbl (%ecx),%eax
 297:	8d 58 d0             	lea    -0x30(%eax),%ebx
 29a:	80 fb 09             	cmp    $0x9,%bl
 29d:	76 e5                	jbe    284 <atoi+0xe>
  return n;
}
 29f:	89 d0                	mov    %edx,%eax
 2a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	56                   	push   %esi
 2aa:	53                   	push   %ebx
 2ab:	8b 75 08             	mov    0x8(%ebp),%esi
 2ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2b4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2b6:	eb 0d                	jmp    2c5 <memmove+0x1f>
    *dst++ = *src++;
 2b8:	0f b6 01             	movzbl (%ecx),%eax
 2bb:	88 02                	mov    %al,(%edx)
 2bd:	8d 49 01             	lea    0x1(%ecx),%ecx
 2c0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2c3:	89 d8                	mov    %ebx,%eax
 2c5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2c8:	85 c0                	test   %eax,%eax
 2ca:	7f ec                	jg     2b8 <memmove+0x12>
  return vdst;
}
 2cc:	89 f0                	mov    %esi,%eax
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5d                   	pop    %ebp
 2d1:	c3                   	ret    

000002d2 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 2d8:	68 00 10 00 00       	push   $0x1000
 2dd:	e8 fb 03 00 00       	call   6dd <malloc>

  return clone(start_routine, arg1, arg2, stack);
 2e2:	50                   	push   %eax
 2e3:	ff 75 10             	push   0x10(%ebp)
 2e6:	ff 75 0c             	push   0xc(%ebp)
 2e9:	ff 75 08             	push   0x8(%ebp)
 2ec:	e8 11 01 00 00       	call   402 <clone>
}
 2f1:	c9                   	leave  
 2f2:	c3                   	ret    

000002f3 <thread_join>:

int thread_join(){
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	53                   	push   %ebx
 2f7:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 2fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fd:	50                   	push   %eax
 2fe:	e8 07 01 00 00       	call   40a <join>
  if (x < 0) {
 303:	83 c4 10             	add    $0x10,%esp
 306:	85 c0                	test   %eax,%eax
 308:	78 17                	js     321 <thread_join+0x2e>
 30a:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 30c:	83 ec 0c             	sub    $0xc,%esp
 30f:	ff 75 f4             	push   -0xc(%ebp)
 312:	e8 06 03 00 00       	call   61d <free>
  return x;
 317:	83 c4 10             	add    $0x10,%esp
}
 31a:	89 d8                	mov    %ebx,%eax
 31c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 31f:	c9                   	leave  
 320:	c3                   	ret    
    return -1;
 321:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 326:	eb f2                	jmp    31a <thread_join+0x27>

00000328 <lock_init>:

void lock_init(lock_t *spin){
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 334:	5d                   	pop    %ebp
 335:	c3                   	ret    

00000336 <lock_acquire>:

void lock_acquire(lock_t *spin){
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 33c:	b8 01 00 00 00       	mov    $0x1,%eax
 341:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 344:	85 c0                	test   %eax,%eax
 346:	75 f4                	jne    33c <lock_acquire+0x6>

}
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    

0000034a <lock_release>:

void lock_release(lock_t *spin){
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	8b 55 08             	mov    0x8(%ebp),%edx
 350:	b8 00 00 00 00       	mov    $0x0,%eax
 355:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35a:	b8 01 00 00 00       	mov    $0x1,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <exit>:
SYSCALL(exit)
 362:	b8 02 00 00 00       	mov    $0x2,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <wait>:
SYSCALL(wait)
 36a:	b8 03 00 00 00       	mov    $0x3,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <pipe>:
SYSCALL(pipe)
 372:	b8 04 00 00 00       	mov    $0x4,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <read>:
SYSCALL(read)
 37a:	b8 05 00 00 00       	mov    $0x5,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <write>:
SYSCALL(write)
 382:	b8 10 00 00 00       	mov    $0x10,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <close>:
SYSCALL(close)
 38a:	b8 15 00 00 00       	mov    $0x15,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <kill>:
SYSCALL(kill)
 392:	b8 06 00 00 00       	mov    $0x6,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <exec>:
SYSCALL(exec)
 39a:	b8 07 00 00 00       	mov    $0x7,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <open>:
SYSCALL(open)
 3a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <mknod>:
SYSCALL(mknod)
 3aa:	b8 11 00 00 00       	mov    $0x11,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <unlink>:
SYSCALL(unlink)
 3b2:	b8 12 00 00 00       	mov    $0x12,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <fstat>:
SYSCALL(fstat)
 3ba:	b8 08 00 00 00       	mov    $0x8,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <link>:
SYSCALL(link)
 3c2:	b8 13 00 00 00       	mov    $0x13,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <mkdir>:
SYSCALL(mkdir)
 3ca:	b8 14 00 00 00       	mov    $0x14,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <chdir>:
SYSCALL(chdir)
 3d2:	b8 09 00 00 00       	mov    $0x9,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <dup>:
SYSCALL(dup)
 3da:	b8 0a 00 00 00       	mov    $0xa,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <getpid>:
SYSCALL(getpid)
 3e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <sbrk>:
SYSCALL(sbrk)
 3ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <sleep>:
SYSCALL(sleep)
 3f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <uptime>:
SYSCALL(uptime)
 3fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <clone>:
SYSCALL(clone)
 402:	b8 16 00 00 00       	mov    $0x16,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <join>:
 40a:	b8 17 00 00 00       	mov    $0x17,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
 415:	83 ec 1c             	sub    $0x1c,%esp
 418:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 41b:	6a 01                	push   $0x1
 41d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 420:	52                   	push   %edx
 421:	50                   	push   %eax
 422:	e8 5b ff ff ff       	call   382 <write>
}
 427:	83 c4 10             	add    $0x10,%esp
 42a:	c9                   	leave  
 42b:	c3                   	ret    

0000042c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	57                   	push   %edi
 430:	56                   	push   %esi
 431:	53                   	push   %ebx
 432:	83 ec 2c             	sub    $0x2c,%esp
 435:	89 45 d0             	mov    %eax,-0x30(%ebp)
 438:	89 d0                	mov    %edx,%eax
 43a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 43c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 440:	0f 95 c1             	setne  %cl
 443:	c1 ea 1f             	shr    $0x1f,%edx
 446:	84 d1                	test   %dl,%cl
 448:	74 44                	je     48e <printint+0x62>
    neg = 1;
    x = -xx;
 44a:	f7 d8                	neg    %eax
 44c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 44e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 455:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 45a:	89 c8                	mov    %ecx,%eax
 45c:	ba 00 00 00 00       	mov    $0x0,%edx
 461:	f7 f6                	div    %esi
 463:	89 df                	mov    %ebx,%edi
 465:	83 c3 01             	add    $0x1,%ebx
 468:	0f b6 92 2c 08 00 00 	movzbl 0x82c(%edx),%edx
 46f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 473:	89 ca                	mov    %ecx,%edx
 475:	89 c1                	mov    %eax,%ecx
 477:	39 d6                	cmp    %edx,%esi
 479:	76 df                	jbe    45a <printint+0x2e>
  if(neg)
 47b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 47f:	74 31                	je     4b2 <printint+0x86>
    buf[i++] = '-';
 481:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 486:	8d 5f 02             	lea    0x2(%edi),%ebx
 489:	8b 75 d0             	mov    -0x30(%ebp),%esi
 48c:	eb 17                	jmp    4a5 <printint+0x79>
    x = xx;
 48e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 490:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 497:	eb bc                	jmp    455 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 499:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 49e:	89 f0                	mov    %esi,%eax
 4a0:	e8 6d ff ff ff       	call   412 <putc>
  while(--i >= 0)
 4a5:	83 eb 01             	sub    $0x1,%ebx
 4a8:	79 ef                	jns    499 <printint+0x6d>
}
 4aa:	83 c4 2c             	add    $0x2c,%esp
 4ad:	5b                   	pop    %ebx
 4ae:	5e                   	pop    %esi
 4af:	5f                   	pop    %edi
 4b0:	5d                   	pop    %ebp
 4b1:	c3                   	ret    
 4b2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b5:	eb ee                	jmp    4a5 <printint+0x79>

000004b7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b7:	55                   	push   %ebp
 4b8:	89 e5                	mov    %esp,%ebp
 4ba:	57                   	push   %edi
 4bb:	56                   	push   %esi
 4bc:	53                   	push   %ebx
 4bd:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4c0:	8d 45 10             	lea    0x10(%ebp),%eax
 4c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4c6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4cb:	bb 00 00 00 00       	mov    $0x0,%ebx
 4d0:	eb 14                	jmp    4e6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4d2:	89 fa                	mov    %edi,%edx
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
 4d7:	e8 36 ff ff ff       	call   412 <putc>
 4dc:	eb 05                	jmp    4e3 <printf+0x2c>
      }
    } else if(state == '%'){
 4de:	83 fe 25             	cmp    $0x25,%esi
 4e1:	74 25                	je     508 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4e3:	83 c3 01             	add    $0x1,%ebx
 4e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4ed:	84 c0                	test   %al,%al
 4ef:	0f 84 20 01 00 00    	je     615 <printf+0x15e>
    c = fmt[i] & 0xff;
 4f5:	0f be f8             	movsbl %al,%edi
 4f8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4fb:	85 f6                	test   %esi,%esi
 4fd:	75 df                	jne    4de <printf+0x27>
      if(c == '%'){
 4ff:	83 f8 25             	cmp    $0x25,%eax
 502:	75 ce                	jne    4d2 <printf+0x1b>
        state = '%';
 504:	89 c6                	mov    %eax,%esi
 506:	eb db                	jmp    4e3 <printf+0x2c>
      if(c == 'd'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	0f 84 cf 00 00 00    	je     5e0 <printf+0x129>
 511:	0f 8c dd 00 00 00    	jl     5f4 <printf+0x13d>
 517:	83 f8 78             	cmp    $0x78,%eax
 51a:	0f 8f d4 00 00 00    	jg     5f4 <printf+0x13d>
 520:	83 f8 63             	cmp    $0x63,%eax
 523:	0f 8c cb 00 00 00    	jl     5f4 <printf+0x13d>
 529:	83 e8 63             	sub    $0x63,%eax
 52c:	83 f8 15             	cmp    $0x15,%eax
 52f:	0f 87 bf 00 00 00    	ja     5f4 <printf+0x13d>
 535:	ff 24 85 d4 07 00 00 	jmp    *0x7d4(,%eax,4)
        printint(fd, *ap, 10, 1);
 53c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 53f:	8b 17                	mov    (%edi),%edx
 541:	83 ec 0c             	sub    $0xc,%esp
 544:	6a 01                	push   $0x1
 546:	b9 0a 00 00 00       	mov    $0xa,%ecx
 54b:	8b 45 08             	mov    0x8(%ebp),%eax
 54e:	e8 d9 fe ff ff       	call   42c <printint>
        ap++;
 553:	83 c7 04             	add    $0x4,%edi
 556:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 559:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 55c:	be 00 00 00 00       	mov    $0x0,%esi
 561:	eb 80                	jmp    4e3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 563:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 566:	8b 17                	mov    (%edi),%edx
 568:	83 ec 0c             	sub    $0xc,%esp
 56b:	6a 00                	push   $0x0
 56d:	b9 10 00 00 00       	mov    $0x10,%ecx
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	e8 b2 fe ff ff       	call   42c <printint>
        ap++;
 57a:	83 c7 04             	add    $0x4,%edi
 57d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 580:	83 c4 10             	add    $0x10,%esp
      state = 0;
 583:	be 00 00 00 00       	mov    $0x0,%esi
 588:	e9 56 ff ff ff       	jmp    4e3 <printf+0x2c>
        s = (char*)*ap;
 58d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 590:	8b 30                	mov    (%eax),%esi
        ap++;
 592:	83 c0 04             	add    $0x4,%eax
 595:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 598:	85 f6                	test   %esi,%esi
 59a:	75 15                	jne    5b1 <printf+0xfa>
          s = "(null)";
 59c:	be ca 07 00 00       	mov    $0x7ca,%esi
 5a1:	eb 0e                	jmp    5b1 <printf+0xfa>
          putc(fd, *s);
 5a3:	0f be d2             	movsbl %dl,%edx
 5a6:	8b 45 08             	mov    0x8(%ebp),%eax
 5a9:	e8 64 fe ff ff       	call   412 <putc>
          s++;
 5ae:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5b1:	0f b6 16             	movzbl (%esi),%edx
 5b4:	84 d2                	test   %dl,%dl
 5b6:	75 eb                	jne    5a3 <printf+0xec>
      state = 0;
 5b8:	be 00 00 00 00       	mov    $0x0,%esi
 5bd:	e9 21 ff ff ff       	jmp    4e3 <printf+0x2c>
        putc(fd, *ap);
 5c2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c5:	0f be 17             	movsbl (%edi),%edx
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
 5cb:	e8 42 fe ff ff       	call   412 <putc>
        ap++;
 5d0:	83 c7 04             	add    $0x4,%edi
 5d3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5d6:	be 00 00 00 00       	mov    $0x0,%esi
 5db:	e9 03 ff ff ff       	jmp    4e3 <printf+0x2c>
        putc(fd, c);
 5e0:	89 fa                	mov    %edi,%edx
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	e8 28 fe ff ff       	call   412 <putc>
      state = 0;
 5ea:	be 00 00 00 00       	mov    $0x0,%esi
 5ef:	e9 ef fe ff ff       	jmp    4e3 <printf+0x2c>
        putc(fd, '%');
 5f4:	ba 25 00 00 00       	mov    $0x25,%edx
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	e8 11 fe ff ff       	call   412 <putc>
        putc(fd, c);
 601:	89 fa                	mov    %edi,%edx
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	e8 07 fe ff ff       	call   412 <putc>
      state = 0;
 60b:	be 00 00 00 00       	mov    $0x0,%esi
 610:	e9 ce fe ff ff       	jmp    4e3 <printf+0x2c>
    }
  }
}
 615:	8d 65 f4             	lea    -0xc(%ebp),%esp
 618:	5b                   	pop    %ebx
 619:	5e                   	pop    %esi
 61a:	5f                   	pop    %edi
 61b:	5d                   	pop    %ebp
 61c:	c3                   	ret    

0000061d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 61d:	55                   	push   %ebp
 61e:	89 e5                	mov    %esp,%ebp
 620:	57                   	push   %edi
 621:	56                   	push   %esi
 622:	53                   	push   %ebx
 623:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 626:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 629:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 62e:	eb 02                	jmp    632 <free+0x15>
 630:	89 d0                	mov    %edx,%eax
 632:	39 c8                	cmp    %ecx,%eax
 634:	73 04                	jae    63a <free+0x1d>
 636:	39 08                	cmp    %ecx,(%eax)
 638:	77 12                	ja     64c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 63a:	8b 10                	mov    (%eax),%edx
 63c:	39 c2                	cmp    %eax,%edx
 63e:	77 f0                	ja     630 <free+0x13>
 640:	39 c8                	cmp    %ecx,%eax
 642:	72 08                	jb     64c <free+0x2f>
 644:	39 ca                	cmp    %ecx,%edx
 646:	77 04                	ja     64c <free+0x2f>
 648:	89 d0                	mov    %edx,%eax
 64a:	eb e6                	jmp    632 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 64c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 64f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 652:	8b 10                	mov    (%eax),%edx
 654:	39 d7                	cmp    %edx,%edi
 656:	74 19                	je     671 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 658:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 65b:	8b 50 04             	mov    0x4(%eax),%edx
 65e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 661:	39 ce                	cmp    %ecx,%esi
 663:	74 1b                	je     680 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 665:	89 08                	mov    %ecx,(%eax)
  freep = p;
 667:	a3 7c 0b 00 00       	mov    %eax,0xb7c
}
 66c:	5b                   	pop    %ebx
 66d:	5e                   	pop    %esi
 66e:	5f                   	pop    %edi
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 671:	03 72 04             	add    0x4(%edx),%esi
 674:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 677:	8b 10                	mov    (%eax),%edx
 679:	8b 12                	mov    (%edx),%edx
 67b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 67e:	eb db                	jmp    65b <free+0x3e>
    p->s.size += bp->s.size;
 680:	03 53 fc             	add    -0x4(%ebx),%edx
 683:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 686:	8b 53 f8             	mov    -0x8(%ebx),%edx
 689:	89 10                	mov    %edx,(%eax)
 68b:	eb da                	jmp    667 <free+0x4a>

0000068d <morecore>:

static Header*
morecore(uint nu)
{
 68d:	55                   	push   %ebp
 68e:	89 e5                	mov    %esp,%ebp
 690:	53                   	push   %ebx
 691:	83 ec 04             	sub    $0x4,%esp
 694:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 696:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 69b:	77 05                	ja     6a2 <morecore+0x15>
    nu = 4096;
 69d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6a2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6a9:	83 ec 0c             	sub    $0xc,%esp
 6ac:	50                   	push   %eax
 6ad:	e8 38 fd ff ff       	call   3ea <sbrk>
  if(p == (char*)-1)
 6b2:	83 c4 10             	add    $0x10,%esp
 6b5:	83 f8 ff             	cmp    $0xffffffff,%eax
 6b8:	74 1c                	je     6d6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6ba:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6bd:	83 c0 08             	add    $0x8,%eax
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	50                   	push   %eax
 6c4:	e8 54 ff ff ff       	call   61d <free>
  return freep;
 6c9:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 6ce:	83 c4 10             	add    $0x10,%esp
}
 6d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d4:	c9                   	leave  
 6d5:	c3                   	ret    
    return 0;
 6d6:	b8 00 00 00 00       	mov    $0x0,%eax
 6db:	eb f4                	jmp    6d1 <morecore+0x44>

000006dd <malloc>:

void*
malloc(uint nbytes)
{
 6dd:	55                   	push   %ebp
 6de:	89 e5                	mov    %esp,%ebp
 6e0:	53                   	push   %ebx
 6e1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e4:	8b 45 08             	mov    0x8(%ebp),%eax
 6e7:	8d 58 07             	lea    0x7(%eax),%ebx
 6ea:	c1 eb 03             	shr    $0x3,%ebx
 6ed:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6f0:	8b 0d 7c 0b 00 00    	mov    0xb7c,%ecx
 6f6:	85 c9                	test   %ecx,%ecx
 6f8:	74 04                	je     6fe <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6fa:	8b 01                	mov    (%ecx),%eax
 6fc:	eb 4a                	jmp    748 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6fe:	c7 05 7c 0b 00 00 80 	movl   $0xb80,0xb7c
 705:	0b 00 00 
 708:	c7 05 80 0b 00 00 80 	movl   $0xb80,0xb80
 70f:	0b 00 00 
    base.s.size = 0;
 712:	c7 05 84 0b 00 00 00 	movl   $0x0,0xb84
 719:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 71c:	b9 80 0b 00 00       	mov    $0xb80,%ecx
 721:	eb d7                	jmp    6fa <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 723:	74 19                	je     73e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 725:	29 da                	sub    %ebx,%edx
 727:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 72a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 72d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 730:	89 0d 7c 0b 00 00    	mov    %ecx,0xb7c
      return (void*)(p + 1);
 736:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 739:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 73c:	c9                   	leave  
 73d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 73e:	8b 10                	mov    (%eax),%edx
 740:	89 11                	mov    %edx,(%ecx)
 742:	eb ec                	jmp    730 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 744:	89 c1                	mov    %eax,%ecx
 746:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 748:	8b 50 04             	mov    0x4(%eax),%edx
 74b:	39 da                	cmp    %ebx,%edx
 74d:	73 d4                	jae    723 <malloc+0x46>
    if(p == freep)
 74f:	39 05 7c 0b 00 00    	cmp    %eax,0xb7c
 755:	75 ed                	jne    744 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 757:	89 d8                	mov    %ebx,%eax
 759:	e8 2f ff ff ff       	call   68d <morecore>
 75e:	85 c0                	test   %eax,%eax
 760:	75 e2                	jne    744 <malloc+0x67>
 762:	eb d5                	jmp    739 <malloc+0x5c>
