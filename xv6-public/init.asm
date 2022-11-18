
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
  14:	68 08 07 00 00       	push   $0x708
  19:	e8 26 03 00 00       	call   344 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 4d 03 00 00       	call   37c <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 41 03 00 00       	call   37c <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 08 07 00 00       	push   $0x708
  4c:	e8 fb 02 00 00       	call   34c <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 08 07 00 00       	push   $0x708
  5b:	e8 e4 02 00 00       	call   344 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 23 07 00 00       	push   $0x723
  6d:	6a 01                	push   $0x1
  6f:	e8 e5 03 00 00       	call   459 <printf>
      exit();
  74:	e8 8b 02 00 00       	call   304 <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 4f 07 00 00       	push   $0x74f
  81:	6a 01                	push   $0x1
  83:	e8 d1 03 00 00       	call   459 <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 7c 02 00 00       	call   30c <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 10 07 00 00       	push   $0x710
  a0:	6a 01                	push   $0x1
  a2:	e8 b2 03 00 00       	call   459 <printf>
    pid = fork();
  a7:	e8 50 02 00 00       	call   2fc <fork>
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
  bf:	68 36 07 00 00       	push   $0x736
  c4:	e8 73 02 00 00       	call   33c <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 39 07 00 00       	push   $0x739
  d1:	6a 01                	push   $0x1
  d3:	e8 81 03 00 00       	call   459 <printf>
      exit();
  d8:	e8 27 02 00 00       	call   304 <exit>

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
 1a3:	e8 74 01 00 00       	call   31c <read>
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
 1e1:	e8 5e 01 00 00       	call   344 <open>
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
 1f6:	e8 61 01 00 00       	call   35c <fstat>
 1fb:	89 c6                	mov    %eax,%esi
  close(fd);
 1fd:	89 1c 24             	mov    %ebx,(%esp)
 200:	e8 27 01 00 00       	call   32c <close>
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

  void* stack = malloc(PGSIZE);
 27a:	68 00 10 00 00       	push   $0x1000
 27f:	e8 fb 03 00 00       	call   67f <malloc>

  return clone(start_routine, arg1, arg2, stack);
 284:	50                   	push   %eax
 285:	ff 75 10             	push   0x10(%ebp)
 288:	ff 75 0c             	push   0xc(%ebp)
 28b:	ff 75 08             	push   0x8(%ebp)
 28e:	e8 11 01 00 00       	call   3a4 <clone>
}
 293:	c9                   	leave  
 294:	c3                   	ret    

00000295 <thread_join>:

int thread_join(){
 295:	55                   	push   %ebp
 296:	89 e5                	mov    %esp,%ebp
 298:	53                   	push   %ebx
 299:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 29c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 29f:	50                   	push   %eax
 2a0:	e8 07 01 00 00       	call   3ac <join>
  if (x < 0) {
 2a5:	83 c4 10             	add    $0x10,%esp
 2a8:	85 c0                	test   %eax,%eax
 2aa:	78 17                	js     2c3 <thread_join+0x2e>
 2ac:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 2ae:	83 ec 0c             	sub    $0xc,%esp
 2b1:	ff 75 f4             	push   -0xc(%ebp)
 2b4:	e8 06 03 00 00       	call   5bf <free>
  return x;
 2b9:	83 c4 10             	add    $0x10,%esp
}
 2bc:	89 d8                	mov    %ebx,%eax
 2be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    
    return -1;
 2c3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 2c8:	eb f2                	jmp    2bc <thread_join+0x27>

000002ca <lock_init>:

void lock_init(lock_t *spin){
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
 2d0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2d6:	5d                   	pop    %ebp
 2d7:	c3                   	ret    

000002d8 <lock_acquire>:

void lock_acquire(lock_t *spin){
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2de:	b8 01 00 00 00       	mov    $0x1,%eax
 2e3:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 2e6:	85 c0                	test   %eax,%eax
 2e8:	75 f4                	jne    2de <lock_acquire+0x6>

}
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    

000002ec <lock_release>:

void lock_release(lock_t *spin){
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	8b 55 08             	mov    0x8(%ebp),%edx
 2f2:	b8 00 00 00 00       	mov    $0x0,%eax
 2f7:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    

000002fc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fc:	b8 01 00 00 00       	mov    $0x1,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <exit>:
SYSCALL(exit)
 304:	b8 02 00 00 00       	mov    $0x2,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <wait>:
SYSCALL(wait)
 30c:	b8 03 00 00 00       	mov    $0x3,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <pipe>:
SYSCALL(pipe)
 314:	b8 04 00 00 00       	mov    $0x4,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <read>:
SYSCALL(read)
 31c:	b8 05 00 00 00       	mov    $0x5,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <write>:
SYSCALL(write)
 324:	b8 10 00 00 00       	mov    $0x10,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <close>:
SYSCALL(close)
 32c:	b8 15 00 00 00       	mov    $0x15,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <kill>:
SYSCALL(kill)
 334:	b8 06 00 00 00       	mov    $0x6,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <exec>:
SYSCALL(exec)
 33c:	b8 07 00 00 00       	mov    $0x7,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <open>:
SYSCALL(open)
 344:	b8 0f 00 00 00       	mov    $0xf,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <mknod>:
SYSCALL(mknod)
 34c:	b8 11 00 00 00       	mov    $0x11,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <unlink>:
SYSCALL(unlink)
 354:	b8 12 00 00 00       	mov    $0x12,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <fstat>:
SYSCALL(fstat)
 35c:	b8 08 00 00 00       	mov    $0x8,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <link>:
SYSCALL(link)
 364:	b8 13 00 00 00       	mov    $0x13,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <mkdir>:
SYSCALL(mkdir)
 36c:	b8 14 00 00 00       	mov    $0x14,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <chdir>:
SYSCALL(chdir)
 374:	b8 09 00 00 00       	mov    $0x9,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <dup>:
SYSCALL(dup)
 37c:	b8 0a 00 00 00       	mov    $0xa,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <getpid>:
SYSCALL(getpid)
 384:	b8 0b 00 00 00       	mov    $0xb,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <sbrk>:
SYSCALL(sbrk)
 38c:	b8 0c 00 00 00       	mov    $0xc,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <sleep>:
SYSCALL(sleep)
 394:	b8 0d 00 00 00       	mov    $0xd,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <uptime>:
SYSCALL(uptime)
 39c:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <clone>:
SYSCALL(clone)
 3a4:	b8 16 00 00 00       	mov    $0x16,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <join>:
 3ac:	b8 17 00 00 00       	mov    $0x17,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	83 ec 1c             	sub    $0x1c,%esp
 3ba:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3bd:	6a 01                	push   $0x1
 3bf:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3c2:	52                   	push   %edx
 3c3:	50                   	push   %eax
 3c4:	e8 5b ff ff ff       	call   324 <write>
}
 3c9:	83 c4 10             	add    $0x10,%esp
 3cc:	c9                   	leave  
 3cd:	c3                   	ret    

000003ce <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	57                   	push   %edi
 3d2:	56                   	push   %esi
 3d3:	53                   	push   %ebx
 3d4:	83 ec 2c             	sub    $0x2c,%esp
 3d7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3da:	89 d0                	mov    %edx,%eax
 3dc:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3de:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3e2:	0f 95 c1             	setne  %cl
 3e5:	c1 ea 1f             	shr    $0x1f,%edx
 3e8:	84 d1                	test   %dl,%cl
 3ea:	74 44                	je     430 <printint+0x62>
    neg = 1;
    x = -xx;
 3ec:	f7 d8                	neg    %eax
 3ee:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3f0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3fc:	89 c8                	mov    %ecx,%eax
 3fe:	ba 00 00 00 00       	mov    $0x0,%edx
 403:	f7 f6                	div    %esi
 405:	89 df                	mov    %ebx,%edi
 407:	83 c3 01             	add    $0x1,%ebx
 40a:	0f b6 92 b8 07 00 00 	movzbl 0x7b8(%edx),%edx
 411:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 415:	89 ca                	mov    %ecx,%edx
 417:	89 c1                	mov    %eax,%ecx
 419:	39 d6                	cmp    %edx,%esi
 41b:	76 df                	jbe    3fc <printint+0x2e>
  if(neg)
 41d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 421:	74 31                	je     454 <printint+0x86>
    buf[i++] = '-';
 423:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 428:	8d 5f 02             	lea    0x2(%edi),%ebx
 42b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 42e:	eb 17                	jmp    447 <printint+0x79>
    x = xx;
 430:	89 c1                	mov    %eax,%ecx
  neg = 0;
 432:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 439:	eb bc                	jmp    3f7 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 43b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 440:	89 f0                	mov    %esi,%eax
 442:	e8 6d ff ff ff       	call   3b4 <putc>
  while(--i >= 0)
 447:	83 eb 01             	sub    $0x1,%ebx
 44a:	79 ef                	jns    43b <printint+0x6d>
}
 44c:	83 c4 2c             	add    $0x2c,%esp
 44f:	5b                   	pop    %ebx
 450:	5e                   	pop    %esi
 451:	5f                   	pop    %edi
 452:	5d                   	pop    %ebp
 453:	c3                   	ret    
 454:	8b 75 d0             	mov    -0x30(%ebp),%esi
 457:	eb ee                	jmp    447 <printint+0x79>

00000459 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 459:	55                   	push   %ebp
 45a:	89 e5                	mov    %esp,%ebp
 45c:	57                   	push   %edi
 45d:	56                   	push   %esi
 45e:	53                   	push   %ebx
 45f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 462:	8d 45 10             	lea    0x10(%ebp),%eax
 465:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 468:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 46d:	bb 00 00 00 00       	mov    $0x0,%ebx
 472:	eb 14                	jmp    488 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 474:	89 fa                	mov    %edi,%edx
 476:	8b 45 08             	mov    0x8(%ebp),%eax
 479:	e8 36 ff ff ff       	call   3b4 <putc>
 47e:	eb 05                	jmp    485 <printf+0x2c>
      }
    } else if(state == '%'){
 480:	83 fe 25             	cmp    $0x25,%esi
 483:	74 25                	je     4aa <printf+0x51>
  for(i = 0; fmt[i]; i++){
 485:	83 c3 01             	add    $0x1,%ebx
 488:	8b 45 0c             	mov    0xc(%ebp),%eax
 48b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 48f:	84 c0                	test   %al,%al
 491:	0f 84 20 01 00 00    	je     5b7 <printf+0x15e>
    c = fmt[i] & 0xff;
 497:	0f be f8             	movsbl %al,%edi
 49a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 49d:	85 f6                	test   %esi,%esi
 49f:	75 df                	jne    480 <printf+0x27>
      if(c == '%'){
 4a1:	83 f8 25             	cmp    $0x25,%eax
 4a4:	75 ce                	jne    474 <printf+0x1b>
        state = '%';
 4a6:	89 c6                	mov    %eax,%esi
 4a8:	eb db                	jmp    485 <printf+0x2c>
      if(c == 'd'){
 4aa:	83 f8 25             	cmp    $0x25,%eax
 4ad:	0f 84 cf 00 00 00    	je     582 <printf+0x129>
 4b3:	0f 8c dd 00 00 00    	jl     596 <printf+0x13d>
 4b9:	83 f8 78             	cmp    $0x78,%eax
 4bc:	0f 8f d4 00 00 00    	jg     596 <printf+0x13d>
 4c2:	83 f8 63             	cmp    $0x63,%eax
 4c5:	0f 8c cb 00 00 00    	jl     596 <printf+0x13d>
 4cb:	83 e8 63             	sub    $0x63,%eax
 4ce:	83 f8 15             	cmp    $0x15,%eax
 4d1:	0f 87 bf 00 00 00    	ja     596 <printf+0x13d>
 4d7:	ff 24 85 60 07 00 00 	jmp    *0x760(,%eax,4)
        printint(fd, *ap, 10, 1);
 4de:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e1:	8b 17                	mov    (%edi),%edx
 4e3:	83 ec 0c             	sub    $0xc,%esp
 4e6:	6a 01                	push   $0x1
 4e8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4ed:	8b 45 08             	mov    0x8(%ebp),%eax
 4f0:	e8 d9 fe ff ff       	call   3ce <printint>
        ap++;
 4f5:	83 c7 04             	add    $0x4,%edi
 4f8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4fb:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4fe:	be 00 00 00 00       	mov    $0x0,%esi
 503:	eb 80                	jmp    485 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 505:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 508:	8b 17                	mov    (%edi),%edx
 50a:	83 ec 0c             	sub    $0xc,%esp
 50d:	6a 00                	push   $0x0
 50f:	b9 10 00 00 00       	mov    $0x10,%ecx
 514:	8b 45 08             	mov    0x8(%ebp),%eax
 517:	e8 b2 fe ff ff       	call   3ce <printint>
        ap++;
 51c:	83 c7 04             	add    $0x4,%edi
 51f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 522:	83 c4 10             	add    $0x10,%esp
      state = 0;
 525:	be 00 00 00 00       	mov    $0x0,%esi
 52a:	e9 56 ff ff ff       	jmp    485 <printf+0x2c>
        s = (char*)*ap;
 52f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 532:	8b 30                	mov    (%eax),%esi
        ap++;
 534:	83 c0 04             	add    $0x4,%eax
 537:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 53a:	85 f6                	test   %esi,%esi
 53c:	75 15                	jne    553 <printf+0xfa>
          s = "(null)";
 53e:	be 58 07 00 00       	mov    $0x758,%esi
 543:	eb 0e                	jmp    553 <printf+0xfa>
          putc(fd, *s);
 545:	0f be d2             	movsbl %dl,%edx
 548:	8b 45 08             	mov    0x8(%ebp),%eax
 54b:	e8 64 fe ff ff       	call   3b4 <putc>
          s++;
 550:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 553:	0f b6 16             	movzbl (%esi),%edx
 556:	84 d2                	test   %dl,%dl
 558:	75 eb                	jne    545 <printf+0xec>
      state = 0;
 55a:	be 00 00 00 00       	mov    $0x0,%esi
 55f:	e9 21 ff ff ff       	jmp    485 <printf+0x2c>
        putc(fd, *ap);
 564:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 567:	0f be 17             	movsbl (%edi),%edx
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	e8 42 fe ff ff       	call   3b4 <putc>
        ap++;
 572:	83 c7 04             	add    $0x4,%edi
 575:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 578:	be 00 00 00 00       	mov    $0x0,%esi
 57d:	e9 03 ff ff ff       	jmp    485 <printf+0x2c>
        putc(fd, c);
 582:	89 fa                	mov    %edi,%edx
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	e8 28 fe ff ff       	call   3b4 <putc>
      state = 0;
 58c:	be 00 00 00 00       	mov    $0x0,%esi
 591:	e9 ef fe ff ff       	jmp    485 <printf+0x2c>
        putc(fd, '%');
 596:	ba 25 00 00 00       	mov    $0x25,%edx
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	e8 11 fe ff ff       	call   3b4 <putc>
        putc(fd, c);
 5a3:	89 fa                	mov    %edi,%edx
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
 5a8:	e8 07 fe ff ff       	call   3b4 <putc>
      state = 0;
 5ad:	be 00 00 00 00       	mov    $0x0,%esi
 5b2:	e9 ce fe ff ff       	jmp    485 <printf+0x2c>
    }
  }
}
 5b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ba:	5b                   	pop    %ebx
 5bb:	5e                   	pop    %esi
 5bc:	5f                   	pop    %edi
 5bd:	5d                   	pop    %ebp
 5be:	c3                   	ret    

000005bf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5bf:	55                   	push   %ebp
 5c0:	89 e5                	mov    %esp,%ebp
 5c2:	57                   	push   %edi
 5c3:	56                   	push   %esi
 5c4:	53                   	push   %ebx
 5c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5cb:	a1 0c 0b 00 00       	mov    0xb0c,%eax
 5d0:	eb 02                	jmp    5d4 <free+0x15>
 5d2:	89 d0                	mov    %edx,%eax
 5d4:	39 c8                	cmp    %ecx,%eax
 5d6:	73 04                	jae    5dc <free+0x1d>
 5d8:	39 08                	cmp    %ecx,(%eax)
 5da:	77 12                	ja     5ee <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5dc:	8b 10                	mov    (%eax),%edx
 5de:	39 c2                	cmp    %eax,%edx
 5e0:	77 f0                	ja     5d2 <free+0x13>
 5e2:	39 c8                	cmp    %ecx,%eax
 5e4:	72 08                	jb     5ee <free+0x2f>
 5e6:	39 ca                	cmp    %ecx,%edx
 5e8:	77 04                	ja     5ee <free+0x2f>
 5ea:	89 d0                	mov    %edx,%eax
 5ec:	eb e6                	jmp    5d4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5ee:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5f1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5f4:	8b 10                	mov    (%eax),%edx
 5f6:	39 d7                	cmp    %edx,%edi
 5f8:	74 19                	je     613 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5fd:	8b 50 04             	mov    0x4(%eax),%edx
 600:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 603:	39 ce                	cmp    %ecx,%esi
 605:	74 1b                	je     622 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 607:	89 08                	mov    %ecx,(%eax)
  freep = p;
 609:	a3 0c 0b 00 00       	mov    %eax,0xb0c
}
 60e:	5b                   	pop    %ebx
 60f:	5e                   	pop    %esi
 610:	5f                   	pop    %edi
 611:	5d                   	pop    %ebp
 612:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 613:	03 72 04             	add    0x4(%edx),%esi
 616:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 619:	8b 10                	mov    (%eax),%edx
 61b:	8b 12                	mov    (%edx),%edx
 61d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 620:	eb db                	jmp    5fd <free+0x3e>
    p->s.size += bp->s.size;
 622:	03 53 fc             	add    -0x4(%ebx),%edx
 625:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 628:	8b 53 f8             	mov    -0x8(%ebx),%edx
 62b:	89 10                	mov    %edx,(%eax)
 62d:	eb da                	jmp    609 <free+0x4a>

0000062f <morecore>:

static Header*
morecore(uint nu)
{
 62f:	55                   	push   %ebp
 630:	89 e5                	mov    %esp,%ebp
 632:	53                   	push   %ebx
 633:	83 ec 04             	sub    $0x4,%esp
 636:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 638:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 63d:	77 05                	ja     644 <morecore+0x15>
    nu = 4096;
 63f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 644:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 64b:	83 ec 0c             	sub    $0xc,%esp
 64e:	50                   	push   %eax
 64f:	e8 38 fd ff ff       	call   38c <sbrk>
  if(p == (char*)-1)
 654:	83 c4 10             	add    $0x10,%esp
 657:	83 f8 ff             	cmp    $0xffffffff,%eax
 65a:	74 1c                	je     678 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 65c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 65f:	83 c0 08             	add    $0x8,%eax
 662:	83 ec 0c             	sub    $0xc,%esp
 665:	50                   	push   %eax
 666:	e8 54 ff ff ff       	call   5bf <free>
  return freep;
 66b:	a1 0c 0b 00 00       	mov    0xb0c,%eax
 670:	83 c4 10             	add    $0x10,%esp
}
 673:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 676:	c9                   	leave  
 677:	c3                   	ret    
    return 0;
 678:	b8 00 00 00 00       	mov    $0x0,%eax
 67d:	eb f4                	jmp    673 <morecore+0x44>

0000067f <malloc>:

void*
malloc(uint nbytes)
{
 67f:	55                   	push   %ebp
 680:	89 e5                	mov    %esp,%ebp
 682:	53                   	push   %ebx
 683:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 686:	8b 45 08             	mov    0x8(%ebp),%eax
 689:	8d 58 07             	lea    0x7(%eax),%ebx
 68c:	c1 eb 03             	shr    $0x3,%ebx
 68f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 692:	8b 0d 0c 0b 00 00    	mov    0xb0c,%ecx
 698:	85 c9                	test   %ecx,%ecx
 69a:	74 04                	je     6a0 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 69c:	8b 01                	mov    (%ecx),%eax
 69e:	eb 4a                	jmp    6ea <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6a0:	c7 05 0c 0b 00 00 10 	movl   $0xb10,0xb0c
 6a7:	0b 00 00 
 6aa:	c7 05 10 0b 00 00 10 	movl   $0xb10,0xb10
 6b1:	0b 00 00 
    base.s.size = 0;
 6b4:	c7 05 14 0b 00 00 00 	movl   $0x0,0xb14
 6bb:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6be:	b9 10 0b 00 00       	mov    $0xb10,%ecx
 6c3:	eb d7                	jmp    69c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6c5:	74 19                	je     6e0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6c7:	29 da                	sub    %ebx,%edx
 6c9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6cc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6cf:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6d2:	89 0d 0c 0b 00 00    	mov    %ecx,0xb0c
      return (void*)(p + 1);
 6d8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6de:	c9                   	leave  
 6df:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6e0:	8b 10                	mov    (%eax),%edx
 6e2:	89 11                	mov    %edx,(%ecx)
 6e4:	eb ec                	jmp    6d2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e6:	89 c1                	mov    %eax,%ecx
 6e8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6ea:	8b 50 04             	mov    0x4(%eax),%edx
 6ed:	39 da                	cmp    %ebx,%edx
 6ef:	73 d4                	jae    6c5 <malloc+0x46>
    if(p == freep)
 6f1:	39 05 0c 0b 00 00    	cmp    %eax,0xb0c
 6f7:	75 ed                	jne    6e6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6f9:	89 d8                	mov    %ebx,%eax
 6fb:	e8 2f ff ff ff       	call   62f <morecore>
 700:	85 c0                	test   %eax,%eax
 702:	75 e2                	jne    6e6 <malloc+0x67>
 704:	eb d5                	jmp    6db <malloc+0x5c>
