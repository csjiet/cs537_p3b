
_test_19:     file format elf32-i386


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
   assert(arg1_int == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <nested_worker+0x30>
   assert(arg2_int == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <nested_worker+0x79>
   assert(global == 2);
  18:	a1 a4 0f 00 00       	mov    0xfa4,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 a4 0f 00 00       	mov    %eax,0xfa4
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 bc 0a 00 00       	push   $0xabc
  37:	68 c6 0a 00 00       	push   $0xac6
  3c:	6a 01                	push   $0x1
  3e:	e8 cb 07 00 00       	call   80e <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 ce 0a 00 00       	push   $0xace
  4b:	68 dd 0a 00 00       	push   $0xadd
  50:	6a 01                	push   $0x1
  52:	e8 b7 07 00 00       	call   80e <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 f1 0a 00 00       	push   $0xaf1
  5f:	6a 01                	push   $0x1
  61:	e8 a8 07 00 00       	call   80e <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 a8 0f 00 00    	push   0xfa8
  6f:	e8 75 06 00 00       	call   6e9 <kill>
  74:	e8 40 06 00 00       	call   6b9 <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 bc 0a 00 00       	push   $0xabc
  80:	68 c6 0a 00 00       	push   $0xac6
  85:	6a 01                	push   $0x1
  87:	e8 82 07 00 00       	call   80e <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 fe 0a 00 00       	push   $0xafe
  94:	68 dd 0a 00 00       	push   $0xadd
  99:	6a 01                	push   $0x1
  9b:	e8 6e 07 00 00       	call   80e <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 f1 0a 00 00       	push   $0xaf1
  a8:	6a 01                	push   $0x1
  aa:	e8 5f 07 00 00       	call   80e <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 a8 0f 00 00    	push   0xfa8
  b8:	e8 2c 06 00 00       	call   6e9 <kill>
  bd:	e8 f7 05 00 00       	call   6b9 <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 bc 0a 00 00       	push   $0xabc
  c9:	68 c6 0a 00 00       	push   $0xac6
  ce:	6a 01                	push   $0x1
  d0:	e8 39 07 00 00       	call   80e <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 0d 0b 00 00       	push   $0xb0d
  dd:	68 dd 0a 00 00       	push   $0xadd
  e2:	6a 01                	push   $0x1
  e4:	e8 25 07 00 00       	call   80e <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 f1 0a 00 00       	push   $0xaf1
  f1:	6a 01                	push   $0x1
  f3:	e8 16 07 00 00       	call   80e <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 a8 0f 00 00    	push   0xfa8
 101:	e8 e3 05 00 00       	call   6e9 <kill>
 106:	e8 ae 05 00 00       	call   6b9 <exit>

0000010b <worker>:

void
worker(void *arg1, void *arg2) {
 10b:	55                   	push   %ebp
 10c:	89 e5                	mov    %esp,%ebp
 10e:	53                   	push   %ebx
 10f:	83 ec 14             	sub    $0x14,%esp
   int tmp1 = *(int*)arg1;
 112:	8b 45 08             	mov    0x8(%ebp),%eax
 115:	8b 00                	mov    (%eax),%eax
 117:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int tmp2 = *(int*)arg2;
 11a:	8b 55 0c             	mov    0xc(%ebp),%edx
 11d:	8b 12                	mov    (%edx),%edx
 11f:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(tmp1 == 42);
 122:	83 f8 2a             	cmp    $0x2a,%eax
 125:	75 60                	jne    187 <worker+0x7c>
   assert(tmp2 == 24);
 127:	83 fa 18             	cmp    $0x18,%edx
 12a:	0f 85 a0 00 00 00    	jne    1d0 <worker+0xc5>
   assert(global == 1);
 130:	a1 a4 0f 00 00       	mov    0xfa4,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 bc 0a 00 00       	push   $0xabc
 145:	68 c6 0a 00 00       	push   $0xac6
 14a:	6a 01                	push   $0x1
 14c:	e8 bd 06 00 00       	call   80e <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 2f 0b 00 00       	push   $0xb2f
 159:	68 dd 0a 00 00       	push   $0xadd
 15e:	6a 01                	push   $0x1
 160:	e8 a9 06 00 00       	call   80e <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 f1 0a 00 00       	push   $0xaf1
 16d:	6a 01                	push   $0x1
 16f:	e8 9a 06 00 00       	call   80e <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 a8 0f 00 00    	push   0xfa8
 17d:	e8 67 05 00 00       	call   6e9 <kill>
 182:	e8 32 05 00 00       	call   6b9 <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 bc 0a 00 00       	push   $0xabc
 18e:	68 c6 0a 00 00       	push   $0xac6
 193:	6a 01                	push   $0x1
 195:	e8 74 06 00 00       	call   80e <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 19 0b 00 00       	push   $0xb19
 1a2:	68 dd 0a 00 00       	push   $0xadd
 1a7:	6a 01                	push   $0x1
 1a9:	e8 60 06 00 00       	call   80e <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 f1 0a 00 00       	push   $0xaf1
 1b6:	6a 01                	push   $0x1
 1b8:	e8 51 06 00 00       	call   80e <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 a8 0f 00 00    	push   0xfa8
 1c6:	e8 1e 05 00 00       	call   6e9 <kill>
 1cb:	e8 e9 04 00 00       	call   6b9 <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 bc 0a 00 00       	push   $0xabc
 1d7:	68 c6 0a 00 00       	push   $0xac6
 1dc:	6a 01                	push   $0x1
 1de:	e8 2b 06 00 00       	call   80e <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 24 0b 00 00       	push   $0xb24
 1eb:	68 dd 0a 00 00       	push   $0xadd
 1f0:	6a 01                	push   $0x1
 1f2:	e8 17 06 00 00       	call   80e <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 f1 0a 00 00       	push   $0xaf1
 1ff:	6a 01                	push   $0x1
 201:	e8 08 06 00 00       	call   80e <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 a8 0f 00 00    	push   0xfa8
 20f:	e8 d5 04 00 00       	call   6e9 <kill>
 214:	e8 a0 04 00 00       	call   6b9 <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 a4 0f 00 00       	mov    %eax,0xfa4

   int nested_thread_pid = thread_create(nested_worker, &tmp1, &tmp2);
 221:	83 ec 04             	sub    $0x4,%esp
 224:	8d 45 f0             	lea    -0x10(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 45 f4             	lea    -0xc(%ebp),%eax
 22b:	50                   	push   %eax
 22c:	68 00 00 00 00       	push   $0x0
 231:	e8 f3 03 00 00       	call   629 <thread_create>
 236:	89 c3                	mov    %eax,%ebx
   assert(nested_thread_pid > 0);
 238:	83 c4 10             	add    $0x10,%esp
 23b:	85 c0                	test   %eax,%eax
 23d:	7e 07                	jle    246 <worker+0x13b>
   for(int j=0;j<10000;j++);
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
 244:	eb 4c                	jmp    292 <worker+0x187>
   assert(nested_thread_pid > 0);
 246:	6a 3c                	push   $0x3c
 248:	68 bc 0a 00 00       	push   $0xabc
 24d:	68 c6 0a 00 00       	push   $0xac6
 252:	6a 01                	push   $0x1
 254:	e8 b5 05 00 00       	call   80e <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 3b 0b 00 00       	push   $0xb3b
 261:	68 dd 0a 00 00       	push   $0xadd
 266:	6a 01                	push   $0x1
 268:	e8 a1 05 00 00       	call   80e <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 f1 0a 00 00       	push   $0xaf1
 275:	6a 01                	push   $0x1
 277:	e8 92 05 00 00       	call   80e <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 a8 0f 00 00    	push   0xfa8
 285:	e8 5f 04 00 00       	call   6e9 <kill>
 28a:	e8 2a 04 00 00       	call   6b9 <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 ac 03 00 00       	call   64a <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 bc 0a 00 00       	push   $0xabc
 2b1:	68 c6 0a 00 00       	push   $0xac6
 2b6:	6a 01                	push   $0x1
 2b8:	e8 51 05 00 00       	call   80e <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 94 0b 00 00       	push   $0xb94
 2c5:	68 dd 0a 00 00       	push   $0xadd
 2ca:	6a 01                	push   $0x1
 2cc:	e8 3d 05 00 00       	call   80e <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 f1 0a 00 00       	push   $0xaf1
 2d9:	6a 01                	push   $0x1
 2db:	e8 2e 05 00 00       	call   80e <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 a8 0f 00 00    	push   0xfa8
 2e9:	e8 fb 03 00 00       	call   6e9 <kill>
 2ee:	e8 c6 03 00 00       	call   6b9 <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 bc 0a 00 00       	push   $0xabc
 2fa:	68 c6 0a 00 00       	push   $0xac6
 2ff:	6a 01                	push   $0x1
 301:	e8 08 05 00 00       	call   80e <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 51 0b 00 00       	push   $0xb51
 30e:	68 dd 0a 00 00       	push   $0xadd
 313:	6a 01                	push   $0x1
 315:	e8 f4 04 00 00       	call   80e <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 f1 0a 00 00       	push   $0xaf1
 322:	6a 01                	push   $0x1
 324:	e8 e5 04 00 00       	call   80e <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 a8 0f 00 00    	push   0xfa8
 332:	e8 b2 03 00 00       	call   6e9 <kill>
 337:	e8 7d 03 00 00       	call   6b9 <exit>
   exit();
 33c:	e8 78 03 00 00       	call   6b9 <exit>

00000341 <main>:
{
 341:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 345:	83 e4 f0             	and    $0xfffffff0,%esp
 348:	ff 71 fc             	push   -0x4(%ecx)
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	51                   	push   %ecx
 350:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 353:	e8 e1 03 00 00       	call   739 <getpid>
 358:	a3 a8 0f 00 00       	mov    %eax,0xfa8
   int arg1 = 42, arg2 = 24;
 35d:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 364:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 36b:	83 ec 04             	sub    $0x4,%esp
 36e:	8d 45 f0             	lea    -0x10(%ebp),%eax
 371:	50                   	push   %eax
 372:	8d 45 f4             	lea    -0xc(%ebp),%eax
 375:	50                   	push   %eax
 376:	68 0b 01 00 00       	push   $0x10b
 37b:	e8 a9 02 00 00       	call   629 <thread_create>
   assert(thread_pid > 0);
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	7e 65                	jle    3ec <main+0xab>
 387:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 389:	e8 bc 02 00 00       	call   64a <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d a4 0f 00 00 03 	cmpl   $0x3,0xfa4
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 bc 0a 00 00       	push   $0xabc
 3aa:	68 c6 0a 00 00       	push   $0xac6
 3af:	6a 01                	push   $0x1
 3b1:	e8 58 04 00 00       	call   80e <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 78 0b 00 00       	push   $0xb78
 3be:	68 dd 0a 00 00       	push   $0xadd
 3c3:	6a 01                	push   $0x1
 3c5:	e8 44 04 00 00       	call   80e <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 f1 0a 00 00       	push   $0xaf1
 3d2:	6a 01                	push   $0x1
 3d4:	e8 35 04 00 00       	call   80e <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 a8 0f 00 00    	push   0xfa8
 3e2:	e8 02 03 00 00       	call   6e9 <kill>
 3e7:	e8 cd 02 00 00       	call   6b9 <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 bc 0a 00 00       	push   $0xabc
 3f3:	68 c6 0a 00 00       	push   $0xac6
 3f8:	6a 01                	push   $0x1
 3fa:	e8 0f 04 00 00       	call   80e <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 42 0b 00 00       	push   $0xb42
 407:	68 dd 0a 00 00       	push   $0xadd
 40c:	6a 01                	push   $0x1
 40e:	e8 fb 03 00 00       	call   80e <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 f1 0a 00 00       	push   $0xaf1
 41b:	6a 01                	push   $0x1
 41d:	e8 ec 03 00 00       	call   80e <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 a8 0f 00 00    	push   0xfa8
 42b:	e8 b9 02 00 00       	call   6e9 <kill>
 430:	e8 84 02 00 00       	call   6b9 <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 bc 0a 00 00       	push   $0xabc
 43c:	68 c6 0a 00 00       	push   $0xac6
 441:	6a 01                	push   $0x1
 443:	e8 c6 03 00 00       	call   80e <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 61 0b 00 00       	push   $0xb61
 450:	68 dd 0a 00 00       	push   $0xadd
 455:	6a 01                	push   $0x1
 457:	e8 b2 03 00 00       	call   80e <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 f1 0a 00 00       	push   $0xaf1
 464:	6a 01                	push   $0x1
 466:	e8 a3 03 00 00       	call   80e <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 a8 0f 00 00    	push   0xfa8
 474:	e8 70 02 00 00       	call   6e9 <kill>
 479:	e8 3b 02 00 00       	call   6b9 <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 84 0b 00 00       	push   $0xb84
 486:	6a 01                	push   $0x1
 488:	e8 81 03 00 00       	call   80e <printf>
   exit();
 48d:	e8 27 02 00 00       	call   6b9 <exit>

00000492 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	56                   	push   %esi
 496:	53                   	push   %ebx
 497:	8b 75 08             	mov    0x8(%ebp),%esi
 49a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 49d:	89 f0                	mov    %esi,%eax
 49f:	89 d1                	mov    %edx,%ecx
 4a1:	83 c2 01             	add    $0x1,%edx
 4a4:	89 c3                	mov    %eax,%ebx
 4a6:	83 c0 01             	add    $0x1,%eax
 4a9:	0f b6 09             	movzbl (%ecx),%ecx
 4ac:	88 0b                	mov    %cl,(%ebx)
 4ae:	84 c9                	test   %cl,%cl
 4b0:	75 ed                	jne    49f <strcpy+0xd>
    ;
  return os;
}
 4b2:	89 f0                	mov    %esi,%eax
 4b4:	5b                   	pop    %ebx
 4b5:	5e                   	pop    %esi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    

000004b8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
 4bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4be:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4c1:	eb 06                	jmp    4c9 <strcmp+0x11>
    p++, q++;
 4c3:	83 c1 01             	add    $0x1,%ecx
 4c6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4c9:	0f b6 01             	movzbl (%ecx),%eax
 4cc:	84 c0                	test   %al,%al
 4ce:	74 04                	je     4d4 <strcmp+0x1c>
 4d0:	3a 02                	cmp    (%edx),%al
 4d2:	74 ef                	je     4c3 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4d4:	0f b6 c0             	movzbl %al,%eax
 4d7:	0f b6 12             	movzbl (%edx),%edx
 4da:	29 d0                	sub    %edx,%eax
}
 4dc:	5d                   	pop    %ebp
 4dd:	c3                   	ret    

000004de <strlen>:

uint
strlen(const char *s)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4e4:	b8 00 00 00 00       	mov    $0x0,%eax
 4e9:	eb 03                	jmp    4ee <strlen+0x10>
 4eb:	83 c0 01             	add    $0x1,%eax
 4ee:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4f2:	75 f7                	jne    4eb <strlen+0xd>
    ;
  return n;
}
 4f4:	5d                   	pop    %ebp
 4f5:	c3                   	ret    

000004f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4f6:	55                   	push   %ebp
 4f7:	89 e5                	mov    %esp,%ebp
 4f9:	57                   	push   %edi
 4fa:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4fd:	89 d7                	mov    %edx,%edi
 4ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	fc                   	cld    
 506:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 508:	89 d0                	mov    %edx,%eax
 50a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 50d:	c9                   	leave  
 50e:	c3                   	ret    

0000050f <strchr>:

char*
strchr(const char *s, char c)
{
 50f:	55                   	push   %ebp
 510:	89 e5                	mov    %esp,%ebp
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 519:	eb 03                	jmp    51e <strchr+0xf>
 51b:	83 c0 01             	add    $0x1,%eax
 51e:	0f b6 10             	movzbl (%eax),%edx
 521:	84 d2                	test   %dl,%dl
 523:	74 06                	je     52b <strchr+0x1c>
    if(*s == c)
 525:	38 ca                	cmp    %cl,%dl
 527:	75 f2                	jne    51b <strchr+0xc>
 529:	eb 05                	jmp    530 <strchr+0x21>
      return (char*)s;
  return 0;
 52b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    

00000532 <gets>:

char*
gets(char *buf, int max)
{
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	57                   	push   %edi
 536:	56                   	push   %esi
 537:	53                   	push   %ebx
 538:	83 ec 1c             	sub    $0x1c,%esp
 53b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 53e:	bb 00 00 00 00       	mov    $0x0,%ebx
 543:	89 de                	mov    %ebx,%esi
 545:	83 c3 01             	add    $0x1,%ebx
 548:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 54b:	7d 2e                	jge    57b <gets+0x49>
    cc = read(0, &c, 1);
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	6a 01                	push   $0x1
 552:	8d 45 e7             	lea    -0x19(%ebp),%eax
 555:	50                   	push   %eax
 556:	6a 00                	push   $0x0
 558:	e8 74 01 00 00       	call   6d1 <read>
    if(cc < 1)
 55d:	83 c4 10             	add    $0x10,%esp
 560:	85 c0                	test   %eax,%eax
 562:	7e 17                	jle    57b <gets+0x49>
      break;
    buf[i++] = c;
 564:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 568:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 56b:	3c 0a                	cmp    $0xa,%al
 56d:	0f 94 c2             	sete   %dl
 570:	3c 0d                	cmp    $0xd,%al
 572:	0f 94 c0             	sete   %al
 575:	08 c2                	or     %al,%dl
 577:	74 ca                	je     543 <gets+0x11>
    buf[i++] = c;
 579:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 57b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 57f:	89 f8                	mov    %edi,%eax
 581:	8d 65 f4             	lea    -0xc(%ebp),%esp
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5f                   	pop    %edi
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    

00000589 <stat>:

int
stat(const char *n, struct stat *st)
{
 589:	55                   	push   %ebp
 58a:	89 e5                	mov    %esp,%ebp
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 58e:	83 ec 08             	sub    $0x8,%esp
 591:	6a 00                	push   $0x0
 593:	ff 75 08             	push   0x8(%ebp)
 596:	e8 5e 01 00 00       	call   6f9 <open>
  if(fd < 0)
 59b:	83 c4 10             	add    $0x10,%esp
 59e:	85 c0                	test   %eax,%eax
 5a0:	78 24                	js     5c6 <stat+0x3d>
 5a2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5a4:	83 ec 08             	sub    $0x8,%esp
 5a7:	ff 75 0c             	push   0xc(%ebp)
 5aa:	50                   	push   %eax
 5ab:	e8 61 01 00 00       	call   711 <fstat>
 5b0:	89 c6                	mov    %eax,%esi
  close(fd);
 5b2:	89 1c 24             	mov    %ebx,(%esp)
 5b5:	e8 27 01 00 00       	call   6e1 <close>
  return r;
 5ba:	83 c4 10             	add    $0x10,%esp
}
 5bd:	89 f0                	mov    %esi,%eax
 5bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5c2:	5b                   	pop    %ebx
 5c3:	5e                   	pop    %esi
 5c4:	5d                   	pop    %ebp
 5c5:	c3                   	ret    
    return -1;
 5c6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5cb:	eb f0                	jmp    5bd <stat+0x34>

000005cd <atoi>:

int
atoi(const char *s)
{
 5cd:	55                   	push   %ebp
 5ce:	89 e5                	mov    %esp,%ebp
 5d0:	53                   	push   %ebx
 5d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5d4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5d9:	eb 10                	jmp    5eb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5db:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5de:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5e1:	83 c1 01             	add    $0x1,%ecx
 5e4:	0f be c0             	movsbl %al,%eax
 5e7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5eb:	0f b6 01             	movzbl (%ecx),%eax
 5ee:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f1:	80 fb 09             	cmp    $0x9,%bl
 5f4:	76 e5                	jbe    5db <atoi+0xe>
  return n;
}
 5f6:	89 d0                	mov    %edx,%eax
 5f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5fb:	c9                   	leave  
 5fc:	c3                   	ret    

000005fd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	56                   	push   %esi
 601:	53                   	push   %ebx
 602:	8b 75 08             	mov    0x8(%ebp),%esi
 605:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 608:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 60b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 60d:	eb 0d                	jmp    61c <memmove+0x1f>
    *dst++ = *src++;
 60f:	0f b6 01             	movzbl (%ecx),%eax
 612:	88 02                	mov    %al,(%edx)
 614:	8d 49 01             	lea    0x1(%ecx),%ecx
 617:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 61a:	89 d8                	mov    %ebx,%eax
 61c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 61f:	85 c0                	test   %eax,%eax
 621:	7f ec                	jg     60f <memmove+0x12>
  return vdst;
}
 623:	89 f0                	mov    %esi,%eax
 625:	5b                   	pop    %ebx
 626:	5e                   	pop    %esi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    

00000629 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 629:	55                   	push   %ebp
 62a:	89 e5                	mov    %esp,%ebp
 62c:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 62f:	68 00 10 00 00       	push   $0x1000
 634:	e8 fb 03 00 00       	call   a34 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 639:	50                   	push   %eax
 63a:	ff 75 10             	push   0x10(%ebp)
 63d:	ff 75 0c             	push   0xc(%ebp)
 640:	ff 75 08             	push   0x8(%ebp)
 643:	e8 11 01 00 00       	call   759 <clone>
}
 648:	c9                   	leave  
 649:	c3                   	ret    

0000064a <thread_join>:

int thread_join(){
 64a:	55                   	push   %ebp
 64b:	89 e5                	mov    %esp,%ebp
 64d:	53                   	push   %ebx
 64e:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 651:	8d 45 f4             	lea    -0xc(%ebp),%eax
 654:	50                   	push   %eax
 655:	e8 07 01 00 00       	call   761 <join>
  if (x < 0) {
 65a:	83 c4 10             	add    $0x10,%esp
 65d:	85 c0                	test   %eax,%eax
 65f:	78 17                	js     678 <thread_join+0x2e>
 661:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 663:	83 ec 0c             	sub    $0xc,%esp
 666:	ff 75 f4             	push   -0xc(%ebp)
 669:	e8 06 03 00 00       	call   974 <free>
  return x;
 66e:	83 c4 10             	add    $0x10,%esp
}
 671:	89 d8                	mov    %ebx,%eax
 673:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 676:	c9                   	leave  
 677:	c3                   	ret    
    return -1;
 678:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 67d:	eb f2                	jmp    671 <thread_join+0x27>

0000067f <lock_init>:

void lock_init(lock_t *spin){
 67f:	55                   	push   %ebp
 680:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 682:	8b 45 08             	mov    0x8(%ebp),%eax
 685:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    

0000068d <lock_acquire>:

void lock_acquire(lock_t *spin){
 68d:	55                   	push   %ebp
 68e:	89 e5                	mov    %esp,%ebp
 690:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 693:	b8 01 00 00 00       	mov    $0x1,%eax
 698:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 69b:	85 c0                	test   %eax,%eax
 69d:	75 f4                	jne    693 <lock_acquire+0x6>

}
 69f:	5d                   	pop    %ebp
 6a0:	c3                   	ret    

000006a1 <lock_release>:

void lock_release(lock_t *spin){
 6a1:	55                   	push   %ebp
 6a2:	89 e5                	mov    %esp,%ebp
 6a4:	8b 55 08             	mov    0x8(%ebp),%edx
 6a7:	b8 00 00 00 00       	mov    $0x0,%eax
 6ac:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 6af:	5d                   	pop    %ebp
 6b0:	c3                   	ret    

000006b1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6b1:	b8 01 00 00 00       	mov    $0x1,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <exit>:
SYSCALL(exit)
 6b9:	b8 02 00 00 00       	mov    $0x2,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <wait>:
SYSCALL(wait)
 6c1:	b8 03 00 00 00       	mov    $0x3,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <pipe>:
SYSCALL(pipe)
 6c9:	b8 04 00 00 00       	mov    $0x4,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <read>:
SYSCALL(read)
 6d1:	b8 05 00 00 00       	mov    $0x5,%eax
 6d6:	cd 40                	int    $0x40
 6d8:	c3                   	ret    

000006d9 <write>:
SYSCALL(write)
 6d9:	b8 10 00 00 00       	mov    $0x10,%eax
 6de:	cd 40                	int    $0x40
 6e0:	c3                   	ret    

000006e1 <close>:
SYSCALL(close)
 6e1:	b8 15 00 00 00       	mov    $0x15,%eax
 6e6:	cd 40                	int    $0x40
 6e8:	c3                   	ret    

000006e9 <kill>:
SYSCALL(kill)
 6e9:	b8 06 00 00 00       	mov    $0x6,%eax
 6ee:	cd 40                	int    $0x40
 6f0:	c3                   	ret    

000006f1 <exec>:
SYSCALL(exec)
 6f1:	b8 07 00 00 00       	mov    $0x7,%eax
 6f6:	cd 40                	int    $0x40
 6f8:	c3                   	ret    

000006f9 <open>:
SYSCALL(open)
 6f9:	b8 0f 00 00 00       	mov    $0xf,%eax
 6fe:	cd 40                	int    $0x40
 700:	c3                   	ret    

00000701 <mknod>:
SYSCALL(mknod)
 701:	b8 11 00 00 00       	mov    $0x11,%eax
 706:	cd 40                	int    $0x40
 708:	c3                   	ret    

00000709 <unlink>:
SYSCALL(unlink)
 709:	b8 12 00 00 00       	mov    $0x12,%eax
 70e:	cd 40                	int    $0x40
 710:	c3                   	ret    

00000711 <fstat>:
SYSCALL(fstat)
 711:	b8 08 00 00 00       	mov    $0x8,%eax
 716:	cd 40                	int    $0x40
 718:	c3                   	ret    

00000719 <link>:
SYSCALL(link)
 719:	b8 13 00 00 00       	mov    $0x13,%eax
 71e:	cd 40                	int    $0x40
 720:	c3                   	ret    

00000721 <mkdir>:
SYSCALL(mkdir)
 721:	b8 14 00 00 00       	mov    $0x14,%eax
 726:	cd 40                	int    $0x40
 728:	c3                   	ret    

00000729 <chdir>:
SYSCALL(chdir)
 729:	b8 09 00 00 00       	mov    $0x9,%eax
 72e:	cd 40                	int    $0x40
 730:	c3                   	ret    

00000731 <dup>:
SYSCALL(dup)
 731:	b8 0a 00 00 00       	mov    $0xa,%eax
 736:	cd 40                	int    $0x40
 738:	c3                   	ret    

00000739 <getpid>:
SYSCALL(getpid)
 739:	b8 0b 00 00 00       	mov    $0xb,%eax
 73e:	cd 40                	int    $0x40
 740:	c3                   	ret    

00000741 <sbrk>:
SYSCALL(sbrk)
 741:	b8 0c 00 00 00       	mov    $0xc,%eax
 746:	cd 40                	int    $0x40
 748:	c3                   	ret    

00000749 <sleep>:
SYSCALL(sleep)
 749:	b8 0d 00 00 00       	mov    $0xd,%eax
 74e:	cd 40                	int    $0x40
 750:	c3                   	ret    

00000751 <uptime>:
SYSCALL(uptime)
 751:	b8 0e 00 00 00       	mov    $0xe,%eax
 756:	cd 40                	int    $0x40
 758:	c3                   	ret    

00000759 <clone>:
SYSCALL(clone)
 759:	b8 16 00 00 00       	mov    $0x16,%eax
 75e:	cd 40                	int    $0x40
 760:	c3                   	ret    

00000761 <join>:
 761:	b8 17 00 00 00       	mov    $0x17,%eax
 766:	cd 40                	int    $0x40
 768:	c3                   	ret    

00000769 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 769:	55                   	push   %ebp
 76a:	89 e5                	mov    %esp,%ebp
 76c:	83 ec 1c             	sub    $0x1c,%esp
 76f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 772:	6a 01                	push   $0x1
 774:	8d 55 f4             	lea    -0xc(%ebp),%edx
 777:	52                   	push   %edx
 778:	50                   	push   %eax
 779:	e8 5b ff ff ff       	call   6d9 <write>
}
 77e:	83 c4 10             	add    $0x10,%esp
 781:	c9                   	leave  
 782:	c3                   	ret    

00000783 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 783:	55                   	push   %ebp
 784:	89 e5                	mov    %esp,%ebp
 786:	57                   	push   %edi
 787:	56                   	push   %esi
 788:	53                   	push   %ebx
 789:	83 ec 2c             	sub    $0x2c,%esp
 78c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 78f:	89 d0                	mov    %edx,%eax
 791:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 793:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 797:	0f 95 c1             	setne  %cl
 79a:	c1 ea 1f             	shr    $0x1f,%edx
 79d:	84 d1                	test   %dl,%cl
 79f:	74 44                	je     7e5 <printint+0x62>
    neg = 1;
    x = -xx;
 7a1:	f7 d8                	neg    %eax
 7a3:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7a5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7ac:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7b1:	89 c8                	mov    %ecx,%eax
 7b3:	ba 00 00 00 00       	mov    $0x0,%edx
 7b8:	f7 f6                	div    %esi
 7ba:	89 df                	mov    %ebx,%edi
 7bc:	83 c3 01             	add    $0x1,%ebx
 7bf:	0f b6 92 18 0c 00 00 	movzbl 0xc18(%edx),%edx
 7c6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7ca:	89 ca                	mov    %ecx,%edx
 7cc:	89 c1                	mov    %eax,%ecx
 7ce:	39 d6                	cmp    %edx,%esi
 7d0:	76 df                	jbe    7b1 <printint+0x2e>
  if(neg)
 7d2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7d6:	74 31                	je     809 <printint+0x86>
    buf[i++] = '-';
 7d8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7dd:	8d 5f 02             	lea    0x2(%edi),%ebx
 7e0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7e3:	eb 17                	jmp    7fc <printint+0x79>
    x = xx;
 7e5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7e7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7ee:	eb bc                	jmp    7ac <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7f0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7f5:	89 f0                	mov    %esi,%eax
 7f7:	e8 6d ff ff ff       	call   769 <putc>
  while(--i >= 0)
 7fc:	83 eb 01             	sub    $0x1,%ebx
 7ff:	79 ef                	jns    7f0 <printint+0x6d>
}
 801:	83 c4 2c             	add    $0x2c,%esp
 804:	5b                   	pop    %ebx
 805:	5e                   	pop    %esi
 806:	5f                   	pop    %edi
 807:	5d                   	pop    %ebp
 808:	c3                   	ret    
 809:	8b 75 d0             	mov    -0x30(%ebp),%esi
 80c:	eb ee                	jmp    7fc <printint+0x79>

0000080e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 80e:	55                   	push   %ebp
 80f:	89 e5                	mov    %esp,%ebp
 811:	57                   	push   %edi
 812:	56                   	push   %esi
 813:	53                   	push   %ebx
 814:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 817:	8d 45 10             	lea    0x10(%ebp),%eax
 81a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 81d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 822:	bb 00 00 00 00       	mov    $0x0,%ebx
 827:	eb 14                	jmp    83d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 829:	89 fa                	mov    %edi,%edx
 82b:	8b 45 08             	mov    0x8(%ebp),%eax
 82e:	e8 36 ff ff ff       	call   769 <putc>
 833:	eb 05                	jmp    83a <printf+0x2c>
      }
    } else if(state == '%'){
 835:	83 fe 25             	cmp    $0x25,%esi
 838:	74 25                	je     85f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 83a:	83 c3 01             	add    $0x1,%ebx
 83d:	8b 45 0c             	mov    0xc(%ebp),%eax
 840:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 844:	84 c0                	test   %al,%al
 846:	0f 84 20 01 00 00    	je     96c <printf+0x15e>
    c = fmt[i] & 0xff;
 84c:	0f be f8             	movsbl %al,%edi
 84f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 852:	85 f6                	test   %esi,%esi
 854:	75 df                	jne    835 <printf+0x27>
      if(c == '%'){
 856:	83 f8 25             	cmp    $0x25,%eax
 859:	75 ce                	jne    829 <printf+0x1b>
        state = '%';
 85b:	89 c6                	mov    %eax,%esi
 85d:	eb db                	jmp    83a <printf+0x2c>
      if(c == 'd'){
 85f:	83 f8 25             	cmp    $0x25,%eax
 862:	0f 84 cf 00 00 00    	je     937 <printf+0x129>
 868:	0f 8c dd 00 00 00    	jl     94b <printf+0x13d>
 86e:	83 f8 78             	cmp    $0x78,%eax
 871:	0f 8f d4 00 00 00    	jg     94b <printf+0x13d>
 877:	83 f8 63             	cmp    $0x63,%eax
 87a:	0f 8c cb 00 00 00    	jl     94b <printf+0x13d>
 880:	83 e8 63             	sub    $0x63,%eax
 883:	83 f8 15             	cmp    $0x15,%eax
 886:	0f 87 bf 00 00 00    	ja     94b <printf+0x13d>
 88c:	ff 24 85 c0 0b 00 00 	jmp    *0xbc0(,%eax,4)
        printint(fd, *ap, 10, 1);
 893:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 896:	8b 17                	mov    (%edi),%edx
 898:	83 ec 0c             	sub    $0xc,%esp
 89b:	6a 01                	push   $0x1
 89d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a2:	8b 45 08             	mov    0x8(%ebp),%eax
 8a5:	e8 d9 fe ff ff       	call   783 <printint>
        ap++;
 8aa:	83 c7 04             	add    $0x4,%edi
 8ad:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8b0:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8b3:	be 00 00 00 00       	mov    $0x0,%esi
 8b8:	eb 80                	jmp    83a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8ba:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8bd:	8b 17                	mov    (%edi),%edx
 8bf:	83 ec 0c             	sub    $0xc,%esp
 8c2:	6a 00                	push   $0x0
 8c4:	b9 10 00 00 00       	mov    $0x10,%ecx
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
 8cc:	e8 b2 fe ff ff       	call   783 <printint>
        ap++;
 8d1:	83 c7 04             	add    $0x4,%edi
 8d4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8d7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8da:	be 00 00 00 00       	mov    $0x0,%esi
 8df:	e9 56 ff ff ff       	jmp    83a <printf+0x2c>
        s = (char*)*ap;
 8e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8e7:	8b 30                	mov    (%eax),%esi
        ap++;
 8e9:	83 c0 04             	add    $0x4,%eax
 8ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8ef:	85 f6                	test   %esi,%esi
 8f1:	75 15                	jne    908 <printf+0xfa>
          s = "(null)";
 8f3:	be b9 0b 00 00       	mov    $0xbb9,%esi
 8f8:	eb 0e                	jmp    908 <printf+0xfa>
          putc(fd, *s);
 8fa:	0f be d2             	movsbl %dl,%edx
 8fd:	8b 45 08             	mov    0x8(%ebp),%eax
 900:	e8 64 fe ff ff       	call   769 <putc>
          s++;
 905:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 908:	0f b6 16             	movzbl (%esi),%edx
 90b:	84 d2                	test   %dl,%dl
 90d:	75 eb                	jne    8fa <printf+0xec>
      state = 0;
 90f:	be 00 00 00 00       	mov    $0x0,%esi
 914:	e9 21 ff ff ff       	jmp    83a <printf+0x2c>
        putc(fd, *ap);
 919:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 91c:	0f be 17             	movsbl (%edi),%edx
 91f:	8b 45 08             	mov    0x8(%ebp),%eax
 922:	e8 42 fe ff ff       	call   769 <putc>
        ap++;
 927:	83 c7 04             	add    $0x4,%edi
 92a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 92d:	be 00 00 00 00       	mov    $0x0,%esi
 932:	e9 03 ff ff ff       	jmp    83a <printf+0x2c>
        putc(fd, c);
 937:	89 fa                	mov    %edi,%edx
 939:	8b 45 08             	mov    0x8(%ebp),%eax
 93c:	e8 28 fe ff ff       	call   769 <putc>
      state = 0;
 941:	be 00 00 00 00       	mov    $0x0,%esi
 946:	e9 ef fe ff ff       	jmp    83a <printf+0x2c>
        putc(fd, '%');
 94b:	ba 25 00 00 00       	mov    $0x25,%edx
 950:	8b 45 08             	mov    0x8(%ebp),%eax
 953:	e8 11 fe ff ff       	call   769 <putc>
        putc(fd, c);
 958:	89 fa                	mov    %edi,%edx
 95a:	8b 45 08             	mov    0x8(%ebp),%eax
 95d:	e8 07 fe ff ff       	call   769 <putc>
      state = 0;
 962:	be 00 00 00 00       	mov    $0x0,%esi
 967:	e9 ce fe ff ff       	jmp    83a <printf+0x2c>
    }
  }
}
 96c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 96f:	5b                   	pop    %ebx
 970:	5e                   	pop    %esi
 971:	5f                   	pop    %edi
 972:	5d                   	pop    %ebp
 973:	c3                   	ret    

00000974 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 974:	55                   	push   %ebp
 975:	89 e5                	mov    %esp,%ebp
 977:	57                   	push   %edi
 978:	56                   	push   %esi
 979:	53                   	push   %ebx
 97a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 97d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 980:	a1 ac 0f 00 00       	mov    0xfac,%eax
 985:	eb 02                	jmp    989 <free+0x15>
 987:	89 d0                	mov    %edx,%eax
 989:	39 c8                	cmp    %ecx,%eax
 98b:	73 04                	jae    991 <free+0x1d>
 98d:	39 08                	cmp    %ecx,(%eax)
 98f:	77 12                	ja     9a3 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 991:	8b 10                	mov    (%eax),%edx
 993:	39 c2                	cmp    %eax,%edx
 995:	77 f0                	ja     987 <free+0x13>
 997:	39 c8                	cmp    %ecx,%eax
 999:	72 08                	jb     9a3 <free+0x2f>
 99b:	39 ca                	cmp    %ecx,%edx
 99d:	77 04                	ja     9a3 <free+0x2f>
 99f:	89 d0                	mov    %edx,%eax
 9a1:	eb e6                	jmp    989 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a3:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9a9:	8b 10                	mov    (%eax),%edx
 9ab:	39 d7                	cmp    %edx,%edi
 9ad:	74 19                	je     9c8 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9af:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9b2:	8b 50 04             	mov    0x4(%eax),%edx
 9b5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b8:	39 ce                	cmp    %ecx,%esi
 9ba:	74 1b                	je     9d7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9bc:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9be:	a3 ac 0f 00 00       	mov    %eax,0xfac
}
 9c3:	5b                   	pop    %ebx
 9c4:	5e                   	pop    %esi
 9c5:	5f                   	pop    %edi
 9c6:	5d                   	pop    %ebp
 9c7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9c8:	03 72 04             	add    0x4(%edx),%esi
 9cb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9ce:	8b 10                	mov    (%eax),%edx
 9d0:	8b 12                	mov    (%edx),%edx
 9d2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9d5:	eb db                	jmp    9b2 <free+0x3e>
    p->s.size += bp->s.size;
 9d7:	03 53 fc             	add    -0x4(%ebx),%edx
 9da:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9dd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9e0:	89 10                	mov    %edx,(%eax)
 9e2:	eb da                	jmp    9be <free+0x4a>

000009e4 <morecore>:

static Header*
morecore(uint nu)
{
 9e4:	55                   	push   %ebp
 9e5:	89 e5                	mov    %esp,%ebp
 9e7:	53                   	push   %ebx
 9e8:	83 ec 04             	sub    $0x4,%esp
 9eb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9ed:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9f2:	77 05                	ja     9f9 <morecore+0x15>
    nu = 4096;
 9f4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9f9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a00:	83 ec 0c             	sub    $0xc,%esp
 a03:	50                   	push   %eax
 a04:	e8 38 fd ff ff       	call   741 <sbrk>
  if(p == (char*)-1)
 a09:	83 c4 10             	add    $0x10,%esp
 a0c:	83 f8 ff             	cmp    $0xffffffff,%eax
 a0f:	74 1c                	je     a2d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a11:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a14:	83 c0 08             	add    $0x8,%eax
 a17:	83 ec 0c             	sub    $0xc,%esp
 a1a:	50                   	push   %eax
 a1b:	e8 54 ff ff ff       	call   974 <free>
  return freep;
 a20:	a1 ac 0f 00 00       	mov    0xfac,%eax
 a25:	83 c4 10             	add    $0x10,%esp
}
 a28:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a2b:	c9                   	leave  
 a2c:	c3                   	ret    
    return 0;
 a2d:	b8 00 00 00 00       	mov    $0x0,%eax
 a32:	eb f4                	jmp    a28 <morecore+0x44>

00000a34 <malloc>:

void*
malloc(uint nbytes)
{
 a34:	55                   	push   %ebp
 a35:	89 e5                	mov    %esp,%ebp
 a37:	53                   	push   %ebx
 a38:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a3b:	8b 45 08             	mov    0x8(%ebp),%eax
 a3e:	8d 58 07             	lea    0x7(%eax),%ebx
 a41:	c1 eb 03             	shr    $0x3,%ebx
 a44:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a47:	8b 0d ac 0f 00 00    	mov    0xfac,%ecx
 a4d:	85 c9                	test   %ecx,%ecx
 a4f:	74 04                	je     a55 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a51:	8b 01                	mov    (%ecx),%eax
 a53:	eb 4a                	jmp    a9f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a55:	c7 05 ac 0f 00 00 b0 	movl   $0xfb0,0xfac
 a5c:	0f 00 00 
 a5f:	c7 05 b0 0f 00 00 b0 	movl   $0xfb0,0xfb0
 a66:	0f 00 00 
    base.s.size = 0;
 a69:	c7 05 b4 0f 00 00 00 	movl   $0x0,0xfb4
 a70:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a73:	b9 b0 0f 00 00       	mov    $0xfb0,%ecx
 a78:	eb d7                	jmp    a51 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a7a:	74 19                	je     a95 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a7c:	29 da                	sub    %ebx,%edx
 a7e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a81:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a84:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a87:	89 0d ac 0f 00 00    	mov    %ecx,0xfac
      return (void*)(p + 1);
 a8d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a90:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a93:	c9                   	leave  
 a94:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a95:	8b 10                	mov    (%eax),%edx
 a97:	89 11                	mov    %edx,(%ecx)
 a99:	eb ec                	jmp    a87 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9b:	89 c1                	mov    %eax,%ecx
 a9d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a9f:	8b 50 04             	mov    0x4(%eax),%edx
 aa2:	39 da                	cmp    %ebx,%edx
 aa4:	73 d4                	jae    a7a <malloc+0x46>
    if(p == freep)
 aa6:	39 05 ac 0f 00 00    	cmp    %eax,0xfac
 aac:	75 ed                	jne    a9b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 aae:	89 d8                	mov    %ebx,%eax
 ab0:	e8 2f ff ff ff       	call   9e4 <morecore>
 ab5:	85 c0                	test   %eax,%eax
 ab7:	75 e2                	jne    a9b <malloc+0x67>
 ab9:	eb d5                	jmp    a90 <malloc+0x5c>
