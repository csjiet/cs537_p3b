
_test_11:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
   6:	a1 d8 0c 00 00       	mov    0xcd8,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 54 08 00 00       	push   $0x854
  17:	68 5e 08 00 00       	push   $0x85e
  1c:	6a 01                	push   $0x1
  1e:	e8 82 05 00 00       	call   5a5 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 66 08 00 00       	push   $0x866
  2b:	68 72 08 00 00       	push   $0x872
  30:	6a 01                	push   $0x1
  32:	e8 6e 05 00 00       	call   5a5 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 86 08 00 00       	push   $0x886
  3f:	6a 01                	push   $0x1
  41:	e8 5f 05 00 00       	call   5a5 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 dc 0c 00 00    	push   0xcdc
  4f:	e8 2c 04 00 00       	call   480 <kill>
  54:	e8 f7 03 00 00       	call   450 <exit>
   global += 4;
  59:	a1 d8 0c 00 00       	mov    0xcd8,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 d8 0c 00 00       	mov    %eax,0xcd8
   exit();
  66:	e8 e5 03 00 00       	call   450 <exit>

0000006b <main>:
{
  6b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6f:	83 e4 f0             	and    $0xfffffff0,%esp
  72:	ff 71 fc             	push   -0x4(%ecx)
  75:	55                   	push   %ebp
  76:	89 e5                	mov    %esp,%ebp
  78:	56                   	push   %esi
  79:	53                   	push   %ebx
  7a:	51                   	push   %ecx
  7b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  7e:	e8 4d 04 00 00       	call   4d0 <getpid>
  83:	a3 dc 0c 00 00       	mov    %eax,0xcdc
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 d8 0c 00 00 01 	movl   $0x1,0xcd8
  9d:	00 00 00 
      thread_pid = thread_create(worker, 0, 0);
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	6a 00                	push   $0x0
  a5:	6a 00                	push   $0x0
  a7:	68 00 00 00 00       	push   $0x0
  ac:	e8 0c 03 00 00       	call   3bd <thread_create>
  b1:	89 c3                	mov    %eax,%ebx
      assert(thread_pid > 0);
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	85 c0                	test   %eax,%eax
  b8:	7e 34                	jle    ee <main+0x83>
      join_pid = thread_join();
  ba:	e8 33 03 00 00       	call   3f2 <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 d8 0c 00 00       	mov    0xcd8,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 fd 03 00 00       	call   4d8 <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 54 08 00 00       	push   $0x854
  f5:	68 5e 08 00 00       	push   $0x85e
  fa:	6a 01                	push   $0x1
  fc:	e8 a4 04 00 00       	call   5a5 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 93 08 00 00       	push   $0x893
 109:	68 72 08 00 00       	push   $0x872
 10e:	6a 01                	push   $0x1
 110:	e8 90 04 00 00       	call   5a5 <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 86 08 00 00       	push   $0x886
 11d:	6a 01                	push   $0x1
 11f:	e8 81 04 00 00       	call   5a5 <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 dc 0c 00 00    	push   0xcdc
 12d:	e8 4e 03 00 00       	call   480 <kill>
 132:	e8 19 03 00 00       	call   450 <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 54 08 00 00       	push   $0x854
 13e:	68 5e 08 00 00       	push   $0x85e
 143:	6a 01                	push   $0x1
 145:	e8 5b 04 00 00       	call   5a5 <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 a2 08 00 00       	push   $0x8a2
 152:	68 72 08 00 00       	push   $0x872
 157:	6a 01                	push   $0x1
 159:	e8 47 04 00 00       	call   5a5 <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 86 08 00 00       	push   $0x886
 166:	6a 01                	push   $0x1
 168:	e8 38 04 00 00       	call   5a5 <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 dc 0c 00 00    	push   0xcdc
 176:	e8 05 03 00 00       	call   480 <kill>
 17b:	e8 d0 02 00 00       	call   450 <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 54 08 00 00       	push   $0x854
 187:	68 5e 08 00 00       	push   $0x85e
 18c:	6a 01                	push   $0x1
 18e:	e8 12 04 00 00       	call   5a5 <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 b9 08 00 00       	push   $0x8b9
 19b:	68 72 08 00 00       	push   $0x872
 1a0:	6a 01                	push   $0x1
 1a2:	e8 fe 03 00 00       	call   5a5 <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 86 08 00 00       	push   $0x886
 1af:	6a 01                	push   $0x1
 1b1:	e8 ef 03 00 00       	call   5a5 <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 dc 0c 00 00    	push   0xcdc
 1bf:	e8 bc 02 00 00       	call   480 <kill>
 1c4:	e8 87 02 00 00       	call   450 <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 54 08 00 00       	push   $0x854
 1d0:	68 5e 08 00 00       	push   $0x85e
 1d5:	6a 01                	push   $0x1
 1d7:	e8 c9 03 00 00       	call   5a5 <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 d4 08 00 00       	push   $0x8d4
 1e4:	68 72 08 00 00       	push   $0x872
 1e9:	6a 01                	push   $0x1
 1eb:	e8 b5 03 00 00       	call   5a5 <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 86 08 00 00       	push   $0x886
 1f8:	6a 01                	push   $0x1
 1fa:	e8 a6 03 00 00       	call   5a5 <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 dc 0c 00 00    	push   0xcdc
 208:	e8 73 02 00 00       	call   480 <kill>
 20d:	e8 3e 02 00 00       	call   450 <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 c5 08 00 00       	push   $0x8c5
 21a:	6a 01                	push   $0x1
 21c:	e8 84 03 00 00       	call   5a5 <printf>
   exit();
 221:	e8 2a 02 00 00       	call   450 <exit>

00000226 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	56                   	push   %esi
 22a:	53                   	push   %ebx
 22b:	8b 75 08             	mov    0x8(%ebp),%esi
 22e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 231:	89 f0                	mov    %esi,%eax
 233:	89 d1                	mov    %edx,%ecx
 235:	83 c2 01             	add    $0x1,%edx
 238:	89 c3                	mov    %eax,%ebx
 23a:	83 c0 01             	add    $0x1,%eax
 23d:	0f b6 09             	movzbl (%ecx),%ecx
 240:	88 0b                	mov    %cl,(%ebx)
 242:	84 c9                	test   %cl,%cl
 244:	75 ed                	jne    233 <strcpy+0xd>
    ;
  return os;
}
 246:	89 f0                	mov    %esi,%eax
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 252:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 255:	eb 06                	jmp    25d <strcmp+0x11>
    p++, q++;
 257:	83 c1 01             	add    $0x1,%ecx
 25a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 25d:	0f b6 01             	movzbl (%ecx),%eax
 260:	84 c0                	test   %al,%al
 262:	74 04                	je     268 <strcmp+0x1c>
 264:	3a 02                	cmp    (%edx),%al
 266:	74 ef                	je     257 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 268:	0f b6 c0             	movzbl %al,%eax
 26b:	0f b6 12             	movzbl (%edx),%edx
 26e:	29 d0                	sub    %edx,%eax
}
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <strlen>:

uint
strlen(const char *s)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 278:	b8 00 00 00 00       	mov    $0x0,%eax
 27d:	eb 03                	jmp    282 <strlen+0x10>
 27f:	83 c0 01             	add    $0x1,%eax
 282:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 286:	75 f7                	jne    27f <strlen+0xd>
    ;
  return n;
}
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <memset>:

void*
memset(void *dst, int c, uint n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	57                   	push   %edi
 28e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 291:	89 d7                	mov    %edx,%edi
 293:	8b 4d 10             	mov    0x10(%ebp),%ecx
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	fc                   	cld    
 29a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 29c:	89 d0                	mov    %edx,%eax
 29e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2a1:	c9                   	leave  
 2a2:	c3                   	ret    

000002a3 <strchr>:

char*
strchr(const char *s, char c)
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ad:	eb 03                	jmp    2b2 <strchr+0xf>
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	0f b6 10             	movzbl (%eax),%edx
 2b5:	84 d2                	test   %dl,%dl
 2b7:	74 06                	je     2bf <strchr+0x1c>
    if(*s == c)
 2b9:	38 ca                	cmp    %cl,%dl
 2bb:	75 f2                	jne    2af <strchr+0xc>
 2bd:	eb 05                	jmp    2c4 <strchr+0x21>
      return (char*)s;
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	57                   	push   %edi
 2ca:	56                   	push   %esi
 2cb:	53                   	push   %ebx
 2cc:	83 ec 1c             	sub    $0x1c,%esp
 2cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7d 2e                	jge    30f <gets+0x49>
    cc = read(0, &c, 1);
 2e1:	83 ec 04             	sub    $0x4,%esp
 2e4:	6a 01                	push   $0x1
 2e6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2e9:	50                   	push   %eax
 2ea:	6a 00                	push   $0x0
 2ec:	e8 77 01 00 00       	call   468 <read>
    if(cc < 1)
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	85 c0                	test   %eax,%eax
 2f6:	7e 17                	jle    30f <gets+0x49>
      break;
    buf[i++] = c;
 2f8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2fc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2ff:	3c 0a                	cmp    $0xa,%al
 301:	0f 94 c2             	sete   %dl
 304:	3c 0d                	cmp    $0xd,%al
 306:	0f 94 c0             	sete   %al
 309:	08 c2                	or     %al,%dl
 30b:	74 ca                	je     2d7 <gets+0x11>
    buf[i++] = c;
 30d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 30f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 313:	89 f8                	mov    %edi,%eax
 315:	8d 65 f4             	lea    -0xc(%ebp),%esp
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5f                   	pop    %edi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    

0000031d <stat>:

int
stat(const char *n, struct stat *st)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	56                   	push   %esi
 321:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 322:	83 ec 08             	sub    $0x8,%esp
 325:	6a 00                	push   $0x0
 327:	ff 75 08             	push   0x8(%ebp)
 32a:	e8 61 01 00 00       	call   490 <open>
  if(fd < 0)
 32f:	83 c4 10             	add    $0x10,%esp
 332:	85 c0                	test   %eax,%eax
 334:	78 24                	js     35a <stat+0x3d>
 336:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 338:	83 ec 08             	sub    $0x8,%esp
 33b:	ff 75 0c             	push   0xc(%ebp)
 33e:	50                   	push   %eax
 33f:	e8 64 01 00 00       	call   4a8 <fstat>
 344:	89 c6                	mov    %eax,%esi
  close(fd);
 346:	89 1c 24             	mov    %ebx,(%esp)
 349:	e8 2a 01 00 00       	call   478 <close>
  return r;
 34e:	83 c4 10             	add    $0x10,%esp
}
 351:	89 f0                	mov    %esi,%eax
 353:	8d 65 f8             	lea    -0x8(%ebp),%esp
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    
    return -1;
 35a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35f:	eb f0                	jmp    351 <stat+0x34>

00000361 <atoi>:

int
atoi(const char *s)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	53                   	push   %ebx
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 368:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 36d:	eb 10                	jmp    37f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 36f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 372:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 375:	83 c1 01             	add    $0x1,%ecx
 378:	0f be c0             	movsbl %al,%eax
 37b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 37f:	0f b6 01             	movzbl (%ecx),%eax
 382:	8d 58 d0             	lea    -0x30(%eax),%ebx
 385:	80 fb 09             	cmp    $0x9,%bl
 388:	76 e5                	jbe    36f <atoi+0xe>
  return n;
}
 38a:	89 d0                	mov    %edx,%eax
 38c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38f:	c9                   	leave  
 390:	c3                   	ret    

00000391 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	8b 75 08             	mov    0x8(%ebp),%esi
 399:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 39c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 39f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3a1:	eb 0d                	jmp    3b0 <memmove+0x1f>
    *dst++ = *src++;
 3a3:	0f b6 01             	movzbl (%ecx),%eax
 3a6:	88 02                	mov    %al,(%edx)
 3a8:	8d 49 01             	lea    0x1(%ecx),%ecx
 3ab:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3ae:	89 d8                	mov    %ebx,%eax
 3b0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3b3:	85 c0                	test   %eax,%eax
 3b5:	7f ec                	jg     3a3 <memmove+0x12>
  return vdst;
}
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    

000003bd <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 3bd:	55                   	push   %ebp
 3be:	89 e5                	mov    %esp,%ebp
 3c0:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 3c3:	68 00 20 00 00       	push   $0x2000
 3c8:	e8 fe 03 00 00       	call   7cb <malloc>
  if ((uint)stack%PGSIZE){
 3cd:	83 c4 10             	add    $0x10,%esp
 3d0:	a9 ff 0f 00 00       	test   $0xfff,%eax
 3d5:	74 0a                	je     3e1 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 3d7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 3dc:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 3e1:	50                   	push   %eax
 3e2:	ff 75 10             	push   0x10(%ebp)
 3e5:	ff 75 0c             	push   0xc(%ebp)
 3e8:	ff 75 08             	push   0x8(%ebp)
 3eb:	e8 00 01 00 00       	call   4f0 <clone>
}
 3f0:	c9                   	leave  
 3f1:	c3                   	ret    

000003f2 <thread_join>:

int thread_join(){
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	53                   	push   %ebx
 3f6:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 3f9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3fc:	50                   	push   %eax
 3fd:	e8 f6 00 00 00       	call   4f8 <join>
 402:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 404:	83 c4 04             	add    $0x4,%esp
 407:	ff 75 f4             	push   -0xc(%ebp)
 40a:	e8 fc 02 00 00       	call   70b <free>
  return x;
}
 40f:	89 d8                	mov    %ebx,%eax
 411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <lock_init>:

void lock_init(lock_t *spin){
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 422:	5d                   	pop    %ebp
 423:	c3                   	ret    

00000424 <lock_acquire>:

void lock_acquire(lock_t *spin){
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 42a:	b8 01 00 00 00       	mov    $0x1,%eax
 42f:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 432:	85 c0                	test   %eax,%eax
 434:	75 f4                	jne    42a <lock_acquire+0x6>

}
 436:	5d                   	pop    %ebp
 437:	c3                   	ret    

00000438 <lock_release>:

void lock_release(lock_t *spin){
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	8b 55 08             	mov    0x8(%ebp),%edx
 43e:	b8 00 00 00 00       	mov    $0x0,%eax
 443:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    

00000448 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 448:	b8 01 00 00 00       	mov    $0x1,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <exit>:
SYSCALL(exit)
 450:	b8 02 00 00 00       	mov    $0x2,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <wait>:
SYSCALL(wait)
 458:	b8 03 00 00 00       	mov    $0x3,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <pipe>:
SYSCALL(pipe)
 460:	b8 04 00 00 00       	mov    $0x4,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <read>:
SYSCALL(read)
 468:	b8 05 00 00 00       	mov    $0x5,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <write>:
SYSCALL(write)
 470:	b8 10 00 00 00       	mov    $0x10,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <close>:
SYSCALL(close)
 478:	b8 15 00 00 00       	mov    $0x15,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <kill>:
SYSCALL(kill)
 480:	b8 06 00 00 00       	mov    $0x6,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <exec>:
SYSCALL(exec)
 488:	b8 07 00 00 00       	mov    $0x7,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <open>:
SYSCALL(open)
 490:	b8 0f 00 00 00       	mov    $0xf,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <mknod>:
SYSCALL(mknod)
 498:	b8 11 00 00 00       	mov    $0x11,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <unlink>:
SYSCALL(unlink)
 4a0:	b8 12 00 00 00       	mov    $0x12,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <fstat>:
SYSCALL(fstat)
 4a8:	b8 08 00 00 00       	mov    $0x8,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <link>:
SYSCALL(link)
 4b0:	b8 13 00 00 00       	mov    $0x13,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <mkdir>:
SYSCALL(mkdir)
 4b8:	b8 14 00 00 00       	mov    $0x14,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <chdir>:
SYSCALL(chdir)
 4c0:	b8 09 00 00 00       	mov    $0x9,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <dup>:
SYSCALL(dup)
 4c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <getpid>:
SYSCALL(getpid)
 4d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <sbrk>:
SYSCALL(sbrk)
 4d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <sleep>:
SYSCALL(sleep)
 4e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <uptime>:
SYSCALL(uptime)
 4e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <clone>:
SYSCALL(clone)
 4f0:	b8 16 00 00 00       	mov    $0x16,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <join>:
 4f8:	b8 17 00 00 00       	mov    $0x17,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	83 ec 1c             	sub    $0x1c,%esp
 506:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 509:	6a 01                	push   $0x1
 50b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 50e:	52                   	push   %edx
 50f:	50                   	push   %eax
 510:	e8 5b ff ff ff       	call   470 <write>
}
 515:	83 c4 10             	add    $0x10,%esp
 518:	c9                   	leave  
 519:	c3                   	ret    

0000051a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 51a:	55                   	push   %ebp
 51b:	89 e5                	mov    %esp,%ebp
 51d:	57                   	push   %edi
 51e:	56                   	push   %esi
 51f:	53                   	push   %ebx
 520:	83 ec 2c             	sub    $0x2c,%esp
 523:	89 45 d0             	mov    %eax,-0x30(%ebp)
 526:	89 d0                	mov    %edx,%eax
 528:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 52a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 52e:	0f 95 c1             	setne  %cl
 531:	c1 ea 1f             	shr    $0x1f,%edx
 534:	84 d1                	test   %dl,%cl
 536:	74 44                	je     57c <printint+0x62>
    neg = 1;
    x = -xx;
 538:	f7 d8                	neg    %eax
 53a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 53c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 543:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 548:	89 c8                	mov    %ecx,%eax
 54a:	ba 00 00 00 00       	mov    $0x0,%edx
 54f:	f7 f6                	div    %esi
 551:	89 df                	mov    %ebx,%edi
 553:	83 c3 01             	add    $0x1,%ebx
 556:	0f b6 92 70 09 00 00 	movzbl 0x970(%edx),%edx
 55d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 561:	89 ca                	mov    %ecx,%edx
 563:	89 c1                	mov    %eax,%ecx
 565:	39 d6                	cmp    %edx,%esi
 567:	76 df                	jbe    548 <printint+0x2e>
  if(neg)
 569:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 56d:	74 31                	je     5a0 <printint+0x86>
    buf[i++] = '-';
 56f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 574:	8d 5f 02             	lea    0x2(%edi),%ebx
 577:	8b 75 d0             	mov    -0x30(%ebp),%esi
 57a:	eb 17                	jmp    593 <printint+0x79>
    x = xx;
 57c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 57e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 585:	eb bc                	jmp    543 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 587:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 58c:	89 f0                	mov    %esi,%eax
 58e:	e8 6d ff ff ff       	call   500 <putc>
  while(--i >= 0)
 593:	83 eb 01             	sub    $0x1,%ebx
 596:	79 ef                	jns    587 <printint+0x6d>
}
 598:	83 c4 2c             	add    $0x2c,%esp
 59b:	5b                   	pop    %ebx
 59c:	5e                   	pop    %esi
 59d:	5f                   	pop    %edi
 59e:	5d                   	pop    %ebp
 59f:	c3                   	ret    
 5a0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5a3:	eb ee                	jmp    593 <printint+0x79>

000005a5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a5:	55                   	push   %ebp
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	53                   	push   %ebx
 5ab:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5ae:	8d 45 10             	lea    0x10(%ebp),%eax
 5b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5b4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5b9:	bb 00 00 00 00       	mov    $0x0,%ebx
 5be:	eb 14                	jmp    5d4 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5c0:	89 fa                	mov    %edi,%edx
 5c2:	8b 45 08             	mov    0x8(%ebp),%eax
 5c5:	e8 36 ff ff ff       	call   500 <putc>
 5ca:	eb 05                	jmp    5d1 <printf+0x2c>
      }
    } else if(state == '%'){
 5cc:	83 fe 25             	cmp    $0x25,%esi
 5cf:	74 25                	je     5f6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5d1:	83 c3 01             	add    $0x1,%ebx
 5d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5db:	84 c0                	test   %al,%al
 5dd:	0f 84 20 01 00 00    	je     703 <printf+0x15e>
    c = fmt[i] & 0xff;
 5e3:	0f be f8             	movsbl %al,%edi
 5e6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5e9:	85 f6                	test   %esi,%esi
 5eb:	75 df                	jne    5cc <printf+0x27>
      if(c == '%'){
 5ed:	83 f8 25             	cmp    $0x25,%eax
 5f0:	75 ce                	jne    5c0 <printf+0x1b>
        state = '%';
 5f2:	89 c6                	mov    %eax,%esi
 5f4:	eb db                	jmp    5d1 <printf+0x2c>
      if(c == 'd'){
 5f6:	83 f8 25             	cmp    $0x25,%eax
 5f9:	0f 84 cf 00 00 00    	je     6ce <printf+0x129>
 5ff:	0f 8c dd 00 00 00    	jl     6e2 <printf+0x13d>
 605:	83 f8 78             	cmp    $0x78,%eax
 608:	0f 8f d4 00 00 00    	jg     6e2 <printf+0x13d>
 60e:	83 f8 63             	cmp    $0x63,%eax
 611:	0f 8c cb 00 00 00    	jl     6e2 <printf+0x13d>
 617:	83 e8 63             	sub    $0x63,%eax
 61a:	83 f8 15             	cmp    $0x15,%eax
 61d:	0f 87 bf 00 00 00    	ja     6e2 <printf+0x13d>
 623:	ff 24 85 18 09 00 00 	jmp    *0x918(,%eax,4)
        printint(fd, *ap, 10, 1);
 62a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 62d:	8b 17                	mov    (%edi),%edx
 62f:	83 ec 0c             	sub    $0xc,%esp
 632:	6a 01                	push   $0x1
 634:	b9 0a 00 00 00       	mov    $0xa,%ecx
 639:	8b 45 08             	mov    0x8(%ebp),%eax
 63c:	e8 d9 fe ff ff       	call   51a <printint>
        ap++;
 641:	83 c7 04             	add    $0x4,%edi
 644:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 647:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 64a:	be 00 00 00 00       	mov    $0x0,%esi
 64f:	eb 80                	jmp    5d1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 651:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 654:	8b 17                	mov    (%edi),%edx
 656:	83 ec 0c             	sub    $0xc,%esp
 659:	6a 00                	push   $0x0
 65b:	b9 10 00 00 00       	mov    $0x10,%ecx
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	e8 b2 fe ff ff       	call   51a <printint>
        ap++;
 668:	83 c7 04             	add    $0x4,%edi
 66b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 66e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 671:	be 00 00 00 00       	mov    $0x0,%esi
 676:	e9 56 ff ff ff       	jmp    5d1 <printf+0x2c>
        s = (char*)*ap;
 67b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67e:	8b 30                	mov    (%eax),%esi
        ap++;
 680:	83 c0 04             	add    $0x4,%eax
 683:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 686:	85 f6                	test   %esi,%esi
 688:	75 15                	jne    69f <printf+0xfa>
          s = "(null)";
 68a:	be 10 09 00 00       	mov    $0x910,%esi
 68f:	eb 0e                	jmp    69f <printf+0xfa>
          putc(fd, *s);
 691:	0f be d2             	movsbl %dl,%edx
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	e8 64 fe ff ff       	call   500 <putc>
          s++;
 69c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 69f:	0f b6 16             	movzbl (%esi),%edx
 6a2:	84 d2                	test   %dl,%dl
 6a4:	75 eb                	jne    691 <printf+0xec>
      state = 0;
 6a6:	be 00 00 00 00       	mov    $0x0,%esi
 6ab:	e9 21 ff ff ff       	jmp    5d1 <printf+0x2c>
        putc(fd, *ap);
 6b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b3:	0f be 17             	movsbl (%edi),%edx
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	e8 42 fe ff ff       	call   500 <putc>
        ap++;
 6be:	83 c7 04             	add    $0x4,%edi
 6c1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6c4:	be 00 00 00 00       	mov    $0x0,%esi
 6c9:	e9 03 ff ff ff       	jmp    5d1 <printf+0x2c>
        putc(fd, c);
 6ce:	89 fa                	mov    %edi,%edx
 6d0:	8b 45 08             	mov    0x8(%ebp),%eax
 6d3:	e8 28 fe ff ff       	call   500 <putc>
      state = 0;
 6d8:	be 00 00 00 00       	mov    $0x0,%esi
 6dd:	e9 ef fe ff ff       	jmp    5d1 <printf+0x2c>
        putc(fd, '%');
 6e2:	ba 25 00 00 00       	mov    $0x25,%edx
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	e8 11 fe ff ff       	call   500 <putc>
        putc(fd, c);
 6ef:	89 fa                	mov    %edi,%edx
 6f1:	8b 45 08             	mov    0x8(%ebp),%eax
 6f4:	e8 07 fe ff ff       	call   500 <putc>
      state = 0;
 6f9:	be 00 00 00 00       	mov    $0x0,%esi
 6fe:	e9 ce fe ff ff       	jmp    5d1 <printf+0x2c>
    }
  }
}
 703:	8d 65 f4             	lea    -0xc(%ebp),%esp
 706:	5b                   	pop    %ebx
 707:	5e                   	pop    %esi
 708:	5f                   	pop    %edi
 709:	5d                   	pop    %ebp
 70a:	c3                   	ret    

0000070b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 70b:	55                   	push   %ebp
 70c:	89 e5                	mov    %esp,%ebp
 70e:	57                   	push   %edi
 70f:	56                   	push   %esi
 710:	53                   	push   %ebx
 711:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 714:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 717:	a1 e0 0c 00 00       	mov    0xce0,%eax
 71c:	eb 02                	jmp    720 <free+0x15>
 71e:	89 d0                	mov    %edx,%eax
 720:	39 c8                	cmp    %ecx,%eax
 722:	73 04                	jae    728 <free+0x1d>
 724:	39 08                	cmp    %ecx,(%eax)
 726:	77 12                	ja     73a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 728:	8b 10                	mov    (%eax),%edx
 72a:	39 c2                	cmp    %eax,%edx
 72c:	77 f0                	ja     71e <free+0x13>
 72e:	39 c8                	cmp    %ecx,%eax
 730:	72 08                	jb     73a <free+0x2f>
 732:	39 ca                	cmp    %ecx,%edx
 734:	77 04                	ja     73a <free+0x2f>
 736:	89 d0                	mov    %edx,%eax
 738:	eb e6                	jmp    720 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 73a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 740:	8b 10                	mov    (%eax),%edx
 742:	39 d7                	cmp    %edx,%edi
 744:	74 19                	je     75f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 746:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 749:	8b 50 04             	mov    0x4(%eax),%edx
 74c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 74f:	39 ce                	cmp    %ecx,%esi
 751:	74 1b                	je     76e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 753:	89 08                	mov    %ecx,(%eax)
  freep = p;
 755:	a3 e0 0c 00 00       	mov    %eax,0xce0
}
 75a:	5b                   	pop    %ebx
 75b:	5e                   	pop    %esi
 75c:	5f                   	pop    %edi
 75d:	5d                   	pop    %ebp
 75e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 75f:	03 72 04             	add    0x4(%edx),%esi
 762:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 765:	8b 10                	mov    (%eax),%edx
 767:	8b 12                	mov    (%edx),%edx
 769:	89 53 f8             	mov    %edx,-0x8(%ebx)
 76c:	eb db                	jmp    749 <free+0x3e>
    p->s.size += bp->s.size;
 76e:	03 53 fc             	add    -0x4(%ebx),%edx
 771:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 774:	8b 53 f8             	mov    -0x8(%ebx),%edx
 777:	89 10                	mov    %edx,(%eax)
 779:	eb da                	jmp    755 <free+0x4a>

0000077b <morecore>:

static Header*
morecore(uint nu)
{
 77b:	55                   	push   %ebp
 77c:	89 e5                	mov    %esp,%ebp
 77e:	53                   	push   %ebx
 77f:	83 ec 04             	sub    $0x4,%esp
 782:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 784:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 789:	77 05                	ja     790 <morecore+0x15>
    nu = 4096;
 78b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 790:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 797:	83 ec 0c             	sub    $0xc,%esp
 79a:	50                   	push   %eax
 79b:	e8 38 fd ff ff       	call   4d8 <sbrk>
  if(p == (char*)-1)
 7a0:	83 c4 10             	add    $0x10,%esp
 7a3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7a6:	74 1c                	je     7c4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7ab:	83 c0 08             	add    $0x8,%eax
 7ae:	83 ec 0c             	sub    $0xc,%esp
 7b1:	50                   	push   %eax
 7b2:	e8 54 ff ff ff       	call   70b <free>
  return freep;
 7b7:	a1 e0 0c 00 00       	mov    0xce0,%eax
 7bc:	83 c4 10             	add    $0x10,%esp
}
 7bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c2:	c9                   	leave  
 7c3:	c3                   	ret    
    return 0;
 7c4:	b8 00 00 00 00       	mov    $0x0,%eax
 7c9:	eb f4                	jmp    7bf <morecore+0x44>

000007cb <malloc>:

void*
malloc(uint nbytes)
{
 7cb:	55                   	push   %ebp
 7cc:	89 e5                	mov    %esp,%ebp
 7ce:	53                   	push   %ebx
 7cf:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	8d 58 07             	lea    0x7(%eax),%ebx
 7d8:	c1 eb 03             	shr    $0x3,%ebx
 7db:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7de:	8b 0d e0 0c 00 00    	mov    0xce0,%ecx
 7e4:	85 c9                	test   %ecx,%ecx
 7e6:	74 04                	je     7ec <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e8:	8b 01                	mov    (%ecx),%eax
 7ea:	eb 4a                	jmp    836 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7ec:	c7 05 e0 0c 00 00 e4 	movl   $0xce4,0xce0
 7f3:	0c 00 00 
 7f6:	c7 05 e4 0c 00 00 e4 	movl   $0xce4,0xce4
 7fd:	0c 00 00 
    base.s.size = 0;
 800:	c7 05 e8 0c 00 00 00 	movl   $0x0,0xce8
 807:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 80a:	b9 e4 0c 00 00       	mov    $0xce4,%ecx
 80f:	eb d7                	jmp    7e8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 811:	74 19                	je     82c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 813:	29 da                	sub    %ebx,%edx
 815:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 818:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 81b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 81e:	89 0d e0 0c 00 00    	mov    %ecx,0xce0
      return (void*)(p + 1);
 824:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 827:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 82a:	c9                   	leave  
 82b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 82c:	8b 10                	mov    (%eax),%edx
 82e:	89 11                	mov    %edx,(%ecx)
 830:	eb ec                	jmp    81e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 832:	89 c1                	mov    %eax,%ecx
 834:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 836:	8b 50 04             	mov    0x4(%eax),%edx
 839:	39 da                	cmp    %ebx,%edx
 83b:	73 d4                	jae    811 <malloc+0x46>
    if(p == freep)
 83d:	39 05 e0 0c 00 00    	cmp    %eax,0xce0
 843:	75 ed                	jne    832 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 845:	89 d8                	mov    %ebx,%eax
 847:	e8 2f ff ff ff       	call   77b <morecore>
 84c:	85 c0                	test   %eax,%eax
 84e:	75 e2                	jne    832 <malloc+0x67>
 850:	eb d5                	jmp    827 <malloc+0x5c>
