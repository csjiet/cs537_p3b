
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 10             	sub    $0x10,%esp
   7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   a:	53                   	push   %ebx
   b:	e8 25 01 00 00       	call   135 <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 13 03 00 00       	call   330 <write>
}
  1d:	83 c4 10             	add    $0x10,%esp
  20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  23:	c9                   	leave  
  24:	c3                   	ret    

00000025 <forktest>:

void
forktest(void)
{
  25:	55                   	push   %ebp
  26:	89 e5                	mov    %esp,%ebp
  28:	53                   	push   %ebx
  29:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  2c:	68 08 05 00 00       	push   $0x508
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 bb 02 00 00       	call   308 <fork>
    if(pid < 0)
  4d:	85 c0                	test   %eax,%eax
  4f:	78 0c                	js     5d <forktest+0x38>
      break;
    if(pid == 0)
  51:	74 05                	je     58 <forktest+0x33>
  for(n=0; n<N; n++){
  53:	83 c3 01             	add    $0x1,%ebx
  56:	eb e8                	jmp    40 <forktest+0x1b>
      exit();
  58:	e8 b3 02 00 00       	call   310 <exit>
  }

  if(n == N){
  5d:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  63:	74 12                	je     77 <forktest+0x52>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  65:	85 db                	test   %ebx,%ebx
  67:	7e 3b                	jle    a4 <forktest+0x7f>
    if(wait() < 0){
  69:	e8 aa 02 00 00       	call   318 <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 48 05 00 00       	push   $0x548
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 80 02 00 00       	call   310 <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 13 05 00 00       	push   $0x513
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 6c 02 00 00       	call   310 <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 6f 02 00 00       	call   318 <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 3a 05 00 00       	push   $0x53a
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 27 05 00 00       	push   $0x527
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 37 02 00 00       	call   310 <exit>

000000d9 <main>:

int
main(void)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  df:	e8 41 ff ff ff       	call   25 <forktest>
  exit();
  e4:	e8 27 02 00 00       	call   310 <exit>

000000e9 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	56                   	push   %esi
  ed:	53                   	push   %ebx
  ee:	8b 75 08             	mov    0x8(%ebp),%esi
  f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f4:	89 f0                	mov    %esi,%eax
  f6:	89 d1                	mov    %edx,%ecx
  f8:	83 c2 01             	add    $0x1,%edx
  fb:	89 c3                	mov    %eax,%ebx
  fd:	83 c0 01             	add    $0x1,%eax
 100:	0f b6 09             	movzbl (%ecx),%ecx
 103:	88 0b                	mov    %cl,(%ebx)
 105:	84 c9                	test   %cl,%cl
 107:	75 ed                	jne    f6 <strcpy+0xd>
    ;
  return os;
}
 109:	89 f0                	mov    %esi,%eax
 10b:	5b                   	pop    %ebx
 10c:	5e                   	pop    %esi
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    

0000010f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	8b 4d 08             	mov    0x8(%ebp),%ecx
 115:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 118:	eb 06                	jmp    120 <strcmp+0x11>
    p++, q++;
 11a:	83 c1 01             	add    $0x1,%ecx
 11d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 120:	0f b6 01             	movzbl (%ecx),%eax
 123:	84 c0                	test   %al,%al
 125:	74 04                	je     12b <strcmp+0x1c>
 127:	3a 02                	cmp    (%edx),%al
 129:	74 ef                	je     11a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 12b:	0f b6 c0             	movzbl %al,%eax
 12e:	0f b6 12             	movzbl (%edx),%edx
 131:	29 d0                	sub    %edx,%eax
}
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strlen>:

uint
strlen(const char *s)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 13b:	b8 00 00 00 00       	mov    $0x0,%eax
 140:	eb 03                	jmp    145 <strlen+0x10>
 142:	83 c0 01             	add    $0x1,%eax
 145:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 149:	75 f7                	jne    142 <strlen+0xd>
    ;
  return n;
}
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    

0000014d <memset>:

void*
memset(void *dst, int c, uint n)
{
 14d:	55                   	push   %ebp
 14e:	89 e5                	mov    %esp,%ebp
 150:	57                   	push   %edi
 151:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 154:	89 d7                	mov    %edx,%edi
 156:	8b 4d 10             	mov    0x10(%ebp),%ecx
 159:	8b 45 0c             	mov    0xc(%ebp),%eax
 15c:	fc                   	cld    
 15d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 15f:	89 d0                	mov    %edx,%eax
 161:	8b 7d fc             	mov    -0x4(%ebp),%edi
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	8b 45 08             	mov    0x8(%ebp),%eax
 16c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 170:	eb 03                	jmp    175 <strchr+0xf>
 172:	83 c0 01             	add    $0x1,%eax
 175:	0f b6 10             	movzbl (%eax),%edx
 178:	84 d2                	test   %dl,%dl
 17a:	74 06                	je     182 <strchr+0x1c>
    if(*s == c)
 17c:	38 ca                	cmp    %cl,%dl
 17e:	75 f2                	jne    172 <strchr+0xc>
 180:	eb 05                	jmp    187 <strchr+0x21>
      return (char*)s;
  return 0;
 182:	b8 00 00 00 00       	mov    $0x0,%eax
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    

00000189 <gets>:

char*
gets(char *buf, int max)
{
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	57                   	push   %edi
 18d:	56                   	push   %esi
 18e:	53                   	push   %ebx
 18f:	83 ec 1c             	sub    $0x1c,%esp
 192:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	bb 00 00 00 00       	mov    $0x0,%ebx
 19a:	89 de                	mov    %ebx,%esi
 19c:	83 c3 01             	add    $0x1,%ebx
 19f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1a2:	7d 2e                	jge    1d2 <gets+0x49>
    cc = read(0, &c, 1);
 1a4:	83 ec 04             	sub    $0x4,%esp
 1a7:	6a 01                	push   $0x1
 1a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1ac:	50                   	push   %eax
 1ad:	6a 00                	push   $0x0
 1af:	e8 74 01 00 00       	call   328 <read>
    if(cc < 1)
 1b4:	83 c4 10             	add    $0x10,%esp
 1b7:	85 c0                	test   %eax,%eax
 1b9:	7e 17                	jle    1d2 <gets+0x49>
      break;
    buf[i++] = c;
 1bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	0f 94 c2             	sete   %dl
 1c7:	3c 0d                	cmp    $0xd,%al
 1c9:	0f 94 c0             	sete   %al
 1cc:	08 c2                	or     %al,%dl
 1ce:	74 ca                	je     19a <gets+0x11>
    buf[i++] = c;
 1d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1d6:	89 f8                	mov    %edi,%eax
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 5e 01 00 00       	call   350 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 24                	js     21d <stat+0x3d>
 1f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1fb:	83 ec 08             	sub    $0x8,%esp
 1fe:	ff 75 0c             	push   0xc(%ebp)
 201:	50                   	push   %eax
 202:	e8 61 01 00 00       	call   368 <fstat>
 207:	89 c6                	mov    %eax,%esi
  close(fd);
 209:	89 1c 24             	mov    %ebx,(%esp)
 20c:	e8 27 01 00 00       	call   338 <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	89 f0                	mov    %esi,%eax
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
    return -1;
 21d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 222:	eb f0                	jmp    214 <stat+0x34>

00000224 <atoi>:

int
atoi(const char *s)
{
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 22b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 230:	eb 10                	jmp    242 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 232:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 235:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 238:	83 c1 01             	add    $0x1,%ecx
 23b:	0f be c0             	movsbl %al,%eax
 23e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 242:	0f b6 01             	movzbl (%ecx),%eax
 245:	8d 58 d0             	lea    -0x30(%eax),%ebx
 248:	80 fb 09             	cmp    $0x9,%bl
 24b:	76 e5                	jbe    232 <atoi+0xe>
  return n;
}
 24d:	89 d0                	mov    %edx,%eax
 24f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 252:	c9                   	leave  
 253:	c3                   	ret    

00000254 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	56                   	push   %esi
 258:	53                   	push   %ebx
 259:	8b 75 08             	mov    0x8(%ebp),%esi
 25c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 25f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 262:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 264:	eb 0d                	jmp    273 <memmove+0x1f>
    *dst++ = *src++;
 266:	0f b6 01             	movzbl (%ecx),%eax
 269:	88 02                	mov    %al,(%edx)
 26b:	8d 49 01             	lea    0x1(%ecx),%ecx
 26e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 271:	89 d8                	mov    %ebx,%eax
 273:	8d 58 ff             	lea    -0x1(%eax),%ebx
 276:	85 c0                	test   %eax,%eax
 278:	7f ec                	jg     266 <memmove+0x12>
  return vdst;
}
 27a:	89 f0                	mov    %esi,%eax
 27c:	5b                   	pop    %ebx
 27d:	5e                   	pop    %esi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 286:	68 00 10 00 00       	push   $0x1000
 28b:	e8 f0 01 00 00       	call   480 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 290:	50                   	push   %eax
 291:	ff 75 10             	push   0x10(%ebp)
 294:	ff 75 0c             	push   0xc(%ebp)
 297:	ff 75 08             	push   0x8(%ebp)
 29a:	e8 11 01 00 00       	call   3b0 <clone>
}
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <thread_join>:

int thread_join(){
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	53                   	push   %ebx
 2a5:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 2a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2ab:	50                   	push   %eax
 2ac:	e8 07 01 00 00       	call   3b8 <join>
  if (x < 0) {
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	85 c0                	test   %eax,%eax
 2b6:	78 17                	js     2cf <thread_join+0x2e>
 2b8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 2ba:	83 ec 0c             	sub    $0xc,%esp
 2bd:	ff 75 f4             	push   -0xc(%ebp)
 2c0:	e8 fb 00 00 00       	call   3c0 <free>
  return x;
 2c5:	83 c4 10             	add    $0x10,%esp
}
 2c8:	89 d8                	mov    %ebx,%eax
 2ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cd:	c9                   	leave  
 2ce:	c3                   	ret    
    return -1;
 2cf:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 2d4:	eb f2                	jmp    2c8 <thread_join+0x27>

000002d6 <lock_init>:

void lock_init(lock_t *spin){
 2d6:	55                   	push   %ebp
 2d7:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 2d9:	8b 45 08             	mov    0x8(%ebp),%eax
 2dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret    

000002e4 <lock_acquire>:

void lock_acquire(lock_t *spin){
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2ea:	b8 01 00 00 00       	mov    $0x1,%eax
 2ef:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 2f2:	85 c0                	test   %eax,%eax
 2f4:	75 f4                	jne    2ea <lock_acquire+0x6>

}
 2f6:	5d                   	pop    %ebp
 2f7:	c3                   	ret    

000002f8 <lock_release>:

void lock_release(lock_t *spin){
 2f8:	55                   	push   %ebp
 2f9:	89 e5                	mov    %esp,%ebp
 2fb:	8b 55 08             	mov    0x8(%ebp),%edx
 2fe:	b8 00 00 00 00       	mov    $0x0,%eax
 303:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 306:	5d                   	pop    %ebp
 307:	c3                   	ret    

00000308 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 308:	b8 01 00 00 00       	mov    $0x1,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <exit>:
SYSCALL(exit)
 310:	b8 02 00 00 00       	mov    $0x2,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <wait>:
SYSCALL(wait)
 318:	b8 03 00 00 00       	mov    $0x3,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <pipe>:
SYSCALL(pipe)
 320:	b8 04 00 00 00       	mov    $0x4,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <read>:
SYSCALL(read)
 328:	b8 05 00 00 00       	mov    $0x5,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <write>:
SYSCALL(write)
 330:	b8 10 00 00 00       	mov    $0x10,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <close>:
SYSCALL(close)
 338:	b8 15 00 00 00       	mov    $0x15,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <kill>:
SYSCALL(kill)
 340:	b8 06 00 00 00       	mov    $0x6,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <exec>:
SYSCALL(exec)
 348:	b8 07 00 00 00       	mov    $0x7,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <open>:
SYSCALL(open)
 350:	b8 0f 00 00 00       	mov    $0xf,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <mknod>:
SYSCALL(mknod)
 358:	b8 11 00 00 00       	mov    $0x11,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <unlink>:
SYSCALL(unlink)
 360:	b8 12 00 00 00       	mov    $0x12,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <fstat>:
SYSCALL(fstat)
 368:	b8 08 00 00 00       	mov    $0x8,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <link>:
SYSCALL(link)
 370:	b8 13 00 00 00       	mov    $0x13,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <mkdir>:
SYSCALL(mkdir)
 378:	b8 14 00 00 00       	mov    $0x14,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <chdir>:
SYSCALL(chdir)
 380:	b8 09 00 00 00       	mov    $0x9,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <dup>:
SYSCALL(dup)
 388:	b8 0a 00 00 00       	mov    $0xa,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <getpid>:
SYSCALL(getpid)
 390:	b8 0b 00 00 00       	mov    $0xb,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <sbrk>:
SYSCALL(sbrk)
 398:	b8 0c 00 00 00       	mov    $0xc,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <sleep>:
SYSCALL(sleep)
 3a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <uptime>:
SYSCALL(uptime)
 3a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <clone>:
SYSCALL(clone)
 3b0:	b8 16 00 00 00       	mov    $0x16,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <join>:
 3b8:	b8 17 00 00 00       	mov    $0x17,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 3c9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3cc:	a1 60 08 00 00       	mov    0x860,%eax
 3d1:	eb 02                	jmp    3d5 <free+0x15>
 3d3:	89 d0                	mov    %edx,%eax
 3d5:	39 c8                	cmp    %ecx,%eax
 3d7:	73 04                	jae    3dd <free+0x1d>
 3d9:	39 08                	cmp    %ecx,(%eax)
 3db:	77 12                	ja     3ef <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3dd:	8b 10                	mov    (%eax),%edx
 3df:	39 c2                	cmp    %eax,%edx
 3e1:	77 f0                	ja     3d3 <free+0x13>
 3e3:	39 c8                	cmp    %ecx,%eax
 3e5:	72 08                	jb     3ef <free+0x2f>
 3e7:	39 ca                	cmp    %ecx,%edx
 3e9:	77 04                	ja     3ef <free+0x2f>
 3eb:	89 d0                	mov    %edx,%eax
 3ed:	eb e6                	jmp    3d5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3ef:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3f2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3f5:	8b 10                	mov    (%eax),%edx
 3f7:	39 d7                	cmp    %edx,%edi
 3f9:	74 19                	je     414 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3fb:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3fe:	8b 50 04             	mov    0x4(%eax),%edx
 401:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 404:	39 ce                	cmp    %ecx,%esi
 406:	74 1b                	je     423 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 408:	89 08                	mov    %ecx,(%eax)
  freep = p;
 40a:	a3 60 08 00 00       	mov    %eax,0x860
}
 40f:	5b                   	pop    %ebx
 410:	5e                   	pop    %esi
 411:	5f                   	pop    %edi
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 414:	03 72 04             	add    0x4(%edx),%esi
 417:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 41a:	8b 10                	mov    (%eax),%edx
 41c:	8b 12                	mov    (%edx),%edx
 41e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 421:	eb db                	jmp    3fe <free+0x3e>
    p->s.size += bp->s.size;
 423:	03 53 fc             	add    -0x4(%ebx),%edx
 426:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 429:	8b 53 f8             	mov    -0x8(%ebx),%edx
 42c:	89 10                	mov    %edx,(%eax)
 42e:	eb da                	jmp    40a <free+0x4a>

00000430 <morecore>:

static Header*
morecore(uint nu)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
 434:	83 ec 04             	sub    $0x4,%esp
 437:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 439:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 43e:	77 05                	ja     445 <morecore+0x15>
    nu = 4096;
 440:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 445:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 44c:	83 ec 0c             	sub    $0xc,%esp
 44f:	50                   	push   %eax
 450:	e8 43 ff ff ff       	call   398 <sbrk>
  if(p == (char*)-1)
 455:	83 c4 10             	add    $0x10,%esp
 458:	83 f8 ff             	cmp    $0xffffffff,%eax
 45b:	74 1c                	je     479 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 45d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 460:	83 c0 08             	add    $0x8,%eax
 463:	83 ec 0c             	sub    $0xc,%esp
 466:	50                   	push   %eax
 467:	e8 54 ff ff ff       	call   3c0 <free>
  return freep;
 46c:	a1 60 08 00 00       	mov    0x860,%eax
 471:	83 c4 10             	add    $0x10,%esp
}
 474:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 477:	c9                   	leave  
 478:	c3                   	ret    
    return 0;
 479:	b8 00 00 00 00       	mov    $0x0,%eax
 47e:	eb f4                	jmp    474 <morecore+0x44>

00000480 <malloc>:

void*
malloc(uint nbytes)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 487:	8b 45 08             	mov    0x8(%ebp),%eax
 48a:	8d 58 07             	lea    0x7(%eax),%ebx
 48d:	c1 eb 03             	shr    $0x3,%ebx
 490:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 493:	8b 0d 60 08 00 00    	mov    0x860,%ecx
 499:	85 c9                	test   %ecx,%ecx
 49b:	74 04                	je     4a1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 49d:	8b 01                	mov    (%ecx),%eax
 49f:	eb 4a                	jmp    4eb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 4a1:	c7 05 60 08 00 00 64 	movl   $0x864,0x860
 4a8:	08 00 00 
 4ab:	c7 05 64 08 00 00 64 	movl   $0x864,0x864
 4b2:	08 00 00 
    base.s.size = 0;
 4b5:	c7 05 68 08 00 00 00 	movl   $0x0,0x868
 4bc:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 4bf:	b9 64 08 00 00       	mov    $0x864,%ecx
 4c4:	eb d7                	jmp    49d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 4c6:	74 19                	je     4e1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 4c8:	29 da                	sub    %ebx,%edx
 4ca:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 4cd:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 4d0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 4d3:	89 0d 60 08 00 00    	mov    %ecx,0x860
      return (void*)(p + 1);
 4d9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 4dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4df:	c9                   	leave  
 4e0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 4e1:	8b 10                	mov    (%eax),%edx
 4e3:	89 11                	mov    %edx,(%ecx)
 4e5:	eb ec                	jmp    4d3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4e7:	89 c1                	mov    %eax,%ecx
 4e9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 4eb:	8b 50 04             	mov    0x4(%eax),%edx
 4ee:	39 da                	cmp    %ebx,%edx
 4f0:	73 d4                	jae    4c6 <malloc+0x46>
    if(p == freep)
 4f2:	39 05 60 08 00 00    	cmp    %eax,0x860
 4f8:	75 ed                	jne    4e7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 4fa:	89 d8                	mov    %ebx,%eax
 4fc:	e8 2f ff ff ff       	call   430 <morecore>
 501:	85 c0                	test   %eax,%eax
 503:	75 e2                	jne    4e7 <malloc+0x67>
 505:	eb d5                	jmp    4dc <malloc+0x5c>
