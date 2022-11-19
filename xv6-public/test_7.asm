
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
  11:	e8 cf 03 00 00       	call   3e5 <getpid>
  16:	a3 78 0b 00 00       	mov    %eax,0xb78

   int fork_pid = fork();
  1b:	e8 3d 03 00 00       	call   35d <fork>
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
  2d:	e8 db 03 00 00       	call   40d <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 68 07 00 00       	push   $0x768
  45:	68 71 07 00 00       	push   $0x771
  4a:	6a 01                	push   $0x1
  4c:	e8 69 04 00 00       	call   4ba <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 a7 07 00 00       	push   $0x7a7
  59:	68 86 07 00 00       	push   $0x786
  5e:	6a 01                	push   $0x1
  60:	e8 55 04 00 00       	call   4ba <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 9a 07 00 00       	push   $0x79a
  6d:	6a 01                	push   $0x1
  6f:	e8 46 04 00 00       	call   4ba <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 78 0b 00 00    	push   0xb78
  7d:	e8 13 03 00 00       	call   395 <kill>
  82:	e8 de 02 00 00       	call   365 <exit>
     exit();
  87:	e8 d9 02 00 00       	call   365 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 68 07 00 00       	push   $0x768
  93:	68 71 07 00 00       	push   $0x771
  98:	6a 01                	push   $0x1
  9a:	e8 1b 04 00 00       	call   4ba <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 79 07 00 00       	push   $0x779
  a7:	68 86 07 00 00       	push   $0x786
  ac:	6a 01                	push   $0x1
  ae:	e8 07 04 00 00       	call   4ba <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 9a 07 00 00       	push   $0x79a
  bb:	6a 01                	push   $0x1
  bd:	e8 f8 03 00 00       	call   4ba <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 78 0b 00 00    	push   0xb78
  cb:	e8 c5 02 00 00       	call   395 <kill>
  d0:	e8 90 02 00 00       	call   365 <exit>

   assert(wait() > 0);
  d5:	e8 93 02 00 00       	call   36d <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 c1 07 00 00       	push   $0x7c1
  e6:	6a 01                	push   $0x1
  e8:	e8 cd 03 00 00       	call   4ba <printf>
   exit();
  ed:	e8 73 02 00 00       	call   365 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 68 07 00 00       	push   $0x768
  f9:	68 71 07 00 00       	push   $0x771
  fe:	6a 01                	push   $0x1
 100:	e8 b5 03 00 00       	call   4ba <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 b6 07 00 00       	push   $0x7b6
 10d:	68 86 07 00 00       	push   $0x786
 112:	6a 01                	push   $0x1
 114:	e8 a1 03 00 00       	call   4ba <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 9a 07 00 00       	push   $0x79a
 121:	6a 01                	push   $0x1
 123:	e8 92 03 00 00       	call   4ba <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 78 0b 00 00    	push   0xb78
 131:	e8 5f 02 00 00       	call   395 <kill>
 136:	e8 2a 02 00 00       	call   365 <exit>

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
 201:	e8 77 01 00 00       	call   37d <read>
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
 23f:	e8 61 01 00 00       	call   3a5 <open>
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
 254:	e8 64 01 00 00       	call   3bd <fstat>
 259:	89 c6                	mov    %eax,%esi
  close(fd);
 25b:	89 1c 24             	mov    %ebx,(%esp)
 25e:	e8 2a 01 00 00       	call   38d <close>
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

  void* stack = malloc(2 * PGSIZE);
 2d8:	68 00 20 00 00       	push   $0x2000
 2dd:	e8 fe 03 00 00       	call   6e0 <malloc>
  if ((uint)stack%PGSIZE){
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	a9 ff 0f 00 00       	test   $0xfff,%eax
 2ea:	74 0a                	je     2f6 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 2ec:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 2f1:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 2f6:	50                   	push   %eax
 2f7:	ff 75 10             	push   0x10(%ebp)
 2fa:	ff 75 0c             	push   0xc(%ebp)
 2fd:	ff 75 08             	push   0x8(%ebp)
 300:	e8 00 01 00 00       	call   405 <clone>
}
 305:	c9                   	leave  
 306:	c3                   	ret    

00000307 <thread_join>:

int thread_join(){
 307:	55                   	push   %ebp
 308:	89 e5                	mov    %esp,%ebp
 30a:	53                   	push   %ebx
 30b:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 30e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 311:	50                   	push   %eax
 312:	e8 f6 00 00 00       	call   40d <join>
 317:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 319:	83 c4 04             	add    $0x4,%esp
 31c:	ff 75 f4             	push   -0xc(%ebp)
 31f:	e8 fc 02 00 00       	call   620 <free>
  return x;
}
 324:	89 d8                	mov    %ebx,%eax
 326:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 329:	c9                   	leave  
 32a:	c3                   	ret    

0000032b <lock_init>:

void lock_init(lock_t *spin){
 32b:	55                   	push   %ebp
 32c:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 337:	5d                   	pop    %ebp
 338:	c3                   	ret    

00000339 <lock_acquire>:

void lock_acquire(lock_t *spin){
 339:	55                   	push   %ebp
 33a:	89 e5                	mov    %esp,%ebp
 33c:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 33f:	b8 01 00 00 00       	mov    $0x1,%eax
 344:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 347:	85 c0                	test   %eax,%eax
 349:	75 f4                	jne    33f <lock_acquire+0x6>

}
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    

0000034d <lock_release>:

void lock_release(lock_t *spin){
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	8b 55 08             	mov    0x8(%ebp),%edx
 353:	b8 00 00 00 00       	mov    $0x0,%eax
 358:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    

0000035d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35d:	b8 01 00 00 00       	mov    $0x1,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <exit>:
SYSCALL(exit)
 365:	b8 02 00 00 00       	mov    $0x2,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <wait>:
SYSCALL(wait)
 36d:	b8 03 00 00 00       	mov    $0x3,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <pipe>:
SYSCALL(pipe)
 375:	b8 04 00 00 00       	mov    $0x4,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <read>:
SYSCALL(read)
 37d:	b8 05 00 00 00       	mov    $0x5,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <write>:
SYSCALL(write)
 385:	b8 10 00 00 00       	mov    $0x10,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <close>:
SYSCALL(close)
 38d:	b8 15 00 00 00       	mov    $0x15,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <kill>:
SYSCALL(kill)
 395:	b8 06 00 00 00       	mov    $0x6,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <exec>:
SYSCALL(exec)
 39d:	b8 07 00 00 00       	mov    $0x7,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <open>:
SYSCALL(open)
 3a5:	b8 0f 00 00 00       	mov    $0xf,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <mknod>:
SYSCALL(mknod)
 3ad:	b8 11 00 00 00       	mov    $0x11,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <unlink>:
SYSCALL(unlink)
 3b5:	b8 12 00 00 00       	mov    $0x12,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <fstat>:
SYSCALL(fstat)
 3bd:	b8 08 00 00 00       	mov    $0x8,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <link>:
SYSCALL(link)
 3c5:	b8 13 00 00 00       	mov    $0x13,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <mkdir>:
SYSCALL(mkdir)
 3cd:	b8 14 00 00 00       	mov    $0x14,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <chdir>:
SYSCALL(chdir)
 3d5:	b8 09 00 00 00       	mov    $0x9,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <dup>:
SYSCALL(dup)
 3dd:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <getpid>:
SYSCALL(getpid)
 3e5:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <sbrk>:
SYSCALL(sbrk)
 3ed:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <sleep>:
SYSCALL(sleep)
 3f5:	b8 0d 00 00 00       	mov    $0xd,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <uptime>:
SYSCALL(uptime)
 3fd:	b8 0e 00 00 00       	mov    $0xe,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <clone>:
SYSCALL(clone)
 405:	b8 16 00 00 00       	mov    $0x16,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <join>:
 40d:	b8 17 00 00 00       	mov    $0x17,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	83 ec 1c             	sub    $0x1c,%esp
 41b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 41e:	6a 01                	push   $0x1
 420:	8d 55 f4             	lea    -0xc(%ebp),%edx
 423:	52                   	push   %edx
 424:	50                   	push   %eax
 425:	e8 5b ff ff ff       	call   385 <write>
}
 42a:	83 c4 10             	add    $0x10,%esp
 42d:	c9                   	leave  
 42e:	c3                   	ret    

0000042f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	57                   	push   %edi
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	83 ec 2c             	sub    $0x2c,%esp
 438:	89 45 d0             	mov    %eax,-0x30(%ebp)
 43b:	89 d0                	mov    %edx,%eax
 43d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 43f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 443:	0f 95 c1             	setne  %cl
 446:	c1 ea 1f             	shr    $0x1f,%edx
 449:	84 d1                	test   %dl,%cl
 44b:	74 44                	je     491 <printint+0x62>
    neg = 1;
    x = -xx;
 44d:	f7 d8                	neg    %eax
 44f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 451:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 458:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 45d:	89 c8                	mov    %ecx,%eax
 45f:	ba 00 00 00 00       	mov    $0x0,%edx
 464:	f7 f6                	div    %esi
 466:	89 df                	mov    %ebx,%edi
 468:	83 c3 01             	add    $0x1,%ebx
 46b:	0f b6 92 30 08 00 00 	movzbl 0x830(%edx),%edx
 472:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 476:	89 ca                	mov    %ecx,%edx
 478:	89 c1                	mov    %eax,%ecx
 47a:	39 d6                	cmp    %edx,%esi
 47c:	76 df                	jbe    45d <printint+0x2e>
  if(neg)
 47e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 482:	74 31                	je     4b5 <printint+0x86>
    buf[i++] = '-';
 484:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 489:	8d 5f 02             	lea    0x2(%edi),%ebx
 48c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 48f:	eb 17                	jmp    4a8 <printint+0x79>
    x = xx;
 491:	89 c1                	mov    %eax,%ecx
  neg = 0;
 493:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 49a:	eb bc                	jmp    458 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 49c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4a1:	89 f0                	mov    %esi,%eax
 4a3:	e8 6d ff ff ff       	call   415 <putc>
  while(--i >= 0)
 4a8:	83 eb 01             	sub    $0x1,%ebx
 4ab:	79 ef                	jns    49c <printint+0x6d>
}
 4ad:	83 c4 2c             	add    $0x2c,%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5f                   	pop    %edi
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    
 4b5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b8:	eb ee                	jmp    4a8 <printint+0x79>

000004ba <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	57                   	push   %edi
 4be:	56                   	push   %esi
 4bf:	53                   	push   %ebx
 4c0:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4c3:	8d 45 10             	lea    0x10(%ebp),%eax
 4c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4c9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4ce:	bb 00 00 00 00       	mov    $0x0,%ebx
 4d3:	eb 14                	jmp    4e9 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4d5:	89 fa                	mov    %edi,%edx
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	e8 36 ff ff ff       	call   415 <putc>
 4df:	eb 05                	jmp    4e6 <printf+0x2c>
      }
    } else if(state == '%'){
 4e1:	83 fe 25             	cmp    $0x25,%esi
 4e4:	74 25                	je     50b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4e6:	83 c3 01             	add    $0x1,%ebx
 4e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ec:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4f0:	84 c0                	test   %al,%al
 4f2:	0f 84 20 01 00 00    	je     618 <printf+0x15e>
    c = fmt[i] & 0xff;
 4f8:	0f be f8             	movsbl %al,%edi
 4fb:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4fe:	85 f6                	test   %esi,%esi
 500:	75 df                	jne    4e1 <printf+0x27>
      if(c == '%'){
 502:	83 f8 25             	cmp    $0x25,%eax
 505:	75 ce                	jne    4d5 <printf+0x1b>
        state = '%';
 507:	89 c6                	mov    %eax,%esi
 509:	eb db                	jmp    4e6 <printf+0x2c>
      if(c == 'd'){
 50b:	83 f8 25             	cmp    $0x25,%eax
 50e:	0f 84 cf 00 00 00    	je     5e3 <printf+0x129>
 514:	0f 8c dd 00 00 00    	jl     5f7 <printf+0x13d>
 51a:	83 f8 78             	cmp    $0x78,%eax
 51d:	0f 8f d4 00 00 00    	jg     5f7 <printf+0x13d>
 523:	83 f8 63             	cmp    $0x63,%eax
 526:	0f 8c cb 00 00 00    	jl     5f7 <printf+0x13d>
 52c:	83 e8 63             	sub    $0x63,%eax
 52f:	83 f8 15             	cmp    $0x15,%eax
 532:	0f 87 bf 00 00 00    	ja     5f7 <printf+0x13d>
 538:	ff 24 85 d8 07 00 00 	jmp    *0x7d8(,%eax,4)
        printint(fd, *ap, 10, 1);
 53f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 542:	8b 17                	mov    (%edi),%edx
 544:	83 ec 0c             	sub    $0xc,%esp
 547:	6a 01                	push   $0x1
 549:	b9 0a 00 00 00       	mov    $0xa,%ecx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	e8 d9 fe ff ff       	call   42f <printint>
        ap++;
 556:	83 c7 04             	add    $0x4,%edi
 559:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 55c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 55f:	be 00 00 00 00       	mov    $0x0,%esi
 564:	eb 80                	jmp    4e6 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 566:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 569:	8b 17                	mov    (%edi),%edx
 56b:	83 ec 0c             	sub    $0xc,%esp
 56e:	6a 00                	push   $0x0
 570:	b9 10 00 00 00       	mov    $0x10,%ecx
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	e8 b2 fe ff ff       	call   42f <printint>
        ap++;
 57d:	83 c7 04             	add    $0x4,%edi
 580:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 583:	83 c4 10             	add    $0x10,%esp
      state = 0;
 586:	be 00 00 00 00       	mov    $0x0,%esi
 58b:	e9 56 ff ff ff       	jmp    4e6 <printf+0x2c>
        s = (char*)*ap;
 590:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 593:	8b 30                	mov    (%eax),%esi
        ap++;
 595:	83 c0 04             	add    $0x4,%eax
 598:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 59b:	85 f6                	test   %esi,%esi
 59d:	75 15                	jne    5b4 <printf+0xfa>
          s = "(null)";
 59f:	be ce 07 00 00       	mov    $0x7ce,%esi
 5a4:	eb 0e                	jmp    5b4 <printf+0xfa>
          putc(fd, *s);
 5a6:	0f be d2             	movsbl %dl,%edx
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	e8 64 fe ff ff       	call   415 <putc>
          s++;
 5b1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5b4:	0f b6 16             	movzbl (%esi),%edx
 5b7:	84 d2                	test   %dl,%dl
 5b9:	75 eb                	jne    5a6 <printf+0xec>
      state = 0;
 5bb:	be 00 00 00 00       	mov    $0x0,%esi
 5c0:	e9 21 ff ff ff       	jmp    4e6 <printf+0x2c>
        putc(fd, *ap);
 5c5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c8:	0f be 17             	movsbl (%edi),%edx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 42 fe ff ff       	call   415 <putc>
        ap++;
 5d3:	83 c7 04             	add    $0x4,%edi
 5d6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5d9:	be 00 00 00 00       	mov    $0x0,%esi
 5de:	e9 03 ff ff ff       	jmp    4e6 <printf+0x2c>
        putc(fd, c);
 5e3:	89 fa                	mov    %edi,%edx
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	e8 28 fe ff ff       	call   415 <putc>
      state = 0;
 5ed:	be 00 00 00 00       	mov    $0x0,%esi
 5f2:	e9 ef fe ff ff       	jmp    4e6 <printf+0x2c>
        putc(fd, '%');
 5f7:	ba 25 00 00 00       	mov    $0x25,%edx
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	e8 11 fe ff ff       	call   415 <putc>
        putc(fd, c);
 604:	89 fa                	mov    %edi,%edx
 606:	8b 45 08             	mov    0x8(%ebp),%eax
 609:	e8 07 fe ff ff       	call   415 <putc>
      state = 0;
 60e:	be 00 00 00 00       	mov    $0x0,%esi
 613:	e9 ce fe ff ff       	jmp    4e6 <printf+0x2c>
    }
  }
}
 618:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61b:	5b                   	pop    %ebx
 61c:	5e                   	pop    %esi
 61d:	5f                   	pop    %edi
 61e:	5d                   	pop    %ebp
 61f:	c3                   	ret    

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 629:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62c:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 631:	eb 02                	jmp    635 <free+0x15>
 633:	89 d0                	mov    %edx,%eax
 635:	39 c8                	cmp    %ecx,%eax
 637:	73 04                	jae    63d <free+0x1d>
 639:	39 08                	cmp    %ecx,(%eax)
 63b:	77 12                	ja     64f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 63d:	8b 10                	mov    (%eax),%edx
 63f:	39 c2                	cmp    %eax,%edx
 641:	77 f0                	ja     633 <free+0x13>
 643:	39 c8                	cmp    %ecx,%eax
 645:	72 08                	jb     64f <free+0x2f>
 647:	39 ca                	cmp    %ecx,%edx
 649:	77 04                	ja     64f <free+0x2f>
 64b:	89 d0                	mov    %edx,%eax
 64d:	eb e6                	jmp    635 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 64f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 652:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 655:	8b 10                	mov    (%eax),%edx
 657:	39 d7                	cmp    %edx,%edi
 659:	74 19                	je     674 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 65b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 65e:	8b 50 04             	mov    0x4(%eax),%edx
 661:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 664:	39 ce                	cmp    %ecx,%esi
 666:	74 1b                	je     683 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 668:	89 08                	mov    %ecx,(%eax)
  freep = p;
 66a:	a3 7c 0b 00 00       	mov    %eax,0xb7c
}
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 674:	03 72 04             	add    0x4(%edx),%esi
 677:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 67a:	8b 10                	mov    (%eax),%edx
 67c:	8b 12                	mov    (%edx),%edx
 67e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 681:	eb db                	jmp    65e <free+0x3e>
    p->s.size += bp->s.size;
 683:	03 53 fc             	add    -0x4(%ebx),%edx
 686:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 689:	8b 53 f8             	mov    -0x8(%ebx),%edx
 68c:	89 10                	mov    %edx,(%eax)
 68e:	eb da                	jmp    66a <free+0x4a>

00000690 <morecore>:

static Header*
morecore(uint nu)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	53                   	push   %ebx
 694:	83 ec 04             	sub    $0x4,%esp
 697:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 699:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 69e:	77 05                	ja     6a5 <morecore+0x15>
    nu = 4096;
 6a0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6a5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6ac:	83 ec 0c             	sub    $0xc,%esp
 6af:	50                   	push   %eax
 6b0:	e8 38 fd ff ff       	call   3ed <sbrk>
  if(p == (char*)-1)
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	83 f8 ff             	cmp    $0xffffffff,%eax
 6bb:	74 1c                	je     6d9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6bd:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c0:	83 c0 08             	add    $0x8,%eax
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	50                   	push   %eax
 6c7:	e8 54 ff ff ff       	call   620 <free>
  return freep;
 6cc:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 6d1:	83 c4 10             	add    $0x10,%esp
}
 6d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d7:	c9                   	leave  
 6d8:	c3                   	ret    
    return 0;
 6d9:	b8 00 00 00 00       	mov    $0x0,%eax
 6de:	eb f4                	jmp    6d4 <morecore+0x44>

000006e0 <malloc>:

void*
malloc(uint nbytes)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	53                   	push   %ebx
 6e4:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	8d 58 07             	lea    0x7(%eax),%ebx
 6ed:	c1 eb 03             	shr    $0x3,%ebx
 6f0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6f3:	8b 0d 7c 0b 00 00    	mov    0xb7c,%ecx
 6f9:	85 c9                	test   %ecx,%ecx
 6fb:	74 04                	je     701 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6fd:	8b 01                	mov    (%ecx),%eax
 6ff:	eb 4a                	jmp    74b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 701:	c7 05 7c 0b 00 00 80 	movl   $0xb80,0xb7c
 708:	0b 00 00 
 70b:	c7 05 80 0b 00 00 80 	movl   $0xb80,0xb80
 712:	0b 00 00 
    base.s.size = 0;
 715:	c7 05 84 0b 00 00 00 	movl   $0x0,0xb84
 71c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 71f:	b9 80 0b 00 00       	mov    $0xb80,%ecx
 724:	eb d7                	jmp    6fd <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 726:	74 19                	je     741 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 728:	29 da                	sub    %ebx,%edx
 72a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 72d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 730:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 733:	89 0d 7c 0b 00 00    	mov    %ecx,0xb7c
      return (void*)(p + 1);
 739:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 73c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 73f:	c9                   	leave  
 740:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 741:	8b 10                	mov    (%eax),%edx
 743:	89 11                	mov    %edx,(%ecx)
 745:	eb ec                	jmp    733 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 747:	89 c1                	mov    %eax,%ecx
 749:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 74b:	8b 50 04             	mov    0x4(%eax),%edx
 74e:	39 da                	cmp    %ebx,%edx
 750:	73 d4                	jae    726 <malloc+0x46>
    if(p == freep)
 752:	39 05 7c 0b 00 00    	cmp    %eax,0xb7c
 758:	75 ed                	jne    747 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 75a:	89 d8                	mov    %ebx,%eax
 75c:	e8 2f ff ff ff       	call   690 <morecore>
 761:	85 c0                	test   %eax,%eax
 763:	75 e2                	jne    747 <malloc+0x67>
 765:	eb d5                	jmp    73c <malloc+0x5c>
