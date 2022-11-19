
_test_1:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
   6:	a1 54 0c 00 00       	mov    0xc54,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 14 08 00 00       	push   $0x814
  17:	68 1d 08 00 00       	push   $0x81d
  1c:	6a 01                	push   $0x1
  1e:	e8 42 05 00 00       	call   565 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 25 08 00 00       	push   $0x825
  2b:	68 31 08 00 00       	push   $0x831
  30:	6a 01                	push   $0x1
  32:	e8 2e 05 00 00       	call   565 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 45 08 00 00       	push   $0x845
  3f:	6a 01                	push   $0x1
  41:	e8 1f 05 00 00       	call   565 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 58 0c 00 00    	push   0xc58
  4f:	e8 ec 03 00 00       	call   440 <kill>
  54:	e8 b7 03 00 00       	call   410 <exit>
   global = 5;
  59:	c7 05 54 0c 00 00 05 	movl   $0x5,0xc54
  60:	00 00 00 
   exit();
  63:	e8 a8 03 00 00       	call   410 <exit>

00000068 <main>:
{
  68:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6c:	83 e4 f0             	and    $0xfffffff0,%esp
  6f:	ff 71 fc             	push   -0x4(%ecx)
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	56                   	push   %esi
  76:	53                   	push   %ebx
  77:	51                   	push   %ecx
  78:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  7b:	e8 10 04 00 00       	call   490 <getpid>
  80:	a3 58 0c 00 00       	mov    %eax,0xc58
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 f9 06 00 00       	call   78b <malloc>
   assert(p != NULL);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	0f 84 a9 00 00 00    	je     146 <main+0xde>
  9d:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  9f:	89 c2                	mov    %eax,%edx
  a1:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  a7:	74 09                	je     b2 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  a9:	b8 00 10 00 00       	mov    $0x1000,%eax
  ae:	29 d0                	sub    %edx,%eax
  b0:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, 0, 0, stack);
  b2:	50                   	push   %eax
  b3:	6a 00                	push   $0x0
  b5:	6a 00                	push   $0x0
  b7:	68 00 00 00 00       	push   $0x0
  bc:	e8 ef 03 00 00       	call   4b0 <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 54 0c 00 00       	mov    0xc54,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 6a 08 00 00       	push   $0x86a
  e0:	6a 01                	push   $0x1
  e2:	e8 7e 04 00 00       	call   565 <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 c6 03 00 00       	call   4b8 <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 14 08 00 00       	push   $0x814
 104:	68 1d 08 00 00       	push   $0x81d
 109:	6a 01                	push   $0x1
 10b:	e8 55 04 00 00       	call   565 <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 77 08 00 00       	push   $0x877
 118:	68 31 08 00 00       	push   $0x831
 11d:	6a 01                	push   $0x1
 11f:	e8 41 04 00 00       	call   565 <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 45 08 00 00       	push   $0x845
 12c:	6a 01                	push   $0x1
 12e:	e8 32 04 00 00       	call   565 <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 58 0c 00 00    	push   0xc58
 13c:	e8 ff 02 00 00       	call   440 <kill>
 141:	e8 ca 02 00 00       	call   410 <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 14 08 00 00       	push   $0x814
 14d:	68 1d 08 00 00       	push   $0x81d
 152:	6a 01                	push   $0x1
 154:	e8 0c 04 00 00       	call   565 <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 52 08 00 00       	push   $0x852
 161:	68 31 08 00 00       	push   $0x831
 166:	6a 01                	push   $0x1
 168:	e8 f8 03 00 00       	call   565 <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 45 08 00 00       	push   $0x845
 175:	6a 01                	push   $0x1
 177:	e8 e9 03 00 00       	call   565 <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 58 0c 00 00    	push   0xc58
 185:	e8 b6 02 00 00       	call   440 <kill>
 18a:	e8 81 02 00 00       	call   410 <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 14 08 00 00       	push   $0x814
 196:	68 1d 08 00 00       	push   $0x81d
 19b:	6a 01                	push   $0x1
 19d:	e8 c3 03 00 00       	call   565 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 5c 08 00 00       	push   $0x85c
 1aa:	68 31 08 00 00       	push   $0x831
 1af:	6a 01                	push   $0x1
 1b1:	e8 af 03 00 00       	call   565 <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 45 08 00 00       	push   $0x845
 1be:	6a 01                	push   $0x1
 1c0:	e8 a0 03 00 00       	call   565 <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 58 0c 00 00    	push   0xc58
 1ce:	e8 6d 02 00 00       	call   440 <kill>
 1d3:	e8 38 02 00 00       	call   410 <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 ea 04 00 00       	call   6cb <free>
   exit();
 1e1:	e8 2a 02 00 00       	call   410 <exit>

000001e6 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	56                   	push   %esi
 1ea:	53                   	push   %ebx
 1eb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f1:	89 f0                	mov    %esi,%eax
 1f3:	89 d1                	mov    %edx,%ecx
 1f5:	83 c2 01             	add    $0x1,%edx
 1f8:	89 c3                	mov    %eax,%ebx
 1fa:	83 c0 01             	add    $0x1,%eax
 1fd:	0f b6 09             	movzbl (%ecx),%ecx
 200:	88 0b                	mov    %cl,(%ebx)
 202:	84 c9                	test   %cl,%cl
 204:	75 ed                	jne    1f3 <strcpy+0xd>
    ;
  return os;
}
 206:	89 f0                	mov    %esi,%eax
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    

0000020c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 20c:	55                   	push   %ebp
 20d:	89 e5                	mov    %esp,%ebp
 20f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 212:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 215:	eb 06                	jmp    21d <strcmp+0x11>
    p++, q++;
 217:	83 c1 01             	add    $0x1,%ecx
 21a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 21d:	0f b6 01             	movzbl (%ecx),%eax
 220:	84 c0                	test   %al,%al
 222:	74 04                	je     228 <strcmp+0x1c>
 224:	3a 02                	cmp    (%edx),%al
 226:	74 ef                	je     217 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 228:	0f b6 c0             	movzbl %al,%eax
 22b:	0f b6 12             	movzbl (%edx),%edx
 22e:	29 d0                	sub    %edx,%eax
}
 230:	5d                   	pop    %ebp
 231:	c3                   	ret    

00000232 <strlen>:

uint
strlen(const char *s)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 238:	b8 00 00 00 00       	mov    $0x0,%eax
 23d:	eb 03                	jmp    242 <strlen+0x10>
 23f:	83 c0 01             	add    $0x1,%eax
 242:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 246:	75 f7                	jne    23f <strlen+0xd>
    ;
  return n;
}
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <memset>:

void*
memset(void *dst, int c, uint n)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	57                   	push   %edi
 24e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 251:	89 d7                	mov    %edx,%edi
 253:	8b 4d 10             	mov    0x10(%ebp),%ecx
 256:	8b 45 0c             	mov    0xc(%ebp),%eax
 259:	fc                   	cld    
 25a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 25c:	89 d0                	mov    %edx,%eax
 25e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <strchr>:

char*
strchr(const char *s, char c)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26d:	eb 03                	jmp    272 <strchr+0xf>
 26f:	83 c0 01             	add    $0x1,%eax
 272:	0f b6 10             	movzbl (%eax),%edx
 275:	84 d2                	test   %dl,%dl
 277:	74 06                	je     27f <strchr+0x1c>
    if(*s == c)
 279:	38 ca                	cmp    %cl,%dl
 27b:	75 f2                	jne    26f <strchr+0xc>
 27d:	eb 05                	jmp    284 <strchr+0x21>
      return (char*)s;
  return 0;
 27f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 284:	5d                   	pop    %ebp
 285:	c3                   	ret    

00000286 <gets>:

char*
gets(char *buf, int max)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	57                   	push   %edi
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	83 ec 1c             	sub    $0x1c,%esp
 28f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 292:	bb 00 00 00 00       	mov    $0x0,%ebx
 297:	89 de                	mov    %ebx,%esi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7d 2e                	jge    2cf <gets+0x49>
    cc = read(0, &c, 1);
 2a1:	83 ec 04             	sub    $0x4,%esp
 2a4:	6a 01                	push   $0x1
 2a6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a9:	50                   	push   %eax
 2aa:	6a 00                	push   $0x0
 2ac:	e8 77 01 00 00       	call   428 <read>
    if(cc < 1)
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	85 c0                	test   %eax,%eax
 2b6:	7e 17                	jle    2cf <gets+0x49>
      break;
    buf[i++] = c;
 2b8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2bc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2bf:	3c 0a                	cmp    $0xa,%al
 2c1:	0f 94 c2             	sete   %dl
 2c4:	3c 0d                	cmp    $0xd,%al
 2c6:	0f 94 c0             	sete   %al
 2c9:	08 c2                	or     %al,%dl
 2cb:	74 ca                	je     297 <gets+0x11>
    buf[i++] = c;
 2cd:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2cf:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2d3:	89 f8                	mov    %edi,%eax
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    

000002dd <stat>:

int
stat(const char *n, struct stat *st)
{
 2dd:	55                   	push   %ebp
 2de:	89 e5                	mov    %esp,%ebp
 2e0:	56                   	push   %esi
 2e1:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e2:	83 ec 08             	sub    $0x8,%esp
 2e5:	6a 00                	push   $0x0
 2e7:	ff 75 08             	push   0x8(%ebp)
 2ea:	e8 61 01 00 00       	call   450 <open>
  if(fd < 0)
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	85 c0                	test   %eax,%eax
 2f4:	78 24                	js     31a <stat+0x3d>
 2f6:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2f8:	83 ec 08             	sub    $0x8,%esp
 2fb:	ff 75 0c             	push   0xc(%ebp)
 2fe:	50                   	push   %eax
 2ff:	e8 64 01 00 00       	call   468 <fstat>
 304:	89 c6                	mov    %eax,%esi
  close(fd);
 306:	89 1c 24             	mov    %ebx,(%esp)
 309:	e8 2a 01 00 00       	call   438 <close>
  return r;
 30e:	83 c4 10             	add    $0x10,%esp
}
 311:	89 f0                	mov    %esi,%eax
 313:	8d 65 f8             	lea    -0x8(%ebp),%esp
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
    return -1;
 31a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 31f:	eb f0                	jmp    311 <stat+0x34>

00000321 <atoi>:

int
atoi(const char *s)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	53                   	push   %ebx
 325:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 328:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 32d:	eb 10                	jmp    33f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 32f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 332:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 335:	83 c1 01             	add    $0x1,%ecx
 338:	0f be c0             	movsbl %al,%eax
 33b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 33f:	0f b6 01             	movzbl (%ecx),%eax
 342:	8d 58 d0             	lea    -0x30(%eax),%ebx
 345:	80 fb 09             	cmp    $0x9,%bl
 348:	76 e5                	jbe    32f <atoi+0xe>
  return n;
}
 34a:	89 d0                	mov    %edx,%eax
 34c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34f:	c9                   	leave  
 350:	c3                   	ret    

00000351 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	8b 75 08             	mov    0x8(%ebp),%esi
 359:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 35c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 35f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 361:	eb 0d                	jmp    370 <memmove+0x1f>
    *dst++ = *src++;
 363:	0f b6 01             	movzbl (%ecx),%eax
 366:	88 02                	mov    %al,(%edx)
 368:	8d 49 01             	lea    0x1(%ecx),%ecx
 36b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 36e:	89 d8                	mov    %ebx,%eax
 370:	8d 58 ff             	lea    -0x1(%eax),%ebx
 373:	85 c0                	test   %eax,%eax
 375:	7f ec                	jg     363 <memmove+0x12>
  return vdst;
}
 377:	89 f0                	mov    %esi,%eax
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    

0000037d <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 37d:	55                   	push   %ebp
 37e:	89 e5                	mov    %esp,%ebp
 380:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 383:	68 00 20 00 00       	push   $0x2000
 388:	e8 fe 03 00 00       	call   78b <malloc>
  if ((uint)stack%PGSIZE){
 38d:	83 c4 10             	add    $0x10,%esp
 390:	a9 ff 0f 00 00       	test   $0xfff,%eax
 395:	74 0a                	je     3a1 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 397:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 39c:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 3a1:	50                   	push   %eax
 3a2:	ff 75 10             	push   0x10(%ebp)
 3a5:	ff 75 0c             	push   0xc(%ebp)
 3a8:	ff 75 08             	push   0x8(%ebp)
 3ab:	e8 00 01 00 00       	call   4b0 <clone>
}
 3b0:	c9                   	leave  
 3b1:	c3                   	ret    

000003b2 <thread_join>:

int thread_join(){
 3b2:	55                   	push   %ebp
 3b3:	89 e5                	mov    %esp,%ebp
 3b5:	53                   	push   %ebx
 3b6:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 3b9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3bc:	50                   	push   %eax
 3bd:	e8 f6 00 00 00       	call   4b8 <join>
 3c2:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 3c4:	83 c4 04             	add    $0x4,%esp
 3c7:	ff 75 f4             	push   -0xc(%ebp)
 3ca:	e8 fc 02 00 00       	call   6cb <free>
  return x;
}
 3cf:	89 d8                	mov    %ebx,%eax
 3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    

000003d6 <lock_init>:

void lock_init(lock_t *spin){
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 3d9:	8b 45 08             	mov    0x8(%ebp),%eax
 3dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    

000003e4 <lock_acquire>:

void lock_acquire(lock_t *spin){
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3ea:	b8 01 00 00 00       	mov    $0x1,%eax
 3ef:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 3f2:	85 c0                	test   %eax,%eax
 3f4:	75 f4                	jne    3ea <lock_acquire+0x6>

}
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    

000003f8 <lock_release>:

void lock_release(lock_t *spin){
 3f8:	55                   	push   %ebp
 3f9:	89 e5                	mov    %esp,%ebp
 3fb:	8b 55 08             	mov    0x8(%ebp),%edx
 3fe:	b8 00 00 00 00       	mov    $0x0,%eax
 403:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 406:	5d                   	pop    %ebp
 407:	c3                   	ret    

00000408 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 408:	b8 01 00 00 00       	mov    $0x1,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <exit>:
SYSCALL(exit)
 410:	b8 02 00 00 00       	mov    $0x2,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <wait>:
SYSCALL(wait)
 418:	b8 03 00 00 00       	mov    $0x3,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <pipe>:
SYSCALL(pipe)
 420:	b8 04 00 00 00       	mov    $0x4,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <read>:
SYSCALL(read)
 428:	b8 05 00 00 00       	mov    $0x5,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <write>:
SYSCALL(write)
 430:	b8 10 00 00 00       	mov    $0x10,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <close>:
SYSCALL(close)
 438:	b8 15 00 00 00       	mov    $0x15,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <kill>:
SYSCALL(kill)
 440:	b8 06 00 00 00       	mov    $0x6,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <exec>:
SYSCALL(exec)
 448:	b8 07 00 00 00       	mov    $0x7,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <open>:
SYSCALL(open)
 450:	b8 0f 00 00 00       	mov    $0xf,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <mknod>:
SYSCALL(mknod)
 458:	b8 11 00 00 00       	mov    $0x11,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <unlink>:
SYSCALL(unlink)
 460:	b8 12 00 00 00       	mov    $0x12,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <fstat>:
SYSCALL(fstat)
 468:	b8 08 00 00 00       	mov    $0x8,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <link>:
SYSCALL(link)
 470:	b8 13 00 00 00       	mov    $0x13,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <mkdir>:
SYSCALL(mkdir)
 478:	b8 14 00 00 00       	mov    $0x14,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <chdir>:
SYSCALL(chdir)
 480:	b8 09 00 00 00       	mov    $0x9,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <dup>:
SYSCALL(dup)
 488:	b8 0a 00 00 00       	mov    $0xa,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <getpid>:
SYSCALL(getpid)
 490:	b8 0b 00 00 00       	mov    $0xb,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <sbrk>:
SYSCALL(sbrk)
 498:	b8 0c 00 00 00       	mov    $0xc,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <sleep>:
SYSCALL(sleep)
 4a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <uptime>:
SYSCALL(uptime)
 4a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <clone>:
SYSCALL(clone)
 4b0:	b8 16 00 00 00       	mov    $0x16,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <join>:
 4b8:	b8 17 00 00 00       	mov    $0x17,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	83 ec 1c             	sub    $0x1c,%esp
 4c6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4c9:	6a 01                	push   $0x1
 4cb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4ce:	52                   	push   %edx
 4cf:	50                   	push   %eax
 4d0:	e8 5b ff ff ff       	call   430 <write>
}
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	c9                   	leave  
 4d9:	c3                   	ret    

000004da <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4da:	55                   	push   %ebp
 4db:	89 e5                	mov    %esp,%ebp
 4dd:	57                   	push   %edi
 4de:	56                   	push   %esi
 4df:	53                   	push   %ebx
 4e0:	83 ec 2c             	sub    $0x2c,%esp
 4e3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e6:	89 d0                	mov    %edx,%eax
 4e8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ea:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4ee:	0f 95 c1             	setne  %cl
 4f1:	c1 ea 1f             	shr    $0x1f,%edx
 4f4:	84 d1                	test   %dl,%cl
 4f6:	74 44                	je     53c <printint+0x62>
    neg = 1;
    x = -xx;
 4f8:	f7 d8                	neg    %eax
 4fa:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4fc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 503:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 508:	89 c8                	mov    %ecx,%eax
 50a:	ba 00 00 00 00       	mov    $0x0,%edx
 50f:	f7 f6                	div    %esi
 511:	89 df                	mov    %ebx,%edi
 513:	83 c3 01             	add    $0x1,%ebx
 516:	0f b6 92 ec 08 00 00 	movzbl 0x8ec(%edx),%edx
 51d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 521:	89 ca                	mov    %ecx,%edx
 523:	89 c1                	mov    %eax,%ecx
 525:	39 d6                	cmp    %edx,%esi
 527:	76 df                	jbe    508 <printint+0x2e>
  if(neg)
 529:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 52d:	74 31                	je     560 <printint+0x86>
    buf[i++] = '-';
 52f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 534:	8d 5f 02             	lea    0x2(%edi),%ebx
 537:	8b 75 d0             	mov    -0x30(%ebp),%esi
 53a:	eb 17                	jmp    553 <printint+0x79>
    x = xx;
 53c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 53e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 545:	eb bc                	jmp    503 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 547:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 54c:	89 f0                	mov    %esi,%eax
 54e:	e8 6d ff ff ff       	call   4c0 <putc>
  while(--i >= 0)
 553:	83 eb 01             	sub    $0x1,%ebx
 556:	79 ef                	jns    547 <printint+0x6d>
}
 558:	83 c4 2c             	add    $0x2c,%esp
 55b:	5b                   	pop    %ebx
 55c:	5e                   	pop    %esi
 55d:	5f                   	pop    %edi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
 560:	8b 75 d0             	mov    -0x30(%ebp),%esi
 563:	eb ee                	jmp    553 <printint+0x79>

00000565 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	57                   	push   %edi
 569:	56                   	push   %esi
 56a:	53                   	push   %ebx
 56b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 56e:	8d 45 10             	lea    0x10(%ebp),%eax
 571:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 574:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 579:	bb 00 00 00 00       	mov    $0x0,%ebx
 57e:	eb 14                	jmp    594 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 580:	89 fa                	mov    %edi,%edx
 582:	8b 45 08             	mov    0x8(%ebp),%eax
 585:	e8 36 ff ff ff       	call   4c0 <putc>
 58a:	eb 05                	jmp    591 <printf+0x2c>
      }
    } else if(state == '%'){
 58c:	83 fe 25             	cmp    $0x25,%esi
 58f:	74 25                	je     5b6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 591:	83 c3 01             	add    $0x1,%ebx
 594:	8b 45 0c             	mov    0xc(%ebp),%eax
 597:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 59b:	84 c0                	test   %al,%al
 59d:	0f 84 20 01 00 00    	je     6c3 <printf+0x15e>
    c = fmt[i] & 0xff;
 5a3:	0f be f8             	movsbl %al,%edi
 5a6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5a9:	85 f6                	test   %esi,%esi
 5ab:	75 df                	jne    58c <printf+0x27>
      if(c == '%'){
 5ad:	83 f8 25             	cmp    $0x25,%eax
 5b0:	75 ce                	jne    580 <printf+0x1b>
        state = '%';
 5b2:	89 c6                	mov    %eax,%esi
 5b4:	eb db                	jmp    591 <printf+0x2c>
      if(c == 'd'){
 5b6:	83 f8 25             	cmp    $0x25,%eax
 5b9:	0f 84 cf 00 00 00    	je     68e <printf+0x129>
 5bf:	0f 8c dd 00 00 00    	jl     6a2 <printf+0x13d>
 5c5:	83 f8 78             	cmp    $0x78,%eax
 5c8:	0f 8f d4 00 00 00    	jg     6a2 <printf+0x13d>
 5ce:	83 f8 63             	cmp    $0x63,%eax
 5d1:	0f 8c cb 00 00 00    	jl     6a2 <printf+0x13d>
 5d7:	83 e8 63             	sub    $0x63,%eax
 5da:	83 f8 15             	cmp    $0x15,%eax
 5dd:	0f 87 bf 00 00 00    	ja     6a2 <printf+0x13d>
 5e3:	ff 24 85 94 08 00 00 	jmp    *0x894(,%eax,4)
        printint(fd, *ap, 10, 1);
 5ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ed:	8b 17                	mov    (%edi),%edx
 5ef:	83 ec 0c             	sub    $0xc,%esp
 5f2:	6a 01                	push   $0x1
 5f4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	e8 d9 fe ff ff       	call   4da <printint>
        ap++;
 601:	83 c7 04             	add    $0x4,%edi
 604:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 607:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 60a:	be 00 00 00 00       	mov    $0x0,%esi
 60f:	eb 80                	jmp    591 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 611:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 614:	8b 17                	mov    (%edi),%edx
 616:	83 ec 0c             	sub    $0xc,%esp
 619:	6a 00                	push   $0x0
 61b:	b9 10 00 00 00       	mov    $0x10,%ecx
 620:	8b 45 08             	mov    0x8(%ebp),%eax
 623:	e8 b2 fe ff ff       	call   4da <printint>
        ap++;
 628:	83 c7 04             	add    $0x4,%edi
 62b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 62e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 631:	be 00 00 00 00       	mov    $0x0,%esi
 636:	e9 56 ff ff ff       	jmp    591 <printf+0x2c>
        s = (char*)*ap;
 63b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63e:	8b 30                	mov    (%eax),%esi
        ap++;
 640:	83 c0 04             	add    $0x4,%eax
 643:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 646:	85 f6                	test   %esi,%esi
 648:	75 15                	jne    65f <printf+0xfa>
          s = "(null)";
 64a:	be 8d 08 00 00       	mov    $0x88d,%esi
 64f:	eb 0e                	jmp    65f <printf+0xfa>
          putc(fd, *s);
 651:	0f be d2             	movsbl %dl,%edx
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	e8 64 fe ff ff       	call   4c0 <putc>
          s++;
 65c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 65f:	0f b6 16             	movzbl (%esi),%edx
 662:	84 d2                	test   %dl,%dl
 664:	75 eb                	jne    651 <printf+0xec>
      state = 0;
 666:	be 00 00 00 00       	mov    $0x0,%esi
 66b:	e9 21 ff ff ff       	jmp    591 <printf+0x2c>
        putc(fd, *ap);
 670:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 673:	0f be 17             	movsbl (%edi),%edx
 676:	8b 45 08             	mov    0x8(%ebp),%eax
 679:	e8 42 fe ff ff       	call   4c0 <putc>
        ap++;
 67e:	83 c7 04             	add    $0x4,%edi
 681:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 684:	be 00 00 00 00       	mov    $0x0,%esi
 689:	e9 03 ff ff ff       	jmp    591 <printf+0x2c>
        putc(fd, c);
 68e:	89 fa                	mov    %edi,%edx
 690:	8b 45 08             	mov    0x8(%ebp),%eax
 693:	e8 28 fe ff ff       	call   4c0 <putc>
      state = 0;
 698:	be 00 00 00 00       	mov    $0x0,%esi
 69d:	e9 ef fe ff ff       	jmp    591 <printf+0x2c>
        putc(fd, '%');
 6a2:	ba 25 00 00 00       	mov    $0x25,%edx
 6a7:	8b 45 08             	mov    0x8(%ebp),%eax
 6aa:	e8 11 fe ff ff       	call   4c0 <putc>
        putc(fd, c);
 6af:	89 fa                	mov    %edi,%edx
 6b1:	8b 45 08             	mov    0x8(%ebp),%eax
 6b4:	e8 07 fe ff ff       	call   4c0 <putc>
      state = 0;
 6b9:	be 00 00 00 00       	mov    $0x0,%esi
 6be:	e9 ce fe ff ff       	jmp    591 <printf+0x2c>
    }
  }
}
 6c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c6:	5b                   	pop    %ebx
 6c7:	5e                   	pop    %esi
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    

000006cb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6cb:	55                   	push   %ebp
 6cc:	89 e5                	mov    %esp,%ebp
 6ce:	57                   	push   %edi
 6cf:	56                   	push   %esi
 6d0:	53                   	push   %ebx
 6d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d7:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 6dc:	eb 02                	jmp    6e0 <free+0x15>
 6de:	89 d0                	mov    %edx,%eax
 6e0:	39 c8                	cmp    %ecx,%eax
 6e2:	73 04                	jae    6e8 <free+0x1d>
 6e4:	39 08                	cmp    %ecx,(%eax)
 6e6:	77 12                	ja     6fa <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e8:	8b 10                	mov    (%eax),%edx
 6ea:	39 c2                	cmp    %eax,%edx
 6ec:	77 f0                	ja     6de <free+0x13>
 6ee:	39 c8                	cmp    %ecx,%eax
 6f0:	72 08                	jb     6fa <free+0x2f>
 6f2:	39 ca                	cmp    %ecx,%edx
 6f4:	77 04                	ja     6fa <free+0x2f>
 6f6:	89 d0                	mov    %edx,%eax
 6f8:	eb e6                	jmp    6e0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6fa:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6fd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 700:	8b 10                	mov    (%eax),%edx
 702:	39 d7                	cmp    %edx,%edi
 704:	74 19                	je     71f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 706:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 709:	8b 50 04             	mov    0x4(%eax),%edx
 70c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 70f:	39 ce                	cmp    %ecx,%esi
 711:	74 1b                	je     72e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 713:	89 08                	mov    %ecx,(%eax)
  freep = p;
 715:	a3 5c 0c 00 00       	mov    %eax,0xc5c
}
 71a:	5b                   	pop    %ebx
 71b:	5e                   	pop    %esi
 71c:	5f                   	pop    %edi
 71d:	5d                   	pop    %ebp
 71e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 71f:	03 72 04             	add    0x4(%edx),%esi
 722:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 725:	8b 10                	mov    (%eax),%edx
 727:	8b 12                	mov    (%edx),%edx
 729:	89 53 f8             	mov    %edx,-0x8(%ebx)
 72c:	eb db                	jmp    709 <free+0x3e>
    p->s.size += bp->s.size;
 72e:	03 53 fc             	add    -0x4(%ebx),%edx
 731:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 734:	8b 53 f8             	mov    -0x8(%ebx),%edx
 737:	89 10                	mov    %edx,(%eax)
 739:	eb da                	jmp    715 <free+0x4a>

0000073b <morecore>:

static Header*
morecore(uint nu)
{
 73b:	55                   	push   %ebp
 73c:	89 e5                	mov    %esp,%ebp
 73e:	53                   	push   %ebx
 73f:	83 ec 04             	sub    $0x4,%esp
 742:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 744:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 749:	77 05                	ja     750 <morecore+0x15>
    nu = 4096;
 74b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 750:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 757:	83 ec 0c             	sub    $0xc,%esp
 75a:	50                   	push   %eax
 75b:	e8 38 fd ff ff       	call   498 <sbrk>
  if(p == (char*)-1)
 760:	83 c4 10             	add    $0x10,%esp
 763:	83 f8 ff             	cmp    $0xffffffff,%eax
 766:	74 1c                	je     784 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 768:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 76b:	83 c0 08             	add    $0x8,%eax
 76e:	83 ec 0c             	sub    $0xc,%esp
 771:	50                   	push   %eax
 772:	e8 54 ff ff ff       	call   6cb <free>
  return freep;
 777:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 77c:	83 c4 10             	add    $0x10,%esp
}
 77f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 782:	c9                   	leave  
 783:	c3                   	ret    
    return 0;
 784:	b8 00 00 00 00       	mov    $0x0,%eax
 789:	eb f4                	jmp    77f <morecore+0x44>

0000078b <malloc>:

void*
malloc(uint nbytes)
{
 78b:	55                   	push   %ebp
 78c:	89 e5                	mov    %esp,%ebp
 78e:	53                   	push   %ebx
 78f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	8d 58 07             	lea    0x7(%eax),%ebx
 798:	c1 eb 03             	shr    $0x3,%ebx
 79b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 79e:	8b 0d 5c 0c 00 00    	mov    0xc5c,%ecx
 7a4:	85 c9                	test   %ecx,%ecx
 7a6:	74 04                	je     7ac <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a8:	8b 01                	mov    (%ecx),%eax
 7aa:	eb 4a                	jmp    7f6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7ac:	c7 05 5c 0c 00 00 60 	movl   $0xc60,0xc5c
 7b3:	0c 00 00 
 7b6:	c7 05 60 0c 00 00 60 	movl   $0xc60,0xc60
 7bd:	0c 00 00 
    base.s.size = 0;
 7c0:	c7 05 64 0c 00 00 00 	movl   $0x0,0xc64
 7c7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7ca:	b9 60 0c 00 00       	mov    $0xc60,%ecx
 7cf:	eb d7                	jmp    7a8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7d1:	74 19                	je     7ec <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7d3:	29 da                	sub    %ebx,%edx
 7d5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7db:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7de:	89 0d 5c 0c 00 00    	mov    %ecx,0xc5c
      return (void*)(p + 1);
 7e4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7ea:	c9                   	leave  
 7eb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7ec:	8b 10                	mov    (%eax),%edx
 7ee:	89 11                	mov    %edx,(%ecx)
 7f0:	eb ec                	jmp    7de <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f2:	89 c1                	mov    %eax,%ecx
 7f4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7f6:	8b 50 04             	mov    0x4(%eax),%edx
 7f9:	39 da                	cmp    %ebx,%edx
 7fb:	73 d4                	jae    7d1 <malloc+0x46>
    if(p == freep)
 7fd:	39 05 5c 0c 00 00    	cmp    %eax,0xc5c
 803:	75 ed                	jne    7f2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 805:	89 d8                	mov    %ebx,%eax
 807:	e8 2f ff ff ff       	call   73b <morecore>
 80c:	85 c0                	test   %eax,%eax
 80e:	75 e2                	jne    7f2 <malloc+0x67>
 810:	eb d5                	jmp    7e7 <malloc+0x5c>
