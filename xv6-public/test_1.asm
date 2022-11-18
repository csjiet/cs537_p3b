
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
  12:	68 10 08 00 00       	push   $0x810
  17:	68 19 08 00 00       	push   $0x819
  1c:	6a 01                	push   $0x1
  1e:	e8 3f 05 00 00       	call   562 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 21 08 00 00       	push   $0x821
  2b:	68 2d 08 00 00       	push   $0x82d
  30:	6a 01                	push   $0x1
  32:	e8 2b 05 00 00       	call   562 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 41 08 00 00       	push   $0x841
  3f:	6a 01                	push   $0x1
  41:	e8 1c 05 00 00       	call   562 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 58 0c 00 00    	push   0xc58
  4f:	e8 e9 03 00 00       	call   43d <kill>
  54:	e8 b4 03 00 00       	call   40d <exit>
   global = 5;
  59:	c7 05 54 0c 00 00 05 	movl   $0x5,0xc54
  60:	00 00 00 
   exit();
  63:	e8 a5 03 00 00       	call   40d <exit>

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
  7b:	e8 0d 04 00 00       	call   48d <getpid>
  80:	a3 58 0c 00 00       	mov    %eax,0xc58
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 f6 06 00 00       	call   788 <malloc>
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
  bc:	e8 ec 03 00 00       	call   4ad <clone>
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
  db:	68 66 08 00 00       	push   $0x866
  e0:	6a 01                	push   $0x1
  e2:	e8 7b 04 00 00       	call   562 <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 c3 03 00 00       	call   4b5 <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 10 08 00 00       	push   $0x810
 104:	68 19 08 00 00       	push   $0x819
 109:	6a 01                	push   $0x1
 10b:	e8 52 04 00 00       	call   562 <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 73 08 00 00       	push   $0x873
 118:	68 2d 08 00 00       	push   $0x82d
 11d:	6a 01                	push   $0x1
 11f:	e8 3e 04 00 00       	call   562 <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 41 08 00 00       	push   $0x841
 12c:	6a 01                	push   $0x1
 12e:	e8 2f 04 00 00       	call   562 <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 58 0c 00 00    	push   0xc58
 13c:	e8 fc 02 00 00       	call   43d <kill>
 141:	e8 c7 02 00 00       	call   40d <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 10 08 00 00       	push   $0x810
 14d:	68 19 08 00 00       	push   $0x819
 152:	6a 01                	push   $0x1
 154:	e8 09 04 00 00       	call   562 <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 4e 08 00 00       	push   $0x84e
 161:	68 2d 08 00 00       	push   $0x82d
 166:	6a 01                	push   $0x1
 168:	e8 f5 03 00 00       	call   562 <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 41 08 00 00       	push   $0x841
 175:	6a 01                	push   $0x1
 177:	e8 e6 03 00 00       	call   562 <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 58 0c 00 00    	push   0xc58
 185:	e8 b3 02 00 00       	call   43d <kill>
 18a:	e8 7e 02 00 00       	call   40d <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 10 08 00 00       	push   $0x810
 196:	68 19 08 00 00       	push   $0x819
 19b:	6a 01                	push   $0x1
 19d:	e8 c0 03 00 00       	call   562 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 58 08 00 00       	push   $0x858
 1aa:	68 2d 08 00 00       	push   $0x82d
 1af:	6a 01                	push   $0x1
 1b1:	e8 ac 03 00 00       	call   562 <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 41 08 00 00       	push   $0x841
 1be:	6a 01                	push   $0x1
 1c0:	e8 9d 03 00 00       	call   562 <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 58 0c 00 00    	push   0xc58
 1ce:	e8 6a 02 00 00       	call   43d <kill>
 1d3:	e8 35 02 00 00       	call   40d <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 e7 04 00 00       	call   6c8 <free>
   exit();
 1e1:	e8 27 02 00 00       	call   40d <exit>

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
 2ac:	e8 74 01 00 00       	call   425 <read>
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
 2ea:	e8 5e 01 00 00       	call   44d <open>
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
 2ff:	e8 61 01 00 00       	call   465 <fstat>
 304:	89 c6                	mov    %eax,%esi
  close(fd);
 306:	89 1c 24             	mov    %ebx,(%esp)
 309:	e8 27 01 00 00       	call   435 <close>
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

  void* stack = malloc(PGSIZE);
 383:	68 00 10 00 00       	push   $0x1000
 388:	e8 fb 03 00 00       	call   788 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 38d:	50                   	push   %eax
 38e:	ff 75 10             	push   0x10(%ebp)
 391:	ff 75 0c             	push   0xc(%ebp)
 394:	ff 75 08             	push   0x8(%ebp)
 397:	e8 11 01 00 00       	call   4ad <clone>
}
 39c:	c9                   	leave  
 39d:	c3                   	ret    

0000039e <thread_join>:

int thread_join(){
 39e:	55                   	push   %ebp
 39f:	89 e5                	mov    %esp,%ebp
 3a1:	53                   	push   %ebx
 3a2:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 3a5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3a8:	50                   	push   %eax
 3a9:	e8 07 01 00 00       	call   4b5 <join>
  if (x < 0) {
 3ae:	83 c4 10             	add    $0x10,%esp
 3b1:	85 c0                	test   %eax,%eax
 3b3:	78 17                	js     3cc <thread_join+0x2e>
 3b5:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 3b7:	83 ec 0c             	sub    $0xc,%esp
 3ba:	ff 75 f4             	push   -0xc(%ebp)
 3bd:	e8 06 03 00 00       	call   6c8 <free>
  return x;
 3c2:	83 c4 10             	add    $0x10,%esp
}
 3c5:	89 d8                	mov    %ebx,%eax
 3c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ca:	c9                   	leave  
 3cb:	c3                   	ret    
    return -1;
 3cc:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 3d1:	eb f2                	jmp    3c5 <thread_join+0x27>

000003d3 <lock_init>:

void lock_init(lock_t *spin){
 3d3:	55                   	push   %ebp
 3d4:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 3d6:	8b 45 08             	mov    0x8(%ebp),%eax
 3d9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3df:	5d                   	pop    %ebp
 3e0:	c3                   	ret    

000003e1 <lock_acquire>:

void lock_acquire(lock_t *spin){
 3e1:	55                   	push   %ebp
 3e2:	89 e5                	mov    %esp,%ebp
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3e7:	b8 01 00 00 00       	mov    $0x1,%eax
 3ec:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 3ef:	85 c0                	test   %eax,%eax
 3f1:	75 f4                	jne    3e7 <lock_acquire+0x6>

}
 3f3:	5d                   	pop    %ebp
 3f4:	c3                   	ret    

000003f5 <lock_release>:

void lock_release(lock_t *spin){
 3f5:	55                   	push   %ebp
 3f6:	89 e5                	mov    %esp,%ebp
 3f8:	8b 55 08             	mov    0x8(%ebp),%edx
 3fb:	b8 00 00 00 00       	mov    $0x0,%eax
 400:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 403:	5d                   	pop    %ebp
 404:	c3                   	ret    

00000405 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 405:	b8 01 00 00 00       	mov    $0x1,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <exit>:
SYSCALL(exit)
 40d:	b8 02 00 00 00       	mov    $0x2,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <wait>:
SYSCALL(wait)
 415:	b8 03 00 00 00       	mov    $0x3,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <pipe>:
SYSCALL(pipe)
 41d:	b8 04 00 00 00       	mov    $0x4,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <read>:
SYSCALL(read)
 425:	b8 05 00 00 00       	mov    $0x5,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <write>:
SYSCALL(write)
 42d:	b8 10 00 00 00       	mov    $0x10,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <close>:
SYSCALL(close)
 435:	b8 15 00 00 00       	mov    $0x15,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <kill>:
SYSCALL(kill)
 43d:	b8 06 00 00 00       	mov    $0x6,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <exec>:
SYSCALL(exec)
 445:	b8 07 00 00 00       	mov    $0x7,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <open>:
SYSCALL(open)
 44d:	b8 0f 00 00 00       	mov    $0xf,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <mknod>:
SYSCALL(mknod)
 455:	b8 11 00 00 00       	mov    $0x11,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <unlink>:
SYSCALL(unlink)
 45d:	b8 12 00 00 00       	mov    $0x12,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <fstat>:
SYSCALL(fstat)
 465:	b8 08 00 00 00       	mov    $0x8,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <link>:
SYSCALL(link)
 46d:	b8 13 00 00 00       	mov    $0x13,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <mkdir>:
SYSCALL(mkdir)
 475:	b8 14 00 00 00       	mov    $0x14,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <chdir>:
SYSCALL(chdir)
 47d:	b8 09 00 00 00       	mov    $0x9,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <dup>:
SYSCALL(dup)
 485:	b8 0a 00 00 00       	mov    $0xa,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <getpid>:
SYSCALL(getpid)
 48d:	b8 0b 00 00 00       	mov    $0xb,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <sbrk>:
SYSCALL(sbrk)
 495:	b8 0c 00 00 00       	mov    $0xc,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <sleep>:
SYSCALL(sleep)
 49d:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <uptime>:
SYSCALL(uptime)
 4a5:	b8 0e 00 00 00       	mov    $0xe,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <clone>:
SYSCALL(clone)
 4ad:	b8 16 00 00 00       	mov    $0x16,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <join>:
 4b5:	b8 17 00 00 00       	mov    $0x17,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	83 ec 1c             	sub    $0x1c,%esp
 4c3:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4c6:	6a 01                	push   $0x1
 4c8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4cb:	52                   	push   %edx
 4cc:	50                   	push   %eax
 4cd:	e8 5b ff ff ff       	call   42d <write>
}
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	c9                   	leave  
 4d6:	c3                   	ret    

000004d7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d7:	55                   	push   %ebp
 4d8:	89 e5                	mov    %esp,%ebp
 4da:	57                   	push   %edi
 4db:	56                   	push   %esi
 4dc:	53                   	push   %ebx
 4dd:	83 ec 2c             	sub    $0x2c,%esp
 4e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e3:	89 d0                	mov    %edx,%eax
 4e5:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4eb:	0f 95 c1             	setne  %cl
 4ee:	c1 ea 1f             	shr    $0x1f,%edx
 4f1:	84 d1                	test   %dl,%cl
 4f3:	74 44                	je     539 <printint+0x62>
    neg = 1;
    x = -xx;
 4f5:	f7 d8                	neg    %eax
 4f7:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4f9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 500:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 505:	89 c8                	mov    %ecx,%eax
 507:	ba 00 00 00 00       	mov    $0x0,%edx
 50c:	f7 f6                	div    %esi
 50e:	89 df                	mov    %ebx,%edi
 510:	83 c3 01             	add    $0x1,%ebx
 513:	0f b6 92 e8 08 00 00 	movzbl 0x8e8(%edx),%edx
 51a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 51e:	89 ca                	mov    %ecx,%edx
 520:	89 c1                	mov    %eax,%ecx
 522:	39 d6                	cmp    %edx,%esi
 524:	76 df                	jbe    505 <printint+0x2e>
  if(neg)
 526:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 52a:	74 31                	je     55d <printint+0x86>
    buf[i++] = '-';
 52c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 531:	8d 5f 02             	lea    0x2(%edi),%ebx
 534:	8b 75 d0             	mov    -0x30(%ebp),%esi
 537:	eb 17                	jmp    550 <printint+0x79>
    x = xx;
 539:	89 c1                	mov    %eax,%ecx
  neg = 0;
 53b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 542:	eb bc                	jmp    500 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 544:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 549:	89 f0                	mov    %esi,%eax
 54b:	e8 6d ff ff ff       	call   4bd <putc>
  while(--i >= 0)
 550:	83 eb 01             	sub    $0x1,%ebx
 553:	79 ef                	jns    544 <printint+0x6d>
}
 555:	83 c4 2c             	add    $0x2c,%esp
 558:	5b                   	pop    %ebx
 559:	5e                   	pop    %esi
 55a:	5f                   	pop    %edi
 55b:	5d                   	pop    %ebp
 55c:	c3                   	ret    
 55d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 560:	eb ee                	jmp    550 <printint+0x79>

00000562 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 562:	55                   	push   %ebp
 563:	89 e5                	mov    %esp,%ebp
 565:	57                   	push   %edi
 566:	56                   	push   %esi
 567:	53                   	push   %ebx
 568:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 56b:	8d 45 10             	lea    0x10(%ebp),%eax
 56e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 571:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 576:	bb 00 00 00 00       	mov    $0x0,%ebx
 57b:	eb 14                	jmp    591 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 57d:	89 fa                	mov    %edi,%edx
 57f:	8b 45 08             	mov    0x8(%ebp),%eax
 582:	e8 36 ff ff ff       	call   4bd <putc>
 587:	eb 05                	jmp    58e <printf+0x2c>
      }
    } else if(state == '%'){
 589:	83 fe 25             	cmp    $0x25,%esi
 58c:	74 25                	je     5b3 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 58e:	83 c3 01             	add    $0x1,%ebx
 591:	8b 45 0c             	mov    0xc(%ebp),%eax
 594:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 598:	84 c0                	test   %al,%al
 59a:	0f 84 20 01 00 00    	je     6c0 <printf+0x15e>
    c = fmt[i] & 0xff;
 5a0:	0f be f8             	movsbl %al,%edi
 5a3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5a6:	85 f6                	test   %esi,%esi
 5a8:	75 df                	jne    589 <printf+0x27>
      if(c == '%'){
 5aa:	83 f8 25             	cmp    $0x25,%eax
 5ad:	75 ce                	jne    57d <printf+0x1b>
        state = '%';
 5af:	89 c6                	mov    %eax,%esi
 5b1:	eb db                	jmp    58e <printf+0x2c>
      if(c == 'd'){
 5b3:	83 f8 25             	cmp    $0x25,%eax
 5b6:	0f 84 cf 00 00 00    	je     68b <printf+0x129>
 5bc:	0f 8c dd 00 00 00    	jl     69f <printf+0x13d>
 5c2:	83 f8 78             	cmp    $0x78,%eax
 5c5:	0f 8f d4 00 00 00    	jg     69f <printf+0x13d>
 5cb:	83 f8 63             	cmp    $0x63,%eax
 5ce:	0f 8c cb 00 00 00    	jl     69f <printf+0x13d>
 5d4:	83 e8 63             	sub    $0x63,%eax
 5d7:	83 f8 15             	cmp    $0x15,%eax
 5da:	0f 87 bf 00 00 00    	ja     69f <printf+0x13d>
 5e0:	ff 24 85 90 08 00 00 	jmp    *0x890(,%eax,4)
        printint(fd, *ap, 10, 1);
 5e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ea:	8b 17                	mov    (%edi),%edx
 5ec:	83 ec 0c             	sub    $0xc,%esp
 5ef:	6a 01                	push   $0x1
 5f1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f6:	8b 45 08             	mov    0x8(%ebp),%eax
 5f9:	e8 d9 fe ff ff       	call   4d7 <printint>
        ap++;
 5fe:	83 c7 04             	add    $0x4,%edi
 601:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 604:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 607:	be 00 00 00 00       	mov    $0x0,%esi
 60c:	eb 80                	jmp    58e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 60e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 611:	8b 17                	mov    (%edi),%edx
 613:	83 ec 0c             	sub    $0xc,%esp
 616:	6a 00                	push   $0x0
 618:	b9 10 00 00 00       	mov    $0x10,%ecx
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	e8 b2 fe ff ff       	call   4d7 <printint>
        ap++;
 625:	83 c7 04             	add    $0x4,%edi
 628:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 62b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62e:	be 00 00 00 00       	mov    $0x0,%esi
 633:	e9 56 ff ff ff       	jmp    58e <printf+0x2c>
        s = (char*)*ap;
 638:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63b:	8b 30                	mov    (%eax),%esi
        ap++;
 63d:	83 c0 04             	add    $0x4,%eax
 640:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 643:	85 f6                	test   %esi,%esi
 645:	75 15                	jne    65c <printf+0xfa>
          s = "(null)";
 647:	be 89 08 00 00       	mov    $0x889,%esi
 64c:	eb 0e                	jmp    65c <printf+0xfa>
          putc(fd, *s);
 64e:	0f be d2             	movsbl %dl,%edx
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	e8 64 fe ff ff       	call   4bd <putc>
          s++;
 659:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 65c:	0f b6 16             	movzbl (%esi),%edx
 65f:	84 d2                	test   %dl,%dl
 661:	75 eb                	jne    64e <printf+0xec>
      state = 0;
 663:	be 00 00 00 00       	mov    $0x0,%esi
 668:	e9 21 ff ff ff       	jmp    58e <printf+0x2c>
        putc(fd, *ap);
 66d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 670:	0f be 17             	movsbl (%edi),%edx
 673:	8b 45 08             	mov    0x8(%ebp),%eax
 676:	e8 42 fe ff ff       	call   4bd <putc>
        ap++;
 67b:	83 c7 04             	add    $0x4,%edi
 67e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 681:	be 00 00 00 00       	mov    $0x0,%esi
 686:	e9 03 ff ff ff       	jmp    58e <printf+0x2c>
        putc(fd, c);
 68b:	89 fa                	mov    %edi,%edx
 68d:	8b 45 08             	mov    0x8(%ebp),%eax
 690:	e8 28 fe ff ff       	call   4bd <putc>
      state = 0;
 695:	be 00 00 00 00       	mov    $0x0,%esi
 69a:	e9 ef fe ff ff       	jmp    58e <printf+0x2c>
        putc(fd, '%');
 69f:	ba 25 00 00 00       	mov    $0x25,%edx
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	e8 11 fe ff ff       	call   4bd <putc>
        putc(fd, c);
 6ac:	89 fa                	mov    %edi,%edx
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	e8 07 fe ff ff       	call   4bd <putc>
      state = 0;
 6b6:	be 00 00 00 00       	mov    $0x0,%esi
 6bb:	e9 ce fe ff ff       	jmp    58e <printf+0x2c>
    }
  }
}
 6c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c3:	5b                   	pop    %ebx
 6c4:	5e                   	pop    %esi
 6c5:	5f                   	pop    %edi
 6c6:	5d                   	pop    %ebp
 6c7:	c3                   	ret    

000006c8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c8:	55                   	push   %ebp
 6c9:	89 e5                	mov    %esp,%ebp
 6cb:	57                   	push   %edi
 6cc:	56                   	push   %esi
 6cd:	53                   	push   %ebx
 6ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d4:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 6d9:	eb 02                	jmp    6dd <free+0x15>
 6db:	89 d0                	mov    %edx,%eax
 6dd:	39 c8                	cmp    %ecx,%eax
 6df:	73 04                	jae    6e5 <free+0x1d>
 6e1:	39 08                	cmp    %ecx,(%eax)
 6e3:	77 12                	ja     6f7 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e5:	8b 10                	mov    (%eax),%edx
 6e7:	39 c2                	cmp    %eax,%edx
 6e9:	77 f0                	ja     6db <free+0x13>
 6eb:	39 c8                	cmp    %ecx,%eax
 6ed:	72 08                	jb     6f7 <free+0x2f>
 6ef:	39 ca                	cmp    %ecx,%edx
 6f1:	77 04                	ja     6f7 <free+0x2f>
 6f3:	89 d0                	mov    %edx,%eax
 6f5:	eb e6                	jmp    6dd <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6fa:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6fd:	8b 10                	mov    (%eax),%edx
 6ff:	39 d7                	cmp    %edx,%edi
 701:	74 19                	je     71c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 703:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 706:	8b 50 04             	mov    0x4(%eax),%edx
 709:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 70c:	39 ce                	cmp    %ecx,%esi
 70e:	74 1b                	je     72b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 710:	89 08                	mov    %ecx,(%eax)
  freep = p;
 712:	a3 5c 0c 00 00       	mov    %eax,0xc5c
}
 717:	5b                   	pop    %ebx
 718:	5e                   	pop    %esi
 719:	5f                   	pop    %edi
 71a:	5d                   	pop    %ebp
 71b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 71c:	03 72 04             	add    0x4(%edx),%esi
 71f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 722:	8b 10                	mov    (%eax),%edx
 724:	8b 12                	mov    (%edx),%edx
 726:	89 53 f8             	mov    %edx,-0x8(%ebx)
 729:	eb db                	jmp    706 <free+0x3e>
    p->s.size += bp->s.size;
 72b:	03 53 fc             	add    -0x4(%ebx),%edx
 72e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 731:	8b 53 f8             	mov    -0x8(%ebx),%edx
 734:	89 10                	mov    %edx,(%eax)
 736:	eb da                	jmp    712 <free+0x4a>

00000738 <morecore>:

static Header*
morecore(uint nu)
{
 738:	55                   	push   %ebp
 739:	89 e5                	mov    %esp,%ebp
 73b:	53                   	push   %ebx
 73c:	83 ec 04             	sub    $0x4,%esp
 73f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 741:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 746:	77 05                	ja     74d <morecore+0x15>
    nu = 4096;
 748:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 74d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 754:	83 ec 0c             	sub    $0xc,%esp
 757:	50                   	push   %eax
 758:	e8 38 fd ff ff       	call   495 <sbrk>
  if(p == (char*)-1)
 75d:	83 c4 10             	add    $0x10,%esp
 760:	83 f8 ff             	cmp    $0xffffffff,%eax
 763:	74 1c                	je     781 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 765:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 768:	83 c0 08             	add    $0x8,%eax
 76b:	83 ec 0c             	sub    $0xc,%esp
 76e:	50                   	push   %eax
 76f:	e8 54 ff ff ff       	call   6c8 <free>
  return freep;
 774:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 779:	83 c4 10             	add    $0x10,%esp
}
 77c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 77f:	c9                   	leave  
 780:	c3                   	ret    
    return 0;
 781:	b8 00 00 00 00       	mov    $0x0,%eax
 786:	eb f4                	jmp    77c <morecore+0x44>

00000788 <malloc>:

void*
malloc(uint nbytes)
{
 788:	55                   	push   %ebp
 789:	89 e5                	mov    %esp,%ebp
 78b:	53                   	push   %ebx
 78c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78f:	8b 45 08             	mov    0x8(%ebp),%eax
 792:	8d 58 07             	lea    0x7(%eax),%ebx
 795:	c1 eb 03             	shr    $0x3,%ebx
 798:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 79b:	8b 0d 5c 0c 00 00    	mov    0xc5c,%ecx
 7a1:	85 c9                	test   %ecx,%ecx
 7a3:	74 04                	je     7a9 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a5:	8b 01                	mov    (%ecx),%eax
 7a7:	eb 4a                	jmp    7f3 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7a9:	c7 05 5c 0c 00 00 60 	movl   $0xc60,0xc5c
 7b0:	0c 00 00 
 7b3:	c7 05 60 0c 00 00 60 	movl   $0xc60,0xc60
 7ba:	0c 00 00 
    base.s.size = 0;
 7bd:	c7 05 64 0c 00 00 00 	movl   $0x0,0xc64
 7c4:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7c7:	b9 60 0c 00 00       	mov    $0xc60,%ecx
 7cc:	eb d7                	jmp    7a5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7ce:	74 19                	je     7e9 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7d0:	29 da                	sub    %ebx,%edx
 7d2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d5:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7d8:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7db:	89 0d 5c 0c 00 00    	mov    %ecx,0xc5c
      return (void*)(p + 1);
 7e1:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7e7:	c9                   	leave  
 7e8:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7e9:	8b 10                	mov    (%eax),%edx
 7eb:	89 11                	mov    %edx,(%ecx)
 7ed:	eb ec                	jmp    7db <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ef:	89 c1                	mov    %eax,%ecx
 7f1:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7f3:	8b 50 04             	mov    0x4(%eax),%edx
 7f6:	39 da                	cmp    %ebx,%edx
 7f8:	73 d4                	jae    7ce <malloc+0x46>
    if(p == freep)
 7fa:	39 05 5c 0c 00 00    	cmp    %eax,0xc5c
 800:	75 ed                	jne    7ef <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 802:	89 d8                	mov    %ebx,%eax
 804:	e8 2f ff ff ff       	call   738 <morecore>
 809:	85 c0                	test   %eax,%eax
 80b:	75 e2                	jne    7ef <malloc+0x67>
 80d:	eb d5                	jmp    7e4 <malloc+0x5c>
