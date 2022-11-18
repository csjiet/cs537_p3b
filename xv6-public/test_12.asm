
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 1c 0f 00 00       	push   $0xf1c
   b:	e8 59 06 00 00       	call   669 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 01 07 00 00       	call   71d <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 20 0f 00 00    	cmp    0xf20,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 98 0a 00 00       	push   $0xa98
  2e:	68 a2 0a 00 00       	push   $0xaa2
  33:	6a 01                	push   $0x1
  35:	e8 b0 07 00 00       	call   7ea <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 aa 0a 00 00       	push   $0xaaa
  42:	68 c8 0a 00 00       	push   $0xac8
  47:	6a 01                	push   $0x1
  49:	e8 9c 07 00 00       	call   7ea <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 dc 0a 00 00       	push   $0xadc
  56:	6a 01                	push   $0x1
  58:	e8 8d 07 00 00       	call   7ea <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 28 0f 00 00    	push   0xf28
  66:	e8 5a 06 00 00       	call   6c5 <kill>
  6b:	e8 25 06 00 00       	call   695 <exit>
   global++;
  70:	83 05 24 0f 00 00 01 	addl   $0x1,0xf24
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 1c 0f 00 00       	push   $0xf1c
  7f:	e8 f9 05 00 00       	call   67d <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
  8b:	e8 d9 05 00 00       	call   669 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 81 06 00 00       	call   71d <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 20 0f 00 00    	cmp    0xf20,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 98 0a 00 00       	push   $0xa98
  ae:	68 a2 0a 00 00       	push   $0xaa2
  b3:	6a 01                	push   $0x1
  b5:	e8 30 07 00 00       	call   7ea <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 aa 0a 00 00       	push   $0xaaa
  c2:	68 c8 0a 00 00       	push   $0xac8
  c7:	6a 01                	push   $0x1
  c9:	e8 1c 07 00 00       	call   7ea <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 dc 0a 00 00       	push   $0xadc
  d6:	6a 01                	push   $0x1
  d8:	e8 0d 07 00 00       	call   7ea <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 28 0f 00 00    	push   0xf28
  e6:	e8 da 05 00 00       	call   6c5 <kill>
  eb:	e8 a5 05 00 00       	call   695 <exit>
   global++;
  f0:	83 05 24 0f 00 00 01 	addl   $0x1,0xf24
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 19 06 00 00       	call   71d <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 0d 06 00 00       	call   71d <sbrk>
 110:	a3 20 0f 00 00       	mov    %eax,0xf20
   lock_release(&lock2);
 115:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
 11c:	e8 5c 05 00 00       	call   67d <lock_release>



   exit();
 121:	e8 6f 05 00 00       	call   695 <exit>

00000126 <main>:
{
 126:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 12a:	83 e4 f0             	and    $0xfffffff0,%esp
 12d:	ff 71 fc             	push   -0x4(%ecx)
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	51                   	push   %ecx
 135:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 138:	e8 d8 05 00 00       	call   715 <getpid>
 13d:	a3 28 0f 00 00       	mov    %eax,0xf28
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 1c 0f 00 00       	push   $0xf1c
 158:	e8 fe 04 00 00       	call   65b <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
 164:	e8 f2 04 00 00       	call   65b <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 1c 0f 00 00 	movl   $0xf1c,(%esp)
 170:	e8 f4 04 00 00       	call   669 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
 17c:	e8 e8 04 00 00       	call   669 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d 14 0f 00 00    	cmp    %ebx,0xf14
 194:	7e 65                	jle    1fb <main+0xd5>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 196:	83 ec 04             	sub    $0x4,%esp
 199:	8d 45 f0             	lea    -0x10(%ebp),%eax
 19c:	50                   	push   %eax
 19d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	68 00 00 00 00       	push   $0x0
 1a6:	e8 5a 04 00 00       	call   605 <thread_create>
      assert(thread_pid > 0);
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	85 c0                	test   %eax,%eax
 1b0:	7f d9                	jg     18b <main+0x65>
 1b2:	6a 28                	push   $0x28
 1b4:	68 98 0a 00 00       	push   $0xa98
 1b9:	68 a2 0a 00 00       	push   $0xaa2
 1be:	6a 01                	push   $0x1
 1c0:	e8 25 06 00 00       	call   7ea <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 e9 0a 00 00       	push   $0xae9
 1cd:	68 c8 0a 00 00       	push   $0xac8
 1d2:	6a 01                	push   $0x1
 1d4:	e8 11 06 00 00       	call   7ea <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 dc 0a 00 00       	push   $0xadc
 1e1:	6a 01                	push   $0x1
 1e3:	e8 02 06 00 00       	call   7ea <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 28 0f 00 00    	push   0xf28
 1f1:	e8 cf 04 00 00       	call   6c5 <kill>
 1f6:	e8 9a 04 00 00       	call   695 <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 18 05 00 00       	call   71d <sbrk>
 205:	a3 20 0f 00 00       	mov    %eax,0xf20
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 14 0f 00 00       	mov    0xf14,%eax
 212:	39 05 24 0f 00 00    	cmp    %eax,0xf24
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 1c 0f 00 00       	push   $0xf1c
 222:	e8 56 04 00 00       	call   67d <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 f2 04 00 00       	call   725 <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 1c 0f 00 00 	movl   $0xf1c,(%esp)
 23a:	e8 2a 04 00 00       	call   669 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 24 0f 00 00 00 	movl   $0x0,0xf24
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 c2 04 00 00       	call   71d <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 b6 04 00 00       	call   71d <sbrk>
 267:	a3 20 0f 00 00       	mov    %eax,0xf20
   lock_release(&lock);
 26c:	c7 04 24 1c 0f 00 00 	movl   $0xf1c,(%esp)
 273:	e8 05 04 00 00       	call   67d <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 14 0f 00 00       	mov    0xf14,%eax
 280:	39 05 24 0f 00 00    	cmp    %eax,0xf24
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 18 0f 00 00       	push   $0xf18
 290:	e8 e8 03 00 00       	call   67d <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 84 04 00 00       	call   725 <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
 2a8:	e8 bc 03 00 00       	call   669 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 18 0f 00 00       	push   $0xf18
 2ba:	e8 be 03 00 00       	call   67d <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 14 0f 00 00    	cmp    %ebx,0xf14
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 52 03 00 00       	call   626 <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 98 0a 00 00       	push   $0xa98
 2e4:	68 a2 0a 00 00       	push   $0xaa2
 2e9:	6a 01                	push   $0x1
 2eb:	e8 fa 04 00 00       	call   7ea <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 f8 0a 00 00       	push   $0xaf8
 2f8:	68 c8 0a 00 00       	push   $0xac8
 2fd:	6a 01                	push   $0x1
 2ff:	e8 e6 04 00 00       	call   7ea <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 dc 0a 00 00       	push   $0xadc
 30c:	6a 01                	push   $0x1
 30e:	e8 d7 04 00 00       	call   7ea <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 28 0f 00 00    	push   0xf28
 31c:	e8 a4 03 00 00       	call   6c5 <kill>
 321:	e8 6f 03 00 00       	call   695 <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 05 0b 00 00       	push   $0xb05
 32e:	6a 01                	push   $0x1
 330:	e8 b5 04 00 00       	call   7ea <printf>
   exit();
 335:	e8 5b 03 00 00       	call   695 <exit>

0000033a <worker2>:
{
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 340:	8b 45 0c             	mov    0xc(%ebp),%eax
 343:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	83 38 0b             	cmpl   $0xb,(%eax)
 34b:	75 52                	jne    39f <worker2+0x65>
   assert(arg2_int == 22);
 34d:	83 fa 16             	cmp    $0x16,%edx
 350:	0f 84 92 00 00 00    	je     3e8 <worker2+0xae>
 356:	6a 4d                	push   $0x4d
 358:	68 98 0a 00 00       	push   $0xa98
 35d:	68 a2 0a 00 00       	push   $0xaa2
 362:	6a 01                	push   $0x1
 364:	e8 81 04 00 00       	call   7ea <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 21 0b 00 00       	push   $0xb21
 371:	68 c8 0a 00 00       	push   $0xac8
 376:	6a 01                	push   $0x1
 378:	e8 6d 04 00 00       	call   7ea <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 dc 0a 00 00       	push   $0xadc
 385:	6a 01                	push   $0x1
 387:	e8 5e 04 00 00       	call   7ea <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 28 0f 00 00    	push   0xf28
 395:	e8 2b 03 00 00       	call   6c5 <kill>
 39a:	e8 f6 02 00 00       	call   695 <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 98 0a 00 00       	push   $0xa98
 3a6:	68 a2 0a 00 00       	push   $0xaa2
 3ab:	6a 01                	push   $0x1
 3ad:	e8 38 04 00 00       	call   7ea <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 12 0b 00 00       	push   $0xb12
 3ba:	68 c8 0a 00 00       	push   $0xac8
 3bf:	6a 01                	push   $0x1
 3c1:	e8 24 04 00 00       	call   7ea <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 dc 0a 00 00       	push   $0xadc
 3ce:	6a 01                	push   $0x1
 3d0:	e8 15 04 00 00       	call   7ea <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 28 0f 00 00    	push   0xf28
 3de:	e8 e2 02 00 00       	call   6c5 <kill>
 3e3:	e8 ad 02 00 00       	call   695 <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 18 0f 00 00       	push   $0xf18
 3f0:	e8 74 02 00 00       	call   669 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 1c 03 00 00       	call   71d <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 20 0f 00 00    	cmp    0xf20,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 98 0a 00 00       	push   $0xa98
 413:	68 a2 0a 00 00       	push   $0xaa2
 418:	6a 01                	push   $0x1
 41a:	e8 cb 03 00 00       	call   7ea <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 aa 0a 00 00       	push   $0xaaa
 427:	68 c8 0a 00 00       	push   $0xac8
 42c:	6a 01                	push   $0x1
 42e:	e8 b7 03 00 00       	call   7ea <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 dc 0a 00 00       	push   $0xadc
 43b:	6a 01                	push   $0x1
 43d:	e8 a8 03 00 00       	call   7ea <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 28 0f 00 00    	push   0xf28
 44b:	e8 75 02 00 00       	call   6c5 <kill>
 450:	e8 40 02 00 00       	call   695 <exit>
   global++;
 455:	83 05 24 0f 00 00 01 	addl   $0x1,0xf24
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 18 0f 00 00       	push   $0xf18
 464:	e8 14 02 00 00       	call   67d <lock_release>
   exit();
 469:	e8 27 02 00 00       	call   695 <exit>

0000046e <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	56                   	push   %esi
 472:	53                   	push   %ebx
 473:	8b 75 08             	mov    0x8(%ebp),%esi
 476:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 479:	89 f0                	mov    %esi,%eax
 47b:	89 d1                	mov    %edx,%ecx
 47d:	83 c2 01             	add    $0x1,%edx
 480:	89 c3                	mov    %eax,%ebx
 482:	83 c0 01             	add    $0x1,%eax
 485:	0f b6 09             	movzbl (%ecx),%ecx
 488:	88 0b                	mov    %cl,(%ebx)
 48a:	84 c9                	test   %cl,%cl
 48c:	75 ed                	jne    47b <strcpy+0xd>
    ;
  return os;
}
 48e:	89 f0                	mov    %esi,%eax
 490:	5b                   	pop    %ebx
 491:	5e                   	pop    %esi
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    

00000494 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	8b 4d 08             	mov    0x8(%ebp),%ecx
 49a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 49d:	eb 06                	jmp    4a5 <strcmp+0x11>
    p++, q++;
 49f:	83 c1 01             	add    $0x1,%ecx
 4a2:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4a5:	0f b6 01             	movzbl (%ecx),%eax
 4a8:	84 c0                	test   %al,%al
 4aa:	74 04                	je     4b0 <strcmp+0x1c>
 4ac:	3a 02                	cmp    (%edx),%al
 4ae:	74 ef                	je     49f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4b0:	0f b6 c0             	movzbl %al,%eax
 4b3:	0f b6 12             	movzbl (%edx),%edx
 4b6:	29 d0                	sub    %edx,%eax
}
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <strlen>:

uint
strlen(const char *s)
{
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4c0:	b8 00 00 00 00       	mov    $0x0,%eax
 4c5:	eb 03                	jmp    4ca <strlen+0x10>
 4c7:	83 c0 01             	add    $0x1,%eax
 4ca:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4ce:	75 f7                	jne    4c7 <strlen+0xd>
    ;
  return n;
}
 4d0:	5d                   	pop    %ebp
 4d1:	c3                   	ret    

000004d2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4d2:	55                   	push   %ebp
 4d3:	89 e5                	mov    %esp,%ebp
 4d5:	57                   	push   %edi
 4d6:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4d9:	89 d7                	mov    %edx,%edi
 4db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4de:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e1:	fc                   	cld    
 4e2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4e4:	89 d0                	mov    %edx,%eax
 4e6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4e9:	c9                   	leave  
 4ea:	c3                   	ret    

000004eb <strchr>:

char*
strchr(const char *s, char c)
{
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4f5:	eb 03                	jmp    4fa <strchr+0xf>
 4f7:	83 c0 01             	add    $0x1,%eax
 4fa:	0f b6 10             	movzbl (%eax),%edx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	74 06                	je     507 <strchr+0x1c>
    if(*s == c)
 501:	38 ca                	cmp    %cl,%dl
 503:	75 f2                	jne    4f7 <strchr+0xc>
 505:	eb 05                	jmp    50c <strchr+0x21>
      return (char*)s;
  return 0;
 507:	b8 00 00 00 00       	mov    $0x0,%eax
}
 50c:	5d                   	pop    %ebp
 50d:	c3                   	ret    

0000050e <gets>:

char*
gets(char *buf, int max)
{
 50e:	55                   	push   %ebp
 50f:	89 e5                	mov    %esp,%ebp
 511:	57                   	push   %edi
 512:	56                   	push   %esi
 513:	53                   	push   %ebx
 514:	83 ec 1c             	sub    $0x1c,%esp
 517:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 51a:	bb 00 00 00 00       	mov    $0x0,%ebx
 51f:	89 de                	mov    %ebx,%esi
 521:	83 c3 01             	add    $0x1,%ebx
 524:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 527:	7d 2e                	jge    557 <gets+0x49>
    cc = read(0, &c, 1);
 529:	83 ec 04             	sub    $0x4,%esp
 52c:	6a 01                	push   $0x1
 52e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 531:	50                   	push   %eax
 532:	6a 00                	push   $0x0
 534:	e8 74 01 00 00       	call   6ad <read>
    if(cc < 1)
 539:	83 c4 10             	add    $0x10,%esp
 53c:	85 c0                	test   %eax,%eax
 53e:	7e 17                	jle    557 <gets+0x49>
      break;
    buf[i++] = c;
 540:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 544:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 547:	3c 0a                	cmp    $0xa,%al
 549:	0f 94 c2             	sete   %dl
 54c:	3c 0d                	cmp    $0xd,%al
 54e:	0f 94 c0             	sete   %al
 551:	08 c2                	or     %al,%dl
 553:	74 ca                	je     51f <gets+0x11>
    buf[i++] = c;
 555:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 557:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 55b:	89 f8                	mov    %edi,%eax
 55d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 560:	5b                   	pop    %ebx
 561:	5e                   	pop    %esi
 562:	5f                   	pop    %edi
 563:	5d                   	pop    %ebp
 564:	c3                   	ret    

00000565 <stat>:

int
stat(const char *n, struct stat *st)
{
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 56a:	83 ec 08             	sub    $0x8,%esp
 56d:	6a 00                	push   $0x0
 56f:	ff 75 08             	push   0x8(%ebp)
 572:	e8 5e 01 00 00       	call   6d5 <open>
  if(fd < 0)
 577:	83 c4 10             	add    $0x10,%esp
 57a:	85 c0                	test   %eax,%eax
 57c:	78 24                	js     5a2 <stat+0x3d>
 57e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 580:	83 ec 08             	sub    $0x8,%esp
 583:	ff 75 0c             	push   0xc(%ebp)
 586:	50                   	push   %eax
 587:	e8 61 01 00 00       	call   6ed <fstat>
 58c:	89 c6                	mov    %eax,%esi
  close(fd);
 58e:	89 1c 24             	mov    %ebx,(%esp)
 591:	e8 27 01 00 00       	call   6bd <close>
  return r;
 596:	83 c4 10             	add    $0x10,%esp
}
 599:	89 f0                	mov    %esi,%eax
 59b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 59e:	5b                   	pop    %ebx
 59f:	5e                   	pop    %esi
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret    
    return -1;
 5a2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5a7:	eb f0                	jmp    599 <stat+0x34>

000005a9 <atoi>:

int
atoi(const char *s)
{
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	53                   	push   %ebx
 5ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5b0:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5b5:	eb 10                	jmp    5c7 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5b7:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5ba:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5bd:	83 c1 01             	add    $0x1,%ecx
 5c0:	0f be c0             	movsbl %al,%eax
 5c3:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5c7:	0f b6 01             	movzbl (%ecx),%eax
 5ca:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5cd:	80 fb 09             	cmp    $0x9,%bl
 5d0:	76 e5                	jbe    5b7 <atoi+0xe>
  return n;
}
 5d2:	89 d0                	mov    %edx,%eax
 5d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d7:	c9                   	leave  
 5d8:	c3                   	ret    

000005d9 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5d9:	55                   	push   %ebp
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	56                   	push   %esi
 5dd:	53                   	push   %ebx
 5de:	8b 75 08             	mov    0x8(%ebp),%esi
 5e1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5e4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5e7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5e9:	eb 0d                	jmp    5f8 <memmove+0x1f>
    *dst++ = *src++;
 5eb:	0f b6 01             	movzbl (%ecx),%eax
 5ee:	88 02                	mov    %al,(%edx)
 5f0:	8d 49 01             	lea    0x1(%ecx),%ecx
 5f3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5f6:	89 d8                	mov    %ebx,%eax
 5f8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5fb:	85 c0                	test   %eax,%eax
 5fd:	7f ec                	jg     5eb <memmove+0x12>
  return vdst;
}
 5ff:	89 f0                	mov    %esi,%eax
 601:	5b                   	pop    %ebx
 602:	5e                   	pop    %esi
 603:	5d                   	pop    %ebp
 604:	c3                   	ret    

00000605 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 60b:	68 00 10 00 00       	push   $0x1000
 610:	e8 fb 03 00 00       	call   a10 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 615:	50                   	push   %eax
 616:	ff 75 10             	push   0x10(%ebp)
 619:	ff 75 0c             	push   0xc(%ebp)
 61c:	ff 75 08             	push   0x8(%ebp)
 61f:	e8 11 01 00 00       	call   735 <clone>
}
 624:	c9                   	leave  
 625:	c3                   	ret    

00000626 <thread_join>:

int thread_join(){
 626:	55                   	push   %ebp
 627:	89 e5                	mov    %esp,%ebp
 629:	53                   	push   %ebx
 62a:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 62d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 630:	50                   	push   %eax
 631:	e8 07 01 00 00       	call   73d <join>
  if (x < 0) {
 636:	83 c4 10             	add    $0x10,%esp
 639:	85 c0                	test   %eax,%eax
 63b:	78 17                	js     654 <thread_join+0x2e>
 63d:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 63f:	83 ec 0c             	sub    $0xc,%esp
 642:	ff 75 f4             	push   -0xc(%ebp)
 645:	e8 06 03 00 00       	call   950 <free>
  return x;
 64a:	83 c4 10             	add    $0x10,%esp
}
 64d:	89 d8                	mov    %ebx,%eax
 64f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 652:	c9                   	leave  
 653:	c3                   	ret    
    return -1;
 654:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 659:	eb f2                	jmp    64d <thread_join+0x27>

0000065b <lock_init>:

void lock_init(lock_t *spin){
 65b:	55                   	push   %ebp
 65c:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 65e:	8b 45 08             	mov    0x8(%ebp),%eax
 661:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 667:	5d                   	pop    %ebp
 668:	c3                   	ret    

00000669 <lock_acquire>:

void lock_acquire(lock_t *spin){
 669:	55                   	push   %ebp
 66a:	89 e5                	mov    %esp,%ebp
 66c:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 66f:	b8 01 00 00 00       	mov    $0x1,%eax
 674:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 677:	85 c0                	test   %eax,%eax
 679:	75 f4                	jne    66f <lock_acquire+0x6>

}
 67b:	5d                   	pop    %ebp
 67c:	c3                   	ret    

0000067d <lock_release>:

void lock_release(lock_t *spin){
 67d:	55                   	push   %ebp
 67e:	89 e5                	mov    %esp,%ebp
 680:	8b 55 08             	mov    0x8(%ebp),%edx
 683:	b8 00 00 00 00       	mov    $0x0,%eax
 688:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    

0000068d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 68d:	b8 01 00 00 00       	mov    $0x1,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <exit>:
SYSCALL(exit)
 695:	b8 02 00 00 00       	mov    $0x2,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    

0000069d <wait>:
SYSCALL(wait)
 69d:	b8 03 00 00 00       	mov    $0x3,%eax
 6a2:	cd 40                	int    $0x40
 6a4:	c3                   	ret    

000006a5 <pipe>:
SYSCALL(pipe)
 6a5:	b8 04 00 00 00       	mov    $0x4,%eax
 6aa:	cd 40                	int    $0x40
 6ac:	c3                   	ret    

000006ad <read>:
SYSCALL(read)
 6ad:	b8 05 00 00 00       	mov    $0x5,%eax
 6b2:	cd 40                	int    $0x40
 6b4:	c3                   	ret    

000006b5 <write>:
SYSCALL(write)
 6b5:	b8 10 00 00 00       	mov    $0x10,%eax
 6ba:	cd 40                	int    $0x40
 6bc:	c3                   	ret    

000006bd <close>:
SYSCALL(close)
 6bd:	b8 15 00 00 00       	mov    $0x15,%eax
 6c2:	cd 40                	int    $0x40
 6c4:	c3                   	ret    

000006c5 <kill>:
SYSCALL(kill)
 6c5:	b8 06 00 00 00       	mov    $0x6,%eax
 6ca:	cd 40                	int    $0x40
 6cc:	c3                   	ret    

000006cd <exec>:
SYSCALL(exec)
 6cd:	b8 07 00 00 00       	mov    $0x7,%eax
 6d2:	cd 40                	int    $0x40
 6d4:	c3                   	ret    

000006d5 <open>:
SYSCALL(open)
 6d5:	b8 0f 00 00 00       	mov    $0xf,%eax
 6da:	cd 40                	int    $0x40
 6dc:	c3                   	ret    

000006dd <mknod>:
SYSCALL(mknod)
 6dd:	b8 11 00 00 00       	mov    $0x11,%eax
 6e2:	cd 40                	int    $0x40
 6e4:	c3                   	ret    

000006e5 <unlink>:
SYSCALL(unlink)
 6e5:	b8 12 00 00 00       	mov    $0x12,%eax
 6ea:	cd 40                	int    $0x40
 6ec:	c3                   	ret    

000006ed <fstat>:
SYSCALL(fstat)
 6ed:	b8 08 00 00 00       	mov    $0x8,%eax
 6f2:	cd 40                	int    $0x40
 6f4:	c3                   	ret    

000006f5 <link>:
SYSCALL(link)
 6f5:	b8 13 00 00 00       	mov    $0x13,%eax
 6fa:	cd 40                	int    $0x40
 6fc:	c3                   	ret    

000006fd <mkdir>:
SYSCALL(mkdir)
 6fd:	b8 14 00 00 00       	mov    $0x14,%eax
 702:	cd 40                	int    $0x40
 704:	c3                   	ret    

00000705 <chdir>:
SYSCALL(chdir)
 705:	b8 09 00 00 00       	mov    $0x9,%eax
 70a:	cd 40                	int    $0x40
 70c:	c3                   	ret    

0000070d <dup>:
SYSCALL(dup)
 70d:	b8 0a 00 00 00       	mov    $0xa,%eax
 712:	cd 40                	int    $0x40
 714:	c3                   	ret    

00000715 <getpid>:
SYSCALL(getpid)
 715:	b8 0b 00 00 00       	mov    $0xb,%eax
 71a:	cd 40                	int    $0x40
 71c:	c3                   	ret    

0000071d <sbrk>:
SYSCALL(sbrk)
 71d:	b8 0c 00 00 00       	mov    $0xc,%eax
 722:	cd 40                	int    $0x40
 724:	c3                   	ret    

00000725 <sleep>:
SYSCALL(sleep)
 725:	b8 0d 00 00 00       	mov    $0xd,%eax
 72a:	cd 40                	int    $0x40
 72c:	c3                   	ret    

0000072d <uptime>:
SYSCALL(uptime)
 72d:	b8 0e 00 00 00       	mov    $0xe,%eax
 732:	cd 40                	int    $0x40
 734:	c3                   	ret    

00000735 <clone>:
SYSCALL(clone)
 735:	b8 16 00 00 00       	mov    $0x16,%eax
 73a:	cd 40                	int    $0x40
 73c:	c3                   	ret    

0000073d <join>:
 73d:	b8 17 00 00 00       	mov    $0x17,%eax
 742:	cd 40                	int    $0x40
 744:	c3                   	ret    

00000745 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 745:	55                   	push   %ebp
 746:	89 e5                	mov    %esp,%ebp
 748:	83 ec 1c             	sub    $0x1c,%esp
 74b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 74e:	6a 01                	push   $0x1
 750:	8d 55 f4             	lea    -0xc(%ebp),%edx
 753:	52                   	push   %edx
 754:	50                   	push   %eax
 755:	e8 5b ff ff ff       	call   6b5 <write>
}
 75a:	83 c4 10             	add    $0x10,%esp
 75d:	c9                   	leave  
 75e:	c3                   	ret    

0000075f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 75f:	55                   	push   %ebp
 760:	89 e5                	mov    %esp,%ebp
 762:	57                   	push   %edi
 763:	56                   	push   %esi
 764:	53                   	push   %ebx
 765:	83 ec 2c             	sub    $0x2c,%esp
 768:	89 45 d0             	mov    %eax,-0x30(%ebp)
 76b:	89 d0                	mov    %edx,%eax
 76d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 76f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 773:	0f 95 c1             	setne  %cl
 776:	c1 ea 1f             	shr    $0x1f,%edx
 779:	84 d1                	test   %dl,%cl
 77b:	74 44                	je     7c1 <printint+0x62>
    neg = 1;
    x = -xx;
 77d:	f7 d8                	neg    %eax
 77f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 781:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 788:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 78d:	89 c8                	mov    %ecx,%eax
 78f:	ba 00 00 00 00       	mov    $0x0,%edx
 794:	f7 f6                	div    %esi
 796:	89 df                	mov    %ebx,%edi
 798:	83 c3 01             	add    $0x1,%ebx
 79b:	0f b6 92 90 0b 00 00 	movzbl 0xb90(%edx),%edx
 7a2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7a6:	89 ca                	mov    %ecx,%edx
 7a8:	89 c1                	mov    %eax,%ecx
 7aa:	39 d6                	cmp    %edx,%esi
 7ac:	76 df                	jbe    78d <printint+0x2e>
  if(neg)
 7ae:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7b2:	74 31                	je     7e5 <printint+0x86>
    buf[i++] = '-';
 7b4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7b9:	8d 5f 02             	lea    0x2(%edi),%ebx
 7bc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7bf:	eb 17                	jmp    7d8 <printint+0x79>
    x = xx;
 7c1:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7c3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7ca:	eb bc                	jmp    788 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7cc:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7d1:	89 f0                	mov    %esi,%eax
 7d3:	e8 6d ff ff ff       	call   745 <putc>
  while(--i >= 0)
 7d8:	83 eb 01             	sub    $0x1,%ebx
 7db:	79 ef                	jns    7cc <printint+0x6d>
}
 7dd:	83 c4 2c             	add    $0x2c,%esp
 7e0:	5b                   	pop    %ebx
 7e1:	5e                   	pop    %esi
 7e2:	5f                   	pop    %edi
 7e3:	5d                   	pop    %ebp
 7e4:	c3                   	ret    
 7e5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7e8:	eb ee                	jmp    7d8 <printint+0x79>

000007ea <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7ea:	55                   	push   %ebp
 7eb:	89 e5                	mov    %esp,%ebp
 7ed:	57                   	push   %edi
 7ee:	56                   	push   %esi
 7ef:	53                   	push   %ebx
 7f0:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7f3:	8d 45 10             	lea    0x10(%ebp),%eax
 7f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7f9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7fe:	bb 00 00 00 00       	mov    $0x0,%ebx
 803:	eb 14                	jmp    819 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 805:	89 fa                	mov    %edi,%edx
 807:	8b 45 08             	mov    0x8(%ebp),%eax
 80a:	e8 36 ff ff ff       	call   745 <putc>
 80f:	eb 05                	jmp    816 <printf+0x2c>
      }
    } else if(state == '%'){
 811:	83 fe 25             	cmp    $0x25,%esi
 814:	74 25                	je     83b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 816:	83 c3 01             	add    $0x1,%ebx
 819:	8b 45 0c             	mov    0xc(%ebp),%eax
 81c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 820:	84 c0                	test   %al,%al
 822:	0f 84 20 01 00 00    	je     948 <printf+0x15e>
    c = fmt[i] & 0xff;
 828:	0f be f8             	movsbl %al,%edi
 82b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 82e:	85 f6                	test   %esi,%esi
 830:	75 df                	jne    811 <printf+0x27>
      if(c == '%'){
 832:	83 f8 25             	cmp    $0x25,%eax
 835:	75 ce                	jne    805 <printf+0x1b>
        state = '%';
 837:	89 c6                	mov    %eax,%esi
 839:	eb db                	jmp    816 <printf+0x2c>
      if(c == 'd'){
 83b:	83 f8 25             	cmp    $0x25,%eax
 83e:	0f 84 cf 00 00 00    	je     913 <printf+0x129>
 844:	0f 8c dd 00 00 00    	jl     927 <printf+0x13d>
 84a:	83 f8 78             	cmp    $0x78,%eax
 84d:	0f 8f d4 00 00 00    	jg     927 <printf+0x13d>
 853:	83 f8 63             	cmp    $0x63,%eax
 856:	0f 8c cb 00 00 00    	jl     927 <printf+0x13d>
 85c:	83 e8 63             	sub    $0x63,%eax
 85f:	83 f8 15             	cmp    $0x15,%eax
 862:	0f 87 bf 00 00 00    	ja     927 <printf+0x13d>
 868:	ff 24 85 38 0b 00 00 	jmp    *0xb38(,%eax,4)
        printint(fd, *ap, 10, 1);
 86f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 872:	8b 17                	mov    (%edi),%edx
 874:	83 ec 0c             	sub    $0xc,%esp
 877:	6a 01                	push   $0x1
 879:	b9 0a 00 00 00       	mov    $0xa,%ecx
 87e:	8b 45 08             	mov    0x8(%ebp),%eax
 881:	e8 d9 fe ff ff       	call   75f <printint>
        ap++;
 886:	83 c7 04             	add    $0x4,%edi
 889:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 88c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 88f:	be 00 00 00 00       	mov    $0x0,%esi
 894:	eb 80                	jmp    816 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 896:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 899:	8b 17                	mov    (%edi),%edx
 89b:	83 ec 0c             	sub    $0xc,%esp
 89e:	6a 00                	push   $0x0
 8a0:	b9 10 00 00 00       	mov    $0x10,%ecx
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	e8 b2 fe ff ff       	call   75f <printint>
        ap++;
 8ad:	83 c7 04             	add    $0x4,%edi
 8b0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8b3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8b6:	be 00 00 00 00       	mov    $0x0,%esi
 8bb:	e9 56 ff ff ff       	jmp    816 <printf+0x2c>
        s = (char*)*ap;
 8c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c3:	8b 30                	mov    (%eax),%esi
        ap++;
 8c5:	83 c0 04             	add    $0x4,%eax
 8c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8cb:	85 f6                	test   %esi,%esi
 8cd:	75 15                	jne    8e4 <printf+0xfa>
          s = "(null)";
 8cf:	be 30 0b 00 00       	mov    $0xb30,%esi
 8d4:	eb 0e                	jmp    8e4 <printf+0xfa>
          putc(fd, *s);
 8d6:	0f be d2             	movsbl %dl,%edx
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
 8dc:	e8 64 fe ff ff       	call   745 <putc>
          s++;
 8e1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8e4:	0f b6 16             	movzbl (%esi),%edx
 8e7:	84 d2                	test   %dl,%dl
 8e9:	75 eb                	jne    8d6 <printf+0xec>
      state = 0;
 8eb:	be 00 00 00 00       	mov    $0x0,%esi
 8f0:	e9 21 ff ff ff       	jmp    816 <printf+0x2c>
        putc(fd, *ap);
 8f5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8f8:	0f be 17             	movsbl (%edi),%edx
 8fb:	8b 45 08             	mov    0x8(%ebp),%eax
 8fe:	e8 42 fe ff ff       	call   745 <putc>
        ap++;
 903:	83 c7 04             	add    $0x4,%edi
 906:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 909:	be 00 00 00 00       	mov    $0x0,%esi
 90e:	e9 03 ff ff ff       	jmp    816 <printf+0x2c>
        putc(fd, c);
 913:	89 fa                	mov    %edi,%edx
 915:	8b 45 08             	mov    0x8(%ebp),%eax
 918:	e8 28 fe ff ff       	call   745 <putc>
      state = 0;
 91d:	be 00 00 00 00       	mov    $0x0,%esi
 922:	e9 ef fe ff ff       	jmp    816 <printf+0x2c>
        putc(fd, '%');
 927:	ba 25 00 00 00       	mov    $0x25,%edx
 92c:	8b 45 08             	mov    0x8(%ebp),%eax
 92f:	e8 11 fe ff ff       	call   745 <putc>
        putc(fd, c);
 934:	89 fa                	mov    %edi,%edx
 936:	8b 45 08             	mov    0x8(%ebp),%eax
 939:	e8 07 fe ff ff       	call   745 <putc>
      state = 0;
 93e:	be 00 00 00 00       	mov    $0x0,%esi
 943:	e9 ce fe ff ff       	jmp    816 <printf+0x2c>
    }
  }
}
 948:	8d 65 f4             	lea    -0xc(%ebp),%esp
 94b:	5b                   	pop    %ebx
 94c:	5e                   	pop    %esi
 94d:	5f                   	pop    %edi
 94e:	5d                   	pop    %ebp
 94f:	c3                   	ret    

00000950 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 959:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95c:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 961:	eb 02                	jmp    965 <free+0x15>
 963:	89 d0                	mov    %edx,%eax
 965:	39 c8                	cmp    %ecx,%eax
 967:	73 04                	jae    96d <free+0x1d>
 969:	39 08                	cmp    %ecx,(%eax)
 96b:	77 12                	ja     97f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96d:	8b 10                	mov    (%eax),%edx
 96f:	39 c2                	cmp    %eax,%edx
 971:	77 f0                	ja     963 <free+0x13>
 973:	39 c8                	cmp    %ecx,%eax
 975:	72 08                	jb     97f <free+0x2f>
 977:	39 ca                	cmp    %ecx,%edx
 979:	77 04                	ja     97f <free+0x2f>
 97b:	89 d0                	mov    %edx,%eax
 97d:	eb e6                	jmp    965 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 97f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 982:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 985:	8b 10                	mov    (%eax),%edx
 987:	39 d7                	cmp    %edx,%edi
 989:	74 19                	je     9a4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 98b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 98e:	8b 50 04             	mov    0x4(%eax),%edx
 991:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 994:	39 ce                	cmp    %ecx,%esi
 996:	74 1b                	je     9b3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 998:	89 08                	mov    %ecx,(%eax)
  freep = p;
 99a:	a3 2c 0f 00 00       	mov    %eax,0xf2c
}
 99f:	5b                   	pop    %ebx
 9a0:	5e                   	pop    %esi
 9a1:	5f                   	pop    %edi
 9a2:	5d                   	pop    %ebp
 9a3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9a4:	03 72 04             	add    0x4(%edx),%esi
 9a7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9aa:	8b 10                	mov    (%eax),%edx
 9ac:	8b 12                	mov    (%edx),%edx
 9ae:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9b1:	eb db                	jmp    98e <free+0x3e>
    p->s.size += bp->s.size;
 9b3:	03 53 fc             	add    -0x4(%ebx),%edx
 9b6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9bc:	89 10                	mov    %edx,(%eax)
 9be:	eb da                	jmp    99a <free+0x4a>

000009c0 <morecore>:

static Header*
morecore(uint nu)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	53                   	push   %ebx
 9c4:	83 ec 04             	sub    $0x4,%esp
 9c7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9c9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9ce:	77 05                	ja     9d5 <morecore+0x15>
    nu = 4096;
 9d0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9d5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9dc:	83 ec 0c             	sub    $0xc,%esp
 9df:	50                   	push   %eax
 9e0:	e8 38 fd ff ff       	call   71d <sbrk>
  if(p == (char*)-1)
 9e5:	83 c4 10             	add    $0x10,%esp
 9e8:	83 f8 ff             	cmp    $0xffffffff,%eax
 9eb:	74 1c                	je     a09 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9ed:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9f0:	83 c0 08             	add    $0x8,%eax
 9f3:	83 ec 0c             	sub    $0xc,%esp
 9f6:	50                   	push   %eax
 9f7:	e8 54 ff ff ff       	call   950 <free>
  return freep;
 9fc:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 a01:	83 c4 10             	add    $0x10,%esp
}
 a04:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a07:	c9                   	leave  
 a08:	c3                   	ret    
    return 0;
 a09:	b8 00 00 00 00       	mov    $0x0,%eax
 a0e:	eb f4                	jmp    a04 <morecore+0x44>

00000a10 <malloc>:

void*
malloc(uint nbytes)
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	53                   	push   %ebx
 a14:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a17:	8b 45 08             	mov    0x8(%ebp),%eax
 a1a:	8d 58 07             	lea    0x7(%eax),%ebx
 a1d:	c1 eb 03             	shr    $0x3,%ebx
 a20:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a23:	8b 0d 2c 0f 00 00    	mov    0xf2c,%ecx
 a29:	85 c9                	test   %ecx,%ecx
 a2b:	74 04                	je     a31 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a2d:	8b 01                	mov    (%ecx),%eax
 a2f:	eb 4a                	jmp    a7b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a31:	c7 05 2c 0f 00 00 30 	movl   $0xf30,0xf2c
 a38:	0f 00 00 
 a3b:	c7 05 30 0f 00 00 30 	movl   $0xf30,0xf30
 a42:	0f 00 00 
    base.s.size = 0;
 a45:	c7 05 34 0f 00 00 00 	movl   $0x0,0xf34
 a4c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a4f:	b9 30 0f 00 00       	mov    $0xf30,%ecx
 a54:	eb d7                	jmp    a2d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a56:	74 19                	je     a71 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a58:	29 da                	sub    %ebx,%edx
 a5a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a5d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a60:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a63:	89 0d 2c 0f 00 00    	mov    %ecx,0xf2c
      return (void*)(p + 1);
 a69:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a6f:	c9                   	leave  
 a70:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a71:	8b 10                	mov    (%eax),%edx
 a73:	89 11                	mov    %edx,(%ecx)
 a75:	eb ec                	jmp    a63 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a77:	89 c1                	mov    %eax,%ecx
 a79:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a7b:	8b 50 04             	mov    0x4(%eax),%edx
 a7e:	39 da                	cmp    %ebx,%edx
 a80:	73 d4                	jae    a56 <malloc+0x46>
    if(p == freep)
 a82:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
 a88:	75 ed                	jne    a77 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a8a:	89 d8                	mov    %ebx,%eax
 a8c:	e8 2f ff ff ff       	call   9c0 <morecore>
 a91:	85 c0                	test   %eax,%eax
 a93:	75 e2                	jne    a77 <malloc+0x67>
 a95:	eb d5                	jmp    a6c <malloc+0x5c>
