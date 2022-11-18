
_test_6:     file format elf32-i386


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
  1c:	a1 98 0e 00 00       	mov    0xe98,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 e4 09 00 00       	push   $0x9e4
  31:	68 ed 09 00 00       	push   $0x9ed
  36:	6a 01                	push   $0x1
  38:	e8 f9 06 00 00       	call   736 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 2c 0a 00 00       	push   $0xa2c
  45:	68 00 0a 00 00       	push   $0xa00
  4a:	6a 01                	push   $0x1
  4c:	e8 e5 06 00 00       	call   736 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 14 0a 00 00       	push   $0xa14
  59:	6a 01                	push   $0x1
  5b:	e8 d6 06 00 00       	call   736 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 9c 0e 00 00    	push   0xe9c
  69:	e8 a3 05 00 00       	call   611 <kill>
  6e:	e8 6e 05 00 00       	call   5e1 <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 e4 09 00 00       	push   $0x9e4
  7a:	68 ed 09 00 00       	push   $0x9ed
  7f:	6a 01                	push   $0x1
  81:	e8 b0 06 00 00       	call   736 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 f5 09 00 00       	push   $0x9f5
  8e:	68 00 0a 00 00       	push   $0xa00
  93:	6a 01                	push   $0x1
  95:	e8 9c 06 00 00       	call   736 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 14 0a 00 00       	push   $0xa14
  a2:	6a 01                	push   $0x1
  a4:	e8 8d 06 00 00       	call   736 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 9c 0e 00 00    	push   0xe9c
  b2:	e8 5a 05 00 00       	call   611 <kill>
  b7:	e8 25 05 00 00       	call   5e1 <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 e4 09 00 00       	push   $0x9e4
  c3:	68 ed 09 00 00       	push   $0x9ed
  c8:	6a 01                	push   $0x1
  ca:	e8 67 06 00 00       	call   736 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 21 0a 00 00       	push   $0xa21
  d7:	68 00 0a 00 00       	push   $0xa00
  dc:	6a 01                	push   $0x1
  de:	e8 53 06 00 00       	call   736 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 14 0a 00 00       	push   $0xa14
  eb:	6a 01                	push   $0x1
  ed:	e8 44 06 00 00       	call   736 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 9c 0e 00 00    	push   0xe9c
  fb:	e8 11 05 00 00       	call   611 <kill>
 100:	e8 dc 04 00 00       	call   5e1 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 98 0e 00 00       	mov    %eax,0xe98
   exit();
 10d:	e8 cf 04 00 00       	call   5e1 <exit>

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
 123:	83 ec 28             	sub    $0x28,%esp
   ppid = getpid();
 126:	e8 36 05 00 00       	call   661 <getpid>
 12b:	a3 9c 0e 00 00       	mov    %eax,0xe9c
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 1f 08 00 00       	call   95c <malloc>
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
 15a:	68 e4 09 00 00       	push   $0x9e4
 15f:	68 ed 09 00 00       	push   $0x9ed
 164:	6a 01                	push   $0x1
 166:	e8 cb 05 00 00       	call   736 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 38 0a 00 00       	push   $0xa38
 173:	68 00 0a 00 00       	push   $0xa00
 178:	6a 01                	push   $0x1
 17a:	e8 b7 05 00 00       	call   736 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 14 0a 00 00       	push   $0xa14
 187:	6a 01                	push   $0x1
 189:	e8 a8 05 00 00       	call   736 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 9c 0e 00 00    	push   0xe9c
 197:	e8 75 04 00 00       	call   611 <kill>
 19c:	e8 40 04 00 00       	call   5e1 <exit>
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
 1bf:	e8 bd 04 00 00       	call   681 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 8b 04 00 00       	call   669 <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 7f 04 00 00       	call   669 <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 8b 04 00 00       	call   689 <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 e4 09 00 00       	push   $0x9e4
 211:	68 ed 09 00 00       	push   $0x9ed
 216:	6a 01                	push   $0x1
 218:	e8 19 05 00 00       	call   736 <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 9c 0a 00 00       	push   $0xa9c
 225:	68 00 0a 00 00       	push   $0xa00
 22a:	6a 01                	push   $0x1
 22c:	e8 05 05 00 00       	call   736 <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 14 0a 00 00       	push   $0xa14
 239:	6a 01                	push   $0x1
 23b:	e8 f6 04 00 00       	call   736 <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 9c 0e 00 00    	push   0xe9c
 249:	e8 c3 03 00 00       	call   611 <kill>
 24e:	e8 8e 03 00 00       	call   5e1 <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 e4 09 00 00       	push   $0x9e4
 25a:	68 ed 09 00 00       	push   $0x9ed
 25f:	6a 01                	push   $0x1
 261:	e8 d0 04 00 00       	call   736 <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 42 0a 00 00       	push   $0xa42
 26e:	68 00 0a 00 00       	push   $0xa00
 273:	6a 01                	push   $0x1
 275:	e8 bc 04 00 00       	call   736 <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 14 0a 00 00       	push   $0xa14
 282:	6a 01                	push   $0x1
 284:	e8 ad 04 00 00       	call   736 <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 9c 0e 00 00    	push   0xe9c
 292:	e8 7a 03 00 00       	call   611 <kill>
 297:	e8 45 03 00 00       	call   5e1 <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 e2 03 00 00       	call   689 <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 e4 09 00 00       	push   $0x9e4
 2c1:	68 ed 09 00 00       	push   $0x9ed
 2c6:	6a 01                	push   $0x1
 2c8:	e8 69 04 00 00       	call   736 <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 6e 0a 00 00       	push   $0xa6e
 2d5:	68 00 0a 00 00       	push   $0xa00
 2da:	6a 01                	push   $0x1
 2dc:	e8 55 04 00 00       	call   736 <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 14 0a 00 00       	push   $0xa14
 2e9:	6a 01                	push   $0x1
 2eb:	e8 46 04 00 00       	call   736 <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 9c 0e 00 00    	push   0xe9c
 2f9:	e8 13 03 00 00       	call   611 <kill>
 2fe:	e8 de 02 00 00       	call   5e1 <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 e4 09 00 00       	push   $0x9e4
 30a:	68 ed 09 00 00       	push   $0x9ed
 30f:	6a 01                	push   $0x1
 311:	e8 20 04 00 00       	call   736 <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 50 0a 00 00       	push   $0xa50
 31e:	68 00 0a 00 00       	push   $0xa00
 323:	6a 01                	push   $0x1
 325:	e8 0c 04 00 00       	call   736 <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 14 0a 00 00       	push   $0xa14
 332:	6a 01                	push   $0x1
 334:	e8 fd 03 00 00       	call   736 <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 9c 0e 00 00    	push   0xe9c
 342:	e8 ca 02 00 00       	call   611 <kill>
 347:	e8 95 02 00 00       	call   5e1 <exit>
   assert(global == 2);
 34c:	83 3d 98 0e 00 00 02 	cmpl   $0x2,0xe98
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 e4 09 00 00       	push   $0x9e4
 35c:	68 ed 09 00 00       	push   $0x9ed
 361:	6a 01                	push   $0x1
 363:	e8 ce 03 00 00       	call   736 <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 83 0a 00 00       	push   $0xa83
 370:	68 00 0a 00 00       	push   $0xa00
 375:	6a 01                	push   $0x1
 377:	e8 ba 03 00 00       	call   736 <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 14 0a 00 00       	push   $0xa14
 384:	6a 01                	push   $0x1
 386:	e8 ab 03 00 00       	call   736 <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 9c 0e 00 00    	push   0xe9c
 394:	e8 78 02 00 00       	call   611 <kill>
 399:	e8 43 02 00 00       	call   5e1 <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 8f 0a 00 00       	push   $0xa8f
 3a6:	6a 01                	push   $0x1
 3a8:	e8 89 03 00 00       	call   736 <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 e7 04 00 00       	call   89c <free>
   exit();
 3b5:	e8 27 02 00 00       	call   5e1 <exit>

000003ba <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	56                   	push   %esi
 3be:	53                   	push   %ebx
 3bf:	8b 75 08             	mov    0x8(%ebp),%esi
 3c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3c5:	89 f0                	mov    %esi,%eax
 3c7:	89 d1                	mov    %edx,%ecx
 3c9:	83 c2 01             	add    $0x1,%edx
 3cc:	89 c3                	mov    %eax,%ebx
 3ce:	83 c0 01             	add    $0x1,%eax
 3d1:	0f b6 09             	movzbl (%ecx),%ecx
 3d4:	88 0b                	mov    %cl,(%ebx)
 3d6:	84 c9                	test   %cl,%cl
 3d8:	75 ed                	jne    3c7 <strcpy+0xd>
    ;
  return os;
}
 3da:	89 f0                	mov    %esi,%eax
 3dc:	5b                   	pop    %ebx
 3dd:	5e                   	pop    %esi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e6:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3e9:	eb 06                	jmp    3f1 <strcmp+0x11>
    p++, q++;
 3eb:	83 c1 01             	add    $0x1,%ecx
 3ee:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f1:	0f b6 01             	movzbl (%ecx),%eax
 3f4:	84 c0                	test   %al,%al
 3f6:	74 04                	je     3fc <strcmp+0x1c>
 3f8:	3a 02                	cmp    (%edx),%al
 3fa:	74 ef                	je     3eb <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3fc:	0f b6 c0             	movzbl %al,%eax
 3ff:	0f b6 12             	movzbl (%edx),%edx
 402:	29 d0                	sub    %edx,%eax
}
 404:	5d                   	pop    %ebp
 405:	c3                   	ret    

00000406 <strlen>:

uint
strlen(const char *s)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 40c:	b8 00 00 00 00       	mov    $0x0,%eax
 411:	eb 03                	jmp    416 <strlen+0x10>
 413:	83 c0 01             	add    $0x1,%eax
 416:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41a:	75 f7                	jne    413 <strlen+0xd>
    ;
  return n;
}
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    

0000041e <memset>:

void*
memset(void *dst, int c, uint n)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	57                   	push   %edi
 422:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 425:	89 d7                	mov    %edx,%edi
 427:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	fc                   	cld    
 42e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 430:	89 d0                	mov    %edx,%eax
 432:	8b 7d fc             	mov    -0x4(%ebp),%edi
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <strchr>:

char*
strchr(const char *s, char c)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
 43d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 441:	eb 03                	jmp    446 <strchr+0xf>
 443:	83 c0 01             	add    $0x1,%eax
 446:	0f b6 10             	movzbl (%eax),%edx
 449:	84 d2                	test   %dl,%dl
 44b:	74 06                	je     453 <strchr+0x1c>
    if(*s == c)
 44d:	38 ca                	cmp    %cl,%dl
 44f:	75 f2                	jne    443 <strchr+0xc>
 451:	eb 05                	jmp    458 <strchr+0x21>
      return (char*)s;
  return 0;
 453:	b8 00 00 00 00       	mov    $0x0,%eax
}
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <gets>:

char*
gets(char *buf, int max)
{
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	57                   	push   %edi
 45e:	56                   	push   %esi
 45f:	53                   	push   %ebx
 460:	83 ec 1c             	sub    $0x1c,%esp
 463:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 466:	bb 00 00 00 00       	mov    $0x0,%ebx
 46b:	89 de                	mov    %ebx,%esi
 46d:	83 c3 01             	add    $0x1,%ebx
 470:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 473:	7d 2e                	jge    4a3 <gets+0x49>
    cc = read(0, &c, 1);
 475:	83 ec 04             	sub    $0x4,%esp
 478:	6a 01                	push   $0x1
 47a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 47d:	50                   	push   %eax
 47e:	6a 00                	push   $0x0
 480:	e8 74 01 00 00       	call   5f9 <read>
    if(cc < 1)
 485:	83 c4 10             	add    $0x10,%esp
 488:	85 c0                	test   %eax,%eax
 48a:	7e 17                	jle    4a3 <gets+0x49>
      break;
    buf[i++] = c;
 48c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 490:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 493:	3c 0a                	cmp    $0xa,%al
 495:	0f 94 c2             	sete   %dl
 498:	3c 0d                	cmp    $0xd,%al
 49a:	0f 94 c0             	sete   %al
 49d:	08 c2                	or     %al,%dl
 49f:	74 ca                	je     46b <gets+0x11>
    buf[i++] = c;
 4a1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4a7:	89 f8                	mov    %edi,%eax
 4a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ac:	5b                   	pop    %ebx
 4ad:	5e                   	pop    %esi
 4ae:	5f                   	pop    %edi
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    

000004b1 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b6:	83 ec 08             	sub    $0x8,%esp
 4b9:	6a 00                	push   $0x0
 4bb:	ff 75 08             	push   0x8(%ebp)
 4be:	e8 5e 01 00 00       	call   621 <open>
  if(fd < 0)
 4c3:	83 c4 10             	add    $0x10,%esp
 4c6:	85 c0                	test   %eax,%eax
 4c8:	78 24                	js     4ee <stat+0x3d>
 4ca:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4cc:	83 ec 08             	sub    $0x8,%esp
 4cf:	ff 75 0c             	push   0xc(%ebp)
 4d2:	50                   	push   %eax
 4d3:	e8 61 01 00 00       	call   639 <fstat>
 4d8:	89 c6                	mov    %eax,%esi
  close(fd);
 4da:	89 1c 24             	mov    %ebx,(%esp)
 4dd:	e8 27 01 00 00       	call   609 <close>
  return r;
 4e2:	83 c4 10             	add    $0x10,%esp
}
 4e5:	89 f0                	mov    %esi,%eax
 4e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5d                   	pop    %ebp
 4ed:	c3                   	ret    
    return -1;
 4ee:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f3:	eb f0                	jmp    4e5 <stat+0x34>

000004f5 <atoi>:

int
atoi(const char *s)
{
 4f5:	55                   	push   %ebp
 4f6:	89 e5                	mov    %esp,%ebp
 4f8:	53                   	push   %ebx
 4f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4fc:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 501:	eb 10                	jmp    513 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 503:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 506:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 509:	83 c1 01             	add    $0x1,%ecx
 50c:	0f be c0             	movsbl %al,%eax
 50f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 513:	0f b6 01             	movzbl (%ecx),%eax
 516:	8d 58 d0             	lea    -0x30(%eax),%ebx
 519:	80 fb 09             	cmp    $0x9,%bl
 51c:	76 e5                	jbe    503 <atoi+0xe>
  return n;
}
 51e:	89 d0                	mov    %edx,%eax
 520:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 523:	c9                   	leave  
 524:	c3                   	ret    

00000525 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	56                   	push   %esi
 529:	53                   	push   %ebx
 52a:	8b 75 08             	mov    0x8(%ebp),%esi
 52d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 530:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 533:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 535:	eb 0d                	jmp    544 <memmove+0x1f>
    *dst++ = *src++;
 537:	0f b6 01             	movzbl (%ecx),%eax
 53a:	88 02                	mov    %al,(%edx)
 53c:	8d 49 01             	lea    0x1(%ecx),%ecx
 53f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 542:	89 d8                	mov    %ebx,%eax
 544:	8d 58 ff             	lea    -0x1(%eax),%ebx
 547:	85 c0                	test   %eax,%eax
 549:	7f ec                	jg     537 <memmove+0x12>
  return vdst;
}
 54b:	89 f0                	mov    %esi,%eax
 54d:	5b                   	pop    %ebx
 54e:	5e                   	pop    %esi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    

00000551 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 551:	55                   	push   %ebp
 552:	89 e5                	mov    %esp,%ebp
 554:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 557:	68 00 10 00 00       	push   $0x1000
 55c:	e8 fb 03 00 00       	call   95c <malloc>

  return clone(start_routine, arg1, arg2, stack);
 561:	50                   	push   %eax
 562:	ff 75 10             	push   0x10(%ebp)
 565:	ff 75 0c             	push   0xc(%ebp)
 568:	ff 75 08             	push   0x8(%ebp)
 56b:	e8 11 01 00 00       	call   681 <clone>
}
 570:	c9                   	leave  
 571:	c3                   	ret    

00000572 <thread_join>:

int thread_join(){
 572:	55                   	push   %ebp
 573:	89 e5                	mov    %esp,%ebp
 575:	53                   	push   %ebx
 576:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 579:	8d 45 f4             	lea    -0xc(%ebp),%eax
 57c:	50                   	push   %eax
 57d:	e8 07 01 00 00       	call   689 <join>
  if (x < 0) {
 582:	83 c4 10             	add    $0x10,%esp
 585:	85 c0                	test   %eax,%eax
 587:	78 17                	js     5a0 <thread_join+0x2e>
 589:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 58b:	83 ec 0c             	sub    $0xc,%esp
 58e:	ff 75 f4             	push   -0xc(%ebp)
 591:	e8 06 03 00 00       	call   89c <free>
  return x;
 596:	83 c4 10             	add    $0x10,%esp
}
 599:	89 d8                	mov    %ebx,%eax
 59b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 59e:	c9                   	leave  
 59f:	c3                   	ret    
    return -1;
 5a0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 5a5:	eb f2                	jmp    599 <thread_join+0x27>

000005a7 <lock_init>:

void lock_init(lock_t *spin){
 5a7:	55                   	push   %ebp
 5a8:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 5aa:	8b 45 08             	mov    0x8(%ebp),%eax
 5ad:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5b3:	5d                   	pop    %ebp
 5b4:	c3                   	ret    

000005b5 <lock_acquire>:

void lock_acquire(lock_t *spin){
 5b5:	55                   	push   %ebp
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5bb:	b8 01 00 00 00       	mov    $0x1,%eax
 5c0:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 5c3:	85 c0                	test   %eax,%eax
 5c5:	75 f4                	jne    5bb <lock_acquire+0x6>

}
 5c7:	5d                   	pop    %ebp
 5c8:	c3                   	ret    

000005c9 <lock_release>:

void lock_release(lock_t *spin){
 5c9:	55                   	push   %ebp
 5ca:	89 e5                	mov    %esp,%ebp
 5cc:	8b 55 08             	mov    0x8(%ebp),%edx
 5cf:	b8 00 00 00 00       	mov    $0x0,%eax
 5d4:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 5d7:	5d                   	pop    %ebp
 5d8:	c3                   	ret    

000005d9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5d9:	b8 01 00 00 00       	mov    $0x1,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <exit>:
SYSCALL(exit)
 5e1:	b8 02 00 00 00       	mov    $0x2,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <wait>:
SYSCALL(wait)
 5e9:	b8 03 00 00 00       	mov    $0x3,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <pipe>:
SYSCALL(pipe)
 5f1:	b8 04 00 00 00       	mov    $0x4,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <read>:
SYSCALL(read)
 5f9:	b8 05 00 00 00       	mov    $0x5,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <write>:
SYSCALL(write)
 601:	b8 10 00 00 00       	mov    $0x10,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <close>:
SYSCALL(close)
 609:	b8 15 00 00 00       	mov    $0x15,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <kill>:
SYSCALL(kill)
 611:	b8 06 00 00 00       	mov    $0x6,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <exec>:
SYSCALL(exec)
 619:	b8 07 00 00 00       	mov    $0x7,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <open>:
SYSCALL(open)
 621:	b8 0f 00 00 00       	mov    $0xf,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <mknod>:
SYSCALL(mknod)
 629:	b8 11 00 00 00       	mov    $0x11,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <unlink>:
SYSCALL(unlink)
 631:	b8 12 00 00 00       	mov    $0x12,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <fstat>:
SYSCALL(fstat)
 639:	b8 08 00 00 00       	mov    $0x8,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <link>:
SYSCALL(link)
 641:	b8 13 00 00 00       	mov    $0x13,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <mkdir>:
SYSCALL(mkdir)
 649:	b8 14 00 00 00       	mov    $0x14,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <chdir>:
SYSCALL(chdir)
 651:	b8 09 00 00 00       	mov    $0x9,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <dup>:
SYSCALL(dup)
 659:	b8 0a 00 00 00       	mov    $0xa,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <getpid>:
SYSCALL(getpid)
 661:	b8 0b 00 00 00       	mov    $0xb,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <sbrk>:
SYSCALL(sbrk)
 669:	b8 0c 00 00 00       	mov    $0xc,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <sleep>:
SYSCALL(sleep)
 671:	b8 0d 00 00 00       	mov    $0xd,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <uptime>:
SYSCALL(uptime)
 679:	b8 0e 00 00 00       	mov    $0xe,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <clone>:
SYSCALL(clone)
 681:	b8 16 00 00 00       	mov    $0x16,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <join>:
 689:	b8 17 00 00 00       	mov    $0x17,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 691:	55                   	push   %ebp
 692:	89 e5                	mov    %esp,%ebp
 694:	83 ec 1c             	sub    $0x1c,%esp
 697:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 69a:	6a 01                	push   $0x1
 69c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 69f:	52                   	push   %edx
 6a0:	50                   	push   %eax
 6a1:	e8 5b ff ff ff       	call   601 <write>
}
 6a6:	83 c4 10             	add    $0x10,%esp
 6a9:	c9                   	leave  
 6aa:	c3                   	ret    

000006ab <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6ab:	55                   	push   %ebp
 6ac:	89 e5                	mov    %esp,%ebp
 6ae:	57                   	push   %edi
 6af:	56                   	push   %esi
 6b0:	53                   	push   %ebx
 6b1:	83 ec 2c             	sub    $0x2c,%esp
 6b4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6b7:	89 d0                	mov    %edx,%eax
 6b9:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6bb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6bf:	0f 95 c1             	setne  %cl
 6c2:	c1 ea 1f             	shr    $0x1f,%edx
 6c5:	84 d1                	test   %dl,%cl
 6c7:	74 44                	je     70d <printint+0x62>
    neg = 1;
    x = -xx;
 6c9:	f7 d8                	neg    %eax
 6cb:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6cd:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d4:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6d9:	89 c8                	mov    %ecx,%eax
 6db:	ba 00 00 00 00       	mov    $0x0,%edx
 6e0:	f7 f6                	div    %esi
 6e2:	89 df                	mov    %ebx,%edi
 6e4:	83 c3 01             	add    $0x1,%ebx
 6e7:	0f b6 92 28 0b 00 00 	movzbl 0xb28(%edx),%edx
 6ee:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6f2:	89 ca                	mov    %ecx,%edx
 6f4:	89 c1                	mov    %eax,%ecx
 6f6:	39 d6                	cmp    %edx,%esi
 6f8:	76 df                	jbe    6d9 <printint+0x2e>
  if(neg)
 6fa:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6fe:	74 31                	je     731 <printint+0x86>
    buf[i++] = '-';
 700:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 705:	8d 5f 02             	lea    0x2(%edi),%ebx
 708:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70b:	eb 17                	jmp    724 <printint+0x79>
    x = xx;
 70d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 70f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 716:	eb bc                	jmp    6d4 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 718:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 71d:	89 f0                	mov    %esi,%eax
 71f:	e8 6d ff ff ff       	call   691 <putc>
  while(--i >= 0)
 724:	83 eb 01             	sub    $0x1,%ebx
 727:	79 ef                	jns    718 <printint+0x6d>
}
 729:	83 c4 2c             	add    $0x2c,%esp
 72c:	5b                   	pop    %ebx
 72d:	5e                   	pop    %esi
 72e:	5f                   	pop    %edi
 72f:	5d                   	pop    %ebp
 730:	c3                   	ret    
 731:	8b 75 d0             	mov    -0x30(%ebp),%esi
 734:	eb ee                	jmp    724 <printint+0x79>

00000736 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 736:	55                   	push   %ebp
 737:	89 e5                	mov    %esp,%ebp
 739:	57                   	push   %edi
 73a:	56                   	push   %esi
 73b:	53                   	push   %ebx
 73c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 73f:	8d 45 10             	lea    0x10(%ebp),%eax
 742:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 745:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 74a:	bb 00 00 00 00       	mov    $0x0,%ebx
 74f:	eb 14                	jmp    765 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 751:	89 fa                	mov    %edi,%edx
 753:	8b 45 08             	mov    0x8(%ebp),%eax
 756:	e8 36 ff ff ff       	call   691 <putc>
 75b:	eb 05                	jmp    762 <printf+0x2c>
      }
    } else if(state == '%'){
 75d:	83 fe 25             	cmp    $0x25,%esi
 760:	74 25                	je     787 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 762:	83 c3 01             	add    $0x1,%ebx
 765:	8b 45 0c             	mov    0xc(%ebp),%eax
 768:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 76c:	84 c0                	test   %al,%al
 76e:	0f 84 20 01 00 00    	je     894 <printf+0x15e>
    c = fmt[i] & 0xff;
 774:	0f be f8             	movsbl %al,%edi
 777:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 77a:	85 f6                	test   %esi,%esi
 77c:	75 df                	jne    75d <printf+0x27>
      if(c == '%'){
 77e:	83 f8 25             	cmp    $0x25,%eax
 781:	75 ce                	jne    751 <printf+0x1b>
        state = '%';
 783:	89 c6                	mov    %eax,%esi
 785:	eb db                	jmp    762 <printf+0x2c>
      if(c == 'd'){
 787:	83 f8 25             	cmp    $0x25,%eax
 78a:	0f 84 cf 00 00 00    	je     85f <printf+0x129>
 790:	0f 8c dd 00 00 00    	jl     873 <printf+0x13d>
 796:	83 f8 78             	cmp    $0x78,%eax
 799:	0f 8f d4 00 00 00    	jg     873 <printf+0x13d>
 79f:	83 f8 63             	cmp    $0x63,%eax
 7a2:	0f 8c cb 00 00 00    	jl     873 <printf+0x13d>
 7a8:	83 e8 63             	sub    $0x63,%eax
 7ab:	83 f8 15             	cmp    $0x15,%eax
 7ae:	0f 87 bf 00 00 00    	ja     873 <printf+0x13d>
 7b4:	ff 24 85 d0 0a 00 00 	jmp    *0xad0(,%eax,4)
        printint(fd, *ap, 10, 1);
 7bb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7be:	8b 17                	mov    (%edi),%edx
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	6a 01                	push   $0x1
 7c5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7ca:	8b 45 08             	mov    0x8(%ebp),%eax
 7cd:	e8 d9 fe ff ff       	call   6ab <printint>
        ap++;
 7d2:	83 c7 04             	add    $0x4,%edi
 7d5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7d8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7db:	be 00 00 00 00       	mov    $0x0,%esi
 7e0:	eb 80                	jmp    762 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e5:	8b 17                	mov    (%edi),%edx
 7e7:	83 ec 0c             	sub    $0xc,%esp
 7ea:	6a 00                	push   $0x0
 7ec:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f1:	8b 45 08             	mov    0x8(%ebp),%eax
 7f4:	e8 b2 fe ff ff       	call   6ab <printint>
        ap++;
 7f9:	83 c7 04             	add    $0x4,%edi
 7fc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7ff:	83 c4 10             	add    $0x10,%esp
      state = 0;
 802:	be 00 00 00 00       	mov    $0x0,%esi
 807:	e9 56 ff ff ff       	jmp    762 <printf+0x2c>
        s = (char*)*ap;
 80c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80f:	8b 30                	mov    (%eax),%esi
        ap++;
 811:	83 c0 04             	add    $0x4,%eax
 814:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 817:	85 f6                	test   %esi,%esi
 819:	75 15                	jne    830 <printf+0xfa>
          s = "(null)";
 81b:	be c7 0a 00 00       	mov    $0xac7,%esi
 820:	eb 0e                	jmp    830 <printf+0xfa>
          putc(fd, *s);
 822:	0f be d2             	movsbl %dl,%edx
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	e8 64 fe ff ff       	call   691 <putc>
          s++;
 82d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 830:	0f b6 16             	movzbl (%esi),%edx
 833:	84 d2                	test   %dl,%dl
 835:	75 eb                	jne    822 <printf+0xec>
      state = 0;
 837:	be 00 00 00 00       	mov    $0x0,%esi
 83c:	e9 21 ff ff ff       	jmp    762 <printf+0x2c>
        putc(fd, *ap);
 841:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 844:	0f be 17             	movsbl (%edi),%edx
 847:	8b 45 08             	mov    0x8(%ebp),%eax
 84a:	e8 42 fe ff ff       	call   691 <putc>
        ap++;
 84f:	83 c7 04             	add    $0x4,%edi
 852:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 855:	be 00 00 00 00       	mov    $0x0,%esi
 85a:	e9 03 ff ff ff       	jmp    762 <printf+0x2c>
        putc(fd, c);
 85f:	89 fa                	mov    %edi,%edx
 861:	8b 45 08             	mov    0x8(%ebp),%eax
 864:	e8 28 fe ff ff       	call   691 <putc>
      state = 0;
 869:	be 00 00 00 00       	mov    $0x0,%esi
 86e:	e9 ef fe ff ff       	jmp    762 <printf+0x2c>
        putc(fd, '%');
 873:	ba 25 00 00 00       	mov    $0x25,%edx
 878:	8b 45 08             	mov    0x8(%ebp),%eax
 87b:	e8 11 fe ff ff       	call   691 <putc>
        putc(fd, c);
 880:	89 fa                	mov    %edi,%edx
 882:	8b 45 08             	mov    0x8(%ebp),%eax
 885:	e8 07 fe ff ff       	call   691 <putc>
      state = 0;
 88a:	be 00 00 00 00       	mov    $0x0,%esi
 88f:	e9 ce fe ff ff       	jmp    762 <printf+0x2c>
    }
  }
}
 894:	8d 65 f4             	lea    -0xc(%ebp),%esp
 897:	5b                   	pop    %ebx
 898:	5e                   	pop    %esi
 899:	5f                   	pop    %edi
 89a:	5d                   	pop    %ebp
 89b:	c3                   	ret    

0000089c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 89c:	55                   	push   %ebp
 89d:	89 e5                	mov    %esp,%ebp
 89f:	57                   	push   %edi
 8a0:	56                   	push   %esi
 8a1:	53                   	push   %ebx
 8a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a8:	a1 a0 0e 00 00       	mov    0xea0,%eax
 8ad:	eb 02                	jmp    8b1 <free+0x15>
 8af:	89 d0                	mov    %edx,%eax
 8b1:	39 c8                	cmp    %ecx,%eax
 8b3:	73 04                	jae    8b9 <free+0x1d>
 8b5:	39 08                	cmp    %ecx,(%eax)
 8b7:	77 12                	ja     8cb <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b9:	8b 10                	mov    (%eax),%edx
 8bb:	39 c2                	cmp    %eax,%edx
 8bd:	77 f0                	ja     8af <free+0x13>
 8bf:	39 c8                	cmp    %ecx,%eax
 8c1:	72 08                	jb     8cb <free+0x2f>
 8c3:	39 ca                	cmp    %ecx,%edx
 8c5:	77 04                	ja     8cb <free+0x2f>
 8c7:	89 d0                	mov    %edx,%eax
 8c9:	eb e6                	jmp    8b1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8cb:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8ce:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d1:	8b 10                	mov    (%eax),%edx
 8d3:	39 d7                	cmp    %edx,%edi
 8d5:	74 19                	je     8f0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8d7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8da:	8b 50 04             	mov    0x4(%eax),%edx
 8dd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e0:	39 ce                	cmp    %ecx,%esi
 8e2:	74 1b                	je     8ff <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e4:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8e6:	a3 a0 0e 00 00       	mov    %eax,0xea0
}
 8eb:	5b                   	pop    %ebx
 8ec:	5e                   	pop    %esi
 8ed:	5f                   	pop    %edi
 8ee:	5d                   	pop    %ebp
 8ef:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8f0:	03 72 04             	add    0x4(%edx),%esi
 8f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	8b 12                	mov    (%edx),%edx
 8fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8fd:	eb db                	jmp    8da <free+0x3e>
    p->s.size += bp->s.size;
 8ff:	03 53 fc             	add    -0x4(%ebx),%edx
 902:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 905:	8b 53 f8             	mov    -0x8(%ebx),%edx
 908:	89 10                	mov    %edx,(%eax)
 90a:	eb da                	jmp    8e6 <free+0x4a>

0000090c <morecore>:

static Header*
morecore(uint nu)
{
 90c:	55                   	push   %ebp
 90d:	89 e5                	mov    %esp,%ebp
 90f:	53                   	push   %ebx
 910:	83 ec 04             	sub    $0x4,%esp
 913:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 915:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 91a:	77 05                	ja     921 <morecore+0x15>
    nu = 4096;
 91c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 921:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 928:	83 ec 0c             	sub    $0xc,%esp
 92b:	50                   	push   %eax
 92c:	e8 38 fd ff ff       	call   669 <sbrk>
  if(p == (char*)-1)
 931:	83 c4 10             	add    $0x10,%esp
 934:	83 f8 ff             	cmp    $0xffffffff,%eax
 937:	74 1c                	je     955 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 939:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 93c:	83 c0 08             	add    $0x8,%eax
 93f:	83 ec 0c             	sub    $0xc,%esp
 942:	50                   	push   %eax
 943:	e8 54 ff ff ff       	call   89c <free>
  return freep;
 948:	a1 a0 0e 00 00       	mov    0xea0,%eax
 94d:	83 c4 10             	add    $0x10,%esp
}
 950:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 953:	c9                   	leave  
 954:	c3                   	ret    
    return 0;
 955:	b8 00 00 00 00       	mov    $0x0,%eax
 95a:	eb f4                	jmp    950 <morecore+0x44>

0000095c <malloc>:

void*
malloc(uint nbytes)
{
 95c:	55                   	push   %ebp
 95d:	89 e5                	mov    %esp,%ebp
 95f:	53                   	push   %ebx
 960:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 963:	8b 45 08             	mov    0x8(%ebp),%eax
 966:	8d 58 07             	lea    0x7(%eax),%ebx
 969:	c1 eb 03             	shr    $0x3,%ebx
 96c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 96f:	8b 0d a0 0e 00 00    	mov    0xea0,%ecx
 975:	85 c9                	test   %ecx,%ecx
 977:	74 04                	je     97d <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 979:	8b 01                	mov    (%ecx),%eax
 97b:	eb 4a                	jmp    9c7 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 97d:	c7 05 a0 0e 00 00 a4 	movl   $0xea4,0xea0
 984:	0e 00 00 
 987:	c7 05 a4 0e 00 00 a4 	movl   $0xea4,0xea4
 98e:	0e 00 00 
    base.s.size = 0;
 991:	c7 05 a8 0e 00 00 00 	movl   $0x0,0xea8
 998:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 99b:	b9 a4 0e 00 00       	mov    $0xea4,%ecx
 9a0:	eb d7                	jmp    979 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9a2:	74 19                	je     9bd <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a4:	29 da                	sub    %ebx,%edx
 9a6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9a9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9ac:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9af:	89 0d a0 0e 00 00    	mov    %ecx,0xea0
      return (void*)(p + 1);
 9b5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9bb:	c9                   	leave  
 9bc:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9bd:	8b 10                	mov    (%eax),%edx
 9bf:	89 11                	mov    %edx,(%ecx)
 9c1:	eb ec                	jmp    9af <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c3:	89 c1                	mov    %eax,%ecx
 9c5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9c7:	8b 50 04             	mov    0x4(%eax),%edx
 9ca:	39 da                	cmp    %ebx,%edx
 9cc:	73 d4                	jae    9a2 <malloc+0x46>
    if(p == freep)
 9ce:	39 05 a0 0e 00 00    	cmp    %eax,0xea0
 9d4:	75 ed                	jne    9c3 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9d6:	89 d8                	mov    %ebx,%eax
 9d8:	e8 2f ff ff ff       	call   90c <morecore>
 9dd:	85 c0                	test   %eax,%eax
 9df:	75 e2                	jne    9c3 <malloc+0x67>
 9e1:	eb d5                	jmp    9b8 <malloc+0x5c>
