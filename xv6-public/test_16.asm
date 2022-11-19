
_test_16:     file format elf32-i386


Disassembly of section .text:

00000000 <nested_worker>:
   printf(1, "TEST PASSED\n");
   exit();
}


void nested_worker(void *arg1, void *arg2){
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
  11:	75 60                	jne    73 <nested_worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <nested_worker+0xbc>
   assert(global == 2);
  1c:	a1 c4 0e 00 00       	mov    0xec4,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 18 0a 00 00       	push   $0xa18
  31:	68 22 0a 00 00       	push   $0xa22
  36:	6a 01                	push   $0x1
  38:	e8 2c 07 00 00       	call   769 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 69 0a 00 00       	push   $0xa69
  45:	68 39 0a 00 00       	push   $0xa39
  4a:	6a 01                	push   $0x1
  4c:	e8 18 07 00 00       	call   769 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 4d 0a 00 00       	push   $0xa4d
  59:	6a 01                	push   $0x1
  5b:	e8 09 07 00 00       	call   769 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 c8 0e 00 00    	push   0xec8
  69:	e8 d6 05 00 00       	call   644 <kill>
  6e:	e8 a1 05 00 00       	call   614 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 18 0a 00 00       	push   $0xa18
  7a:	68 22 0a 00 00       	push   $0xa22
  7f:	6a 01                	push   $0x1
  81:	e8 e3 06 00 00       	call   769 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 2a 0a 00 00       	push   $0xa2a
  8e:	68 39 0a 00 00       	push   $0xa39
  93:	6a 01                	push   $0x1
  95:	e8 cf 06 00 00       	call   769 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 4d 0a 00 00       	push   $0xa4d
  a2:	6a 01                	push   $0x1
  a4:	e8 c0 06 00 00       	call   769 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 c8 0e 00 00    	push   0xec8
  b2:	e8 8d 05 00 00       	call   644 <kill>
  b7:	e8 58 05 00 00       	call   614 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 18 0a 00 00       	push   $0xa18
  c3:	68 22 0a 00 00       	push   $0xa22
  c8:	6a 01                	push   $0x1
  ca:	e8 9a 06 00 00       	call   769 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 5a 0a 00 00       	push   $0xa5a
  d7:	68 39 0a 00 00       	push   $0xa39
  dc:	6a 01                	push   $0x1
  de:	e8 86 06 00 00       	call   769 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 4d 0a 00 00       	push   $0xa4d
  eb:	6a 01                	push   $0x1
  ed:	e8 77 06 00 00       	call   769 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 c8 0e 00 00    	push   0xec8
  fb:	e8 44 05 00 00       	call   644 <kill>
 100:	e8 0f 05 00 00       	call   614 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 c4 0e 00 00       	mov    %eax,0xec4
   exit();
 10d:	e8 02 05 00 00       	call   614 <exit>

00000112 <worker>:
}

void
worker(void *arg1, void *arg2) {
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	83 ec 14             	sub    $0x14,%esp
   int arg1_int = *(int*)arg1;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 00                	mov    (%eax),%eax
 11e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int arg2_int = *(int*)arg2;
 121:	8b 55 0c             	mov    0xc(%ebp),%edx
 124:	8b 12                	mov    (%edx),%edx
 126:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(arg1_int == 35);
 129:	83 f8 23             	cmp    $0x23,%eax
 12c:	75 60                	jne    18e <worker+0x7c>
   assert(arg2_int == 42);
 12e:	83 fa 2a             	cmp    $0x2a,%edx
 131:	0f 85 a0 00 00 00    	jne    1d7 <worker+0xc5>
   assert(global == 1);
 137:	a1 c4 0e 00 00       	mov    0xec4,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 18 0a 00 00       	push   $0xa18
 14c:	68 22 0a 00 00       	push   $0xa22
 151:	6a 01                	push   $0x1
 153:	e8 11 06 00 00       	call   769 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 75 0a 00 00       	push   $0xa75
 160:	68 39 0a 00 00       	push   $0xa39
 165:	6a 01                	push   $0x1
 167:	e8 fd 05 00 00       	call   769 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 4d 0a 00 00       	push   $0xa4d
 174:	6a 01                	push   $0x1
 176:	e8 ee 05 00 00       	call   769 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 c8 0e 00 00    	push   0xec8
 184:	e8 bb 04 00 00       	call   644 <kill>
 189:	e8 86 04 00 00       	call   614 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 18 0a 00 00       	push   $0xa18
 195:	68 22 0a 00 00       	push   $0xa22
 19a:	6a 01                	push   $0x1
 19c:	e8 c8 05 00 00       	call   769 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 2a 0a 00 00       	push   $0xa2a
 1a9:	68 39 0a 00 00       	push   $0xa39
 1ae:	6a 01                	push   $0x1
 1b0:	e8 b4 05 00 00       	call   769 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 4d 0a 00 00       	push   $0xa4d
 1bd:	6a 01                	push   $0x1
 1bf:	e8 a5 05 00 00       	call   769 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 c8 0e 00 00    	push   0xec8
 1cd:	e8 72 04 00 00       	call   644 <kill>
 1d2:	e8 3d 04 00 00       	call   614 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 18 0a 00 00       	push   $0xa18
 1de:	68 22 0a 00 00       	push   $0xa22
 1e3:	6a 01                	push   $0x1
 1e5:	e8 7f 05 00 00       	call   769 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 5a 0a 00 00       	push   $0xa5a
 1f2:	68 39 0a 00 00       	push   $0xa39
 1f7:	6a 01                	push   $0x1
 1f9:	e8 6b 05 00 00       	call   769 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 4d 0a 00 00       	push   $0xa4d
 206:	6a 01                	push   $0x1
 208:	e8 5c 05 00 00       	call   769 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 c8 0e 00 00    	push   0xec8
 216:	e8 29 04 00 00       	call   644 <kill>
 21b:	e8 f4 03 00 00       	call   614 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 c4 0e 00 00       	mov    %eax,0xec4
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	68 00 00 00 00       	push   $0x0
 238:	e8 44 03 00 00       	call   581 <thread_create>
 23d:	89 c3                	mov    %eax,%ebx
   int nested_join_pid = thread_join();
 23f:	e8 72 03 00 00       	call   5b6 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 18 0a 00 00       	push   $0xa18
 252:	68 22 0a 00 00       	push   $0xa22
 257:	6a 01                	push   $0x1
 259:	e8 0b 05 00 00       	call   769 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 c0 0a 00 00       	push   $0xac0
 266:	68 39 0a 00 00       	push   $0xa39
 26b:	6a 01                	push   $0x1
 26d:	e8 f7 04 00 00       	call   769 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 4d 0a 00 00       	push   $0xa4d
 27a:	6a 01                	push   $0x1
 27c:	e8 e8 04 00 00       	call   769 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 c8 0e 00 00    	push   0xec8
 28a:	e8 b5 03 00 00       	call   644 <kill>
 28f:	e8 80 03 00 00       	call   614 <exit>
   exit();
 294:	e8 7b 03 00 00       	call   614 <exit>

00000299 <main>:
{
 299:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 29d:	83 e4 f0             	and    $0xfffffff0,%esp
 2a0:	ff 71 fc             	push   -0x4(%ecx)
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	53                   	push   %ebx
 2a7:	51                   	push   %ecx
 2a8:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2ab:	e8 e4 03 00 00       	call   694 <getpid>
 2b0:	a3 c8 0e 00 00       	mov    %eax,0xec8
   int arg1 = 35;
 2b5:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 2bc:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2c3:	83 ec 04             	sub    $0x4,%esp
 2c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2c9:	50                   	push   %eax
 2ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2cd:	50                   	push   %eax
 2ce:	68 12 01 00 00       	push   $0x112
 2d3:	e8 a9 02 00 00       	call   581 <thread_create>
   assert(thread_pid > 0);
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 65                	jle    344 <main+0xab>
 2df:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 2e1:	e8 d0 02 00 00       	call   5b6 <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d c4 0e 00 00 03 	cmpl   $0x3,0xec4
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 18 0a 00 00       	push   $0xa18
 302:	68 22 0a 00 00       	push   $0xa22
 307:	6a 01                	push   $0x1
 309:	e8 5b 04 00 00       	call   769 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 a7 0a 00 00       	push   $0xaa7
 316:	68 39 0a 00 00       	push   $0xa39
 31b:	6a 01                	push   $0x1
 31d:	e8 47 04 00 00       	call   769 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 4d 0a 00 00       	push   $0xa4d
 32a:	6a 01                	push   $0x1
 32c:	e8 38 04 00 00       	call   769 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 c8 0e 00 00    	push   0xec8
 33a:	e8 05 03 00 00       	call   644 <kill>
 33f:	e8 d0 02 00 00       	call   614 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 18 0a 00 00       	push   $0xa18
 34b:	68 22 0a 00 00       	push   $0xa22
 350:	6a 01                	push   $0x1
 352:	e8 12 04 00 00       	call   769 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 81 0a 00 00       	push   $0xa81
 35f:	68 39 0a 00 00       	push   $0xa39
 364:	6a 01                	push   $0x1
 366:	e8 fe 03 00 00       	call   769 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 4d 0a 00 00       	push   $0xa4d
 373:	6a 01                	push   $0x1
 375:	e8 ef 03 00 00       	call   769 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 c8 0e 00 00    	push   0xec8
 383:	e8 bc 02 00 00       	call   644 <kill>
 388:	e8 87 02 00 00       	call   614 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 18 0a 00 00       	push   $0xa18
 394:	68 22 0a 00 00       	push   $0xa22
 399:	6a 01                	push   $0x1
 39b:	e8 c9 03 00 00       	call   769 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 90 0a 00 00       	push   $0xa90
 3a8:	68 39 0a 00 00       	push   $0xa39
 3ad:	6a 01                	push   $0x1
 3af:	e8 b5 03 00 00       	call   769 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 4d 0a 00 00       	push   $0xa4d
 3bc:	6a 01                	push   $0x1
 3be:	e8 a6 03 00 00       	call   769 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 c8 0e 00 00    	push   0xec8
 3cc:	e8 73 02 00 00       	call   644 <kill>
 3d1:	e8 3e 02 00 00       	call   614 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 b3 0a 00 00       	push   $0xab3
 3de:	6a 01                	push   $0x1
 3e0:	e8 84 03 00 00       	call   769 <printf>
   exit();
 3e5:	e8 2a 02 00 00       	call   614 <exit>

000003ea <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	56                   	push   %esi
 3ee:	53                   	push   %ebx
 3ef:	8b 75 08             	mov    0x8(%ebp),%esi
 3f2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3f5:	89 f0                	mov    %esi,%eax
 3f7:	89 d1                	mov    %edx,%ecx
 3f9:	83 c2 01             	add    $0x1,%edx
 3fc:	89 c3                	mov    %eax,%ebx
 3fe:	83 c0 01             	add    $0x1,%eax
 401:	0f b6 09             	movzbl (%ecx),%ecx
 404:	88 0b                	mov    %cl,(%ebx)
 406:	84 c9                	test   %cl,%cl
 408:	75 ed                	jne    3f7 <strcpy+0xd>
    ;
  return os;
}
 40a:	89 f0                	mov    %esi,%eax
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5d                   	pop    %ebp
 40f:	c3                   	ret    

00000410 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 4d 08             	mov    0x8(%ebp),%ecx
 416:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 419:	eb 06                	jmp    421 <strcmp+0x11>
    p++, q++;
 41b:	83 c1 01             	add    $0x1,%ecx
 41e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 421:	0f b6 01             	movzbl (%ecx),%eax
 424:	84 c0                	test   %al,%al
 426:	74 04                	je     42c <strcmp+0x1c>
 428:	3a 02                	cmp    (%edx),%al
 42a:	74 ef                	je     41b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 42c:	0f b6 c0             	movzbl %al,%eax
 42f:	0f b6 12             	movzbl (%edx),%edx
 432:	29 d0                	sub    %edx,%eax
}
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <strlen>:

uint
strlen(const char *s)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 43c:	b8 00 00 00 00       	mov    $0x0,%eax
 441:	eb 03                	jmp    446 <strlen+0x10>
 443:	83 c0 01             	add    $0x1,%eax
 446:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 44a:	75 f7                	jne    443 <strlen+0xd>
    ;
  return n;
}
 44c:	5d                   	pop    %ebp
 44d:	c3                   	ret    

0000044e <memset>:

void*
memset(void *dst, int c, uint n)
{
 44e:	55                   	push   %ebp
 44f:	89 e5                	mov    %esp,%ebp
 451:	57                   	push   %edi
 452:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 455:	89 d7                	mov    %edx,%edi
 457:	8b 4d 10             	mov    0x10(%ebp),%ecx
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	fc                   	cld    
 45e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 460:	89 d0                	mov    %edx,%eax
 462:	8b 7d fc             	mov    -0x4(%ebp),%edi
 465:	c9                   	leave  
 466:	c3                   	ret    

00000467 <strchr>:

char*
strchr(const char *s, char c)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 471:	eb 03                	jmp    476 <strchr+0xf>
 473:	83 c0 01             	add    $0x1,%eax
 476:	0f b6 10             	movzbl (%eax),%edx
 479:	84 d2                	test   %dl,%dl
 47b:	74 06                	je     483 <strchr+0x1c>
    if(*s == c)
 47d:	38 ca                	cmp    %cl,%dl
 47f:	75 f2                	jne    473 <strchr+0xc>
 481:	eb 05                	jmp    488 <strchr+0x21>
      return (char*)s;
  return 0;
 483:	b8 00 00 00 00       	mov    $0x0,%eax
}
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <gets>:

char*
gets(char *buf, int max)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	57                   	push   %edi
 48e:	56                   	push   %esi
 48f:	53                   	push   %ebx
 490:	83 ec 1c             	sub    $0x1c,%esp
 493:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 496:	bb 00 00 00 00       	mov    $0x0,%ebx
 49b:	89 de                	mov    %ebx,%esi
 49d:	83 c3 01             	add    $0x1,%ebx
 4a0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a3:	7d 2e                	jge    4d3 <gets+0x49>
    cc = read(0, &c, 1);
 4a5:	83 ec 04             	sub    $0x4,%esp
 4a8:	6a 01                	push   $0x1
 4aa:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ad:	50                   	push   %eax
 4ae:	6a 00                	push   $0x0
 4b0:	e8 77 01 00 00       	call   62c <read>
    if(cc < 1)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	85 c0                	test   %eax,%eax
 4ba:	7e 17                	jle    4d3 <gets+0x49>
      break;
    buf[i++] = c;
 4bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4c0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4c3:	3c 0a                	cmp    $0xa,%al
 4c5:	0f 94 c2             	sete   %dl
 4c8:	3c 0d                	cmp    $0xd,%al
 4ca:	0f 94 c0             	sete   %al
 4cd:	08 c2                	or     %al,%dl
 4cf:	74 ca                	je     49b <gets+0x11>
    buf[i++] = c;
 4d1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4d3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4d7:	89 f8                	mov    %edi,%eax
 4d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5f                   	pop    %edi
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret    

000004e1 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e6:	83 ec 08             	sub    $0x8,%esp
 4e9:	6a 00                	push   $0x0
 4eb:	ff 75 08             	push   0x8(%ebp)
 4ee:	e8 61 01 00 00       	call   654 <open>
  if(fd < 0)
 4f3:	83 c4 10             	add    $0x10,%esp
 4f6:	85 c0                	test   %eax,%eax
 4f8:	78 24                	js     51e <stat+0x3d>
 4fa:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4fc:	83 ec 08             	sub    $0x8,%esp
 4ff:	ff 75 0c             	push   0xc(%ebp)
 502:	50                   	push   %eax
 503:	e8 64 01 00 00       	call   66c <fstat>
 508:	89 c6                	mov    %eax,%esi
  close(fd);
 50a:	89 1c 24             	mov    %ebx,(%esp)
 50d:	e8 2a 01 00 00       	call   63c <close>
  return r;
 512:	83 c4 10             	add    $0x10,%esp
}
 515:	89 f0                	mov    %esi,%eax
 517:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51a:	5b                   	pop    %ebx
 51b:	5e                   	pop    %esi
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    
    return -1;
 51e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 523:	eb f0                	jmp    515 <stat+0x34>

00000525 <atoi>:

int
atoi(const char *s)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	53                   	push   %ebx
 529:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 52c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 531:	eb 10                	jmp    543 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 533:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 536:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 539:	83 c1 01             	add    $0x1,%ecx
 53c:	0f be c0             	movsbl %al,%eax
 53f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 543:	0f b6 01             	movzbl (%ecx),%eax
 546:	8d 58 d0             	lea    -0x30(%eax),%ebx
 549:	80 fb 09             	cmp    $0x9,%bl
 54c:	76 e5                	jbe    533 <atoi+0xe>
  return n;
}
 54e:	89 d0                	mov    %edx,%eax
 550:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 553:	c9                   	leave  
 554:	c3                   	ret    

00000555 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	8b 75 08             	mov    0x8(%ebp),%esi
 55d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 560:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 563:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 565:	eb 0d                	jmp    574 <memmove+0x1f>
    *dst++ = *src++;
 567:	0f b6 01             	movzbl (%ecx),%eax
 56a:	88 02                	mov    %al,(%edx)
 56c:	8d 49 01             	lea    0x1(%ecx),%ecx
 56f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 572:	89 d8                	mov    %ebx,%eax
 574:	8d 58 ff             	lea    -0x1(%eax),%ebx
 577:	85 c0                	test   %eax,%eax
 579:	7f ec                	jg     567 <memmove+0x12>
  return vdst;
}
 57b:	89 f0                	mov    %esi,%eax
 57d:	5b                   	pop    %ebx
 57e:	5e                   	pop    %esi
 57f:	5d                   	pop    %ebp
 580:	c3                   	ret    

00000581 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 587:	68 00 20 00 00       	push   $0x2000
 58c:	e8 fe 03 00 00       	call   98f <malloc>
  if ((uint)stack%PGSIZE){
 591:	83 c4 10             	add    $0x10,%esp
 594:	a9 ff 0f 00 00       	test   $0xfff,%eax
 599:	74 0a                	je     5a5 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 59b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 5a0:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 5a5:	50                   	push   %eax
 5a6:	ff 75 10             	push   0x10(%ebp)
 5a9:	ff 75 0c             	push   0xc(%ebp)
 5ac:	ff 75 08             	push   0x8(%ebp)
 5af:	e8 00 01 00 00       	call   6b4 <clone>
}
 5b4:	c9                   	leave  
 5b5:	c3                   	ret    

000005b6 <thread_join>:

int thread_join(){
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	53                   	push   %ebx
 5ba:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 5bd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5c0:	50                   	push   %eax
 5c1:	e8 f6 00 00 00       	call   6bc <join>
 5c6:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 5c8:	83 c4 04             	add    $0x4,%esp
 5cb:	ff 75 f4             	push   -0xc(%ebp)
 5ce:	e8 fc 02 00 00       	call   8cf <free>
  return x;
}
 5d3:	89 d8                	mov    %ebx,%eax
 5d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d8:	c9                   	leave  
 5d9:	c3                   	ret    

000005da <lock_init>:

void lock_init(lock_t *spin){
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret    

000005e8 <lock_acquire>:

void lock_acquire(lock_t *spin){
 5e8:	55                   	push   %ebp
 5e9:	89 e5                	mov    %esp,%ebp
 5eb:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5ee:	b8 01 00 00 00       	mov    $0x1,%eax
 5f3:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 5f6:	85 c0                	test   %eax,%eax
 5f8:	75 f4                	jne    5ee <lock_acquire+0x6>

}
 5fa:	5d                   	pop    %ebp
 5fb:	c3                   	ret    

000005fc <lock_release>:

void lock_release(lock_t *spin){
 5fc:	55                   	push   %ebp
 5fd:	89 e5                	mov    %esp,%ebp
 5ff:	8b 55 08             	mov    0x8(%ebp),%edx
 602:	b8 00 00 00 00       	mov    $0x0,%eax
 607:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret    

0000060c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 60c:	b8 01 00 00 00       	mov    $0x1,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <exit>:
SYSCALL(exit)
 614:	b8 02 00 00 00       	mov    $0x2,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <wait>:
SYSCALL(wait)
 61c:	b8 03 00 00 00       	mov    $0x3,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <pipe>:
SYSCALL(pipe)
 624:	b8 04 00 00 00       	mov    $0x4,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <read>:
SYSCALL(read)
 62c:	b8 05 00 00 00       	mov    $0x5,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <write>:
SYSCALL(write)
 634:	b8 10 00 00 00       	mov    $0x10,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <close>:
SYSCALL(close)
 63c:	b8 15 00 00 00       	mov    $0x15,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <kill>:
SYSCALL(kill)
 644:	b8 06 00 00 00       	mov    $0x6,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <exec>:
SYSCALL(exec)
 64c:	b8 07 00 00 00       	mov    $0x7,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <open>:
SYSCALL(open)
 654:	b8 0f 00 00 00       	mov    $0xf,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <mknod>:
SYSCALL(mknod)
 65c:	b8 11 00 00 00       	mov    $0x11,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <unlink>:
SYSCALL(unlink)
 664:	b8 12 00 00 00       	mov    $0x12,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <fstat>:
SYSCALL(fstat)
 66c:	b8 08 00 00 00       	mov    $0x8,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <link>:
SYSCALL(link)
 674:	b8 13 00 00 00       	mov    $0x13,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <mkdir>:
SYSCALL(mkdir)
 67c:	b8 14 00 00 00       	mov    $0x14,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <chdir>:
SYSCALL(chdir)
 684:	b8 09 00 00 00       	mov    $0x9,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <dup>:
SYSCALL(dup)
 68c:	b8 0a 00 00 00       	mov    $0xa,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <getpid>:
SYSCALL(getpid)
 694:	b8 0b 00 00 00       	mov    $0xb,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <sbrk>:
SYSCALL(sbrk)
 69c:	b8 0c 00 00 00       	mov    $0xc,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <sleep>:
SYSCALL(sleep)
 6a4:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <uptime>:
SYSCALL(uptime)
 6ac:	b8 0e 00 00 00       	mov    $0xe,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <clone>:
SYSCALL(clone)
 6b4:	b8 16 00 00 00       	mov    $0x16,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <join>:
 6bc:	b8 17 00 00 00       	mov    $0x17,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6c4:	55                   	push   %ebp
 6c5:	89 e5                	mov    %esp,%ebp
 6c7:	83 ec 1c             	sub    $0x1c,%esp
 6ca:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6cd:	6a 01                	push   $0x1
 6cf:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6d2:	52                   	push   %edx
 6d3:	50                   	push   %eax
 6d4:	e8 5b ff ff ff       	call   634 <write>
}
 6d9:	83 c4 10             	add    $0x10,%esp
 6dc:	c9                   	leave  
 6dd:	c3                   	ret    

000006de <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6de:	55                   	push   %ebp
 6df:	89 e5                	mov    %esp,%ebp
 6e1:	57                   	push   %edi
 6e2:	56                   	push   %esi
 6e3:	53                   	push   %ebx
 6e4:	83 ec 2c             	sub    $0x2c,%esp
 6e7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6ea:	89 d0                	mov    %edx,%eax
 6ec:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6ee:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6f2:	0f 95 c1             	setne  %cl
 6f5:	c1 ea 1f             	shr    $0x1f,%edx
 6f8:	84 d1                	test   %dl,%cl
 6fa:	74 44                	je     740 <printint+0x62>
    neg = 1;
    x = -xx;
 6fc:	f7 d8                	neg    %eax
 6fe:	89 c1                	mov    %eax,%ecx
    neg = 1;
 700:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 707:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 70c:	89 c8                	mov    %ecx,%eax
 70e:	ba 00 00 00 00       	mov    $0x0,%edx
 713:	f7 f6                	div    %esi
 715:	89 df                	mov    %ebx,%edi
 717:	83 c3 01             	add    $0x1,%ebx
 71a:	0f b6 92 44 0b 00 00 	movzbl 0xb44(%edx),%edx
 721:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 725:	89 ca                	mov    %ecx,%edx
 727:	89 c1                	mov    %eax,%ecx
 729:	39 d6                	cmp    %edx,%esi
 72b:	76 df                	jbe    70c <printint+0x2e>
  if(neg)
 72d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 731:	74 31                	je     764 <printint+0x86>
    buf[i++] = '-';
 733:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 738:	8d 5f 02             	lea    0x2(%edi),%ebx
 73b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 73e:	eb 17                	jmp    757 <printint+0x79>
    x = xx;
 740:	89 c1                	mov    %eax,%ecx
  neg = 0;
 742:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 749:	eb bc                	jmp    707 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 74b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 750:	89 f0                	mov    %esi,%eax
 752:	e8 6d ff ff ff       	call   6c4 <putc>
  while(--i >= 0)
 757:	83 eb 01             	sub    $0x1,%ebx
 75a:	79 ef                	jns    74b <printint+0x6d>
}
 75c:	83 c4 2c             	add    $0x2c,%esp
 75f:	5b                   	pop    %ebx
 760:	5e                   	pop    %esi
 761:	5f                   	pop    %edi
 762:	5d                   	pop    %ebp
 763:	c3                   	ret    
 764:	8b 75 d0             	mov    -0x30(%ebp),%esi
 767:	eb ee                	jmp    757 <printint+0x79>

00000769 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 769:	55                   	push   %ebp
 76a:	89 e5                	mov    %esp,%ebp
 76c:	57                   	push   %edi
 76d:	56                   	push   %esi
 76e:	53                   	push   %ebx
 76f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 772:	8d 45 10             	lea    0x10(%ebp),%eax
 775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 778:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 77d:	bb 00 00 00 00       	mov    $0x0,%ebx
 782:	eb 14                	jmp    798 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 784:	89 fa                	mov    %edi,%edx
 786:	8b 45 08             	mov    0x8(%ebp),%eax
 789:	e8 36 ff ff ff       	call   6c4 <putc>
 78e:	eb 05                	jmp    795 <printf+0x2c>
      }
    } else if(state == '%'){
 790:	83 fe 25             	cmp    $0x25,%esi
 793:	74 25                	je     7ba <printf+0x51>
  for(i = 0; fmt[i]; i++){
 795:	83 c3 01             	add    $0x1,%ebx
 798:	8b 45 0c             	mov    0xc(%ebp),%eax
 79b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 79f:	84 c0                	test   %al,%al
 7a1:	0f 84 20 01 00 00    	je     8c7 <printf+0x15e>
    c = fmt[i] & 0xff;
 7a7:	0f be f8             	movsbl %al,%edi
 7aa:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7ad:	85 f6                	test   %esi,%esi
 7af:	75 df                	jne    790 <printf+0x27>
      if(c == '%'){
 7b1:	83 f8 25             	cmp    $0x25,%eax
 7b4:	75 ce                	jne    784 <printf+0x1b>
        state = '%';
 7b6:	89 c6                	mov    %eax,%esi
 7b8:	eb db                	jmp    795 <printf+0x2c>
      if(c == 'd'){
 7ba:	83 f8 25             	cmp    $0x25,%eax
 7bd:	0f 84 cf 00 00 00    	je     892 <printf+0x129>
 7c3:	0f 8c dd 00 00 00    	jl     8a6 <printf+0x13d>
 7c9:	83 f8 78             	cmp    $0x78,%eax
 7cc:	0f 8f d4 00 00 00    	jg     8a6 <printf+0x13d>
 7d2:	83 f8 63             	cmp    $0x63,%eax
 7d5:	0f 8c cb 00 00 00    	jl     8a6 <printf+0x13d>
 7db:	83 e8 63             	sub    $0x63,%eax
 7de:	83 f8 15             	cmp    $0x15,%eax
 7e1:	0f 87 bf 00 00 00    	ja     8a6 <printf+0x13d>
 7e7:	ff 24 85 ec 0a 00 00 	jmp    *0xaec(,%eax,4)
        printint(fd, *ap, 10, 1);
 7ee:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f1:	8b 17                	mov    (%edi),%edx
 7f3:	83 ec 0c             	sub    $0xc,%esp
 7f6:	6a 01                	push   $0x1
 7f8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	e8 d9 fe ff ff       	call   6de <printint>
        ap++;
 805:	83 c7 04             	add    $0x4,%edi
 808:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 80e:	be 00 00 00 00       	mov    $0x0,%esi
 813:	eb 80                	jmp    795 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 815:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 818:	8b 17                	mov    (%edi),%edx
 81a:	83 ec 0c             	sub    $0xc,%esp
 81d:	6a 00                	push   $0x0
 81f:	b9 10 00 00 00       	mov    $0x10,%ecx
 824:	8b 45 08             	mov    0x8(%ebp),%eax
 827:	e8 b2 fe ff ff       	call   6de <printint>
        ap++;
 82c:	83 c7 04             	add    $0x4,%edi
 82f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 832:	83 c4 10             	add    $0x10,%esp
      state = 0;
 835:	be 00 00 00 00       	mov    $0x0,%esi
 83a:	e9 56 ff ff ff       	jmp    795 <printf+0x2c>
        s = (char*)*ap;
 83f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 842:	8b 30                	mov    (%eax),%esi
        ap++;
 844:	83 c0 04             	add    $0x4,%eax
 847:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 84a:	85 f6                	test   %esi,%esi
 84c:	75 15                	jne    863 <printf+0xfa>
          s = "(null)";
 84e:	be e5 0a 00 00       	mov    $0xae5,%esi
 853:	eb 0e                	jmp    863 <printf+0xfa>
          putc(fd, *s);
 855:	0f be d2             	movsbl %dl,%edx
 858:	8b 45 08             	mov    0x8(%ebp),%eax
 85b:	e8 64 fe ff ff       	call   6c4 <putc>
          s++;
 860:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 863:	0f b6 16             	movzbl (%esi),%edx
 866:	84 d2                	test   %dl,%dl
 868:	75 eb                	jne    855 <printf+0xec>
      state = 0;
 86a:	be 00 00 00 00       	mov    $0x0,%esi
 86f:	e9 21 ff ff ff       	jmp    795 <printf+0x2c>
        putc(fd, *ap);
 874:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 877:	0f be 17             	movsbl (%edi),%edx
 87a:	8b 45 08             	mov    0x8(%ebp),%eax
 87d:	e8 42 fe ff ff       	call   6c4 <putc>
        ap++;
 882:	83 c7 04             	add    $0x4,%edi
 885:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 888:	be 00 00 00 00       	mov    $0x0,%esi
 88d:	e9 03 ff ff ff       	jmp    795 <printf+0x2c>
        putc(fd, c);
 892:	89 fa                	mov    %edi,%edx
 894:	8b 45 08             	mov    0x8(%ebp),%eax
 897:	e8 28 fe ff ff       	call   6c4 <putc>
      state = 0;
 89c:	be 00 00 00 00       	mov    $0x0,%esi
 8a1:	e9 ef fe ff ff       	jmp    795 <printf+0x2c>
        putc(fd, '%');
 8a6:	ba 25 00 00 00       	mov    $0x25,%edx
 8ab:	8b 45 08             	mov    0x8(%ebp),%eax
 8ae:	e8 11 fe ff ff       	call   6c4 <putc>
        putc(fd, c);
 8b3:	89 fa                	mov    %edi,%edx
 8b5:	8b 45 08             	mov    0x8(%ebp),%eax
 8b8:	e8 07 fe ff ff       	call   6c4 <putc>
      state = 0;
 8bd:	be 00 00 00 00       	mov    $0x0,%esi
 8c2:	e9 ce fe ff ff       	jmp    795 <printf+0x2c>
    }
  }
}
 8c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ca:	5b                   	pop    %ebx
 8cb:	5e                   	pop    %esi
 8cc:	5f                   	pop    %edi
 8cd:	5d                   	pop    %ebp
 8ce:	c3                   	ret    

000008cf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8cf:	55                   	push   %ebp
 8d0:	89 e5                	mov    %esp,%ebp
 8d2:	57                   	push   %edi
 8d3:	56                   	push   %esi
 8d4:	53                   	push   %ebx
 8d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8db:	a1 cc 0e 00 00       	mov    0xecc,%eax
 8e0:	eb 02                	jmp    8e4 <free+0x15>
 8e2:	89 d0                	mov    %edx,%eax
 8e4:	39 c8                	cmp    %ecx,%eax
 8e6:	73 04                	jae    8ec <free+0x1d>
 8e8:	39 08                	cmp    %ecx,(%eax)
 8ea:	77 12                	ja     8fe <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ec:	8b 10                	mov    (%eax),%edx
 8ee:	39 c2                	cmp    %eax,%edx
 8f0:	77 f0                	ja     8e2 <free+0x13>
 8f2:	39 c8                	cmp    %ecx,%eax
 8f4:	72 08                	jb     8fe <free+0x2f>
 8f6:	39 ca                	cmp    %ecx,%edx
 8f8:	77 04                	ja     8fe <free+0x2f>
 8fa:	89 d0                	mov    %edx,%eax
 8fc:	eb e6                	jmp    8e4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8fe:	8b 73 fc             	mov    -0x4(%ebx),%esi
 901:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 904:	8b 10                	mov    (%eax),%edx
 906:	39 d7                	cmp    %edx,%edi
 908:	74 19                	je     923 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 90a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 90d:	8b 50 04             	mov    0x4(%eax),%edx
 910:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 913:	39 ce                	cmp    %ecx,%esi
 915:	74 1b                	je     932 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 917:	89 08                	mov    %ecx,(%eax)
  freep = p;
 919:	a3 cc 0e 00 00       	mov    %eax,0xecc
}
 91e:	5b                   	pop    %ebx
 91f:	5e                   	pop    %esi
 920:	5f                   	pop    %edi
 921:	5d                   	pop    %ebp
 922:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 923:	03 72 04             	add    0x4(%edx),%esi
 926:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 929:	8b 10                	mov    (%eax),%edx
 92b:	8b 12                	mov    (%edx),%edx
 92d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 930:	eb db                	jmp    90d <free+0x3e>
    p->s.size += bp->s.size;
 932:	03 53 fc             	add    -0x4(%ebx),%edx
 935:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 938:	8b 53 f8             	mov    -0x8(%ebx),%edx
 93b:	89 10                	mov    %edx,(%eax)
 93d:	eb da                	jmp    919 <free+0x4a>

0000093f <morecore>:

static Header*
morecore(uint nu)
{
 93f:	55                   	push   %ebp
 940:	89 e5                	mov    %esp,%ebp
 942:	53                   	push   %ebx
 943:	83 ec 04             	sub    $0x4,%esp
 946:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 948:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 94d:	77 05                	ja     954 <morecore+0x15>
    nu = 4096;
 94f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 954:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 95b:	83 ec 0c             	sub    $0xc,%esp
 95e:	50                   	push   %eax
 95f:	e8 38 fd ff ff       	call   69c <sbrk>
  if(p == (char*)-1)
 964:	83 c4 10             	add    $0x10,%esp
 967:	83 f8 ff             	cmp    $0xffffffff,%eax
 96a:	74 1c                	je     988 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 96c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 96f:	83 c0 08             	add    $0x8,%eax
 972:	83 ec 0c             	sub    $0xc,%esp
 975:	50                   	push   %eax
 976:	e8 54 ff ff ff       	call   8cf <free>
  return freep;
 97b:	a1 cc 0e 00 00       	mov    0xecc,%eax
 980:	83 c4 10             	add    $0x10,%esp
}
 983:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 986:	c9                   	leave  
 987:	c3                   	ret    
    return 0;
 988:	b8 00 00 00 00       	mov    $0x0,%eax
 98d:	eb f4                	jmp    983 <morecore+0x44>

0000098f <malloc>:

void*
malloc(uint nbytes)
{
 98f:	55                   	push   %ebp
 990:	89 e5                	mov    %esp,%ebp
 992:	53                   	push   %ebx
 993:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 996:	8b 45 08             	mov    0x8(%ebp),%eax
 999:	8d 58 07             	lea    0x7(%eax),%ebx
 99c:	c1 eb 03             	shr    $0x3,%ebx
 99f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9a2:	8b 0d cc 0e 00 00    	mov    0xecc,%ecx
 9a8:	85 c9                	test   %ecx,%ecx
 9aa:	74 04                	je     9b0 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ac:	8b 01                	mov    (%ecx),%eax
 9ae:	eb 4a                	jmp    9fa <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9b0:	c7 05 cc 0e 00 00 d0 	movl   $0xed0,0xecc
 9b7:	0e 00 00 
 9ba:	c7 05 d0 0e 00 00 d0 	movl   $0xed0,0xed0
 9c1:	0e 00 00 
    base.s.size = 0;
 9c4:	c7 05 d4 0e 00 00 00 	movl   $0x0,0xed4
 9cb:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9ce:	b9 d0 0e 00 00       	mov    $0xed0,%ecx
 9d3:	eb d7                	jmp    9ac <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9d5:	74 19                	je     9f0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9d7:	29 da                	sub    %ebx,%edx
 9d9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9dc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9df:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9e2:	89 0d cc 0e 00 00    	mov    %ecx,0xecc
      return (void*)(p + 1);
 9e8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ee:	c9                   	leave  
 9ef:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9f0:	8b 10                	mov    (%eax),%edx
 9f2:	89 11                	mov    %edx,(%ecx)
 9f4:	eb ec                	jmp    9e2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f6:	89 c1                	mov    %eax,%ecx
 9f8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9fa:	8b 50 04             	mov    0x4(%eax),%edx
 9fd:	39 da                	cmp    %ebx,%edx
 9ff:	73 d4                	jae    9d5 <malloc+0x46>
    if(p == freep)
 a01:	39 05 cc 0e 00 00    	cmp    %eax,0xecc
 a07:	75 ed                	jne    9f6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a09:	89 d8                	mov    %ebx,%eax
 a0b:	e8 2f ff ff ff       	call   93f <morecore>
 a10:	85 c0                	test   %eax,%eax
 a12:	75 e2                	jne    9f6 <malloc+0x67>
 a14:	eb d5                	jmp    9eb <malloc+0x5c>
