
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
  36:	68 c4 08 00 00       	push   $0x8c4
  3b:	68 cd 08 00 00       	push   $0x8cd
  40:	6a 01                	push   $0x1
  42:	e8 d0 05 00 00       	call   617 <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 8c 09 00 00       	push   $0x98c
  4f:	68 d5 08 00 00       	push   $0x8d5
  54:	6a 01                	push   $0x1
  56:	e8 bc 05 00 00       	call   617 <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 e9 08 00 00       	push   $0x8e9
  63:	6a 01                	push   $0x1
  65:	e8 ad 05 00 00       	call   617 <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 8c 0d 00 00    	push   0xd8c
  73:	e8 7a 04 00 00       	call   4f2 <kill>
  78:	e8 45 04 00 00       	call   4c2 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 c4 08 00 00       	push   $0x8c4
  84:	68 cd 08 00 00       	push   $0x8cd
  89:	6a 01                	push   $0x1
  8b:	e8 87 05 00 00       	call   617 <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 34 09 00 00       	push   $0x934
  98:	68 d5 08 00 00       	push   $0x8d5
  9d:	6a 01                	push   $0x1
  9f:	e8 73 05 00 00       	call   617 <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 e9 08 00 00       	push   $0x8e9
  ac:	6a 01                	push   $0x1
  ae:	e8 64 05 00 00       	call   617 <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 8c 0d 00 00    	push   0xd8c
  bc:	e8 31 04 00 00       	call   4f2 <kill>
  c1:	e8 fc 03 00 00       	call   4c2 <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 c4 08 00 00       	push   $0x8c4
  cd:	68 cd 08 00 00       	push   $0x8cd
  d2:	6a 01                	push   $0x1
  d4:	e8 3e 05 00 00       	call   617 <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 60 09 00 00       	push   $0x960
  e1:	68 d5 08 00 00       	push   $0x8d5
  e6:	6a 01                	push   $0x1
  e8:	e8 2a 05 00 00       	call   617 <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 e9 08 00 00       	push   $0x8e9
  f5:	6a 01                	push   $0x1
  f7:	e8 1b 05 00 00       	call   617 <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 8c 0d 00 00    	push   0xd8c
 105:	e8 e8 03 00 00       	call   4f2 <kill>
 10a:	e8 b3 03 00 00       	call   4c2 <exit>
   global = 5;
 10f:	c7 05 88 0d 00 00 05 	movl   $0x5,0xd88
 116:	00 00 00 
   exit();
 119:	e8 a4 03 00 00       	call   4c2 <exit>

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
 131:	e8 0c 04 00 00       	call   542 <getpid>
 136:	a3 8c 0d 00 00       	mov    %eax,0xd8c
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 f5 06 00 00       	call   83d <malloc>
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
 171:	e8 ec 03 00 00       	call   562 <clone>
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
 190:	68 0e 09 00 00       	push   $0x90e
 195:	6a 01                	push   $0x1
 197:	e8 7b 04 00 00       	call   617 <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 c3 03 00 00       	call   56a <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 c4 08 00 00       	push   $0x8c4
 1b9:	68 cd 08 00 00       	push   $0x8cd
 1be:	6a 01                	push   $0x1
 1c0:	e8 52 04 00 00       	call   617 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 1b 09 00 00       	push   $0x91b
 1cd:	68 d5 08 00 00       	push   $0x8d5
 1d2:	6a 01                	push   $0x1
 1d4:	e8 3e 04 00 00       	call   617 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 e9 08 00 00       	push   $0x8e9
 1e1:	6a 01                	push   $0x1
 1e3:	e8 2f 04 00 00       	call   617 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 8c 0d 00 00    	push   0xd8c
 1f1:	e8 fc 02 00 00       	call   4f2 <kill>
 1f6:	e8 c7 02 00 00       	call   4c2 <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 c4 08 00 00       	push   $0x8c4
 202:	68 cd 08 00 00       	push   $0x8cd
 207:	6a 01                	push   $0x1
 209:	e8 09 04 00 00       	call   617 <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 f6 08 00 00       	push   $0x8f6
 216:	68 d5 08 00 00       	push   $0x8d5
 21b:	6a 01                	push   $0x1
 21d:	e8 f5 03 00 00       	call   617 <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 e9 08 00 00       	push   $0x8e9
 22a:	6a 01                	push   $0x1
 22c:	e8 e6 03 00 00       	call   617 <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 8c 0d 00 00    	push   0xd8c
 23a:	e8 b3 02 00 00       	call   4f2 <kill>
 23f:	e8 7e 02 00 00       	call   4c2 <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 c4 08 00 00       	push   $0x8c4
 24b:	68 cd 08 00 00       	push   $0x8cd
 250:	6a 01                	push   $0x1
 252:	e8 c0 03 00 00       	call   617 <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 00 09 00 00       	push   $0x900
 25f:	68 d5 08 00 00       	push   $0x8d5
 264:	6a 01                	push   $0x1
 266:	e8 ac 03 00 00       	call   617 <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 e9 08 00 00       	push   $0x8e9
 273:	6a 01                	push   $0x1
 275:	e8 9d 03 00 00       	call   617 <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 8c 0d 00 00    	push   0xd8c
 283:	e8 6a 02 00 00       	call   4f2 <kill>
 288:	e8 35 02 00 00       	call   4c2 <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 e7 04 00 00       	call   77d <free>
   exit();
 296:	e8 27 02 00 00       	call   4c2 <exit>

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
 361:	e8 74 01 00 00       	call   4da <read>
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
 39f:	e8 5e 01 00 00       	call   502 <open>
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
 3b4:	e8 61 01 00 00       	call   51a <fstat>
 3b9:	89 c6                	mov    %eax,%esi
  close(fd);
 3bb:	89 1c 24             	mov    %ebx,(%esp)
 3be:	e8 27 01 00 00       	call   4ea <close>
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

  void* stack = malloc(PGSIZE);
 438:	68 00 10 00 00       	push   $0x1000
 43d:	e8 fb 03 00 00       	call   83d <malloc>

  return clone(start_routine, arg1, arg2, stack);
 442:	50                   	push   %eax
 443:	ff 75 10             	push   0x10(%ebp)
 446:	ff 75 0c             	push   0xc(%ebp)
 449:	ff 75 08             	push   0x8(%ebp)
 44c:	e8 11 01 00 00       	call   562 <clone>
}
 451:	c9                   	leave  
 452:	c3                   	ret    

00000453 <thread_join>:

int thread_join(){
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
 456:	53                   	push   %ebx
 457:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 45a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 45d:	50                   	push   %eax
 45e:	e8 07 01 00 00       	call   56a <join>
  if (x < 0) {
 463:	83 c4 10             	add    $0x10,%esp
 466:	85 c0                	test   %eax,%eax
 468:	78 17                	js     481 <thread_join+0x2e>
 46a:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 46c:	83 ec 0c             	sub    $0xc,%esp
 46f:	ff 75 f4             	push   -0xc(%ebp)
 472:	e8 06 03 00 00       	call   77d <free>
  return x;
 477:	83 c4 10             	add    $0x10,%esp
}
 47a:	89 d8                	mov    %ebx,%eax
 47c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 47f:	c9                   	leave  
 480:	c3                   	ret    
    return -1;
 481:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 486:	eb f2                	jmp    47a <thread_join+0x27>

00000488 <lock_init>:

void lock_init(lock_t *spin){
 488:	55                   	push   %ebp
 489:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 48b:	8b 45 08             	mov    0x8(%ebp),%eax
 48e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 494:	5d                   	pop    %ebp
 495:	c3                   	ret    

00000496 <lock_acquire>:

void lock_acquire(lock_t *spin){
 496:	55                   	push   %ebp
 497:	89 e5                	mov    %esp,%ebp
 499:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 49c:	b8 01 00 00 00       	mov    $0x1,%eax
 4a1:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4a4:	85 c0                	test   %eax,%eax
 4a6:	75 f4                	jne    49c <lock_acquire+0x6>

}
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    

000004aa <lock_release>:

void lock_release(lock_t *spin){
 4aa:	55                   	push   %ebp
 4ab:	89 e5                	mov    %esp,%ebp
 4ad:	8b 55 08             	mov    0x8(%ebp),%edx
 4b0:	b8 00 00 00 00       	mov    $0x0,%eax
 4b5:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ba:	b8 01 00 00 00       	mov    $0x1,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <exit>:
SYSCALL(exit)
 4c2:	b8 02 00 00 00       	mov    $0x2,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <wait>:
SYSCALL(wait)
 4ca:	b8 03 00 00 00       	mov    $0x3,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <pipe>:
SYSCALL(pipe)
 4d2:	b8 04 00 00 00       	mov    $0x4,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <read>:
SYSCALL(read)
 4da:	b8 05 00 00 00       	mov    $0x5,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <write>:
SYSCALL(write)
 4e2:	b8 10 00 00 00       	mov    $0x10,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <close>:
SYSCALL(close)
 4ea:	b8 15 00 00 00       	mov    $0x15,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <kill>:
SYSCALL(kill)
 4f2:	b8 06 00 00 00       	mov    $0x6,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <exec>:
SYSCALL(exec)
 4fa:	b8 07 00 00 00       	mov    $0x7,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <open>:
SYSCALL(open)
 502:	b8 0f 00 00 00       	mov    $0xf,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <mknod>:
SYSCALL(mknod)
 50a:	b8 11 00 00 00       	mov    $0x11,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <unlink>:
SYSCALL(unlink)
 512:	b8 12 00 00 00       	mov    $0x12,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <fstat>:
SYSCALL(fstat)
 51a:	b8 08 00 00 00       	mov    $0x8,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <link>:
SYSCALL(link)
 522:	b8 13 00 00 00       	mov    $0x13,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <mkdir>:
SYSCALL(mkdir)
 52a:	b8 14 00 00 00       	mov    $0x14,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <chdir>:
SYSCALL(chdir)
 532:	b8 09 00 00 00       	mov    $0x9,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <dup>:
SYSCALL(dup)
 53a:	b8 0a 00 00 00       	mov    $0xa,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <getpid>:
SYSCALL(getpid)
 542:	b8 0b 00 00 00       	mov    $0xb,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <sbrk>:
SYSCALL(sbrk)
 54a:	b8 0c 00 00 00       	mov    $0xc,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <sleep>:
SYSCALL(sleep)
 552:	b8 0d 00 00 00       	mov    $0xd,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <uptime>:
SYSCALL(uptime)
 55a:	b8 0e 00 00 00       	mov    $0xe,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <clone>:
SYSCALL(clone)
 562:	b8 16 00 00 00       	mov    $0x16,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <join>:
 56a:	b8 17 00 00 00       	mov    $0x17,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 572:	55                   	push   %ebp
 573:	89 e5                	mov    %esp,%ebp
 575:	83 ec 1c             	sub    $0x1c,%esp
 578:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 57b:	6a 01                	push   $0x1
 57d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 580:	52                   	push   %edx
 581:	50                   	push   %eax
 582:	e8 5b ff ff ff       	call   4e2 <write>
}
 587:	83 c4 10             	add    $0x10,%esp
 58a:	c9                   	leave  
 58b:	c3                   	ret    

0000058c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 58c:	55                   	push   %ebp
 58d:	89 e5                	mov    %esp,%ebp
 58f:	57                   	push   %edi
 590:	56                   	push   %esi
 591:	53                   	push   %ebx
 592:	83 ec 2c             	sub    $0x2c,%esp
 595:	89 45 d0             	mov    %eax,-0x30(%ebp)
 598:	89 d0                	mov    %edx,%eax
 59a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 59c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5a0:	0f 95 c1             	setne  %cl
 5a3:	c1 ea 1f             	shr    $0x1f,%edx
 5a6:	84 d1                	test   %dl,%cl
 5a8:	74 44                	je     5ee <printint+0x62>
    neg = 1;
    x = -xx;
 5aa:	f7 d8                	neg    %eax
 5ac:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5ae:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5b5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5ba:	89 c8                	mov    %ecx,%eax
 5bc:	ba 00 00 00 00       	mov    $0x0,%edx
 5c1:	f7 f6                	div    %esi
 5c3:	89 df                	mov    %ebx,%edi
 5c5:	83 c3 01             	add    $0x1,%ebx
 5c8:	0f b6 92 1c 0a 00 00 	movzbl 0xa1c(%edx),%edx
 5cf:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5d3:	89 ca                	mov    %ecx,%edx
 5d5:	89 c1                	mov    %eax,%ecx
 5d7:	39 d6                	cmp    %edx,%esi
 5d9:	76 df                	jbe    5ba <printint+0x2e>
  if(neg)
 5db:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5df:	74 31                	je     612 <printint+0x86>
    buf[i++] = '-';
 5e1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5e6:	8d 5f 02             	lea    0x2(%edi),%ebx
 5e9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ec:	eb 17                	jmp    605 <printint+0x79>
    x = xx;
 5ee:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5f0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5f7:	eb bc                	jmp    5b5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5f9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5fe:	89 f0                	mov    %esi,%eax
 600:	e8 6d ff ff ff       	call   572 <putc>
  while(--i >= 0)
 605:	83 eb 01             	sub    $0x1,%ebx
 608:	79 ef                	jns    5f9 <printint+0x6d>
}
 60a:	83 c4 2c             	add    $0x2c,%esp
 60d:	5b                   	pop    %ebx
 60e:	5e                   	pop    %esi
 60f:	5f                   	pop    %edi
 610:	5d                   	pop    %ebp
 611:	c3                   	ret    
 612:	8b 75 d0             	mov    -0x30(%ebp),%esi
 615:	eb ee                	jmp    605 <printint+0x79>

00000617 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 617:	55                   	push   %ebp
 618:	89 e5                	mov    %esp,%ebp
 61a:	57                   	push   %edi
 61b:	56                   	push   %esi
 61c:	53                   	push   %ebx
 61d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 620:	8d 45 10             	lea    0x10(%ebp),%eax
 623:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 626:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 62b:	bb 00 00 00 00       	mov    $0x0,%ebx
 630:	eb 14                	jmp    646 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 632:	89 fa                	mov    %edi,%edx
 634:	8b 45 08             	mov    0x8(%ebp),%eax
 637:	e8 36 ff ff ff       	call   572 <putc>
 63c:	eb 05                	jmp    643 <printf+0x2c>
      }
    } else if(state == '%'){
 63e:	83 fe 25             	cmp    $0x25,%esi
 641:	74 25                	je     668 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 643:	83 c3 01             	add    $0x1,%ebx
 646:	8b 45 0c             	mov    0xc(%ebp),%eax
 649:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 64d:	84 c0                	test   %al,%al
 64f:	0f 84 20 01 00 00    	je     775 <printf+0x15e>
    c = fmt[i] & 0xff;
 655:	0f be f8             	movsbl %al,%edi
 658:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 65b:	85 f6                	test   %esi,%esi
 65d:	75 df                	jne    63e <printf+0x27>
      if(c == '%'){
 65f:	83 f8 25             	cmp    $0x25,%eax
 662:	75 ce                	jne    632 <printf+0x1b>
        state = '%';
 664:	89 c6                	mov    %eax,%esi
 666:	eb db                	jmp    643 <printf+0x2c>
      if(c == 'd'){
 668:	83 f8 25             	cmp    $0x25,%eax
 66b:	0f 84 cf 00 00 00    	je     740 <printf+0x129>
 671:	0f 8c dd 00 00 00    	jl     754 <printf+0x13d>
 677:	83 f8 78             	cmp    $0x78,%eax
 67a:	0f 8f d4 00 00 00    	jg     754 <printf+0x13d>
 680:	83 f8 63             	cmp    $0x63,%eax
 683:	0f 8c cb 00 00 00    	jl     754 <printf+0x13d>
 689:	83 e8 63             	sub    $0x63,%eax
 68c:	83 f8 15             	cmp    $0x15,%eax
 68f:	0f 87 bf 00 00 00    	ja     754 <printf+0x13d>
 695:	ff 24 85 c4 09 00 00 	jmp    *0x9c4(,%eax,4)
        printint(fd, *ap, 10, 1);
 69c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 69f:	8b 17                	mov    (%edi),%edx
 6a1:	83 ec 0c             	sub    $0xc,%esp
 6a4:	6a 01                	push   $0x1
 6a6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	e8 d9 fe ff ff       	call   58c <printint>
        ap++;
 6b3:	83 c7 04             	add    $0x4,%edi
 6b6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6bc:	be 00 00 00 00       	mov    $0x0,%esi
 6c1:	eb 80                	jmp    643 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6c3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c6:	8b 17                	mov    (%edi),%edx
 6c8:	83 ec 0c             	sub    $0xc,%esp
 6cb:	6a 00                	push   $0x0
 6cd:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d2:	8b 45 08             	mov    0x8(%ebp),%eax
 6d5:	e8 b2 fe ff ff       	call   58c <printint>
        ap++;
 6da:	83 c7 04             	add    $0x4,%edi
 6dd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6e0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6e3:	be 00 00 00 00       	mov    $0x0,%esi
 6e8:	e9 56 ff ff ff       	jmp    643 <printf+0x2c>
        s = (char*)*ap;
 6ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f0:	8b 30                	mov    (%eax),%esi
        ap++;
 6f2:	83 c0 04             	add    $0x4,%eax
 6f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6f8:	85 f6                	test   %esi,%esi
 6fa:	75 15                	jne    711 <printf+0xfa>
          s = "(null)";
 6fc:	be ba 09 00 00       	mov    $0x9ba,%esi
 701:	eb 0e                	jmp    711 <printf+0xfa>
          putc(fd, *s);
 703:	0f be d2             	movsbl %dl,%edx
 706:	8b 45 08             	mov    0x8(%ebp),%eax
 709:	e8 64 fe ff ff       	call   572 <putc>
          s++;
 70e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 711:	0f b6 16             	movzbl (%esi),%edx
 714:	84 d2                	test   %dl,%dl
 716:	75 eb                	jne    703 <printf+0xec>
      state = 0;
 718:	be 00 00 00 00       	mov    $0x0,%esi
 71d:	e9 21 ff ff ff       	jmp    643 <printf+0x2c>
        putc(fd, *ap);
 722:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 725:	0f be 17             	movsbl (%edi),%edx
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	e8 42 fe ff ff       	call   572 <putc>
        ap++;
 730:	83 c7 04             	add    $0x4,%edi
 733:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 736:	be 00 00 00 00       	mov    $0x0,%esi
 73b:	e9 03 ff ff ff       	jmp    643 <printf+0x2c>
        putc(fd, c);
 740:	89 fa                	mov    %edi,%edx
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	e8 28 fe ff ff       	call   572 <putc>
      state = 0;
 74a:	be 00 00 00 00       	mov    $0x0,%esi
 74f:	e9 ef fe ff ff       	jmp    643 <printf+0x2c>
        putc(fd, '%');
 754:	ba 25 00 00 00       	mov    $0x25,%edx
 759:	8b 45 08             	mov    0x8(%ebp),%eax
 75c:	e8 11 fe ff ff       	call   572 <putc>
        putc(fd, c);
 761:	89 fa                	mov    %edi,%edx
 763:	8b 45 08             	mov    0x8(%ebp),%eax
 766:	e8 07 fe ff ff       	call   572 <putc>
      state = 0;
 76b:	be 00 00 00 00       	mov    $0x0,%esi
 770:	e9 ce fe ff ff       	jmp    643 <printf+0x2c>
    }
  }
}
 775:	8d 65 f4             	lea    -0xc(%ebp),%esp
 778:	5b                   	pop    %ebx
 779:	5e                   	pop    %esi
 77a:	5f                   	pop    %edi
 77b:	5d                   	pop    %ebp
 77c:	c3                   	ret    

0000077d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 77d:	55                   	push   %ebp
 77e:	89 e5                	mov    %esp,%ebp
 780:	57                   	push   %edi
 781:	56                   	push   %esi
 782:	53                   	push   %ebx
 783:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 786:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 789:	a1 90 0d 00 00       	mov    0xd90,%eax
 78e:	eb 02                	jmp    792 <free+0x15>
 790:	89 d0                	mov    %edx,%eax
 792:	39 c8                	cmp    %ecx,%eax
 794:	73 04                	jae    79a <free+0x1d>
 796:	39 08                	cmp    %ecx,(%eax)
 798:	77 12                	ja     7ac <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79a:	8b 10                	mov    (%eax),%edx
 79c:	39 c2                	cmp    %eax,%edx
 79e:	77 f0                	ja     790 <free+0x13>
 7a0:	39 c8                	cmp    %ecx,%eax
 7a2:	72 08                	jb     7ac <free+0x2f>
 7a4:	39 ca                	cmp    %ecx,%edx
 7a6:	77 04                	ja     7ac <free+0x2f>
 7a8:	89 d0                	mov    %edx,%eax
 7aa:	eb e6                	jmp    792 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ac:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7af:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b2:	8b 10                	mov    (%eax),%edx
 7b4:	39 d7                	cmp    %edx,%edi
 7b6:	74 19                	je     7d1 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7b8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bb:	8b 50 04             	mov    0x4(%eax),%edx
 7be:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c1:	39 ce                	cmp    %ecx,%esi
 7c3:	74 1b                	je     7e0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7c5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7c7:	a3 90 0d 00 00       	mov    %eax,0xd90
}
 7cc:	5b                   	pop    %ebx
 7cd:	5e                   	pop    %esi
 7ce:	5f                   	pop    %edi
 7cf:	5d                   	pop    %ebp
 7d0:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7d1:	03 72 04             	add    0x4(%edx),%esi
 7d4:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d7:	8b 10                	mov    (%eax),%edx
 7d9:	8b 12                	mov    (%edx),%edx
 7db:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7de:	eb db                	jmp    7bb <free+0x3e>
    p->s.size += bp->s.size;
 7e0:	03 53 fc             	add    -0x4(%ebx),%edx
 7e3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7e9:	89 10                	mov    %edx,(%eax)
 7eb:	eb da                	jmp    7c7 <free+0x4a>

000007ed <morecore>:

static Header*
morecore(uint nu)
{
 7ed:	55                   	push   %ebp
 7ee:	89 e5                	mov    %esp,%ebp
 7f0:	53                   	push   %ebx
 7f1:	83 ec 04             	sub    $0x4,%esp
 7f4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7f6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7fb:	77 05                	ja     802 <morecore+0x15>
    nu = 4096;
 7fd:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 802:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 809:	83 ec 0c             	sub    $0xc,%esp
 80c:	50                   	push   %eax
 80d:	e8 38 fd ff ff       	call   54a <sbrk>
  if(p == (char*)-1)
 812:	83 c4 10             	add    $0x10,%esp
 815:	83 f8 ff             	cmp    $0xffffffff,%eax
 818:	74 1c                	je     836 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 81a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 81d:	83 c0 08             	add    $0x8,%eax
 820:	83 ec 0c             	sub    $0xc,%esp
 823:	50                   	push   %eax
 824:	e8 54 ff ff ff       	call   77d <free>
  return freep;
 829:	a1 90 0d 00 00       	mov    0xd90,%eax
 82e:	83 c4 10             	add    $0x10,%esp
}
 831:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 834:	c9                   	leave  
 835:	c3                   	ret    
    return 0;
 836:	b8 00 00 00 00       	mov    $0x0,%eax
 83b:	eb f4                	jmp    831 <morecore+0x44>

0000083d <malloc>:

void*
malloc(uint nbytes)
{
 83d:	55                   	push   %ebp
 83e:	89 e5                	mov    %esp,%ebp
 840:	53                   	push   %ebx
 841:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 844:	8b 45 08             	mov    0x8(%ebp),%eax
 847:	8d 58 07             	lea    0x7(%eax),%ebx
 84a:	c1 eb 03             	shr    $0x3,%ebx
 84d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 850:	8b 0d 90 0d 00 00    	mov    0xd90,%ecx
 856:	85 c9                	test   %ecx,%ecx
 858:	74 04                	je     85e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85a:	8b 01                	mov    (%ecx),%eax
 85c:	eb 4a                	jmp    8a8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 85e:	c7 05 90 0d 00 00 94 	movl   $0xd94,0xd90
 865:	0d 00 00 
 868:	c7 05 94 0d 00 00 94 	movl   $0xd94,0xd94
 86f:	0d 00 00 
    base.s.size = 0;
 872:	c7 05 98 0d 00 00 00 	movl   $0x0,0xd98
 879:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 87c:	b9 94 0d 00 00       	mov    $0xd94,%ecx
 881:	eb d7                	jmp    85a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 883:	74 19                	je     89e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 885:	29 da                	sub    %ebx,%edx
 887:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 88d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 890:	89 0d 90 0d 00 00    	mov    %ecx,0xd90
      return (void*)(p + 1);
 896:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 899:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 89c:	c9                   	leave  
 89d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 89e:	8b 10                	mov    (%eax),%edx
 8a0:	89 11                	mov    %edx,(%ecx)
 8a2:	eb ec                	jmp    890 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a4:	89 c1                	mov    %eax,%ecx
 8a6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8a8:	8b 50 04             	mov    0x4(%eax),%edx
 8ab:	39 da                	cmp    %ebx,%edx
 8ad:	73 d4                	jae    883 <malloc+0x46>
    if(p == freep)
 8af:	39 05 90 0d 00 00    	cmp    %eax,0xd90
 8b5:	75 ed                	jne    8a4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8b7:	89 d8                	mov    %ebx,%eax
 8b9:	e8 2f ff ff ff       	call   7ed <morecore>
 8be:	85 c0                	test   %eax,%eax
 8c0:	75 e2                	jne    8a4 <malloc+0x67>
 8c2:	eb d5                	jmp    899 <malloc+0x5c>
