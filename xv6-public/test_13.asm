
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
   exit(); \
}

void worker(void *arg1, void *arg2);

unsigned int fib(unsigned int n) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if (n == 0) {
   8:	85 db                	test   %ebx,%ebx
   a:	74 05                	je     11 <fib+0x11>
      return 0;
   } else if (n == 1) {
   c:	83 fb 01             	cmp    $0x1,%ebx
   f:	75 09                	jne    1a <fib+0x1a>
      return 1;
   } else {
      return fib(n - 1) + fib(n - 2);
   }
}
  11:	89 d8                	mov    %ebx,%eax
  13:	8d 65 f8             	lea    -0x8(%ebp),%esp
  16:	5b                   	pop    %ebx
  17:	5e                   	pop    %esi
  18:	5d                   	pop    %ebp
  19:	c3                   	ret    
      return fib(n - 1) + fib(n - 2);
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	8d 43 ff             	lea    -0x1(%ebx),%eax
  20:	50                   	push   %eax
  21:	e8 da ff ff ff       	call   0 <fib>
  26:	89 c6                	mov    %eax,%esi
  28:	83 eb 02             	sub    $0x2,%ebx
  2b:	89 1c 24             	mov    %ebx,(%esp)
  2e:	e8 cd ff ff ff       	call   0 <fib>
  33:	83 c4 10             	add    $0x10,%esp
  36:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  39:	eb d6                	jmp    11 <fib+0x11>

0000003b <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
  41:	8b 45 0c             	mov    0xc(%ebp),%eax
  44:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
  46:	8b 45 08             	mov    0x8(%ebp),%eax
  49:	83 38 0b             	cmpl   $0xb,(%eax)
  4c:	75 5f                	jne    ad <worker+0x72>
   assert(tmp2 == 22);
  4e:	83 fa 16             	cmp    $0x16,%edx
  51:	0f 85 9f 00 00 00    	jne    f6 <worker+0xbb>
   assert(global == 1);
  57:	83 3d 14 0f 00 00 01 	cmpl   $0x1,0xf14
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 58 0a 00 00       	push   $0xa58
  6b:	68 62 0a 00 00       	push   $0xa62
  70:	6a 01                	push   $0x1
  72:	e8 31 07 00 00       	call   7a8 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 a1 0a 00 00       	push   $0xaa1
  7f:	68 75 0a 00 00       	push   $0xa75
  84:	6a 01                	push   $0x1
  86:	e8 1d 07 00 00       	call   7a8 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 89 0a 00 00       	push   $0xa89
  93:	6a 01                	push   $0x1
  95:	e8 0e 07 00 00       	call   7a8 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 18 0f 00 00    	push   0xf18
  a3:	e8 db 05 00 00       	call   683 <kill>
  a8:	e8 a6 05 00 00       	call   653 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 58 0a 00 00       	push   $0xa58
  b4:	68 62 0a 00 00       	push   $0xa62
  b9:	6a 01                	push   $0x1
  bb:	e8 e8 06 00 00       	call   7a8 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 6a 0a 00 00       	push   $0xa6a
  c8:	68 75 0a 00 00       	push   $0xa75
  cd:	6a 01                	push   $0x1
  cf:	e8 d4 06 00 00       	call   7a8 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 89 0a 00 00       	push   $0xa89
  dc:	6a 01                	push   $0x1
  de:	e8 c5 06 00 00       	call   7a8 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 18 0f 00 00    	push   0xf18
  ec:	e8 92 05 00 00       	call   683 <kill>
  f1:	e8 5d 05 00 00       	call   653 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 58 0a 00 00       	push   $0xa58
  fd:	68 62 0a 00 00       	push   $0xa62
 102:	6a 01                	push   $0x1
 104:	e8 9f 06 00 00       	call   7a8 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 96 0a 00 00       	push   $0xa96
 111:	68 75 0a 00 00       	push   $0xa75
 116:	6a 01                	push   $0x1
 118:	e8 8b 06 00 00       	call   7a8 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 89 0a 00 00       	push   $0xa89
 125:	6a 01                	push   $0x1
 127:	e8 7c 06 00 00       	call   7a8 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 18 0f 00 00    	push   0xf18
 135:	e8 49 05 00 00       	call   683 <kill>
 13a:	e8 14 05 00 00       	call   653 <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 58 0a 00 00       	push   $0xa58
 158:	68 62 0a 00 00       	push   $0xa62
 15d:	6a 01                	push   $0x1
 15f:	e8 44 06 00 00       	call   7a8 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 ad 0a 00 00       	push   $0xaad
 16c:	68 75 0a 00 00       	push   $0xa75
 171:	6a 01                	push   $0x1
 173:	e8 30 06 00 00       	call   7a8 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 89 0a 00 00       	push   $0xa89
 180:	6a 01                	push   $0x1
 182:	e8 21 06 00 00       	call   7a8 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 18 0f 00 00    	push   0xf18
 190:	e8 ee 04 00 00       	call   683 <kill>
 195:	e8 b9 04 00 00       	call   653 <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 58 0a 00 00       	push   $0xa58
 1b3:	68 62 0a 00 00       	push   $0xa62
 1b8:	6a 01                	push   $0x1
 1ba:	e8 e9 05 00 00       	call   7a8 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 b9 0a 00 00       	push   $0xab9
 1c7:	68 75 0a 00 00       	push   $0xa75
 1cc:	6a 01                	push   $0x1
 1ce:	e8 d5 05 00 00       	call   7a8 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 89 0a 00 00       	push   $0xa89
 1db:	6a 01                	push   $0x1
 1dd:	e8 c6 05 00 00       	call   7a8 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 18 0f 00 00    	push   0xf18
 1eb:	e8 93 04 00 00       	call   683 <kill>
 1f0:	e8 5e 04 00 00       	call   653 <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 58 0a 00 00       	push   $0xa58
 20e:	68 62 0a 00 00       	push   $0xa62
 213:	6a 01                	push   $0x1
 215:	e8 8e 05 00 00       	call   7a8 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 c5 0a 00 00       	push   $0xac5
 222:	68 75 0a 00 00       	push   $0xa75
 227:	6a 01                	push   $0x1
 229:	e8 7a 05 00 00       	call   7a8 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 89 0a 00 00       	push   $0xa89
 236:	6a 01                	push   $0x1
 238:	e8 6b 05 00 00       	call   7a8 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 18 0f 00 00    	push   0xf18
 246:	e8 38 04 00 00       	call   683 <kill>
 24b:	e8 03 04 00 00       	call   653 <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 58 0a 00 00       	push   $0xa58
 26b:	68 62 0a 00 00       	push   $0xa62
 270:	6a 01                	push   $0x1
 272:	e8 31 05 00 00       	call   7a8 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 d2 0a 00 00       	push   $0xad2
 27f:	68 75 0a 00 00       	push   $0xa75
 284:	6a 01                	push   $0x1
 286:	e8 1d 05 00 00       	call   7a8 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 89 0a 00 00       	push   $0xa89
 293:	6a 01                	push   $0x1
 295:	e8 0e 05 00 00       	call   7a8 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 18 0f 00 00    	push   0xf18
 2a3:	e8 db 03 00 00       	call   683 <kill>
 2a8:	e8 a6 03 00 00       	call   653 <exit>
   exit();
 2ad:	e8 a1 03 00 00       	call   653 <exit>

000002b2 <main>:
{
 2b2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2b6:	83 e4 f0             	and    $0xfffffff0,%esp
 2b9:	ff 71 fc             	push   -0x4(%ecx)
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	53                   	push   %ebx
 2c0:	51                   	push   %ecx
 2c1:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2c4:	e8 0a 04 00 00       	call   6d3 <getpid>
 2c9:	a3 18 0f 00 00       	mov    %eax,0xf18
   assert(fib(28) == 317811);
 2ce:	83 ec 0c             	sub    $0xc,%esp
 2d1:	6a 1c                	push   $0x1c
 2d3:	e8 28 fd ff ff       	call   0 <fib>
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
 2e0:	75 40                	jne    322 <main+0x70>
   int arg1 = 11, arg2 = 22;
 2e2:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2e9:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   for (int i = 0; i < num_threads; i++) {
 2f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f5:	39 1d 10 0f 00 00    	cmp    %ebx,0xf10
 2fb:	0f 8e b3 00 00 00    	jle    3b4 <main+0x102>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 301:	83 ec 04             	sub    $0x4,%esp
 304:	8d 45 f0             	lea    -0x10(%ebp),%eax
 307:	50                   	push   %eax
 308:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30b:	50                   	push   %eax
 30c:	68 3b 00 00 00       	push   $0x3b
 311:	e8 ad 02 00 00       	call   5c3 <thread_create>
      assert(thread_pid > 0);
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	7e 4e                	jle    36b <main+0xb9>
   for (int i = 0; i < num_threads; i++) {
 31d:	83 c3 01             	add    $0x1,%ebx
 320:	eb d3                	jmp    2f5 <main+0x43>
   assert(fib(28) == 317811);
 322:	6a 28                	push   $0x28
 324:	68 58 0a 00 00       	push   $0xa58
 329:	68 62 0a 00 00       	push   $0xa62
 32e:	6a 01                	push   $0x1
 330:	e8 73 04 00 00       	call   7a8 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 e1 0a 00 00       	push   $0xae1
 33d:	68 75 0a 00 00       	push   $0xa75
 342:	6a 01                	push   $0x1
 344:	e8 5f 04 00 00       	call   7a8 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 89 0a 00 00       	push   $0xa89
 351:	6a 01                	push   $0x1
 353:	e8 50 04 00 00       	call   7a8 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 18 0f 00 00    	push   0xf18
 361:	e8 1d 03 00 00       	call   683 <kill>
 366:	e8 e8 02 00 00       	call   653 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 58 0a 00 00       	push   $0xa58
 372:	68 62 0a 00 00       	push   $0xa62
 377:	6a 01                	push   $0x1
 379:	e8 2a 04 00 00       	call   7a8 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 f3 0a 00 00       	push   $0xaf3
 386:	68 75 0a 00 00       	push   $0xa75
 38b:	6a 01                	push   $0x1
 38d:	e8 16 04 00 00       	call   7a8 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 89 0a 00 00       	push   $0xa89
 39a:	6a 01                	push   $0x1
 39c:	e8 07 04 00 00       	call   7a8 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 18 0f 00 00    	push   0xf18
 3aa:	e8 d4 02 00 00       	call   683 <kill>
 3af:	e8 9f 02 00 00       	call   653 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 10 0f 00 00    	cmp    %ebx,0xf10
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 1e 02 00 00       	call   5e4 <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 58 0a 00 00       	push   $0xa58
 3d6:	68 62 0a 00 00       	push   $0xa62
 3db:	6a 01                	push   $0x1
 3dd:	e8 c6 03 00 00       	call   7a8 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 02 0b 00 00       	push   $0xb02
 3ea:	68 75 0a 00 00       	push   $0xa75
 3ef:	6a 01                	push   $0x1
 3f1:	e8 b2 03 00 00       	call   7a8 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 89 0a 00 00       	push   $0xa89
 3fe:	6a 01                	push   $0x1
 400:	e8 a3 03 00 00       	call   7a8 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 18 0f 00 00    	push   0xf18
 40e:	e8 70 02 00 00       	call   683 <kill>
 413:	e8 3b 02 00 00       	call   653 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 0f 0b 00 00       	push   $0xb0f
 420:	6a 01                	push   $0x1
 422:	e8 81 03 00 00       	call   7a8 <printf>
   exit();
 427:	e8 27 02 00 00       	call   653 <exit>

0000042c <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	56                   	push   %esi
 430:	53                   	push   %ebx
 431:	8b 75 08             	mov    0x8(%ebp),%esi
 434:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 437:	89 f0                	mov    %esi,%eax
 439:	89 d1                	mov    %edx,%ecx
 43b:	83 c2 01             	add    $0x1,%edx
 43e:	89 c3                	mov    %eax,%ebx
 440:	83 c0 01             	add    $0x1,%eax
 443:	0f b6 09             	movzbl (%ecx),%ecx
 446:	88 0b                	mov    %cl,(%ebx)
 448:	84 c9                	test   %cl,%cl
 44a:	75 ed                	jne    439 <strcpy+0xd>
    ;
  return os;
}
 44c:	89 f0                	mov    %esi,%eax
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5d                   	pop    %ebp
 451:	c3                   	ret    

00000452 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	8b 4d 08             	mov    0x8(%ebp),%ecx
 458:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 45b:	eb 06                	jmp    463 <strcmp+0x11>
    p++, q++;
 45d:	83 c1 01             	add    $0x1,%ecx
 460:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 463:	0f b6 01             	movzbl (%ecx),%eax
 466:	84 c0                	test   %al,%al
 468:	74 04                	je     46e <strcmp+0x1c>
 46a:	3a 02                	cmp    (%edx),%al
 46c:	74 ef                	je     45d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 46e:	0f b6 c0             	movzbl %al,%eax
 471:	0f b6 12             	movzbl (%edx),%edx
 474:	29 d0                	sub    %edx,%eax
}
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    

00000478 <strlen>:

uint
strlen(const char *s)
{
 478:	55                   	push   %ebp
 479:	89 e5                	mov    %esp,%ebp
 47b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 47e:	b8 00 00 00 00       	mov    $0x0,%eax
 483:	eb 03                	jmp    488 <strlen+0x10>
 485:	83 c0 01             	add    $0x1,%eax
 488:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 48c:	75 f7                	jne    485 <strlen+0xd>
    ;
  return n;
}
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <memset>:

void*
memset(void *dst, int c, uint n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 497:	89 d7                	mov    %edx,%edi
 499:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49c:	8b 45 0c             	mov    0xc(%ebp),%eax
 49f:	fc                   	cld    
 4a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a2:	89 d0                	mov    %edx,%eax
 4a4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4a7:	c9                   	leave  
 4a8:	c3                   	ret    

000004a9 <strchr>:

char*
strchr(const char *s, char c)
{
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4b3:	eb 03                	jmp    4b8 <strchr+0xf>
 4b5:	83 c0 01             	add    $0x1,%eax
 4b8:	0f b6 10             	movzbl (%eax),%edx
 4bb:	84 d2                	test   %dl,%dl
 4bd:	74 06                	je     4c5 <strchr+0x1c>
    if(*s == c)
 4bf:	38 ca                	cmp    %cl,%dl
 4c1:	75 f2                	jne    4b5 <strchr+0xc>
 4c3:	eb 05                	jmp    4ca <strchr+0x21>
      return (char*)s;
  return 0;
 4c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <gets>:

char*
gets(char *buf, int max)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	53                   	push   %ebx
 4d2:	83 ec 1c             	sub    $0x1c,%esp
 4d5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 4dd:	89 de                	mov    %ebx,%esi
 4df:	83 c3 01             	add    $0x1,%ebx
 4e2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4e5:	7d 2e                	jge    515 <gets+0x49>
    cc = read(0, &c, 1);
 4e7:	83 ec 04             	sub    $0x4,%esp
 4ea:	6a 01                	push   $0x1
 4ec:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ef:	50                   	push   %eax
 4f0:	6a 00                	push   $0x0
 4f2:	e8 74 01 00 00       	call   66b <read>
    if(cc < 1)
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	85 c0                	test   %eax,%eax
 4fc:	7e 17                	jle    515 <gets+0x49>
      break;
    buf[i++] = c;
 4fe:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 502:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 505:	3c 0a                	cmp    $0xa,%al
 507:	0f 94 c2             	sete   %dl
 50a:	3c 0d                	cmp    $0xd,%al
 50c:	0f 94 c0             	sete   %al
 50f:	08 c2                	or     %al,%dl
 511:	74 ca                	je     4dd <gets+0x11>
    buf[i++] = c;
 513:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 515:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 519:	89 f8                	mov    %edi,%eax
 51b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <stat>:

int
stat(const char *n, struct stat *st)
{
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	56                   	push   %esi
 527:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 528:	83 ec 08             	sub    $0x8,%esp
 52b:	6a 00                	push   $0x0
 52d:	ff 75 08             	push   0x8(%ebp)
 530:	e8 5e 01 00 00       	call   693 <open>
  if(fd < 0)
 535:	83 c4 10             	add    $0x10,%esp
 538:	85 c0                	test   %eax,%eax
 53a:	78 24                	js     560 <stat+0x3d>
 53c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 53e:	83 ec 08             	sub    $0x8,%esp
 541:	ff 75 0c             	push   0xc(%ebp)
 544:	50                   	push   %eax
 545:	e8 61 01 00 00       	call   6ab <fstat>
 54a:	89 c6                	mov    %eax,%esi
  close(fd);
 54c:	89 1c 24             	mov    %ebx,(%esp)
 54f:	e8 27 01 00 00       	call   67b <close>
  return r;
 554:	83 c4 10             	add    $0x10,%esp
}
 557:	89 f0                	mov    %esi,%eax
 559:	8d 65 f8             	lea    -0x8(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
    return -1;
 560:	be ff ff ff ff       	mov    $0xffffffff,%esi
 565:	eb f0                	jmp    557 <stat+0x34>

00000567 <atoi>:

int
atoi(const char *s)
{
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
 56a:	53                   	push   %ebx
 56b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 56e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 573:	eb 10                	jmp    585 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 575:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 578:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 57b:	83 c1 01             	add    $0x1,%ecx
 57e:	0f be c0             	movsbl %al,%eax
 581:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 585:	0f b6 01             	movzbl (%ecx),%eax
 588:	8d 58 d0             	lea    -0x30(%eax),%ebx
 58b:	80 fb 09             	cmp    $0x9,%bl
 58e:	76 e5                	jbe    575 <atoi+0xe>
  return n;
}
 590:	89 d0                	mov    %edx,%eax
 592:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	56                   	push   %esi
 59b:	53                   	push   %ebx
 59c:	8b 75 08             	mov    0x8(%ebp),%esi
 59f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5a2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5a5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5a7:	eb 0d                	jmp    5b6 <memmove+0x1f>
    *dst++ = *src++;
 5a9:	0f b6 01             	movzbl (%ecx),%eax
 5ac:	88 02                	mov    %al,(%edx)
 5ae:	8d 49 01             	lea    0x1(%ecx),%ecx
 5b1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5b4:	89 d8                	mov    %ebx,%eax
 5b6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5b9:	85 c0                	test   %eax,%eax
 5bb:	7f ec                	jg     5a9 <memmove+0x12>
  return vdst;
}
 5bd:	89 f0                	mov    %esi,%eax
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5d                   	pop    %ebp
 5c2:	c3                   	ret    

000005c3 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 5c3:	55                   	push   %ebp
 5c4:	89 e5                	mov    %esp,%ebp
 5c6:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 5c9:	68 00 10 00 00       	push   $0x1000
 5ce:	e8 fb 03 00 00       	call   9ce <malloc>

  return clone(start_routine, arg1, arg2, stack);
 5d3:	50                   	push   %eax
 5d4:	ff 75 10             	push   0x10(%ebp)
 5d7:	ff 75 0c             	push   0xc(%ebp)
 5da:	ff 75 08             	push   0x8(%ebp)
 5dd:	e8 11 01 00 00       	call   6f3 <clone>
}
 5e2:	c9                   	leave  
 5e3:	c3                   	ret    

000005e4 <thread_join>:

int thread_join(){
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	53                   	push   %ebx
 5e8:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 5eb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5ee:	50                   	push   %eax
 5ef:	e8 07 01 00 00       	call   6fb <join>
  if (x < 0) {
 5f4:	83 c4 10             	add    $0x10,%esp
 5f7:	85 c0                	test   %eax,%eax
 5f9:	78 17                	js     612 <thread_join+0x2e>
 5fb:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 5fd:	83 ec 0c             	sub    $0xc,%esp
 600:	ff 75 f4             	push   -0xc(%ebp)
 603:	e8 06 03 00 00       	call   90e <free>
  return x;
 608:	83 c4 10             	add    $0x10,%esp
}
 60b:	89 d8                	mov    %ebx,%eax
 60d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 610:	c9                   	leave  
 611:	c3                   	ret    
    return -1;
 612:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 617:	eb f2                	jmp    60b <thread_join+0x27>

00000619 <lock_init>:

void lock_init(lock_t *spin){
 619:	55                   	push   %ebp
 61a:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 61c:	8b 45 08             	mov    0x8(%ebp),%eax
 61f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 625:	5d                   	pop    %ebp
 626:	c3                   	ret    

00000627 <lock_acquire>:

void lock_acquire(lock_t *spin){
 627:	55                   	push   %ebp
 628:	89 e5                	mov    %esp,%ebp
 62a:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 62d:	b8 01 00 00 00       	mov    $0x1,%eax
 632:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 635:	85 c0                	test   %eax,%eax
 637:	75 f4                	jne    62d <lock_acquire+0x6>

}
 639:	5d                   	pop    %ebp
 63a:	c3                   	ret    

0000063b <lock_release>:

void lock_release(lock_t *spin){
 63b:	55                   	push   %ebp
 63c:	89 e5                	mov    %esp,%ebp
 63e:	8b 55 08             	mov    0x8(%ebp),%edx
 641:	b8 00 00 00 00       	mov    $0x0,%eax
 646:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 649:	5d                   	pop    %ebp
 64a:	c3                   	ret    

0000064b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 64b:	b8 01 00 00 00       	mov    $0x1,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <exit>:
SYSCALL(exit)
 653:	b8 02 00 00 00       	mov    $0x2,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <wait>:
SYSCALL(wait)
 65b:	b8 03 00 00 00       	mov    $0x3,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <pipe>:
SYSCALL(pipe)
 663:	b8 04 00 00 00       	mov    $0x4,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <read>:
SYSCALL(read)
 66b:	b8 05 00 00 00       	mov    $0x5,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <write>:
SYSCALL(write)
 673:	b8 10 00 00 00       	mov    $0x10,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <close>:
SYSCALL(close)
 67b:	b8 15 00 00 00       	mov    $0x15,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <kill>:
SYSCALL(kill)
 683:	b8 06 00 00 00       	mov    $0x6,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <exec>:
SYSCALL(exec)
 68b:	b8 07 00 00 00       	mov    $0x7,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <open>:
SYSCALL(open)
 693:	b8 0f 00 00 00       	mov    $0xf,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <mknod>:
SYSCALL(mknod)
 69b:	b8 11 00 00 00       	mov    $0x11,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <unlink>:
SYSCALL(unlink)
 6a3:	b8 12 00 00 00       	mov    $0x12,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <fstat>:
SYSCALL(fstat)
 6ab:	b8 08 00 00 00       	mov    $0x8,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <link>:
SYSCALL(link)
 6b3:	b8 13 00 00 00       	mov    $0x13,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <mkdir>:
SYSCALL(mkdir)
 6bb:	b8 14 00 00 00       	mov    $0x14,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <chdir>:
SYSCALL(chdir)
 6c3:	b8 09 00 00 00       	mov    $0x9,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <dup>:
SYSCALL(dup)
 6cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <getpid>:
SYSCALL(getpid)
 6d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <sbrk>:
SYSCALL(sbrk)
 6db:	b8 0c 00 00 00       	mov    $0xc,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <sleep>:
SYSCALL(sleep)
 6e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <uptime>:
SYSCALL(uptime)
 6eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <clone>:
SYSCALL(clone)
 6f3:	b8 16 00 00 00       	mov    $0x16,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <join>:
 6fb:	b8 17 00 00 00       	mov    $0x17,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 703:	55                   	push   %ebp
 704:	89 e5                	mov    %esp,%ebp
 706:	83 ec 1c             	sub    $0x1c,%esp
 709:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 70c:	6a 01                	push   $0x1
 70e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 711:	52                   	push   %edx
 712:	50                   	push   %eax
 713:	e8 5b ff ff ff       	call   673 <write>
}
 718:	83 c4 10             	add    $0x10,%esp
 71b:	c9                   	leave  
 71c:	c3                   	ret    

0000071d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 71d:	55                   	push   %ebp
 71e:	89 e5                	mov    %esp,%ebp
 720:	57                   	push   %edi
 721:	56                   	push   %esi
 722:	53                   	push   %ebx
 723:	83 ec 2c             	sub    $0x2c,%esp
 726:	89 45 d0             	mov    %eax,-0x30(%ebp)
 729:	89 d0                	mov    %edx,%eax
 72b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 72d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 731:	0f 95 c1             	setne  %cl
 734:	c1 ea 1f             	shr    $0x1f,%edx
 737:	84 d1                	test   %dl,%cl
 739:	74 44                	je     77f <printint+0x62>
    neg = 1;
    x = -xx;
 73b:	f7 d8                	neg    %eax
 73d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 73f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 746:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 74b:	89 c8                	mov    %ecx,%eax
 74d:	ba 00 00 00 00       	mov    $0x0,%edx
 752:	f7 f6                	div    %esi
 754:	89 df                	mov    %ebx,%edi
 756:	83 c3 01             	add    $0x1,%ebx
 759:	0f b6 92 7c 0b 00 00 	movzbl 0xb7c(%edx),%edx
 760:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 764:	89 ca                	mov    %ecx,%edx
 766:	89 c1                	mov    %eax,%ecx
 768:	39 d6                	cmp    %edx,%esi
 76a:	76 df                	jbe    74b <printint+0x2e>
  if(neg)
 76c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 770:	74 31                	je     7a3 <printint+0x86>
    buf[i++] = '-';
 772:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 777:	8d 5f 02             	lea    0x2(%edi),%ebx
 77a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 77d:	eb 17                	jmp    796 <printint+0x79>
    x = xx;
 77f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 781:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 788:	eb bc                	jmp    746 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 78a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 78f:	89 f0                	mov    %esi,%eax
 791:	e8 6d ff ff ff       	call   703 <putc>
  while(--i >= 0)
 796:	83 eb 01             	sub    $0x1,%ebx
 799:	79 ef                	jns    78a <printint+0x6d>
}
 79b:	83 c4 2c             	add    $0x2c,%esp
 79e:	5b                   	pop    %ebx
 79f:	5e                   	pop    %esi
 7a0:	5f                   	pop    %edi
 7a1:	5d                   	pop    %ebp
 7a2:	c3                   	ret    
 7a3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7a6:	eb ee                	jmp    796 <printint+0x79>

000007a8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7a8:	55                   	push   %ebp
 7a9:	89 e5                	mov    %esp,%ebp
 7ab:	57                   	push   %edi
 7ac:	56                   	push   %esi
 7ad:	53                   	push   %ebx
 7ae:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7b1:	8d 45 10             	lea    0x10(%ebp),%eax
 7b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7b7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7bc:	bb 00 00 00 00       	mov    $0x0,%ebx
 7c1:	eb 14                	jmp    7d7 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7c3:	89 fa                	mov    %edi,%edx
 7c5:	8b 45 08             	mov    0x8(%ebp),%eax
 7c8:	e8 36 ff ff ff       	call   703 <putc>
 7cd:	eb 05                	jmp    7d4 <printf+0x2c>
      }
    } else if(state == '%'){
 7cf:	83 fe 25             	cmp    $0x25,%esi
 7d2:	74 25                	je     7f9 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7d4:	83 c3 01             	add    $0x1,%ebx
 7d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 7da:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7de:	84 c0                	test   %al,%al
 7e0:	0f 84 20 01 00 00    	je     906 <printf+0x15e>
    c = fmt[i] & 0xff;
 7e6:	0f be f8             	movsbl %al,%edi
 7e9:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7ec:	85 f6                	test   %esi,%esi
 7ee:	75 df                	jne    7cf <printf+0x27>
      if(c == '%'){
 7f0:	83 f8 25             	cmp    $0x25,%eax
 7f3:	75 ce                	jne    7c3 <printf+0x1b>
        state = '%';
 7f5:	89 c6                	mov    %eax,%esi
 7f7:	eb db                	jmp    7d4 <printf+0x2c>
      if(c == 'd'){
 7f9:	83 f8 25             	cmp    $0x25,%eax
 7fc:	0f 84 cf 00 00 00    	je     8d1 <printf+0x129>
 802:	0f 8c dd 00 00 00    	jl     8e5 <printf+0x13d>
 808:	83 f8 78             	cmp    $0x78,%eax
 80b:	0f 8f d4 00 00 00    	jg     8e5 <printf+0x13d>
 811:	83 f8 63             	cmp    $0x63,%eax
 814:	0f 8c cb 00 00 00    	jl     8e5 <printf+0x13d>
 81a:	83 e8 63             	sub    $0x63,%eax
 81d:	83 f8 15             	cmp    $0x15,%eax
 820:	0f 87 bf 00 00 00    	ja     8e5 <printf+0x13d>
 826:	ff 24 85 24 0b 00 00 	jmp    *0xb24(,%eax,4)
        printint(fd, *ap, 10, 1);
 82d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 830:	8b 17                	mov    (%edi),%edx
 832:	83 ec 0c             	sub    $0xc,%esp
 835:	6a 01                	push   $0x1
 837:	b9 0a 00 00 00       	mov    $0xa,%ecx
 83c:	8b 45 08             	mov    0x8(%ebp),%eax
 83f:	e8 d9 fe ff ff       	call   71d <printint>
        ap++;
 844:	83 c7 04             	add    $0x4,%edi
 847:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 84a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 84d:	be 00 00 00 00       	mov    $0x0,%esi
 852:	eb 80                	jmp    7d4 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 854:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 857:	8b 17                	mov    (%edi),%edx
 859:	83 ec 0c             	sub    $0xc,%esp
 85c:	6a 00                	push   $0x0
 85e:	b9 10 00 00 00       	mov    $0x10,%ecx
 863:	8b 45 08             	mov    0x8(%ebp),%eax
 866:	e8 b2 fe ff ff       	call   71d <printint>
        ap++;
 86b:	83 c7 04             	add    $0x4,%edi
 86e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 871:	83 c4 10             	add    $0x10,%esp
      state = 0;
 874:	be 00 00 00 00       	mov    $0x0,%esi
 879:	e9 56 ff ff ff       	jmp    7d4 <printf+0x2c>
        s = (char*)*ap;
 87e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 881:	8b 30                	mov    (%eax),%esi
        ap++;
 883:	83 c0 04             	add    $0x4,%eax
 886:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 889:	85 f6                	test   %esi,%esi
 88b:	75 15                	jne    8a2 <printf+0xfa>
          s = "(null)";
 88d:	be 1c 0b 00 00       	mov    $0xb1c,%esi
 892:	eb 0e                	jmp    8a2 <printf+0xfa>
          putc(fd, *s);
 894:	0f be d2             	movsbl %dl,%edx
 897:	8b 45 08             	mov    0x8(%ebp),%eax
 89a:	e8 64 fe ff ff       	call   703 <putc>
          s++;
 89f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8a2:	0f b6 16             	movzbl (%esi),%edx
 8a5:	84 d2                	test   %dl,%dl
 8a7:	75 eb                	jne    894 <printf+0xec>
      state = 0;
 8a9:	be 00 00 00 00       	mov    $0x0,%esi
 8ae:	e9 21 ff ff ff       	jmp    7d4 <printf+0x2c>
        putc(fd, *ap);
 8b3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8b6:	0f be 17             	movsbl (%edi),%edx
 8b9:	8b 45 08             	mov    0x8(%ebp),%eax
 8bc:	e8 42 fe ff ff       	call   703 <putc>
        ap++;
 8c1:	83 c7 04             	add    $0x4,%edi
 8c4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8c7:	be 00 00 00 00       	mov    $0x0,%esi
 8cc:	e9 03 ff ff ff       	jmp    7d4 <printf+0x2c>
        putc(fd, c);
 8d1:	89 fa                	mov    %edi,%edx
 8d3:	8b 45 08             	mov    0x8(%ebp),%eax
 8d6:	e8 28 fe ff ff       	call   703 <putc>
      state = 0;
 8db:	be 00 00 00 00       	mov    $0x0,%esi
 8e0:	e9 ef fe ff ff       	jmp    7d4 <printf+0x2c>
        putc(fd, '%');
 8e5:	ba 25 00 00 00       	mov    $0x25,%edx
 8ea:	8b 45 08             	mov    0x8(%ebp),%eax
 8ed:	e8 11 fe ff ff       	call   703 <putc>
        putc(fd, c);
 8f2:	89 fa                	mov    %edi,%edx
 8f4:	8b 45 08             	mov    0x8(%ebp),%eax
 8f7:	e8 07 fe ff ff       	call   703 <putc>
      state = 0;
 8fc:	be 00 00 00 00       	mov    $0x0,%esi
 901:	e9 ce fe ff ff       	jmp    7d4 <printf+0x2c>
    }
  }
}
 906:	8d 65 f4             	lea    -0xc(%ebp),%esp
 909:	5b                   	pop    %ebx
 90a:	5e                   	pop    %esi
 90b:	5f                   	pop    %edi
 90c:	5d                   	pop    %ebp
 90d:	c3                   	ret    

0000090e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 90e:	55                   	push   %ebp
 90f:	89 e5                	mov    %esp,%ebp
 911:	57                   	push   %edi
 912:	56                   	push   %esi
 913:	53                   	push   %ebx
 914:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 917:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 91a:	a1 1c 0f 00 00       	mov    0xf1c,%eax
 91f:	eb 02                	jmp    923 <free+0x15>
 921:	89 d0                	mov    %edx,%eax
 923:	39 c8                	cmp    %ecx,%eax
 925:	73 04                	jae    92b <free+0x1d>
 927:	39 08                	cmp    %ecx,(%eax)
 929:	77 12                	ja     93d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 92b:	8b 10                	mov    (%eax),%edx
 92d:	39 c2                	cmp    %eax,%edx
 92f:	77 f0                	ja     921 <free+0x13>
 931:	39 c8                	cmp    %ecx,%eax
 933:	72 08                	jb     93d <free+0x2f>
 935:	39 ca                	cmp    %ecx,%edx
 937:	77 04                	ja     93d <free+0x2f>
 939:	89 d0                	mov    %edx,%eax
 93b:	eb e6                	jmp    923 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 93d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 940:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 943:	8b 10                	mov    (%eax),%edx
 945:	39 d7                	cmp    %edx,%edi
 947:	74 19                	je     962 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 949:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 94c:	8b 50 04             	mov    0x4(%eax),%edx
 94f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 952:	39 ce                	cmp    %ecx,%esi
 954:	74 1b                	je     971 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 956:	89 08                	mov    %ecx,(%eax)
  freep = p;
 958:	a3 1c 0f 00 00       	mov    %eax,0xf1c
}
 95d:	5b                   	pop    %ebx
 95e:	5e                   	pop    %esi
 95f:	5f                   	pop    %edi
 960:	5d                   	pop    %ebp
 961:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 962:	03 72 04             	add    0x4(%edx),%esi
 965:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 968:	8b 10                	mov    (%eax),%edx
 96a:	8b 12                	mov    (%edx),%edx
 96c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 96f:	eb db                	jmp    94c <free+0x3e>
    p->s.size += bp->s.size;
 971:	03 53 fc             	add    -0x4(%ebx),%edx
 974:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 977:	8b 53 f8             	mov    -0x8(%ebx),%edx
 97a:	89 10                	mov    %edx,(%eax)
 97c:	eb da                	jmp    958 <free+0x4a>

0000097e <morecore>:

static Header*
morecore(uint nu)
{
 97e:	55                   	push   %ebp
 97f:	89 e5                	mov    %esp,%ebp
 981:	53                   	push   %ebx
 982:	83 ec 04             	sub    $0x4,%esp
 985:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 987:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 98c:	77 05                	ja     993 <morecore+0x15>
    nu = 4096;
 98e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 993:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 99a:	83 ec 0c             	sub    $0xc,%esp
 99d:	50                   	push   %eax
 99e:	e8 38 fd ff ff       	call   6db <sbrk>
  if(p == (char*)-1)
 9a3:	83 c4 10             	add    $0x10,%esp
 9a6:	83 f8 ff             	cmp    $0xffffffff,%eax
 9a9:	74 1c                	je     9c7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9ab:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9ae:	83 c0 08             	add    $0x8,%eax
 9b1:	83 ec 0c             	sub    $0xc,%esp
 9b4:	50                   	push   %eax
 9b5:	e8 54 ff ff ff       	call   90e <free>
  return freep;
 9ba:	a1 1c 0f 00 00       	mov    0xf1c,%eax
 9bf:	83 c4 10             	add    $0x10,%esp
}
 9c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9c5:	c9                   	leave  
 9c6:	c3                   	ret    
    return 0;
 9c7:	b8 00 00 00 00       	mov    $0x0,%eax
 9cc:	eb f4                	jmp    9c2 <morecore+0x44>

000009ce <malloc>:

void*
malloc(uint nbytes)
{
 9ce:	55                   	push   %ebp
 9cf:	89 e5                	mov    %esp,%ebp
 9d1:	53                   	push   %ebx
 9d2:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d5:	8b 45 08             	mov    0x8(%ebp),%eax
 9d8:	8d 58 07             	lea    0x7(%eax),%ebx
 9db:	c1 eb 03             	shr    $0x3,%ebx
 9de:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9e1:	8b 0d 1c 0f 00 00    	mov    0xf1c,%ecx
 9e7:	85 c9                	test   %ecx,%ecx
 9e9:	74 04                	je     9ef <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9eb:	8b 01                	mov    (%ecx),%eax
 9ed:	eb 4a                	jmp    a39 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9ef:	c7 05 1c 0f 00 00 20 	movl   $0xf20,0xf1c
 9f6:	0f 00 00 
 9f9:	c7 05 20 0f 00 00 20 	movl   $0xf20,0xf20
 a00:	0f 00 00 
    base.s.size = 0;
 a03:	c7 05 24 0f 00 00 00 	movl   $0x0,0xf24
 a0a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a0d:	b9 20 0f 00 00       	mov    $0xf20,%ecx
 a12:	eb d7                	jmp    9eb <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a14:	74 19                	je     a2f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a16:	29 da                	sub    %ebx,%edx
 a18:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a1b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a1e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a21:	89 0d 1c 0f 00 00    	mov    %ecx,0xf1c
      return (void*)(p + 1);
 a27:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a2d:	c9                   	leave  
 a2e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a2f:	8b 10                	mov    (%eax),%edx
 a31:	89 11                	mov    %edx,(%ecx)
 a33:	eb ec                	jmp    a21 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a35:	89 c1                	mov    %eax,%ecx
 a37:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a39:	8b 50 04             	mov    0x4(%eax),%edx
 a3c:	39 da                	cmp    %ebx,%edx
 a3e:	73 d4                	jae    a14 <malloc+0x46>
    if(p == freep)
 a40:	39 05 1c 0f 00 00    	cmp    %eax,0xf1c
 a46:	75 ed                	jne    a35 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a48:	89 d8                	mov    %ebx,%eax
 a4a:	e8 2f ff ff ff       	call   97e <morecore>
 a4f:	85 c0                	test   %eax,%eax
 a51:	75 e2                	jne    a35 <malloc+0x67>
 a53:	eb d5                	jmp    a2a <malloc+0x5c>
