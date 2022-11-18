
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
  2c:	68 14 0a 00 00       	push   $0xa14
  31:	68 1e 0a 00 00       	push   $0xa1e
  36:	6a 01                	push   $0x1
  38:	e8 29 07 00 00       	call   766 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 65 0a 00 00       	push   $0xa65
  45:	68 35 0a 00 00       	push   $0xa35
  4a:	6a 01                	push   $0x1
  4c:	e8 15 07 00 00       	call   766 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 49 0a 00 00       	push   $0xa49
  59:	6a 01                	push   $0x1
  5b:	e8 06 07 00 00       	call   766 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 c8 0e 00 00    	push   0xec8
  69:	e8 d3 05 00 00       	call   641 <kill>
  6e:	e8 9e 05 00 00       	call   611 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 14 0a 00 00       	push   $0xa14
  7a:	68 1e 0a 00 00       	push   $0xa1e
  7f:	6a 01                	push   $0x1
  81:	e8 e0 06 00 00       	call   766 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 26 0a 00 00       	push   $0xa26
  8e:	68 35 0a 00 00       	push   $0xa35
  93:	6a 01                	push   $0x1
  95:	e8 cc 06 00 00       	call   766 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 49 0a 00 00       	push   $0xa49
  a2:	6a 01                	push   $0x1
  a4:	e8 bd 06 00 00       	call   766 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 c8 0e 00 00    	push   0xec8
  b2:	e8 8a 05 00 00       	call   641 <kill>
  b7:	e8 55 05 00 00       	call   611 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 14 0a 00 00       	push   $0xa14
  c3:	68 1e 0a 00 00       	push   $0xa1e
  c8:	6a 01                	push   $0x1
  ca:	e8 97 06 00 00       	call   766 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 56 0a 00 00       	push   $0xa56
  d7:	68 35 0a 00 00       	push   $0xa35
  dc:	6a 01                	push   $0x1
  de:	e8 83 06 00 00       	call   766 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 49 0a 00 00       	push   $0xa49
  eb:	6a 01                	push   $0x1
  ed:	e8 74 06 00 00       	call   766 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 c8 0e 00 00    	push   0xec8
  fb:	e8 41 05 00 00       	call   641 <kill>
 100:	e8 0c 05 00 00       	call   611 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 c4 0e 00 00       	mov    %eax,0xec4
   exit();
 10d:	e8 ff 04 00 00       	call   611 <exit>

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
 147:	68 14 0a 00 00       	push   $0xa14
 14c:	68 1e 0a 00 00       	push   $0xa1e
 151:	6a 01                	push   $0x1
 153:	e8 0e 06 00 00       	call   766 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 71 0a 00 00       	push   $0xa71
 160:	68 35 0a 00 00       	push   $0xa35
 165:	6a 01                	push   $0x1
 167:	e8 fa 05 00 00       	call   766 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 49 0a 00 00       	push   $0xa49
 174:	6a 01                	push   $0x1
 176:	e8 eb 05 00 00       	call   766 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 c8 0e 00 00    	push   0xec8
 184:	e8 b8 04 00 00       	call   641 <kill>
 189:	e8 83 04 00 00       	call   611 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 14 0a 00 00       	push   $0xa14
 195:	68 1e 0a 00 00       	push   $0xa1e
 19a:	6a 01                	push   $0x1
 19c:	e8 c5 05 00 00       	call   766 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 26 0a 00 00       	push   $0xa26
 1a9:	68 35 0a 00 00       	push   $0xa35
 1ae:	6a 01                	push   $0x1
 1b0:	e8 b1 05 00 00       	call   766 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 49 0a 00 00       	push   $0xa49
 1bd:	6a 01                	push   $0x1
 1bf:	e8 a2 05 00 00       	call   766 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 c8 0e 00 00    	push   0xec8
 1cd:	e8 6f 04 00 00       	call   641 <kill>
 1d2:	e8 3a 04 00 00       	call   611 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 14 0a 00 00       	push   $0xa14
 1de:	68 1e 0a 00 00       	push   $0xa1e
 1e3:	6a 01                	push   $0x1
 1e5:	e8 7c 05 00 00       	call   766 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 56 0a 00 00       	push   $0xa56
 1f2:	68 35 0a 00 00       	push   $0xa35
 1f7:	6a 01                	push   $0x1
 1f9:	e8 68 05 00 00       	call   766 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 49 0a 00 00       	push   $0xa49
 206:	6a 01                	push   $0x1
 208:	e8 59 05 00 00       	call   766 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 c8 0e 00 00    	push   0xec8
 216:	e8 26 04 00 00       	call   641 <kill>
 21b:	e8 f1 03 00 00       	call   611 <exit>
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
 23f:	e8 5e 03 00 00       	call   5a2 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 14 0a 00 00       	push   $0xa14
 252:	68 1e 0a 00 00       	push   $0xa1e
 257:	6a 01                	push   $0x1
 259:	e8 08 05 00 00       	call   766 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 bc 0a 00 00       	push   $0xabc
 266:	68 35 0a 00 00       	push   $0xa35
 26b:	6a 01                	push   $0x1
 26d:	e8 f4 04 00 00       	call   766 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 49 0a 00 00       	push   $0xa49
 27a:	6a 01                	push   $0x1
 27c:	e8 e5 04 00 00       	call   766 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 c8 0e 00 00    	push   0xec8
 28a:	e8 b2 03 00 00       	call   641 <kill>
 28f:	e8 7d 03 00 00       	call   611 <exit>
   exit();
 294:	e8 78 03 00 00       	call   611 <exit>

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
 2ab:	e8 e1 03 00 00       	call   691 <getpid>
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
 2e1:	e8 bc 02 00 00       	call   5a2 <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d c4 0e 00 00 03 	cmpl   $0x3,0xec4
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 14 0a 00 00       	push   $0xa14
 302:	68 1e 0a 00 00       	push   $0xa1e
 307:	6a 01                	push   $0x1
 309:	e8 58 04 00 00       	call   766 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 a3 0a 00 00       	push   $0xaa3
 316:	68 35 0a 00 00       	push   $0xa35
 31b:	6a 01                	push   $0x1
 31d:	e8 44 04 00 00       	call   766 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 49 0a 00 00       	push   $0xa49
 32a:	6a 01                	push   $0x1
 32c:	e8 35 04 00 00       	call   766 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 c8 0e 00 00    	push   0xec8
 33a:	e8 02 03 00 00       	call   641 <kill>
 33f:	e8 cd 02 00 00       	call   611 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 14 0a 00 00       	push   $0xa14
 34b:	68 1e 0a 00 00       	push   $0xa1e
 350:	6a 01                	push   $0x1
 352:	e8 0f 04 00 00       	call   766 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 7d 0a 00 00       	push   $0xa7d
 35f:	68 35 0a 00 00       	push   $0xa35
 364:	6a 01                	push   $0x1
 366:	e8 fb 03 00 00       	call   766 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 49 0a 00 00       	push   $0xa49
 373:	6a 01                	push   $0x1
 375:	e8 ec 03 00 00       	call   766 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 c8 0e 00 00    	push   0xec8
 383:	e8 b9 02 00 00       	call   641 <kill>
 388:	e8 84 02 00 00       	call   611 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 14 0a 00 00       	push   $0xa14
 394:	68 1e 0a 00 00       	push   $0xa1e
 399:	6a 01                	push   $0x1
 39b:	e8 c6 03 00 00       	call   766 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 8c 0a 00 00       	push   $0xa8c
 3a8:	68 35 0a 00 00       	push   $0xa35
 3ad:	6a 01                	push   $0x1
 3af:	e8 b2 03 00 00       	call   766 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 49 0a 00 00       	push   $0xa49
 3bc:	6a 01                	push   $0x1
 3be:	e8 a3 03 00 00       	call   766 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 c8 0e 00 00    	push   0xec8
 3cc:	e8 70 02 00 00       	call   641 <kill>
 3d1:	e8 3b 02 00 00       	call   611 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 af 0a 00 00       	push   $0xaaf
 3de:	6a 01                	push   $0x1
 3e0:	e8 81 03 00 00       	call   766 <printf>
   exit();
 3e5:	e8 27 02 00 00       	call   611 <exit>

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
 4b0:	e8 74 01 00 00       	call   629 <read>
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
 4ee:	e8 5e 01 00 00       	call   651 <open>
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
 503:	e8 61 01 00 00       	call   669 <fstat>
 508:	89 c6                	mov    %eax,%esi
  close(fd);
 50a:	89 1c 24             	mov    %ebx,(%esp)
 50d:	e8 27 01 00 00       	call   639 <close>
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

  void* stack = malloc(PGSIZE);
 587:	68 00 10 00 00       	push   $0x1000
 58c:	e8 fb 03 00 00       	call   98c <malloc>

  return clone(start_routine, arg1, arg2, stack);
 591:	50                   	push   %eax
 592:	ff 75 10             	push   0x10(%ebp)
 595:	ff 75 0c             	push   0xc(%ebp)
 598:	ff 75 08             	push   0x8(%ebp)
 59b:	e8 11 01 00 00       	call   6b1 <clone>
}
 5a0:	c9                   	leave  
 5a1:	c3                   	ret    

000005a2 <thread_join>:

int thread_join(){
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
 5a5:	53                   	push   %ebx
 5a6:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 5a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5ac:	50                   	push   %eax
 5ad:	e8 07 01 00 00       	call   6b9 <join>
  if (x < 0) {
 5b2:	83 c4 10             	add    $0x10,%esp
 5b5:	85 c0                	test   %eax,%eax
 5b7:	78 17                	js     5d0 <thread_join+0x2e>
 5b9:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 5bb:	83 ec 0c             	sub    $0xc,%esp
 5be:	ff 75 f4             	push   -0xc(%ebp)
 5c1:	e8 06 03 00 00       	call   8cc <free>
  return x;
 5c6:	83 c4 10             	add    $0x10,%esp
}
 5c9:	89 d8                	mov    %ebx,%eax
 5cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ce:	c9                   	leave  
 5cf:	c3                   	ret    
    return -1;
 5d0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 5d5:	eb f2                	jmp    5c9 <thread_join+0x27>

000005d7 <lock_init>:

void lock_init(lock_t *spin){
 5d7:	55                   	push   %ebp
 5d8:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5e3:	5d                   	pop    %ebp
 5e4:	c3                   	ret    

000005e5 <lock_acquire>:

void lock_acquire(lock_t *spin){
 5e5:	55                   	push   %ebp
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5eb:	b8 01 00 00 00       	mov    $0x1,%eax
 5f0:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 5f3:	85 c0                	test   %eax,%eax
 5f5:	75 f4                	jne    5eb <lock_acquire+0x6>

}
 5f7:	5d                   	pop    %ebp
 5f8:	c3                   	ret    

000005f9 <lock_release>:

void lock_release(lock_t *spin){
 5f9:	55                   	push   %ebp
 5fa:	89 e5                	mov    %esp,%ebp
 5fc:	8b 55 08             	mov    0x8(%ebp),%edx
 5ff:	b8 00 00 00 00       	mov    $0x0,%eax
 604:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 607:	5d                   	pop    %ebp
 608:	c3                   	ret    

00000609 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 609:	b8 01 00 00 00       	mov    $0x1,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <exit>:
SYSCALL(exit)
 611:	b8 02 00 00 00       	mov    $0x2,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <wait>:
SYSCALL(wait)
 619:	b8 03 00 00 00       	mov    $0x3,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <pipe>:
SYSCALL(pipe)
 621:	b8 04 00 00 00       	mov    $0x4,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <read>:
SYSCALL(read)
 629:	b8 05 00 00 00       	mov    $0x5,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <write>:
SYSCALL(write)
 631:	b8 10 00 00 00       	mov    $0x10,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <close>:
SYSCALL(close)
 639:	b8 15 00 00 00       	mov    $0x15,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <kill>:
SYSCALL(kill)
 641:	b8 06 00 00 00       	mov    $0x6,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <exec>:
SYSCALL(exec)
 649:	b8 07 00 00 00       	mov    $0x7,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <open>:
SYSCALL(open)
 651:	b8 0f 00 00 00       	mov    $0xf,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <mknod>:
SYSCALL(mknod)
 659:	b8 11 00 00 00       	mov    $0x11,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <unlink>:
SYSCALL(unlink)
 661:	b8 12 00 00 00       	mov    $0x12,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <fstat>:
SYSCALL(fstat)
 669:	b8 08 00 00 00       	mov    $0x8,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <link>:
SYSCALL(link)
 671:	b8 13 00 00 00       	mov    $0x13,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <mkdir>:
SYSCALL(mkdir)
 679:	b8 14 00 00 00       	mov    $0x14,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <chdir>:
SYSCALL(chdir)
 681:	b8 09 00 00 00       	mov    $0x9,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <dup>:
SYSCALL(dup)
 689:	b8 0a 00 00 00       	mov    $0xa,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <getpid>:
SYSCALL(getpid)
 691:	b8 0b 00 00 00       	mov    $0xb,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <sbrk>:
SYSCALL(sbrk)
 699:	b8 0c 00 00 00       	mov    $0xc,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <sleep>:
SYSCALL(sleep)
 6a1:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <uptime>:
SYSCALL(uptime)
 6a9:	b8 0e 00 00 00       	mov    $0xe,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <clone>:
SYSCALL(clone)
 6b1:	b8 16 00 00 00       	mov    $0x16,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <join>:
 6b9:	b8 17 00 00 00       	mov    $0x17,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6c1:	55                   	push   %ebp
 6c2:	89 e5                	mov    %esp,%ebp
 6c4:	83 ec 1c             	sub    $0x1c,%esp
 6c7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6ca:	6a 01                	push   $0x1
 6cc:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6cf:	52                   	push   %edx
 6d0:	50                   	push   %eax
 6d1:	e8 5b ff ff ff       	call   631 <write>
}
 6d6:	83 c4 10             	add    $0x10,%esp
 6d9:	c9                   	leave  
 6da:	c3                   	ret    

000006db <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6db:	55                   	push   %ebp
 6dc:	89 e5                	mov    %esp,%ebp
 6de:	57                   	push   %edi
 6df:	56                   	push   %esi
 6e0:	53                   	push   %ebx
 6e1:	83 ec 2c             	sub    $0x2c,%esp
 6e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e7:	89 d0                	mov    %edx,%eax
 6e9:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6eb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6ef:	0f 95 c1             	setne  %cl
 6f2:	c1 ea 1f             	shr    $0x1f,%edx
 6f5:	84 d1                	test   %dl,%cl
 6f7:	74 44                	je     73d <printint+0x62>
    neg = 1;
    x = -xx;
 6f9:	f7 d8                	neg    %eax
 6fb:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6fd:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 704:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 709:	89 c8                	mov    %ecx,%eax
 70b:	ba 00 00 00 00       	mov    $0x0,%edx
 710:	f7 f6                	div    %esi
 712:	89 df                	mov    %ebx,%edi
 714:	83 c3 01             	add    $0x1,%ebx
 717:	0f b6 92 40 0b 00 00 	movzbl 0xb40(%edx),%edx
 71e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 722:	89 ca                	mov    %ecx,%edx
 724:	89 c1                	mov    %eax,%ecx
 726:	39 d6                	cmp    %edx,%esi
 728:	76 df                	jbe    709 <printint+0x2e>
  if(neg)
 72a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 72e:	74 31                	je     761 <printint+0x86>
    buf[i++] = '-';
 730:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 735:	8d 5f 02             	lea    0x2(%edi),%ebx
 738:	8b 75 d0             	mov    -0x30(%ebp),%esi
 73b:	eb 17                	jmp    754 <printint+0x79>
    x = xx;
 73d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 73f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 746:	eb bc                	jmp    704 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 748:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 74d:	89 f0                	mov    %esi,%eax
 74f:	e8 6d ff ff ff       	call   6c1 <putc>
  while(--i >= 0)
 754:	83 eb 01             	sub    $0x1,%ebx
 757:	79 ef                	jns    748 <printint+0x6d>
}
 759:	83 c4 2c             	add    $0x2c,%esp
 75c:	5b                   	pop    %ebx
 75d:	5e                   	pop    %esi
 75e:	5f                   	pop    %edi
 75f:	5d                   	pop    %ebp
 760:	c3                   	ret    
 761:	8b 75 d0             	mov    -0x30(%ebp),%esi
 764:	eb ee                	jmp    754 <printint+0x79>

00000766 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 766:	55                   	push   %ebp
 767:	89 e5                	mov    %esp,%ebp
 769:	57                   	push   %edi
 76a:	56                   	push   %esi
 76b:	53                   	push   %ebx
 76c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 76f:	8d 45 10             	lea    0x10(%ebp),%eax
 772:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 775:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 77a:	bb 00 00 00 00       	mov    $0x0,%ebx
 77f:	eb 14                	jmp    795 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 781:	89 fa                	mov    %edi,%edx
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	e8 36 ff ff ff       	call   6c1 <putc>
 78b:	eb 05                	jmp    792 <printf+0x2c>
      }
    } else if(state == '%'){
 78d:	83 fe 25             	cmp    $0x25,%esi
 790:	74 25                	je     7b7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 792:	83 c3 01             	add    $0x1,%ebx
 795:	8b 45 0c             	mov    0xc(%ebp),%eax
 798:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 79c:	84 c0                	test   %al,%al
 79e:	0f 84 20 01 00 00    	je     8c4 <printf+0x15e>
    c = fmt[i] & 0xff;
 7a4:	0f be f8             	movsbl %al,%edi
 7a7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7aa:	85 f6                	test   %esi,%esi
 7ac:	75 df                	jne    78d <printf+0x27>
      if(c == '%'){
 7ae:	83 f8 25             	cmp    $0x25,%eax
 7b1:	75 ce                	jne    781 <printf+0x1b>
        state = '%';
 7b3:	89 c6                	mov    %eax,%esi
 7b5:	eb db                	jmp    792 <printf+0x2c>
      if(c == 'd'){
 7b7:	83 f8 25             	cmp    $0x25,%eax
 7ba:	0f 84 cf 00 00 00    	je     88f <printf+0x129>
 7c0:	0f 8c dd 00 00 00    	jl     8a3 <printf+0x13d>
 7c6:	83 f8 78             	cmp    $0x78,%eax
 7c9:	0f 8f d4 00 00 00    	jg     8a3 <printf+0x13d>
 7cf:	83 f8 63             	cmp    $0x63,%eax
 7d2:	0f 8c cb 00 00 00    	jl     8a3 <printf+0x13d>
 7d8:	83 e8 63             	sub    $0x63,%eax
 7db:	83 f8 15             	cmp    $0x15,%eax
 7de:	0f 87 bf 00 00 00    	ja     8a3 <printf+0x13d>
 7e4:	ff 24 85 e8 0a 00 00 	jmp    *0xae8(,%eax,4)
        printint(fd, *ap, 10, 1);
 7eb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ee:	8b 17                	mov    (%edi),%edx
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	6a 01                	push   $0x1
 7f5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7fa:	8b 45 08             	mov    0x8(%ebp),%eax
 7fd:	e8 d9 fe ff ff       	call   6db <printint>
        ap++;
 802:	83 c7 04             	add    $0x4,%edi
 805:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 808:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 80b:	be 00 00 00 00       	mov    $0x0,%esi
 810:	eb 80                	jmp    792 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 812:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 815:	8b 17                	mov    (%edi),%edx
 817:	83 ec 0c             	sub    $0xc,%esp
 81a:	6a 00                	push   $0x0
 81c:	b9 10 00 00 00       	mov    $0x10,%ecx
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	e8 b2 fe ff ff       	call   6db <printint>
        ap++;
 829:	83 c7 04             	add    $0x4,%edi
 82c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 82f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 832:	be 00 00 00 00       	mov    $0x0,%esi
 837:	e9 56 ff ff ff       	jmp    792 <printf+0x2c>
        s = (char*)*ap;
 83c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 83f:	8b 30                	mov    (%eax),%esi
        ap++;
 841:	83 c0 04             	add    $0x4,%eax
 844:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 847:	85 f6                	test   %esi,%esi
 849:	75 15                	jne    860 <printf+0xfa>
          s = "(null)";
 84b:	be e1 0a 00 00       	mov    $0xae1,%esi
 850:	eb 0e                	jmp    860 <printf+0xfa>
          putc(fd, *s);
 852:	0f be d2             	movsbl %dl,%edx
 855:	8b 45 08             	mov    0x8(%ebp),%eax
 858:	e8 64 fe ff ff       	call   6c1 <putc>
          s++;
 85d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 860:	0f b6 16             	movzbl (%esi),%edx
 863:	84 d2                	test   %dl,%dl
 865:	75 eb                	jne    852 <printf+0xec>
      state = 0;
 867:	be 00 00 00 00       	mov    $0x0,%esi
 86c:	e9 21 ff ff ff       	jmp    792 <printf+0x2c>
        putc(fd, *ap);
 871:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 874:	0f be 17             	movsbl (%edi),%edx
 877:	8b 45 08             	mov    0x8(%ebp),%eax
 87a:	e8 42 fe ff ff       	call   6c1 <putc>
        ap++;
 87f:	83 c7 04             	add    $0x4,%edi
 882:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 885:	be 00 00 00 00       	mov    $0x0,%esi
 88a:	e9 03 ff ff ff       	jmp    792 <printf+0x2c>
        putc(fd, c);
 88f:	89 fa                	mov    %edi,%edx
 891:	8b 45 08             	mov    0x8(%ebp),%eax
 894:	e8 28 fe ff ff       	call   6c1 <putc>
      state = 0;
 899:	be 00 00 00 00       	mov    $0x0,%esi
 89e:	e9 ef fe ff ff       	jmp    792 <printf+0x2c>
        putc(fd, '%');
 8a3:	ba 25 00 00 00       	mov    $0x25,%edx
 8a8:	8b 45 08             	mov    0x8(%ebp),%eax
 8ab:	e8 11 fe ff ff       	call   6c1 <putc>
        putc(fd, c);
 8b0:	89 fa                	mov    %edi,%edx
 8b2:	8b 45 08             	mov    0x8(%ebp),%eax
 8b5:	e8 07 fe ff ff       	call   6c1 <putc>
      state = 0;
 8ba:	be 00 00 00 00       	mov    $0x0,%esi
 8bf:	e9 ce fe ff ff       	jmp    792 <printf+0x2c>
    }
  }
}
 8c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret    

000008cc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8cc:	55                   	push   %ebp
 8cd:	89 e5                	mov    %esp,%ebp
 8cf:	57                   	push   %edi
 8d0:	56                   	push   %esi
 8d1:	53                   	push   %ebx
 8d2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d8:	a1 cc 0e 00 00       	mov    0xecc,%eax
 8dd:	eb 02                	jmp    8e1 <free+0x15>
 8df:	89 d0                	mov    %edx,%eax
 8e1:	39 c8                	cmp    %ecx,%eax
 8e3:	73 04                	jae    8e9 <free+0x1d>
 8e5:	39 08                	cmp    %ecx,(%eax)
 8e7:	77 12                	ja     8fb <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e9:	8b 10                	mov    (%eax),%edx
 8eb:	39 c2                	cmp    %eax,%edx
 8ed:	77 f0                	ja     8df <free+0x13>
 8ef:	39 c8                	cmp    %ecx,%eax
 8f1:	72 08                	jb     8fb <free+0x2f>
 8f3:	39 ca                	cmp    %ecx,%edx
 8f5:	77 04                	ja     8fb <free+0x2f>
 8f7:	89 d0                	mov    %edx,%eax
 8f9:	eb e6                	jmp    8e1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8fb:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8fe:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 901:	8b 10                	mov    (%eax),%edx
 903:	39 d7                	cmp    %edx,%edi
 905:	74 19                	je     920 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 907:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 90a:	8b 50 04             	mov    0x4(%eax),%edx
 90d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 910:	39 ce                	cmp    %ecx,%esi
 912:	74 1b                	je     92f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 914:	89 08                	mov    %ecx,(%eax)
  freep = p;
 916:	a3 cc 0e 00 00       	mov    %eax,0xecc
}
 91b:	5b                   	pop    %ebx
 91c:	5e                   	pop    %esi
 91d:	5f                   	pop    %edi
 91e:	5d                   	pop    %ebp
 91f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 920:	03 72 04             	add    0x4(%edx),%esi
 923:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 926:	8b 10                	mov    (%eax),%edx
 928:	8b 12                	mov    (%edx),%edx
 92a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 92d:	eb db                	jmp    90a <free+0x3e>
    p->s.size += bp->s.size;
 92f:	03 53 fc             	add    -0x4(%ebx),%edx
 932:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 935:	8b 53 f8             	mov    -0x8(%ebx),%edx
 938:	89 10                	mov    %edx,(%eax)
 93a:	eb da                	jmp    916 <free+0x4a>

0000093c <morecore>:

static Header*
morecore(uint nu)
{
 93c:	55                   	push   %ebp
 93d:	89 e5                	mov    %esp,%ebp
 93f:	53                   	push   %ebx
 940:	83 ec 04             	sub    $0x4,%esp
 943:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 945:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 94a:	77 05                	ja     951 <morecore+0x15>
    nu = 4096;
 94c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 951:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 958:	83 ec 0c             	sub    $0xc,%esp
 95b:	50                   	push   %eax
 95c:	e8 38 fd ff ff       	call   699 <sbrk>
  if(p == (char*)-1)
 961:	83 c4 10             	add    $0x10,%esp
 964:	83 f8 ff             	cmp    $0xffffffff,%eax
 967:	74 1c                	je     985 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 969:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 96c:	83 c0 08             	add    $0x8,%eax
 96f:	83 ec 0c             	sub    $0xc,%esp
 972:	50                   	push   %eax
 973:	e8 54 ff ff ff       	call   8cc <free>
  return freep;
 978:	a1 cc 0e 00 00       	mov    0xecc,%eax
 97d:	83 c4 10             	add    $0x10,%esp
}
 980:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 983:	c9                   	leave  
 984:	c3                   	ret    
    return 0;
 985:	b8 00 00 00 00       	mov    $0x0,%eax
 98a:	eb f4                	jmp    980 <morecore+0x44>

0000098c <malloc>:

void*
malloc(uint nbytes)
{
 98c:	55                   	push   %ebp
 98d:	89 e5                	mov    %esp,%ebp
 98f:	53                   	push   %ebx
 990:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 993:	8b 45 08             	mov    0x8(%ebp),%eax
 996:	8d 58 07             	lea    0x7(%eax),%ebx
 999:	c1 eb 03             	shr    $0x3,%ebx
 99c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 99f:	8b 0d cc 0e 00 00    	mov    0xecc,%ecx
 9a5:	85 c9                	test   %ecx,%ecx
 9a7:	74 04                	je     9ad <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a9:	8b 01                	mov    (%ecx),%eax
 9ab:	eb 4a                	jmp    9f7 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9ad:	c7 05 cc 0e 00 00 d0 	movl   $0xed0,0xecc
 9b4:	0e 00 00 
 9b7:	c7 05 d0 0e 00 00 d0 	movl   $0xed0,0xed0
 9be:	0e 00 00 
    base.s.size = 0;
 9c1:	c7 05 d4 0e 00 00 00 	movl   $0x0,0xed4
 9c8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9cb:	b9 d0 0e 00 00       	mov    $0xed0,%ecx
 9d0:	eb d7                	jmp    9a9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9d2:	74 19                	je     9ed <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9d4:	29 da                	sub    %ebx,%edx
 9d6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9d9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9dc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9df:	89 0d cc 0e 00 00    	mov    %ecx,0xecc
      return (void*)(p + 1);
 9e5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9eb:	c9                   	leave  
 9ec:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9ed:	8b 10                	mov    (%eax),%edx
 9ef:	89 11                	mov    %edx,(%ecx)
 9f1:	eb ec                	jmp    9df <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f3:	89 c1                	mov    %eax,%ecx
 9f5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9f7:	8b 50 04             	mov    0x4(%eax),%edx
 9fa:	39 da                	cmp    %ebx,%edx
 9fc:	73 d4                	jae    9d2 <malloc+0x46>
    if(p == freep)
 9fe:	39 05 cc 0e 00 00    	cmp    %eax,0xecc
 a04:	75 ed                	jne    9f3 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a06:	89 d8                	mov    %ebx,%eax
 a08:	e8 2f ff ff ff       	call   93c <morecore>
 a0d:	85 c0                	test   %eax,%eax
 a0f:	75 e2                	jne    9f3 <malloc+0x67>
 a11:	eb d5                	jmp    9e8 <malloc+0x5c>
