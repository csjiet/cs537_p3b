
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 0c 07 00 00       	push   $0x70c
  19:	e8 29 03 00 00       	call   347 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 50 03 00 00       	call   37f <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 44 03 00 00       	call   37f <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 0c 07 00 00       	push   $0x70c
  4c:	e8 fe 02 00 00       	call   34f <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 0c 07 00 00       	push   $0x70c
  5b:	e8 e7 02 00 00       	call   347 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 27 07 00 00       	push   $0x727
  6d:	6a 01                	push   $0x1
  6f:	e8 e8 03 00 00       	call   45c <printf>
      exit();
  74:	e8 8e 02 00 00       	call   307 <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 53 07 00 00       	push   $0x753
  81:	6a 01                	push   $0x1
  83:	e8 d4 03 00 00       	call   45c <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 7f 02 00 00       	call   30f <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 14 07 00 00       	push   $0x714
  a0:	6a 01                	push   $0x1
  a2:	e8 b5 03 00 00       	call   45c <printf>
    pid = fork();
  a7:	e8 53 02 00 00       	call   2ff <fork>
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 04 0b 00 00       	push   $0xb04
  bf:	68 3a 07 00 00       	push   $0x73a
  c4:	e8 76 02 00 00       	call   33f <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 3d 07 00 00       	push   $0x73d
  d1:	6a 01                	push   $0x1
  d3:	e8 84 03 00 00       	call   45c <printf>
      exit();
  d8:	e8 2a 02 00 00       	call   307 <exit>

000000dd <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	56                   	push   %esi
  e1:	53                   	push   %ebx
  e2:	8b 75 08             	mov    0x8(%ebp),%esi
  e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e8:	89 f0                	mov    %esi,%eax
  ea:	89 d1                	mov    %edx,%ecx
  ec:	83 c2 01             	add    $0x1,%edx
  ef:	89 c3                	mov    %eax,%ebx
  f1:	83 c0 01             	add    $0x1,%eax
  f4:	0f b6 09             	movzbl (%ecx),%ecx
  f7:	88 0b                	mov    %cl,(%ebx)
  f9:	84 c9                	test   %cl,%cl
  fb:	75 ed                	jne    ea <strcpy+0xd>
    ;
  return os;
}
  fd:	89 f0                	mov    %esi,%eax
  ff:	5b                   	pop    %ebx
 100:	5e                   	pop    %esi
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    

00000103 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
 109:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 10c:	eb 06                	jmp    114 <strcmp+0x11>
    p++, q++;
 10e:	83 c1 01             	add    $0x1,%ecx
 111:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 114:	0f b6 01             	movzbl (%ecx),%eax
 117:	84 c0                	test   %al,%al
 119:	74 04                	je     11f <strcmp+0x1c>
 11b:	3a 02                	cmp    (%edx),%al
 11d:	74 ef                	je     10e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 11f:	0f b6 c0             	movzbl %al,%eax
 122:	0f b6 12             	movzbl (%edx),%edx
 125:	29 d0                	sub    %edx,%eax
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    

00000129 <strlen>:

uint
strlen(const char *s)
{
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 12f:	b8 00 00 00 00       	mov    $0x0,%eax
 134:	eb 03                	jmp    139 <strlen+0x10>
 136:	83 c0 01             	add    $0x1,%eax
 139:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 13d:	75 f7                	jne    136 <strlen+0xd>
    ;
  return n;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    

00000141 <memset>:

void*
memset(void *dst, int c, uint n)
{
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	57                   	push   %edi
 145:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 148:	89 d7                	mov    %edx,%edi
 14a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14d:	8b 45 0c             	mov    0xc(%ebp),%eax
 150:	fc                   	cld    
 151:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 153:	89 d0                	mov    %edx,%eax
 155:	8b 7d fc             	mov    -0x4(%ebp),%edi
 158:	c9                   	leave  
 159:	c3                   	ret    

0000015a <strchr>:

char*
strchr(const char *s, char c)
{
 15a:	55                   	push   %ebp
 15b:	89 e5                	mov    %esp,%ebp
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 164:	eb 03                	jmp    169 <strchr+0xf>
 166:	83 c0 01             	add    $0x1,%eax
 169:	0f b6 10             	movzbl (%eax),%edx
 16c:	84 d2                	test   %dl,%dl
 16e:	74 06                	je     176 <strchr+0x1c>
    if(*s == c)
 170:	38 ca                	cmp    %cl,%dl
 172:	75 f2                	jne    166 <strchr+0xc>
 174:	eb 05                	jmp    17b <strchr+0x21>
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	57                   	push   %edi
 181:	56                   	push   %esi
 182:	53                   	push   %ebx
 183:	83 ec 1c             	sub    $0x1c,%esp
 186:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 189:	bb 00 00 00 00       	mov    $0x0,%ebx
 18e:	89 de                	mov    %ebx,%esi
 190:	83 c3 01             	add    $0x1,%ebx
 193:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 196:	7d 2e                	jge    1c6 <gets+0x49>
    cc = read(0, &c, 1);
 198:	83 ec 04             	sub    $0x4,%esp
 19b:	6a 01                	push   $0x1
 19d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	6a 00                	push   $0x0
 1a3:	e8 77 01 00 00       	call   31f <read>
    if(cc < 1)
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	85 c0                	test   %eax,%eax
 1ad:	7e 17                	jle    1c6 <gets+0x49>
      break;
    buf[i++] = c;
 1af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1b6:	3c 0a                	cmp    $0xa,%al
 1b8:	0f 94 c2             	sete   %dl
 1bb:	3c 0d                	cmp    $0xd,%al
 1bd:	0f 94 c0             	sete   %al
 1c0:	08 c2                	or     %al,%dl
 1c2:	74 ca                	je     18e <gets+0x11>
    buf[i++] = c;
 1c4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1c6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1ca:	89 f8                	mov    %edi,%eax
 1cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cf:	5b                   	pop    %ebx
 1d0:	5e                   	pop    %esi
 1d1:	5f                   	pop    %edi
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	6a 00                	push   $0x0
 1de:	ff 75 08             	push   0x8(%ebp)
 1e1:	e8 61 01 00 00       	call   347 <open>
  if(fd < 0)
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	85 c0                	test   %eax,%eax
 1eb:	78 24                	js     211 <stat+0x3d>
 1ed:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1ef:	83 ec 08             	sub    $0x8,%esp
 1f2:	ff 75 0c             	push   0xc(%ebp)
 1f5:	50                   	push   %eax
 1f6:	e8 64 01 00 00       	call   35f <fstat>
 1fb:	89 c6                	mov    %eax,%esi
  close(fd);
 1fd:	89 1c 24             	mov    %ebx,(%esp)
 200:	e8 2a 01 00 00       	call   32f <close>
  return r;
 205:	83 c4 10             	add    $0x10,%esp
}
 208:	89 f0                	mov    %esi,%eax
 20a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20d:	5b                   	pop    %ebx
 20e:	5e                   	pop    %esi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
    return -1;
 211:	be ff ff ff ff       	mov    $0xffffffff,%esi
 216:	eb f0                	jmp    208 <stat+0x34>

00000218 <atoi>:

int
atoi(const char *s)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	53                   	push   %ebx
 21c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 21f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 224:	eb 10                	jmp    236 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 226:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 229:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 22c:	83 c1 01             	add    $0x1,%ecx
 22f:	0f be c0             	movsbl %al,%eax
 232:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 236:	0f b6 01             	movzbl (%ecx),%eax
 239:	8d 58 d0             	lea    -0x30(%eax),%ebx
 23c:	80 fb 09             	cmp    $0x9,%bl
 23f:	76 e5                	jbe    226 <atoi+0xe>
  return n;
}
 241:	89 d0                	mov    %edx,%eax
 243:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 246:	c9                   	leave  
 247:	c3                   	ret    

00000248 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	56                   	push   %esi
 24c:	53                   	push   %ebx
 24d:	8b 75 08             	mov    0x8(%ebp),%esi
 250:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 253:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 256:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 258:	eb 0d                	jmp    267 <memmove+0x1f>
    *dst++ = *src++;
 25a:	0f b6 01             	movzbl (%ecx),%eax
 25d:	88 02                	mov    %al,(%edx)
 25f:	8d 49 01             	lea    0x1(%ecx),%ecx
 262:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 265:	89 d8                	mov    %ebx,%eax
 267:	8d 58 ff             	lea    -0x1(%eax),%ebx
 26a:	85 c0                	test   %eax,%eax
 26c:	7f ec                	jg     25a <memmove+0x12>
  return vdst;
}
 26e:	89 f0                	mov    %esi,%eax
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    

00000274 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 27a:	68 00 20 00 00       	push   $0x2000
 27f:	e8 fe 03 00 00       	call   682 <malloc>
  if ((uint)stack%PGSIZE){
 284:	83 c4 10             	add    $0x10,%esp
 287:	a9 ff 0f 00 00       	test   $0xfff,%eax
 28c:	74 0a                	je     298 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 28e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 293:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 298:	50                   	push   %eax
 299:	ff 75 10             	push   0x10(%ebp)
 29c:	ff 75 0c             	push   0xc(%ebp)
 29f:	ff 75 08             	push   0x8(%ebp)
 2a2:	e8 00 01 00 00       	call   3a7 <clone>
}
 2a7:	c9                   	leave  
 2a8:	c3                   	ret    

000002a9 <thread_join>:

int thread_join(){
 2a9:	55                   	push   %ebp
 2aa:	89 e5                	mov    %esp,%ebp
 2ac:	53                   	push   %ebx
 2ad:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 2b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2b3:	50                   	push   %eax
 2b4:	e8 f6 00 00 00       	call   3af <join>
 2b9:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 2bb:	83 c4 04             	add    $0x4,%esp
 2be:	ff 75 f4             	push   -0xc(%ebp)
 2c1:	e8 fc 02 00 00       	call   5c2 <free>
  return x;
}
 2c6:	89 d8                	mov    %ebx,%eax
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <lock_init>:

void lock_init(lock_t *spin){
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
 2d3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <lock_acquire>:

void lock_acquire(lock_t *spin){
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2e1:	b8 01 00 00 00       	mov    $0x1,%eax
 2e6:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 2e9:	85 c0                	test   %eax,%eax
 2eb:	75 f4                	jne    2e1 <lock_acquire+0x6>

}
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    

000002ef <lock_release>:

void lock_release(lock_t *spin){
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	8b 55 08             	mov    0x8(%ebp),%edx
 2f5:	b8 00 00 00 00       	mov    $0x0,%eax
 2fa:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    

000002ff <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ff:	b8 01 00 00 00       	mov    $0x1,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <exit>:
SYSCALL(exit)
 307:	b8 02 00 00 00       	mov    $0x2,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <wait>:
SYSCALL(wait)
 30f:	b8 03 00 00 00       	mov    $0x3,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <pipe>:
SYSCALL(pipe)
 317:	b8 04 00 00 00       	mov    $0x4,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <read>:
SYSCALL(read)
 31f:	b8 05 00 00 00       	mov    $0x5,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <write>:
SYSCALL(write)
 327:	b8 10 00 00 00       	mov    $0x10,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <close>:
SYSCALL(close)
 32f:	b8 15 00 00 00       	mov    $0x15,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <kill>:
SYSCALL(kill)
 337:	b8 06 00 00 00       	mov    $0x6,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <exec>:
SYSCALL(exec)
 33f:	b8 07 00 00 00       	mov    $0x7,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <open>:
SYSCALL(open)
 347:	b8 0f 00 00 00       	mov    $0xf,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <mknod>:
SYSCALL(mknod)
 34f:	b8 11 00 00 00       	mov    $0x11,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <unlink>:
SYSCALL(unlink)
 357:	b8 12 00 00 00       	mov    $0x12,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <fstat>:
SYSCALL(fstat)
 35f:	b8 08 00 00 00       	mov    $0x8,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <link>:
SYSCALL(link)
 367:	b8 13 00 00 00       	mov    $0x13,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <mkdir>:
SYSCALL(mkdir)
 36f:	b8 14 00 00 00       	mov    $0x14,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <chdir>:
SYSCALL(chdir)
 377:	b8 09 00 00 00       	mov    $0x9,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <dup>:
SYSCALL(dup)
 37f:	b8 0a 00 00 00       	mov    $0xa,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <getpid>:
SYSCALL(getpid)
 387:	b8 0b 00 00 00       	mov    $0xb,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <sbrk>:
SYSCALL(sbrk)
 38f:	b8 0c 00 00 00       	mov    $0xc,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <sleep>:
SYSCALL(sleep)
 397:	b8 0d 00 00 00       	mov    $0xd,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <uptime>:
SYSCALL(uptime)
 39f:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <clone>:
SYSCALL(clone)
 3a7:	b8 16 00 00 00       	mov    $0x16,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <join>:
 3af:	b8 17 00 00 00       	mov    $0x17,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b7:	55                   	push   %ebp
 3b8:	89 e5                	mov    %esp,%ebp
 3ba:	83 ec 1c             	sub    $0x1c,%esp
 3bd:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3c0:	6a 01                	push   $0x1
 3c2:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3c5:	52                   	push   %edx
 3c6:	50                   	push   %eax
 3c7:	e8 5b ff ff ff       	call   327 <write>
}
 3cc:	83 c4 10             	add    $0x10,%esp
 3cf:	c9                   	leave  
 3d0:	c3                   	ret    

000003d1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3d1:	55                   	push   %ebp
 3d2:	89 e5                	mov    %esp,%ebp
 3d4:	57                   	push   %edi
 3d5:	56                   	push   %esi
 3d6:	53                   	push   %ebx
 3d7:	83 ec 2c             	sub    $0x2c,%esp
 3da:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3dd:	89 d0                	mov    %edx,%eax
 3df:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3e1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3e5:	0f 95 c1             	setne  %cl
 3e8:	c1 ea 1f             	shr    $0x1f,%edx
 3eb:	84 d1                	test   %dl,%cl
 3ed:	74 44                	je     433 <printint+0x62>
    neg = 1;
    x = -xx;
 3ef:	f7 d8                	neg    %eax
 3f1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3f3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3fa:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3ff:	89 c8                	mov    %ecx,%eax
 401:	ba 00 00 00 00       	mov    $0x0,%edx
 406:	f7 f6                	div    %esi
 408:	89 df                	mov    %ebx,%edi
 40a:	83 c3 01             	add    $0x1,%ebx
 40d:	0f b6 92 bc 07 00 00 	movzbl 0x7bc(%edx),%edx
 414:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 418:	89 ca                	mov    %ecx,%edx
 41a:	89 c1                	mov    %eax,%ecx
 41c:	39 d6                	cmp    %edx,%esi
 41e:	76 df                	jbe    3ff <printint+0x2e>
  if(neg)
 420:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 424:	74 31                	je     457 <printint+0x86>
    buf[i++] = '-';
 426:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 42b:	8d 5f 02             	lea    0x2(%edi),%ebx
 42e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 431:	eb 17                	jmp    44a <printint+0x79>
    x = xx;
 433:	89 c1                	mov    %eax,%ecx
  neg = 0;
 435:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 43c:	eb bc                	jmp    3fa <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 43e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 443:	89 f0                	mov    %esi,%eax
 445:	e8 6d ff ff ff       	call   3b7 <putc>
  while(--i >= 0)
 44a:	83 eb 01             	sub    $0x1,%ebx
 44d:	79 ef                	jns    43e <printint+0x6d>
}
 44f:	83 c4 2c             	add    $0x2c,%esp
 452:	5b                   	pop    %ebx
 453:	5e                   	pop    %esi
 454:	5f                   	pop    %edi
 455:	5d                   	pop    %ebp
 456:	c3                   	ret    
 457:	8b 75 d0             	mov    -0x30(%ebp),%esi
 45a:	eb ee                	jmp    44a <printint+0x79>

0000045c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 45c:	55                   	push   %ebp
 45d:	89 e5                	mov    %esp,%ebp
 45f:	57                   	push   %edi
 460:	56                   	push   %esi
 461:	53                   	push   %ebx
 462:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 465:	8d 45 10             	lea    0x10(%ebp),%eax
 468:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 46b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 470:	bb 00 00 00 00       	mov    $0x0,%ebx
 475:	eb 14                	jmp    48b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 477:	89 fa                	mov    %edi,%edx
 479:	8b 45 08             	mov    0x8(%ebp),%eax
 47c:	e8 36 ff ff ff       	call   3b7 <putc>
 481:	eb 05                	jmp    488 <printf+0x2c>
      }
    } else if(state == '%'){
 483:	83 fe 25             	cmp    $0x25,%esi
 486:	74 25                	je     4ad <printf+0x51>
  for(i = 0; fmt[i]; i++){
 488:	83 c3 01             	add    $0x1,%ebx
 48b:	8b 45 0c             	mov    0xc(%ebp),%eax
 48e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 492:	84 c0                	test   %al,%al
 494:	0f 84 20 01 00 00    	je     5ba <printf+0x15e>
    c = fmt[i] & 0xff;
 49a:	0f be f8             	movsbl %al,%edi
 49d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4a0:	85 f6                	test   %esi,%esi
 4a2:	75 df                	jne    483 <printf+0x27>
      if(c == '%'){
 4a4:	83 f8 25             	cmp    $0x25,%eax
 4a7:	75 ce                	jne    477 <printf+0x1b>
        state = '%';
 4a9:	89 c6                	mov    %eax,%esi
 4ab:	eb db                	jmp    488 <printf+0x2c>
      if(c == 'd'){
 4ad:	83 f8 25             	cmp    $0x25,%eax
 4b0:	0f 84 cf 00 00 00    	je     585 <printf+0x129>
 4b6:	0f 8c dd 00 00 00    	jl     599 <printf+0x13d>
 4bc:	83 f8 78             	cmp    $0x78,%eax
 4bf:	0f 8f d4 00 00 00    	jg     599 <printf+0x13d>
 4c5:	83 f8 63             	cmp    $0x63,%eax
 4c8:	0f 8c cb 00 00 00    	jl     599 <printf+0x13d>
 4ce:	83 e8 63             	sub    $0x63,%eax
 4d1:	83 f8 15             	cmp    $0x15,%eax
 4d4:	0f 87 bf 00 00 00    	ja     599 <printf+0x13d>
 4da:	ff 24 85 64 07 00 00 	jmp    *0x764(,%eax,4)
        printint(fd, *ap, 10, 1);
 4e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e4:	8b 17                	mov    (%edi),%edx
 4e6:	83 ec 0c             	sub    $0xc,%esp
 4e9:	6a 01                	push   $0x1
 4eb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4f0:	8b 45 08             	mov    0x8(%ebp),%eax
 4f3:	e8 d9 fe ff ff       	call   3d1 <printint>
        ap++;
 4f8:	83 c7 04             	add    $0x4,%edi
 4fb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4fe:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 501:	be 00 00 00 00       	mov    $0x0,%esi
 506:	eb 80                	jmp    488 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 508:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 50b:	8b 17                	mov    (%edi),%edx
 50d:	83 ec 0c             	sub    $0xc,%esp
 510:	6a 00                	push   $0x0
 512:	b9 10 00 00 00       	mov    $0x10,%ecx
 517:	8b 45 08             	mov    0x8(%ebp),%eax
 51a:	e8 b2 fe ff ff       	call   3d1 <printint>
        ap++;
 51f:	83 c7 04             	add    $0x4,%edi
 522:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 525:	83 c4 10             	add    $0x10,%esp
      state = 0;
 528:	be 00 00 00 00       	mov    $0x0,%esi
 52d:	e9 56 ff ff ff       	jmp    488 <printf+0x2c>
        s = (char*)*ap;
 532:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 535:	8b 30                	mov    (%eax),%esi
        ap++;
 537:	83 c0 04             	add    $0x4,%eax
 53a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 53d:	85 f6                	test   %esi,%esi
 53f:	75 15                	jne    556 <printf+0xfa>
          s = "(null)";
 541:	be 5c 07 00 00       	mov    $0x75c,%esi
 546:	eb 0e                	jmp    556 <printf+0xfa>
          putc(fd, *s);
 548:	0f be d2             	movsbl %dl,%edx
 54b:	8b 45 08             	mov    0x8(%ebp),%eax
 54e:	e8 64 fe ff ff       	call   3b7 <putc>
          s++;
 553:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 556:	0f b6 16             	movzbl (%esi),%edx
 559:	84 d2                	test   %dl,%dl
 55b:	75 eb                	jne    548 <printf+0xec>
      state = 0;
 55d:	be 00 00 00 00       	mov    $0x0,%esi
 562:	e9 21 ff ff ff       	jmp    488 <printf+0x2c>
        putc(fd, *ap);
 567:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 56a:	0f be 17             	movsbl (%edi),%edx
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	e8 42 fe ff ff       	call   3b7 <putc>
        ap++;
 575:	83 c7 04             	add    $0x4,%edi
 578:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 57b:	be 00 00 00 00       	mov    $0x0,%esi
 580:	e9 03 ff ff ff       	jmp    488 <printf+0x2c>
        putc(fd, c);
 585:	89 fa                	mov    %edi,%edx
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	e8 28 fe ff ff       	call   3b7 <putc>
      state = 0;
 58f:	be 00 00 00 00       	mov    $0x0,%esi
 594:	e9 ef fe ff ff       	jmp    488 <printf+0x2c>
        putc(fd, '%');
 599:	ba 25 00 00 00       	mov    $0x25,%edx
 59e:	8b 45 08             	mov    0x8(%ebp),%eax
 5a1:	e8 11 fe ff ff       	call   3b7 <putc>
        putc(fd, c);
 5a6:	89 fa                	mov    %edi,%edx
 5a8:	8b 45 08             	mov    0x8(%ebp),%eax
 5ab:	e8 07 fe ff ff       	call   3b7 <putc>
      state = 0;
 5b0:	be 00 00 00 00       	mov    $0x0,%esi
 5b5:	e9 ce fe ff ff       	jmp    488 <printf+0x2c>
    }
  }
}
 5ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bd:	5b                   	pop    %ebx
 5be:	5e                   	pop    %esi
 5bf:	5f                   	pop    %edi
 5c0:	5d                   	pop    %ebp
 5c1:	c3                   	ret    

000005c2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c2:	55                   	push   %ebp
 5c3:	89 e5                	mov    %esp,%ebp
 5c5:	57                   	push   %edi
 5c6:	56                   	push   %esi
 5c7:	53                   	push   %ebx
 5c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5cb:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ce:	a1 0c 0b 00 00       	mov    0xb0c,%eax
 5d3:	eb 02                	jmp    5d7 <free+0x15>
 5d5:	89 d0                	mov    %edx,%eax
 5d7:	39 c8                	cmp    %ecx,%eax
 5d9:	73 04                	jae    5df <free+0x1d>
 5db:	39 08                	cmp    %ecx,(%eax)
 5dd:	77 12                	ja     5f1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5df:	8b 10                	mov    (%eax),%edx
 5e1:	39 c2                	cmp    %eax,%edx
 5e3:	77 f0                	ja     5d5 <free+0x13>
 5e5:	39 c8                	cmp    %ecx,%eax
 5e7:	72 08                	jb     5f1 <free+0x2f>
 5e9:	39 ca                	cmp    %ecx,%edx
 5eb:	77 04                	ja     5f1 <free+0x2f>
 5ed:	89 d0                	mov    %edx,%eax
 5ef:	eb e6                	jmp    5d7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5f4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5f7:	8b 10                	mov    (%eax),%edx
 5f9:	39 d7                	cmp    %edx,%edi
 5fb:	74 19                	je     616 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 600:	8b 50 04             	mov    0x4(%eax),%edx
 603:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 606:	39 ce                	cmp    %ecx,%esi
 608:	74 1b                	je     625 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 60a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 60c:	a3 0c 0b 00 00       	mov    %eax,0xb0c
}
 611:	5b                   	pop    %ebx
 612:	5e                   	pop    %esi
 613:	5f                   	pop    %edi
 614:	5d                   	pop    %ebp
 615:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 616:	03 72 04             	add    0x4(%edx),%esi
 619:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 61c:	8b 10                	mov    (%eax),%edx
 61e:	8b 12                	mov    (%edx),%edx
 620:	89 53 f8             	mov    %edx,-0x8(%ebx)
 623:	eb db                	jmp    600 <free+0x3e>
    p->s.size += bp->s.size;
 625:	03 53 fc             	add    -0x4(%ebx),%edx
 628:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 62b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 62e:	89 10                	mov    %edx,(%eax)
 630:	eb da                	jmp    60c <free+0x4a>

00000632 <morecore>:

static Header*
morecore(uint nu)
{
 632:	55                   	push   %ebp
 633:	89 e5                	mov    %esp,%ebp
 635:	53                   	push   %ebx
 636:	83 ec 04             	sub    $0x4,%esp
 639:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 63b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 640:	77 05                	ja     647 <morecore+0x15>
    nu = 4096;
 642:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 647:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 64e:	83 ec 0c             	sub    $0xc,%esp
 651:	50                   	push   %eax
 652:	e8 38 fd ff ff       	call   38f <sbrk>
  if(p == (char*)-1)
 657:	83 c4 10             	add    $0x10,%esp
 65a:	83 f8 ff             	cmp    $0xffffffff,%eax
 65d:	74 1c                	je     67b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 65f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 662:	83 c0 08             	add    $0x8,%eax
 665:	83 ec 0c             	sub    $0xc,%esp
 668:	50                   	push   %eax
 669:	e8 54 ff ff ff       	call   5c2 <free>
  return freep;
 66e:	a1 0c 0b 00 00       	mov    0xb0c,%eax
 673:	83 c4 10             	add    $0x10,%esp
}
 676:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 679:	c9                   	leave  
 67a:	c3                   	ret    
    return 0;
 67b:	b8 00 00 00 00       	mov    $0x0,%eax
 680:	eb f4                	jmp    676 <morecore+0x44>

00000682 <malloc>:

void*
malloc(uint nbytes)
{
 682:	55                   	push   %ebp
 683:	89 e5                	mov    %esp,%ebp
 685:	53                   	push   %ebx
 686:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	8d 58 07             	lea    0x7(%eax),%ebx
 68f:	c1 eb 03             	shr    $0x3,%ebx
 692:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 695:	8b 0d 0c 0b 00 00    	mov    0xb0c,%ecx
 69b:	85 c9                	test   %ecx,%ecx
 69d:	74 04                	je     6a3 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 69f:	8b 01                	mov    (%ecx),%eax
 6a1:	eb 4a                	jmp    6ed <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6a3:	c7 05 0c 0b 00 00 10 	movl   $0xb10,0xb0c
 6aa:	0b 00 00 
 6ad:	c7 05 10 0b 00 00 10 	movl   $0xb10,0xb10
 6b4:	0b 00 00 
    base.s.size = 0;
 6b7:	c7 05 14 0b 00 00 00 	movl   $0x0,0xb14
 6be:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6c1:	b9 10 0b 00 00       	mov    $0xb10,%ecx
 6c6:	eb d7                	jmp    69f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6c8:	74 19                	je     6e3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6ca:	29 da                	sub    %ebx,%edx
 6cc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6cf:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6d2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6d5:	89 0d 0c 0b 00 00    	mov    %ecx,0xb0c
      return (void*)(p + 1);
 6db:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6e1:	c9                   	leave  
 6e2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6e3:	8b 10                	mov    (%eax),%edx
 6e5:	89 11                	mov    %edx,(%ecx)
 6e7:	eb ec                	jmp    6d5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e9:	89 c1                	mov    %eax,%ecx
 6eb:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6ed:	8b 50 04             	mov    0x4(%eax),%edx
 6f0:	39 da                	cmp    %ebx,%edx
 6f2:	73 d4                	jae    6c8 <malloc+0x46>
    if(p == freep)
 6f4:	39 05 0c 0b 00 00    	cmp    %eax,0xb0c
 6fa:	75 ed                	jne    6e9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6fc:	89 d8                	mov    %ebx,%eax
 6fe:	e8 2f ff ff ff       	call   632 <morecore>
 703:	85 c0                	test   %eax,%eax
 705:	75 e2                	jne    6e9 <malloc+0x67>
 707:	eb d5                	jmp    6de <malloc+0x5c>
