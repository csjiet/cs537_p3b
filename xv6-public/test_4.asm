
_test_4:     file format elf32-i386


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
   exit();
   6:	e8 82 04 00 00       	call   48d <exit>

0000000b <main>:
{
   b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   f:	83 e4 f0             	and    $0xfffffff0,%esp
  12:	ff 71 fc             	push   -0x4(%ecx)
  15:	55                   	push   %ebp
  16:	89 e5                	mov    %esp,%ebp
  18:	56                   	push   %esi
  19:	53                   	push   %ebx
  1a:	51                   	push   %ecx
  1b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  1e:	e8 ea 04 00 00       	call   50d <getpid>
  23:	a3 08 0d 00 00       	mov    %eax,0xd08
   void *stack, *p = malloc(PGSIZE * 2);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	68 00 20 00 00       	push   $0x2000
  30:	e8 d3 07 00 00       	call   808 <malloc>
   assert(p != NULL);
  35:	83 c4 10             	add    $0x10,%esp
  38:	85 c0                	test   %eax,%eax
  3a:	74 70                	je     ac <main+0xa1>
  3c:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE == 0)
  3e:	a9 ff 0f 00 00       	test   $0xfff,%eax
  43:	75 03                	jne    48 <main+0x3d>
     stack = p + 4;
  45:	8d 40 04             	lea    0x4(%eax),%eax
   assert(clone(worker, 0, 0, stack) == -1);
  48:	50                   	push   %eax
  49:	6a 00                	push   $0x0
  4b:	6a 00                	push   $0x0
  4d:	68 00 00 00 00       	push   $0x0
  52:	e8 d6 04 00 00       	call   52d <clone>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	83 f8 ff             	cmp    $0xffffffff,%eax
  5d:	0f 84 92 00 00 00    	je     f5 <main+0xea>
  63:	6a 21                	push   $0x21
  65:	68 90 08 00 00       	push   $0x890
  6a:	68 99 08 00 00       	push   $0x899
  6f:	6a 01                	push   $0x1
  71:	e8 6c 05 00 00       	call   5e2 <printf>
  76:	83 c4 0c             	add    $0xc,%esp
  79:	68 f4 08 00 00       	push   $0x8f4
  7e:	68 ab 08 00 00       	push   $0x8ab
  83:	6a 01                	push   $0x1
  85:	e8 58 05 00 00       	call   5e2 <printf>
  8a:	83 c4 08             	add    $0x8,%esp
  8d:	68 bf 08 00 00       	push   $0x8bf
  92:	6a 01                	push   $0x1
  94:	e8 49 05 00 00       	call   5e2 <printf>
  99:	83 c4 04             	add    $0x4,%esp
  9c:	ff 35 08 0d 00 00    	push   0xd08
  a2:	e8 16 04 00 00       	call   4bd <kill>
  a7:	e8 e1 03 00 00       	call   48d <exit>
   assert(p != NULL);
  ac:	6a 1b                	push   $0x1b
  ae:	68 90 08 00 00       	push   $0x890
  b3:	68 99 08 00 00       	push   $0x899
  b8:	6a 01                	push   $0x1
  ba:	e8 23 05 00 00       	call   5e2 <printf>
  bf:	83 c4 0c             	add    $0xc,%esp
  c2:	68 a1 08 00 00       	push   $0x8a1
  c7:	68 ab 08 00 00       	push   $0x8ab
  cc:	6a 01                	push   $0x1
  ce:	e8 0f 05 00 00       	call   5e2 <printf>
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	68 bf 08 00 00       	push   $0x8bf
  db:	6a 01                	push   $0x1
  dd:	e8 00 05 00 00       	call   5e2 <printf>
  e2:	83 c4 04             	add    $0x4,%esp
  e5:	ff 35 08 0d 00 00    	push   0xd08
  eb:	e8 cd 03 00 00       	call   4bd <kill>
  f0:	e8 98 03 00 00       	call   48d <exit>
   stack = sbrk(0);
  f5:	83 ec 0c             	sub    $0xc,%esp
  f8:	6a 00                	push   $0x0
  fa:	e8 16 04 00 00       	call   515 <sbrk>
  ff:	89 c6                	mov    %eax,%esi
   if((uint)stack % PGSIZE)
 101:	83 c4 10             	add    $0x10,%esp
 104:	89 c2                	mov    %eax,%edx
 106:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 10c:	74 09                	je     117 <main+0x10c>
     stack = stack + (PGSIZE - (uint)stack % PGSIZE);
 10e:	b8 00 10 00 00       	mov    $0x1000,%eax
 113:	29 d0                	sub    %edx,%eax
 115:	01 c6                	add    %eax,%esi
   sbrk( ((uint)stack - (uint)sbrk(0)) + PGSIZE/2 );
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	6a 00                	push   $0x0
 11c:	e8 f4 03 00 00       	call   515 <sbrk>
 121:	89 c2                	mov    %eax,%edx
 123:	89 f0                	mov    %esi,%eax
 125:	29 d0                	sub    %edx,%eax
 127:	05 00 08 00 00       	add    $0x800,%eax
 12c:	89 04 24             	mov    %eax,(%esp)
 12f:	e8 e1 03 00 00       	call   515 <sbrk>
   assert((uint)stack % PGSIZE == 0);
 134:	83 c4 10             	add    $0x10,%esp
 137:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
 13d:	74 49                	je     188 <main+0x17d>
 13f:	6a 27                	push   $0x27
 141:	68 90 08 00 00       	push   $0x890
 146:	68 99 08 00 00       	push   $0x899
 14b:	6a 01                	push   $0x1
 14d:	e8 90 04 00 00       	call   5e2 <printf>
 152:	83 c4 0c             	add    $0xc,%esp
 155:	68 cc 08 00 00       	push   $0x8cc
 15a:	68 ab 08 00 00       	push   $0x8ab
 15f:	6a 01                	push   $0x1
 161:	e8 7c 04 00 00       	call   5e2 <printf>
 166:	83 c4 08             	add    $0x8,%esp
 169:	68 bf 08 00 00       	push   $0x8bf
 16e:	6a 01                	push   $0x1
 170:	e8 6d 04 00 00       	call   5e2 <printf>
 175:	83 c4 04             	add    $0x4,%esp
 178:	ff 35 08 0d 00 00    	push   0xd08
 17e:	e8 3a 03 00 00       	call   4bd <kill>
 183:	e8 05 03 00 00       	call   48d <exit>
   assert((uint)sbrk(0) - (uint)stack == PGSIZE/2);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	6a 00                	push   $0x0
 18d:	e8 83 03 00 00       	call   515 <sbrk>
 192:	29 f0                	sub    %esi,%eax
 194:	83 c4 10             	add    $0x10,%esp
 197:	3d 00 08 00 00       	cmp    $0x800,%eax
 19c:	74 49                	je     1e7 <main+0x1dc>
 19e:	6a 28                	push   $0x28
 1a0:	68 90 08 00 00       	push   $0x890
 1a5:	68 99 08 00 00       	push   $0x899
 1aa:	6a 01                	push   $0x1
 1ac:	e8 31 04 00 00       	call   5e2 <printf>
 1b1:	83 c4 0c             	add    $0xc,%esp
 1b4:	68 18 09 00 00       	push   $0x918
 1b9:	68 ab 08 00 00       	push   $0x8ab
 1be:	6a 01                	push   $0x1
 1c0:	e8 1d 04 00 00       	call   5e2 <printf>
 1c5:	83 c4 08             	add    $0x8,%esp
 1c8:	68 bf 08 00 00       	push   $0x8bf
 1cd:	6a 01                	push   $0x1
 1cf:	e8 0e 04 00 00       	call   5e2 <printf>
 1d4:	83 c4 04             	add    $0x4,%esp
 1d7:	ff 35 08 0d 00 00    	push   0xd08
 1dd:	e8 db 02 00 00       	call   4bd <kill>
 1e2:	e8 a6 02 00 00       	call   48d <exit>
   assert(clone(worker, 0, 0, stack) == -1);
 1e7:	56                   	push   %esi
 1e8:	6a 00                	push   $0x0
 1ea:	6a 00                	push   $0x0
 1ec:	68 00 00 00 00       	push   $0x0
 1f1:	e8 37 03 00 00       	call   52d <clone>
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	83 f8 ff             	cmp    $0xffffffff,%eax
 1fc:	74 49                	je     247 <main+0x23c>
 1fe:	6a 2a                	push   $0x2a
 200:	68 90 08 00 00       	push   $0x890
 205:	68 99 08 00 00       	push   $0x899
 20a:	6a 01                	push   $0x1
 20c:	e8 d1 03 00 00       	call   5e2 <printf>
 211:	83 c4 0c             	add    $0xc,%esp
 214:	68 f4 08 00 00       	push   $0x8f4
 219:	68 ab 08 00 00       	push   $0x8ab
 21e:	6a 01                	push   $0x1
 220:	e8 bd 03 00 00       	call   5e2 <printf>
 225:	83 c4 08             	add    $0x8,%esp
 228:	68 bf 08 00 00       	push   $0x8bf
 22d:	6a 01                	push   $0x1
 22f:	e8 ae 03 00 00       	call   5e2 <printf>
 234:	83 c4 04             	add    $0x4,%esp
 237:	ff 35 08 0d 00 00    	push   0xd08
 23d:	e8 7b 02 00 00       	call   4bd <kill>
 242:	e8 46 02 00 00       	call   48d <exit>
   printf(1, "TEST PASSED\n");
 247:	83 ec 08             	sub    $0x8,%esp
 24a:	68 e6 08 00 00       	push   $0x8e6
 24f:	6a 01                	push   $0x1
 251:	e8 8c 03 00 00       	call   5e2 <printf>
   free(p);
 256:	89 1c 24             	mov    %ebx,(%esp)
 259:	e8 ea 04 00 00       	call   748 <free>
   exit();
 25e:	e8 2a 02 00 00       	call   48d <exit>

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
 329:	e8 77 01 00 00       	call   4a5 <read>
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
 367:	e8 61 01 00 00       	call   4cd <open>
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
 37c:	e8 64 01 00 00       	call   4e5 <fstat>
 381:	89 c6                	mov    %eax,%esi
  close(fd);
 383:	89 1c 24             	mov    %ebx,(%esp)
 386:	e8 2a 01 00 00       	call   4b5 <close>
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

  void* stack = malloc(2 * PGSIZE);
 400:	68 00 20 00 00       	push   $0x2000
 405:	e8 fe 03 00 00       	call   808 <malloc>
  if ((uint)stack%PGSIZE){
 40a:	83 c4 10             	add    $0x10,%esp
 40d:	a9 ff 0f 00 00       	test   $0xfff,%eax
 412:	74 0a                	je     41e <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 414:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 419:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 41e:	50                   	push   %eax
 41f:	ff 75 10             	push   0x10(%ebp)
 422:	ff 75 0c             	push   0xc(%ebp)
 425:	ff 75 08             	push   0x8(%ebp)
 428:	e8 00 01 00 00       	call   52d <clone>
}
 42d:	c9                   	leave  
 42e:	c3                   	ret    

0000042f <thread_join>:

int thread_join(){
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	53                   	push   %ebx
 433:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 436:	8d 45 f4             	lea    -0xc(%ebp),%eax
 439:	50                   	push   %eax
 43a:	e8 f6 00 00 00       	call   535 <join>
 43f:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 441:	83 c4 04             	add    $0x4,%esp
 444:	ff 75 f4             	push   -0xc(%ebp)
 447:	e8 fc 02 00 00       	call   748 <free>
  return x;
}
 44c:	89 d8                	mov    %ebx,%eax
 44e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 451:	c9                   	leave  
 452:	c3                   	ret    

00000453 <lock_init>:

void lock_init(lock_t *spin){
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 456:	8b 45 08             	mov    0x8(%ebp),%eax
 459:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    

00000461 <lock_acquire>:

void lock_acquire(lock_t *spin){
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 467:	b8 01 00 00 00       	mov    $0x1,%eax
 46c:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 46f:	85 c0                	test   %eax,%eax
 471:	75 f4                	jne    467 <lock_acquire+0x6>

}
 473:	5d                   	pop    %ebp
 474:	c3                   	ret    

00000475 <lock_release>:

void lock_release(lock_t *spin){
 475:	55                   	push   %ebp
 476:	89 e5                	mov    %esp,%ebp
 478:	8b 55 08             	mov    0x8(%ebp),%edx
 47b:	b8 00 00 00 00       	mov    $0x0,%eax
 480:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 483:	5d                   	pop    %ebp
 484:	c3                   	ret    

00000485 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 485:	b8 01 00 00 00       	mov    $0x1,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <exit>:
SYSCALL(exit)
 48d:	b8 02 00 00 00       	mov    $0x2,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <wait>:
SYSCALL(wait)
 495:	b8 03 00 00 00       	mov    $0x3,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <pipe>:
SYSCALL(pipe)
 49d:	b8 04 00 00 00       	mov    $0x4,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <read>:
SYSCALL(read)
 4a5:	b8 05 00 00 00       	mov    $0x5,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <write>:
SYSCALL(write)
 4ad:	b8 10 00 00 00       	mov    $0x10,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <close>:
SYSCALL(close)
 4b5:	b8 15 00 00 00       	mov    $0x15,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <kill>:
SYSCALL(kill)
 4bd:	b8 06 00 00 00       	mov    $0x6,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <exec>:
SYSCALL(exec)
 4c5:	b8 07 00 00 00       	mov    $0x7,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <open>:
SYSCALL(open)
 4cd:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <mknod>:
SYSCALL(mknod)
 4d5:	b8 11 00 00 00       	mov    $0x11,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <unlink>:
SYSCALL(unlink)
 4dd:	b8 12 00 00 00       	mov    $0x12,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <fstat>:
SYSCALL(fstat)
 4e5:	b8 08 00 00 00       	mov    $0x8,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <link>:
SYSCALL(link)
 4ed:	b8 13 00 00 00       	mov    $0x13,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <mkdir>:
SYSCALL(mkdir)
 4f5:	b8 14 00 00 00       	mov    $0x14,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <chdir>:
SYSCALL(chdir)
 4fd:	b8 09 00 00 00       	mov    $0x9,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <dup>:
SYSCALL(dup)
 505:	b8 0a 00 00 00       	mov    $0xa,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <getpid>:
SYSCALL(getpid)
 50d:	b8 0b 00 00 00       	mov    $0xb,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <sbrk>:
SYSCALL(sbrk)
 515:	b8 0c 00 00 00       	mov    $0xc,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <sleep>:
SYSCALL(sleep)
 51d:	b8 0d 00 00 00       	mov    $0xd,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <uptime>:
SYSCALL(uptime)
 525:	b8 0e 00 00 00       	mov    $0xe,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <clone>:
SYSCALL(clone)
 52d:	b8 16 00 00 00       	mov    $0x16,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <join>:
 535:	b8 17 00 00 00       	mov    $0x17,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	83 ec 1c             	sub    $0x1c,%esp
 543:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 546:	6a 01                	push   $0x1
 548:	8d 55 f4             	lea    -0xc(%ebp),%edx
 54b:	52                   	push   %edx
 54c:	50                   	push   %eax
 54d:	e8 5b ff ff ff       	call   4ad <write>
}
 552:	83 c4 10             	add    $0x10,%esp
 555:	c9                   	leave  
 556:	c3                   	ret    

00000557 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 557:	55                   	push   %ebp
 558:	89 e5                	mov    %esp,%ebp
 55a:	57                   	push   %edi
 55b:	56                   	push   %esi
 55c:	53                   	push   %ebx
 55d:	83 ec 2c             	sub    $0x2c,%esp
 560:	89 45 d0             	mov    %eax,-0x30(%ebp)
 563:	89 d0                	mov    %edx,%eax
 565:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 567:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 56b:	0f 95 c1             	setne  %cl
 56e:	c1 ea 1f             	shr    $0x1f,%edx
 571:	84 d1                	test   %dl,%cl
 573:	74 44                	je     5b9 <printint+0x62>
    neg = 1;
    x = -xx;
 575:	f7 d8                	neg    %eax
 577:	89 c1                	mov    %eax,%ecx
    neg = 1;
 579:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 580:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 585:	89 c8                	mov    %ecx,%eax
 587:	ba 00 00 00 00       	mov    $0x0,%edx
 58c:	f7 f6                	div    %esi
 58e:	89 df                	mov    %ebx,%edi
 590:	83 c3 01             	add    $0x1,%ebx
 593:	0f b6 92 a0 09 00 00 	movzbl 0x9a0(%edx),%edx
 59a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 59e:	89 ca                	mov    %ecx,%edx
 5a0:	89 c1                	mov    %eax,%ecx
 5a2:	39 d6                	cmp    %edx,%esi
 5a4:	76 df                	jbe    585 <printint+0x2e>
  if(neg)
 5a6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5aa:	74 31                	je     5dd <printint+0x86>
    buf[i++] = '-';
 5ac:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5b1:	8d 5f 02             	lea    0x2(%edi),%ebx
 5b4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b7:	eb 17                	jmp    5d0 <printint+0x79>
    x = xx;
 5b9:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5bb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5c2:	eb bc                	jmp    580 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5c4:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5c9:	89 f0                	mov    %esi,%eax
 5cb:	e8 6d ff ff ff       	call   53d <putc>
  while(--i >= 0)
 5d0:	83 eb 01             	sub    $0x1,%ebx
 5d3:	79 ef                	jns    5c4 <printint+0x6d>
}
 5d5:	83 c4 2c             	add    $0x2c,%esp
 5d8:	5b                   	pop    %ebx
 5d9:	5e                   	pop    %esi
 5da:	5f                   	pop    %edi
 5db:	5d                   	pop    %ebp
 5dc:	c3                   	ret    
 5dd:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5e0:	eb ee                	jmp    5d0 <printint+0x79>

000005e2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e2:	55                   	push   %ebp
 5e3:	89 e5                	mov    %esp,%ebp
 5e5:	57                   	push   %edi
 5e6:	56                   	push   %esi
 5e7:	53                   	push   %ebx
 5e8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5eb:	8d 45 10             	lea    0x10(%ebp),%eax
 5ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5f1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5f6:	bb 00 00 00 00       	mov    $0x0,%ebx
 5fb:	eb 14                	jmp    611 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5fd:	89 fa                	mov    %edi,%edx
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
 602:	e8 36 ff ff ff       	call   53d <putc>
 607:	eb 05                	jmp    60e <printf+0x2c>
      }
    } else if(state == '%'){
 609:	83 fe 25             	cmp    $0x25,%esi
 60c:	74 25                	je     633 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 60e:	83 c3 01             	add    $0x1,%ebx
 611:	8b 45 0c             	mov    0xc(%ebp),%eax
 614:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 618:	84 c0                	test   %al,%al
 61a:	0f 84 20 01 00 00    	je     740 <printf+0x15e>
    c = fmt[i] & 0xff;
 620:	0f be f8             	movsbl %al,%edi
 623:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 626:	85 f6                	test   %esi,%esi
 628:	75 df                	jne    609 <printf+0x27>
      if(c == '%'){
 62a:	83 f8 25             	cmp    $0x25,%eax
 62d:	75 ce                	jne    5fd <printf+0x1b>
        state = '%';
 62f:	89 c6                	mov    %eax,%esi
 631:	eb db                	jmp    60e <printf+0x2c>
      if(c == 'd'){
 633:	83 f8 25             	cmp    $0x25,%eax
 636:	0f 84 cf 00 00 00    	je     70b <printf+0x129>
 63c:	0f 8c dd 00 00 00    	jl     71f <printf+0x13d>
 642:	83 f8 78             	cmp    $0x78,%eax
 645:	0f 8f d4 00 00 00    	jg     71f <printf+0x13d>
 64b:	83 f8 63             	cmp    $0x63,%eax
 64e:	0f 8c cb 00 00 00    	jl     71f <printf+0x13d>
 654:	83 e8 63             	sub    $0x63,%eax
 657:	83 f8 15             	cmp    $0x15,%eax
 65a:	0f 87 bf 00 00 00    	ja     71f <printf+0x13d>
 660:	ff 24 85 48 09 00 00 	jmp    *0x948(,%eax,4)
        printint(fd, *ap, 10, 1);
 667:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66a:	8b 17                	mov    (%edi),%edx
 66c:	83 ec 0c             	sub    $0xc,%esp
 66f:	6a 01                	push   $0x1
 671:	b9 0a 00 00 00       	mov    $0xa,%ecx
 676:	8b 45 08             	mov    0x8(%ebp),%eax
 679:	e8 d9 fe ff ff       	call   557 <printint>
        ap++;
 67e:	83 c7 04             	add    $0x4,%edi
 681:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 684:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 687:	be 00 00 00 00       	mov    $0x0,%esi
 68c:	eb 80                	jmp    60e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 68e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 691:	8b 17                	mov    (%edi),%edx
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	6a 00                	push   $0x0
 698:	b9 10 00 00 00       	mov    $0x10,%ecx
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	e8 b2 fe ff ff       	call   557 <printint>
        ap++;
 6a5:	83 c7 04             	add    $0x4,%edi
 6a8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ab:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ae:	be 00 00 00 00       	mov    $0x0,%esi
 6b3:	e9 56 ff ff ff       	jmp    60e <printf+0x2c>
        s = (char*)*ap;
 6b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6bb:	8b 30                	mov    (%eax),%esi
        ap++;
 6bd:	83 c0 04             	add    $0x4,%eax
 6c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6c3:	85 f6                	test   %esi,%esi
 6c5:	75 15                	jne    6dc <printf+0xfa>
          s = "(null)";
 6c7:	be 40 09 00 00       	mov    $0x940,%esi
 6cc:	eb 0e                	jmp    6dc <printf+0xfa>
          putc(fd, *s);
 6ce:	0f be d2             	movsbl %dl,%edx
 6d1:	8b 45 08             	mov    0x8(%ebp),%eax
 6d4:	e8 64 fe ff ff       	call   53d <putc>
          s++;
 6d9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6dc:	0f b6 16             	movzbl (%esi),%edx
 6df:	84 d2                	test   %dl,%dl
 6e1:	75 eb                	jne    6ce <printf+0xec>
      state = 0;
 6e3:	be 00 00 00 00       	mov    $0x0,%esi
 6e8:	e9 21 ff ff ff       	jmp    60e <printf+0x2c>
        putc(fd, *ap);
 6ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f0:	0f be 17             	movsbl (%edi),%edx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 42 fe ff ff       	call   53d <putc>
        ap++;
 6fb:	83 c7 04             	add    $0x4,%edi
 6fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 701:	be 00 00 00 00       	mov    $0x0,%esi
 706:	e9 03 ff ff ff       	jmp    60e <printf+0x2c>
        putc(fd, c);
 70b:	89 fa                	mov    %edi,%edx
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	e8 28 fe ff ff       	call   53d <putc>
      state = 0;
 715:	be 00 00 00 00       	mov    $0x0,%esi
 71a:	e9 ef fe ff ff       	jmp    60e <printf+0x2c>
        putc(fd, '%');
 71f:	ba 25 00 00 00       	mov    $0x25,%edx
 724:	8b 45 08             	mov    0x8(%ebp),%eax
 727:	e8 11 fe ff ff       	call   53d <putc>
        putc(fd, c);
 72c:	89 fa                	mov    %edi,%edx
 72e:	8b 45 08             	mov    0x8(%ebp),%eax
 731:	e8 07 fe ff ff       	call   53d <putc>
      state = 0;
 736:	be 00 00 00 00       	mov    $0x0,%esi
 73b:	e9 ce fe ff ff       	jmp    60e <printf+0x2c>
    }
  }
}
 740:	8d 65 f4             	lea    -0xc(%ebp),%esp
 743:	5b                   	pop    %ebx
 744:	5e                   	pop    %esi
 745:	5f                   	pop    %edi
 746:	5d                   	pop    %ebp
 747:	c3                   	ret    

00000748 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 748:	55                   	push   %ebp
 749:	89 e5                	mov    %esp,%ebp
 74b:	57                   	push   %edi
 74c:	56                   	push   %esi
 74d:	53                   	push   %ebx
 74e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 751:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 754:	a1 0c 0d 00 00       	mov    0xd0c,%eax
 759:	eb 02                	jmp    75d <free+0x15>
 75b:	89 d0                	mov    %edx,%eax
 75d:	39 c8                	cmp    %ecx,%eax
 75f:	73 04                	jae    765 <free+0x1d>
 761:	39 08                	cmp    %ecx,(%eax)
 763:	77 12                	ja     777 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 765:	8b 10                	mov    (%eax),%edx
 767:	39 c2                	cmp    %eax,%edx
 769:	77 f0                	ja     75b <free+0x13>
 76b:	39 c8                	cmp    %ecx,%eax
 76d:	72 08                	jb     777 <free+0x2f>
 76f:	39 ca                	cmp    %ecx,%edx
 771:	77 04                	ja     777 <free+0x2f>
 773:	89 d0                	mov    %edx,%eax
 775:	eb e6                	jmp    75d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 777:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77d:	8b 10                	mov    (%eax),%edx
 77f:	39 d7                	cmp    %edx,%edi
 781:	74 19                	je     79c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 783:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 786:	8b 50 04             	mov    0x4(%eax),%edx
 789:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 78c:	39 ce                	cmp    %ecx,%esi
 78e:	74 1b                	je     7ab <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 790:	89 08                	mov    %ecx,(%eax)
  freep = p;
 792:	a3 0c 0d 00 00       	mov    %eax,0xd0c
}
 797:	5b                   	pop    %ebx
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 79c:	03 72 04             	add    0x4(%edx),%esi
 79f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a2:	8b 10                	mov    (%eax),%edx
 7a4:	8b 12                	mov    (%edx),%edx
 7a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7a9:	eb db                	jmp    786 <free+0x3e>
    p->s.size += bp->s.size;
 7ab:	03 53 fc             	add    -0x4(%ebx),%edx
 7ae:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7b4:	89 10                	mov    %edx,(%eax)
 7b6:	eb da                	jmp    792 <free+0x4a>

000007b8 <morecore>:

static Header*
morecore(uint nu)
{
 7b8:	55                   	push   %ebp
 7b9:	89 e5                	mov    %esp,%ebp
 7bb:	53                   	push   %ebx
 7bc:	83 ec 04             	sub    $0x4,%esp
 7bf:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7c1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7c6:	77 05                	ja     7cd <morecore+0x15>
    nu = 4096;
 7c8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7cd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7d4:	83 ec 0c             	sub    $0xc,%esp
 7d7:	50                   	push   %eax
 7d8:	e8 38 fd ff ff       	call   515 <sbrk>
  if(p == (char*)-1)
 7dd:	83 c4 10             	add    $0x10,%esp
 7e0:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e3:	74 1c                	je     801 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7e5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e8:	83 c0 08             	add    $0x8,%eax
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	50                   	push   %eax
 7ef:	e8 54 ff ff ff       	call   748 <free>
  return freep;
 7f4:	a1 0c 0d 00 00       	mov    0xd0c,%eax
 7f9:	83 c4 10             	add    $0x10,%esp
}
 7fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7ff:	c9                   	leave  
 800:	c3                   	ret    
    return 0;
 801:	b8 00 00 00 00       	mov    $0x0,%eax
 806:	eb f4                	jmp    7fc <morecore+0x44>

00000808 <malloc>:

void*
malloc(uint nbytes)
{
 808:	55                   	push   %ebp
 809:	89 e5                	mov    %esp,%ebp
 80b:	53                   	push   %ebx
 80c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80f:	8b 45 08             	mov    0x8(%ebp),%eax
 812:	8d 58 07             	lea    0x7(%eax),%ebx
 815:	c1 eb 03             	shr    $0x3,%ebx
 818:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 81b:	8b 0d 0c 0d 00 00    	mov    0xd0c,%ecx
 821:	85 c9                	test   %ecx,%ecx
 823:	74 04                	je     829 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 825:	8b 01                	mov    (%ecx),%eax
 827:	eb 4a                	jmp    873 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 829:	c7 05 0c 0d 00 00 10 	movl   $0xd10,0xd0c
 830:	0d 00 00 
 833:	c7 05 10 0d 00 00 10 	movl   $0xd10,0xd10
 83a:	0d 00 00 
    base.s.size = 0;
 83d:	c7 05 14 0d 00 00 00 	movl   $0x0,0xd14
 844:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 847:	b9 10 0d 00 00       	mov    $0xd10,%ecx
 84c:	eb d7                	jmp    825 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 84e:	74 19                	je     869 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 850:	29 da                	sub    %ebx,%edx
 852:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 855:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 858:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 85b:	89 0d 0c 0d 00 00    	mov    %ecx,0xd0c
      return (void*)(p + 1);
 861:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 864:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 867:	c9                   	leave  
 868:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 869:	8b 10                	mov    (%eax),%edx
 86b:	89 11                	mov    %edx,(%ecx)
 86d:	eb ec                	jmp    85b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86f:	89 c1                	mov    %eax,%ecx
 871:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 873:	8b 50 04             	mov    0x4(%eax),%edx
 876:	39 da                	cmp    %ebx,%edx
 878:	73 d4                	jae    84e <malloc+0x46>
    if(p == freep)
 87a:	39 05 0c 0d 00 00    	cmp    %eax,0xd0c
 880:	75 ed                	jne    86f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 882:	89 d8                	mov    %ebx,%eax
 884:	e8 2f ff ff ff       	call   7b8 <morecore>
 889:	85 c0                	test   %eax,%eax
 88b:	75 e2                	jne    86f <malloc+0x67>
 88d:	eb d5                	jmp    864 <malloc+0x5c>
