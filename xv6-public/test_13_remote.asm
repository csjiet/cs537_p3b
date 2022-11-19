
_test_13_remote:     file format elf32-i386


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
  57:	83 3d 18 0f 00 00 01 	cmpl   $0x1,0xf18
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 58 0a 00 00       	push   $0xa58
  6b:	68 69 0a 00 00       	push   $0xa69
  70:	6a 01                	push   $0x1
  72:	e8 34 07 00 00       	call   7ab <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 a8 0a 00 00       	push   $0xaa8
  7f:	68 7c 0a 00 00       	push   $0xa7c
  84:	6a 01                	push   $0x1
  86:	e8 20 07 00 00       	call   7ab <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 90 0a 00 00       	push   $0xa90
  93:	6a 01                	push   $0x1
  95:	e8 11 07 00 00       	call   7ab <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 1c 0f 00 00    	push   0xf1c
  a3:	e8 de 05 00 00       	call   686 <kill>
  a8:	e8 a9 05 00 00       	call   656 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 58 0a 00 00       	push   $0xa58
  b4:	68 69 0a 00 00       	push   $0xa69
  b9:	6a 01                	push   $0x1
  bb:	e8 eb 06 00 00       	call   7ab <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 71 0a 00 00       	push   $0xa71
  c8:	68 7c 0a 00 00       	push   $0xa7c
  cd:	6a 01                	push   $0x1
  cf:	e8 d7 06 00 00       	call   7ab <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 90 0a 00 00       	push   $0xa90
  dc:	6a 01                	push   $0x1
  de:	e8 c8 06 00 00       	call   7ab <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 1c 0f 00 00    	push   0xf1c
  ec:	e8 95 05 00 00       	call   686 <kill>
  f1:	e8 60 05 00 00       	call   656 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 58 0a 00 00       	push   $0xa58
  fd:	68 69 0a 00 00       	push   $0xa69
 102:	6a 01                	push   $0x1
 104:	e8 a2 06 00 00       	call   7ab <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 9d 0a 00 00       	push   $0xa9d
 111:	68 7c 0a 00 00       	push   $0xa7c
 116:	6a 01                	push   $0x1
 118:	e8 8e 06 00 00       	call   7ab <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 90 0a 00 00       	push   $0xa90
 125:	6a 01                	push   $0x1
 127:	e8 7f 06 00 00       	call   7ab <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 1c 0f 00 00    	push   0xf1c
 135:	e8 4c 05 00 00       	call   686 <kill>
 13a:	e8 17 05 00 00       	call   656 <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 58 0a 00 00       	push   $0xa58
 158:	68 69 0a 00 00       	push   $0xa69
 15d:	6a 01                	push   $0x1
 15f:	e8 47 06 00 00       	call   7ab <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 b4 0a 00 00       	push   $0xab4
 16c:	68 7c 0a 00 00       	push   $0xa7c
 171:	6a 01                	push   $0x1
 173:	e8 33 06 00 00       	call   7ab <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 90 0a 00 00       	push   $0xa90
 180:	6a 01                	push   $0x1
 182:	e8 24 06 00 00       	call   7ab <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 1c 0f 00 00    	push   0xf1c
 190:	e8 f1 04 00 00       	call   686 <kill>
 195:	e8 bc 04 00 00       	call   656 <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 58 0a 00 00       	push   $0xa58
 1b3:	68 69 0a 00 00       	push   $0xa69
 1b8:	6a 01                	push   $0x1
 1ba:	e8 ec 05 00 00       	call   7ab <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 c0 0a 00 00       	push   $0xac0
 1c7:	68 7c 0a 00 00       	push   $0xa7c
 1cc:	6a 01                	push   $0x1
 1ce:	e8 d8 05 00 00       	call   7ab <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 90 0a 00 00       	push   $0xa90
 1db:	6a 01                	push   $0x1
 1dd:	e8 c9 05 00 00       	call   7ab <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 1c 0f 00 00    	push   0xf1c
 1eb:	e8 96 04 00 00       	call   686 <kill>
 1f0:	e8 61 04 00 00       	call   656 <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 58 0a 00 00       	push   $0xa58
 20e:	68 69 0a 00 00       	push   $0xa69
 213:	6a 01                	push   $0x1
 215:	e8 91 05 00 00       	call   7ab <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 cc 0a 00 00       	push   $0xacc
 222:	68 7c 0a 00 00       	push   $0xa7c
 227:	6a 01                	push   $0x1
 229:	e8 7d 05 00 00       	call   7ab <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 90 0a 00 00       	push   $0xa90
 236:	6a 01                	push   $0x1
 238:	e8 6e 05 00 00       	call   7ab <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 1c 0f 00 00    	push   0xf1c
 246:	e8 3b 04 00 00       	call   686 <kill>
 24b:	e8 06 04 00 00       	call   656 <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 58 0a 00 00       	push   $0xa58
 26b:	68 69 0a 00 00       	push   $0xa69
 270:	6a 01                	push   $0x1
 272:	e8 34 05 00 00       	call   7ab <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 d9 0a 00 00       	push   $0xad9
 27f:	68 7c 0a 00 00       	push   $0xa7c
 284:	6a 01                	push   $0x1
 286:	e8 20 05 00 00       	call   7ab <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 90 0a 00 00       	push   $0xa90
 293:	6a 01                	push   $0x1
 295:	e8 11 05 00 00       	call   7ab <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 1c 0f 00 00    	push   0xf1c
 2a3:	e8 de 03 00 00       	call   686 <kill>
 2a8:	e8 a9 03 00 00       	call   656 <exit>
   exit();
 2ad:	e8 a4 03 00 00       	call   656 <exit>

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
 2c4:	e8 0d 04 00 00       	call   6d6 <getpid>
 2c9:	a3 1c 0f 00 00       	mov    %eax,0xf1c
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
 2f5:	39 1d 14 0f 00 00    	cmp    %ebx,0xf14
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
 329:	68 69 0a 00 00       	push   $0xa69
 32e:	6a 01                	push   $0x1
 330:	e8 76 04 00 00       	call   7ab <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 e8 0a 00 00       	push   $0xae8
 33d:	68 7c 0a 00 00       	push   $0xa7c
 342:	6a 01                	push   $0x1
 344:	e8 62 04 00 00       	call   7ab <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 90 0a 00 00       	push   $0xa90
 351:	6a 01                	push   $0x1
 353:	e8 53 04 00 00       	call   7ab <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 1c 0f 00 00    	push   0xf1c
 361:	e8 20 03 00 00       	call   686 <kill>
 366:	e8 eb 02 00 00       	call   656 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 58 0a 00 00       	push   $0xa58
 372:	68 69 0a 00 00       	push   $0xa69
 377:	6a 01                	push   $0x1
 379:	e8 2d 04 00 00       	call   7ab <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 fa 0a 00 00       	push   $0xafa
 386:	68 7c 0a 00 00       	push   $0xa7c
 38b:	6a 01                	push   $0x1
 38d:	e8 19 04 00 00       	call   7ab <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 90 0a 00 00       	push   $0xa90
 39a:	6a 01                	push   $0x1
 39c:	e8 0a 04 00 00       	call   7ab <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 1c 0f 00 00    	push   0xf1c
 3aa:	e8 d7 02 00 00       	call   686 <kill>
 3af:	e8 a2 02 00 00       	call   656 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 14 0f 00 00    	cmp    %ebx,0xf14
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 32 02 00 00       	call   5f8 <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 58 0a 00 00       	push   $0xa58
 3d6:	68 69 0a 00 00       	push   $0xa69
 3db:	6a 01                	push   $0x1
 3dd:	e8 c9 03 00 00       	call   7ab <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 09 0b 00 00       	push   $0xb09
 3ea:	68 7c 0a 00 00       	push   $0xa7c
 3ef:	6a 01                	push   $0x1
 3f1:	e8 b5 03 00 00       	call   7ab <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 90 0a 00 00       	push   $0xa90
 3fe:	6a 01                	push   $0x1
 400:	e8 a6 03 00 00       	call   7ab <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 1c 0f 00 00    	push   0xf1c
 40e:	e8 73 02 00 00       	call   686 <kill>
 413:	e8 3e 02 00 00       	call   656 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 16 0b 00 00       	push   $0xb16
 420:	6a 01                	push   $0x1
 422:	e8 84 03 00 00       	call   7ab <printf>
   exit();
 427:	e8 2a 02 00 00       	call   656 <exit>

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
 4f2:	e8 77 01 00 00       	call   66e <read>
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
 530:	e8 61 01 00 00       	call   696 <open>
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
 545:	e8 64 01 00 00       	call   6ae <fstat>
 54a:	89 c6                	mov    %eax,%esi
  close(fd);
 54c:	89 1c 24             	mov    %ebx,(%esp)
 54f:	e8 2a 01 00 00       	call   67e <close>
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

  void* stack = malloc(2 * PGSIZE);
 5c9:	68 00 20 00 00       	push   $0x2000
 5ce:	e8 fe 03 00 00       	call   9d1 <malloc>
  if ((uint)stack%PGSIZE){
 5d3:	83 c4 10             	add    $0x10,%esp
 5d6:	a9 ff 0f 00 00       	test   $0xfff,%eax
 5db:	74 0a                	je     5e7 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 5dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 5e2:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 5e7:	50                   	push   %eax
 5e8:	ff 75 10             	push   0x10(%ebp)
 5eb:	ff 75 0c             	push   0xc(%ebp)
 5ee:	ff 75 08             	push   0x8(%ebp)
 5f1:	e8 00 01 00 00       	call   6f6 <clone>
}
 5f6:	c9                   	leave  
 5f7:	c3                   	ret    

000005f8 <thread_join>:

int thread_join(){
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	53                   	push   %ebx
 5fc:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 5ff:	8d 45 f4             	lea    -0xc(%ebp),%eax
 602:	50                   	push   %eax
 603:	e8 f6 00 00 00       	call   6fe <join>
 608:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 60a:	83 c4 04             	add    $0x4,%esp
 60d:	ff 75 f4             	push   -0xc(%ebp)
 610:	e8 fc 02 00 00       	call   911 <free>
  return x;
}
 615:	89 d8                	mov    %ebx,%eax
 617:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 61a:	c9                   	leave  
 61b:	c3                   	ret    

0000061c <lock_init>:

void lock_init(lock_t *spin){
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 628:	5d                   	pop    %ebp
 629:	c3                   	ret    

0000062a <lock_acquire>:

void lock_acquire(lock_t *spin){
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 630:	b8 01 00 00 00       	mov    $0x1,%eax
 635:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 638:	85 c0                	test   %eax,%eax
 63a:	75 f4                	jne    630 <lock_acquire+0x6>

}
 63c:	5d                   	pop    %ebp
 63d:	c3                   	ret    

0000063e <lock_release>:

void lock_release(lock_t *spin){
 63e:	55                   	push   %ebp
 63f:	89 e5                	mov    %esp,%ebp
 641:	8b 55 08             	mov    0x8(%ebp),%edx
 644:	b8 00 00 00 00       	mov    $0x0,%eax
 649:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 64c:	5d                   	pop    %ebp
 64d:	c3                   	ret    

0000064e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 64e:	b8 01 00 00 00       	mov    $0x1,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <exit>:
SYSCALL(exit)
 656:	b8 02 00 00 00       	mov    $0x2,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <wait>:
SYSCALL(wait)
 65e:	b8 03 00 00 00       	mov    $0x3,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <pipe>:
SYSCALL(pipe)
 666:	b8 04 00 00 00       	mov    $0x4,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <read>:
SYSCALL(read)
 66e:	b8 05 00 00 00       	mov    $0x5,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <write>:
SYSCALL(write)
 676:	b8 10 00 00 00       	mov    $0x10,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <close>:
SYSCALL(close)
 67e:	b8 15 00 00 00       	mov    $0x15,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <kill>:
SYSCALL(kill)
 686:	b8 06 00 00 00       	mov    $0x6,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <exec>:
SYSCALL(exec)
 68e:	b8 07 00 00 00       	mov    $0x7,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <open>:
SYSCALL(open)
 696:	b8 0f 00 00 00       	mov    $0xf,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret    

0000069e <mknod>:
SYSCALL(mknod)
 69e:	b8 11 00 00 00       	mov    $0x11,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <unlink>:
SYSCALL(unlink)
 6a6:	b8 12 00 00 00       	mov    $0x12,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <fstat>:
SYSCALL(fstat)
 6ae:	b8 08 00 00 00       	mov    $0x8,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <link>:
SYSCALL(link)
 6b6:	b8 13 00 00 00       	mov    $0x13,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <mkdir>:
SYSCALL(mkdir)
 6be:	b8 14 00 00 00       	mov    $0x14,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret    

000006c6 <chdir>:
SYSCALL(chdir)
 6c6:	b8 09 00 00 00       	mov    $0x9,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret    

000006ce <dup>:
SYSCALL(dup)
 6ce:	b8 0a 00 00 00       	mov    $0xa,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <getpid>:
SYSCALL(getpid)
 6d6:	b8 0b 00 00 00       	mov    $0xb,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <sbrk>:
SYSCALL(sbrk)
 6de:	b8 0c 00 00 00       	mov    $0xc,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <sleep>:
SYSCALL(sleep)
 6e6:	b8 0d 00 00 00       	mov    $0xd,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <uptime>:
SYSCALL(uptime)
 6ee:	b8 0e 00 00 00       	mov    $0xe,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <clone>:
SYSCALL(clone)
 6f6:	b8 16 00 00 00       	mov    $0x16,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <join>:
 6fe:	b8 17 00 00 00       	mov    $0x17,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 706:	55                   	push   %ebp
 707:	89 e5                	mov    %esp,%ebp
 709:	83 ec 1c             	sub    $0x1c,%esp
 70c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 70f:	6a 01                	push   $0x1
 711:	8d 55 f4             	lea    -0xc(%ebp),%edx
 714:	52                   	push   %edx
 715:	50                   	push   %eax
 716:	e8 5b ff ff ff       	call   676 <write>
}
 71b:	83 c4 10             	add    $0x10,%esp
 71e:	c9                   	leave  
 71f:	c3                   	ret    

00000720 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 2c             	sub    $0x2c,%esp
 729:	89 45 d0             	mov    %eax,-0x30(%ebp)
 72c:	89 d0                	mov    %edx,%eax
 72e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 730:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 734:	0f 95 c1             	setne  %cl
 737:	c1 ea 1f             	shr    $0x1f,%edx
 73a:	84 d1                	test   %dl,%cl
 73c:	74 44                	je     782 <printint+0x62>
    neg = 1;
    x = -xx;
 73e:	f7 d8                	neg    %eax
 740:	89 c1                	mov    %eax,%ecx
    neg = 1;
 742:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 749:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 74e:	89 c8                	mov    %ecx,%eax
 750:	ba 00 00 00 00       	mov    $0x0,%edx
 755:	f7 f6                	div    %esi
 757:	89 df                	mov    %ebx,%edi
 759:	83 c3 01             	add    $0x1,%ebx
 75c:	0f b6 92 84 0b 00 00 	movzbl 0xb84(%edx),%edx
 763:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 767:	89 ca                	mov    %ecx,%edx
 769:	89 c1                	mov    %eax,%ecx
 76b:	39 d6                	cmp    %edx,%esi
 76d:	76 df                	jbe    74e <printint+0x2e>
  if(neg)
 76f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 773:	74 31                	je     7a6 <printint+0x86>
    buf[i++] = '-';
 775:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 77a:	8d 5f 02             	lea    0x2(%edi),%ebx
 77d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 780:	eb 17                	jmp    799 <printint+0x79>
    x = xx;
 782:	89 c1                	mov    %eax,%ecx
  neg = 0;
 784:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 78b:	eb bc                	jmp    749 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 78d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 792:	89 f0                	mov    %esi,%eax
 794:	e8 6d ff ff ff       	call   706 <putc>
  while(--i >= 0)
 799:	83 eb 01             	sub    $0x1,%ebx
 79c:	79 ef                	jns    78d <printint+0x6d>
}
 79e:	83 c4 2c             	add    $0x2c,%esp
 7a1:	5b                   	pop    %ebx
 7a2:	5e                   	pop    %esi
 7a3:	5f                   	pop    %edi
 7a4:	5d                   	pop    %ebp
 7a5:	c3                   	ret    
 7a6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7a9:	eb ee                	jmp    799 <printint+0x79>

000007ab <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7ab:	55                   	push   %ebp
 7ac:	89 e5                	mov    %esp,%ebp
 7ae:	57                   	push   %edi
 7af:	56                   	push   %esi
 7b0:	53                   	push   %ebx
 7b1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7b4:	8d 45 10             	lea    0x10(%ebp),%eax
 7b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7ba:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7bf:	bb 00 00 00 00       	mov    $0x0,%ebx
 7c4:	eb 14                	jmp    7da <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7c6:	89 fa                	mov    %edi,%edx
 7c8:	8b 45 08             	mov    0x8(%ebp),%eax
 7cb:	e8 36 ff ff ff       	call   706 <putc>
 7d0:	eb 05                	jmp    7d7 <printf+0x2c>
      }
    } else if(state == '%'){
 7d2:	83 fe 25             	cmp    $0x25,%esi
 7d5:	74 25                	je     7fc <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7d7:	83 c3 01             	add    $0x1,%ebx
 7da:	8b 45 0c             	mov    0xc(%ebp),%eax
 7dd:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7e1:	84 c0                	test   %al,%al
 7e3:	0f 84 20 01 00 00    	je     909 <printf+0x15e>
    c = fmt[i] & 0xff;
 7e9:	0f be f8             	movsbl %al,%edi
 7ec:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7ef:	85 f6                	test   %esi,%esi
 7f1:	75 df                	jne    7d2 <printf+0x27>
      if(c == '%'){
 7f3:	83 f8 25             	cmp    $0x25,%eax
 7f6:	75 ce                	jne    7c6 <printf+0x1b>
        state = '%';
 7f8:	89 c6                	mov    %eax,%esi
 7fa:	eb db                	jmp    7d7 <printf+0x2c>
      if(c == 'd'){
 7fc:	83 f8 25             	cmp    $0x25,%eax
 7ff:	0f 84 cf 00 00 00    	je     8d4 <printf+0x129>
 805:	0f 8c dd 00 00 00    	jl     8e8 <printf+0x13d>
 80b:	83 f8 78             	cmp    $0x78,%eax
 80e:	0f 8f d4 00 00 00    	jg     8e8 <printf+0x13d>
 814:	83 f8 63             	cmp    $0x63,%eax
 817:	0f 8c cb 00 00 00    	jl     8e8 <printf+0x13d>
 81d:	83 e8 63             	sub    $0x63,%eax
 820:	83 f8 15             	cmp    $0x15,%eax
 823:	0f 87 bf 00 00 00    	ja     8e8 <printf+0x13d>
 829:	ff 24 85 2c 0b 00 00 	jmp    *0xb2c(,%eax,4)
        printint(fd, *ap, 10, 1);
 830:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 833:	8b 17                	mov    (%edi),%edx
 835:	83 ec 0c             	sub    $0xc,%esp
 838:	6a 01                	push   $0x1
 83a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 83f:	8b 45 08             	mov    0x8(%ebp),%eax
 842:	e8 d9 fe ff ff       	call   720 <printint>
        ap++;
 847:	83 c7 04             	add    $0x4,%edi
 84a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 84d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 850:	be 00 00 00 00       	mov    $0x0,%esi
 855:	eb 80                	jmp    7d7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 857:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 85a:	8b 17                	mov    (%edi),%edx
 85c:	83 ec 0c             	sub    $0xc,%esp
 85f:	6a 00                	push   $0x0
 861:	b9 10 00 00 00       	mov    $0x10,%ecx
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	e8 b2 fe ff ff       	call   720 <printint>
        ap++;
 86e:	83 c7 04             	add    $0x4,%edi
 871:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 874:	83 c4 10             	add    $0x10,%esp
      state = 0;
 877:	be 00 00 00 00       	mov    $0x0,%esi
 87c:	e9 56 ff ff ff       	jmp    7d7 <printf+0x2c>
        s = (char*)*ap;
 881:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 884:	8b 30                	mov    (%eax),%esi
        ap++;
 886:	83 c0 04             	add    $0x4,%eax
 889:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 88c:	85 f6                	test   %esi,%esi
 88e:	75 15                	jne    8a5 <printf+0xfa>
          s = "(null)";
 890:	be 23 0b 00 00       	mov    $0xb23,%esi
 895:	eb 0e                	jmp    8a5 <printf+0xfa>
          putc(fd, *s);
 897:	0f be d2             	movsbl %dl,%edx
 89a:	8b 45 08             	mov    0x8(%ebp),%eax
 89d:	e8 64 fe ff ff       	call   706 <putc>
          s++;
 8a2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8a5:	0f b6 16             	movzbl (%esi),%edx
 8a8:	84 d2                	test   %dl,%dl
 8aa:	75 eb                	jne    897 <printf+0xec>
      state = 0;
 8ac:	be 00 00 00 00       	mov    $0x0,%esi
 8b1:	e9 21 ff ff ff       	jmp    7d7 <printf+0x2c>
        putc(fd, *ap);
 8b6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8b9:	0f be 17             	movsbl (%edi),%edx
 8bc:	8b 45 08             	mov    0x8(%ebp),%eax
 8bf:	e8 42 fe ff ff       	call   706 <putc>
        ap++;
 8c4:	83 c7 04             	add    $0x4,%edi
 8c7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8ca:	be 00 00 00 00       	mov    $0x0,%esi
 8cf:	e9 03 ff ff ff       	jmp    7d7 <printf+0x2c>
        putc(fd, c);
 8d4:	89 fa                	mov    %edi,%edx
 8d6:	8b 45 08             	mov    0x8(%ebp),%eax
 8d9:	e8 28 fe ff ff       	call   706 <putc>
      state = 0;
 8de:	be 00 00 00 00       	mov    $0x0,%esi
 8e3:	e9 ef fe ff ff       	jmp    7d7 <printf+0x2c>
        putc(fd, '%');
 8e8:	ba 25 00 00 00       	mov    $0x25,%edx
 8ed:	8b 45 08             	mov    0x8(%ebp),%eax
 8f0:	e8 11 fe ff ff       	call   706 <putc>
        putc(fd, c);
 8f5:	89 fa                	mov    %edi,%edx
 8f7:	8b 45 08             	mov    0x8(%ebp),%eax
 8fa:	e8 07 fe ff ff       	call   706 <putc>
      state = 0;
 8ff:	be 00 00 00 00       	mov    $0x0,%esi
 904:	e9 ce fe ff ff       	jmp    7d7 <printf+0x2c>
    }
  }
}
 909:	8d 65 f4             	lea    -0xc(%ebp),%esp
 90c:	5b                   	pop    %ebx
 90d:	5e                   	pop    %esi
 90e:	5f                   	pop    %edi
 90f:	5d                   	pop    %ebp
 910:	c3                   	ret    

00000911 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 911:	55                   	push   %ebp
 912:	89 e5                	mov    %esp,%ebp
 914:	57                   	push   %edi
 915:	56                   	push   %esi
 916:	53                   	push   %ebx
 917:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 91a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 91d:	a1 20 0f 00 00       	mov    0xf20,%eax
 922:	eb 02                	jmp    926 <free+0x15>
 924:	89 d0                	mov    %edx,%eax
 926:	39 c8                	cmp    %ecx,%eax
 928:	73 04                	jae    92e <free+0x1d>
 92a:	39 08                	cmp    %ecx,(%eax)
 92c:	77 12                	ja     940 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 92e:	8b 10                	mov    (%eax),%edx
 930:	39 c2                	cmp    %eax,%edx
 932:	77 f0                	ja     924 <free+0x13>
 934:	39 c8                	cmp    %ecx,%eax
 936:	72 08                	jb     940 <free+0x2f>
 938:	39 ca                	cmp    %ecx,%edx
 93a:	77 04                	ja     940 <free+0x2f>
 93c:	89 d0                	mov    %edx,%eax
 93e:	eb e6                	jmp    926 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 940:	8b 73 fc             	mov    -0x4(%ebx),%esi
 943:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 946:	8b 10                	mov    (%eax),%edx
 948:	39 d7                	cmp    %edx,%edi
 94a:	74 19                	je     965 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 94c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 94f:	8b 50 04             	mov    0x4(%eax),%edx
 952:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 955:	39 ce                	cmp    %ecx,%esi
 957:	74 1b                	je     974 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 959:	89 08                	mov    %ecx,(%eax)
  freep = p;
 95b:	a3 20 0f 00 00       	mov    %eax,0xf20
}
 960:	5b                   	pop    %ebx
 961:	5e                   	pop    %esi
 962:	5f                   	pop    %edi
 963:	5d                   	pop    %ebp
 964:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 965:	03 72 04             	add    0x4(%edx),%esi
 968:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 96b:	8b 10                	mov    (%eax),%edx
 96d:	8b 12                	mov    (%edx),%edx
 96f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 972:	eb db                	jmp    94f <free+0x3e>
    p->s.size += bp->s.size;
 974:	03 53 fc             	add    -0x4(%ebx),%edx
 977:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 97a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 97d:	89 10                	mov    %edx,(%eax)
 97f:	eb da                	jmp    95b <free+0x4a>

00000981 <morecore>:

static Header*
morecore(uint nu)
{
 981:	55                   	push   %ebp
 982:	89 e5                	mov    %esp,%ebp
 984:	53                   	push   %ebx
 985:	83 ec 04             	sub    $0x4,%esp
 988:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 98a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 98f:	77 05                	ja     996 <morecore+0x15>
    nu = 4096;
 991:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 996:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 99d:	83 ec 0c             	sub    $0xc,%esp
 9a0:	50                   	push   %eax
 9a1:	e8 38 fd ff ff       	call   6de <sbrk>
  if(p == (char*)-1)
 9a6:	83 c4 10             	add    $0x10,%esp
 9a9:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ac:	74 1c                	je     9ca <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9ae:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9b1:	83 c0 08             	add    $0x8,%eax
 9b4:	83 ec 0c             	sub    $0xc,%esp
 9b7:	50                   	push   %eax
 9b8:	e8 54 ff ff ff       	call   911 <free>
  return freep;
 9bd:	a1 20 0f 00 00       	mov    0xf20,%eax
 9c2:	83 c4 10             	add    $0x10,%esp
}
 9c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9c8:	c9                   	leave  
 9c9:	c3                   	ret    
    return 0;
 9ca:	b8 00 00 00 00       	mov    $0x0,%eax
 9cf:	eb f4                	jmp    9c5 <morecore+0x44>

000009d1 <malloc>:

void*
malloc(uint nbytes)
{
 9d1:	55                   	push   %ebp
 9d2:	89 e5                	mov    %esp,%ebp
 9d4:	53                   	push   %ebx
 9d5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d8:	8b 45 08             	mov    0x8(%ebp),%eax
 9db:	8d 58 07             	lea    0x7(%eax),%ebx
 9de:	c1 eb 03             	shr    $0x3,%ebx
 9e1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9e4:	8b 0d 20 0f 00 00    	mov    0xf20,%ecx
 9ea:	85 c9                	test   %ecx,%ecx
 9ec:	74 04                	je     9f2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ee:	8b 01                	mov    (%ecx),%eax
 9f0:	eb 4a                	jmp    a3c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9f2:	c7 05 20 0f 00 00 24 	movl   $0xf24,0xf20
 9f9:	0f 00 00 
 9fc:	c7 05 24 0f 00 00 24 	movl   $0xf24,0xf24
 a03:	0f 00 00 
    base.s.size = 0;
 a06:	c7 05 28 0f 00 00 00 	movl   $0x0,0xf28
 a0d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a10:	b9 24 0f 00 00       	mov    $0xf24,%ecx
 a15:	eb d7                	jmp    9ee <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a17:	74 19                	je     a32 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a19:	29 da                	sub    %ebx,%edx
 a1b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a1e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a21:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a24:	89 0d 20 0f 00 00    	mov    %ecx,0xf20
      return (void*)(p + 1);
 a2a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a30:	c9                   	leave  
 a31:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a32:	8b 10                	mov    (%eax),%edx
 a34:	89 11                	mov    %edx,(%ecx)
 a36:	eb ec                	jmp    a24 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a38:	89 c1                	mov    %eax,%ecx
 a3a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a3c:	8b 50 04             	mov    0x4(%eax),%edx
 a3f:	39 da                	cmp    %ebx,%edx
 a41:	73 d4                	jae    a17 <malloc+0x46>
    if(p == freep)
 a43:	39 05 20 0f 00 00    	cmp    %eax,0xf20
 a49:	75 ed                	jne    a38 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a4b:	89 d8                	mov    %ebx,%eax
 a4d:	e8 2f ff ff ff       	call   981 <morecore>
 a52:	85 c0                	test   %eax,%eax
 a54:	75 e2                	jne    a38 <malloc+0x67>
 a56:	eb d5                	jmp    a2d <malloc+0x5c>
