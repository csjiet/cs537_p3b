
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
  2c:	68 e8 09 00 00       	push   $0x9e8
  31:	68 f1 09 00 00       	push   $0x9f1
  36:	6a 01                	push   $0x1
  38:	e8 fc 06 00 00       	call   739 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 30 0a 00 00       	push   $0xa30
  45:	68 04 0a 00 00       	push   $0xa04
  4a:	6a 01                	push   $0x1
  4c:	e8 e8 06 00 00       	call   739 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 18 0a 00 00       	push   $0xa18
  59:	6a 01                	push   $0x1
  5b:	e8 d9 06 00 00       	call   739 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 9c 0e 00 00    	push   0xe9c
  69:	e8 a6 05 00 00       	call   614 <kill>
  6e:	e8 71 05 00 00       	call   5e4 <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 e8 09 00 00       	push   $0x9e8
  7a:	68 f1 09 00 00       	push   $0x9f1
  7f:	6a 01                	push   $0x1
  81:	e8 b3 06 00 00       	call   739 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 f9 09 00 00       	push   $0x9f9
  8e:	68 04 0a 00 00       	push   $0xa04
  93:	6a 01                	push   $0x1
  95:	e8 9f 06 00 00       	call   739 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 18 0a 00 00       	push   $0xa18
  a2:	6a 01                	push   $0x1
  a4:	e8 90 06 00 00       	call   739 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 9c 0e 00 00    	push   0xe9c
  b2:	e8 5d 05 00 00       	call   614 <kill>
  b7:	e8 28 05 00 00       	call   5e4 <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 e8 09 00 00       	push   $0x9e8
  c3:	68 f1 09 00 00       	push   $0x9f1
  c8:	6a 01                	push   $0x1
  ca:	e8 6a 06 00 00       	call   739 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 25 0a 00 00       	push   $0xa25
  d7:	68 04 0a 00 00       	push   $0xa04
  dc:	6a 01                	push   $0x1
  de:	e8 56 06 00 00       	call   739 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 18 0a 00 00       	push   $0xa18
  eb:	6a 01                	push   $0x1
  ed:	e8 47 06 00 00       	call   739 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 9c 0e 00 00    	push   0xe9c
  fb:	e8 14 05 00 00       	call   614 <kill>
 100:	e8 df 04 00 00       	call   5e4 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 98 0e 00 00       	mov    %eax,0xe98
   exit();
 10d:	e8 d2 04 00 00       	call   5e4 <exit>

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
 126:	e8 39 05 00 00       	call   664 <getpid>
 12b:	a3 9c 0e 00 00       	mov    %eax,0xe9c
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 22 08 00 00       	call   95f <malloc>
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
 15a:	68 e8 09 00 00       	push   $0x9e8
 15f:	68 f1 09 00 00       	push   $0x9f1
 164:	6a 01                	push   $0x1
 166:	e8 ce 05 00 00       	call   739 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 3c 0a 00 00       	push   $0xa3c
 173:	68 04 0a 00 00       	push   $0xa04
 178:	6a 01                	push   $0x1
 17a:	e8 ba 05 00 00       	call   739 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 18 0a 00 00       	push   $0xa18
 187:	6a 01                	push   $0x1
 189:	e8 ab 05 00 00       	call   739 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 9c 0e 00 00    	push   0xe9c
 197:	e8 78 04 00 00       	call   614 <kill>
 19c:	e8 43 04 00 00       	call   5e4 <exit>
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
 1bf:	e8 c0 04 00 00       	call   684 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 8e 04 00 00       	call   66c <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 82 04 00 00       	call   66c <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 8e 04 00 00       	call   68c <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 e8 09 00 00       	push   $0x9e8
 211:	68 f1 09 00 00       	push   $0x9f1
 216:	6a 01                	push   $0x1
 218:	e8 1c 05 00 00       	call   739 <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 a0 0a 00 00       	push   $0xaa0
 225:	68 04 0a 00 00       	push   $0xa04
 22a:	6a 01                	push   $0x1
 22c:	e8 08 05 00 00       	call   739 <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 18 0a 00 00       	push   $0xa18
 239:	6a 01                	push   $0x1
 23b:	e8 f9 04 00 00       	call   739 <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 9c 0e 00 00    	push   0xe9c
 249:	e8 c6 03 00 00       	call   614 <kill>
 24e:	e8 91 03 00 00       	call   5e4 <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 e8 09 00 00       	push   $0x9e8
 25a:	68 f1 09 00 00       	push   $0x9f1
 25f:	6a 01                	push   $0x1
 261:	e8 d3 04 00 00       	call   739 <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 46 0a 00 00       	push   $0xa46
 26e:	68 04 0a 00 00       	push   $0xa04
 273:	6a 01                	push   $0x1
 275:	e8 bf 04 00 00       	call   739 <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 18 0a 00 00       	push   $0xa18
 282:	6a 01                	push   $0x1
 284:	e8 b0 04 00 00       	call   739 <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 9c 0e 00 00    	push   0xe9c
 292:	e8 7d 03 00 00       	call   614 <kill>
 297:	e8 48 03 00 00       	call   5e4 <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 e5 03 00 00       	call   68c <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 e8 09 00 00       	push   $0x9e8
 2c1:	68 f1 09 00 00       	push   $0x9f1
 2c6:	6a 01                	push   $0x1
 2c8:	e8 6c 04 00 00       	call   739 <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 72 0a 00 00       	push   $0xa72
 2d5:	68 04 0a 00 00       	push   $0xa04
 2da:	6a 01                	push   $0x1
 2dc:	e8 58 04 00 00       	call   739 <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 18 0a 00 00       	push   $0xa18
 2e9:	6a 01                	push   $0x1
 2eb:	e8 49 04 00 00       	call   739 <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 9c 0e 00 00    	push   0xe9c
 2f9:	e8 16 03 00 00       	call   614 <kill>
 2fe:	e8 e1 02 00 00       	call   5e4 <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 e8 09 00 00       	push   $0x9e8
 30a:	68 f1 09 00 00       	push   $0x9f1
 30f:	6a 01                	push   $0x1
 311:	e8 23 04 00 00       	call   739 <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 54 0a 00 00       	push   $0xa54
 31e:	68 04 0a 00 00       	push   $0xa04
 323:	6a 01                	push   $0x1
 325:	e8 0f 04 00 00       	call   739 <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 18 0a 00 00       	push   $0xa18
 332:	6a 01                	push   $0x1
 334:	e8 00 04 00 00       	call   739 <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 9c 0e 00 00    	push   0xe9c
 342:	e8 cd 02 00 00       	call   614 <kill>
 347:	e8 98 02 00 00       	call   5e4 <exit>
   assert(global == 2);
 34c:	83 3d 98 0e 00 00 02 	cmpl   $0x2,0xe98
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 e8 09 00 00       	push   $0x9e8
 35c:	68 f1 09 00 00       	push   $0x9f1
 361:	6a 01                	push   $0x1
 363:	e8 d1 03 00 00       	call   739 <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 87 0a 00 00       	push   $0xa87
 370:	68 04 0a 00 00       	push   $0xa04
 375:	6a 01                	push   $0x1
 377:	e8 bd 03 00 00       	call   739 <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 18 0a 00 00       	push   $0xa18
 384:	6a 01                	push   $0x1
 386:	e8 ae 03 00 00       	call   739 <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 9c 0e 00 00    	push   0xe9c
 394:	e8 7b 02 00 00       	call   614 <kill>
 399:	e8 46 02 00 00       	call   5e4 <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 93 0a 00 00       	push   $0xa93
 3a6:	6a 01                	push   $0x1
 3a8:	e8 8c 03 00 00       	call   739 <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 ea 04 00 00       	call   89f <free>
   exit();
 3b5:	e8 2a 02 00 00       	call   5e4 <exit>

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
 480:	e8 77 01 00 00       	call   5fc <read>
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
 4be:	e8 61 01 00 00       	call   624 <open>
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
 4d3:	e8 64 01 00 00       	call   63c <fstat>
 4d8:	89 c6                	mov    %eax,%esi
  close(fd);
 4da:	89 1c 24             	mov    %ebx,(%esp)
 4dd:	e8 2a 01 00 00       	call   60c <close>
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

  void* stack = malloc(2 * PGSIZE);
 557:	68 00 20 00 00       	push   $0x2000
 55c:	e8 fe 03 00 00       	call   95f <malloc>
  if ((uint)stack%PGSIZE){
 561:	83 c4 10             	add    $0x10,%esp
 564:	a9 ff 0f 00 00       	test   $0xfff,%eax
 569:	74 0a                	je     575 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 56b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 570:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 575:	50                   	push   %eax
 576:	ff 75 10             	push   0x10(%ebp)
 579:	ff 75 0c             	push   0xc(%ebp)
 57c:	ff 75 08             	push   0x8(%ebp)
 57f:	e8 00 01 00 00       	call   684 <clone>
}
 584:	c9                   	leave  
 585:	c3                   	ret    

00000586 <thread_join>:

int thread_join(){
 586:	55                   	push   %ebp
 587:	89 e5                	mov    %esp,%ebp
 589:	53                   	push   %ebx
 58a:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 58d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 590:	50                   	push   %eax
 591:	e8 f6 00 00 00       	call   68c <join>
 596:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 598:	83 c4 04             	add    $0x4,%esp
 59b:	ff 75 f4             	push   -0xc(%ebp)
 59e:	e8 fc 02 00 00       	call   89f <free>
  return x;
}
 5a3:	89 d8                	mov    %ebx,%eax
 5a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a8:	c9                   	leave  
 5a9:	c3                   	ret    

000005aa <lock_init>:

void lock_init(lock_t *spin){
 5aa:	55                   	push   %ebp
 5ab:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
 5b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    

000005b8 <lock_acquire>:

void lock_acquire(lock_t *spin){
 5b8:	55                   	push   %ebp
 5b9:	89 e5                	mov    %esp,%ebp
 5bb:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5be:	b8 01 00 00 00       	mov    $0x1,%eax
 5c3:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 5c6:	85 c0                	test   %eax,%eax
 5c8:	75 f4                	jne    5be <lock_acquire+0x6>

}
 5ca:	5d                   	pop    %ebp
 5cb:	c3                   	ret    

000005cc <lock_release>:

void lock_release(lock_t *spin){
 5cc:	55                   	push   %ebp
 5cd:	89 e5                	mov    %esp,%ebp
 5cf:	8b 55 08             	mov    0x8(%ebp),%edx
 5d2:	b8 00 00 00 00       	mov    $0x0,%eax
 5d7:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    

000005dc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5dc:	b8 01 00 00 00       	mov    $0x1,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <exit>:
SYSCALL(exit)
 5e4:	b8 02 00 00 00       	mov    $0x2,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <wait>:
SYSCALL(wait)
 5ec:	b8 03 00 00 00       	mov    $0x3,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <pipe>:
SYSCALL(pipe)
 5f4:	b8 04 00 00 00       	mov    $0x4,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <read>:
SYSCALL(read)
 5fc:	b8 05 00 00 00       	mov    $0x5,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <write>:
SYSCALL(write)
 604:	b8 10 00 00 00       	mov    $0x10,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <close>:
SYSCALL(close)
 60c:	b8 15 00 00 00       	mov    $0x15,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <kill>:
SYSCALL(kill)
 614:	b8 06 00 00 00       	mov    $0x6,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <exec>:
SYSCALL(exec)
 61c:	b8 07 00 00 00       	mov    $0x7,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <open>:
SYSCALL(open)
 624:	b8 0f 00 00 00       	mov    $0xf,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <mknod>:
SYSCALL(mknod)
 62c:	b8 11 00 00 00       	mov    $0x11,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <unlink>:
SYSCALL(unlink)
 634:	b8 12 00 00 00       	mov    $0x12,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <fstat>:
SYSCALL(fstat)
 63c:	b8 08 00 00 00       	mov    $0x8,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <link>:
SYSCALL(link)
 644:	b8 13 00 00 00       	mov    $0x13,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <mkdir>:
SYSCALL(mkdir)
 64c:	b8 14 00 00 00       	mov    $0x14,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <chdir>:
SYSCALL(chdir)
 654:	b8 09 00 00 00       	mov    $0x9,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <dup>:
SYSCALL(dup)
 65c:	b8 0a 00 00 00       	mov    $0xa,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <getpid>:
SYSCALL(getpid)
 664:	b8 0b 00 00 00       	mov    $0xb,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <sbrk>:
SYSCALL(sbrk)
 66c:	b8 0c 00 00 00       	mov    $0xc,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <sleep>:
SYSCALL(sleep)
 674:	b8 0d 00 00 00       	mov    $0xd,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <uptime>:
SYSCALL(uptime)
 67c:	b8 0e 00 00 00       	mov    $0xe,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <clone>:
SYSCALL(clone)
 684:	b8 16 00 00 00       	mov    $0x16,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <join>:
 68c:	b8 17 00 00 00       	mov    $0x17,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	83 ec 1c             	sub    $0x1c,%esp
 69a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 69d:	6a 01                	push   $0x1
 69f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6a2:	52                   	push   %edx
 6a3:	50                   	push   %eax
 6a4:	e8 5b ff ff ff       	call   604 <write>
}
 6a9:	83 c4 10             	add    $0x10,%esp
 6ac:	c9                   	leave  
 6ad:	c3                   	ret    

000006ae <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6ae:	55                   	push   %ebp
 6af:	89 e5                	mov    %esp,%ebp
 6b1:	57                   	push   %edi
 6b2:	56                   	push   %esi
 6b3:	53                   	push   %ebx
 6b4:	83 ec 2c             	sub    $0x2c,%esp
 6b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6ba:	89 d0                	mov    %edx,%eax
 6bc:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6be:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6c2:	0f 95 c1             	setne  %cl
 6c5:	c1 ea 1f             	shr    $0x1f,%edx
 6c8:	84 d1                	test   %dl,%cl
 6ca:	74 44                	je     710 <printint+0x62>
    neg = 1;
    x = -xx;
 6cc:	f7 d8                	neg    %eax
 6ce:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6d0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6dc:	89 c8                	mov    %ecx,%eax
 6de:	ba 00 00 00 00       	mov    $0x0,%edx
 6e3:	f7 f6                	div    %esi
 6e5:	89 df                	mov    %ebx,%edi
 6e7:	83 c3 01             	add    $0x1,%ebx
 6ea:	0f b6 92 2c 0b 00 00 	movzbl 0xb2c(%edx),%edx
 6f1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6f5:	89 ca                	mov    %ecx,%edx
 6f7:	89 c1                	mov    %eax,%ecx
 6f9:	39 d6                	cmp    %edx,%esi
 6fb:	76 df                	jbe    6dc <printint+0x2e>
  if(neg)
 6fd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 701:	74 31                	je     734 <printint+0x86>
    buf[i++] = '-';
 703:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 708:	8d 5f 02             	lea    0x2(%edi),%ebx
 70b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70e:	eb 17                	jmp    727 <printint+0x79>
    x = xx;
 710:	89 c1                	mov    %eax,%ecx
  neg = 0;
 712:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 719:	eb bc                	jmp    6d7 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 71b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 720:	89 f0                	mov    %esi,%eax
 722:	e8 6d ff ff ff       	call   694 <putc>
  while(--i >= 0)
 727:	83 eb 01             	sub    $0x1,%ebx
 72a:	79 ef                	jns    71b <printint+0x6d>
}
 72c:	83 c4 2c             	add    $0x2c,%esp
 72f:	5b                   	pop    %ebx
 730:	5e                   	pop    %esi
 731:	5f                   	pop    %edi
 732:	5d                   	pop    %ebp
 733:	c3                   	ret    
 734:	8b 75 d0             	mov    -0x30(%ebp),%esi
 737:	eb ee                	jmp    727 <printint+0x79>

00000739 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 739:	55                   	push   %ebp
 73a:	89 e5                	mov    %esp,%ebp
 73c:	57                   	push   %edi
 73d:	56                   	push   %esi
 73e:	53                   	push   %ebx
 73f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 742:	8d 45 10             	lea    0x10(%ebp),%eax
 745:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 748:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 74d:	bb 00 00 00 00       	mov    $0x0,%ebx
 752:	eb 14                	jmp    768 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 754:	89 fa                	mov    %edi,%edx
 756:	8b 45 08             	mov    0x8(%ebp),%eax
 759:	e8 36 ff ff ff       	call   694 <putc>
 75e:	eb 05                	jmp    765 <printf+0x2c>
      }
    } else if(state == '%'){
 760:	83 fe 25             	cmp    $0x25,%esi
 763:	74 25                	je     78a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 765:	83 c3 01             	add    $0x1,%ebx
 768:	8b 45 0c             	mov    0xc(%ebp),%eax
 76b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 76f:	84 c0                	test   %al,%al
 771:	0f 84 20 01 00 00    	je     897 <printf+0x15e>
    c = fmt[i] & 0xff;
 777:	0f be f8             	movsbl %al,%edi
 77a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 77d:	85 f6                	test   %esi,%esi
 77f:	75 df                	jne    760 <printf+0x27>
      if(c == '%'){
 781:	83 f8 25             	cmp    $0x25,%eax
 784:	75 ce                	jne    754 <printf+0x1b>
        state = '%';
 786:	89 c6                	mov    %eax,%esi
 788:	eb db                	jmp    765 <printf+0x2c>
      if(c == 'd'){
 78a:	83 f8 25             	cmp    $0x25,%eax
 78d:	0f 84 cf 00 00 00    	je     862 <printf+0x129>
 793:	0f 8c dd 00 00 00    	jl     876 <printf+0x13d>
 799:	83 f8 78             	cmp    $0x78,%eax
 79c:	0f 8f d4 00 00 00    	jg     876 <printf+0x13d>
 7a2:	83 f8 63             	cmp    $0x63,%eax
 7a5:	0f 8c cb 00 00 00    	jl     876 <printf+0x13d>
 7ab:	83 e8 63             	sub    $0x63,%eax
 7ae:	83 f8 15             	cmp    $0x15,%eax
 7b1:	0f 87 bf 00 00 00    	ja     876 <printf+0x13d>
 7b7:	ff 24 85 d4 0a 00 00 	jmp    *0xad4(,%eax,4)
        printint(fd, *ap, 10, 1);
 7be:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c1:	8b 17                	mov    (%edi),%edx
 7c3:	83 ec 0c             	sub    $0xc,%esp
 7c6:	6a 01                	push   $0x1
 7c8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7cd:	8b 45 08             	mov    0x8(%ebp),%eax
 7d0:	e8 d9 fe ff ff       	call   6ae <printint>
        ap++;
 7d5:	83 c7 04             	add    $0x4,%edi
 7d8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7db:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7de:	be 00 00 00 00       	mov    $0x0,%esi
 7e3:	eb 80                	jmp    765 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7e5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e8:	8b 17                	mov    (%edi),%edx
 7ea:	83 ec 0c             	sub    $0xc,%esp
 7ed:	6a 00                	push   $0x0
 7ef:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f4:	8b 45 08             	mov    0x8(%ebp),%eax
 7f7:	e8 b2 fe ff ff       	call   6ae <printint>
        ap++;
 7fc:	83 c7 04             	add    $0x4,%edi
 7ff:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 802:	83 c4 10             	add    $0x10,%esp
      state = 0;
 805:	be 00 00 00 00       	mov    $0x0,%esi
 80a:	e9 56 ff ff ff       	jmp    765 <printf+0x2c>
        s = (char*)*ap;
 80f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 812:	8b 30                	mov    (%eax),%esi
        ap++;
 814:	83 c0 04             	add    $0x4,%eax
 817:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 81a:	85 f6                	test   %esi,%esi
 81c:	75 15                	jne    833 <printf+0xfa>
          s = "(null)";
 81e:	be cb 0a 00 00       	mov    $0xacb,%esi
 823:	eb 0e                	jmp    833 <printf+0xfa>
          putc(fd, *s);
 825:	0f be d2             	movsbl %dl,%edx
 828:	8b 45 08             	mov    0x8(%ebp),%eax
 82b:	e8 64 fe ff ff       	call   694 <putc>
          s++;
 830:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 833:	0f b6 16             	movzbl (%esi),%edx
 836:	84 d2                	test   %dl,%dl
 838:	75 eb                	jne    825 <printf+0xec>
      state = 0;
 83a:	be 00 00 00 00       	mov    $0x0,%esi
 83f:	e9 21 ff ff ff       	jmp    765 <printf+0x2c>
        putc(fd, *ap);
 844:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 847:	0f be 17             	movsbl (%edi),%edx
 84a:	8b 45 08             	mov    0x8(%ebp),%eax
 84d:	e8 42 fe ff ff       	call   694 <putc>
        ap++;
 852:	83 c7 04             	add    $0x4,%edi
 855:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 858:	be 00 00 00 00       	mov    $0x0,%esi
 85d:	e9 03 ff ff ff       	jmp    765 <printf+0x2c>
        putc(fd, c);
 862:	89 fa                	mov    %edi,%edx
 864:	8b 45 08             	mov    0x8(%ebp),%eax
 867:	e8 28 fe ff ff       	call   694 <putc>
      state = 0;
 86c:	be 00 00 00 00       	mov    $0x0,%esi
 871:	e9 ef fe ff ff       	jmp    765 <printf+0x2c>
        putc(fd, '%');
 876:	ba 25 00 00 00       	mov    $0x25,%edx
 87b:	8b 45 08             	mov    0x8(%ebp),%eax
 87e:	e8 11 fe ff ff       	call   694 <putc>
        putc(fd, c);
 883:	89 fa                	mov    %edi,%edx
 885:	8b 45 08             	mov    0x8(%ebp),%eax
 888:	e8 07 fe ff ff       	call   694 <putc>
      state = 0;
 88d:	be 00 00 00 00       	mov    $0x0,%esi
 892:	e9 ce fe ff ff       	jmp    765 <printf+0x2c>
    }
  }
}
 897:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89a:	5b                   	pop    %ebx
 89b:	5e                   	pop    %esi
 89c:	5f                   	pop    %edi
 89d:	5d                   	pop    %ebp
 89e:	c3                   	ret    

0000089f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 89f:	55                   	push   %ebp
 8a0:	89 e5                	mov    %esp,%ebp
 8a2:	57                   	push   %edi
 8a3:	56                   	push   %esi
 8a4:	53                   	push   %ebx
 8a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ab:	a1 a0 0e 00 00       	mov    0xea0,%eax
 8b0:	eb 02                	jmp    8b4 <free+0x15>
 8b2:	89 d0                	mov    %edx,%eax
 8b4:	39 c8                	cmp    %ecx,%eax
 8b6:	73 04                	jae    8bc <free+0x1d>
 8b8:	39 08                	cmp    %ecx,(%eax)
 8ba:	77 12                	ja     8ce <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8bc:	8b 10                	mov    (%eax),%edx
 8be:	39 c2                	cmp    %eax,%edx
 8c0:	77 f0                	ja     8b2 <free+0x13>
 8c2:	39 c8                	cmp    %ecx,%eax
 8c4:	72 08                	jb     8ce <free+0x2f>
 8c6:	39 ca                	cmp    %ecx,%edx
 8c8:	77 04                	ja     8ce <free+0x2f>
 8ca:	89 d0                	mov    %edx,%eax
 8cc:	eb e6                	jmp    8b4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8ce:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d4:	8b 10                	mov    (%eax),%edx
 8d6:	39 d7                	cmp    %edx,%edi
 8d8:	74 19                	je     8f3 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8dd:	8b 50 04             	mov    0x4(%eax),%edx
 8e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e3:	39 ce                	cmp    %ecx,%esi
 8e5:	74 1b                	je     902 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8e9:	a3 a0 0e 00 00       	mov    %eax,0xea0
}
 8ee:	5b                   	pop    %ebx
 8ef:	5e                   	pop    %esi
 8f0:	5f                   	pop    %edi
 8f1:	5d                   	pop    %ebp
 8f2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8f3:	03 72 04             	add    0x4(%edx),%esi
 8f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f9:	8b 10                	mov    (%eax),%edx
 8fb:	8b 12                	mov    (%edx),%edx
 8fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
 900:	eb db                	jmp    8dd <free+0x3e>
    p->s.size += bp->s.size;
 902:	03 53 fc             	add    -0x4(%ebx),%edx
 905:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 908:	8b 53 f8             	mov    -0x8(%ebx),%edx
 90b:	89 10                	mov    %edx,(%eax)
 90d:	eb da                	jmp    8e9 <free+0x4a>

0000090f <morecore>:

static Header*
morecore(uint nu)
{
 90f:	55                   	push   %ebp
 910:	89 e5                	mov    %esp,%ebp
 912:	53                   	push   %ebx
 913:	83 ec 04             	sub    $0x4,%esp
 916:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 918:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 91d:	77 05                	ja     924 <morecore+0x15>
    nu = 4096;
 91f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 924:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 92b:	83 ec 0c             	sub    $0xc,%esp
 92e:	50                   	push   %eax
 92f:	e8 38 fd ff ff       	call   66c <sbrk>
  if(p == (char*)-1)
 934:	83 c4 10             	add    $0x10,%esp
 937:	83 f8 ff             	cmp    $0xffffffff,%eax
 93a:	74 1c                	je     958 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 93c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 93f:	83 c0 08             	add    $0x8,%eax
 942:	83 ec 0c             	sub    $0xc,%esp
 945:	50                   	push   %eax
 946:	e8 54 ff ff ff       	call   89f <free>
  return freep;
 94b:	a1 a0 0e 00 00       	mov    0xea0,%eax
 950:	83 c4 10             	add    $0x10,%esp
}
 953:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 956:	c9                   	leave  
 957:	c3                   	ret    
    return 0;
 958:	b8 00 00 00 00       	mov    $0x0,%eax
 95d:	eb f4                	jmp    953 <morecore+0x44>

0000095f <malloc>:

void*
malloc(uint nbytes)
{
 95f:	55                   	push   %ebp
 960:	89 e5                	mov    %esp,%ebp
 962:	53                   	push   %ebx
 963:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 966:	8b 45 08             	mov    0x8(%ebp),%eax
 969:	8d 58 07             	lea    0x7(%eax),%ebx
 96c:	c1 eb 03             	shr    $0x3,%ebx
 96f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 972:	8b 0d a0 0e 00 00    	mov    0xea0,%ecx
 978:	85 c9                	test   %ecx,%ecx
 97a:	74 04                	je     980 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97c:	8b 01                	mov    (%ecx),%eax
 97e:	eb 4a                	jmp    9ca <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 980:	c7 05 a0 0e 00 00 a4 	movl   $0xea4,0xea0
 987:	0e 00 00 
 98a:	c7 05 a4 0e 00 00 a4 	movl   $0xea4,0xea4
 991:	0e 00 00 
    base.s.size = 0;
 994:	c7 05 a8 0e 00 00 00 	movl   $0x0,0xea8
 99b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 99e:	b9 a4 0e 00 00       	mov    $0xea4,%ecx
 9a3:	eb d7                	jmp    97c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9a5:	74 19                	je     9c0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a7:	29 da                	sub    %ebx,%edx
 9a9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ac:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9af:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9b2:	89 0d a0 0e 00 00    	mov    %ecx,0xea0
      return (void*)(p + 1);
 9b8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9be:	c9                   	leave  
 9bf:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c0:	8b 10                	mov    (%eax),%edx
 9c2:	89 11                	mov    %edx,(%ecx)
 9c4:	eb ec                	jmp    9b2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c6:	89 c1                	mov    %eax,%ecx
 9c8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9ca:	8b 50 04             	mov    0x4(%eax),%edx
 9cd:	39 da                	cmp    %ebx,%edx
 9cf:	73 d4                	jae    9a5 <malloc+0x46>
    if(p == freep)
 9d1:	39 05 a0 0e 00 00    	cmp    %eax,0xea0
 9d7:	75 ed                	jne    9c6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9d9:	89 d8                	mov    %ebx,%eax
 9db:	e8 2f ff ff ff       	call   90f <morecore>
 9e0:	85 c0                	test   %eax,%eax
 9e2:	75 e2                	jne    9c6 <malloc+0x67>
 9e4:	eb d5                	jmp    9bb <malloc+0x5c>
