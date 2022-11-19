
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
  2c:	68 c8 09 00 00       	push   $0x9c8
  31:	68 d1 09 00 00       	push   $0x9d1
  36:	6a 01                	push   $0x1
  38:	e8 db 06 00 00       	call   718 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 10 0a 00 00       	push   $0xa10
  45:	68 e4 09 00 00       	push   $0x9e4
  4a:	6a 01                	push   $0x1
  4c:	e8 c7 06 00 00       	call   718 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 f8 09 00 00       	push   $0x9f8
  59:	6a 01                	push   $0x1
  5b:	e8 b8 06 00 00       	call   718 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 54 0e 00 00    	push   0xe54
  69:	e8 85 05 00 00       	call   5f3 <kill>
  6e:	e8 50 05 00 00       	call   5c3 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 c8 09 00 00       	push   $0x9c8
  7a:	68 d1 09 00 00       	push   $0x9d1
  7f:	6a 01                	push   $0x1
  81:	e8 92 06 00 00       	call   718 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 d9 09 00 00       	push   $0x9d9
  8e:	68 e4 09 00 00       	push   $0x9e4
  93:	6a 01                	push   $0x1
  95:	e8 7e 06 00 00       	call   718 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 f8 09 00 00       	push   $0x9f8
  a2:	6a 01                	push   $0x1
  a4:	e8 6f 06 00 00       	call   718 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 54 0e 00 00    	push   0xe54
  b2:	e8 3c 05 00 00       	call   5f3 <kill>
  b7:	e8 07 05 00 00       	call   5c3 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 c8 09 00 00       	push   $0x9c8
  c3:	68 d1 09 00 00       	push   $0x9d1
  c8:	6a 01                	push   $0x1
  ca:	e8 49 06 00 00       	call   718 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 05 0a 00 00       	push   $0xa05
  d7:	68 e4 09 00 00       	push   $0x9e4
  dc:	6a 01                	push   $0x1
  de:	e8 35 06 00 00       	call   718 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 f8 09 00 00       	push   $0x9f8
  eb:	6a 01                	push   $0x1
  ed:	e8 26 06 00 00       	call   718 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 54 0e 00 00    	push   0xe54
  fb:	e8 f3 04 00 00       	call   5f3 <kill>
 100:	e8 be 04 00 00       	call   5c3 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 50 0e 00 00       	mov    %eax,0xe50
   exit();
 10d:	e8 b1 04 00 00       	call   5c3 <exit>

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
 126:	e8 18 05 00 00       	call   643 <getpid>
 12b:	a3 54 0e 00 00       	mov    %eax,0xe54
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 01 08 00 00       	call   93e <malloc>
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
 15a:	68 c8 09 00 00       	push   $0x9c8
 15f:	68 d1 09 00 00       	push   $0x9d1
 164:	6a 01                	push   $0x1
 166:	e8 ad 05 00 00       	call   718 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 1c 0a 00 00       	push   $0xa1c
 173:	68 e4 09 00 00       	push   $0x9e4
 178:	6a 01                	push   $0x1
 17a:	e8 99 05 00 00       	call   718 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 f8 09 00 00       	push   $0x9f8
 187:	6a 01                	push   $0x1
 189:	e8 8a 05 00 00       	call   718 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 54 0e 00 00    	push   0xe54
 197:	e8 57 04 00 00       	call   5f3 <kill>
 19c:	e8 22 04 00 00       	call   5c3 <exit>
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
 1bf:	e8 9f 04 00 00       	call   663 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 79 04 00 00       	call   653 <sleep>
   assert(wait() == -1);
 1da:	e8 ec 03 00 00       	call   5cb <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 c8 09 00 00       	push   $0x9c8
 1f2:	68 d1 09 00 00       	push   $0x9d1
 1f7:	6a 01                	push   $0x1
 1f9:	e8 1a 05 00 00       	call   718 <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 34 0a 00 00       	push   $0xa34
 206:	68 e4 09 00 00       	push   $0x9e4
 20b:	6a 01                	push   $0x1
 20d:	e8 06 05 00 00       	call   718 <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 f8 09 00 00       	push   $0x9f8
 21a:	6a 01                	push   $0x1
 21c:	e8 f7 04 00 00       	call   718 <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 54 0e 00 00    	push   0xe54
 22a:	e8 c4 03 00 00       	call   5f3 <kill>
 22f:	e8 8f 03 00 00       	call   5c3 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 c8 09 00 00       	push   $0x9c8
 23b:	68 d1 09 00 00       	push   $0x9d1
 240:	6a 01                	push   $0x1
 242:	e8 d1 04 00 00       	call   718 <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 26 0a 00 00       	push   $0xa26
 24f:	68 e4 09 00 00       	push   $0x9e4
 254:	6a 01                	push   $0x1
 256:	e8 bd 04 00 00       	call   718 <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 f8 09 00 00       	push   $0x9f8
 263:	6a 01                	push   $0x1
 265:	e8 ae 04 00 00       	call   718 <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 54 0e 00 00    	push   0xe54
 273:	e8 7b 03 00 00       	call   5f3 <kill>
 278:	e8 46 03 00 00       	call   5c3 <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 e2 03 00 00       	call   66b <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 c8 09 00 00       	push   $0x9c8
 2a0:	68 d1 09 00 00       	push   $0x9d1
 2a5:	6a 01                	push   $0x1
 2a7:	e8 6c 04 00 00       	call   718 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 57 0a 00 00       	push   $0xa57
 2b4:	68 e4 09 00 00       	push   $0x9e4
 2b9:	6a 01                	push   $0x1
 2bb:	e8 58 04 00 00       	call   718 <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 f8 09 00 00       	push   $0x9f8
 2c8:	6a 01                	push   $0x1
 2ca:	e8 49 04 00 00       	call   718 <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 54 0e 00 00    	push   0xe54
 2d8:	e8 16 03 00 00       	call   5f3 <kill>
 2dd:	e8 e1 02 00 00       	call   5c3 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 c8 09 00 00       	push   $0x9c8
 2e9:	68 d1 09 00 00       	push   $0x9d1
 2ee:	6a 01                	push   $0x1
 2f0:	e8 23 04 00 00       	call   718 <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 41 0a 00 00       	push   $0xa41
 2fd:	68 e4 09 00 00       	push   $0x9e4
 302:	6a 01                	push   $0x1
 304:	e8 0f 04 00 00       	call   718 <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 f8 09 00 00       	push   $0x9f8
 311:	6a 01                	push   $0x1
 313:	e8 00 04 00 00       	call   718 <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 54 0e 00 00    	push   0xe54
 321:	e8 cd 02 00 00       	call   5f3 <kill>
 326:	e8 98 02 00 00       	call   5c3 <exit>
   assert(global == 2);
 32b:	83 3d 50 0e 00 00 02 	cmpl   $0x2,0xe50
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 c8 09 00 00       	push   $0x9c8
 33b:	68 d1 09 00 00       	push   $0x9d1
 340:	6a 01                	push   $0x1
 342:	e8 d1 03 00 00       	call   718 <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 6b 0a 00 00       	push   $0xa6b
 34f:	68 e4 09 00 00       	push   $0x9e4
 354:	6a 01                	push   $0x1
 356:	e8 bd 03 00 00       	call   718 <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 f8 09 00 00       	push   $0x9f8
 363:	6a 01                	push   $0x1
 365:	e8 ae 03 00 00       	call   718 <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 54 0e 00 00    	push   0xe54
 373:	e8 7b 02 00 00       	call   5f3 <kill>
 378:	e8 46 02 00 00       	call   5c3 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 77 0a 00 00       	push   $0xa77
 385:	6a 01                	push   $0x1
 387:	e8 8c 03 00 00       	call   718 <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 ea 04 00 00       	call   87e <free>
   exit();
 394:	e8 2a 02 00 00       	call   5c3 <exit>

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
 45f:	e8 77 01 00 00       	call   5db <read>
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
 49d:	e8 61 01 00 00       	call   603 <open>
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
 4b2:	e8 64 01 00 00       	call   61b <fstat>
 4b7:	89 c6                	mov    %eax,%esi
  close(fd);
 4b9:	89 1c 24             	mov    %ebx,(%esp)
 4bc:	e8 2a 01 00 00       	call   5eb <close>
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

  void* stack = malloc(2 * PGSIZE);
 536:	68 00 20 00 00       	push   $0x2000
 53b:	e8 fe 03 00 00       	call   93e <malloc>
  if ((uint)stack%PGSIZE){
 540:	83 c4 10             	add    $0x10,%esp
 543:	a9 ff 0f 00 00       	test   $0xfff,%eax
 548:	74 0a                	je     554 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 54a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 54f:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 554:	50                   	push   %eax
 555:	ff 75 10             	push   0x10(%ebp)
 558:	ff 75 0c             	push   0xc(%ebp)
 55b:	ff 75 08             	push   0x8(%ebp)
 55e:	e8 00 01 00 00       	call   663 <clone>
}
 563:	c9                   	leave  
 564:	c3                   	ret    

00000565 <thread_join>:

int thread_join(){
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	53                   	push   %ebx
 569:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 56c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 56f:	50                   	push   %eax
 570:	e8 f6 00 00 00       	call   66b <join>
 575:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 577:	83 c4 04             	add    $0x4,%esp
 57a:	ff 75 f4             	push   -0xc(%ebp)
 57d:	e8 fc 02 00 00       	call   87e <free>
  return x;
}
 582:	89 d8                	mov    %ebx,%eax
 584:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 587:	c9                   	leave  
 588:	c3                   	ret    

00000589 <lock_init>:

void lock_init(lock_t *spin){
 589:	55                   	push   %ebp
 58a:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 58c:	8b 45 08             	mov    0x8(%ebp),%eax
 58f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 595:	5d                   	pop    %ebp
 596:	c3                   	ret    

00000597 <lock_acquire>:

void lock_acquire(lock_t *spin){
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 59d:	b8 01 00 00 00       	mov    $0x1,%eax
 5a2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 5a5:	85 c0                	test   %eax,%eax
 5a7:	75 f4                	jne    59d <lock_acquire+0x6>

}
 5a9:	5d                   	pop    %ebp
 5aa:	c3                   	ret    

000005ab <lock_release>:

void lock_release(lock_t *spin){
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	8b 55 08             	mov    0x8(%ebp),%edx
 5b1:	b8 00 00 00 00       	mov    $0x0,%eax
 5b6:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 5b9:	5d                   	pop    %ebp
 5ba:	c3                   	ret    

000005bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5bb:	b8 01 00 00 00       	mov    $0x1,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <exit>:
SYSCALL(exit)
 5c3:	b8 02 00 00 00       	mov    $0x2,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <wait>:
SYSCALL(wait)
 5cb:	b8 03 00 00 00       	mov    $0x3,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <pipe>:
SYSCALL(pipe)
 5d3:	b8 04 00 00 00       	mov    $0x4,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <read>:
SYSCALL(read)
 5db:	b8 05 00 00 00       	mov    $0x5,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <write>:
SYSCALL(write)
 5e3:	b8 10 00 00 00       	mov    $0x10,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <close>:
SYSCALL(close)
 5eb:	b8 15 00 00 00       	mov    $0x15,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <kill>:
SYSCALL(kill)
 5f3:	b8 06 00 00 00       	mov    $0x6,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <exec>:
SYSCALL(exec)
 5fb:	b8 07 00 00 00       	mov    $0x7,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <open>:
SYSCALL(open)
 603:	b8 0f 00 00 00       	mov    $0xf,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <mknod>:
SYSCALL(mknod)
 60b:	b8 11 00 00 00       	mov    $0x11,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <unlink>:
SYSCALL(unlink)
 613:	b8 12 00 00 00       	mov    $0x12,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <fstat>:
SYSCALL(fstat)
 61b:	b8 08 00 00 00       	mov    $0x8,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <link>:
SYSCALL(link)
 623:	b8 13 00 00 00       	mov    $0x13,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <mkdir>:
SYSCALL(mkdir)
 62b:	b8 14 00 00 00       	mov    $0x14,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <chdir>:
SYSCALL(chdir)
 633:	b8 09 00 00 00       	mov    $0x9,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <dup>:
SYSCALL(dup)
 63b:	b8 0a 00 00 00       	mov    $0xa,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <getpid>:
SYSCALL(getpid)
 643:	b8 0b 00 00 00       	mov    $0xb,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <sbrk>:
SYSCALL(sbrk)
 64b:	b8 0c 00 00 00       	mov    $0xc,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <sleep>:
SYSCALL(sleep)
 653:	b8 0d 00 00 00       	mov    $0xd,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <uptime>:
SYSCALL(uptime)
 65b:	b8 0e 00 00 00       	mov    $0xe,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <clone>:
SYSCALL(clone)
 663:	b8 16 00 00 00       	mov    $0x16,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <join>:
 66b:	b8 17 00 00 00       	mov    $0x17,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 673:	55                   	push   %ebp
 674:	89 e5                	mov    %esp,%ebp
 676:	83 ec 1c             	sub    $0x1c,%esp
 679:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 67c:	6a 01                	push   $0x1
 67e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 681:	52                   	push   %edx
 682:	50                   	push   %eax
 683:	e8 5b ff ff ff       	call   5e3 <write>
}
 688:	83 c4 10             	add    $0x10,%esp
 68b:	c9                   	leave  
 68c:	c3                   	ret    

0000068d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 68d:	55                   	push   %ebp
 68e:	89 e5                	mov    %esp,%ebp
 690:	57                   	push   %edi
 691:	56                   	push   %esi
 692:	53                   	push   %ebx
 693:	83 ec 2c             	sub    $0x2c,%esp
 696:	89 45 d0             	mov    %eax,-0x30(%ebp)
 699:	89 d0                	mov    %edx,%eax
 69b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 69d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6a1:	0f 95 c1             	setne  %cl
 6a4:	c1 ea 1f             	shr    $0x1f,%edx
 6a7:	84 d1                	test   %dl,%cl
 6a9:	74 44                	je     6ef <printint+0x62>
    neg = 1;
    x = -xx;
 6ab:	f7 d8                	neg    %eax
 6ad:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6af:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6b6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6bb:	89 c8                	mov    %ecx,%eax
 6bd:	ba 00 00 00 00       	mov    $0x0,%edx
 6c2:	f7 f6                	div    %esi
 6c4:	89 df                	mov    %ebx,%edi
 6c6:	83 c3 01             	add    $0x1,%ebx
 6c9:	0f b6 92 e4 0a 00 00 	movzbl 0xae4(%edx),%edx
 6d0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6d4:	89 ca                	mov    %ecx,%edx
 6d6:	89 c1                	mov    %eax,%ecx
 6d8:	39 d6                	cmp    %edx,%esi
 6da:	76 df                	jbe    6bb <printint+0x2e>
  if(neg)
 6dc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6e0:	74 31                	je     713 <printint+0x86>
    buf[i++] = '-';
 6e2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6e7:	8d 5f 02             	lea    0x2(%edi),%ebx
 6ea:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ed:	eb 17                	jmp    706 <printint+0x79>
    x = xx;
 6ef:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6f1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6f8:	eb bc                	jmp    6b6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6fa:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6ff:	89 f0                	mov    %esi,%eax
 701:	e8 6d ff ff ff       	call   673 <putc>
  while(--i >= 0)
 706:	83 eb 01             	sub    $0x1,%ebx
 709:	79 ef                	jns    6fa <printint+0x6d>
}
 70b:	83 c4 2c             	add    $0x2c,%esp
 70e:	5b                   	pop    %ebx
 70f:	5e                   	pop    %esi
 710:	5f                   	pop    %edi
 711:	5d                   	pop    %ebp
 712:	c3                   	ret    
 713:	8b 75 d0             	mov    -0x30(%ebp),%esi
 716:	eb ee                	jmp    706 <printint+0x79>

00000718 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 718:	55                   	push   %ebp
 719:	89 e5                	mov    %esp,%ebp
 71b:	57                   	push   %edi
 71c:	56                   	push   %esi
 71d:	53                   	push   %ebx
 71e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 721:	8d 45 10             	lea    0x10(%ebp),%eax
 724:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 727:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 72c:	bb 00 00 00 00       	mov    $0x0,%ebx
 731:	eb 14                	jmp    747 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 733:	89 fa                	mov    %edi,%edx
 735:	8b 45 08             	mov    0x8(%ebp),%eax
 738:	e8 36 ff ff ff       	call   673 <putc>
 73d:	eb 05                	jmp    744 <printf+0x2c>
      }
    } else if(state == '%'){
 73f:	83 fe 25             	cmp    $0x25,%esi
 742:	74 25                	je     769 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 744:	83 c3 01             	add    $0x1,%ebx
 747:	8b 45 0c             	mov    0xc(%ebp),%eax
 74a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 74e:	84 c0                	test   %al,%al
 750:	0f 84 20 01 00 00    	je     876 <printf+0x15e>
    c = fmt[i] & 0xff;
 756:	0f be f8             	movsbl %al,%edi
 759:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 75c:	85 f6                	test   %esi,%esi
 75e:	75 df                	jne    73f <printf+0x27>
      if(c == '%'){
 760:	83 f8 25             	cmp    $0x25,%eax
 763:	75 ce                	jne    733 <printf+0x1b>
        state = '%';
 765:	89 c6                	mov    %eax,%esi
 767:	eb db                	jmp    744 <printf+0x2c>
      if(c == 'd'){
 769:	83 f8 25             	cmp    $0x25,%eax
 76c:	0f 84 cf 00 00 00    	je     841 <printf+0x129>
 772:	0f 8c dd 00 00 00    	jl     855 <printf+0x13d>
 778:	83 f8 78             	cmp    $0x78,%eax
 77b:	0f 8f d4 00 00 00    	jg     855 <printf+0x13d>
 781:	83 f8 63             	cmp    $0x63,%eax
 784:	0f 8c cb 00 00 00    	jl     855 <printf+0x13d>
 78a:	83 e8 63             	sub    $0x63,%eax
 78d:	83 f8 15             	cmp    $0x15,%eax
 790:	0f 87 bf 00 00 00    	ja     855 <printf+0x13d>
 796:	ff 24 85 8c 0a 00 00 	jmp    *0xa8c(,%eax,4)
        printint(fd, *ap, 10, 1);
 79d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7a0:	8b 17                	mov    (%edi),%edx
 7a2:	83 ec 0c             	sub    $0xc,%esp
 7a5:	6a 01                	push   $0x1
 7a7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7ac:	8b 45 08             	mov    0x8(%ebp),%eax
 7af:	e8 d9 fe ff ff       	call   68d <printint>
        ap++;
 7b4:	83 c7 04             	add    $0x4,%edi
 7b7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7ba:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7bd:	be 00 00 00 00       	mov    $0x0,%esi
 7c2:	eb 80                	jmp    744 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c7:	8b 17                	mov    (%edi),%edx
 7c9:	83 ec 0c             	sub    $0xc,%esp
 7cc:	6a 00                	push   $0x0
 7ce:	b9 10 00 00 00       	mov    $0x10,%ecx
 7d3:	8b 45 08             	mov    0x8(%ebp),%eax
 7d6:	e8 b2 fe ff ff       	call   68d <printint>
        ap++;
 7db:	83 c7 04             	add    $0x4,%edi
 7de:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7e1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7e4:	be 00 00 00 00       	mov    $0x0,%esi
 7e9:	e9 56 ff ff ff       	jmp    744 <printf+0x2c>
        s = (char*)*ap;
 7ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f1:	8b 30                	mov    (%eax),%esi
        ap++;
 7f3:	83 c0 04             	add    $0x4,%eax
 7f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7f9:	85 f6                	test   %esi,%esi
 7fb:	75 15                	jne    812 <printf+0xfa>
          s = "(null)";
 7fd:	be 84 0a 00 00       	mov    $0xa84,%esi
 802:	eb 0e                	jmp    812 <printf+0xfa>
          putc(fd, *s);
 804:	0f be d2             	movsbl %dl,%edx
 807:	8b 45 08             	mov    0x8(%ebp),%eax
 80a:	e8 64 fe ff ff       	call   673 <putc>
          s++;
 80f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 812:	0f b6 16             	movzbl (%esi),%edx
 815:	84 d2                	test   %dl,%dl
 817:	75 eb                	jne    804 <printf+0xec>
      state = 0;
 819:	be 00 00 00 00       	mov    $0x0,%esi
 81e:	e9 21 ff ff ff       	jmp    744 <printf+0x2c>
        putc(fd, *ap);
 823:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 826:	0f be 17             	movsbl (%edi),%edx
 829:	8b 45 08             	mov    0x8(%ebp),%eax
 82c:	e8 42 fe ff ff       	call   673 <putc>
        ap++;
 831:	83 c7 04             	add    $0x4,%edi
 834:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 837:	be 00 00 00 00       	mov    $0x0,%esi
 83c:	e9 03 ff ff ff       	jmp    744 <printf+0x2c>
        putc(fd, c);
 841:	89 fa                	mov    %edi,%edx
 843:	8b 45 08             	mov    0x8(%ebp),%eax
 846:	e8 28 fe ff ff       	call   673 <putc>
      state = 0;
 84b:	be 00 00 00 00       	mov    $0x0,%esi
 850:	e9 ef fe ff ff       	jmp    744 <printf+0x2c>
        putc(fd, '%');
 855:	ba 25 00 00 00       	mov    $0x25,%edx
 85a:	8b 45 08             	mov    0x8(%ebp),%eax
 85d:	e8 11 fe ff ff       	call   673 <putc>
        putc(fd, c);
 862:	89 fa                	mov    %edi,%edx
 864:	8b 45 08             	mov    0x8(%ebp),%eax
 867:	e8 07 fe ff ff       	call   673 <putc>
      state = 0;
 86c:	be 00 00 00 00       	mov    $0x0,%esi
 871:	e9 ce fe ff ff       	jmp    744 <printf+0x2c>
    }
  }
}
 876:	8d 65 f4             	lea    -0xc(%ebp),%esp
 879:	5b                   	pop    %ebx
 87a:	5e                   	pop    %esi
 87b:	5f                   	pop    %edi
 87c:	5d                   	pop    %ebp
 87d:	c3                   	ret    

0000087e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 87e:	55                   	push   %ebp
 87f:	89 e5                	mov    %esp,%ebp
 881:	57                   	push   %edi
 882:	56                   	push   %esi
 883:	53                   	push   %ebx
 884:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 887:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 88a:	a1 58 0e 00 00       	mov    0xe58,%eax
 88f:	eb 02                	jmp    893 <free+0x15>
 891:	89 d0                	mov    %edx,%eax
 893:	39 c8                	cmp    %ecx,%eax
 895:	73 04                	jae    89b <free+0x1d>
 897:	39 08                	cmp    %ecx,(%eax)
 899:	77 12                	ja     8ad <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 89b:	8b 10                	mov    (%eax),%edx
 89d:	39 c2                	cmp    %eax,%edx
 89f:	77 f0                	ja     891 <free+0x13>
 8a1:	39 c8                	cmp    %ecx,%eax
 8a3:	72 08                	jb     8ad <free+0x2f>
 8a5:	39 ca                	cmp    %ecx,%edx
 8a7:	77 04                	ja     8ad <free+0x2f>
 8a9:	89 d0                	mov    %edx,%eax
 8ab:	eb e6                	jmp    893 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8ad:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8b0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8b3:	8b 10                	mov    (%eax),%edx
 8b5:	39 d7                	cmp    %edx,%edi
 8b7:	74 19                	je     8d2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8b9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8bc:	8b 50 04             	mov    0x4(%eax),%edx
 8bf:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8c2:	39 ce                	cmp    %ecx,%esi
 8c4:	74 1b                	je     8e1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8c6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8c8:	a3 58 0e 00 00       	mov    %eax,0xe58
}
 8cd:	5b                   	pop    %ebx
 8ce:	5e                   	pop    %esi
 8cf:	5f                   	pop    %edi
 8d0:	5d                   	pop    %ebp
 8d1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8d2:	03 72 04             	add    0x4(%edx),%esi
 8d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d8:	8b 10                	mov    (%eax),%edx
 8da:	8b 12                	mov    (%edx),%edx
 8dc:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8df:	eb db                	jmp    8bc <free+0x3e>
    p->s.size += bp->s.size;
 8e1:	03 53 fc             	add    -0x4(%ebx),%edx
 8e4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8e7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8ea:	89 10                	mov    %edx,(%eax)
 8ec:	eb da                	jmp    8c8 <free+0x4a>

000008ee <morecore>:

static Header*
morecore(uint nu)
{
 8ee:	55                   	push   %ebp
 8ef:	89 e5                	mov    %esp,%ebp
 8f1:	53                   	push   %ebx
 8f2:	83 ec 04             	sub    $0x4,%esp
 8f5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8f7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8fc:	77 05                	ja     903 <morecore+0x15>
    nu = 4096;
 8fe:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 903:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 90a:	83 ec 0c             	sub    $0xc,%esp
 90d:	50                   	push   %eax
 90e:	e8 38 fd ff ff       	call   64b <sbrk>
  if(p == (char*)-1)
 913:	83 c4 10             	add    $0x10,%esp
 916:	83 f8 ff             	cmp    $0xffffffff,%eax
 919:	74 1c                	je     937 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 91b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 91e:	83 c0 08             	add    $0x8,%eax
 921:	83 ec 0c             	sub    $0xc,%esp
 924:	50                   	push   %eax
 925:	e8 54 ff ff ff       	call   87e <free>
  return freep;
 92a:	a1 58 0e 00 00       	mov    0xe58,%eax
 92f:	83 c4 10             	add    $0x10,%esp
}
 932:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 935:	c9                   	leave  
 936:	c3                   	ret    
    return 0;
 937:	b8 00 00 00 00       	mov    $0x0,%eax
 93c:	eb f4                	jmp    932 <morecore+0x44>

0000093e <malloc>:

void*
malloc(uint nbytes)
{
 93e:	55                   	push   %ebp
 93f:	89 e5                	mov    %esp,%ebp
 941:	53                   	push   %ebx
 942:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 945:	8b 45 08             	mov    0x8(%ebp),%eax
 948:	8d 58 07             	lea    0x7(%eax),%ebx
 94b:	c1 eb 03             	shr    $0x3,%ebx
 94e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 951:	8b 0d 58 0e 00 00    	mov    0xe58,%ecx
 957:	85 c9                	test   %ecx,%ecx
 959:	74 04                	je     95f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 95b:	8b 01                	mov    (%ecx),%eax
 95d:	eb 4a                	jmp    9a9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 95f:	c7 05 58 0e 00 00 5c 	movl   $0xe5c,0xe58
 966:	0e 00 00 
 969:	c7 05 5c 0e 00 00 5c 	movl   $0xe5c,0xe5c
 970:	0e 00 00 
    base.s.size = 0;
 973:	c7 05 60 0e 00 00 00 	movl   $0x0,0xe60
 97a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 97d:	b9 5c 0e 00 00       	mov    $0xe5c,%ecx
 982:	eb d7                	jmp    95b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 984:	74 19                	je     99f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 986:	29 da                	sub    %ebx,%edx
 988:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 98b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 98e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 991:	89 0d 58 0e 00 00    	mov    %ecx,0xe58
      return (void*)(p + 1);
 997:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 99a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 99d:	c9                   	leave  
 99e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 99f:	8b 10                	mov    (%eax),%edx
 9a1:	89 11                	mov    %edx,(%ecx)
 9a3:	eb ec                	jmp    991 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a5:	89 c1                	mov    %eax,%ecx
 9a7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9a9:	8b 50 04             	mov    0x4(%eax),%edx
 9ac:	39 da                	cmp    %ebx,%edx
 9ae:	73 d4                	jae    984 <malloc+0x46>
    if(p == freep)
 9b0:	39 05 58 0e 00 00    	cmp    %eax,0xe58
 9b6:	75 ed                	jne    9a5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9b8:	89 d8                	mov    %ebx,%eax
 9ba:	e8 2f ff ff ff       	call   8ee <morecore>
 9bf:	85 c0                	test   %eax,%eax
 9c1:	75 e2                	jne    9a5 <malloc+0x67>
 9c3:	eb d5                	jmp    99a <malloc+0x5c>
