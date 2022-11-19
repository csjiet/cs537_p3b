
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
   b:	e8 5c 06 00 00       	call   66c <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 04 07 00 00       	call   720 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 20 0f 00 00    	cmp    0xf20,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 9c 0a 00 00       	push   $0xa9c
  2e:	68 a6 0a 00 00       	push   $0xaa6
  33:	6a 01                	push   $0x1
  35:	e8 b3 07 00 00       	call   7ed <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 ae 0a 00 00       	push   $0xaae
  42:	68 cc 0a 00 00       	push   $0xacc
  47:	6a 01                	push   $0x1
  49:	e8 9f 07 00 00       	call   7ed <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 e0 0a 00 00       	push   $0xae0
  56:	6a 01                	push   $0x1
  58:	e8 90 07 00 00       	call   7ed <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 28 0f 00 00    	push   0xf28
  66:	e8 5d 06 00 00       	call   6c8 <kill>
  6b:	e8 28 06 00 00       	call   698 <exit>
   global++;
  70:	83 05 24 0f 00 00 01 	addl   $0x1,0xf24
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 1c 0f 00 00       	push   $0xf1c
  7f:	e8 fc 05 00 00       	call   680 <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
  8b:	e8 dc 05 00 00       	call   66c <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 84 06 00 00       	call   720 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 20 0f 00 00    	cmp    0xf20,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 9c 0a 00 00       	push   $0xa9c
  ae:	68 a6 0a 00 00       	push   $0xaa6
  b3:	6a 01                	push   $0x1
  b5:	e8 33 07 00 00       	call   7ed <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 ae 0a 00 00       	push   $0xaae
  c2:	68 cc 0a 00 00       	push   $0xacc
  c7:	6a 01                	push   $0x1
  c9:	e8 1f 07 00 00       	call   7ed <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 e0 0a 00 00       	push   $0xae0
  d6:	6a 01                	push   $0x1
  d8:	e8 10 07 00 00       	call   7ed <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 28 0f 00 00    	push   0xf28
  e6:	e8 dd 05 00 00       	call   6c8 <kill>
  eb:	e8 a8 05 00 00       	call   698 <exit>
   global++;
  f0:	83 05 24 0f 00 00 01 	addl   $0x1,0xf24
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 1c 06 00 00       	call   720 <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 10 06 00 00       	call   720 <sbrk>
 110:	a3 20 0f 00 00       	mov    %eax,0xf20
   lock_release(&lock2);
 115:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
 11c:	e8 5f 05 00 00       	call   680 <lock_release>



   exit();
 121:	e8 72 05 00 00       	call   698 <exit>

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
 138:	e8 db 05 00 00       	call   718 <getpid>
 13d:	a3 28 0f 00 00       	mov    %eax,0xf28
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 1c 0f 00 00       	push   $0xf1c
 158:	e8 01 05 00 00       	call   65e <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
 164:	e8 f5 04 00 00       	call   65e <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 1c 0f 00 00 	movl   $0xf1c,(%esp)
 170:	e8 f7 04 00 00       	call   66c <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
 17c:	e8 eb 04 00 00       	call   66c <lock_acquire>
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
 1b4:	68 9c 0a 00 00       	push   $0xa9c
 1b9:	68 a6 0a 00 00       	push   $0xaa6
 1be:	6a 01                	push   $0x1
 1c0:	e8 28 06 00 00       	call   7ed <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 ed 0a 00 00       	push   $0xaed
 1cd:	68 cc 0a 00 00       	push   $0xacc
 1d2:	6a 01                	push   $0x1
 1d4:	e8 14 06 00 00       	call   7ed <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 e0 0a 00 00       	push   $0xae0
 1e1:	6a 01                	push   $0x1
 1e3:	e8 05 06 00 00       	call   7ed <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 28 0f 00 00    	push   0xf28
 1f1:	e8 d2 04 00 00       	call   6c8 <kill>
 1f6:	e8 9d 04 00 00       	call   698 <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 1b 05 00 00       	call   720 <sbrk>
 205:	a3 20 0f 00 00       	mov    %eax,0xf20
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 14 0f 00 00       	mov    0xf14,%eax
 212:	39 05 24 0f 00 00    	cmp    %eax,0xf24
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 1c 0f 00 00       	push   $0xf1c
 222:	e8 59 04 00 00       	call   680 <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 f5 04 00 00       	call   728 <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 1c 0f 00 00 	movl   $0xf1c,(%esp)
 23a:	e8 2d 04 00 00       	call   66c <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 24 0f 00 00 00 	movl   $0x0,0xf24
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 c5 04 00 00       	call   720 <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 b9 04 00 00       	call   720 <sbrk>
 267:	a3 20 0f 00 00       	mov    %eax,0xf20
   lock_release(&lock);
 26c:	c7 04 24 1c 0f 00 00 	movl   $0xf1c,(%esp)
 273:	e8 08 04 00 00       	call   680 <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 14 0f 00 00       	mov    0xf14,%eax
 280:	39 05 24 0f 00 00    	cmp    %eax,0xf24
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 18 0f 00 00       	push   $0xf18
 290:	e8 eb 03 00 00       	call   680 <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 87 04 00 00       	call   728 <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 18 0f 00 00 	movl   $0xf18,(%esp)
 2a8:	e8 bf 03 00 00       	call   66c <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 18 0f 00 00       	push   $0xf18
 2ba:	e8 c1 03 00 00       	call   680 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 14 0f 00 00    	cmp    %ebx,0xf14
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 66 03 00 00       	call   63a <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 9c 0a 00 00       	push   $0xa9c
 2e4:	68 a6 0a 00 00       	push   $0xaa6
 2e9:	6a 01                	push   $0x1
 2eb:	e8 fd 04 00 00       	call   7ed <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 fc 0a 00 00       	push   $0xafc
 2f8:	68 cc 0a 00 00       	push   $0xacc
 2fd:	6a 01                	push   $0x1
 2ff:	e8 e9 04 00 00       	call   7ed <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 e0 0a 00 00       	push   $0xae0
 30c:	6a 01                	push   $0x1
 30e:	e8 da 04 00 00       	call   7ed <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 28 0f 00 00    	push   0xf28
 31c:	e8 a7 03 00 00       	call   6c8 <kill>
 321:	e8 72 03 00 00       	call   698 <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 09 0b 00 00       	push   $0xb09
 32e:	6a 01                	push   $0x1
 330:	e8 b8 04 00 00       	call   7ed <printf>
   exit();
 335:	e8 5e 03 00 00       	call   698 <exit>

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
 358:	68 9c 0a 00 00       	push   $0xa9c
 35d:	68 a6 0a 00 00       	push   $0xaa6
 362:	6a 01                	push   $0x1
 364:	e8 84 04 00 00       	call   7ed <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 25 0b 00 00       	push   $0xb25
 371:	68 cc 0a 00 00       	push   $0xacc
 376:	6a 01                	push   $0x1
 378:	e8 70 04 00 00       	call   7ed <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 e0 0a 00 00       	push   $0xae0
 385:	6a 01                	push   $0x1
 387:	e8 61 04 00 00       	call   7ed <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 28 0f 00 00    	push   0xf28
 395:	e8 2e 03 00 00       	call   6c8 <kill>
 39a:	e8 f9 02 00 00       	call   698 <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 9c 0a 00 00       	push   $0xa9c
 3a6:	68 a6 0a 00 00       	push   $0xaa6
 3ab:	6a 01                	push   $0x1
 3ad:	e8 3b 04 00 00       	call   7ed <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 16 0b 00 00       	push   $0xb16
 3ba:	68 cc 0a 00 00       	push   $0xacc
 3bf:	6a 01                	push   $0x1
 3c1:	e8 27 04 00 00       	call   7ed <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 e0 0a 00 00       	push   $0xae0
 3ce:	6a 01                	push   $0x1
 3d0:	e8 18 04 00 00       	call   7ed <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 28 0f 00 00    	push   0xf28
 3de:	e8 e5 02 00 00       	call   6c8 <kill>
 3e3:	e8 b0 02 00 00       	call   698 <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 18 0f 00 00       	push   $0xf18
 3f0:	e8 77 02 00 00       	call   66c <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 1f 03 00 00       	call   720 <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 20 0f 00 00    	cmp    0xf20,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 9c 0a 00 00       	push   $0xa9c
 413:	68 a6 0a 00 00       	push   $0xaa6
 418:	6a 01                	push   $0x1
 41a:	e8 ce 03 00 00       	call   7ed <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 ae 0a 00 00       	push   $0xaae
 427:	68 cc 0a 00 00       	push   $0xacc
 42c:	6a 01                	push   $0x1
 42e:	e8 ba 03 00 00       	call   7ed <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 e0 0a 00 00       	push   $0xae0
 43b:	6a 01                	push   $0x1
 43d:	e8 ab 03 00 00       	call   7ed <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 28 0f 00 00    	push   0xf28
 44b:	e8 78 02 00 00       	call   6c8 <kill>
 450:	e8 43 02 00 00       	call   698 <exit>
   global++;
 455:	83 05 24 0f 00 00 01 	addl   $0x1,0xf24
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 18 0f 00 00       	push   $0xf18
 464:	e8 17 02 00 00       	call   680 <lock_release>
   exit();
 469:	e8 2a 02 00 00       	call   698 <exit>

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
 534:	e8 77 01 00 00       	call   6b0 <read>
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
 572:	e8 61 01 00 00       	call   6d8 <open>
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
 587:	e8 64 01 00 00       	call   6f0 <fstat>
 58c:	89 c6                	mov    %eax,%esi
  close(fd);
 58e:	89 1c 24             	mov    %ebx,(%esp)
 591:	e8 2a 01 00 00       	call   6c0 <close>
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

  void* stack = malloc(2 * PGSIZE);
 60b:	68 00 20 00 00       	push   $0x2000
 610:	e8 fe 03 00 00       	call   a13 <malloc>
  if ((uint)stack%PGSIZE){
 615:	83 c4 10             	add    $0x10,%esp
 618:	a9 ff 0f 00 00       	test   $0xfff,%eax
 61d:	74 0a                	je     629 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 61f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 624:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 629:	50                   	push   %eax
 62a:	ff 75 10             	push   0x10(%ebp)
 62d:	ff 75 0c             	push   0xc(%ebp)
 630:	ff 75 08             	push   0x8(%ebp)
 633:	e8 00 01 00 00       	call   738 <clone>
}
 638:	c9                   	leave  
 639:	c3                   	ret    

0000063a <thread_join>:

int thread_join(){
 63a:	55                   	push   %ebp
 63b:	89 e5                	mov    %esp,%ebp
 63d:	53                   	push   %ebx
 63e:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 641:	8d 45 f4             	lea    -0xc(%ebp),%eax
 644:	50                   	push   %eax
 645:	e8 f6 00 00 00       	call   740 <join>
 64a:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 64c:	83 c4 04             	add    $0x4,%esp
 64f:	ff 75 f4             	push   -0xc(%ebp)
 652:	e8 fc 02 00 00       	call   953 <free>
  return x;
}
 657:	89 d8                	mov    %ebx,%eax
 659:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65c:	c9                   	leave  
 65d:	c3                   	ret    

0000065e <lock_init>:

void lock_init(lock_t *spin){
 65e:	55                   	push   %ebp
 65f:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 661:	8b 45 08             	mov    0x8(%ebp),%eax
 664:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 66a:	5d                   	pop    %ebp
 66b:	c3                   	ret    

0000066c <lock_acquire>:

void lock_acquire(lock_t *spin){
 66c:	55                   	push   %ebp
 66d:	89 e5                	mov    %esp,%ebp
 66f:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 672:	b8 01 00 00 00       	mov    $0x1,%eax
 677:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 67a:	85 c0                	test   %eax,%eax
 67c:	75 f4                	jne    672 <lock_acquire+0x6>

}
 67e:	5d                   	pop    %ebp
 67f:	c3                   	ret    

00000680 <lock_release>:

void lock_release(lock_t *spin){
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	8b 55 08             	mov    0x8(%ebp),%edx
 686:	b8 00 00 00 00       	mov    $0x0,%eax
 68b:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 68e:	5d                   	pop    %ebp
 68f:	c3                   	ret    

00000690 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 690:	b8 01 00 00 00       	mov    $0x1,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <exit>:
SYSCALL(exit)
 698:	b8 02 00 00 00       	mov    $0x2,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <wait>:
SYSCALL(wait)
 6a0:	b8 03 00 00 00       	mov    $0x3,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <pipe>:
SYSCALL(pipe)
 6a8:	b8 04 00 00 00       	mov    $0x4,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <read>:
SYSCALL(read)
 6b0:	b8 05 00 00 00       	mov    $0x5,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <write>:
SYSCALL(write)
 6b8:	b8 10 00 00 00       	mov    $0x10,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <close>:
SYSCALL(close)
 6c0:	b8 15 00 00 00       	mov    $0x15,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <kill>:
SYSCALL(kill)
 6c8:	b8 06 00 00 00       	mov    $0x6,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <exec>:
SYSCALL(exec)
 6d0:	b8 07 00 00 00       	mov    $0x7,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <open>:
SYSCALL(open)
 6d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <mknod>:
SYSCALL(mknod)
 6e0:	b8 11 00 00 00       	mov    $0x11,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <unlink>:
SYSCALL(unlink)
 6e8:	b8 12 00 00 00       	mov    $0x12,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <fstat>:
SYSCALL(fstat)
 6f0:	b8 08 00 00 00       	mov    $0x8,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <link>:
SYSCALL(link)
 6f8:	b8 13 00 00 00       	mov    $0x13,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <mkdir>:
SYSCALL(mkdir)
 700:	b8 14 00 00 00       	mov    $0x14,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <chdir>:
SYSCALL(chdir)
 708:	b8 09 00 00 00       	mov    $0x9,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <dup>:
SYSCALL(dup)
 710:	b8 0a 00 00 00       	mov    $0xa,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <getpid>:
SYSCALL(getpid)
 718:	b8 0b 00 00 00       	mov    $0xb,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <sbrk>:
SYSCALL(sbrk)
 720:	b8 0c 00 00 00       	mov    $0xc,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <sleep>:
SYSCALL(sleep)
 728:	b8 0d 00 00 00       	mov    $0xd,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <uptime>:
SYSCALL(uptime)
 730:	b8 0e 00 00 00       	mov    $0xe,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <clone>:
SYSCALL(clone)
 738:	b8 16 00 00 00       	mov    $0x16,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <join>:
 740:	b8 17 00 00 00       	mov    $0x17,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 748:	55                   	push   %ebp
 749:	89 e5                	mov    %esp,%ebp
 74b:	83 ec 1c             	sub    $0x1c,%esp
 74e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 751:	6a 01                	push   $0x1
 753:	8d 55 f4             	lea    -0xc(%ebp),%edx
 756:	52                   	push   %edx
 757:	50                   	push   %eax
 758:	e8 5b ff ff ff       	call   6b8 <write>
}
 75d:	83 c4 10             	add    $0x10,%esp
 760:	c9                   	leave  
 761:	c3                   	ret    

00000762 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 762:	55                   	push   %ebp
 763:	89 e5                	mov    %esp,%ebp
 765:	57                   	push   %edi
 766:	56                   	push   %esi
 767:	53                   	push   %ebx
 768:	83 ec 2c             	sub    $0x2c,%esp
 76b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 76e:	89 d0                	mov    %edx,%eax
 770:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 772:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 776:	0f 95 c1             	setne  %cl
 779:	c1 ea 1f             	shr    $0x1f,%edx
 77c:	84 d1                	test   %dl,%cl
 77e:	74 44                	je     7c4 <printint+0x62>
    neg = 1;
    x = -xx;
 780:	f7 d8                	neg    %eax
 782:	89 c1                	mov    %eax,%ecx
    neg = 1;
 784:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 78b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 790:	89 c8                	mov    %ecx,%eax
 792:	ba 00 00 00 00       	mov    $0x0,%edx
 797:	f7 f6                	div    %esi
 799:	89 df                	mov    %ebx,%edi
 79b:	83 c3 01             	add    $0x1,%ebx
 79e:	0f b6 92 94 0b 00 00 	movzbl 0xb94(%edx),%edx
 7a5:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7a9:	89 ca                	mov    %ecx,%edx
 7ab:	89 c1                	mov    %eax,%ecx
 7ad:	39 d6                	cmp    %edx,%esi
 7af:	76 df                	jbe    790 <printint+0x2e>
  if(neg)
 7b1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7b5:	74 31                	je     7e8 <printint+0x86>
    buf[i++] = '-';
 7b7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7bc:	8d 5f 02             	lea    0x2(%edi),%ebx
 7bf:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7c2:	eb 17                	jmp    7db <printint+0x79>
    x = xx;
 7c4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7c6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7cd:	eb bc                	jmp    78b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7cf:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7d4:	89 f0                	mov    %esi,%eax
 7d6:	e8 6d ff ff ff       	call   748 <putc>
  while(--i >= 0)
 7db:	83 eb 01             	sub    $0x1,%ebx
 7de:	79 ef                	jns    7cf <printint+0x6d>
}
 7e0:	83 c4 2c             	add    $0x2c,%esp
 7e3:	5b                   	pop    %ebx
 7e4:	5e                   	pop    %esi
 7e5:	5f                   	pop    %edi
 7e6:	5d                   	pop    %ebp
 7e7:	c3                   	ret    
 7e8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7eb:	eb ee                	jmp    7db <printint+0x79>

000007ed <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7ed:	55                   	push   %ebp
 7ee:	89 e5                	mov    %esp,%ebp
 7f0:	57                   	push   %edi
 7f1:	56                   	push   %esi
 7f2:	53                   	push   %ebx
 7f3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7f6:	8d 45 10             	lea    0x10(%ebp),%eax
 7f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7fc:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 801:	bb 00 00 00 00       	mov    $0x0,%ebx
 806:	eb 14                	jmp    81c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 808:	89 fa                	mov    %edi,%edx
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	e8 36 ff ff ff       	call   748 <putc>
 812:	eb 05                	jmp    819 <printf+0x2c>
      }
    } else if(state == '%'){
 814:	83 fe 25             	cmp    $0x25,%esi
 817:	74 25                	je     83e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 819:	83 c3 01             	add    $0x1,%ebx
 81c:	8b 45 0c             	mov    0xc(%ebp),%eax
 81f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 823:	84 c0                	test   %al,%al
 825:	0f 84 20 01 00 00    	je     94b <printf+0x15e>
    c = fmt[i] & 0xff;
 82b:	0f be f8             	movsbl %al,%edi
 82e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 831:	85 f6                	test   %esi,%esi
 833:	75 df                	jne    814 <printf+0x27>
      if(c == '%'){
 835:	83 f8 25             	cmp    $0x25,%eax
 838:	75 ce                	jne    808 <printf+0x1b>
        state = '%';
 83a:	89 c6                	mov    %eax,%esi
 83c:	eb db                	jmp    819 <printf+0x2c>
      if(c == 'd'){
 83e:	83 f8 25             	cmp    $0x25,%eax
 841:	0f 84 cf 00 00 00    	je     916 <printf+0x129>
 847:	0f 8c dd 00 00 00    	jl     92a <printf+0x13d>
 84d:	83 f8 78             	cmp    $0x78,%eax
 850:	0f 8f d4 00 00 00    	jg     92a <printf+0x13d>
 856:	83 f8 63             	cmp    $0x63,%eax
 859:	0f 8c cb 00 00 00    	jl     92a <printf+0x13d>
 85f:	83 e8 63             	sub    $0x63,%eax
 862:	83 f8 15             	cmp    $0x15,%eax
 865:	0f 87 bf 00 00 00    	ja     92a <printf+0x13d>
 86b:	ff 24 85 3c 0b 00 00 	jmp    *0xb3c(,%eax,4)
        printint(fd, *ap, 10, 1);
 872:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 875:	8b 17                	mov    (%edi),%edx
 877:	83 ec 0c             	sub    $0xc,%esp
 87a:	6a 01                	push   $0x1
 87c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	e8 d9 fe ff ff       	call   762 <printint>
        ap++;
 889:	83 c7 04             	add    $0x4,%edi
 88c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 88f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 892:	be 00 00 00 00       	mov    $0x0,%esi
 897:	eb 80                	jmp    819 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 899:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 89c:	8b 17                	mov    (%edi),%edx
 89e:	83 ec 0c             	sub    $0xc,%esp
 8a1:	6a 00                	push   $0x0
 8a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8a8:	8b 45 08             	mov    0x8(%ebp),%eax
 8ab:	e8 b2 fe ff ff       	call   762 <printint>
        ap++;
 8b0:	83 c7 04             	add    $0x4,%edi
 8b3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8b9:	be 00 00 00 00       	mov    $0x0,%esi
 8be:	e9 56 ff ff ff       	jmp    819 <printf+0x2c>
        s = (char*)*ap;
 8c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c6:	8b 30                	mov    (%eax),%esi
        ap++;
 8c8:	83 c0 04             	add    $0x4,%eax
 8cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8ce:	85 f6                	test   %esi,%esi
 8d0:	75 15                	jne    8e7 <printf+0xfa>
          s = "(null)";
 8d2:	be 34 0b 00 00       	mov    $0xb34,%esi
 8d7:	eb 0e                	jmp    8e7 <printf+0xfa>
          putc(fd, *s);
 8d9:	0f be d2             	movsbl %dl,%edx
 8dc:	8b 45 08             	mov    0x8(%ebp),%eax
 8df:	e8 64 fe ff ff       	call   748 <putc>
          s++;
 8e4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8e7:	0f b6 16             	movzbl (%esi),%edx
 8ea:	84 d2                	test   %dl,%dl
 8ec:	75 eb                	jne    8d9 <printf+0xec>
      state = 0;
 8ee:	be 00 00 00 00       	mov    $0x0,%esi
 8f3:	e9 21 ff ff ff       	jmp    819 <printf+0x2c>
        putc(fd, *ap);
 8f8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8fb:	0f be 17             	movsbl (%edi),%edx
 8fe:	8b 45 08             	mov    0x8(%ebp),%eax
 901:	e8 42 fe ff ff       	call   748 <putc>
        ap++;
 906:	83 c7 04             	add    $0x4,%edi
 909:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 90c:	be 00 00 00 00       	mov    $0x0,%esi
 911:	e9 03 ff ff ff       	jmp    819 <printf+0x2c>
        putc(fd, c);
 916:	89 fa                	mov    %edi,%edx
 918:	8b 45 08             	mov    0x8(%ebp),%eax
 91b:	e8 28 fe ff ff       	call   748 <putc>
      state = 0;
 920:	be 00 00 00 00       	mov    $0x0,%esi
 925:	e9 ef fe ff ff       	jmp    819 <printf+0x2c>
        putc(fd, '%');
 92a:	ba 25 00 00 00       	mov    $0x25,%edx
 92f:	8b 45 08             	mov    0x8(%ebp),%eax
 932:	e8 11 fe ff ff       	call   748 <putc>
        putc(fd, c);
 937:	89 fa                	mov    %edi,%edx
 939:	8b 45 08             	mov    0x8(%ebp),%eax
 93c:	e8 07 fe ff ff       	call   748 <putc>
      state = 0;
 941:	be 00 00 00 00       	mov    $0x0,%esi
 946:	e9 ce fe ff ff       	jmp    819 <printf+0x2c>
    }
  }
}
 94b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 94e:	5b                   	pop    %ebx
 94f:	5e                   	pop    %esi
 950:	5f                   	pop    %edi
 951:	5d                   	pop    %ebp
 952:	c3                   	ret    

00000953 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 953:	55                   	push   %ebp
 954:	89 e5                	mov    %esp,%ebp
 956:	57                   	push   %edi
 957:	56                   	push   %esi
 958:	53                   	push   %ebx
 959:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 95c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95f:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 964:	eb 02                	jmp    968 <free+0x15>
 966:	89 d0                	mov    %edx,%eax
 968:	39 c8                	cmp    %ecx,%eax
 96a:	73 04                	jae    970 <free+0x1d>
 96c:	39 08                	cmp    %ecx,(%eax)
 96e:	77 12                	ja     982 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 970:	8b 10                	mov    (%eax),%edx
 972:	39 c2                	cmp    %eax,%edx
 974:	77 f0                	ja     966 <free+0x13>
 976:	39 c8                	cmp    %ecx,%eax
 978:	72 08                	jb     982 <free+0x2f>
 97a:	39 ca                	cmp    %ecx,%edx
 97c:	77 04                	ja     982 <free+0x2f>
 97e:	89 d0                	mov    %edx,%eax
 980:	eb e6                	jmp    968 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 982:	8b 73 fc             	mov    -0x4(%ebx),%esi
 985:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 988:	8b 10                	mov    (%eax),%edx
 98a:	39 d7                	cmp    %edx,%edi
 98c:	74 19                	je     9a7 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 98e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 991:	8b 50 04             	mov    0x4(%eax),%edx
 994:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 997:	39 ce                	cmp    %ecx,%esi
 999:	74 1b                	je     9b6 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 99b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 99d:	a3 2c 0f 00 00       	mov    %eax,0xf2c
}
 9a2:	5b                   	pop    %ebx
 9a3:	5e                   	pop    %esi
 9a4:	5f                   	pop    %edi
 9a5:	5d                   	pop    %ebp
 9a6:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9a7:	03 72 04             	add    0x4(%edx),%esi
 9aa:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9ad:	8b 10                	mov    (%eax),%edx
 9af:	8b 12                	mov    (%edx),%edx
 9b1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9b4:	eb db                	jmp    991 <free+0x3e>
    p->s.size += bp->s.size;
 9b6:	03 53 fc             	add    -0x4(%ebx),%edx
 9b9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9bc:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9bf:	89 10                	mov    %edx,(%eax)
 9c1:	eb da                	jmp    99d <free+0x4a>

000009c3 <morecore>:

static Header*
morecore(uint nu)
{
 9c3:	55                   	push   %ebp
 9c4:	89 e5                	mov    %esp,%ebp
 9c6:	53                   	push   %ebx
 9c7:	83 ec 04             	sub    $0x4,%esp
 9ca:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9cc:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9d1:	77 05                	ja     9d8 <morecore+0x15>
    nu = 4096;
 9d3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9d8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9df:	83 ec 0c             	sub    $0xc,%esp
 9e2:	50                   	push   %eax
 9e3:	e8 38 fd ff ff       	call   720 <sbrk>
  if(p == (char*)-1)
 9e8:	83 c4 10             	add    $0x10,%esp
 9eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ee:	74 1c                	je     a0c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9f0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9f3:	83 c0 08             	add    $0x8,%eax
 9f6:	83 ec 0c             	sub    $0xc,%esp
 9f9:	50                   	push   %eax
 9fa:	e8 54 ff ff ff       	call   953 <free>
  return freep;
 9ff:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 a04:	83 c4 10             	add    $0x10,%esp
}
 a07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a0a:	c9                   	leave  
 a0b:	c3                   	ret    
    return 0;
 a0c:	b8 00 00 00 00       	mov    $0x0,%eax
 a11:	eb f4                	jmp    a07 <morecore+0x44>

00000a13 <malloc>:

void*
malloc(uint nbytes)
{
 a13:	55                   	push   %ebp
 a14:	89 e5                	mov    %esp,%ebp
 a16:	53                   	push   %ebx
 a17:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a1a:	8b 45 08             	mov    0x8(%ebp),%eax
 a1d:	8d 58 07             	lea    0x7(%eax),%ebx
 a20:	c1 eb 03             	shr    $0x3,%ebx
 a23:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a26:	8b 0d 2c 0f 00 00    	mov    0xf2c,%ecx
 a2c:	85 c9                	test   %ecx,%ecx
 a2e:	74 04                	je     a34 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a30:	8b 01                	mov    (%ecx),%eax
 a32:	eb 4a                	jmp    a7e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a34:	c7 05 2c 0f 00 00 30 	movl   $0xf30,0xf2c
 a3b:	0f 00 00 
 a3e:	c7 05 30 0f 00 00 30 	movl   $0xf30,0xf30
 a45:	0f 00 00 
    base.s.size = 0;
 a48:	c7 05 34 0f 00 00 00 	movl   $0x0,0xf34
 a4f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a52:	b9 30 0f 00 00       	mov    $0xf30,%ecx
 a57:	eb d7                	jmp    a30 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a59:	74 19                	je     a74 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a5b:	29 da                	sub    %ebx,%edx
 a5d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a60:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a63:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a66:	89 0d 2c 0f 00 00    	mov    %ecx,0xf2c
      return (void*)(p + 1);
 a6c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a6f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a72:	c9                   	leave  
 a73:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a74:	8b 10                	mov    (%eax),%edx
 a76:	89 11                	mov    %edx,(%ecx)
 a78:	eb ec                	jmp    a66 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a7a:	89 c1                	mov    %eax,%ecx
 a7c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a7e:	8b 50 04             	mov    0x4(%eax),%edx
 a81:	39 da                	cmp    %ebx,%edx
 a83:	73 d4                	jae    a59 <malloc+0x46>
    if(p == freep)
 a85:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
 a8b:	75 ed                	jne    a7a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a8d:	89 d8                	mov    %ebx,%eax
 a8f:	e8 2f ff ff ff       	call   9c3 <morecore>
 a94:	85 c0                	test   %eax,%eax
 a96:	75 e2                	jne    a7a <malloc+0x67>
 a98:	eb d5                	jmp    a6f <malloc+0x5c>
