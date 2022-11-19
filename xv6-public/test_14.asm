
_test_14:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <worker+0x30>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <worker+0x79>
   assert(global == 1);
  18:	a1 e8 0c 00 00       	mov    0xce8,%eax
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 e8 0c 00 00       	mov    %eax,0xce8
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
  32:	68 88 08 00 00       	push   $0x888
  37:	68 92 08 00 00       	push   $0x892
  3c:	6a 01                	push   $0x1
  3e:	e8 98 05 00 00       	call   5db <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 9a 08 00 00       	push   $0x89a
  4b:	68 a5 08 00 00       	push   $0x8a5
  50:	6a 01                	push   $0x1
  52:	e8 84 05 00 00       	call   5db <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 b9 08 00 00       	push   $0x8b9
  5f:	6a 01                	push   $0x1
  61:	e8 75 05 00 00       	call   5db <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 ec 0c 00 00    	push   0xcec
  6f:	e8 42 04 00 00       	call   4b6 <kill>
  74:	e8 0d 04 00 00       	call   486 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 88 08 00 00       	push   $0x888
  80:	68 92 08 00 00       	push   $0x892
  85:	6a 01                	push   $0x1
  87:	e8 4f 05 00 00       	call   5db <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 c6 08 00 00       	push   $0x8c6
  94:	68 a5 08 00 00       	push   $0x8a5
  99:	6a 01                	push   $0x1
  9b:	e8 3b 05 00 00       	call   5db <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 b9 08 00 00       	push   $0x8b9
  a8:	6a 01                	push   $0x1
  aa:	e8 2c 05 00 00       	call   5db <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 ec 0c 00 00    	push   0xcec
  b8:	e8 f9 03 00 00       	call   4b6 <kill>
  bd:	e8 c4 03 00 00       	call   486 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 88 08 00 00       	push   $0x888
  c9:	68 92 08 00 00       	push   $0x892
  ce:	6a 01                	push   $0x1
  d0:	e8 06 05 00 00       	call   5db <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 d1 08 00 00       	push   $0x8d1
  dd:	68 a5 08 00 00       	push   $0x8a5
  e2:	6a 01                	push   $0x1
  e4:	e8 f2 04 00 00       	call   5db <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 b9 08 00 00       	push   $0x8b9
  f1:	6a 01                	push   $0x1
  f3:	e8 e3 04 00 00       	call   5db <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 ec 0c 00 00    	push   0xcec
 101:	e8 b0 03 00 00       	call   4b6 <kill>
 106:	e8 7b 03 00 00       	call   486 <exit>

0000010b <main>:
{
 10b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 10f:	83 e4 f0             	and    $0xfffffff0,%esp
 112:	ff 71 fc             	push   -0x4(%ecx)
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	53                   	push   %ebx
 119:	51                   	push   %ecx
 11a:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 11d:	e8 e4 03 00 00       	call   506 <getpid>
 122:	a3 ec 0c 00 00       	mov    %eax,0xcec
   int arg1 = 42, arg2 = 24;
 127:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 12e:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 135:	83 ec 04             	sub    $0x4,%esp
 138:	8d 45 f0             	lea    -0x10(%ebp),%eax
 13b:	50                   	push   %eax
 13c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 13f:	50                   	push   %eax
 140:	68 00 00 00 00       	push   $0x0
 145:	e8 a9 02 00 00       	call   3f3 <thread_create>
   assert(thread_pid > 0);
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	7e 65                	jle    1b6 <main+0xab>
 151:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 153:	e8 d0 02 00 00       	call   428 <thread_join>
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
 160:	83 3d e8 0c 00 00 02 	cmpl   $0x2,0xce8
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 88 08 00 00       	push   $0x888
 174:	68 92 08 00 00       	push   $0x892
 179:	6a 01                	push   $0x1
 17b:	e8 5b 04 00 00       	call   5db <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 03 09 00 00       	push   $0x903
 188:	68 a5 08 00 00       	push   $0x8a5
 18d:	6a 01                	push   $0x1
 18f:	e8 47 04 00 00       	call   5db <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 b9 08 00 00       	push   $0x8b9
 19c:	6a 01                	push   $0x1
 19e:	e8 38 04 00 00       	call   5db <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 ec 0c 00 00    	push   0xcec
 1ac:	e8 05 03 00 00       	call   4b6 <kill>
 1b1:	e8 d0 02 00 00       	call   486 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 88 08 00 00       	push   $0x888
 1bd:	68 92 08 00 00       	push   $0x892
 1c2:	6a 01                	push   $0x1
 1c4:	e8 12 04 00 00       	call   5db <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 dd 08 00 00       	push   $0x8dd
 1d1:	68 a5 08 00 00       	push   $0x8a5
 1d6:	6a 01                	push   $0x1
 1d8:	e8 fe 03 00 00       	call   5db <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 b9 08 00 00       	push   $0x8b9
 1e5:	6a 01                	push   $0x1
 1e7:	e8 ef 03 00 00       	call   5db <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 ec 0c 00 00    	push   0xcec
 1f5:	e8 bc 02 00 00       	call   4b6 <kill>
 1fa:	e8 87 02 00 00       	call   486 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 88 08 00 00       	push   $0x888
 206:	68 92 08 00 00       	push   $0x892
 20b:	6a 01                	push   $0x1
 20d:	e8 c9 03 00 00       	call   5db <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 ec 08 00 00       	push   $0x8ec
 21a:	68 a5 08 00 00       	push   $0x8a5
 21f:	6a 01                	push   $0x1
 221:	e8 b5 03 00 00       	call   5db <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 b9 08 00 00       	push   $0x8b9
 22e:	6a 01                	push   $0x1
 230:	e8 a6 03 00 00       	call   5db <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 ec 0c 00 00    	push   0xcec
 23e:	e8 73 02 00 00       	call   4b6 <kill>
 243:	e8 3e 02 00 00       	call   486 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 0f 09 00 00       	push   $0x90f
 250:	6a 01                	push   $0x1
 252:	e8 84 03 00 00       	call   5db <printf>
   exit();
 257:	e8 2a 02 00 00       	call   486 <exit>

0000025c <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	56                   	push   %esi
 260:	53                   	push   %ebx
 261:	8b 75 08             	mov    0x8(%ebp),%esi
 264:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 267:	89 f0                	mov    %esi,%eax
 269:	89 d1                	mov    %edx,%ecx
 26b:	83 c2 01             	add    $0x1,%edx
 26e:	89 c3                	mov    %eax,%ebx
 270:	83 c0 01             	add    $0x1,%eax
 273:	0f b6 09             	movzbl (%ecx),%ecx
 276:	88 0b                	mov    %cl,(%ebx)
 278:	84 c9                	test   %cl,%cl
 27a:	75 ed                	jne    269 <strcpy+0xd>
    ;
  return os;
}
 27c:	89 f0                	mov    %esi,%eax
 27e:	5b                   	pop    %ebx
 27f:	5e                   	pop    %esi
 280:	5d                   	pop    %ebp
 281:	c3                   	ret    

00000282 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	8b 4d 08             	mov    0x8(%ebp),%ecx
 288:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 28b:	eb 06                	jmp    293 <strcmp+0x11>
    p++, q++;
 28d:	83 c1 01             	add    $0x1,%ecx
 290:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 293:	0f b6 01             	movzbl (%ecx),%eax
 296:	84 c0                	test   %al,%al
 298:	74 04                	je     29e <strcmp+0x1c>
 29a:	3a 02                	cmp    (%edx),%al
 29c:	74 ef                	je     28d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 29e:	0f b6 c0             	movzbl %al,%eax
 2a1:	0f b6 12             	movzbl (%edx),%edx
 2a4:	29 d0                	sub    %edx,%eax
}
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    

000002a8 <strlen>:

uint
strlen(const char *s)
{
 2a8:	55                   	push   %ebp
 2a9:	89 e5                	mov    %esp,%ebp
 2ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ae:	b8 00 00 00 00       	mov    $0x0,%eax
 2b3:	eb 03                	jmp    2b8 <strlen+0x10>
 2b5:	83 c0 01             	add    $0x1,%eax
 2b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2bc:	75 f7                	jne    2b5 <strlen+0xd>
    ;
  return n;
}
 2be:	5d                   	pop    %ebp
 2bf:	c3                   	ret    

000002c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2c7:	89 d7                	mov    %edx,%edi
 2c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cf:	fc                   	cld    
 2d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d2:	89 d0                	mov    %edx,%eax
 2d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <strchr>:

char*
strchr(const char *s, char c)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2e3:	eb 03                	jmp    2e8 <strchr+0xf>
 2e5:	83 c0 01             	add    $0x1,%eax
 2e8:	0f b6 10             	movzbl (%eax),%edx
 2eb:	84 d2                	test   %dl,%dl
 2ed:	74 06                	je     2f5 <strchr+0x1c>
    if(*s == c)
 2ef:	38 ca                	cmp    %cl,%dl
 2f1:	75 f2                	jne    2e5 <strchr+0xc>
 2f3:	eb 05                	jmp    2fa <strchr+0x21>
      return (char*)s;
  return 0;
 2f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    

000002fc <gets>:

char*
gets(char *buf, int max)
{
 2fc:	55                   	push   %ebp
 2fd:	89 e5                	mov    %esp,%ebp
 2ff:	57                   	push   %edi
 300:	56                   	push   %esi
 301:	53                   	push   %ebx
 302:	83 ec 1c             	sub    $0x1c,%esp
 305:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 308:	bb 00 00 00 00       	mov    $0x0,%ebx
 30d:	89 de                	mov    %ebx,%esi
 30f:	83 c3 01             	add    $0x1,%ebx
 312:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 315:	7d 2e                	jge    345 <gets+0x49>
    cc = read(0, &c, 1);
 317:	83 ec 04             	sub    $0x4,%esp
 31a:	6a 01                	push   $0x1
 31c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 31f:	50                   	push   %eax
 320:	6a 00                	push   $0x0
 322:	e8 77 01 00 00       	call   49e <read>
    if(cc < 1)
 327:	83 c4 10             	add    $0x10,%esp
 32a:	85 c0                	test   %eax,%eax
 32c:	7e 17                	jle    345 <gets+0x49>
      break;
    buf[i++] = c;
 32e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 332:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 335:	3c 0a                	cmp    $0xa,%al
 337:	0f 94 c2             	sete   %dl
 33a:	3c 0d                	cmp    $0xd,%al
 33c:	0f 94 c0             	sete   %al
 33f:	08 c2                	or     %al,%dl
 341:	74 ca                	je     30d <gets+0x11>
    buf[i++] = c;
 343:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 345:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 349:	89 f8                	mov    %edi,%eax
 34b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34e:	5b                   	pop    %ebx
 34f:	5e                   	pop    %esi
 350:	5f                   	pop    %edi
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    

00000353 <stat>:

int
stat(const char *n, struct stat *st)
{
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	56                   	push   %esi
 357:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 358:	83 ec 08             	sub    $0x8,%esp
 35b:	6a 00                	push   $0x0
 35d:	ff 75 08             	push   0x8(%ebp)
 360:	e8 61 01 00 00       	call   4c6 <open>
  if(fd < 0)
 365:	83 c4 10             	add    $0x10,%esp
 368:	85 c0                	test   %eax,%eax
 36a:	78 24                	js     390 <stat+0x3d>
 36c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 36e:	83 ec 08             	sub    $0x8,%esp
 371:	ff 75 0c             	push   0xc(%ebp)
 374:	50                   	push   %eax
 375:	e8 64 01 00 00       	call   4de <fstat>
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	89 1c 24             	mov    %ebx,(%esp)
 37f:	e8 2a 01 00 00       	call   4ae <close>
  return r;
 384:	83 c4 10             	add    $0x10,%esp
}
 387:	89 f0                	mov    %esi,%eax
 389:	8d 65 f8             	lea    -0x8(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb f0                	jmp    387 <stat+0x34>

00000397 <atoi>:

int
atoi(const char *s)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	53                   	push   %ebx
 39b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 39e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3a3:	eb 10                	jmp    3b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ab:	83 c1 01             	add    $0x1,%ecx
 3ae:	0f be c0             	movsbl %al,%eax
 3b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3b5:	0f b6 01             	movzbl (%ecx),%eax
 3b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3bb:	80 fb 09             	cmp    $0x9,%bl
 3be:	76 e5                	jbe    3a5 <atoi+0xe>
  return n;
}
 3c0:	89 d0                	mov    %edx,%eax
 3c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c5:	c9                   	leave  
 3c6:	c3                   	ret    

000003c7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	56                   	push   %esi
 3cb:	53                   	push   %ebx
 3cc:	8b 75 08             	mov    0x8(%ebp),%esi
 3cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3d7:	eb 0d                	jmp    3e6 <memmove+0x1f>
    *dst++ = *src++;
 3d9:	0f b6 01             	movzbl (%ecx),%eax
 3dc:	88 02                	mov    %al,(%edx)
 3de:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3e4:	89 d8                	mov    %ebx,%eax
 3e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3e9:	85 c0                	test   %eax,%eax
 3eb:	7f ec                	jg     3d9 <memmove+0x12>
  return vdst;
}
 3ed:	89 f0                	mov    %esi,%eax
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    

000003f3 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 3f9:	68 00 20 00 00       	push   $0x2000
 3fe:	e8 fe 03 00 00       	call   801 <malloc>
  if ((uint)stack%PGSIZE){
 403:	83 c4 10             	add    $0x10,%esp
 406:	a9 ff 0f 00 00       	test   $0xfff,%eax
 40b:	74 0a                	je     417 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 40d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 412:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 417:	50                   	push   %eax
 418:	ff 75 10             	push   0x10(%ebp)
 41b:	ff 75 0c             	push   0xc(%ebp)
 41e:	ff 75 08             	push   0x8(%ebp)
 421:	e8 00 01 00 00       	call   526 <clone>
}
 426:	c9                   	leave  
 427:	c3                   	ret    

00000428 <thread_join>:

int thread_join(){
 428:	55                   	push   %ebp
 429:	89 e5                	mov    %esp,%ebp
 42b:	53                   	push   %ebx
 42c:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 42f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 432:	50                   	push   %eax
 433:	e8 f6 00 00 00       	call   52e <join>
 438:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 43a:	83 c4 04             	add    $0x4,%esp
 43d:	ff 75 f4             	push   -0xc(%ebp)
 440:	e8 fc 02 00 00       	call   741 <free>
  return x;
}
 445:	89 d8                	mov    %ebx,%eax
 447:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44a:	c9                   	leave  
 44b:	c3                   	ret    

0000044c <lock_init>:

void lock_init(lock_t *spin){
 44c:	55                   	push   %ebp
 44d:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <lock_acquire>:

void lock_acquire(lock_t *spin){
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 460:	b8 01 00 00 00       	mov    $0x1,%eax
 465:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 468:	85 c0                	test   %eax,%eax
 46a:	75 f4                	jne    460 <lock_acquire+0x6>

}
 46c:	5d                   	pop    %ebp
 46d:	c3                   	ret    

0000046e <lock_release>:

void lock_release(lock_t *spin){
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	8b 55 08             	mov    0x8(%ebp),%edx
 474:	b8 00 00 00 00       	mov    $0x0,%eax
 479:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 47c:	5d                   	pop    %ebp
 47d:	c3                   	ret    

0000047e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 47e:	b8 01 00 00 00       	mov    $0x1,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <exit>:
SYSCALL(exit)
 486:	b8 02 00 00 00       	mov    $0x2,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <wait>:
SYSCALL(wait)
 48e:	b8 03 00 00 00       	mov    $0x3,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <pipe>:
SYSCALL(pipe)
 496:	b8 04 00 00 00       	mov    $0x4,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <read>:
SYSCALL(read)
 49e:	b8 05 00 00 00       	mov    $0x5,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <write>:
SYSCALL(write)
 4a6:	b8 10 00 00 00       	mov    $0x10,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <close>:
SYSCALL(close)
 4ae:	b8 15 00 00 00       	mov    $0x15,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <kill>:
SYSCALL(kill)
 4b6:	b8 06 00 00 00       	mov    $0x6,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <exec>:
SYSCALL(exec)
 4be:	b8 07 00 00 00       	mov    $0x7,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <open>:
SYSCALL(open)
 4c6:	b8 0f 00 00 00       	mov    $0xf,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <mknod>:
SYSCALL(mknod)
 4ce:	b8 11 00 00 00       	mov    $0x11,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <unlink>:
SYSCALL(unlink)
 4d6:	b8 12 00 00 00       	mov    $0x12,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <fstat>:
SYSCALL(fstat)
 4de:	b8 08 00 00 00       	mov    $0x8,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <link>:
SYSCALL(link)
 4e6:	b8 13 00 00 00       	mov    $0x13,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <mkdir>:
SYSCALL(mkdir)
 4ee:	b8 14 00 00 00       	mov    $0x14,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <chdir>:
SYSCALL(chdir)
 4f6:	b8 09 00 00 00       	mov    $0x9,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <dup>:
SYSCALL(dup)
 4fe:	b8 0a 00 00 00       	mov    $0xa,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <getpid>:
SYSCALL(getpid)
 506:	b8 0b 00 00 00       	mov    $0xb,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <sbrk>:
SYSCALL(sbrk)
 50e:	b8 0c 00 00 00       	mov    $0xc,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <sleep>:
SYSCALL(sleep)
 516:	b8 0d 00 00 00       	mov    $0xd,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <uptime>:
SYSCALL(uptime)
 51e:	b8 0e 00 00 00       	mov    $0xe,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <clone>:
SYSCALL(clone)
 526:	b8 16 00 00 00       	mov    $0x16,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <join>:
 52e:	b8 17 00 00 00       	mov    $0x17,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	83 ec 1c             	sub    $0x1c,%esp
 53c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 53f:	6a 01                	push   $0x1
 541:	8d 55 f4             	lea    -0xc(%ebp),%edx
 544:	52                   	push   %edx
 545:	50                   	push   %eax
 546:	e8 5b ff ff ff       	call   4a6 <write>
}
 54b:	83 c4 10             	add    $0x10,%esp
 54e:	c9                   	leave  
 54f:	c3                   	ret    

00000550 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 2c             	sub    $0x2c,%esp
 559:	89 45 d0             	mov    %eax,-0x30(%ebp)
 55c:	89 d0                	mov    %edx,%eax
 55e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 560:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 564:	0f 95 c1             	setne  %cl
 567:	c1 ea 1f             	shr    $0x1f,%edx
 56a:	84 d1                	test   %dl,%cl
 56c:	74 44                	je     5b2 <printint+0x62>
    neg = 1;
    x = -xx;
 56e:	f7 d8                	neg    %eax
 570:	89 c1                	mov    %eax,%ecx
    neg = 1;
 572:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 579:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 57e:	89 c8                	mov    %ecx,%eax
 580:	ba 00 00 00 00       	mov    $0x0,%edx
 585:	f7 f6                	div    %esi
 587:	89 df                	mov    %ebx,%edi
 589:	83 c3 01             	add    $0x1,%ebx
 58c:	0f b6 92 7c 09 00 00 	movzbl 0x97c(%edx),%edx
 593:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 597:	89 ca                	mov    %ecx,%edx
 599:	89 c1                	mov    %eax,%ecx
 59b:	39 d6                	cmp    %edx,%esi
 59d:	76 df                	jbe    57e <printint+0x2e>
  if(neg)
 59f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5a3:	74 31                	je     5d6 <printint+0x86>
    buf[i++] = '-';
 5a5:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5aa:	8d 5f 02             	lea    0x2(%edi),%ebx
 5ad:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b0:	eb 17                	jmp    5c9 <printint+0x79>
    x = xx;
 5b2:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5b4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5bb:	eb bc                	jmp    579 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5bd:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5c2:	89 f0                	mov    %esi,%eax
 5c4:	e8 6d ff ff ff       	call   536 <putc>
  while(--i >= 0)
 5c9:	83 eb 01             	sub    $0x1,%ebx
 5cc:	79 ef                	jns    5bd <printint+0x6d>
}
 5ce:	83 c4 2c             	add    $0x2c,%esp
 5d1:	5b                   	pop    %ebx
 5d2:	5e                   	pop    %esi
 5d3:	5f                   	pop    %edi
 5d4:	5d                   	pop    %ebp
 5d5:	c3                   	ret    
 5d6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5d9:	eb ee                	jmp    5c9 <printint+0x79>

000005db <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5db:	55                   	push   %ebp
 5dc:	89 e5                	mov    %esp,%ebp
 5de:	57                   	push   %edi
 5df:	56                   	push   %esi
 5e0:	53                   	push   %ebx
 5e1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5e4:	8d 45 10             	lea    0x10(%ebp),%eax
 5e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5ea:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5ef:	bb 00 00 00 00       	mov    $0x0,%ebx
 5f4:	eb 14                	jmp    60a <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5f6:	89 fa                	mov    %edi,%edx
 5f8:	8b 45 08             	mov    0x8(%ebp),%eax
 5fb:	e8 36 ff ff ff       	call   536 <putc>
 600:	eb 05                	jmp    607 <printf+0x2c>
      }
    } else if(state == '%'){
 602:	83 fe 25             	cmp    $0x25,%esi
 605:	74 25                	je     62c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 607:	83 c3 01             	add    $0x1,%ebx
 60a:	8b 45 0c             	mov    0xc(%ebp),%eax
 60d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 611:	84 c0                	test   %al,%al
 613:	0f 84 20 01 00 00    	je     739 <printf+0x15e>
    c = fmt[i] & 0xff;
 619:	0f be f8             	movsbl %al,%edi
 61c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 61f:	85 f6                	test   %esi,%esi
 621:	75 df                	jne    602 <printf+0x27>
      if(c == '%'){
 623:	83 f8 25             	cmp    $0x25,%eax
 626:	75 ce                	jne    5f6 <printf+0x1b>
        state = '%';
 628:	89 c6                	mov    %eax,%esi
 62a:	eb db                	jmp    607 <printf+0x2c>
      if(c == 'd'){
 62c:	83 f8 25             	cmp    $0x25,%eax
 62f:	0f 84 cf 00 00 00    	je     704 <printf+0x129>
 635:	0f 8c dd 00 00 00    	jl     718 <printf+0x13d>
 63b:	83 f8 78             	cmp    $0x78,%eax
 63e:	0f 8f d4 00 00 00    	jg     718 <printf+0x13d>
 644:	83 f8 63             	cmp    $0x63,%eax
 647:	0f 8c cb 00 00 00    	jl     718 <printf+0x13d>
 64d:	83 e8 63             	sub    $0x63,%eax
 650:	83 f8 15             	cmp    $0x15,%eax
 653:	0f 87 bf 00 00 00    	ja     718 <printf+0x13d>
 659:	ff 24 85 24 09 00 00 	jmp    *0x924(,%eax,4)
        printint(fd, *ap, 10, 1);
 660:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 663:	8b 17                	mov    (%edi),%edx
 665:	83 ec 0c             	sub    $0xc,%esp
 668:	6a 01                	push   $0x1
 66a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 66f:	8b 45 08             	mov    0x8(%ebp),%eax
 672:	e8 d9 fe ff ff       	call   550 <printint>
        ap++;
 677:	83 c7 04             	add    $0x4,%edi
 67a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 67d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 680:	be 00 00 00 00       	mov    $0x0,%esi
 685:	eb 80                	jmp    607 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 687:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 68a:	8b 17                	mov    (%edi),%edx
 68c:	83 ec 0c             	sub    $0xc,%esp
 68f:	6a 00                	push   $0x0
 691:	b9 10 00 00 00       	mov    $0x10,%ecx
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	e8 b2 fe ff ff       	call   550 <printint>
        ap++;
 69e:	83 c7 04             	add    $0x4,%edi
 6a1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6a7:	be 00 00 00 00       	mov    $0x0,%esi
 6ac:	e9 56 ff ff ff       	jmp    607 <printf+0x2c>
        s = (char*)*ap;
 6b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b4:	8b 30                	mov    (%eax),%esi
        ap++;
 6b6:	83 c0 04             	add    $0x4,%eax
 6b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6bc:	85 f6                	test   %esi,%esi
 6be:	75 15                	jne    6d5 <printf+0xfa>
          s = "(null)";
 6c0:	be 1c 09 00 00       	mov    $0x91c,%esi
 6c5:	eb 0e                	jmp    6d5 <printf+0xfa>
          putc(fd, *s);
 6c7:	0f be d2             	movsbl %dl,%edx
 6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 6cd:	e8 64 fe ff ff       	call   536 <putc>
          s++;
 6d2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6d5:	0f b6 16             	movzbl (%esi),%edx
 6d8:	84 d2                	test   %dl,%dl
 6da:	75 eb                	jne    6c7 <printf+0xec>
      state = 0;
 6dc:	be 00 00 00 00       	mov    $0x0,%esi
 6e1:	e9 21 ff ff ff       	jmp    607 <printf+0x2c>
        putc(fd, *ap);
 6e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e9:	0f be 17             	movsbl (%edi),%edx
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	e8 42 fe ff ff       	call   536 <putc>
        ap++;
 6f4:	83 c7 04             	add    $0x4,%edi
 6f7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6fa:	be 00 00 00 00       	mov    $0x0,%esi
 6ff:	e9 03 ff ff ff       	jmp    607 <printf+0x2c>
        putc(fd, c);
 704:	89 fa                	mov    %edi,%edx
 706:	8b 45 08             	mov    0x8(%ebp),%eax
 709:	e8 28 fe ff ff       	call   536 <putc>
      state = 0;
 70e:	be 00 00 00 00       	mov    $0x0,%esi
 713:	e9 ef fe ff ff       	jmp    607 <printf+0x2c>
        putc(fd, '%');
 718:	ba 25 00 00 00       	mov    $0x25,%edx
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	e8 11 fe ff ff       	call   536 <putc>
        putc(fd, c);
 725:	89 fa                	mov    %edi,%edx
 727:	8b 45 08             	mov    0x8(%ebp),%eax
 72a:	e8 07 fe ff ff       	call   536 <putc>
      state = 0;
 72f:	be 00 00 00 00       	mov    $0x0,%esi
 734:	e9 ce fe ff ff       	jmp    607 <printf+0x2c>
    }
  }
}
 739:	8d 65 f4             	lea    -0xc(%ebp),%esp
 73c:	5b                   	pop    %ebx
 73d:	5e                   	pop    %esi
 73e:	5f                   	pop    %edi
 73f:	5d                   	pop    %ebp
 740:	c3                   	ret    

00000741 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 741:	55                   	push   %ebp
 742:	89 e5                	mov    %esp,%ebp
 744:	57                   	push   %edi
 745:	56                   	push   %esi
 746:	53                   	push   %ebx
 747:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 74a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74d:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 752:	eb 02                	jmp    756 <free+0x15>
 754:	89 d0                	mov    %edx,%eax
 756:	39 c8                	cmp    %ecx,%eax
 758:	73 04                	jae    75e <free+0x1d>
 75a:	39 08                	cmp    %ecx,(%eax)
 75c:	77 12                	ja     770 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 75e:	8b 10                	mov    (%eax),%edx
 760:	39 c2                	cmp    %eax,%edx
 762:	77 f0                	ja     754 <free+0x13>
 764:	39 c8                	cmp    %ecx,%eax
 766:	72 08                	jb     770 <free+0x2f>
 768:	39 ca                	cmp    %ecx,%edx
 76a:	77 04                	ja     770 <free+0x2f>
 76c:	89 d0                	mov    %edx,%eax
 76e:	eb e6                	jmp    756 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 770:	8b 73 fc             	mov    -0x4(%ebx),%esi
 773:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 776:	8b 10                	mov    (%eax),%edx
 778:	39 d7                	cmp    %edx,%edi
 77a:	74 19                	je     795 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 77c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 77f:	8b 50 04             	mov    0x4(%eax),%edx
 782:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 785:	39 ce                	cmp    %ecx,%esi
 787:	74 1b                	je     7a4 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 789:	89 08                	mov    %ecx,(%eax)
  freep = p;
 78b:	a3 f0 0c 00 00       	mov    %eax,0xcf0
}
 790:	5b                   	pop    %ebx
 791:	5e                   	pop    %esi
 792:	5f                   	pop    %edi
 793:	5d                   	pop    %ebp
 794:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 795:	03 72 04             	add    0x4(%edx),%esi
 798:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 79b:	8b 10                	mov    (%eax),%edx
 79d:	8b 12                	mov    (%edx),%edx
 79f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7a2:	eb db                	jmp    77f <free+0x3e>
    p->s.size += bp->s.size;
 7a4:	03 53 fc             	add    -0x4(%ebx),%edx
 7a7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7aa:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ad:	89 10                	mov    %edx,(%eax)
 7af:	eb da                	jmp    78b <free+0x4a>

000007b1 <morecore>:

static Header*
morecore(uint nu)
{
 7b1:	55                   	push   %ebp
 7b2:	89 e5                	mov    %esp,%ebp
 7b4:	53                   	push   %ebx
 7b5:	83 ec 04             	sub    $0x4,%esp
 7b8:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7ba:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7bf:	77 05                	ja     7c6 <morecore+0x15>
    nu = 4096;
 7c1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7c6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7cd:	83 ec 0c             	sub    $0xc,%esp
 7d0:	50                   	push   %eax
 7d1:	e8 38 fd ff ff       	call   50e <sbrk>
  if(p == (char*)-1)
 7d6:	83 c4 10             	add    $0x10,%esp
 7d9:	83 f8 ff             	cmp    $0xffffffff,%eax
 7dc:	74 1c                	je     7fa <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7de:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e1:	83 c0 08             	add    $0x8,%eax
 7e4:	83 ec 0c             	sub    $0xc,%esp
 7e7:	50                   	push   %eax
 7e8:	e8 54 ff ff ff       	call   741 <free>
  return freep;
 7ed:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 7f2:	83 c4 10             	add    $0x10,%esp
}
 7f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7f8:	c9                   	leave  
 7f9:	c3                   	ret    
    return 0;
 7fa:	b8 00 00 00 00       	mov    $0x0,%eax
 7ff:	eb f4                	jmp    7f5 <morecore+0x44>

00000801 <malloc>:

void*
malloc(uint nbytes)
{
 801:	55                   	push   %ebp
 802:	89 e5                	mov    %esp,%ebp
 804:	53                   	push   %ebx
 805:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 808:	8b 45 08             	mov    0x8(%ebp),%eax
 80b:	8d 58 07             	lea    0x7(%eax),%ebx
 80e:	c1 eb 03             	shr    $0x3,%ebx
 811:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 814:	8b 0d f0 0c 00 00    	mov    0xcf0,%ecx
 81a:	85 c9                	test   %ecx,%ecx
 81c:	74 04                	je     822 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81e:	8b 01                	mov    (%ecx),%eax
 820:	eb 4a                	jmp    86c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 822:	c7 05 f0 0c 00 00 f4 	movl   $0xcf4,0xcf0
 829:	0c 00 00 
 82c:	c7 05 f4 0c 00 00 f4 	movl   $0xcf4,0xcf4
 833:	0c 00 00 
    base.s.size = 0;
 836:	c7 05 f8 0c 00 00 00 	movl   $0x0,0xcf8
 83d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 840:	b9 f4 0c 00 00       	mov    $0xcf4,%ecx
 845:	eb d7                	jmp    81e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 847:	74 19                	je     862 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 849:	29 da                	sub    %ebx,%edx
 84b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 84e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 851:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 854:	89 0d f0 0c 00 00    	mov    %ecx,0xcf0
      return (void*)(p + 1);
 85a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 85d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 860:	c9                   	leave  
 861:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 862:	8b 10                	mov    (%eax),%edx
 864:	89 11                	mov    %edx,(%ecx)
 866:	eb ec                	jmp    854 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 868:	89 c1                	mov    %eax,%ecx
 86a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 86c:	8b 50 04             	mov    0x4(%eax),%edx
 86f:	39 da                	cmp    %ebx,%edx
 871:	73 d4                	jae    847 <malloc+0x46>
    if(p == freep)
 873:	39 05 f0 0c 00 00    	cmp    %eax,0xcf0
 879:	75 ed                	jne    868 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 87b:	89 d8                	mov    %ebx,%eax
 87d:	e8 2f ff ff ff       	call   7b1 <morecore>
 882:	85 c0                	test   %eax,%eax
 884:	75 e2                	jne    868 <malloc+0x67>
 886:	eb d5                	jmp    85d <malloc+0x5c>
