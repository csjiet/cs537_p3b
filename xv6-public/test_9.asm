
_test_9:     file format elf32-i386


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
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
   6:	8d 4d 0c             	lea    0xc(%ebp),%ecx
   9:	8b 45 08             	mov    0x8(%ebp),%eax
   c:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
  12:	39 d1                	cmp    %edx,%ecx
  14:	75 67                	jne    7d <worker+0x7d>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  16:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
  1c:	8d 4d 08             	lea    0x8(%ebp),%ecx
  1f:	39 d1                	cmp    %edx,%ecx
  21:	0f 85 9f 00 00 00    	jne    c6 <worker+0xc6>
   assert(*((uint*) (arg1 + PGSIZE - 12)) == 0xffffffff);
  27:	83 b8 f4 0f 00 00 ff 	cmpl   $0xffffffff,0xff4(%eax)
  2e:	0f 84 db 00 00 00    	je     10f <worker+0x10f>
  34:	6a 32                	push   $0x32
  36:	68 c8 08 00 00       	push   $0x8c8
  3b:	68 d1 08 00 00       	push   $0x8d1
  40:	6a 01                	push   $0x1
  42:	e8 d3 05 00 00       	call   61a <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 90 09 00 00       	push   $0x990
  4f:	68 d9 08 00 00       	push   $0x8d9
  54:	6a 01                	push   $0x1
  56:	e8 bf 05 00 00       	call   61a <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 ed 08 00 00       	push   $0x8ed
  63:	6a 01                	push   $0x1
  65:	e8 b0 05 00 00       	call   61a <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 8c 0d 00 00    	push   0xd8c
  73:	e8 7d 04 00 00       	call   4f5 <kill>
  78:	e8 48 04 00 00       	call   4c5 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 c8 08 00 00       	push   $0x8c8
  84:	68 d1 08 00 00       	push   $0x8d1
  89:	6a 01                	push   $0x1
  8b:	e8 8a 05 00 00       	call   61a <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 38 09 00 00       	push   $0x938
  98:	68 d9 08 00 00       	push   $0x8d9
  9d:	6a 01                	push   $0x1
  9f:	e8 76 05 00 00       	call   61a <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 ed 08 00 00       	push   $0x8ed
  ac:	6a 01                	push   $0x1
  ae:	e8 67 05 00 00       	call   61a <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 8c 0d 00 00    	push   0xd8c
  bc:	e8 34 04 00 00       	call   4f5 <kill>
  c1:	e8 ff 03 00 00       	call   4c5 <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 c8 08 00 00       	push   $0x8c8
  cd:	68 d1 08 00 00       	push   $0x8d1
  d2:	6a 01                	push   $0x1
  d4:	e8 41 05 00 00       	call   61a <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 64 09 00 00       	push   $0x964
  e1:	68 d9 08 00 00       	push   $0x8d9
  e6:	6a 01                	push   $0x1
  e8:	e8 2d 05 00 00       	call   61a <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 ed 08 00 00       	push   $0x8ed
  f5:	6a 01                	push   $0x1
  f7:	e8 1e 05 00 00       	call   61a <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 8c 0d 00 00    	push   0xd8c
 105:	e8 eb 03 00 00       	call   4f5 <kill>
 10a:	e8 b6 03 00 00       	call   4c5 <exit>
   global = 5;
 10f:	c7 05 88 0d 00 00 05 	movl   $0x5,0xd88
 116:	00 00 00 
   exit();
 119:	e8 a7 03 00 00       	call   4c5 <exit>

0000011e <main>:
{
 11e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 122:	83 e4 f0             	and    $0xfffffff0,%esp
 125:	ff 71 fc             	push   -0x4(%ecx)
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	56                   	push   %esi
 12c:	53                   	push   %ebx
 12d:	51                   	push   %ecx
 12e:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
 131:	e8 0f 04 00 00       	call   545 <getpid>
 136:	a3 8c 0d 00 00       	mov    %eax,0xd8c
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 f8 06 00 00       	call   840 <malloc>
   assert(p != NULL);
 148:	83 c4 10             	add    $0x10,%esp
 14b:	85 c0                	test   %eax,%eax
 14d:	0f 84 a8 00 00 00    	je     1fb <main+0xdd>
 153:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 155:	89 c2                	mov    %eax,%edx
 157:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 15d:	74 09                	je     168 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 15f:	b8 00 10 00 00       	mov    $0x1000,%eax
 164:	29 d0                	sub    %edx,%eax
 166:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, stack, 0, stack);
 168:	50                   	push   %eax
 169:	6a 00                	push   $0x0
 16b:	50                   	push   %eax
 16c:	68 00 00 00 00       	push   $0x0
 171:	e8 ef 03 00 00       	call   565 <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 88 0d 00 00       	mov    0xd88,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 12 09 00 00       	push   $0x912
 195:	6a 01                	push   $0x1
 197:	e8 7e 04 00 00       	call   61a <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 c6 03 00 00       	call   56d <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 c8 08 00 00       	push   $0x8c8
 1b9:	68 d1 08 00 00       	push   $0x8d1
 1be:	6a 01                	push   $0x1
 1c0:	e8 55 04 00 00       	call   61a <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 1f 09 00 00       	push   $0x91f
 1cd:	68 d9 08 00 00       	push   $0x8d9
 1d2:	6a 01                	push   $0x1
 1d4:	e8 41 04 00 00       	call   61a <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 ed 08 00 00       	push   $0x8ed
 1e1:	6a 01                	push   $0x1
 1e3:	e8 32 04 00 00       	call   61a <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 8c 0d 00 00    	push   0xd8c
 1f1:	e8 ff 02 00 00       	call   4f5 <kill>
 1f6:	e8 ca 02 00 00       	call   4c5 <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 c8 08 00 00       	push   $0x8c8
 202:	68 d1 08 00 00       	push   $0x8d1
 207:	6a 01                	push   $0x1
 209:	e8 0c 04 00 00       	call   61a <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 fa 08 00 00       	push   $0x8fa
 216:	68 d9 08 00 00       	push   $0x8d9
 21b:	6a 01                	push   $0x1
 21d:	e8 f8 03 00 00       	call   61a <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 ed 08 00 00       	push   $0x8ed
 22a:	6a 01                	push   $0x1
 22c:	e8 e9 03 00 00       	call   61a <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 8c 0d 00 00    	push   0xd8c
 23a:	e8 b6 02 00 00       	call   4f5 <kill>
 23f:	e8 81 02 00 00       	call   4c5 <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 c8 08 00 00       	push   $0x8c8
 24b:	68 d1 08 00 00       	push   $0x8d1
 250:	6a 01                	push   $0x1
 252:	e8 c3 03 00 00       	call   61a <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 04 09 00 00       	push   $0x904
 25f:	68 d9 08 00 00       	push   $0x8d9
 264:	6a 01                	push   $0x1
 266:	e8 af 03 00 00       	call   61a <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 ed 08 00 00       	push   $0x8ed
 273:	6a 01                	push   $0x1
 275:	e8 a0 03 00 00       	call   61a <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 8c 0d 00 00    	push   0xd8c
 283:	e8 6d 02 00 00       	call   4f5 <kill>
 288:	e8 38 02 00 00       	call   4c5 <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 ea 04 00 00       	call   780 <free>
   exit();
 296:	e8 2a 02 00 00       	call   4c5 <exit>

0000029b <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	56                   	push   %esi
 29f:	53                   	push   %ebx
 2a0:	8b 75 08             	mov    0x8(%ebp),%esi
 2a3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2a6:	89 f0                	mov    %esi,%eax
 2a8:	89 d1                	mov    %edx,%ecx
 2aa:	83 c2 01             	add    $0x1,%edx
 2ad:	89 c3                	mov    %eax,%ebx
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	0f b6 09             	movzbl (%ecx),%ecx
 2b5:	88 0b                	mov    %cl,(%ebx)
 2b7:	84 c9                	test   %cl,%cl
 2b9:	75 ed                	jne    2a8 <strcpy+0xd>
    ;
  return os;
}
 2bb:	89 f0                	mov    %esi,%eax
 2bd:	5b                   	pop    %ebx
 2be:	5e                   	pop    %esi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    

000002c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
 2c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2ca:	eb 06                	jmp    2d2 <strcmp+0x11>
    p++, q++;
 2cc:	83 c1 01             	add    $0x1,%ecx
 2cf:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2d2:	0f b6 01             	movzbl (%ecx),%eax
 2d5:	84 c0                	test   %al,%al
 2d7:	74 04                	je     2dd <strcmp+0x1c>
 2d9:	3a 02                	cmp    (%edx),%al
 2db:	74 ef                	je     2cc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2dd:	0f b6 c0             	movzbl %al,%eax
 2e0:	0f b6 12             	movzbl (%edx),%edx
 2e3:	29 d0                	sub    %edx,%eax
}
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    

000002e7 <strlen>:

uint
strlen(const char *s)
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ed:	b8 00 00 00 00       	mov    $0x0,%eax
 2f2:	eb 03                	jmp    2f7 <strlen+0x10>
 2f4:	83 c0 01             	add    $0x1,%eax
 2f7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2fb:	75 f7                	jne    2f4 <strlen+0xd>
    ;
  return n;
}
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    

000002ff <memset>:

void*
memset(void *dst, int c, uint n)
{
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	57                   	push   %edi
 303:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 306:	89 d7                	mov    %edx,%edi
 308:	8b 4d 10             	mov    0x10(%ebp),%ecx
 30b:	8b 45 0c             	mov    0xc(%ebp),%eax
 30e:	fc                   	cld    
 30f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 311:	89 d0                	mov    %edx,%eax
 313:	8b 7d fc             	mov    -0x4(%ebp),%edi
 316:	c9                   	leave  
 317:	c3                   	ret    

00000318 <strchr>:

char*
strchr(const char *s, char c)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 322:	eb 03                	jmp    327 <strchr+0xf>
 324:	83 c0 01             	add    $0x1,%eax
 327:	0f b6 10             	movzbl (%eax),%edx
 32a:	84 d2                	test   %dl,%dl
 32c:	74 06                	je     334 <strchr+0x1c>
    if(*s == c)
 32e:	38 ca                	cmp    %cl,%dl
 330:	75 f2                	jne    324 <strchr+0xc>
 332:	eb 05                	jmp    339 <strchr+0x21>
      return (char*)s;
  return 0;
 334:	b8 00 00 00 00       	mov    $0x0,%eax
}
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <gets>:

char*
gets(char *buf, int max)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	57                   	push   %edi
 33f:	56                   	push   %esi
 340:	53                   	push   %ebx
 341:	83 ec 1c             	sub    $0x1c,%esp
 344:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 347:	bb 00 00 00 00       	mov    $0x0,%ebx
 34c:	89 de                	mov    %ebx,%esi
 34e:	83 c3 01             	add    $0x1,%ebx
 351:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 354:	7d 2e                	jge    384 <gets+0x49>
    cc = read(0, &c, 1);
 356:	83 ec 04             	sub    $0x4,%esp
 359:	6a 01                	push   $0x1
 35b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 35e:	50                   	push   %eax
 35f:	6a 00                	push   $0x0
 361:	e8 77 01 00 00       	call   4dd <read>
    if(cc < 1)
 366:	83 c4 10             	add    $0x10,%esp
 369:	85 c0                	test   %eax,%eax
 36b:	7e 17                	jle    384 <gets+0x49>
      break;
    buf[i++] = c;
 36d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 371:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 374:	3c 0a                	cmp    $0xa,%al
 376:	0f 94 c2             	sete   %dl
 379:	3c 0d                	cmp    $0xd,%al
 37b:	0f 94 c0             	sete   %al
 37e:	08 c2                	or     %al,%dl
 380:	74 ca                	je     34c <gets+0x11>
    buf[i++] = c;
 382:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 384:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 388:	89 f8                	mov    %edi,%eax
 38a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5f                   	pop    %edi
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <stat>:

int
stat(const char *n, struct stat *st)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	56                   	push   %esi
 396:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 397:	83 ec 08             	sub    $0x8,%esp
 39a:	6a 00                	push   $0x0
 39c:	ff 75 08             	push   0x8(%ebp)
 39f:	e8 61 01 00 00       	call   505 <open>
  if(fd < 0)
 3a4:	83 c4 10             	add    $0x10,%esp
 3a7:	85 c0                	test   %eax,%eax
 3a9:	78 24                	js     3cf <stat+0x3d>
 3ab:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3ad:	83 ec 08             	sub    $0x8,%esp
 3b0:	ff 75 0c             	push   0xc(%ebp)
 3b3:	50                   	push   %eax
 3b4:	e8 64 01 00 00       	call   51d <fstat>
 3b9:	89 c6                	mov    %eax,%esi
  close(fd);
 3bb:	89 1c 24             	mov    %ebx,(%esp)
 3be:	e8 2a 01 00 00       	call   4ed <close>
  return r;
 3c3:	83 c4 10             	add    $0x10,%esp
}
 3c6:	89 f0                	mov    %esi,%eax
 3c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3cb:	5b                   	pop    %ebx
 3cc:	5e                   	pop    %esi
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    
    return -1;
 3cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d4:	eb f0                	jmp    3c6 <stat+0x34>

000003d6 <atoi>:

int
atoi(const char *s)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	53                   	push   %ebx
 3da:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3dd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3e2:	eb 10                	jmp    3f4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3e4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3e7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ea:	83 c1 01             	add    $0x1,%ecx
 3ed:	0f be c0             	movsbl %al,%eax
 3f0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3f4:	0f b6 01             	movzbl (%ecx),%eax
 3f7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3fa:	80 fb 09             	cmp    $0x9,%bl
 3fd:	76 e5                	jbe    3e4 <atoi+0xe>
  return n;
}
 3ff:	89 d0                	mov    %edx,%eax
 401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 404:	c9                   	leave  
 405:	c3                   	ret    

00000406 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	56                   	push   %esi
 40a:	53                   	push   %ebx
 40b:	8b 75 08             	mov    0x8(%ebp),%esi
 40e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 411:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 414:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 416:	eb 0d                	jmp    425 <memmove+0x1f>
    *dst++ = *src++;
 418:	0f b6 01             	movzbl (%ecx),%eax
 41b:	88 02                	mov    %al,(%edx)
 41d:	8d 49 01             	lea    0x1(%ecx),%ecx
 420:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 423:	89 d8                	mov    %ebx,%eax
 425:	8d 58 ff             	lea    -0x1(%eax),%ebx
 428:	85 c0                	test   %eax,%eax
 42a:	7f ec                	jg     418 <memmove+0x12>
  return vdst;
}
 42c:	89 f0                	mov    %esi,%eax
 42e:	5b                   	pop    %ebx
 42f:	5e                   	pop    %esi
 430:	5d                   	pop    %ebp
 431:	c3                   	ret    

00000432 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 438:	68 00 20 00 00       	push   $0x2000
 43d:	e8 fe 03 00 00       	call   840 <malloc>
  if ((uint)stack%PGSIZE){
 442:	83 c4 10             	add    $0x10,%esp
 445:	a9 ff 0f 00 00       	test   $0xfff,%eax
 44a:	74 0a                	je     456 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 44c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 451:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 456:	50                   	push   %eax
 457:	ff 75 10             	push   0x10(%ebp)
 45a:	ff 75 0c             	push   0xc(%ebp)
 45d:	ff 75 08             	push   0x8(%ebp)
 460:	e8 00 01 00 00       	call   565 <clone>
}
 465:	c9                   	leave  
 466:	c3                   	ret    

00000467 <thread_join>:

int thread_join(){
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	53                   	push   %ebx
 46b:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 46e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 471:	50                   	push   %eax
 472:	e8 f6 00 00 00       	call   56d <join>
 477:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 479:	83 c4 04             	add    $0x4,%esp
 47c:	ff 75 f4             	push   -0xc(%ebp)
 47f:	e8 fc 02 00 00       	call   780 <free>
  return x;
}
 484:	89 d8                	mov    %ebx,%eax
 486:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 489:	c9                   	leave  
 48a:	c3                   	ret    

0000048b <lock_init>:

void lock_init(lock_t *spin){
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 48e:	8b 45 08             	mov    0x8(%ebp),%eax
 491:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 497:	5d                   	pop    %ebp
 498:	c3                   	ret    

00000499 <lock_acquire>:

void lock_acquire(lock_t *spin){
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 49f:	b8 01 00 00 00       	mov    $0x1,%eax
 4a4:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4a7:	85 c0                	test   %eax,%eax
 4a9:	75 f4                	jne    49f <lock_acquire+0x6>

}
 4ab:	5d                   	pop    %ebp
 4ac:	c3                   	ret    

000004ad <lock_release>:

void lock_release(lock_t *spin){
 4ad:	55                   	push   %ebp
 4ae:	89 e5                	mov    %esp,%ebp
 4b0:	8b 55 08             	mov    0x8(%ebp),%edx
 4b3:	b8 00 00 00 00       	mov    $0x0,%eax
 4b8:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    

000004bd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4bd:	b8 01 00 00 00       	mov    $0x1,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <exit>:
SYSCALL(exit)
 4c5:	b8 02 00 00 00       	mov    $0x2,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <wait>:
SYSCALL(wait)
 4cd:	b8 03 00 00 00       	mov    $0x3,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <pipe>:
SYSCALL(pipe)
 4d5:	b8 04 00 00 00       	mov    $0x4,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <read>:
SYSCALL(read)
 4dd:	b8 05 00 00 00       	mov    $0x5,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <write>:
SYSCALL(write)
 4e5:	b8 10 00 00 00       	mov    $0x10,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <close>:
SYSCALL(close)
 4ed:	b8 15 00 00 00       	mov    $0x15,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <kill>:
SYSCALL(kill)
 4f5:	b8 06 00 00 00       	mov    $0x6,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <exec>:
SYSCALL(exec)
 4fd:	b8 07 00 00 00       	mov    $0x7,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <open>:
SYSCALL(open)
 505:	b8 0f 00 00 00       	mov    $0xf,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <mknod>:
SYSCALL(mknod)
 50d:	b8 11 00 00 00       	mov    $0x11,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <unlink>:
SYSCALL(unlink)
 515:	b8 12 00 00 00       	mov    $0x12,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <fstat>:
SYSCALL(fstat)
 51d:	b8 08 00 00 00       	mov    $0x8,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <link>:
SYSCALL(link)
 525:	b8 13 00 00 00       	mov    $0x13,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <mkdir>:
SYSCALL(mkdir)
 52d:	b8 14 00 00 00       	mov    $0x14,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <chdir>:
SYSCALL(chdir)
 535:	b8 09 00 00 00       	mov    $0x9,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <dup>:
SYSCALL(dup)
 53d:	b8 0a 00 00 00       	mov    $0xa,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <getpid>:
SYSCALL(getpid)
 545:	b8 0b 00 00 00       	mov    $0xb,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <sbrk>:
SYSCALL(sbrk)
 54d:	b8 0c 00 00 00       	mov    $0xc,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <sleep>:
SYSCALL(sleep)
 555:	b8 0d 00 00 00       	mov    $0xd,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <uptime>:
SYSCALL(uptime)
 55d:	b8 0e 00 00 00       	mov    $0xe,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <clone>:
SYSCALL(clone)
 565:	b8 16 00 00 00       	mov    $0x16,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <join>:
 56d:	b8 17 00 00 00       	mov    $0x17,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 575:	55                   	push   %ebp
 576:	89 e5                	mov    %esp,%ebp
 578:	83 ec 1c             	sub    $0x1c,%esp
 57b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 57e:	6a 01                	push   $0x1
 580:	8d 55 f4             	lea    -0xc(%ebp),%edx
 583:	52                   	push   %edx
 584:	50                   	push   %eax
 585:	e8 5b ff ff ff       	call   4e5 <write>
}
 58a:	83 c4 10             	add    $0x10,%esp
 58d:	c9                   	leave  
 58e:	c3                   	ret    

0000058f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 58f:	55                   	push   %ebp
 590:	89 e5                	mov    %esp,%ebp
 592:	57                   	push   %edi
 593:	56                   	push   %esi
 594:	53                   	push   %ebx
 595:	83 ec 2c             	sub    $0x2c,%esp
 598:	89 45 d0             	mov    %eax,-0x30(%ebp)
 59b:	89 d0                	mov    %edx,%eax
 59d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 59f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5a3:	0f 95 c1             	setne  %cl
 5a6:	c1 ea 1f             	shr    $0x1f,%edx
 5a9:	84 d1                	test   %dl,%cl
 5ab:	74 44                	je     5f1 <printint+0x62>
    neg = 1;
    x = -xx;
 5ad:	f7 d8                	neg    %eax
 5af:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5b1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5b8:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5bd:	89 c8                	mov    %ecx,%eax
 5bf:	ba 00 00 00 00       	mov    $0x0,%edx
 5c4:	f7 f6                	div    %esi
 5c6:	89 df                	mov    %ebx,%edi
 5c8:	83 c3 01             	add    $0x1,%ebx
 5cb:	0f b6 92 20 0a 00 00 	movzbl 0xa20(%edx),%edx
 5d2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5d6:	89 ca                	mov    %ecx,%edx
 5d8:	89 c1                	mov    %eax,%ecx
 5da:	39 d6                	cmp    %edx,%esi
 5dc:	76 df                	jbe    5bd <printint+0x2e>
  if(neg)
 5de:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5e2:	74 31                	je     615 <printint+0x86>
    buf[i++] = '-';
 5e4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5e9:	8d 5f 02             	lea    0x2(%edi),%ebx
 5ec:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ef:	eb 17                	jmp    608 <printint+0x79>
    x = xx;
 5f1:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5f3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5fa:	eb bc                	jmp    5b8 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5fc:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 601:	89 f0                	mov    %esi,%eax
 603:	e8 6d ff ff ff       	call   575 <putc>
  while(--i >= 0)
 608:	83 eb 01             	sub    $0x1,%ebx
 60b:	79 ef                	jns    5fc <printint+0x6d>
}
 60d:	83 c4 2c             	add    $0x2c,%esp
 610:	5b                   	pop    %ebx
 611:	5e                   	pop    %esi
 612:	5f                   	pop    %edi
 613:	5d                   	pop    %ebp
 614:	c3                   	ret    
 615:	8b 75 d0             	mov    -0x30(%ebp),%esi
 618:	eb ee                	jmp    608 <printint+0x79>

0000061a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 61a:	55                   	push   %ebp
 61b:	89 e5                	mov    %esp,%ebp
 61d:	57                   	push   %edi
 61e:	56                   	push   %esi
 61f:	53                   	push   %ebx
 620:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 623:	8d 45 10             	lea    0x10(%ebp),%eax
 626:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 629:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 62e:	bb 00 00 00 00       	mov    $0x0,%ebx
 633:	eb 14                	jmp    649 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 635:	89 fa                	mov    %edi,%edx
 637:	8b 45 08             	mov    0x8(%ebp),%eax
 63a:	e8 36 ff ff ff       	call   575 <putc>
 63f:	eb 05                	jmp    646 <printf+0x2c>
      }
    } else if(state == '%'){
 641:	83 fe 25             	cmp    $0x25,%esi
 644:	74 25                	je     66b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 646:	83 c3 01             	add    $0x1,%ebx
 649:	8b 45 0c             	mov    0xc(%ebp),%eax
 64c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 650:	84 c0                	test   %al,%al
 652:	0f 84 20 01 00 00    	je     778 <printf+0x15e>
    c = fmt[i] & 0xff;
 658:	0f be f8             	movsbl %al,%edi
 65b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 65e:	85 f6                	test   %esi,%esi
 660:	75 df                	jne    641 <printf+0x27>
      if(c == '%'){
 662:	83 f8 25             	cmp    $0x25,%eax
 665:	75 ce                	jne    635 <printf+0x1b>
        state = '%';
 667:	89 c6                	mov    %eax,%esi
 669:	eb db                	jmp    646 <printf+0x2c>
      if(c == 'd'){
 66b:	83 f8 25             	cmp    $0x25,%eax
 66e:	0f 84 cf 00 00 00    	je     743 <printf+0x129>
 674:	0f 8c dd 00 00 00    	jl     757 <printf+0x13d>
 67a:	83 f8 78             	cmp    $0x78,%eax
 67d:	0f 8f d4 00 00 00    	jg     757 <printf+0x13d>
 683:	83 f8 63             	cmp    $0x63,%eax
 686:	0f 8c cb 00 00 00    	jl     757 <printf+0x13d>
 68c:	83 e8 63             	sub    $0x63,%eax
 68f:	83 f8 15             	cmp    $0x15,%eax
 692:	0f 87 bf 00 00 00    	ja     757 <printf+0x13d>
 698:	ff 24 85 c8 09 00 00 	jmp    *0x9c8(,%eax,4)
        printint(fd, *ap, 10, 1);
 69f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6a2:	8b 17                	mov    (%edi),%edx
 6a4:	83 ec 0c             	sub    $0xc,%esp
 6a7:	6a 01                	push   $0x1
 6a9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	e8 d9 fe ff ff       	call   58f <printint>
        ap++;
 6b6:	83 c7 04             	add    $0x4,%edi
 6b9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6bc:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6bf:	be 00 00 00 00       	mov    $0x0,%esi
 6c4:	eb 80                	jmp    646 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c9:	8b 17                	mov    (%edi),%edx
 6cb:	83 ec 0c             	sub    $0xc,%esp
 6ce:	6a 00                	push   $0x0
 6d0:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d5:	8b 45 08             	mov    0x8(%ebp),%eax
 6d8:	e8 b2 fe ff ff       	call   58f <printint>
        ap++;
 6dd:	83 c7 04             	add    $0x4,%edi
 6e0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6e3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6e6:	be 00 00 00 00       	mov    $0x0,%esi
 6eb:	e9 56 ff ff ff       	jmp    646 <printf+0x2c>
        s = (char*)*ap;
 6f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f3:	8b 30                	mov    (%eax),%esi
        ap++;
 6f5:	83 c0 04             	add    $0x4,%eax
 6f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6fb:	85 f6                	test   %esi,%esi
 6fd:	75 15                	jne    714 <printf+0xfa>
          s = "(null)";
 6ff:	be be 09 00 00       	mov    $0x9be,%esi
 704:	eb 0e                	jmp    714 <printf+0xfa>
          putc(fd, *s);
 706:	0f be d2             	movsbl %dl,%edx
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	e8 64 fe ff ff       	call   575 <putc>
          s++;
 711:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 714:	0f b6 16             	movzbl (%esi),%edx
 717:	84 d2                	test   %dl,%dl
 719:	75 eb                	jne    706 <printf+0xec>
      state = 0;
 71b:	be 00 00 00 00       	mov    $0x0,%esi
 720:	e9 21 ff ff ff       	jmp    646 <printf+0x2c>
        putc(fd, *ap);
 725:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 728:	0f be 17             	movsbl (%edi),%edx
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	e8 42 fe ff ff       	call   575 <putc>
        ap++;
 733:	83 c7 04             	add    $0x4,%edi
 736:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 739:	be 00 00 00 00       	mov    $0x0,%esi
 73e:	e9 03 ff ff ff       	jmp    646 <printf+0x2c>
        putc(fd, c);
 743:	89 fa                	mov    %edi,%edx
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	e8 28 fe ff ff       	call   575 <putc>
      state = 0;
 74d:	be 00 00 00 00       	mov    $0x0,%esi
 752:	e9 ef fe ff ff       	jmp    646 <printf+0x2c>
        putc(fd, '%');
 757:	ba 25 00 00 00       	mov    $0x25,%edx
 75c:	8b 45 08             	mov    0x8(%ebp),%eax
 75f:	e8 11 fe ff ff       	call   575 <putc>
        putc(fd, c);
 764:	89 fa                	mov    %edi,%edx
 766:	8b 45 08             	mov    0x8(%ebp),%eax
 769:	e8 07 fe ff ff       	call   575 <putc>
      state = 0;
 76e:	be 00 00 00 00       	mov    $0x0,%esi
 773:	e9 ce fe ff ff       	jmp    646 <printf+0x2c>
    }
  }
}
 778:	8d 65 f4             	lea    -0xc(%ebp),%esp
 77b:	5b                   	pop    %ebx
 77c:	5e                   	pop    %esi
 77d:	5f                   	pop    %edi
 77e:	5d                   	pop    %ebp
 77f:	c3                   	ret    

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 789:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78c:	a1 90 0d 00 00       	mov    0xd90,%eax
 791:	eb 02                	jmp    795 <free+0x15>
 793:	89 d0                	mov    %edx,%eax
 795:	39 c8                	cmp    %ecx,%eax
 797:	73 04                	jae    79d <free+0x1d>
 799:	39 08                	cmp    %ecx,(%eax)
 79b:	77 12                	ja     7af <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79d:	8b 10                	mov    (%eax),%edx
 79f:	39 c2                	cmp    %eax,%edx
 7a1:	77 f0                	ja     793 <free+0x13>
 7a3:	39 c8                	cmp    %ecx,%eax
 7a5:	72 08                	jb     7af <free+0x2f>
 7a7:	39 ca                	cmp    %ecx,%edx
 7a9:	77 04                	ja     7af <free+0x2f>
 7ab:	89 d0                	mov    %edx,%eax
 7ad:	eb e6                	jmp    795 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7af:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b5:	8b 10                	mov    (%eax),%edx
 7b7:	39 d7                	cmp    %edx,%edi
 7b9:	74 19                	je     7d4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7bb:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7be:	8b 50 04             	mov    0x4(%eax),%edx
 7c1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c4:	39 ce                	cmp    %ecx,%esi
 7c6:	74 1b                	je     7e3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7c8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7ca:	a3 90 0d 00 00       	mov    %eax,0xd90
}
 7cf:	5b                   	pop    %ebx
 7d0:	5e                   	pop    %esi
 7d1:	5f                   	pop    %edi
 7d2:	5d                   	pop    %ebp
 7d3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7d4:	03 72 04             	add    0x4(%edx),%esi
 7d7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7da:	8b 10                	mov    (%eax),%edx
 7dc:	8b 12                	mov    (%edx),%edx
 7de:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7e1:	eb db                	jmp    7be <free+0x3e>
    p->s.size += bp->s.size;
 7e3:	03 53 fc             	add    -0x4(%ebx),%edx
 7e6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ec:	89 10                	mov    %edx,(%eax)
 7ee:	eb da                	jmp    7ca <free+0x4a>

000007f0 <morecore>:

static Header*
morecore(uint nu)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	53                   	push   %ebx
 7f4:	83 ec 04             	sub    $0x4,%esp
 7f7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7f9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7fe:	77 05                	ja     805 <morecore+0x15>
    nu = 4096;
 800:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 805:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 80c:	83 ec 0c             	sub    $0xc,%esp
 80f:	50                   	push   %eax
 810:	e8 38 fd ff ff       	call   54d <sbrk>
  if(p == (char*)-1)
 815:	83 c4 10             	add    $0x10,%esp
 818:	83 f8 ff             	cmp    $0xffffffff,%eax
 81b:	74 1c                	je     839 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 81d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 820:	83 c0 08             	add    $0x8,%eax
 823:	83 ec 0c             	sub    $0xc,%esp
 826:	50                   	push   %eax
 827:	e8 54 ff ff ff       	call   780 <free>
  return freep;
 82c:	a1 90 0d 00 00       	mov    0xd90,%eax
 831:	83 c4 10             	add    $0x10,%esp
}
 834:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 837:	c9                   	leave  
 838:	c3                   	ret    
    return 0;
 839:	b8 00 00 00 00       	mov    $0x0,%eax
 83e:	eb f4                	jmp    834 <morecore+0x44>

00000840 <malloc>:

void*
malloc(uint nbytes)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	53                   	push   %ebx
 844:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 847:	8b 45 08             	mov    0x8(%ebp),%eax
 84a:	8d 58 07             	lea    0x7(%eax),%ebx
 84d:	c1 eb 03             	shr    $0x3,%ebx
 850:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 853:	8b 0d 90 0d 00 00    	mov    0xd90,%ecx
 859:	85 c9                	test   %ecx,%ecx
 85b:	74 04                	je     861 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85d:	8b 01                	mov    (%ecx),%eax
 85f:	eb 4a                	jmp    8ab <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 861:	c7 05 90 0d 00 00 94 	movl   $0xd94,0xd90
 868:	0d 00 00 
 86b:	c7 05 94 0d 00 00 94 	movl   $0xd94,0xd94
 872:	0d 00 00 
    base.s.size = 0;
 875:	c7 05 98 0d 00 00 00 	movl   $0x0,0xd98
 87c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 87f:	b9 94 0d 00 00       	mov    $0xd94,%ecx
 884:	eb d7                	jmp    85d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 886:	74 19                	je     8a1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 888:	29 da                	sub    %ebx,%edx
 88a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 890:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 893:	89 0d 90 0d 00 00    	mov    %ecx,0xd90
      return (void*)(p + 1);
 899:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 89c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 89f:	c9                   	leave  
 8a0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8a1:	8b 10                	mov    (%eax),%edx
 8a3:	89 11                	mov    %edx,(%ecx)
 8a5:	eb ec                	jmp    893 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a7:	89 c1                	mov    %eax,%ecx
 8a9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8ab:	8b 50 04             	mov    0x4(%eax),%edx
 8ae:	39 da                	cmp    %ebx,%edx
 8b0:	73 d4                	jae    886 <malloc+0x46>
    if(p == freep)
 8b2:	39 05 90 0d 00 00    	cmp    %eax,0xd90
 8b8:	75 ed                	jne    8a7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8ba:	89 d8                	mov    %ebx,%eax
 8bc:	e8 2f ff ff ff       	call   7f0 <morecore>
 8c1:	85 c0                	test   %eax,%eax
 8c3:	75 e2                	jne    8a7 <malloc+0x67>
 8c5:	eb d5                	jmp    89c <malloc+0x5c>
