
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
  12:	68 50 08 00 00       	push   $0x850
  17:	68 5a 08 00 00       	push   $0x85a
  1c:	6a 01                	push   $0x1
  1e:	e8 7f 05 00 00       	call   5a2 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 62 08 00 00       	push   $0x862
  2b:	68 6e 08 00 00       	push   $0x86e
  30:	6a 01                	push   $0x1
  32:	e8 6b 05 00 00       	call   5a2 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 82 08 00 00       	push   $0x882
  3f:	6a 01                	push   $0x1
  41:	e8 5c 05 00 00       	call   5a2 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 dc 0c 00 00    	push   0xcdc
  4f:	e8 29 04 00 00       	call   47d <kill>
  54:	e8 f4 03 00 00       	call   44d <exit>
   global += 4;
  59:	a1 d8 0c 00 00       	mov    0xcd8,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 d8 0c 00 00       	mov    %eax,0xcd8
   exit();
  66:	e8 e2 03 00 00       	call   44d <exit>

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
  7e:	e8 4a 04 00 00       	call   4cd <getpid>
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
  ba:	e8 1f 03 00 00       	call   3de <thread_join>
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
  d6:	e8 fa 03 00 00       	call   4d5 <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 50 08 00 00       	push   $0x850
  f5:	68 5a 08 00 00       	push   $0x85a
  fa:	6a 01                	push   $0x1
  fc:	e8 a1 04 00 00       	call   5a2 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 8f 08 00 00       	push   $0x88f
 109:	68 6e 08 00 00       	push   $0x86e
 10e:	6a 01                	push   $0x1
 110:	e8 8d 04 00 00       	call   5a2 <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 82 08 00 00       	push   $0x882
 11d:	6a 01                	push   $0x1
 11f:	e8 7e 04 00 00       	call   5a2 <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 dc 0c 00 00    	push   0xcdc
 12d:	e8 4b 03 00 00       	call   47d <kill>
 132:	e8 16 03 00 00       	call   44d <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 50 08 00 00       	push   $0x850
 13e:	68 5a 08 00 00       	push   $0x85a
 143:	6a 01                	push   $0x1
 145:	e8 58 04 00 00       	call   5a2 <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 9e 08 00 00       	push   $0x89e
 152:	68 6e 08 00 00       	push   $0x86e
 157:	6a 01                	push   $0x1
 159:	e8 44 04 00 00       	call   5a2 <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 82 08 00 00       	push   $0x882
 166:	6a 01                	push   $0x1
 168:	e8 35 04 00 00       	call   5a2 <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 dc 0c 00 00    	push   0xcdc
 176:	e8 02 03 00 00       	call   47d <kill>
 17b:	e8 cd 02 00 00       	call   44d <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 50 08 00 00       	push   $0x850
 187:	68 5a 08 00 00       	push   $0x85a
 18c:	6a 01                	push   $0x1
 18e:	e8 0f 04 00 00       	call   5a2 <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 b5 08 00 00       	push   $0x8b5
 19b:	68 6e 08 00 00       	push   $0x86e
 1a0:	6a 01                	push   $0x1
 1a2:	e8 fb 03 00 00       	call   5a2 <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 82 08 00 00       	push   $0x882
 1af:	6a 01                	push   $0x1
 1b1:	e8 ec 03 00 00       	call   5a2 <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 dc 0c 00 00    	push   0xcdc
 1bf:	e8 b9 02 00 00       	call   47d <kill>
 1c4:	e8 84 02 00 00       	call   44d <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 50 08 00 00       	push   $0x850
 1d0:	68 5a 08 00 00       	push   $0x85a
 1d5:	6a 01                	push   $0x1
 1d7:	e8 c6 03 00 00       	call   5a2 <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 d0 08 00 00       	push   $0x8d0
 1e4:	68 6e 08 00 00       	push   $0x86e
 1e9:	6a 01                	push   $0x1
 1eb:	e8 b2 03 00 00       	call   5a2 <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 82 08 00 00       	push   $0x882
 1f8:	6a 01                	push   $0x1
 1fa:	e8 a3 03 00 00       	call   5a2 <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 dc 0c 00 00    	push   0xcdc
 208:	e8 70 02 00 00       	call   47d <kill>
 20d:	e8 3b 02 00 00       	call   44d <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 c1 08 00 00       	push   $0x8c1
 21a:	6a 01                	push   $0x1
 21c:	e8 81 03 00 00       	call   5a2 <printf>
   exit();
 221:	e8 27 02 00 00       	call   44d <exit>

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
 2ec:	e8 74 01 00 00       	call   465 <read>
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
 32a:	e8 5e 01 00 00       	call   48d <open>
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
 33f:	e8 61 01 00 00       	call   4a5 <fstat>
 344:	89 c6                	mov    %eax,%esi
  close(fd);
 346:	89 1c 24             	mov    %ebx,(%esp)
 349:	e8 27 01 00 00       	call   475 <close>
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

  void* stack = malloc(PGSIZE);
 3c3:	68 00 10 00 00       	push   $0x1000
 3c8:	e8 fb 03 00 00       	call   7c8 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 3cd:	50                   	push   %eax
 3ce:	ff 75 10             	push   0x10(%ebp)
 3d1:	ff 75 0c             	push   0xc(%ebp)
 3d4:	ff 75 08             	push   0x8(%ebp)
 3d7:	e8 11 01 00 00       	call   4ed <clone>
}
 3dc:	c9                   	leave  
 3dd:	c3                   	ret    

000003de <thread_join>:

int thread_join(){
 3de:	55                   	push   %ebp
 3df:	89 e5                	mov    %esp,%ebp
 3e1:	53                   	push   %ebx
 3e2:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 3e5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3e8:	50                   	push   %eax
 3e9:	e8 07 01 00 00       	call   4f5 <join>
  if (x < 0) {
 3ee:	83 c4 10             	add    $0x10,%esp
 3f1:	85 c0                	test   %eax,%eax
 3f3:	78 17                	js     40c <thread_join+0x2e>
 3f5:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 3f7:	83 ec 0c             	sub    $0xc,%esp
 3fa:	ff 75 f4             	push   -0xc(%ebp)
 3fd:	e8 06 03 00 00       	call   708 <free>
  return x;
 402:	83 c4 10             	add    $0x10,%esp
}
 405:	89 d8                	mov    %ebx,%eax
 407:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 40a:	c9                   	leave  
 40b:	c3                   	ret    
    return -1;
 40c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 411:	eb f2                	jmp    405 <thread_join+0x27>

00000413 <lock_init>:

void lock_init(lock_t *spin){
 413:	55                   	push   %ebp
 414:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 416:	8b 45 08             	mov    0x8(%ebp),%eax
 419:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    

00000421 <lock_acquire>:

void lock_acquire(lock_t *spin){
 421:	55                   	push   %ebp
 422:	89 e5                	mov    %esp,%ebp
 424:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 427:	b8 01 00 00 00       	mov    $0x1,%eax
 42c:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 42f:	85 c0                	test   %eax,%eax
 431:	75 f4                	jne    427 <lock_acquire+0x6>

}
 433:	5d                   	pop    %ebp
 434:	c3                   	ret    

00000435 <lock_release>:

void lock_release(lock_t *spin){
 435:	55                   	push   %ebp
 436:	89 e5                	mov    %esp,%ebp
 438:	8b 55 08             	mov    0x8(%ebp),%edx
 43b:	b8 00 00 00 00       	mov    $0x0,%eax
 440:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 443:	5d                   	pop    %ebp
 444:	c3                   	ret    

00000445 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 445:	b8 01 00 00 00       	mov    $0x1,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <exit>:
SYSCALL(exit)
 44d:	b8 02 00 00 00       	mov    $0x2,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <wait>:
SYSCALL(wait)
 455:	b8 03 00 00 00       	mov    $0x3,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <pipe>:
SYSCALL(pipe)
 45d:	b8 04 00 00 00       	mov    $0x4,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <read>:
SYSCALL(read)
 465:	b8 05 00 00 00       	mov    $0x5,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <write>:
SYSCALL(write)
 46d:	b8 10 00 00 00       	mov    $0x10,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <close>:
SYSCALL(close)
 475:	b8 15 00 00 00       	mov    $0x15,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <kill>:
SYSCALL(kill)
 47d:	b8 06 00 00 00       	mov    $0x6,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <exec>:
SYSCALL(exec)
 485:	b8 07 00 00 00       	mov    $0x7,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <open>:
SYSCALL(open)
 48d:	b8 0f 00 00 00       	mov    $0xf,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <mknod>:
SYSCALL(mknod)
 495:	b8 11 00 00 00       	mov    $0x11,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <unlink>:
SYSCALL(unlink)
 49d:	b8 12 00 00 00       	mov    $0x12,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <fstat>:
SYSCALL(fstat)
 4a5:	b8 08 00 00 00       	mov    $0x8,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <link>:
SYSCALL(link)
 4ad:	b8 13 00 00 00       	mov    $0x13,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <mkdir>:
SYSCALL(mkdir)
 4b5:	b8 14 00 00 00       	mov    $0x14,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <chdir>:
SYSCALL(chdir)
 4bd:	b8 09 00 00 00       	mov    $0x9,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <dup>:
SYSCALL(dup)
 4c5:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <getpid>:
SYSCALL(getpid)
 4cd:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <sbrk>:
SYSCALL(sbrk)
 4d5:	b8 0c 00 00 00       	mov    $0xc,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <sleep>:
SYSCALL(sleep)
 4dd:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <uptime>:
SYSCALL(uptime)
 4e5:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <clone>:
SYSCALL(clone)
 4ed:	b8 16 00 00 00       	mov    $0x16,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <join>:
 4f5:	b8 17 00 00 00       	mov    $0x17,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4fd:	55                   	push   %ebp
 4fe:	89 e5                	mov    %esp,%ebp
 500:	83 ec 1c             	sub    $0x1c,%esp
 503:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 506:	6a 01                	push   $0x1
 508:	8d 55 f4             	lea    -0xc(%ebp),%edx
 50b:	52                   	push   %edx
 50c:	50                   	push   %eax
 50d:	e8 5b ff ff ff       	call   46d <write>
}
 512:	83 c4 10             	add    $0x10,%esp
 515:	c9                   	leave  
 516:	c3                   	ret    

00000517 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	57                   	push   %edi
 51b:	56                   	push   %esi
 51c:	53                   	push   %ebx
 51d:	83 ec 2c             	sub    $0x2c,%esp
 520:	89 45 d0             	mov    %eax,-0x30(%ebp)
 523:	89 d0                	mov    %edx,%eax
 525:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 527:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 52b:	0f 95 c1             	setne  %cl
 52e:	c1 ea 1f             	shr    $0x1f,%edx
 531:	84 d1                	test   %dl,%cl
 533:	74 44                	je     579 <printint+0x62>
    neg = 1;
    x = -xx;
 535:	f7 d8                	neg    %eax
 537:	89 c1                	mov    %eax,%ecx
    neg = 1;
 539:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 540:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 545:	89 c8                	mov    %ecx,%eax
 547:	ba 00 00 00 00       	mov    $0x0,%edx
 54c:	f7 f6                	div    %esi
 54e:	89 df                	mov    %ebx,%edi
 550:	83 c3 01             	add    $0x1,%ebx
 553:	0f b6 92 6c 09 00 00 	movzbl 0x96c(%edx),%edx
 55a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 55e:	89 ca                	mov    %ecx,%edx
 560:	89 c1                	mov    %eax,%ecx
 562:	39 d6                	cmp    %edx,%esi
 564:	76 df                	jbe    545 <printint+0x2e>
  if(neg)
 566:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 56a:	74 31                	je     59d <printint+0x86>
    buf[i++] = '-';
 56c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 571:	8d 5f 02             	lea    0x2(%edi),%ebx
 574:	8b 75 d0             	mov    -0x30(%ebp),%esi
 577:	eb 17                	jmp    590 <printint+0x79>
    x = xx;
 579:	89 c1                	mov    %eax,%ecx
  neg = 0;
 57b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 582:	eb bc                	jmp    540 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 584:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 589:	89 f0                	mov    %esi,%eax
 58b:	e8 6d ff ff ff       	call   4fd <putc>
  while(--i >= 0)
 590:	83 eb 01             	sub    $0x1,%ebx
 593:	79 ef                	jns    584 <printint+0x6d>
}
 595:	83 c4 2c             	add    $0x2c,%esp
 598:	5b                   	pop    %ebx
 599:	5e                   	pop    %esi
 59a:	5f                   	pop    %edi
 59b:	5d                   	pop    %ebp
 59c:	c3                   	ret    
 59d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5a0:	eb ee                	jmp    590 <printint+0x79>

000005a2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
 5a5:	57                   	push   %edi
 5a6:	56                   	push   %esi
 5a7:	53                   	push   %ebx
 5a8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5ab:	8d 45 10             	lea    0x10(%ebp),%eax
 5ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5b1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5b6:	bb 00 00 00 00       	mov    $0x0,%ebx
 5bb:	eb 14                	jmp    5d1 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5bd:	89 fa                	mov    %edi,%edx
 5bf:	8b 45 08             	mov    0x8(%ebp),%eax
 5c2:	e8 36 ff ff ff       	call   4fd <putc>
 5c7:	eb 05                	jmp    5ce <printf+0x2c>
      }
    } else if(state == '%'){
 5c9:	83 fe 25             	cmp    $0x25,%esi
 5cc:	74 25                	je     5f3 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5ce:	83 c3 01             	add    $0x1,%ebx
 5d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d4:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5d8:	84 c0                	test   %al,%al
 5da:	0f 84 20 01 00 00    	je     700 <printf+0x15e>
    c = fmt[i] & 0xff;
 5e0:	0f be f8             	movsbl %al,%edi
 5e3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5e6:	85 f6                	test   %esi,%esi
 5e8:	75 df                	jne    5c9 <printf+0x27>
      if(c == '%'){
 5ea:	83 f8 25             	cmp    $0x25,%eax
 5ed:	75 ce                	jne    5bd <printf+0x1b>
        state = '%';
 5ef:	89 c6                	mov    %eax,%esi
 5f1:	eb db                	jmp    5ce <printf+0x2c>
      if(c == 'd'){
 5f3:	83 f8 25             	cmp    $0x25,%eax
 5f6:	0f 84 cf 00 00 00    	je     6cb <printf+0x129>
 5fc:	0f 8c dd 00 00 00    	jl     6df <printf+0x13d>
 602:	83 f8 78             	cmp    $0x78,%eax
 605:	0f 8f d4 00 00 00    	jg     6df <printf+0x13d>
 60b:	83 f8 63             	cmp    $0x63,%eax
 60e:	0f 8c cb 00 00 00    	jl     6df <printf+0x13d>
 614:	83 e8 63             	sub    $0x63,%eax
 617:	83 f8 15             	cmp    $0x15,%eax
 61a:	0f 87 bf 00 00 00    	ja     6df <printf+0x13d>
 620:	ff 24 85 14 09 00 00 	jmp    *0x914(,%eax,4)
        printint(fd, *ap, 10, 1);
 627:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 62a:	8b 17                	mov    (%edi),%edx
 62c:	83 ec 0c             	sub    $0xc,%esp
 62f:	6a 01                	push   $0x1
 631:	b9 0a 00 00 00       	mov    $0xa,%ecx
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	e8 d9 fe ff ff       	call   517 <printint>
        ap++;
 63e:	83 c7 04             	add    $0x4,%edi
 641:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 644:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 647:	be 00 00 00 00       	mov    $0x0,%esi
 64c:	eb 80                	jmp    5ce <printf+0x2c>
        printint(fd, *ap, 16, 0);
 64e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 651:	8b 17                	mov    (%edi),%edx
 653:	83 ec 0c             	sub    $0xc,%esp
 656:	6a 00                	push   $0x0
 658:	b9 10 00 00 00       	mov    $0x10,%ecx
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	e8 b2 fe ff ff       	call   517 <printint>
        ap++;
 665:	83 c7 04             	add    $0x4,%edi
 668:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 66b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66e:	be 00 00 00 00       	mov    $0x0,%esi
 673:	e9 56 ff ff ff       	jmp    5ce <printf+0x2c>
        s = (char*)*ap;
 678:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67b:	8b 30                	mov    (%eax),%esi
        ap++;
 67d:	83 c0 04             	add    $0x4,%eax
 680:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 683:	85 f6                	test   %esi,%esi
 685:	75 15                	jne    69c <printf+0xfa>
          s = "(null)";
 687:	be 0c 09 00 00       	mov    $0x90c,%esi
 68c:	eb 0e                	jmp    69c <printf+0xfa>
          putc(fd, *s);
 68e:	0f be d2             	movsbl %dl,%edx
 691:	8b 45 08             	mov    0x8(%ebp),%eax
 694:	e8 64 fe ff ff       	call   4fd <putc>
          s++;
 699:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 69c:	0f b6 16             	movzbl (%esi),%edx
 69f:	84 d2                	test   %dl,%dl
 6a1:	75 eb                	jne    68e <printf+0xec>
      state = 0;
 6a3:	be 00 00 00 00       	mov    $0x0,%esi
 6a8:	e9 21 ff ff ff       	jmp    5ce <printf+0x2c>
        putc(fd, *ap);
 6ad:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b0:	0f be 17             	movsbl (%edi),%edx
 6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 6b6:	e8 42 fe ff ff       	call   4fd <putc>
        ap++;
 6bb:	83 c7 04             	add    $0x4,%edi
 6be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6c1:	be 00 00 00 00       	mov    $0x0,%esi
 6c6:	e9 03 ff ff ff       	jmp    5ce <printf+0x2c>
        putc(fd, c);
 6cb:	89 fa                	mov    %edi,%edx
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	e8 28 fe ff ff       	call   4fd <putc>
      state = 0;
 6d5:	be 00 00 00 00       	mov    $0x0,%esi
 6da:	e9 ef fe ff ff       	jmp    5ce <printf+0x2c>
        putc(fd, '%');
 6df:	ba 25 00 00 00       	mov    $0x25,%edx
 6e4:	8b 45 08             	mov    0x8(%ebp),%eax
 6e7:	e8 11 fe ff ff       	call   4fd <putc>
        putc(fd, c);
 6ec:	89 fa                	mov    %edi,%edx
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	e8 07 fe ff ff       	call   4fd <putc>
      state = 0;
 6f6:	be 00 00 00 00       	mov    $0x0,%esi
 6fb:	e9 ce fe ff ff       	jmp    5ce <printf+0x2c>
    }
  }
}
 700:	8d 65 f4             	lea    -0xc(%ebp),%esp
 703:	5b                   	pop    %ebx
 704:	5e                   	pop    %esi
 705:	5f                   	pop    %edi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    

00000708 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 708:	55                   	push   %ebp
 709:	89 e5                	mov    %esp,%ebp
 70b:	57                   	push   %edi
 70c:	56                   	push   %esi
 70d:	53                   	push   %ebx
 70e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 711:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 714:	a1 e0 0c 00 00       	mov    0xce0,%eax
 719:	eb 02                	jmp    71d <free+0x15>
 71b:	89 d0                	mov    %edx,%eax
 71d:	39 c8                	cmp    %ecx,%eax
 71f:	73 04                	jae    725 <free+0x1d>
 721:	39 08                	cmp    %ecx,(%eax)
 723:	77 12                	ja     737 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 725:	8b 10                	mov    (%eax),%edx
 727:	39 c2                	cmp    %eax,%edx
 729:	77 f0                	ja     71b <free+0x13>
 72b:	39 c8                	cmp    %ecx,%eax
 72d:	72 08                	jb     737 <free+0x2f>
 72f:	39 ca                	cmp    %ecx,%edx
 731:	77 04                	ja     737 <free+0x2f>
 733:	89 d0                	mov    %edx,%eax
 735:	eb e6                	jmp    71d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 737:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73d:	8b 10                	mov    (%eax),%edx
 73f:	39 d7                	cmp    %edx,%edi
 741:	74 19                	je     75c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 743:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 746:	8b 50 04             	mov    0x4(%eax),%edx
 749:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 74c:	39 ce                	cmp    %ecx,%esi
 74e:	74 1b                	je     76b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 750:	89 08                	mov    %ecx,(%eax)
  freep = p;
 752:	a3 e0 0c 00 00       	mov    %eax,0xce0
}
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 75c:	03 72 04             	add    0x4(%edx),%esi
 75f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 762:	8b 10                	mov    (%eax),%edx
 764:	8b 12                	mov    (%edx),%edx
 766:	89 53 f8             	mov    %edx,-0x8(%ebx)
 769:	eb db                	jmp    746 <free+0x3e>
    p->s.size += bp->s.size;
 76b:	03 53 fc             	add    -0x4(%ebx),%edx
 76e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 771:	8b 53 f8             	mov    -0x8(%ebx),%edx
 774:	89 10                	mov    %edx,(%eax)
 776:	eb da                	jmp    752 <free+0x4a>

00000778 <morecore>:

static Header*
morecore(uint nu)
{
 778:	55                   	push   %ebp
 779:	89 e5                	mov    %esp,%ebp
 77b:	53                   	push   %ebx
 77c:	83 ec 04             	sub    $0x4,%esp
 77f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 781:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 786:	77 05                	ja     78d <morecore+0x15>
    nu = 4096;
 788:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 78d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 794:	83 ec 0c             	sub    $0xc,%esp
 797:	50                   	push   %eax
 798:	e8 38 fd ff ff       	call   4d5 <sbrk>
  if(p == (char*)-1)
 79d:	83 c4 10             	add    $0x10,%esp
 7a0:	83 f8 ff             	cmp    $0xffffffff,%eax
 7a3:	74 1c                	je     7c1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7a5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7a8:	83 c0 08             	add    $0x8,%eax
 7ab:	83 ec 0c             	sub    $0xc,%esp
 7ae:	50                   	push   %eax
 7af:	e8 54 ff ff ff       	call   708 <free>
  return freep;
 7b4:	a1 e0 0c 00 00       	mov    0xce0,%eax
 7b9:	83 c4 10             	add    $0x10,%esp
}
 7bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7bf:	c9                   	leave  
 7c0:	c3                   	ret    
    return 0;
 7c1:	b8 00 00 00 00       	mov    $0x0,%eax
 7c6:	eb f4                	jmp    7bc <morecore+0x44>

000007c8 <malloc>:

void*
malloc(uint nbytes)
{
 7c8:	55                   	push   %ebp
 7c9:	89 e5                	mov    %esp,%ebp
 7cb:	53                   	push   %ebx
 7cc:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7cf:	8b 45 08             	mov    0x8(%ebp),%eax
 7d2:	8d 58 07             	lea    0x7(%eax),%ebx
 7d5:	c1 eb 03             	shr    $0x3,%ebx
 7d8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7db:	8b 0d e0 0c 00 00    	mov    0xce0,%ecx
 7e1:	85 c9                	test   %ecx,%ecx
 7e3:	74 04                	je     7e9 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e5:	8b 01                	mov    (%ecx),%eax
 7e7:	eb 4a                	jmp    833 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7e9:	c7 05 e0 0c 00 00 e4 	movl   $0xce4,0xce0
 7f0:	0c 00 00 
 7f3:	c7 05 e4 0c 00 00 e4 	movl   $0xce4,0xce4
 7fa:	0c 00 00 
    base.s.size = 0;
 7fd:	c7 05 e8 0c 00 00 00 	movl   $0x0,0xce8
 804:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 807:	b9 e4 0c 00 00       	mov    $0xce4,%ecx
 80c:	eb d7                	jmp    7e5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 80e:	74 19                	je     829 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 810:	29 da                	sub    %ebx,%edx
 812:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 815:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 818:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 81b:	89 0d e0 0c 00 00    	mov    %ecx,0xce0
      return (void*)(p + 1);
 821:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 824:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 827:	c9                   	leave  
 828:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 829:	8b 10                	mov    (%eax),%edx
 82b:	89 11                	mov    %edx,(%ecx)
 82d:	eb ec                	jmp    81b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82f:	89 c1                	mov    %eax,%ecx
 831:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 833:	8b 50 04             	mov    0x4(%eax),%edx
 836:	39 da                	cmp    %ebx,%edx
 838:	73 d4                	jae    80e <malloc+0x46>
    if(p == freep)
 83a:	39 05 e0 0c 00 00    	cmp    %eax,0xce0
 840:	75 ed                	jne    82f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 842:	89 d8                	mov    %ebx,%eax
 844:	e8 2f ff ff ff       	call   778 <morecore>
 849:	85 c0                	test   %eax,%eax
 84b:	75 e2                	jne    82f <malloc+0x67>
 84d:	eb d5                	jmp    824 <malloc+0x5c>
