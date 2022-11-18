
_test_8:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 50 0e 00 00       	mov    0xe50,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 c4 09 00 00       	push   $0x9c4
  31:	68 cd 09 00 00       	push   $0x9cd
  36:	6a 01                	push   $0x1
  38:	e8 d8 06 00 00       	call   715 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 0c 0a 00 00       	push   $0xa0c
  45:	68 e0 09 00 00       	push   $0x9e0
  4a:	6a 01                	push   $0x1
  4c:	e8 c4 06 00 00       	call   715 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 f4 09 00 00       	push   $0x9f4
  59:	6a 01                	push   $0x1
  5b:	e8 b5 06 00 00       	call   715 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 54 0e 00 00    	push   0xe54
  69:	e8 82 05 00 00       	call   5f0 <kill>
  6e:	e8 4d 05 00 00       	call   5c0 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 c4 09 00 00       	push   $0x9c4
  7a:	68 cd 09 00 00       	push   $0x9cd
  7f:	6a 01                	push   $0x1
  81:	e8 8f 06 00 00       	call   715 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 d5 09 00 00       	push   $0x9d5
  8e:	68 e0 09 00 00       	push   $0x9e0
  93:	6a 01                	push   $0x1
  95:	e8 7b 06 00 00       	call   715 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 f4 09 00 00       	push   $0x9f4
  a2:	6a 01                	push   $0x1
  a4:	e8 6c 06 00 00       	call   715 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 54 0e 00 00    	push   0xe54
  b2:	e8 39 05 00 00       	call   5f0 <kill>
  b7:	e8 04 05 00 00       	call   5c0 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 c4 09 00 00       	push   $0x9c4
  c3:	68 cd 09 00 00       	push   $0x9cd
  c8:	6a 01                	push   $0x1
  ca:	e8 46 06 00 00       	call   715 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 01 0a 00 00       	push   $0xa01
  d7:	68 e0 09 00 00       	push   $0x9e0
  dc:	6a 01                	push   $0x1
  de:	e8 32 06 00 00       	call   715 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 f4 09 00 00       	push   $0x9f4
  eb:	6a 01                	push   $0x1
  ed:	e8 23 06 00 00       	call   715 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 54 0e 00 00    	push   0xe54
  fb:	e8 f0 04 00 00       	call   5f0 <kill>
 100:	e8 bb 04 00 00       	call   5c0 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 50 0e 00 00       	mov    %eax,0xe50
   exit();
 10d:	e8 ae 04 00 00       	call   5c0 <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 15 05 00 00       	call   640 <getpid>
 12b:	a3 54 0e 00 00       	mov    %eax,0xe54
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 fe 07 00 00       	call   93b <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 c4 09 00 00       	push   $0x9c4
 15f:	68 cd 09 00 00       	push   $0x9cd
 164:	6a 01                	push   $0x1
 166:	e8 aa 05 00 00       	call   715 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 18 0a 00 00       	push   $0xa18
 173:	68 e0 09 00 00       	push   $0x9e0
 178:	6a 01                	push   $0x1
 17a:	e8 96 05 00 00       	call   715 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 f4 09 00 00       	push   $0x9f4
 187:	6a 01                	push   $0x1
 189:	e8 87 05 00 00       	call   715 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 54 0e 00 00    	push   0xe54
 197:	e8 54 04 00 00       	call   5f0 <kill>
 19c:	e8 1f 04 00 00       	call   5c0 <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 9c 04 00 00       	call   660 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 76 04 00 00       	call   650 <sleep>
   assert(wait() == -1);
 1da:	e8 e9 03 00 00       	call   5c8 <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 c4 09 00 00       	push   $0x9c4
 1f2:	68 cd 09 00 00       	push   $0x9cd
 1f7:	6a 01                	push   $0x1
 1f9:	e8 17 05 00 00       	call   715 <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 30 0a 00 00       	push   $0xa30
 206:	68 e0 09 00 00       	push   $0x9e0
 20b:	6a 01                	push   $0x1
 20d:	e8 03 05 00 00       	call   715 <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 f4 09 00 00       	push   $0x9f4
 21a:	6a 01                	push   $0x1
 21c:	e8 f4 04 00 00       	call   715 <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 54 0e 00 00    	push   0xe54
 22a:	e8 c1 03 00 00       	call   5f0 <kill>
 22f:	e8 8c 03 00 00       	call   5c0 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 c4 09 00 00       	push   $0x9c4
 23b:	68 cd 09 00 00       	push   $0x9cd
 240:	6a 01                	push   $0x1
 242:	e8 ce 04 00 00       	call   715 <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 22 0a 00 00       	push   $0xa22
 24f:	68 e0 09 00 00       	push   $0x9e0
 254:	6a 01                	push   $0x1
 256:	e8 ba 04 00 00       	call   715 <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 f4 09 00 00       	push   $0x9f4
 263:	6a 01                	push   $0x1
 265:	e8 ab 04 00 00       	call   715 <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 54 0e 00 00    	push   0xe54
 273:	e8 78 03 00 00       	call   5f0 <kill>
 278:	e8 43 03 00 00       	call   5c0 <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 df 03 00 00       	call   668 <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 c4 09 00 00       	push   $0x9c4
 2a0:	68 cd 09 00 00       	push   $0x9cd
 2a5:	6a 01                	push   $0x1
 2a7:	e8 69 04 00 00       	call   715 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 53 0a 00 00       	push   $0xa53
 2b4:	68 e0 09 00 00       	push   $0x9e0
 2b9:	6a 01                	push   $0x1
 2bb:	e8 55 04 00 00       	call   715 <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 f4 09 00 00       	push   $0x9f4
 2c8:	6a 01                	push   $0x1
 2ca:	e8 46 04 00 00       	call   715 <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 54 0e 00 00    	push   0xe54
 2d8:	e8 13 03 00 00       	call   5f0 <kill>
 2dd:	e8 de 02 00 00       	call   5c0 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 c4 09 00 00       	push   $0x9c4
 2e9:	68 cd 09 00 00       	push   $0x9cd
 2ee:	6a 01                	push   $0x1
 2f0:	e8 20 04 00 00       	call   715 <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 3d 0a 00 00       	push   $0xa3d
 2fd:	68 e0 09 00 00       	push   $0x9e0
 302:	6a 01                	push   $0x1
 304:	e8 0c 04 00 00       	call   715 <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 f4 09 00 00       	push   $0x9f4
 311:	6a 01                	push   $0x1
 313:	e8 fd 03 00 00       	call   715 <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 54 0e 00 00    	push   0xe54
 321:	e8 ca 02 00 00       	call   5f0 <kill>
 326:	e8 95 02 00 00       	call   5c0 <exit>
   assert(global == 2);
 32b:	83 3d 50 0e 00 00 02 	cmpl   $0x2,0xe50
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 c4 09 00 00       	push   $0x9c4
 33b:	68 cd 09 00 00       	push   $0x9cd
 340:	6a 01                	push   $0x1
 342:	e8 ce 03 00 00       	call   715 <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 67 0a 00 00       	push   $0xa67
 34f:	68 e0 09 00 00       	push   $0x9e0
 354:	6a 01                	push   $0x1
 356:	e8 ba 03 00 00       	call   715 <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 f4 09 00 00       	push   $0x9f4
 363:	6a 01                	push   $0x1
 365:	e8 ab 03 00 00       	call   715 <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 54 0e 00 00    	push   0xe54
 373:	e8 78 02 00 00       	call   5f0 <kill>
 378:	e8 43 02 00 00       	call   5c0 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 73 0a 00 00       	push   $0xa73
 385:	6a 01                	push   $0x1
 387:	e8 89 03 00 00       	call   715 <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 e7 04 00 00       	call   87b <free>
   exit();
 394:	e8 27 02 00 00       	call   5c0 <exit>

00000399 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	8b 75 08             	mov    0x8(%ebp),%esi
 3a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3a4:	89 f0                	mov    %esi,%eax
 3a6:	89 d1                	mov    %edx,%ecx
 3a8:	83 c2 01             	add    $0x1,%edx
 3ab:	89 c3                	mov    %eax,%ebx
 3ad:	83 c0 01             	add    $0x1,%eax
 3b0:	0f b6 09             	movzbl (%ecx),%ecx
 3b3:	88 0b                	mov    %cl,(%ebx)
 3b5:	84 c9                	test   %cl,%cl
 3b7:	75 ed                	jne    3a6 <strcpy+0xd>
    ;
  return os;
}
 3b9:	89 f0                	mov    %esi,%eax
 3bb:	5b                   	pop    %ebx
 3bc:	5e                   	pop    %esi
 3bd:	5d                   	pop    %ebp
 3be:	c3                   	ret    

000003bf <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3c8:	eb 06                	jmp    3d0 <strcmp+0x11>
    p++, q++;
 3ca:	83 c1 01             	add    $0x1,%ecx
 3cd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3d0:	0f b6 01             	movzbl (%ecx),%eax
 3d3:	84 c0                	test   %al,%al
 3d5:	74 04                	je     3db <strcmp+0x1c>
 3d7:	3a 02                	cmp    (%edx),%al
 3d9:	74 ef                	je     3ca <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3db:	0f b6 c0             	movzbl %al,%eax
 3de:	0f b6 12             	movzbl (%edx),%edx
 3e1:	29 d0                	sub    %edx,%eax
}
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <strlen>:

uint
strlen(const char *s)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3eb:	b8 00 00 00 00       	mov    $0x0,%eax
 3f0:	eb 03                	jmp    3f5 <strlen+0x10>
 3f2:	83 c0 01             	add    $0x1,%eax
 3f5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3f9:	75 f7                	jne    3f2 <strlen+0xd>
    ;
  return n;
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    

000003fd <memset>:

void*
memset(void *dst, int c, uint n)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	57                   	push   %edi
 401:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 404:	89 d7                	mov    %edx,%edi
 406:	8b 4d 10             	mov    0x10(%ebp),%ecx
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	fc                   	cld    
 40d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 40f:	89 d0                	mov    %edx,%eax
 411:	8b 7d fc             	mov    -0x4(%ebp),%edi
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <strchr>:

char*
strchr(const char *s, char c)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 420:	eb 03                	jmp    425 <strchr+0xf>
 422:	83 c0 01             	add    $0x1,%eax
 425:	0f b6 10             	movzbl (%eax),%edx
 428:	84 d2                	test   %dl,%dl
 42a:	74 06                	je     432 <strchr+0x1c>
    if(*s == c)
 42c:	38 ca                	cmp    %cl,%dl
 42e:	75 f2                	jne    422 <strchr+0xc>
 430:	eb 05                	jmp    437 <strchr+0x21>
      return (char*)s;
  return 0;
 432:	b8 00 00 00 00       	mov    $0x0,%eax
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    

00000439 <gets>:

char*
gets(char *buf, int max)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	83 ec 1c             	sub    $0x1c,%esp
 442:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 445:	bb 00 00 00 00       	mov    $0x0,%ebx
 44a:	89 de                	mov    %ebx,%esi
 44c:	83 c3 01             	add    $0x1,%ebx
 44f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 452:	7d 2e                	jge    482 <gets+0x49>
    cc = read(0, &c, 1);
 454:	83 ec 04             	sub    $0x4,%esp
 457:	6a 01                	push   $0x1
 459:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45c:	50                   	push   %eax
 45d:	6a 00                	push   $0x0
 45f:	e8 74 01 00 00       	call   5d8 <read>
    if(cc < 1)
 464:	83 c4 10             	add    $0x10,%esp
 467:	85 c0                	test   %eax,%eax
 469:	7e 17                	jle    482 <gets+0x49>
      break;
    buf[i++] = c;
 46b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 46f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 472:	3c 0a                	cmp    $0xa,%al
 474:	0f 94 c2             	sete   %dl
 477:	3c 0d                	cmp    $0xd,%al
 479:	0f 94 c0             	sete   %al
 47c:	08 c2                	or     %al,%dl
 47e:	74 ca                	je     44a <gets+0x11>
    buf[i++] = c;
 480:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 482:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 486:	89 f8                	mov    %edi,%eax
 488:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48b:	5b                   	pop    %ebx
 48c:	5e                   	pop    %esi
 48d:	5f                   	pop    %edi
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <stat>:

int
stat(const char *n, struct stat *st)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	56                   	push   %esi
 494:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 495:	83 ec 08             	sub    $0x8,%esp
 498:	6a 00                	push   $0x0
 49a:	ff 75 08             	push   0x8(%ebp)
 49d:	e8 5e 01 00 00       	call   600 <open>
  if(fd < 0)
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	85 c0                	test   %eax,%eax
 4a7:	78 24                	js     4cd <stat+0x3d>
 4a9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4ab:	83 ec 08             	sub    $0x8,%esp
 4ae:	ff 75 0c             	push   0xc(%ebp)
 4b1:	50                   	push   %eax
 4b2:	e8 61 01 00 00       	call   618 <fstat>
 4b7:	89 c6                	mov    %eax,%esi
  close(fd);
 4b9:	89 1c 24             	mov    %ebx,(%esp)
 4bc:	e8 27 01 00 00       	call   5e8 <close>
  return r;
 4c1:	83 c4 10             	add    $0x10,%esp
}
 4c4:	89 f0                	mov    %esi,%eax
 4c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
    return -1;
 4cd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4d2:	eb f0                	jmp    4c4 <stat+0x34>

000004d4 <atoi>:

int
atoi(const char *s)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	53                   	push   %ebx
 4d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4db:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4e0:	eb 10                	jmp    4f2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4e2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4e5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4e8:	83 c1 01             	add    $0x1,%ecx
 4eb:	0f be c0             	movsbl %al,%eax
 4ee:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4f2:	0f b6 01             	movzbl (%ecx),%eax
 4f5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4f8:	80 fb 09             	cmp    $0x9,%bl
 4fb:	76 e5                	jbe    4e2 <atoi+0xe>
  return n;
}
 4fd:	89 d0                	mov    %edx,%eax
 4ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 502:	c9                   	leave  
 503:	c3                   	ret    

00000504 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	56                   	push   %esi
 508:	53                   	push   %ebx
 509:	8b 75 08             	mov    0x8(%ebp),%esi
 50c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 50f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 512:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 514:	eb 0d                	jmp    523 <memmove+0x1f>
    *dst++ = *src++;
 516:	0f b6 01             	movzbl (%ecx),%eax
 519:	88 02                	mov    %al,(%edx)
 51b:	8d 49 01             	lea    0x1(%ecx),%ecx
 51e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 521:	89 d8                	mov    %ebx,%eax
 523:	8d 58 ff             	lea    -0x1(%eax),%ebx
 526:	85 c0                	test   %eax,%eax
 528:	7f ec                	jg     516 <memmove+0x12>
  return vdst;
}
 52a:	89 f0                	mov    %esi,%eax
 52c:	5b                   	pop    %ebx
 52d:	5e                   	pop    %esi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

00000530 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 536:	68 00 10 00 00       	push   $0x1000
 53b:	e8 fb 03 00 00       	call   93b <malloc>

  return clone(start_routine, arg1, arg2, stack);
 540:	50                   	push   %eax
 541:	ff 75 10             	push   0x10(%ebp)
 544:	ff 75 0c             	push   0xc(%ebp)
 547:	ff 75 08             	push   0x8(%ebp)
 54a:	e8 11 01 00 00       	call   660 <clone>
}
 54f:	c9                   	leave  
 550:	c3                   	ret    

00000551 <thread_join>:

int thread_join(){
 551:	55                   	push   %ebp
 552:	89 e5                	mov    %esp,%ebp
 554:	53                   	push   %ebx
 555:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 558:	8d 45 f4             	lea    -0xc(%ebp),%eax
 55b:	50                   	push   %eax
 55c:	e8 07 01 00 00       	call   668 <join>
  if (x < 0) {
 561:	83 c4 10             	add    $0x10,%esp
 564:	85 c0                	test   %eax,%eax
 566:	78 17                	js     57f <thread_join+0x2e>
 568:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 56a:	83 ec 0c             	sub    $0xc,%esp
 56d:	ff 75 f4             	push   -0xc(%ebp)
 570:	e8 06 03 00 00       	call   87b <free>
  return x;
 575:	83 c4 10             	add    $0x10,%esp
}
 578:	89 d8                	mov    %ebx,%eax
 57a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 57d:	c9                   	leave  
 57e:	c3                   	ret    
    return -1;
 57f:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 584:	eb f2                	jmp    578 <thread_join+0x27>

00000586 <lock_init>:

void lock_init(lock_t *spin){
 586:	55                   	push   %ebp
 587:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    

00000594 <lock_acquire>:

void lock_acquire(lock_t *spin){
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 59a:	b8 01 00 00 00       	mov    $0x1,%eax
 59f:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 5a2:	85 c0                	test   %eax,%eax
 5a4:	75 f4                	jne    59a <lock_acquire+0x6>

}
 5a6:	5d                   	pop    %ebp
 5a7:	c3                   	ret    

000005a8 <lock_release>:

void lock_release(lock_t *spin){
 5a8:	55                   	push   %ebp
 5a9:	89 e5                	mov    %esp,%ebp
 5ab:	8b 55 08             	mov    0x8(%ebp),%edx
 5ae:	b8 00 00 00 00       	mov    $0x0,%eax
 5b3:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    

000005b8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5b8:	b8 01 00 00 00       	mov    $0x1,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <exit>:
SYSCALL(exit)
 5c0:	b8 02 00 00 00       	mov    $0x2,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <wait>:
SYSCALL(wait)
 5c8:	b8 03 00 00 00       	mov    $0x3,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <pipe>:
SYSCALL(pipe)
 5d0:	b8 04 00 00 00       	mov    $0x4,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <read>:
SYSCALL(read)
 5d8:	b8 05 00 00 00       	mov    $0x5,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <write>:
SYSCALL(write)
 5e0:	b8 10 00 00 00       	mov    $0x10,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <close>:
SYSCALL(close)
 5e8:	b8 15 00 00 00       	mov    $0x15,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <kill>:
SYSCALL(kill)
 5f0:	b8 06 00 00 00       	mov    $0x6,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <exec>:
SYSCALL(exec)
 5f8:	b8 07 00 00 00       	mov    $0x7,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <open>:
SYSCALL(open)
 600:	b8 0f 00 00 00       	mov    $0xf,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <mknod>:
SYSCALL(mknod)
 608:	b8 11 00 00 00       	mov    $0x11,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <unlink>:
SYSCALL(unlink)
 610:	b8 12 00 00 00       	mov    $0x12,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <fstat>:
SYSCALL(fstat)
 618:	b8 08 00 00 00       	mov    $0x8,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <link>:
SYSCALL(link)
 620:	b8 13 00 00 00       	mov    $0x13,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <mkdir>:
SYSCALL(mkdir)
 628:	b8 14 00 00 00       	mov    $0x14,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <chdir>:
SYSCALL(chdir)
 630:	b8 09 00 00 00       	mov    $0x9,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <dup>:
SYSCALL(dup)
 638:	b8 0a 00 00 00       	mov    $0xa,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <getpid>:
SYSCALL(getpid)
 640:	b8 0b 00 00 00       	mov    $0xb,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <sbrk>:
SYSCALL(sbrk)
 648:	b8 0c 00 00 00       	mov    $0xc,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <sleep>:
SYSCALL(sleep)
 650:	b8 0d 00 00 00       	mov    $0xd,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <uptime>:
SYSCALL(uptime)
 658:	b8 0e 00 00 00       	mov    $0xe,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <clone>:
SYSCALL(clone)
 660:	b8 16 00 00 00       	mov    $0x16,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <join>:
 668:	b8 17 00 00 00       	mov    $0x17,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	83 ec 1c             	sub    $0x1c,%esp
 676:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 679:	6a 01                	push   $0x1
 67b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 67e:	52                   	push   %edx
 67f:	50                   	push   %eax
 680:	e8 5b ff ff ff       	call   5e0 <write>
}
 685:	83 c4 10             	add    $0x10,%esp
 688:	c9                   	leave  
 689:	c3                   	ret    

0000068a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 68a:	55                   	push   %ebp
 68b:	89 e5                	mov    %esp,%ebp
 68d:	57                   	push   %edi
 68e:	56                   	push   %esi
 68f:	53                   	push   %ebx
 690:	83 ec 2c             	sub    $0x2c,%esp
 693:	89 45 d0             	mov    %eax,-0x30(%ebp)
 696:	89 d0                	mov    %edx,%eax
 698:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 69a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 69e:	0f 95 c1             	setne  %cl
 6a1:	c1 ea 1f             	shr    $0x1f,%edx
 6a4:	84 d1                	test   %dl,%cl
 6a6:	74 44                	je     6ec <printint+0x62>
    neg = 1;
    x = -xx;
 6a8:	f7 d8                	neg    %eax
 6aa:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6ac:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6b3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6b8:	89 c8                	mov    %ecx,%eax
 6ba:	ba 00 00 00 00       	mov    $0x0,%edx
 6bf:	f7 f6                	div    %esi
 6c1:	89 df                	mov    %ebx,%edi
 6c3:	83 c3 01             	add    $0x1,%ebx
 6c6:	0f b6 92 e0 0a 00 00 	movzbl 0xae0(%edx),%edx
 6cd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6d1:	89 ca                	mov    %ecx,%edx
 6d3:	89 c1                	mov    %eax,%ecx
 6d5:	39 d6                	cmp    %edx,%esi
 6d7:	76 df                	jbe    6b8 <printint+0x2e>
  if(neg)
 6d9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6dd:	74 31                	je     710 <printint+0x86>
    buf[i++] = '-';
 6df:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6e4:	8d 5f 02             	lea    0x2(%edi),%ebx
 6e7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ea:	eb 17                	jmp    703 <printint+0x79>
    x = xx;
 6ec:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6ee:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6f5:	eb bc                	jmp    6b3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6f7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6fc:	89 f0                	mov    %esi,%eax
 6fe:	e8 6d ff ff ff       	call   670 <putc>
  while(--i >= 0)
 703:	83 eb 01             	sub    $0x1,%ebx
 706:	79 ef                	jns    6f7 <printint+0x6d>
}
 708:	83 c4 2c             	add    $0x2c,%esp
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret    
 710:	8b 75 d0             	mov    -0x30(%ebp),%esi
 713:	eb ee                	jmp    703 <printint+0x79>

00000715 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 715:	55                   	push   %ebp
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 71e:	8d 45 10             	lea    0x10(%ebp),%eax
 721:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 724:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 729:	bb 00 00 00 00       	mov    $0x0,%ebx
 72e:	eb 14                	jmp    744 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 730:	89 fa                	mov    %edi,%edx
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	e8 36 ff ff ff       	call   670 <putc>
 73a:	eb 05                	jmp    741 <printf+0x2c>
      }
    } else if(state == '%'){
 73c:	83 fe 25             	cmp    $0x25,%esi
 73f:	74 25                	je     766 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 741:	83 c3 01             	add    $0x1,%ebx
 744:	8b 45 0c             	mov    0xc(%ebp),%eax
 747:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 74b:	84 c0                	test   %al,%al
 74d:	0f 84 20 01 00 00    	je     873 <printf+0x15e>
    c = fmt[i] & 0xff;
 753:	0f be f8             	movsbl %al,%edi
 756:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 759:	85 f6                	test   %esi,%esi
 75b:	75 df                	jne    73c <printf+0x27>
      if(c == '%'){
 75d:	83 f8 25             	cmp    $0x25,%eax
 760:	75 ce                	jne    730 <printf+0x1b>
        state = '%';
 762:	89 c6                	mov    %eax,%esi
 764:	eb db                	jmp    741 <printf+0x2c>
      if(c == 'd'){
 766:	83 f8 25             	cmp    $0x25,%eax
 769:	0f 84 cf 00 00 00    	je     83e <printf+0x129>
 76f:	0f 8c dd 00 00 00    	jl     852 <printf+0x13d>
 775:	83 f8 78             	cmp    $0x78,%eax
 778:	0f 8f d4 00 00 00    	jg     852 <printf+0x13d>
 77e:	83 f8 63             	cmp    $0x63,%eax
 781:	0f 8c cb 00 00 00    	jl     852 <printf+0x13d>
 787:	83 e8 63             	sub    $0x63,%eax
 78a:	83 f8 15             	cmp    $0x15,%eax
 78d:	0f 87 bf 00 00 00    	ja     852 <printf+0x13d>
 793:	ff 24 85 88 0a 00 00 	jmp    *0xa88(,%eax,4)
        printint(fd, *ap, 10, 1);
 79a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 79d:	8b 17                	mov    (%edi),%edx
 79f:	83 ec 0c             	sub    $0xc,%esp
 7a2:	6a 01                	push   $0x1
 7a4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ac:	e8 d9 fe ff ff       	call   68a <printint>
        ap++;
 7b1:	83 c7 04             	add    $0x4,%edi
 7b4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7b7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7ba:	be 00 00 00 00       	mov    $0x0,%esi
 7bf:	eb 80                	jmp    741 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c4:	8b 17                	mov    (%edi),%edx
 7c6:	83 ec 0c             	sub    $0xc,%esp
 7c9:	6a 00                	push   $0x0
 7cb:	b9 10 00 00 00       	mov    $0x10,%ecx
 7d0:	8b 45 08             	mov    0x8(%ebp),%eax
 7d3:	e8 b2 fe ff ff       	call   68a <printint>
        ap++;
 7d8:	83 c7 04             	add    $0x4,%edi
 7db:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7de:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7e1:	be 00 00 00 00       	mov    $0x0,%esi
 7e6:	e9 56 ff ff ff       	jmp    741 <printf+0x2c>
        s = (char*)*ap;
 7eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ee:	8b 30                	mov    (%eax),%esi
        ap++;
 7f0:	83 c0 04             	add    $0x4,%eax
 7f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7f6:	85 f6                	test   %esi,%esi
 7f8:	75 15                	jne    80f <printf+0xfa>
          s = "(null)";
 7fa:	be 80 0a 00 00       	mov    $0xa80,%esi
 7ff:	eb 0e                	jmp    80f <printf+0xfa>
          putc(fd, *s);
 801:	0f be d2             	movsbl %dl,%edx
 804:	8b 45 08             	mov    0x8(%ebp),%eax
 807:	e8 64 fe ff ff       	call   670 <putc>
          s++;
 80c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 80f:	0f b6 16             	movzbl (%esi),%edx
 812:	84 d2                	test   %dl,%dl
 814:	75 eb                	jne    801 <printf+0xec>
      state = 0;
 816:	be 00 00 00 00       	mov    $0x0,%esi
 81b:	e9 21 ff ff ff       	jmp    741 <printf+0x2c>
        putc(fd, *ap);
 820:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 823:	0f be 17             	movsbl (%edi),%edx
 826:	8b 45 08             	mov    0x8(%ebp),%eax
 829:	e8 42 fe ff ff       	call   670 <putc>
        ap++;
 82e:	83 c7 04             	add    $0x4,%edi
 831:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 834:	be 00 00 00 00       	mov    $0x0,%esi
 839:	e9 03 ff ff ff       	jmp    741 <printf+0x2c>
        putc(fd, c);
 83e:	89 fa                	mov    %edi,%edx
 840:	8b 45 08             	mov    0x8(%ebp),%eax
 843:	e8 28 fe ff ff       	call   670 <putc>
      state = 0;
 848:	be 00 00 00 00       	mov    $0x0,%esi
 84d:	e9 ef fe ff ff       	jmp    741 <printf+0x2c>
        putc(fd, '%');
 852:	ba 25 00 00 00       	mov    $0x25,%edx
 857:	8b 45 08             	mov    0x8(%ebp),%eax
 85a:	e8 11 fe ff ff       	call   670 <putc>
        putc(fd, c);
 85f:	89 fa                	mov    %edi,%edx
 861:	8b 45 08             	mov    0x8(%ebp),%eax
 864:	e8 07 fe ff ff       	call   670 <putc>
      state = 0;
 869:	be 00 00 00 00       	mov    $0x0,%esi
 86e:	e9 ce fe ff ff       	jmp    741 <printf+0x2c>
    }
  }
}
 873:	8d 65 f4             	lea    -0xc(%ebp),%esp
 876:	5b                   	pop    %ebx
 877:	5e                   	pop    %esi
 878:	5f                   	pop    %edi
 879:	5d                   	pop    %ebp
 87a:	c3                   	ret    

0000087b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 87b:	55                   	push   %ebp
 87c:	89 e5                	mov    %esp,%ebp
 87e:	57                   	push   %edi
 87f:	56                   	push   %esi
 880:	53                   	push   %ebx
 881:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 884:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 887:	a1 58 0e 00 00       	mov    0xe58,%eax
 88c:	eb 02                	jmp    890 <free+0x15>
 88e:	89 d0                	mov    %edx,%eax
 890:	39 c8                	cmp    %ecx,%eax
 892:	73 04                	jae    898 <free+0x1d>
 894:	39 08                	cmp    %ecx,(%eax)
 896:	77 12                	ja     8aa <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 898:	8b 10                	mov    (%eax),%edx
 89a:	39 c2                	cmp    %eax,%edx
 89c:	77 f0                	ja     88e <free+0x13>
 89e:	39 c8                	cmp    %ecx,%eax
 8a0:	72 08                	jb     8aa <free+0x2f>
 8a2:	39 ca                	cmp    %ecx,%edx
 8a4:	77 04                	ja     8aa <free+0x2f>
 8a6:	89 d0                	mov    %edx,%eax
 8a8:	eb e6                	jmp    890 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8aa:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8ad:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8b0:	8b 10                	mov    (%eax),%edx
 8b2:	39 d7                	cmp    %edx,%edi
 8b4:	74 19                	je     8cf <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8b6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8b9:	8b 50 04             	mov    0x4(%eax),%edx
 8bc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8bf:	39 ce                	cmp    %ecx,%esi
 8c1:	74 1b                	je     8de <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8c3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8c5:	a3 58 0e 00 00       	mov    %eax,0xe58
}
 8ca:	5b                   	pop    %ebx
 8cb:	5e                   	pop    %esi
 8cc:	5f                   	pop    %edi
 8cd:	5d                   	pop    %ebp
 8ce:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8cf:	03 72 04             	add    0x4(%edx),%esi
 8d2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d5:	8b 10                	mov    (%eax),%edx
 8d7:	8b 12                	mov    (%edx),%edx
 8d9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8dc:	eb db                	jmp    8b9 <free+0x3e>
    p->s.size += bp->s.size;
 8de:	03 53 fc             	add    -0x4(%ebx),%edx
 8e1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8e4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8e7:	89 10                	mov    %edx,(%eax)
 8e9:	eb da                	jmp    8c5 <free+0x4a>

000008eb <morecore>:

static Header*
morecore(uint nu)
{
 8eb:	55                   	push   %ebp
 8ec:	89 e5                	mov    %esp,%ebp
 8ee:	53                   	push   %ebx
 8ef:	83 ec 04             	sub    $0x4,%esp
 8f2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8f4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8f9:	77 05                	ja     900 <morecore+0x15>
    nu = 4096;
 8fb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 900:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 907:	83 ec 0c             	sub    $0xc,%esp
 90a:	50                   	push   %eax
 90b:	e8 38 fd ff ff       	call   648 <sbrk>
  if(p == (char*)-1)
 910:	83 c4 10             	add    $0x10,%esp
 913:	83 f8 ff             	cmp    $0xffffffff,%eax
 916:	74 1c                	je     934 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 918:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 91b:	83 c0 08             	add    $0x8,%eax
 91e:	83 ec 0c             	sub    $0xc,%esp
 921:	50                   	push   %eax
 922:	e8 54 ff ff ff       	call   87b <free>
  return freep;
 927:	a1 58 0e 00 00       	mov    0xe58,%eax
 92c:	83 c4 10             	add    $0x10,%esp
}
 92f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 932:	c9                   	leave  
 933:	c3                   	ret    
    return 0;
 934:	b8 00 00 00 00       	mov    $0x0,%eax
 939:	eb f4                	jmp    92f <morecore+0x44>

0000093b <malloc>:

void*
malloc(uint nbytes)
{
 93b:	55                   	push   %ebp
 93c:	89 e5                	mov    %esp,%ebp
 93e:	53                   	push   %ebx
 93f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 942:	8b 45 08             	mov    0x8(%ebp),%eax
 945:	8d 58 07             	lea    0x7(%eax),%ebx
 948:	c1 eb 03             	shr    $0x3,%ebx
 94b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 94e:	8b 0d 58 0e 00 00    	mov    0xe58,%ecx
 954:	85 c9                	test   %ecx,%ecx
 956:	74 04                	je     95c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 958:	8b 01                	mov    (%ecx),%eax
 95a:	eb 4a                	jmp    9a6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 95c:	c7 05 58 0e 00 00 5c 	movl   $0xe5c,0xe58
 963:	0e 00 00 
 966:	c7 05 5c 0e 00 00 5c 	movl   $0xe5c,0xe5c
 96d:	0e 00 00 
    base.s.size = 0;
 970:	c7 05 60 0e 00 00 00 	movl   $0x0,0xe60
 977:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 97a:	b9 5c 0e 00 00       	mov    $0xe5c,%ecx
 97f:	eb d7                	jmp    958 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 981:	74 19                	je     99c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 983:	29 da                	sub    %ebx,%edx
 985:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 988:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 98b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 98e:	89 0d 58 0e 00 00    	mov    %ecx,0xe58
      return (void*)(p + 1);
 994:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 997:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 99a:	c9                   	leave  
 99b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 99c:	8b 10                	mov    (%eax),%edx
 99e:	89 11                	mov    %edx,(%ecx)
 9a0:	eb ec                	jmp    98e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a2:	89 c1                	mov    %eax,%ecx
 9a4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9a6:	8b 50 04             	mov    0x4(%eax),%edx
 9a9:	39 da                	cmp    %ebx,%edx
 9ab:	73 d4                	jae    981 <malloc+0x46>
    if(p == freep)
 9ad:	39 05 58 0e 00 00    	cmp    %eax,0xe58
 9b3:	75 ed                	jne    9a2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9b5:	89 d8                	mov    %ebx,%eax
 9b7:	e8 2f ff ff ff       	call   8eb <morecore>
 9bc:	85 c0                	test   %eax,%eax
 9be:	75 e2                	jne    9a2 <malloc+0x67>
 9c0:	eb d5                	jmp    997 <malloc+0x5c>
