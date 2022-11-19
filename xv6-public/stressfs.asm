
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2a:	68 48 07 00 00       	push   $0x748
  2f:	6a 01                	push   $0x1
  31:	e8 65 04 00 00       	call   49b <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 34 01 00 00       	call   180 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 e0 02 00 00       	call   33e <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 5b 07 00 00       	push   $0x75b
  70:	6a 01                	push   $0x1
  72:	e8 24 04 00 00       	call   49b <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 fb 02 00 00       	call   386 <open>
  8b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 ba 02 00 00       	call   366 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 ae 02 00 00       	call   36e <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 65 07 00 00       	push   $0x765
  c8:	6a 01                	push   $0x1
  ca:	e8 cc 03 00 00       	call   49b <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 a9 02 00 00       	call   386 <open>
  dd:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
    read(fd, data, sizeof(data));
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 60 02 00 00       	call   35e <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 5c 02 00 00       	call   36e <close>

  wait();
 112:	e8 37 02 00 00       	call   34e <wait>

  exit();
 117:	e8 2a 02 00 00       	call   346 <exit>

0000011c <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	56                   	push   %esi
 120:	53                   	push   %ebx
 121:	8b 75 08             	mov    0x8(%ebp),%esi
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 127:	89 f0                	mov    %esi,%eax
 129:	89 d1                	mov    %edx,%ecx
 12b:	83 c2 01             	add    $0x1,%edx
 12e:	89 c3                	mov    %eax,%ebx
 130:	83 c0 01             	add    $0x1,%eax
 133:	0f b6 09             	movzbl (%ecx),%ecx
 136:	88 0b                	mov    %cl,(%ebx)
 138:	84 c9                	test   %cl,%cl
 13a:	75 ed                	jne    129 <strcpy+0xd>
    ;
  return os;
}
 13c:	89 f0                	mov    %esi,%eax
 13e:	5b                   	pop    %ebx
 13f:	5e                   	pop    %esi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    

00000142 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	8b 4d 08             	mov    0x8(%ebp),%ecx
 148:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14b:	eb 06                	jmp    153 <strcmp+0x11>
    p++, q++;
 14d:	83 c1 01             	add    $0x1,%ecx
 150:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 153:	0f b6 01             	movzbl (%ecx),%eax
 156:	84 c0                	test   %al,%al
 158:	74 04                	je     15e <strcmp+0x1c>
 15a:	3a 02                	cmp    (%edx),%al
 15c:	74 ef                	je     14d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 15e:	0f b6 c0             	movzbl %al,%eax
 161:	0f b6 12             	movzbl (%edx),%edx
 164:	29 d0                	sub    %edx,%eax
}
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    

00000168 <strlen>:

uint
strlen(const char *s)
{
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 16e:	b8 00 00 00 00       	mov    $0x0,%eax
 173:	eb 03                	jmp    178 <strlen+0x10>
 175:	83 c0 01             	add    $0x1,%eax
 178:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 17c:	75 f7                	jne    175 <strlen+0xd>
    ;
  return n;
}
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	89 d7                	mov    %edx,%edi
 189:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18c:	8b 45 0c             	mov    0xc(%ebp),%eax
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 7d fc             	mov    -0x4(%ebp),%edi
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <strchr>:

char*
strchr(const char *s, char c)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1a3:	eb 03                	jmp    1a8 <strchr+0xf>
 1a5:	83 c0 01             	add    $0x1,%eax
 1a8:	0f b6 10             	movzbl (%eax),%edx
 1ab:	84 d2                	test   %dl,%dl
 1ad:	74 06                	je     1b5 <strchr+0x1c>
    if(*s == c)
 1af:	38 ca                	cmp    %cl,%dl
 1b1:	75 f2                	jne    1a5 <strchr+0xc>
 1b3:	eb 05                	jmp    1ba <strchr+0x21>
      return (char*)s;
  return 0;
 1b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    

000001bc <gets>:

char*
gets(char *buf, int max)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	57                   	push   %edi
 1c0:	56                   	push   %esi
 1c1:	53                   	push   %ebx
 1c2:	83 ec 1c             	sub    $0x1c,%esp
 1c5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 1cd:	89 de                	mov    %ebx,%esi
 1cf:	83 c3 01             	add    $0x1,%ebx
 1d2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d5:	7d 2e                	jge    205 <gets+0x49>
    cc = read(0, &c, 1);
 1d7:	83 ec 04             	sub    $0x4,%esp
 1da:	6a 01                	push   $0x1
 1dc:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1df:	50                   	push   %eax
 1e0:	6a 00                	push   $0x0
 1e2:	e8 77 01 00 00       	call   35e <read>
    if(cc < 1)
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	85 c0                	test   %eax,%eax
 1ec:	7e 17                	jle    205 <gets+0x49>
      break;
    buf[i++] = c;
 1ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f2:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1f5:	3c 0a                	cmp    $0xa,%al
 1f7:	0f 94 c2             	sete   %dl
 1fa:	3c 0d                	cmp    $0xd,%al
 1fc:	0f 94 c0             	sete   %al
 1ff:	08 c2                	or     %al,%dl
 201:	74 ca                	je     1cd <gets+0x11>
    buf[i++] = c;
 203:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 205:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 209:	89 f8                	mov    %edi,%eax
 20b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20e:	5b                   	pop    %ebx
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <stat>:

int
stat(const char *n, struct stat *st)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 218:	83 ec 08             	sub    $0x8,%esp
 21b:	6a 00                	push   $0x0
 21d:	ff 75 08             	push   0x8(%ebp)
 220:	e8 61 01 00 00       	call   386 <open>
  if(fd < 0)
 225:	83 c4 10             	add    $0x10,%esp
 228:	85 c0                	test   %eax,%eax
 22a:	78 24                	js     250 <stat+0x3d>
 22c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	push   0xc(%ebp)
 234:	50                   	push   %eax
 235:	e8 64 01 00 00       	call   39e <fstat>
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	89 1c 24             	mov    %ebx,(%esp)
 23f:	e8 2a 01 00 00       	call   36e <close>
  return r;
 244:	83 c4 10             	add    $0x10,%esp
}
 247:	89 f0                	mov    %esi,%eax
 249:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb f0                	jmp    247 <stat+0x34>

00000257 <atoi>:

int
atoi(const char *s)
{
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	53                   	push   %ebx
 25b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 25e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 263:	eb 10                	jmp    275 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 265:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 268:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 26b:	83 c1 01             	add    $0x1,%ecx
 26e:	0f be c0             	movsbl %al,%eax
 271:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	8d 58 d0             	lea    -0x30(%eax),%ebx
 27b:	80 fb 09             	cmp    $0x9,%bl
 27e:	76 e5                	jbe    265 <atoi+0xe>
  return n;
}
 280:	89 d0                	mov    %edx,%eax
 282:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	8b 75 08             	mov    0x8(%ebp),%esi
 28f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 292:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 295:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 297:	eb 0d                	jmp    2a6 <memmove+0x1f>
    *dst++ = *src++;
 299:	0f b6 01             	movzbl (%ecx),%eax
 29c:	88 02                	mov    %al,(%edx)
 29e:	8d 49 01             	lea    0x1(%ecx),%ecx
 2a1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2a4:	89 d8                	mov    %ebx,%eax
 2a6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2a9:	85 c0                	test   %eax,%eax
 2ab:	7f ec                	jg     299 <memmove+0x12>
  return vdst;
}
 2ad:	89 f0                	mov    %esi,%eax
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    

000002b3 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 2b3:	55                   	push   %ebp
 2b4:	89 e5                	mov    %esp,%ebp
 2b6:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 2b9:	68 00 20 00 00       	push   $0x2000
 2be:	e8 fe 03 00 00       	call   6c1 <malloc>
  if ((uint)stack%PGSIZE){
 2c3:	83 c4 10             	add    $0x10,%esp
 2c6:	a9 ff 0f 00 00       	test   $0xfff,%eax
 2cb:	74 0a                	je     2d7 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 2cd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 2d2:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 2d7:	50                   	push   %eax
 2d8:	ff 75 10             	push   0x10(%ebp)
 2db:	ff 75 0c             	push   0xc(%ebp)
 2de:	ff 75 08             	push   0x8(%ebp)
 2e1:	e8 00 01 00 00       	call   3e6 <clone>
}
 2e6:	c9                   	leave  
 2e7:	c3                   	ret    

000002e8 <thread_join>:

int thread_join(){
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
 2eb:	53                   	push   %ebx
 2ec:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 2ef:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2f2:	50                   	push   %eax
 2f3:	e8 f6 00 00 00       	call   3ee <join>
 2f8:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 2fa:	83 c4 04             	add    $0x4,%esp
 2fd:	ff 75 f4             	push   -0xc(%ebp)
 300:	e8 fc 02 00 00       	call   601 <free>
  return x;
}
 305:	89 d8                	mov    %ebx,%eax
 307:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30a:	c9                   	leave  
 30b:	c3                   	ret    

0000030c <lock_init>:

void lock_init(lock_t *spin){
 30c:	55                   	push   %ebp
 30d:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <lock_acquire>:

void lock_acquire(lock_t *spin){
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
 31d:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 320:	b8 01 00 00 00       	mov    $0x1,%eax
 325:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 328:	85 c0                	test   %eax,%eax
 32a:	75 f4                	jne    320 <lock_acquire+0x6>

}
 32c:	5d                   	pop    %ebp
 32d:	c3                   	ret    

0000032e <lock_release>:

void lock_release(lock_t *spin){
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	8b 55 08             	mov    0x8(%ebp),%edx
 334:	b8 00 00 00 00       	mov    $0x0,%eax
 339:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 33c:	5d                   	pop    %ebp
 33d:	c3                   	ret    

0000033e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33e:	b8 01 00 00 00       	mov    $0x1,%eax
 343:	cd 40                	int    $0x40
 345:	c3                   	ret    

00000346 <exit>:
SYSCALL(exit)
 346:	b8 02 00 00 00       	mov    $0x2,%eax
 34b:	cd 40                	int    $0x40
 34d:	c3                   	ret    

0000034e <wait>:
SYSCALL(wait)
 34e:	b8 03 00 00 00       	mov    $0x3,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret    

00000356 <pipe>:
SYSCALL(pipe)
 356:	b8 04 00 00 00       	mov    $0x4,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret    

0000035e <read>:
SYSCALL(read)
 35e:	b8 05 00 00 00       	mov    $0x5,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <write>:
SYSCALL(write)
 366:	b8 10 00 00 00       	mov    $0x10,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <close>:
SYSCALL(close)
 36e:	b8 15 00 00 00       	mov    $0x15,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <kill>:
SYSCALL(kill)
 376:	b8 06 00 00 00       	mov    $0x6,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <exec>:
SYSCALL(exec)
 37e:	b8 07 00 00 00       	mov    $0x7,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <open>:
SYSCALL(open)
 386:	b8 0f 00 00 00       	mov    $0xf,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <mknod>:
SYSCALL(mknod)
 38e:	b8 11 00 00 00       	mov    $0x11,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <unlink>:
SYSCALL(unlink)
 396:	b8 12 00 00 00       	mov    $0x12,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <fstat>:
SYSCALL(fstat)
 39e:	b8 08 00 00 00       	mov    $0x8,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <link>:
SYSCALL(link)
 3a6:	b8 13 00 00 00       	mov    $0x13,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <mkdir>:
SYSCALL(mkdir)
 3ae:	b8 14 00 00 00       	mov    $0x14,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <chdir>:
SYSCALL(chdir)
 3b6:	b8 09 00 00 00       	mov    $0x9,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <dup>:
SYSCALL(dup)
 3be:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <getpid>:
SYSCALL(getpid)
 3c6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <sbrk>:
SYSCALL(sbrk)
 3ce:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <sleep>:
SYSCALL(sleep)
 3d6:	b8 0d 00 00 00       	mov    $0xd,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <uptime>:
SYSCALL(uptime)
 3de:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <clone>:
SYSCALL(clone)
 3e6:	b8 16 00 00 00       	mov    $0x16,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <join>:
 3ee:	b8 17 00 00 00       	mov    $0x17,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f6:	55                   	push   %ebp
 3f7:	89 e5                	mov    %esp,%ebp
 3f9:	83 ec 1c             	sub    $0x1c,%esp
 3fc:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3ff:	6a 01                	push   $0x1
 401:	8d 55 f4             	lea    -0xc(%ebp),%edx
 404:	52                   	push   %edx
 405:	50                   	push   %eax
 406:	e8 5b ff ff ff       	call   366 <write>
}
 40b:	83 c4 10             	add    $0x10,%esp
 40e:	c9                   	leave  
 40f:	c3                   	ret    

00000410 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 2c             	sub    $0x2c,%esp
 419:	89 45 d0             	mov    %eax,-0x30(%ebp)
 41c:	89 d0                	mov    %edx,%eax
 41e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 420:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 424:	0f 95 c1             	setne  %cl
 427:	c1 ea 1f             	shr    $0x1f,%edx
 42a:	84 d1                	test   %dl,%cl
 42c:	74 44                	je     472 <printint+0x62>
    neg = 1;
    x = -xx;
 42e:	f7 d8                	neg    %eax
 430:	89 c1                	mov    %eax,%ecx
    neg = 1;
 432:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 439:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 43e:	89 c8                	mov    %ecx,%eax
 440:	ba 00 00 00 00       	mov    $0x0,%edx
 445:	f7 f6                	div    %esi
 447:	89 df                	mov    %ebx,%edi
 449:	83 c3 01             	add    $0x1,%ebx
 44c:	0f b6 92 cc 07 00 00 	movzbl 0x7cc(%edx),%edx
 453:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 457:	89 ca                	mov    %ecx,%edx
 459:	89 c1                	mov    %eax,%ecx
 45b:	39 d6                	cmp    %edx,%esi
 45d:	76 df                	jbe    43e <printint+0x2e>
  if(neg)
 45f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 463:	74 31                	je     496 <printint+0x86>
    buf[i++] = '-';
 465:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 46a:	8d 5f 02             	lea    0x2(%edi),%ebx
 46d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 470:	eb 17                	jmp    489 <printint+0x79>
    x = xx;
 472:	89 c1                	mov    %eax,%ecx
  neg = 0;
 474:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 47b:	eb bc                	jmp    439 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 47d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 482:	89 f0                	mov    %esi,%eax
 484:	e8 6d ff ff ff       	call   3f6 <putc>
  while(--i >= 0)
 489:	83 eb 01             	sub    $0x1,%ebx
 48c:	79 ef                	jns    47d <printint+0x6d>
}
 48e:	83 c4 2c             	add    $0x2c,%esp
 491:	5b                   	pop    %ebx
 492:	5e                   	pop    %esi
 493:	5f                   	pop    %edi
 494:	5d                   	pop    %ebp
 495:	c3                   	ret    
 496:	8b 75 d0             	mov    -0x30(%ebp),%esi
 499:	eb ee                	jmp    489 <printint+0x79>

0000049b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 49b:	55                   	push   %ebp
 49c:	89 e5                	mov    %esp,%ebp
 49e:	57                   	push   %edi
 49f:	56                   	push   %esi
 4a0:	53                   	push   %ebx
 4a1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4a4:	8d 45 10             	lea    0x10(%ebp),%eax
 4a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4aa:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4af:	bb 00 00 00 00       	mov    $0x0,%ebx
 4b4:	eb 14                	jmp    4ca <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4b6:	89 fa                	mov    %edi,%edx
 4b8:	8b 45 08             	mov    0x8(%ebp),%eax
 4bb:	e8 36 ff ff ff       	call   3f6 <putc>
 4c0:	eb 05                	jmp    4c7 <printf+0x2c>
      }
    } else if(state == '%'){
 4c2:	83 fe 25             	cmp    $0x25,%esi
 4c5:	74 25                	je     4ec <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4c7:	83 c3 01             	add    $0x1,%ebx
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4d1:	84 c0                	test   %al,%al
 4d3:	0f 84 20 01 00 00    	je     5f9 <printf+0x15e>
    c = fmt[i] & 0xff;
 4d9:	0f be f8             	movsbl %al,%edi
 4dc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4df:	85 f6                	test   %esi,%esi
 4e1:	75 df                	jne    4c2 <printf+0x27>
      if(c == '%'){
 4e3:	83 f8 25             	cmp    $0x25,%eax
 4e6:	75 ce                	jne    4b6 <printf+0x1b>
        state = '%';
 4e8:	89 c6                	mov    %eax,%esi
 4ea:	eb db                	jmp    4c7 <printf+0x2c>
      if(c == 'd'){
 4ec:	83 f8 25             	cmp    $0x25,%eax
 4ef:	0f 84 cf 00 00 00    	je     5c4 <printf+0x129>
 4f5:	0f 8c dd 00 00 00    	jl     5d8 <printf+0x13d>
 4fb:	83 f8 78             	cmp    $0x78,%eax
 4fe:	0f 8f d4 00 00 00    	jg     5d8 <printf+0x13d>
 504:	83 f8 63             	cmp    $0x63,%eax
 507:	0f 8c cb 00 00 00    	jl     5d8 <printf+0x13d>
 50d:	83 e8 63             	sub    $0x63,%eax
 510:	83 f8 15             	cmp    $0x15,%eax
 513:	0f 87 bf 00 00 00    	ja     5d8 <printf+0x13d>
 519:	ff 24 85 74 07 00 00 	jmp    *0x774(,%eax,4)
        printint(fd, *ap, 10, 1);
 520:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 523:	8b 17                	mov    (%edi),%edx
 525:	83 ec 0c             	sub    $0xc,%esp
 528:	6a 01                	push   $0x1
 52a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	e8 d9 fe ff ff       	call   410 <printint>
        ap++;
 537:	83 c7 04             	add    $0x4,%edi
 53a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 53d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 540:	be 00 00 00 00       	mov    $0x0,%esi
 545:	eb 80                	jmp    4c7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 547:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 54a:	8b 17                	mov    (%edi),%edx
 54c:	83 ec 0c             	sub    $0xc,%esp
 54f:	6a 00                	push   $0x0
 551:	b9 10 00 00 00       	mov    $0x10,%ecx
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	e8 b2 fe ff ff       	call   410 <printint>
        ap++;
 55e:	83 c7 04             	add    $0x4,%edi
 561:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 564:	83 c4 10             	add    $0x10,%esp
      state = 0;
 567:	be 00 00 00 00       	mov    $0x0,%esi
 56c:	e9 56 ff ff ff       	jmp    4c7 <printf+0x2c>
        s = (char*)*ap;
 571:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 574:	8b 30                	mov    (%eax),%esi
        ap++;
 576:	83 c0 04             	add    $0x4,%eax
 579:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 57c:	85 f6                	test   %esi,%esi
 57e:	75 15                	jne    595 <printf+0xfa>
          s = "(null)";
 580:	be 6b 07 00 00       	mov    $0x76b,%esi
 585:	eb 0e                	jmp    595 <printf+0xfa>
          putc(fd, *s);
 587:	0f be d2             	movsbl %dl,%edx
 58a:	8b 45 08             	mov    0x8(%ebp),%eax
 58d:	e8 64 fe ff ff       	call   3f6 <putc>
          s++;
 592:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 595:	0f b6 16             	movzbl (%esi),%edx
 598:	84 d2                	test   %dl,%dl
 59a:	75 eb                	jne    587 <printf+0xec>
      state = 0;
 59c:	be 00 00 00 00       	mov    $0x0,%esi
 5a1:	e9 21 ff ff ff       	jmp    4c7 <printf+0x2c>
        putc(fd, *ap);
 5a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5a9:	0f be 17             	movsbl (%edi),%edx
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	e8 42 fe ff ff       	call   3f6 <putc>
        ap++;
 5b4:	83 c7 04             	add    $0x4,%edi
 5b7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5ba:	be 00 00 00 00       	mov    $0x0,%esi
 5bf:	e9 03 ff ff ff       	jmp    4c7 <printf+0x2c>
        putc(fd, c);
 5c4:	89 fa                	mov    %edi,%edx
 5c6:	8b 45 08             	mov    0x8(%ebp),%eax
 5c9:	e8 28 fe ff ff       	call   3f6 <putc>
      state = 0;
 5ce:	be 00 00 00 00       	mov    $0x0,%esi
 5d3:	e9 ef fe ff ff       	jmp    4c7 <printf+0x2c>
        putc(fd, '%');
 5d8:	ba 25 00 00 00       	mov    $0x25,%edx
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	e8 11 fe ff ff       	call   3f6 <putc>
        putc(fd, c);
 5e5:	89 fa                	mov    %edi,%edx
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	e8 07 fe ff ff       	call   3f6 <putc>
      state = 0;
 5ef:	be 00 00 00 00       	mov    $0x0,%esi
 5f4:	e9 ce fe ff ff       	jmp    4c7 <printf+0x2c>
    }
  }
}
 5f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fc:	5b                   	pop    %ebx
 5fd:	5e                   	pop    %esi
 5fe:	5f                   	pop    %edi
 5ff:	5d                   	pop    %ebp
 600:	c3                   	ret    

00000601 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 601:	55                   	push   %ebp
 602:	89 e5                	mov    %esp,%ebp
 604:	57                   	push   %edi
 605:	56                   	push   %esi
 606:	53                   	push   %ebx
 607:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 60a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60d:	a1 18 0b 00 00       	mov    0xb18,%eax
 612:	eb 02                	jmp    616 <free+0x15>
 614:	89 d0                	mov    %edx,%eax
 616:	39 c8                	cmp    %ecx,%eax
 618:	73 04                	jae    61e <free+0x1d>
 61a:	39 08                	cmp    %ecx,(%eax)
 61c:	77 12                	ja     630 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61e:	8b 10                	mov    (%eax),%edx
 620:	39 c2                	cmp    %eax,%edx
 622:	77 f0                	ja     614 <free+0x13>
 624:	39 c8                	cmp    %ecx,%eax
 626:	72 08                	jb     630 <free+0x2f>
 628:	39 ca                	cmp    %ecx,%edx
 62a:	77 04                	ja     630 <free+0x2f>
 62c:	89 d0                	mov    %edx,%eax
 62e:	eb e6                	jmp    616 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 630:	8b 73 fc             	mov    -0x4(%ebx),%esi
 633:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 636:	8b 10                	mov    (%eax),%edx
 638:	39 d7                	cmp    %edx,%edi
 63a:	74 19                	je     655 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 63c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 63f:	8b 50 04             	mov    0x4(%eax),%edx
 642:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 645:	39 ce                	cmp    %ecx,%esi
 647:	74 1b                	je     664 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 649:	89 08                	mov    %ecx,(%eax)
  freep = p;
 64b:	a3 18 0b 00 00       	mov    %eax,0xb18
}
 650:	5b                   	pop    %ebx
 651:	5e                   	pop    %esi
 652:	5f                   	pop    %edi
 653:	5d                   	pop    %ebp
 654:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 655:	03 72 04             	add    0x4(%edx),%esi
 658:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 65b:	8b 10                	mov    (%eax),%edx
 65d:	8b 12                	mov    (%edx),%edx
 65f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 662:	eb db                	jmp    63f <free+0x3e>
    p->s.size += bp->s.size;
 664:	03 53 fc             	add    -0x4(%ebx),%edx
 667:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 66a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 66d:	89 10                	mov    %edx,(%eax)
 66f:	eb da                	jmp    64b <free+0x4a>

00000671 <morecore>:

static Header*
morecore(uint nu)
{
 671:	55                   	push   %ebp
 672:	89 e5                	mov    %esp,%ebp
 674:	53                   	push   %ebx
 675:	83 ec 04             	sub    $0x4,%esp
 678:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 67a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 67f:	77 05                	ja     686 <morecore+0x15>
    nu = 4096;
 681:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 686:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 68d:	83 ec 0c             	sub    $0xc,%esp
 690:	50                   	push   %eax
 691:	e8 38 fd ff ff       	call   3ce <sbrk>
  if(p == (char*)-1)
 696:	83 c4 10             	add    $0x10,%esp
 699:	83 f8 ff             	cmp    $0xffffffff,%eax
 69c:	74 1c                	je     6ba <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 69e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6a1:	83 c0 08             	add    $0x8,%eax
 6a4:	83 ec 0c             	sub    $0xc,%esp
 6a7:	50                   	push   %eax
 6a8:	e8 54 ff ff ff       	call   601 <free>
  return freep;
 6ad:	a1 18 0b 00 00       	mov    0xb18,%eax
 6b2:	83 c4 10             	add    $0x10,%esp
}
 6b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6b8:	c9                   	leave  
 6b9:	c3                   	ret    
    return 0;
 6ba:	b8 00 00 00 00       	mov    $0x0,%eax
 6bf:	eb f4                	jmp    6b5 <morecore+0x44>

000006c1 <malloc>:

void*
malloc(uint nbytes)
{
 6c1:	55                   	push   %ebp
 6c2:	89 e5                	mov    %esp,%ebp
 6c4:	53                   	push   %ebx
 6c5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c8:	8b 45 08             	mov    0x8(%ebp),%eax
 6cb:	8d 58 07             	lea    0x7(%eax),%ebx
 6ce:	c1 eb 03             	shr    $0x3,%ebx
 6d1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6d4:	8b 0d 18 0b 00 00    	mov    0xb18,%ecx
 6da:	85 c9                	test   %ecx,%ecx
 6dc:	74 04                	je     6e2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6de:	8b 01                	mov    (%ecx),%eax
 6e0:	eb 4a                	jmp    72c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6e2:	c7 05 18 0b 00 00 1c 	movl   $0xb1c,0xb18
 6e9:	0b 00 00 
 6ec:	c7 05 1c 0b 00 00 1c 	movl   $0xb1c,0xb1c
 6f3:	0b 00 00 
    base.s.size = 0;
 6f6:	c7 05 20 0b 00 00 00 	movl   $0x0,0xb20
 6fd:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 700:	b9 1c 0b 00 00       	mov    $0xb1c,%ecx
 705:	eb d7                	jmp    6de <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 707:	74 19                	je     722 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 709:	29 da                	sub    %ebx,%edx
 70b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 70e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 711:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 714:	89 0d 18 0b 00 00    	mov    %ecx,0xb18
      return (void*)(p + 1);
 71a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 71d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 720:	c9                   	leave  
 721:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 722:	8b 10                	mov    (%eax),%edx
 724:	89 11                	mov    %edx,(%ecx)
 726:	eb ec                	jmp    714 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 728:	89 c1                	mov    %eax,%ecx
 72a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 72c:	8b 50 04             	mov    0x4(%eax),%edx
 72f:	39 da                	cmp    %ebx,%edx
 731:	73 d4                	jae    707 <malloc+0x46>
    if(p == freep)
 733:	39 05 18 0b 00 00    	cmp    %eax,0xb18
 739:	75 ed                	jne    728 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 73b:	89 d8                	mov    %ebx,%eax
 73d:	e8 2f ff ff ff       	call   671 <morecore>
 742:	85 c0                	test   %eax,%eax
 744:	75 e2                	jne    728 <malloc+0x67>
 746:	eb d5                	jmp    71d <malloc+0x5c>
