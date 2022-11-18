
_test_10:     file format elf32-i386


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
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 23             	cmpl   $0x23,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 f0 0c 00 00       	mov    0xcf0,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 2f                	push   $0x2f
  2c:	68 8c 08 00 00       	push   $0x88c
  31:	68 96 08 00 00       	push   $0x896
  36:	6a 01                	push   $0x1
  38:	e8 a2 05 00 00       	call   5df <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 dd 08 00 00       	push   $0x8dd
  45:	68 ad 08 00 00       	push   $0x8ad
  4a:	6a 01                	push   $0x1
  4c:	e8 8e 05 00 00       	call   5df <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 c1 08 00 00       	push   $0x8c1
  59:	6a 01                	push   $0x1
  5b:	e8 7f 05 00 00       	call   5df <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 f4 0c 00 00    	push   0xcf4
  69:	e8 4c 04 00 00       	call   4ba <kill>
  6e:	e8 17 04 00 00       	call   48a <exit>
   assert(arg1_int == 35);
  73:	6a 2d                	push   $0x2d
  75:	68 8c 08 00 00       	push   $0x88c
  7a:	68 96 08 00 00       	push   $0x896
  7f:	6a 01                	push   $0x1
  81:	e8 59 05 00 00       	call   5df <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 9e 08 00 00       	push   $0x89e
  8e:	68 ad 08 00 00       	push   $0x8ad
  93:	6a 01                	push   $0x1
  95:	e8 45 05 00 00       	call   5df <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 c1 08 00 00       	push   $0x8c1
  a2:	6a 01                	push   $0x1
  a4:	e8 36 05 00 00       	call   5df <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 f4 0c 00 00    	push   0xcf4
  b2:	e8 03 04 00 00       	call   4ba <kill>
  b7:	e8 ce 03 00 00       	call   48a <exit>
   assert(arg2_int == 42);
  bc:	6a 2e                	push   $0x2e
  be:	68 8c 08 00 00       	push   $0x88c
  c3:	68 96 08 00 00       	push   $0x896
  c8:	6a 01                	push   $0x1
  ca:	e8 10 05 00 00       	call   5df <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 ce 08 00 00       	push   $0x8ce
  d7:	68 ad 08 00 00       	push   $0x8ad
  dc:	6a 01                	push   $0x1
  de:	e8 fc 04 00 00       	call   5df <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 c1 08 00 00       	push   $0x8c1
  eb:	6a 01                	push   $0x1
  ed:	e8 ed 04 00 00       	call   5df <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 f4 0c 00 00    	push   0xcf4
  fb:	e8 ba 03 00 00       	call   4ba <kill>
 100:	e8 85 03 00 00       	call   48a <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 f0 0c 00 00       	mov    %eax,0xcf0
   exit();
 10d:	e8 78 03 00 00       	call   48a <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	53                   	push   %ebx
 120:	51                   	push   %ecx
 121:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 124:	e8 e1 03 00 00       	call   50a <getpid>
 129:	a3 f4 0c 00 00       	mov    %eax,0xcf4
   int arg1 = 35;
 12e:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 135:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	8d 45 f0             	lea    -0x10(%ebp),%eax
 142:	50                   	push   %eax
 143:	8d 45 f4             	lea    -0xc(%ebp),%eax
 146:	50                   	push   %eax
 147:	68 00 00 00 00       	push   $0x0
 14c:	e8 a9 02 00 00       	call   3fa <thread_create>
   assert(thread_pid > 0);
 151:	83 c4 10             	add    $0x10,%esp
 154:	85 c0                	test   %eax,%eax
 156:	7e 65                	jle    1bd <main+0xab>
 158:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 15a:	e8 bc 02 00 00       	call   41b <thread_join>
   assert(join_pid == thread_pid);
 15f:	39 c3                	cmp    %eax,%ebx
 161:	0f 85 9f 00 00 00    	jne    206 <main+0xf4>
   assert(global == 2);
 167:	83 3d f0 0c 00 00 02 	cmpl   $0x2,0xcf0
 16e:	0f 84 db 00 00 00    	je     24f <main+0x13d>
 174:	6a 23                	push   $0x23
 176:	68 8c 08 00 00       	push   $0x88c
 17b:	68 96 08 00 00       	push   $0x896
 180:	6a 01                	push   $0x1
 182:	e8 58 04 00 00       	call   5df <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 0f 09 00 00       	push   $0x90f
 18f:	68 ad 08 00 00       	push   $0x8ad
 194:	6a 01                	push   $0x1
 196:	e8 44 04 00 00       	call   5df <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 c1 08 00 00       	push   $0x8c1
 1a3:	6a 01                	push   $0x1
 1a5:	e8 35 04 00 00       	call   5df <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 f4 0c 00 00    	push   0xcf4
 1b3:	e8 02 03 00 00       	call   4ba <kill>
 1b8:	e8 cd 02 00 00       	call   48a <exit>
   assert(thread_pid > 0);
 1bd:	6a 1f                	push   $0x1f
 1bf:	68 8c 08 00 00       	push   $0x88c
 1c4:	68 96 08 00 00       	push   $0x896
 1c9:	6a 01                	push   $0x1
 1cb:	e8 0f 04 00 00       	call   5df <printf>
 1d0:	83 c4 0c             	add    $0xc,%esp
 1d3:	68 e9 08 00 00       	push   $0x8e9
 1d8:	68 ad 08 00 00       	push   $0x8ad
 1dd:	6a 01                	push   $0x1
 1df:	e8 fb 03 00 00       	call   5df <printf>
 1e4:	83 c4 08             	add    $0x8,%esp
 1e7:	68 c1 08 00 00       	push   $0x8c1
 1ec:	6a 01                	push   $0x1
 1ee:	e8 ec 03 00 00       	call   5df <printf>
 1f3:	83 c4 04             	add    $0x4,%esp
 1f6:	ff 35 f4 0c 00 00    	push   0xcf4
 1fc:	e8 b9 02 00 00       	call   4ba <kill>
 201:	e8 84 02 00 00       	call   48a <exit>
   assert(join_pid == thread_pid);
 206:	6a 22                	push   $0x22
 208:	68 8c 08 00 00       	push   $0x88c
 20d:	68 96 08 00 00       	push   $0x896
 212:	6a 01                	push   $0x1
 214:	e8 c6 03 00 00       	call   5df <printf>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	68 f8 08 00 00       	push   $0x8f8
 221:	68 ad 08 00 00       	push   $0x8ad
 226:	6a 01                	push   $0x1
 228:	e8 b2 03 00 00       	call   5df <printf>
 22d:	83 c4 08             	add    $0x8,%esp
 230:	68 c1 08 00 00       	push   $0x8c1
 235:	6a 01                	push   $0x1
 237:	e8 a3 03 00 00       	call   5df <printf>
 23c:	83 c4 04             	add    $0x4,%esp
 23f:	ff 35 f4 0c 00 00    	push   0xcf4
 245:	e8 70 02 00 00       	call   4ba <kill>
 24a:	e8 3b 02 00 00       	call   48a <exit>
   printf(1, "TEST PASSED\n");
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	68 1b 09 00 00       	push   $0x91b
 257:	6a 01                	push   $0x1
 259:	e8 81 03 00 00       	call   5df <printf>
   exit();
 25e:	e8 27 02 00 00       	call   48a <exit>

00000263 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 26e:	89 f0                	mov    %esi,%eax
 270:	89 d1                	mov    %edx,%ecx
 272:	83 c2 01             	add    $0x1,%edx
 275:	89 c3                	mov    %eax,%ebx
 277:	83 c0 01             	add    $0x1,%eax
 27a:	0f b6 09             	movzbl (%ecx),%ecx
 27d:	88 0b                	mov    %cl,(%ebx)
 27f:	84 c9                	test   %cl,%cl
 281:	75 ed                	jne    270 <strcpy+0xd>
    ;
  return os;
}
 283:	89 f0                	mov    %esi,%eax
 285:	5b                   	pop    %ebx
 286:	5e                   	pop    %esi
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    

00000289 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 292:	eb 06                	jmp    29a <strcmp+0x11>
    p++, q++;
 294:	83 c1 01             	add    $0x1,%ecx
 297:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 29a:	0f b6 01             	movzbl (%ecx),%eax
 29d:	84 c0                	test   %al,%al
 29f:	74 04                	je     2a5 <strcmp+0x1c>
 2a1:	3a 02                	cmp    (%edx),%al
 2a3:	74 ef                	je     294 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2a5:	0f b6 c0             	movzbl %al,%eax
 2a8:	0f b6 12             	movzbl (%edx),%edx
 2ab:	29 d0                	sub    %edx,%eax
}
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    

000002af <strlen>:

uint
strlen(const char *s)
{
 2af:	55                   	push   %ebp
 2b0:	89 e5                	mov    %esp,%ebp
 2b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2b5:	b8 00 00 00 00       	mov    $0x0,%eax
 2ba:	eb 03                	jmp    2bf <strlen+0x10>
 2bc:	83 c0 01             	add    $0x1,%eax
 2bf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2c3:	75 f7                	jne    2bc <strlen+0xd>
    ;
  return n;
}
 2c5:	5d                   	pop    %ebp
 2c6:	c3                   	ret    

000002c7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	57                   	push   %edi
 2cb:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ce:	89 d7                	mov    %edx,%edi
 2d0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d6:	fc                   	cld    
 2d7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d9:	89 d0                	mov    %edx,%eax
 2db:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2de:	c9                   	leave  
 2df:	c3                   	ret    

000002e0 <strchr>:

char*
strchr(const char *s, char c)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ea:	eb 03                	jmp    2ef <strchr+0xf>
 2ec:	83 c0 01             	add    $0x1,%eax
 2ef:	0f b6 10             	movzbl (%eax),%edx
 2f2:	84 d2                	test   %dl,%dl
 2f4:	74 06                	je     2fc <strchr+0x1c>
    if(*s == c)
 2f6:	38 ca                	cmp    %cl,%dl
 2f8:	75 f2                	jne    2ec <strchr+0xc>
 2fa:	eb 05                	jmp    301 <strchr+0x21>
      return (char*)s;
  return 0;
 2fc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    

00000303 <gets>:

char*
gets(char *buf, int max)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	57                   	push   %edi
 307:	56                   	push   %esi
 308:	53                   	push   %ebx
 309:	83 ec 1c             	sub    $0x1c,%esp
 30c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 30f:	bb 00 00 00 00       	mov    $0x0,%ebx
 314:	89 de                	mov    %ebx,%esi
 316:	83 c3 01             	add    $0x1,%ebx
 319:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31c:	7d 2e                	jge    34c <gets+0x49>
    cc = read(0, &c, 1);
 31e:	83 ec 04             	sub    $0x4,%esp
 321:	6a 01                	push   $0x1
 323:	8d 45 e7             	lea    -0x19(%ebp),%eax
 326:	50                   	push   %eax
 327:	6a 00                	push   $0x0
 329:	e8 74 01 00 00       	call   4a2 <read>
    if(cc < 1)
 32e:	83 c4 10             	add    $0x10,%esp
 331:	85 c0                	test   %eax,%eax
 333:	7e 17                	jle    34c <gets+0x49>
      break;
    buf[i++] = c;
 335:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 339:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 33c:	3c 0a                	cmp    $0xa,%al
 33e:	0f 94 c2             	sete   %dl
 341:	3c 0d                	cmp    $0xd,%al
 343:	0f 94 c0             	sete   %al
 346:	08 c2                	or     %al,%dl
 348:	74 ca                	je     314 <gets+0x11>
    buf[i++] = c;
 34a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 34c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 350:	89 f8                	mov    %edi,%eax
 352:	8d 65 f4             	lea    -0xc(%ebp),%esp
 355:	5b                   	pop    %ebx
 356:	5e                   	pop    %esi
 357:	5f                   	pop    %edi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <stat>:

int
stat(const char *n, struct stat *st)
{
 35a:	55                   	push   %ebp
 35b:	89 e5                	mov    %esp,%ebp
 35d:	56                   	push   %esi
 35e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 35f:	83 ec 08             	sub    $0x8,%esp
 362:	6a 00                	push   $0x0
 364:	ff 75 08             	push   0x8(%ebp)
 367:	e8 5e 01 00 00       	call   4ca <open>
  if(fd < 0)
 36c:	83 c4 10             	add    $0x10,%esp
 36f:	85 c0                	test   %eax,%eax
 371:	78 24                	js     397 <stat+0x3d>
 373:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	ff 75 0c             	push   0xc(%ebp)
 37b:	50                   	push   %eax
 37c:	e8 61 01 00 00       	call   4e2 <fstat>
 381:	89 c6                	mov    %eax,%esi
  close(fd);
 383:	89 1c 24             	mov    %ebx,(%esp)
 386:	e8 27 01 00 00       	call   4b2 <close>
  return r;
 38b:	83 c4 10             	add    $0x10,%esp
}
 38e:	89 f0                	mov    %esi,%eax
 390:	8d 65 f8             	lea    -0x8(%ebp),%esp
 393:	5b                   	pop    %ebx
 394:	5e                   	pop    %esi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    
    return -1;
 397:	be ff ff ff ff       	mov    $0xffffffff,%esi
 39c:	eb f0                	jmp    38e <stat+0x34>

0000039e <atoi>:

int
atoi(const char *s)
{
 39e:	55                   	push   %ebp
 39f:	89 e5                	mov    %esp,%ebp
 3a1:	53                   	push   %ebx
 3a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3a5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3aa:	eb 10                	jmp    3bc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3ac:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3af:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3b2:	83 c1 01             	add    $0x1,%ecx
 3b5:	0f be c0             	movsbl %al,%eax
 3b8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3bc:	0f b6 01             	movzbl (%ecx),%eax
 3bf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c2:	80 fb 09             	cmp    $0x9,%bl
 3c5:	76 e5                	jbe    3ac <atoi+0xe>
  return n;
}
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cc:	c9                   	leave  
 3cd:	c3                   	ret    

000003ce <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	56                   	push   %esi
 3d2:	53                   	push   %ebx
 3d3:	8b 75 08             	mov    0x8(%ebp),%esi
 3d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3dc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3de:	eb 0d                	jmp    3ed <memmove+0x1f>
    *dst++ = *src++;
 3e0:	0f b6 01             	movzbl (%ecx),%eax
 3e3:	88 02                	mov    %al,(%edx)
 3e5:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3eb:	89 d8                	mov    %ebx,%eax
 3ed:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3f0:	85 c0                	test   %eax,%eax
 3f2:	7f ec                	jg     3e0 <memmove+0x12>
  return vdst;
}
 3f4:	89 f0                	mov    %esi,%eax
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5d                   	pop    %ebp
 3f9:	c3                   	ret    

000003fa <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 400:	68 00 10 00 00       	push   $0x1000
 405:	e8 fb 03 00 00       	call   805 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 40a:	50                   	push   %eax
 40b:	ff 75 10             	push   0x10(%ebp)
 40e:	ff 75 0c             	push   0xc(%ebp)
 411:	ff 75 08             	push   0x8(%ebp)
 414:	e8 11 01 00 00       	call   52a <clone>
}
 419:	c9                   	leave  
 41a:	c3                   	ret    

0000041b <thread_join>:

int thread_join(){
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	53                   	push   %ebx
 41f:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 422:	8d 45 f4             	lea    -0xc(%ebp),%eax
 425:	50                   	push   %eax
 426:	e8 07 01 00 00       	call   532 <join>
  if (x < 0) {
 42b:	83 c4 10             	add    $0x10,%esp
 42e:	85 c0                	test   %eax,%eax
 430:	78 17                	js     449 <thread_join+0x2e>
 432:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 434:	83 ec 0c             	sub    $0xc,%esp
 437:	ff 75 f4             	push   -0xc(%ebp)
 43a:	e8 06 03 00 00       	call   745 <free>
  return x;
 43f:	83 c4 10             	add    $0x10,%esp
}
 442:	89 d8                	mov    %ebx,%eax
 444:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 447:	c9                   	leave  
 448:	c3                   	ret    
    return -1;
 449:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 44e:	eb f2                	jmp    442 <thread_join+0x27>

00000450 <lock_init>:

void lock_init(lock_t *spin){
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 45c:	5d                   	pop    %ebp
 45d:	c3                   	ret    

0000045e <lock_acquire>:

void lock_acquire(lock_t *spin){
 45e:	55                   	push   %ebp
 45f:	89 e5                	mov    %esp,%ebp
 461:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 464:	b8 01 00 00 00       	mov    $0x1,%eax
 469:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 46c:	85 c0                	test   %eax,%eax
 46e:	75 f4                	jne    464 <lock_acquire+0x6>

}
 470:	5d                   	pop    %ebp
 471:	c3                   	ret    

00000472 <lock_release>:

void lock_release(lock_t *spin){
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	8b 55 08             	mov    0x8(%ebp),%edx
 478:	b8 00 00 00 00       	mov    $0x0,%eax
 47d:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 480:	5d                   	pop    %ebp
 481:	c3                   	ret    

00000482 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 482:	b8 01 00 00 00       	mov    $0x1,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <exit>:
SYSCALL(exit)
 48a:	b8 02 00 00 00       	mov    $0x2,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <wait>:
SYSCALL(wait)
 492:	b8 03 00 00 00       	mov    $0x3,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <pipe>:
SYSCALL(pipe)
 49a:	b8 04 00 00 00       	mov    $0x4,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <read>:
SYSCALL(read)
 4a2:	b8 05 00 00 00       	mov    $0x5,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <write>:
SYSCALL(write)
 4aa:	b8 10 00 00 00       	mov    $0x10,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <close>:
SYSCALL(close)
 4b2:	b8 15 00 00 00       	mov    $0x15,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <kill>:
SYSCALL(kill)
 4ba:	b8 06 00 00 00       	mov    $0x6,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <exec>:
SYSCALL(exec)
 4c2:	b8 07 00 00 00       	mov    $0x7,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <open>:
SYSCALL(open)
 4ca:	b8 0f 00 00 00       	mov    $0xf,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <mknod>:
SYSCALL(mknod)
 4d2:	b8 11 00 00 00       	mov    $0x11,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <unlink>:
SYSCALL(unlink)
 4da:	b8 12 00 00 00       	mov    $0x12,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <fstat>:
SYSCALL(fstat)
 4e2:	b8 08 00 00 00       	mov    $0x8,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <link>:
SYSCALL(link)
 4ea:	b8 13 00 00 00       	mov    $0x13,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <mkdir>:
SYSCALL(mkdir)
 4f2:	b8 14 00 00 00       	mov    $0x14,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <chdir>:
SYSCALL(chdir)
 4fa:	b8 09 00 00 00       	mov    $0x9,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <dup>:
SYSCALL(dup)
 502:	b8 0a 00 00 00       	mov    $0xa,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <getpid>:
SYSCALL(getpid)
 50a:	b8 0b 00 00 00       	mov    $0xb,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <sbrk>:
SYSCALL(sbrk)
 512:	b8 0c 00 00 00       	mov    $0xc,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <sleep>:
SYSCALL(sleep)
 51a:	b8 0d 00 00 00       	mov    $0xd,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <uptime>:
SYSCALL(uptime)
 522:	b8 0e 00 00 00       	mov    $0xe,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <clone>:
SYSCALL(clone)
 52a:	b8 16 00 00 00       	mov    $0x16,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <join>:
 532:	b8 17 00 00 00       	mov    $0x17,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 53a:	55                   	push   %ebp
 53b:	89 e5                	mov    %esp,%ebp
 53d:	83 ec 1c             	sub    $0x1c,%esp
 540:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 543:	6a 01                	push   $0x1
 545:	8d 55 f4             	lea    -0xc(%ebp),%edx
 548:	52                   	push   %edx
 549:	50                   	push   %eax
 54a:	e8 5b ff ff ff       	call   4aa <write>
}
 54f:	83 c4 10             	add    $0x10,%esp
 552:	c9                   	leave  
 553:	c3                   	ret    

00000554 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	57                   	push   %edi
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	83 ec 2c             	sub    $0x2c,%esp
 55d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 560:	89 d0                	mov    %edx,%eax
 562:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 564:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 568:	0f 95 c1             	setne  %cl
 56b:	c1 ea 1f             	shr    $0x1f,%edx
 56e:	84 d1                	test   %dl,%cl
 570:	74 44                	je     5b6 <printint+0x62>
    neg = 1;
    x = -xx;
 572:	f7 d8                	neg    %eax
 574:	89 c1                	mov    %eax,%ecx
    neg = 1;
 576:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 57d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 582:	89 c8                	mov    %ecx,%eax
 584:	ba 00 00 00 00       	mov    $0x0,%edx
 589:	f7 f6                	div    %esi
 58b:	89 df                	mov    %ebx,%edi
 58d:	83 c3 01             	add    $0x1,%ebx
 590:	0f b6 92 88 09 00 00 	movzbl 0x988(%edx),%edx
 597:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 59b:	89 ca                	mov    %ecx,%edx
 59d:	89 c1                	mov    %eax,%ecx
 59f:	39 d6                	cmp    %edx,%esi
 5a1:	76 df                	jbe    582 <printint+0x2e>
  if(neg)
 5a3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5a7:	74 31                	je     5da <printint+0x86>
    buf[i++] = '-';
 5a9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5ae:	8d 5f 02             	lea    0x2(%edi),%ebx
 5b1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b4:	eb 17                	jmp    5cd <printint+0x79>
    x = xx;
 5b6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5b8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5bf:	eb bc                	jmp    57d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5c1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5c6:	89 f0                	mov    %esi,%eax
 5c8:	e8 6d ff ff ff       	call   53a <putc>
  while(--i >= 0)
 5cd:	83 eb 01             	sub    $0x1,%ebx
 5d0:	79 ef                	jns    5c1 <printint+0x6d>
}
 5d2:	83 c4 2c             	add    $0x2c,%esp
 5d5:	5b                   	pop    %ebx
 5d6:	5e                   	pop    %esi
 5d7:	5f                   	pop    %edi
 5d8:	5d                   	pop    %ebp
 5d9:	c3                   	ret    
 5da:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5dd:	eb ee                	jmp    5cd <printint+0x79>

000005df <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5df:	55                   	push   %ebp
 5e0:	89 e5                	mov    %esp,%ebp
 5e2:	57                   	push   %edi
 5e3:	56                   	push   %esi
 5e4:	53                   	push   %ebx
 5e5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5e8:	8d 45 10             	lea    0x10(%ebp),%eax
 5eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5ee:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5f3:	bb 00 00 00 00       	mov    $0x0,%ebx
 5f8:	eb 14                	jmp    60e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5fa:	89 fa                	mov    %edi,%edx
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	e8 36 ff ff ff       	call   53a <putc>
 604:	eb 05                	jmp    60b <printf+0x2c>
      }
    } else if(state == '%'){
 606:	83 fe 25             	cmp    $0x25,%esi
 609:	74 25                	je     630 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 60b:	83 c3 01             	add    $0x1,%ebx
 60e:	8b 45 0c             	mov    0xc(%ebp),%eax
 611:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 615:	84 c0                	test   %al,%al
 617:	0f 84 20 01 00 00    	je     73d <printf+0x15e>
    c = fmt[i] & 0xff;
 61d:	0f be f8             	movsbl %al,%edi
 620:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 623:	85 f6                	test   %esi,%esi
 625:	75 df                	jne    606 <printf+0x27>
      if(c == '%'){
 627:	83 f8 25             	cmp    $0x25,%eax
 62a:	75 ce                	jne    5fa <printf+0x1b>
        state = '%';
 62c:	89 c6                	mov    %eax,%esi
 62e:	eb db                	jmp    60b <printf+0x2c>
      if(c == 'd'){
 630:	83 f8 25             	cmp    $0x25,%eax
 633:	0f 84 cf 00 00 00    	je     708 <printf+0x129>
 639:	0f 8c dd 00 00 00    	jl     71c <printf+0x13d>
 63f:	83 f8 78             	cmp    $0x78,%eax
 642:	0f 8f d4 00 00 00    	jg     71c <printf+0x13d>
 648:	83 f8 63             	cmp    $0x63,%eax
 64b:	0f 8c cb 00 00 00    	jl     71c <printf+0x13d>
 651:	83 e8 63             	sub    $0x63,%eax
 654:	83 f8 15             	cmp    $0x15,%eax
 657:	0f 87 bf 00 00 00    	ja     71c <printf+0x13d>
 65d:	ff 24 85 30 09 00 00 	jmp    *0x930(,%eax,4)
        printint(fd, *ap, 10, 1);
 664:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 667:	8b 17                	mov    (%edi),%edx
 669:	83 ec 0c             	sub    $0xc,%esp
 66c:	6a 01                	push   $0x1
 66e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 673:	8b 45 08             	mov    0x8(%ebp),%eax
 676:	e8 d9 fe ff ff       	call   554 <printint>
        ap++;
 67b:	83 c7 04             	add    $0x4,%edi
 67e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 681:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 684:	be 00 00 00 00       	mov    $0x0,%esi
 689:	eb 80                	jmp    60b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 68b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 68e:	8b 17                	mov    (%edi),%edx
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	6a 00                	push   $0x0
 695:	b9 10 00 00 00       	mov    $0x10,%ecx
 69a:	8b 45 08             	mov    0x8(%ebp),%eax
 69d:	e8 b2 fe ff ff       	call   554 <printint>
        ap++;
 6a2:	83 c7 04             	add    $0x4,%edi
 6a5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ab:	be 00 00 00 00       	mov    $0x0,%esi
 6b0:	e9 56 ff ff ff       	jmp    60b <printf+0x2c>
        s = (char*)*ap;
 6b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b8:	8b 30                	mov    (%eax),%esi
        ap++;
 6ba:	83 c0 04             	add    $0x4,%eax
 6bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6c0:	85 f6                	test   %esi,%esi
 6c2:	75 15                	jne    6d9 <printf+0xfa>
          s = "(null)";
 6c4:	be 28 09 00 00       	mov    $0x928,%esi
 6c9:	eb 0e                	jmp    6d9 <printf+0xfa>
          putc(fd, *s);
 6cb:	0f be d2             	movsbl %dl,%edx
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	e8 64 fe ff ff       	call   53a <putc>
          s++;
 6d6:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6d9:	0f b6 16             	movzbl (%esi),%edx
 6dc:	84 d2                	test   %dl,%dl
 6de:	75 eb                	jne    6cb <printf+0xec>
      state = 0;
 6e0:	be 00 00 00 00       	mov    $0x0,%esi
 6e5:	e9 21 ff ff ff       	jmp    60b <printf+0x2c>
        putc(fd, *ap);
 6ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ed:	0f be 17             	movsbl (%edi),%edx
 6f0:	8b 45 08             	mov    0x8(%ebp),%eax
 6f3:	e8 42 fe ff ff       	call   53a <putc>
        ap++;
 6f8:	83 c7 04             	add    $0x4,%edi
 6fb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6fe:	be 00 00 00 00       	mov    $0x0,%esi
 703:	e9 03 ff ff ff       	jmp    60b <printf+0x2c>
        putc(fd, c);
 708:	89 fa                	mov    %edi,%edx
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	e8 28 fe ff ff       	call   53a <putc>
      state = 0;
 712:	be 00 00 00 00       	mov    $0x0,%esi
 717:	e9 ef fe ff ff       	jmp    60b <printf+0x2c>
        putc(fd, '%');
 71c:	ba 25 00 00 00       	mov    $0x25,%edx
 721:	8b 45 08             	mov    0x8(%ebp),%eax
 724:	e8 11 fe ff ff       	call   53a <putc>
        putc(fd, c);
 729:	89 fa                	mov    %edi,%edx
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	e8 07 fe ff ff       	call   53a <putc>
      state = 0;
 733:	be 00 00 00 00       	mov    $0x0,%esi
 738:	e9 ce fe ff ff       	jmp    60b <printf+0x2c>
    }
  }
}
 73d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 740:	5b                   	pop    %ebx
 741:	5e                   	pop    %esi
 742:	5f                   	pop    %edi
 743:	5d                   	pop    %ebp
 744:	c3                   	ret    

00000745 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 745:	55                   	push   %ebp
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 74e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	a1 f8 0c 00 00       	mov    0xcf8,%eax
 756:	eb 02                	jmp    75a <free+0x15>
 758:	89 d0                	mov    %edx,%eax
 75a:	39 c8                	cmp    %ecx,%eax
 75c:	73 04                	jae    762 <free+0x1d>
 75e:	39 08                	cmp    %ecx,(%eax)
 760:	77 12                	ja     774 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 762:	8b 10                	mov    (%eax),%edx
 764:	39 c2                	cmp    %eax,%edx
 766:	77 f0                	ja     758 <free+0x13>
 768:	39 c8                	cmp    %ecx,%eax
 76a:	72 08                	jb     774 <free+0x2f>
 76c:	39 ca                	cmp    %ecx,%edx
 76e:	77 04                	ja     774 <free+0x2f>
 770:	89 d0                	mov    %edx,%eax
 772:	eb e6                	jmp    75a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 774:	8b 73 fc             	mov    -0x4(%ebx),%esi
 777:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77a:	8b 10                	mov    (%eax),%edx
 77c:	39 d7                	cmp    %edx,%edi
 77e:	74 19                	je     799 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 780:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 783:	8b 50 04             	mov    0x4(%eax),%edx
 786:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 789:	39 ce                	cmp    %ecx,%esi
 78b:	74 1b                	je     7a8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 78d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 78f:	a3 f8 0c 00 00       	mov    %eax,0xcf8
}
 794:	5b                   	pop    %ebx
 795:	5e                   	pop    %esi
 796:	5f                   	pop    %edi
 797:	5d                   	pop    %ebp
 798:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 799:	03 72 04             	add    0x4(%edx),%esi
 79c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 79f:	8b 10                	mov    (%eax),%edx
 7a1:	8b 12                	mov    (%edx),%edx
 7a3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7a6:	eb db                	jmp    783 <free+0x3e>
    p->s.size += bp->s.size;
 7a8:	03 53 fc             	add    -0x4(%ebx),%edx
 7ab:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ae:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7b1:	89 10                	mov    %edx,(%eax)
 7b3:	eb da                	jmp    78f <free+0x4a>

000007b5 <morecore>:

static Header*
morecore(uint nu)
{
 7b5:	55                   	push   %ebp
 7b6:	89 e5                	mov    %esp,%ebp
 7b8:	53                   	push   %ebx
 7b9:	83 ec 04             	sub    $0x4,%esp
 7bc:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7be:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7c3:	77 05                	ja     7ca <morecore+0x15>
    nu = 4096;
 7c5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7ca:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7d1:	83 ec 0c             	sub    $0xc,%esp
 7d4:	50                   	push   %eax
 7d5:	e8 38 fd ff ff       	call   512 <sbrk>
  if(p == (char*)-1)
 7da:	83 c4 10             	add    $0x10,%esp
 7dd:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e0:	74 1c                	je     7fe <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7e2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e5:	83 c0 08             	add    $0x8,%eax
 7e8:	83 ec 0c             	sub    $0xc,%esp
 7eb:	50                   	push   %eax
 7ec:	e8 54 ff ff ff       	call   745 <free>
  return freep;
 7f1:	a1 f8 0c 00 00       	mov    0xcf8,%eax
 7f6:	83 c4 10             	add    $0x10,%esp
}
 7f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7fc:	c9                   	leave  
 7fd:	c3                   	ret    
    return 0;
 7fe:	b8 00 00 00 00       	mov    $0x0,%eax
 803:	eb f4                	jmp    7f9 <morecore+0x44>

00000805 <malloc>:

void*
malloc(uint nbytes)
{
 805:	55                   	push   %ebp
 806:	89 e5                	mov    %esp,%ebp
 808:	53                   	push   %ebx
 809:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80c:	8b 45 08             	mov    0x8(%ebp),%eax
 80f:	8d 58 07             	lea    0x7(%eax),%ebx
 812:	c1 eb 03             	shr    $0x3,%ebx
 815:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 818:	8b 0d f8 0c 00 00    	mov    0xcf8,%ecx
 81e:	85 c9                	test   %ecx,%ecx
 820:	74 04                	je     826 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 822:	8b 01                	mov    (%ecx),%eax
 824:	eb 4a                	jmp    870 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 826:	c7 05 f8 0c 00 00 fc 	movl   $0xcfc,0xcf8
 82d:	0c 00 00 
 830:	c7 05 fc 0c 00 00 fc 	movl   $0xcfc,0xcfc
 837:	0c 00 00 
    base.s.size = 0;
 83a:	c7 05 00 0d 00 00 00 	movl   $0x0,0xd00
 841:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 844:	b9 fc 0c 00 00       	mov    $0xcfc,%ecx
 849:	eb d7                	jmp    822 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 84b:	74 19                	je     866 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 84d:	29 da                	sub    %ebx,%edx
 84f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 852:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 855:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 858:	89 0d f8 0c 00 00    	mov    %ecx,0xcf8
      return (void*)(p + 1);
 85e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 861:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 864:	c9                   	leave  
 865:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 866:	8b 10                	mov    (%eax),%edx
 868:	89 11                	mov    %edx,(%ecx)
 86a:	eb ec                	jmp    858 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86c:	89 c1                	mov    %eax,%ecx
 86e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 870:	8b 50 04             	mov    0x4(%eax),%edx
 873:	39 da                	cmp    %ebx,%edx
 875:	73 d4                	jae    84b <malloc+0x46>
    if(p == freep)
 877:	39 05 f8 0c 00 00    	cmp    %eax,0xcf8
 87d:	75 ed                	jne    86c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 87f:	89 d8                	mov    %ebx,%eax
 881:	e8 2f ff ff ff       	call   7b5 <morecore>
 886:	85 c0                	test   %eax,%eax
 888:	75 e2                	jne    86c <malloc+0x67>
 88a:	eb d5                	jmp    861 <malloc+0x5c>
