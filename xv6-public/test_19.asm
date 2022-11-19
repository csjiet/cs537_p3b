
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
  32:	68 c0 0a 00 00       	push   $0xac0
  37:	68 ca 0a 00 00       	push   $0xaca
  3c:	6a 01                	push   $0x1
  3e:	e8 ce 07 00 00       	call   811 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 d2 0a 00 00       	push   $0xad2
  4b:	68 e1 0a 00 00       	push   $0xae1
  50:	6a 01                	push   $0x1
  52:	e8 ba 07 00 00       	call   811 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 f5 0a 00 00       	push   $0xaf5
  5f:	6a 01                	push   $0x1
  61:	e8 ab 07 00 00       	call   811 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 a8 0f 00 00    	push   0xfa8
  6f:	e8 78 06 00 00       	call   6ec <kill>
  74:	e8 43 06 00 00       	call   6bc <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 c0 0a 00 00       	push   $0xac0
  80:	68 ca 0a 00 00       	push   $0xaca
  85:	6a 01                	push   $0x1
  87:	e8 85 07 00 00       	call   811 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 02 0b 00 00       	push   $0xb02
  94:	68 e1 0a 00 00       	push   $0xae1
  99:	6a 01                	push   $0x1
  9b:	e8 71 07 00 00       	call   811 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 f5 0a 00 00       	push   $0xaf5
  a8:	6a 01                	push   $0x1
  aa:	e8 62 07 00 00       	call   811 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 a8 0f 00 00    	push   0xfa8
  b8:	e8 2f 06 00 00       	call   6ec <kill>
  bd:	e8 fa 05 00 00       	call   6bc <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 c0 0a 00 00       	push   $0xac0
  c9:	68 ca 0a 00 00       	push   $0xaca
  ce:	6a 01                	push   $0x1
  d0:	e8 3c 07 00 00       	call   811 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 11 0b 00 00       	push   $0xb11
  dd:	68 e1 0a 00 00       	push   $0xae1
  e2:	6a 01                	push   $0x1
  e4:	e8 28 07 00 00       	call   811 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 f5 0a 00 00       	push   $0xaf5
  f1:	6a 01                	push   $0x1
  f3:	e8 19 07 00 00       	call   811 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 a8 0f 00 00    	push   0xfa8
 101:	e8 e6 05 00 00       	call   6ec <kill>
 106:	e8 b1 05 00 00       	call   6bc <exit>

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
 140:	68 c0 0a 00 00       	push   $0xac0
 145:	68 ca 0a 00 00       	push   $0xaca
 14a:	6a 01                	push   $0x1
 14c:	e8 c0 06 00 00       	call   811 <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 33 0b 00 00       	push   $0xb33
 159:	68 e1 0a 00 00       	push   $0xae1
 15e:	6a 01                	push   $0x1
 160:	e8 ac 06 00 00       	call   811 <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 f5 0a 00 00       	push   $0xaf5
 16d:	6a 01                	push   $0x1
 16f:	e8 9d 06 00 00       	call   811 <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 a8 0f 00 00    	push   0xfa8
 17d:	e8 6a 05 00 00       	call   6ec <kill>
 182:	e8 35 05 00 00       	call   6bc <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 c0 0a 00 00       	push   $0xac0
 18e:	68 ca 0a 00 00       	push   $0xaca
 193:	6a 01                	push   $0x1
 195:	e8 77 06 00 00       	call   811 <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 1d 0b 00 00       	push   $0xb1d
 1a2:	68 e1 0a 00 00       	push   $0xae1
 1a7:	6a 01                	push   $0x1
 1a9:	e8 63 06 00 00       	call   811 <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 f5 0a 00 00       	push   $0xaf5
 1b6:	6a 01                	push   $0x1
 1b8:	e8 54 06 00 00       	call   811 <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 a8 0f 00 00    	push   0xfa8
 1c6:	e8 21 05 00 00       	call   6ec <kill>
 1cb:	e8 ec 04 00 00       	call   6bc <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 c0 0a 00 00       	push   $0xac0
 1d7:	68 ca 0a 00 00       	push   $0xaca
 1dc:	6a 01                	push   $0x1
 1de:	e8 2e 06 00 00       	call   811 <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 28 0b 00 00       	push   $0xb28
 1eb:	68 e1 0a 00 00       	push   $0xae1
 1f0:	6a 01                	push   $0x1
 1f2:	e8 1a 06 00 00       	call   811 <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 f5 0a 00 00       	push   $0xaf5
 1ff:	6a 01                	push   $0x1
 201:	e8 0b 06 00 00       	call   811 <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 a8 0f 00 00    	push   0xfa8
 20f:	e8 d8 04 00 00       	call   6ec <kill>
 214:	e8 a3 04 00 00       	call   6bc <exit>
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
 248:	68 c0 0a 00 00       	push   $0xac0
 24d:	68 ca 0a 00 00       	push   $0xaca
 252:	6a 01                	push   $0x1
 254:	e8 b8 05 00 00       	call   811 <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 3f 0b 00 00       	push   $0xb3f
 261:	68 e1 0a 00 00       	push   $0xae1
 266:	6a 01                	push   $0x1
 268:	e8 a4 05 00 00       	call   811 <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 f5 0a 00 00       	push   $0xaf5
 275:	6a 01                	push   $0x1
 277:	e8 95 05 00 00       	call   811 <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 a8 0f 00 00    	push   0xfa8
 285:	e8 62 04 00 00       	call   6ec <kill>
 28a:	e8 2d 04 00 00       	call   6bc <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 c0 03 00 00       	call   65e <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 c0 0a 00 00       	push   $0xac0
 2b1:	68 ca 0a 00 00       	push   $0xaca
 2b6:	6a 01                	push   $0x1
 2b8:	e8 54 05 00 00       	call   811 <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 98 0b 00 00       	push   $0xb98
 2c5:	68 e1 0a 00 00       	push   $0xae1
 2ca:	6a 01                	push   $0x1
 2cc:	e8 40 05 00 00       	call   811 <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 f5 0a 00 00       	push   $0xaf5
 2d9:	6a 01                	push   $0x1
 2db:	e8 31 05 00 00       	call   811 <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 a8 0f 00 00    	push   0xfa8
 2e9:	e8 fe 03 00 00       	call   6ec <kill>
 2ee:	e8 c9 03 00 00       	call   6bc <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 c0 0a 00 00       	push   $0xac0
 2fa:	68 ca 0a 00 00       	push   $0xaca
 2ff:	6a 01                	push   $0x1
 301:	e8 0b 05 00 00       	call   811 <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 55 0b 00 00       	push   $0xb55
 30e:	68 e1 0a 00 00       	push   $0xae1
 313:	6a 01                	push   $0x1
 315:	e8 f7 04 00 00       	call   811 <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 f5 0a 00 00       	push   $0xaf5
 322:	6a 01                	push   $0x1
 324:	e8 e8 04 00 00       	call   811 <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 a8 0f 00 00    	push   0xfa8
 332:	e8 b5 03 00 00       	call   6ec <kill>
 337:	e8 80 03 00 00       	call   6bc <exit>
   exit();
 33c:	e8 7b 03 00 00       	call   6bc <exit>

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
 353:	e8 e4 03 00 00       	call   73c <getpid>
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
 389:	e8 d0 02 00 00       	call   65e <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d a4 0f 00 00 03 	cmpl   $0x3,0xfa4
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 c0 0a 00 00       	push   $0xac0
 3aa:	68 ca 0a 00 00       	push   $0xaca
 3af:	6a 01                	push   $0x1
 3b1:	e8 5b 04 00 00       	call   811 <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 7c 0b 00 00       	push   $0xb7c
 3be:	68 e1 0a 00 00       	push   $0xae1
 3c3:	6a 01                	push   $0x1
 3c5:	e8 47 04 00 00       	call   811 <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 f5 0a 00 00       	push   $0xaf5
 3d2:	6a 01                	push   $0x1
 3d4:	e8 38 04 00 00       	call   811 <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 a8 0f 00 00    	push   0xfa8
 3e2:	e8 05 03 00 00       	call   6ec <kill>
 3e7:	e8 d0 02 00 00       	call   6bc <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 c0 0a 00 00       	push   $0xac0
 3f3:	68 ca 0a 00 00       	push   $0xaca
 3f8:	6a 01                	push   $0x1
 3fa:	e8 12 04 00 00       	call   811 <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 46 0b 00 00       	push   $0xb46
 407:	68 e1 0a 00 00       	push   $0xae1
 40c:	6a 01                	push   $0x1
 40e:	e8 fe 03 00 00       	call   811 <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 f5 0a 00 00       	push   $0xaf5
 41b:	6a 01                	push   $0x1
 41d:	e8 ef 03 00 00       	call   811 <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 a8 0f 00 00    	push   0xfa8
 42b:	e8 bc 02 00 00       	call   6ec <kill>
 430:	e8 87 02 00 00       	call   6bc <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 c0 0a 00 00       	push   $0xac0
 43c:	68 ca 0a 00 00       	push   $0xaca
 441:	6a 01                	push   $0x1
 443:	e8 c9 03 00 00       	call   811 <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 65 0b 00 00       	push   $0xb65
 450:	68 e1 0a 00 00       	push   $0xae1
 455:	6a 01                	push   $0x1
 457:	e8 b5 03 00 00       	call   811 <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 f5 0a 00 00       	push   $0xaf5
 464:	6a 01                	push   $0x1
 466:	e8 a6 03 00 00       	call   811 <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 a8 0f 00 00    	push   0xfa8
 474:	e8 73 02 00 00       	call   6ec <kill>
 479:	e8 3e 02 00 00       	call   6bc <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 88 0b 00 00       	push   $0xb88
 486:	6a 01                	push   $0x1
 488:	e8 84 03 00 00       	call   811 <printf>
   exit();
 48d:	e8 2a 02 00 00       	call   6bc <exit>

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
 558:	e8 77 01 00 00       	call   6d4 <read>
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
 596:	e8 61 01 00 00       	call   6fc <open>
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
 5ab:	e8 64 01 00 00       	call   714 <fstat>
 5b0:	89 c6                	mov    %eax,%esi
  close(fd);
 5b2:	89 1c 24             	mov    %ebx,(%esp)
 5b5:	e8 2a 01 00 00       	call   6e4 <close>
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

  void* stack = malloc(2 * PGSIZE);
 62f:	68 00 20 00 00       	push   $0x2000
 634:	e8 fe 03 00 00       	call   a37 <malloc>
  if ((uint)stack%PGSIZE){
 639:	83 c4 10             	add    $0x10,%esp
 63c:	a9 ff 0f 00 00       	test   $0xfff,%eax
 641:	74 0a                	je     64d <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 643:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 648:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 64d:	50                   	push   %eax
 64e:	ff 75 10             	push   0x10(%ebp)
 651:	ff 75 0c             	push   0xc(%ebp)
 654:	ff 75 08             	push   0x8(%ebp)
 657:	e8 00 01 00 00       	call   75c <clone>
}
 65c:	c9                   	leave  
 65d:	c3                   	ret    

0000065e <thread_join>:

int thread_join(){
 65e:	55                   	push   %ebp
 65f:	89 e5                	mov    %esp,%ebp
 661:	53                   	push   %ebx
 662:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 665:	8d 45 f4             	lea    -0xc(%ebp),%eax
 668:	50                   	push   %eax
 669:	e8 f6 00 00 00       	call   764 <join>
 66e:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 670:	83 c4 04             	add    $0x4,%esp
 673:	ff 75 f4             	push   -0xc(%ebp)
 676:	e8 fc 02 00 00       	call   977 <free>
  return x;
}
 67b:	89 d8                	mov    %ebx,%eax
 67d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 680:	c9                   	leave  
 681:	c3                   	ret    

00000682 <lock_init>:

void lock_init(lock_t *spin){
 682:	55                   	push   %ebp
 683:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 68e:	5d                   	pop    %ebp
 68f:	c3                   	ret    

00000690 <lock_acquire>:

void lock_acquire(lock_t *spin){
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 696:	b8 01 00 00 00       	mov    $0x1,%eax
 69b:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 69e:	85 c0                	test   %eax,%eax
 6a0:	75 f4                	jne    696 <lock_acquire+0x6>

}
 6a2:	5d                   	pop    %ebp
 6a3:	c3                   	ret    

000006a4 <lock_release>:

void lock_release(lock_t *spin){
 6a4:	55                   	push   %ebp
 6a5:	89 e5                	mov    %esp,%ebp
 6a7:	8b 55 08             	mov    0x8(%ebp),%edx
 6aa:	b8 00 00 00 00       	mov    $0x0,%eax
 6af:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 6b2:	5d                   	pop    %ebp
 6b3:	c3                   	ret    

000006b4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6b4:	b8 01 00 00 00       	mov    $0x1,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <exit>:
SYSCALL(exit)
 6bc:	b8 02 00 00 00       	mov    $0x2,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <wait>:
SYSCALL(wait)
 6c4:	b8 03 00 00 00       	mov    $0x3,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <pipe>:
SYSCALL(pipe)
 6cc:	b8 04 00 00 00       	mov    $0x4,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <read>:
SYSCALL(read)
 6d4:	b8 05 00 00 00       	mov    $0x5,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <write>:
SYSCALL(write)
 6dc:	b8 10 00 00 00       	mov    $0x10,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <close>:
SYSCALL(close)
 6e4:	b8 15 00 00 00       	mov    $0x15,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <kill>:
SYSCALL(kill)
 6ec:	b8 06 00 00 00       	mov    $0x6,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <exec>:
SYSCALL(exec)
 6f4:	b8 07 00 00 00       	mov    $0x7,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <open>:
SYSCALL(open)
 6fc:	b8 0f 00 00 00       	mov    $0xf,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <mknod>:
SYSCALL(mknod)
 704:	b8 11 00 00 00       	mov    $0x11,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <unlink>:
SYSCALL(unlink)
 70c:	b8 12 00 00 00       	mov    $0x12,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <fstat>:
SYSCALL(fstat)
 714:	b8 08 00 00 00       	mov    $0x8,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <link>:
SYSCALL(link)
 71c:	b8 13 00 00 00       	mov    $0x13,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <mkdir>:
SYSCALL(mkdir)
 724:	b8 14 00 00 00       	mov    $0x14,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <chdir>:
SYSCALL(chdir)
 72c:	b8 09 00 00 00       	mov    $0x9,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <dup>:
SYSCALL(dup)
 734:	b8 0a 00 00 00       	mov    $0xa,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <getpid>:
SYSCALL(getpid)
 73c:	b8 0b 00 00 00       	mov    $0xb,%eax
 741:	cd 40                	int    $0x40
 743:	c3                   	ret    

00000744 <sbrk>:
SYSCALL(sbrk)
 744:	b8 0c 00 00 00       	mov    $0xc,%eax
 749:	cd 40                	int    $0x40
 74b:	c3                   	ret    

0000074c <sleep>:
SYSCALL(sleep)
 74c:	b8 0d 00 00 00       	mov    $0xd,%eax
 751:	cd 40                	int    $0x40
 753:	c3                   	ret    

00000754 <uptime>:
SYSCALL(uptime)
 754:	b8 0e 00 00 00       	mov    $0xe,%eax
 759:	cd 40                	int    $0x40
 75b:	c3                   	ret    

0000075c <clone>:
SYSCALL(clone)
 75c:	b8 16 00 00 00       	mov    $0x16,%eax
 761:	cd 40                	int    $0x40
 763:	c3                   	ret    

00000764 <join>:
 764:	b8 17 00 00 00       	mov    $0x17,%eax
 769:	cd 40                	int    $0x40
 76b:	c3                   	ret    

0000076c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 76c:	55                   	push   %ebp
 76d:	89 e5                	mov    %esp,%ebp
 76f:	83 ec 1c             	sub    $0x1c,%esp
 772:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 775:	6a 01                	push   $0x1
 777:	8d 55 f4             	lea    -0xc(%ebp),%edx
 77a:	52                   	push   %edx
 77b:	50                   	push   %eax
 77c:	e8 5b ff ff ff       	call   6dc <write>
}
 781:	83 c4 10             	add    $0x10,%esp
 784:	c9                   	leave  
 785:	c3                   	ret    

00000786 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 786:	55                   	push   %ebp
 787:	89 e5                	mov    %esp,%ebp
 789:	57                   	push   %edi
 78a:	56                   	push   %esi
 78b:	53                   	push   %ebx
 78c:	83 ec 2c             	sub    $0x2c,%esp
 78f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 792:	89 d0                	mov    %edx,%eax
 794:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 796:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 79a:	0f 95 c1             	setne  %cl
 79d:	c1 ea 1f             	shr    $0x1f,%edx
 7a0:	84 d1                	test   %dl,%cl
 7a2:	74 44                	je     7e8 <printint+0x62>
    neg = 1;
    x = -xx;
 7a4:	f7 d8                	neg    %eax
 7a6:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7a8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7af:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7b4:	89 c8                	mov    %ecx,%eax
 7b6:	ba 00 00 00 00       	mov    $0x0,%edx
 7bb:	f7 f6                	div    %esi
 7bd:	89 df                	mov    %ebx,%edi
 7bf:	83 c3 01             	add    $0x1,%ebx
 7c2:	0f b6 92 1c 0c 00 00 	movzbl 0xc1c(%edx),%edx
 7c9:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7cd:	89 ca                	mov    %ecx,%edx
 7cf:	89 c1                	mov    %eax,%ecx
 7d1:	39 d6                	cmp    %edx,%esi
 7d3:	76 df                	jbe    7b4 <printint+0x2e>
  if(neg)
 7d5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7d9:	74 31                	je     80c <printint+0x86>
    buf[i++] = '-';
 7db:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7e0:	8d 5f 02             	lea    0x2(%edi),%ebx
 7e3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7e6:	eb 17                	jmp    7ff <printint+0x79>
    x = xx;
 7e8:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7ea:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7f1:	eb bc                	jmp    7af <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7f3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7f8:	89 f0                	mov    %esi,%eax
 7fa:	e8 6d ff ff ff       	call   76c <putc>
  while(--i >= 0)
 7ff:	83 eb 01             	sub    $0x1,%ebx
 802:	79 ef                	jns    7f3 <printint+0x6d>
}
 804:	83 c4 2c             	add    $0x2c,%esp
 807:	5b                   	pop    %ebx
 808:	5e                   	pop    %esi
 809:	5f                   	pop    %edi
 80a:	5d                   	pop    %ebp
 80b:	c3                   	ret    
 80c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 80f:	eb ee                	jmp    7ff <printint+0x79>

00000811 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 811:	55                   	push   %ebp
 812:	89 e5                	mov    %esp,%ebp
 814:	57                   	push   %edi
 815:	56                   	push   %esi
 816:	53                   	push   %ebx
 817:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 81a:	8d 45 10             	lea    0x10(%ebp),%eax
 81d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 820:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 825:	bb 00 00 00 00       	mov    $0x0,%ebx
 82a:	eb 14                	jmp    840 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 82c:	89 fa                	mov    %edi,%edx
 82e:	8b 45 08             	mov    0x8(%ebp),%eax
 831:	e8 36 ff ff ff       	call   76c <putc>
 836:	eb 05                	jmp    83d <printf+0x2c>
      }
    } else if(state == '%'){
 838:	83 fe 25             	cmp    $0x25,%esi
 83b:	74 25                	je     862 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 83d:	83 c3 01             	add    $0x1,%ebx
 840:	8b 45 0c             	mov    0xc(%ebp),%eax
 843:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 847:	84 c0                	test   %al,%al
 849:	0f 84 20 01 00 00    	je     96f <printf+0x15e>
    c = fmt[i] & 0xff;
 84f:	0f be f8             	movsbl %al,%edi
 852:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 855:	85 f6                	test   %esi,%esi
 857:	75 df                	jne    838 <printf+0x27>
      if(c == '%'){
 859:	83 f8 25             	cmp    $0x25,%eax
 85c:	75 ce                	jne    82c <printf+0x1b>
        state = '%';
 85e:	89 c6                	mov    %eax,%esi
 860:	eb db                	jmp    83d <printf+0x2c>
      if(c == 'd'){
 862:	83 f8 25             	cmp    $0x25,%eax
 865:	0f 84 cf 00 00 00    	je     93a <printf+0x129>
 86b:	0f 8c dd 00 00 00    	jl     94e <printf+0x13d>
 871:	83 f8 78             	cmp    $0x78,%eax
 874:	0f 8f d4 00 00 00    	jg     94e <printf+0x13d>
 87a:	83 f8 63             	cmp    $0x63,%eax
 87d:	0f 8c cb 00 00 00    	jl     94e <printf+0x13d>
 883:	83 e8 63             	sub    $0x63,%eax
 886:	83 f8 15             	cmp    $0x15,%eax
 889:	0f 87 bf 00 00 00    	ja     94e <printf+0x13d>
 88f:	ff 24 85 c4 0b 00 00 	jmp    *0xbc4(,%eax,4)
        printint(fd, *ap, 10, 1);
 896:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 899:	8b 17                	mov    (%edi),%edx
 89b:	83 ec 0c             	sub    $0xc,%esp
 89e:	6a 01                	push   $0x1
 8a0:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	e8 d9 fe ff ff       	call   786 <printint>
        ap++;
 8ad:	83 c7 04             	add    $0x4,%edi
 8b0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8b3:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8b6:	be 00 00 00 00       	mov    $0x0,%esi
 8bb:	eb 80                	jmp    83d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c0:	8b 17                	mov    (%edi),%edx
 8c2:	83 ec 0c             	sub    $0xc,%esp
 8c5:	6a 00                	push   $0x0
 8c7:	b9 10 00 00 00       	mov    $0x10,%ecx
 8cc:	8b 45 08             	mov    0x8(%ebp),%eax
 8cf:	e8 b2 fe ff ff       	call   786 <printint>
        ap++;
 8d4:	83 c7 04             	add    $0x4,%edi
 8d7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8dd:	be 00 00 00 00       	mov    $0x0,%esi
 8e2:	e9 56 ff ff ff       	jmp    83d <printf+0x2c>
        s = (char*)*ap;
 8e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ea:	8b 30                	mov    (%eax),%esi
        ap++;
 8ec:	83 c0 04             	add    $0x4,%eax
 8ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8f2:	85 f6                	test   %esi,%esi
 8f4:	75 15                	jne    90b <printf+0xfa>
          s = "(null)";
 8f6:	be bd 0b 00 00       	mov    $0xbbd,%esi
 8fb:	eb 0e                	jmp    90b <printf+0xfa>
          putc(fd, *s);
 8fd:	0f be d2             	movsbl %dl,%edx
 900:	8b 45 08             	mov    0x8(%ebp),%eax
 903:	e8 64 fe ff ff       	call   76c <putc>
          s++;
 908:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 90b:	0f b6 16             	movzbl (%esi),%edx
 90e:	84 d2                	test   %dl,%dl
 910:	75 eb                	jne    8fd <printf+0xec>
      state = 0;
 912:	be 00 00 00 00       	mov    $0x0,%esi
 917:	e9 21 ff ff ff       	jmp    83d <printf+0x2c>
        putc(fd, *ap);
 91c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 91f:	0f be 17             	movsbl (%edi),%edx
 922:	8b 45 08             	mov    0x8(%ebp),%eax
 925:	e8 42 fe ff ff       	call   76c <putc>
        ap++;
 92a:	83 c7 04             	add    $0x4,%edi
 92d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 930:	be 00 00 00 00       	mov    $0x0,%esi
 935:	e9 03 ff ff ff       	jmp    83d <printf+0x2c>
        putc(fd, c);
 93a:	89 fa                	mov    %edi,%edx
 93c:	8b 45 08             	mov    0x8(%ebp),%eax
 93f:	e8 28 fe ff ff       	call   76c <putc>
      state = 0;
 944:	be 00 00 00 00       	mov    $0x0,%esi
 949:	e9 ef fe ff ff       	jmp    83d <printf+0x2c>
        putc(fd, '%');
 94e:	ba 25 00 00 00       	mov    $0x25,%edx
 953:	8b 45 08             	mov    0x8(%ebp),%eax
 956:	e8 11 fe ff ff       	call   76c <putc>
        putc(fd, c);
 95b:	89 fa                	mov    %edi,%edx
 95d:	8b 45 08             	mov    0x8(%ebp),%eax
 960:	e8 07 fe ff ff       	call   76c <putc>
      state = 0;
 965:	be 00 00 00 00       	mov    $0x0,%esi
 96a:	e9 ce fe ff ff       	jmp    83d <printf+0x2c>
    }
  }
}
 96f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 972:	5b                   	pop    %ebx
 973:	5e                   	pop    %esi
 974:	5f                   	pop    %edi
 975:	5d                   	pop    %ebp
 976:	c3                   	ret    

00000977 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 977:	55                   	push   %ebp
 978:	89 e5                	mov    %esp,%ebp
 97a:	57                   	push   %edi
 97b:	56                   	push   %esi
 97c:	53                   	push   %ebx
 97d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 980:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 983:	a1 ac 0f 00 00       	mov    0xfac,%eax
 988:	eb 02                	jmp    98c <free+0x15>
 98a:	89 d0                	mov    %edx,%eax
 98c:	39 c8                	cmp    %ecx,%eax
 98e:	73 04                	jae    994 <free+0x1d>
 990:	39 08                	cmp    %ecx,(%eax)
 992:	77 12                	ja     9a6 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 994:	8b 10                	mov    (%eax),%edx
 996:	39 c2                	cmp    %eax,%edx
 998:	77 f0                	ja     98a <free+0x13>
 99a:	39 c8                	cmp    %ecx,%eax
 99c:	72 08                	jb     9a6 <free+0x2f>
 99e:	39 ca                	cmp    %ecx,%edx
 9a0:	77 04                	ja     9a6 <free+0x2f>
 9a2:	89 d0                	mov    %edx,%eax
 9a4:	eb e6                	jmp    98c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ac:	8b 10                	mov    (%eax),%edx
 9ae:	39 d7                	cmp    %edx,%edi
 9b0:	74 19                	je     9cb <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9b5:	8b 50 04             	mov    0x4(%eax),%edx
 9b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9bb:	39 ce                	cmp    %ecx,%esi
 9bd:	74 1b                	je     9da <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9c1:	a3 ac 0f 00 00       	mov    %eax,0xfac
}
 9c6:	5b                   	pop    %ebx
 9c7:	5e                   	pop    %esi
 9c8:	5f                   	pop    %edi
 9c9:	5d                   	pop    %ebp
 9ca:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9cb:	03 72 04             	add    0x4(%edx),%esi
 9ce:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9d1:	8b 10                	mov    (%eax),%edx
 9d3:	8b 12                	mov    (%edx),%edx
 9d5:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9d8:	eb db                	jmp    9b5 <free+0x3e>
    p->s.size += bp->s.size;
 9da:	03 53 fc             	add    -0x4(%ebx),%edx
 9dd:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9e0:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9e3:	89 10                	mov    %edx,(%eax)
 9e5:	eb da                	jmp    9c1 <free+0x4a>

000009e7 <morecore>:

static Header*
morecore(uint nu)
{
 9e7:	55                   	push   %ebp
 9e8:	89 e5                	mov    %esp,%ebp
 9ea:	53                   	push   %ebx
 9eb:	83 ec 04             	sub    $0x4,%esp
 9ee:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9f0:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9f5:	77 05                	ja     9fc <morecore+0x15>
    nu = 4096;
 9f7:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9fc:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a03:	83 ec 0c             	sub    $0xc,%esp
 a06:	50                   	push   %eax
 a07:	e8 38 fd ff ff       	call   744 <sbrk>
  if(p == (char*)-1)
 a0c:	83 c4 10             	add    $0x10,%esp
 a0f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a12:	74 1c                	je     a30 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a14:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a17:	83 c0 08             	add    $0x8,%eax
 a1a:	83 ec 0c             	sub    $0xc,%esp
 a1d:	50                   	push   %eax
 a1e:	e8 54 ff ff ff       	call   977 <free>
  return freep;
 a23:	a1 ac 0f 00 00       	mov    0xfac,%eax
 a28:	83 c4 10             	add    $0x10,%esp
}
 a2b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a2e:	c9                   	leave  
 a2f:	c3                   	ret    
    return 0;
 a30:	b8 00 00 00 00       	mov    $0x0,%eax
 a35:	eb f4                	jmp    a2b <morecore+0x44>

00000a37 <malloc>:

void*
malloc(uint nbytes)
{
 a37:	55                   	push   %ebp
 a38:	89 e5                	mov    %esp,%ebp
 a3a:	53                   	push   %ebx
 a3b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a3e:	8b 45 08             	mov    0x8(%ebp),%eax
 a41:	8d 58 07             	lea    0x7(%eax),%ebx
 a44:	c1 eb 03             	shr    $0x3,%ebx
 a47:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a4a:	8b 0d ac 0f 00 00    	mov    0xfac,%ecx
 a50:	85 c9                	test   %ecx,%ecx
 a52:	74 04                	je     a58 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a54:	8b 01                	mov    (%ecx),%eax
 a56:	eb 4a                	jmp    aa2 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a58:	c7 05 ac 0f 00 00 b0 	movl   $0xfb0,0xfac
 a5f:	0f 00 00 
 a62:	c7 05 b0 0f 00 00 b0 	movl   $0xfb0,0xfb0
 a69:	0f 00 00 
    base.s.size = 0;
 a6c:	c7 05 b4 0f 00 00 00 	movl   $0x0,0xfb4
 a73:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a76:	b9 b0 0f 00 00       	mov    $0xfb0,%ecx
 a7b:	eb d7                	jmp    a54 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a7d:	74 19                	je     a98 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a7f:	29 da                	sub    %ebx,%edx
 a81:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a84:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a87:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a8a:	89 0d ac 0f 00 00    	mov    %ecx,0xfac
      return (void*)(p + 1);
 a90:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a96:	c9                   	leave  
 a97:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a98:	8b 10                	mov    (%eax),%edx
 a9a:	89 11                	mov    %edx,(%ecx)
 a9c:	eb ec                	jmp    a8a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9e:	89 c1                	mov    %eax,%ecx
 aa0:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 aa2:	8b 50 04             	mov    0x4(%eax),%edx
 aa5:	39 da                	cmp    %ebx,%edx
 aa7:	73 d4                	jae    a7d <malloc+0x46>
    if(p == freep)
 aa9:	39 05 ac 0f 00 00    	cmp    %eax,0xfac
 aaf:	75 ed                	jne    a9e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ab1:	89 d8                	mov    %ebx,%eax
 ab3:	e8 2f ff ff ff       	call   9e7 <morecore>
 ab8:	85 c0                	test   %eax,%eax
 aba:	75 e2                	jne    a9e <malloc+0x67>
 abc:	eb d5                	jmp    a93 <malloc+0x5c>
