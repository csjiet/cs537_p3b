
_test_20:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:
   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1, void *arg2)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 68 0e 00 00       	push   $0xe68
   b:	e8 aa 05 00 00       	call   5ba <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 52 06 00 00       	call   66e <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 6c 0e 00 00    	cmp    0xe6c,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 e8 09 00 00       	push   $0x9e8
  2e:	68 f2 09 00 00       	push   $0x9f2
  33:	6a 01                	push   $0x1
  35:	e8 01 07 00 00       	call   73b <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 fa 09 00 00       	push   $0x9fa
  42:	68 18 0a 00 00       	push   $0xa18
  47:	6a 01                	push   $0x1
  49:	e8 ed 06 00 00       	call   73b <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 2c 0a 00 00       	push   $0xa2c
  56:	6a 01                	push   $0x1
  58:	e8 de 06 00 00       	call   73b <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 74 0e 00 00    	push   0xe74
  66:	e8 ab 05 00 00       	call   616 <kill>
  6b:	e8 76 05 00 00       	call   5e6 <exit>
   global++;
  70:	83 05 70 0e 00 00 01 	addl   $0x1,0xe70
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 68 0e 00 00       	push   $0xe68
  7f:	e8 4a 05 00 00       	call   5ce <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 64 0e 00 00 	movl   $0xe64,(%esp)
  8b:	e8 2a 05 00 00       	call   5ba <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 d2 05 00 00       	call   66e <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 6c 0e 00 00    	cmp    0xe6c,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 e8 09 00 00       	push   $0x9e8
  ae:	68 f2 09 00 00       	push   $0x9f2
  b3:	6a 01                	push   $0x1
  b5:	e8 81 06 00 00       	call   73b <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 fa 09 00 00       	push   $0x9fa
  c2:	68 18 0a 00 00       	push   $0xa18
  c7:	6a 01                	push   $0x1
  c9:	e8 6d 06 00 00       	call   73b <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 2c 0a 00 00       	push   $0xa2c
  d6:	6a 01                	push   $0x1
  d8:	e8 5e 06 00 00       	call   73b <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 74 0e 00 00    	push   0xe74
  e6:	e8 2b 05 00 00       	call   616 <kill>
  eb:	e8 f6 04 00 00       	call   5e6 <exit>
   global++;
  f0:	83 05 70 0e 00 00 01 	addl   $0x1,0xe70
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 64 0e 00 00       	push   $0xe64
  ff:	e8 ca 04 00 00       	call   5ce <lock_release>

   
   exit();
 104:	e8 dd 04 00 00       	call   5e6 <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 68 0e 00 00       	push   $0xe68
 114:	e8 93 04 00 00       	call   5ac <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 64 0e 00 00 	movl   $0xe64,(%esp)
 120:	e8 87 04 00 00       	call   5ac <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 68 0e 00 00 	movl   $0xe68,(%esp)
 12c:	e8 89 04 00 00       	call   5ba <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 64 0e 00 00 	movl   $0xe64,(%esp)
 138:	e8 7d 04 00 00       	call   5ba <lock_acquire>

   int nested_thread_id = thread_create(worker2, 0, 0);
 13d:	83 c4 0c             	add    $0xc,%esp
 140:	6a 00                	push   $0x0
 142:	6a 00                	push   $0x0
 144:	68 00 00 00 00       	push   $0x0
 149:	e8 08 04 00 00       	call   556 <thread_create>
    assert(nested_thread_id > 0);
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	7e 14                	jle    169 <worker+0x60>
   size = (unsigned int)sbrk(0);
 155:	83 ec 0c             	sub    $0xc,%esp
 158:	6a 00                	push   $0x0
 15a:	e8 0f 05 00 00       	call   66e <sbrk>
 15f:	a3 6c 0e 00 00       	mov    %eax,0xe6c

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 e8 09 00 00       	push   $0x9e8
 170:	68 f2 09 00 00       	push   $0x9f2
 175:	6a 01                	push   $0x1
 177:	e8 bf 05 00 00       	call   73b <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 39 0a 00 00       	push   $0xa39
 184:	68 18 0a 00 00       	push   $0xa18
 189:	6a 01                	push   $0x1
 18b:	e8 ab 05 00 00       	call   73b <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 2c 0a 00 00       	push   $0xa2c
 198:	6a 01                	push   $0x1
 19a:	e8 9c 05 00 00       	call   73b <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 74 0e 00 00    	push   0xe74
 1a8:	e8 69 04 00 00       	call   616 <kill>
 1ad:	e8 34 04 00 00       	call   5e6 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 68 0e 00 00       	push   $0xe68
 1ba:	e8 0f 04 00 00       	call   5ce <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 ab 04 00 00       	call   676 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 68 0e 00 00 	movl   $0xe68,(%esp)
 1d2:	e8 e3 03 00 00       	call   5ba <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 60 0e 00 00       	mov    0xe60,%eax
 1df:	39 05 70 0e 00 00    	cmp    %eax,0xe70
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 70 0e 00 00 00 	movl   $0x0,0xe70
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 70 04 00 00       	call   66e <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 64 04 00 00       	call   66e <sbrk>
 20a:	a3 6c 0e 00 00       	mov    %eax,0xe6c
   lock_release(&lock);
 20f:	c7 04 24 68 0e 00 00 	movl   $0xe68,(%esp)
 216:	e8 b3 03 00 00       	call   5ce <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 64 0e 00 00       	push   $0xe64
 228:	e8 a1 03 00 00       	call   5ce <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 3d 04 00 00       	call   676 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 64 0e 00 00 	movl   $0xe64,(%esp)
 240:	e8 75 03 00 00       	call   5ba <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 60 0e 00 00       	mov    0xe60,%eax
 24d:	39 05 70 0e 00 00    	cmp    %eax,0xe70
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 64 0e 00 00       	push   $0xe64
 25d:	e8 6c 03 00 00       	call   5ce <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 10 03 00 00       	call   577 <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 73 03 00 00       	call   5e6 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 e8 09 00 00       	push   $0x9e8
 27a:	68 f2 09 00 00       	push   $0x9f2
 27f:	6a 01                	push   $0x1
 281:	e8 b5 04 00 00       	call   73b <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 4e 0a 00 00       	push   $0xa4e
 28e:	68 18 0a 00 00       	push   $0xa18
 293:	6a 01                	push   $0x1
 295:	e8 a1 04 00 00       	call   73b <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 2c 0a 00 00       	push   $0xa2c
 2a2:	6a 01                	push   $0x1
 2a4:	e8 92 04 00 00       	call   73b <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 74 0e 00 00    	push   0xe74
 2b2:	e8 5f 03 00 00       	call   616 <kill>
 2b7:	e8 2a 03 00 00       	call   5e6 <exit>

000002bc <main>:
{
 2bc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2c0:	83 e4 f0             	and    $0xfffffff0,%esp
 2c3:	ff 71 fc             	push   -0x4(%ecx)
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	51                   	push   %ecx
 2ca:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
 2cd:	e8 94 03 00 00       	call   666 <getpid>
 2d2:	a3 74 0e 00 00       	mov    %eax,0xe74
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 7f 03 00 00       	call   66e <sbrk>
 2ef:	a3 6c 0e 00 00       	mov    %eax,0xe6c
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2f4:	83 c4 0c             	add    $0xc,%esp
 2f7:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2fa:	50                   	push   %eax
 2fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fe:	50                   	push   %eax
 2ff:	68 09 01 00 00       	push   $0x109
 304:	e8 4d 02 00 00       	call   556 <thread_create>
   assert(thread_pid > 0);
 309:	83 c4 10             	add    $0x10,%esp
 30c:	85 c0                	test   %eax,%eax
 30e:	7e 1d                	jle    32d <main+0x71>
   int join_pid = thread_join();
 310:	e8 62 02 00 00       	call   577 <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 71 0a 00 00       	push   $0xa71
 321:	6a 01                	push   $0x1
 323:	e8 13 04 00 00       	call   73b <printf>
   exit();
 328:	e8 b9 02 00 00       	call   5e6 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 e8 09 00 00       	push   $0x9e8
 334:	68 f2 09 00 00       	push   $0x9f2
 339:	6a 01                	push   $0x1
 33b:	e8 fb 03 00 00       	call   73b <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 62 0a 00 00       	push   $0xa62
 348:	68 18 0a 00 00       	push   $0xa18
 34d:	6a 01                	push   $0x1
 34f:	e8 e7 03 00 00       	call   73b <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 2c 0a 00 00       	push   $0xa2c
 35c:	6a 01                	push   $0x1
 35e:	e8 d8 03 00 00       	call   73b <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 74 0e 00 00    	push   0xe74
 36c:	e8 a5 02 00 00       	call   616 <kill>
 371:	e8 70 02 00 00       	call   5e6 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 e8 09 00 00       	push   $0x9e8
 37d:	68 f2 09 00 00       	push   $0x9f2
 382:	6a 01                	push   $0x1
 384:	e8 b2 03 00 00       	call   73b <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 55 0a 00 00       	push   $0xa55
 391:	68 18 0a 00 00       	push   $0xa18
 396:	6a 01                	push   $0x1
 398:	e8 9e 03 00 00       	call   73b <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 2c 0a 00 00       	push   $0xa2c
 3a5:	6a 01                	push   $0x1
 3a7:	e8 8f 03 00 00       	call   73b <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 74 0e 00 00    	push   0xe74
 3b5:	e8 5c 02 00 00       	call   616 <kill>
 3ba:	e8 27 02 00 00       	call   5e6 <exit>

000003bf <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	56                   	push   %esi
 3c3:	53                   	push   %ebx
 3c4:	8b 75 08             	mov    0x8(%ebp),%esi
 3c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3ca:	89 f0                	mov    %esi,%eax
 3cc:	89 d1                	mov    %edx,%ecx
 3ce:	83 c2 01             	add    $0x1,%edx
 3d1:	89 c3                	mov    %eax,%ebx
 3d3:	83 c0 01             	add    $0x1,%eax
 3d6:	0f b6 09             	movzbl (%ecx),%ecx
 3d9:	88 0b                	mov    %cl,(%ebx)
 3db:	84 c9                	test   %cl,%cl
 3dd:	75 ed                	jne    3cc <strcpy+0xd>
    ;
  return os;
}
 3df:	89 f0                	mov    %esi,%eax
 3e1:	5b                   	pop    %ebx
 3e2:	5e                   	pop    %esi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3ee:	eb 06                	jmp    3f6 <strcmp+0x11>
    p++, q++;
 3f0:	83 c1 01             	add    $0x1,%ecx
 3f3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f6:	0f b6 01             	movzbl (%ecx),%eax
 3f9:	84 c0                	test   %al,%al
 3fb:	74 04                	je     401 <strcmp+0x1c>
 3fd:	3a 02                	cmp    (%edx),%al
 3ff:	74 ef                	je     3f0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 401:	0f b6 c0             	movzbl %al,%eax
 404:	0f b6 12             	movzbl (%edx),%edx
 407:	29 d0                	sub    %edx,%eax
}
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <strlen>:

uint
strlen(const char *s)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 411:	b8 00 00 00 00       	mov    $0x0,%eax
 416:	eb 03                	jmp    41b <strlen+0x10>
 418:	83 c0 01             	add    $0x1,%eax
 41b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41f:	75 f7                	jne    418 <strlen+0xd>
    ;
  return n;
}
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    

00000423 <memset>:

void*
memset(void *dst, int c, uint n)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	57                   	push   %edi
 427:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 42a:	89 d7                	mov    %edx,%edi
 42c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42f:	8b 45 0c             	mov    0xc(%ebp),%eax
 432:	fc                   	cld    
 433:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 435:	89 d0                	mov    %edx,%eax
 437:	8b 7d fc             	mov    -0x4(%ebp),%edi
 43a:	c9                   	leave  
 43b:	c3                   	ret    

0000043c <strchr>:

char*
strchr(const char *s, char c)
{
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
 442:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 446:	eb 03                	jmp    44b <strchr+0xf>
 448:	83 c0 01             	add    $0x1,%eax
 44b:	0f b6 10             	movzbl (%eax),%edx
 44e:	84 d2                	test   %dl,%dl
 450:	74 06                	je     458 <strchr+0x1c>
    if(*s == c)
 452:	38 ca                	cmp    %cl,%dl
 454:	75 f2                	jne    448 <strchr+0xc>
 456:	eb 05                	jmp    45d <strchr+0x21>
      return (char*)s;
  return 0;
 458:	b8 00 00 00 00       	mov    $0x0,%eax
}
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret    

0000045f <gets>:

char*
gets(char *buf, int max)
{
 45f:	55                   	push   %ebp
 460:	89 e5                	mov    %esp,%ebp
 462:	57                   	push   %edi
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
 465:	83 ec 1c             	sub    $0x1c,%esp
 468:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 46b:	bb 00 00 00 00       	mov    $0x0,%ebx
 470:	89 de                	mov    %ebx,%esi
 472:	83 c3 01             	add    $0x1,%ebx
 475:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 478:	7d 2e                	jge    4a8 <gets+0x49>
    cc = read(0, &c, 1);
 47a:	83 ec 04             	sub    $0x4,%esp
 47d:	6a 01                	push   $0x1
 47f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 482:	50                   	push   %eax
 483:	6a 00                	push   $0x0
 485:	e8 74 01 00 00       	call   5fe <read>
    if(cc < 1)
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	85 c0                	test   %eax,%eax
 48f:	7e 17                	jle    4a8 <gets+0x49>
      break;
    buf[i++] = c;
 491:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 495:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 498:	3c 0a                	cmp    $0xa,%al
 49a:	0f 94 c2             	sete   %dl
 49d:	3c 0d                	cmp    $0xd,%al
 49f:	0f 94 c0             	sete   %al
 4a2:	08 c2                	or     %al,%dl
 4a4:	74 ca                	je     470 <gets+0x11>
    buf[i++] = c;
 4a6:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a8:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4ac:	89 f8                	mov    %edi,%eax
 4ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b1:	5b                   	pop    %ebx
 4b2:	5e                   	pop    %esi
 4b3:	5f                   	pop    %edi
 4b4:	5d                   	pop    %ebp
 4b5:	c3                   	ret    

000004b6 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b6:	55                   	push   %ebp
 4b7:	89 e5                	mov    %esp,%ebp
 4b9:	56                   	push   %esi
 4ba:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4bb:	83 ec 08             	sub    $0x8,%esp
 4be:	6a 00                	push   $0x0
 4c0:	ff 75 08             	push   0x8(%ebp)
 4c3:	e8 5e 01 00 00       	call   626 <open>
  if(fd < 0)
 4c8:	83 c4 10             	add    $0x10,%esp
 4cb:	85 c0                	test   %eax,%eax
 4cd:	78 24                	js     4f3 <stat+0x3d>
 4cf:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4d1:	83 ec 08             	sub    $0x8,%esp
 4d4:	ff 75 0c             	push   0xc(%ebp)
 4d7:	50                   	push   %eax
 4d8:	e8 61 01 00 00       	call   63e <fstat>
 4dd:	89 c6                	mov    %eax,%esi
  close(fd);
 4df:	89 1c 24             	mov    %ebx,(%esp)
 4e2:	e8 27 01 00 00       	call   60e <close>
  return r;
 4e7:	83 c4 10             	add    $0x10,%esp
}
 4ea:	89 f0                	mov    %esi,%eax
 4ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    
    return -1;
 4f3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f8:	eb f0                	jmp    4ea <stat+0x34>

000004fa <atoi>:

int
atoi(const char *s)
{
 4fa:	55                   	push   %ebp
 4fb:	89 e5                	mov    %esp,%ebp
 4fd:	53                   	push   %ebx
 4fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 501:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 506:	eb 10                	jmp    518 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 508:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 50b:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 50e:	83 c1 01             	add    $0x1,%ecx
 511:	0f be c0             	movsbl %al,%eax
 514:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 518:	0f b6 01             	movzbl (%ecx),%eax
 51b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 51e:	80 fb 09             	cmp    $0x9,%bl
 521:	76 e5                	jbe    508 <atoi+0xe>
  return n;
}
 523:	89 d0                	mov    %edx,%eax
 525:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 528:	c9                   	leave  
 529:	c3                   	ret    

0000052a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 52a:	55                   	push   %ebp
 52b:	89 e5                	mov    %esp,%ebp
 52d:	56                   	push   %esi
 52e:	53                   	push   %ebx
 52f:	8b 75 08             	mov    0x8(%ebp),%esi
 532:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 535:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 538:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 53a:	eb 0d                	jmp    549 <memmove+0x1f>
    *dst++ = *src++;
 53c:	0f b6 01             	movzbl (%ecx),%eax
 53f:	88 02                	mov    %al,(%edx)
 541:	8d 49 01             	lea    0x1(%ecx),%ecx
 544:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 547:	89 d8                	mov    %ebx,%eax
 549:	8d 58 ff             	lea    -0x1(%eax),%ebx
 54c:	85 c0                	test   %eax,%eax
 54e:	7f ec                	jg     53c <memmove+0x12>
  return vdst;
}
 550:	89 f0                	mov    %esi,%eax
 552:	5b                   	pop    %ebx
 553:	5e                   	pop    %esi
 554:	5d                   	pop    %ebp
 555:	c3                   	ret    

00000556 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 55c:	68 00 10 00 00       	push   $0x1000
 561:	e8 fb 03 00 00       	call   961 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 566:	50                   	push   %eax
 567:	ff 75 10             	push   0x10(%ebp)
 56a:	ff 75 0c             	push   0xc(%ebp)
 56d:	ff 75 08             	push   0x8(%ebp)
 570:	e8 11 01 00 00       	call   686 <clone>
}
 575:	c9                   	leave  
 576:	c3                   	ret    

00000577 <thread_join>:

int thread_join(){
 577:	55                   	push   %ebp
 578:	89 e5                	mov    %esp,%ebp
 57a:	53                   	push   %ebx
 57b:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 57e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 581:	50                   	push   %eax
 582:	e8 07 01 00 00       	call   68e <join>
  if (x < 0) {
 587:	83 c4 10             	add    $0x10,%esp
 58a:	85 c0                	test   %eax,%eax
 58c:	78 17                	js     5a5 <thread_join+0x2e>
 58e:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	ff 75 f4             	push   -0xc(%ebp)
 596:	e8 06 03 00 00       	call   8a1 <free>
  return x;
 59b:	83 c4 10             	add    $0x10,%esp
}
 59e:	89 d8                	mov    %ebx,%eax
 5a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a3:	c9                   	leave  
 5a4:	c3                   	ret    
    return -1;
 5a5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 5aa:	eb f2                	jmp    59e <thread_join+0x27>

000005ac <lock_init>:

void lock_init(lock_t *spin){
 5ac:	55                   	push   %ebp
 5ad:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 5af:	8b 45 08             	mov    0x8(%ebp),%eax
 5b2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5b8:	5d                   	pop    %ebp
 5b9:	c3                   	ret    

000005ba <lock_acquire>:

void lock_acquire(lock_t *spin){
 5ba:	55                   	push   %ebp
 5bb:	89 e5                	mov    %esp,%ebp
 5bd:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5c0:	b8 01 00 00 00       	mov    $0x1,%eax
 5c5:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 5c8:	85 c0                	test   %eax,%eax
 5ca:	75 f4                	jne    5c0 <lock_acquire+0x6>

}
 5cc:	5d                   	pop    %ebp
 5cd:	c3                   	ret    

000005ce <lock_release>:

void lock_release(lock_t *spin){
 5ce:	55                   	push   %ebp
 5cf:	89 e5                	mov    %esp,%ebp
 5d1:	8b 55 08             	mov    0x8(%ebp),%edx
 5d4:	b8 00 00 00 00       	mov    $0x0,%eax
 5d9:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret    

000005de <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5de:	b8 01 00 00 00       	mov    $0x1,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <exit>:
SYSCALL(exit)
 5e6:	b8 02 00 00 00       	mov    $0x2,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <wait>:
SYSCALL(wait)
 5ee:	b8 03 00 00 00       	mov    $0x3,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <pipe>:
SYSCALL(pipe)
 5f6:	b8 04 00 00 00       	mov    $0x4,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <read>:
SYSCALL(read)
 5fe:	b8 05 00 00 00       	mov    $0x5,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <write>:
SYSCALL(write)
 606:	b8 10 00 00 00       	mov    $0x10,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <close>:
SYSCALL(close)
 60e:	b8 15 00 00 00       	mov    $0x15,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <kill>:
SYSCALL(kill)
 616:	b8 06 00 00 00       	mov    $0x6,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <exec>:
SYSCALL(exec)
 61e:	b8 07 00 00 00       	mov    $0x7,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <open>:
SYSCALL(open)
 626:	b8 0f 00 00 00       	mov    $0xf,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <mknod>:
SYSCALL(mknod)
 62e:	b8 11 00 00 00       	mov    $0x11,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <unlink>:
SYSCALL(unlink)
 636:	b8 12 00 00 00       	mov    $0x12,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <fstat>:
SYSCALL(fstat)
 63e:	b8 08 00 00 00       	mov    $0x8,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <link>:
SYSCALL(link)
 646:	b8 13 00 00 00       	mov    $0x13,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <mkdir>:
SYSCALL(mkdir)
 64e:	b8 14 00 00 00       	mov    $0x14,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <chdir>:
SYSCALL(chdir)
 656:	b8 09 00 00 00       	mov    $0x9,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <dup>:
SYSCALL(dup)
 65e:	b8 0a 00 00 00       	mov    $0xa,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <getpid>:
SYSCALL(getpid)
 666:	b8 0b 00 00 00       	mov    $0xb,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <sbrk>:
SYSCALL(sbrk)
 66e:	b8 0c 00 00 00       	mov    $0xc,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <sleep>:
SYSCALL(sleep)
 676:	b8 0d 00 00 00       	mov    $0xd,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <uptime>:
SYSCALL(uptime)
 67e:	b8 0e 00 00 00       	mov    $0xe,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <clone>:
SYSCALL(clone)
 686:	b8 16 00 00 00       	mov    $0x16,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <join>:
 68e:	b8 17 00 00 00       	mov    $0x17,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 696:	55                   	push   %ebp
 697:	89 e5                	mov    %esp,%ebp
 699:	83 ec 1c             	sub    $0x1c,%esp
 69c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 69f:	6a 01                	push   $0x1
 6a1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6a4:	52                   	push   %edx
 6a5:	50                   	push   %eax
 6a6:	e8 5b ff ff ff       	call   606 <write>
}
 6ab:	83 c4 10             	add    $0x10,%esp
 6ae:	c9                   	leave  
 6af:	c3                   	ret    

000006b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 2c             	sub    $0x2c,%esp
 6b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6bc:	89 d0                	mov    %edx,%eax
 6be:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6c0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6c4:	0f 95 c1             	setne  %cl
 6c7:	c1 ea 1f             	shr    $0x1f,%edx
 6ca:	84 d1                	test   %dl,%cl
 6cc:	74 44                	je     712 <printint+0x62>
    neg = 1;
    x = -xx;
 6ce:	f7 d8                	neg    %eax
 6d0:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6d2:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d9:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6de:	89 c8                	mov    %ecx,%eax
 6e0:	ba 00 00 00 00       	mov    $0x0,%edx
 6e5:	f7 f6                	div    %esi
 6e7:	89 df                	mov    %ebx,%edi
 6e9:	83 c3 01             	add    $0x1,%ebx
 6ec:	0f b6 92 e0 0a 00 00 	movzbl 0xae0(%edx),%edx
 6f3:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6f7:	89 ca                	mov    %ecx,%edx
 6f9:	89 c1                	mov    %eax,%ecx
 6fb:	39 d6                	cmp    %edx,%esi
 6fd:	76 df                	jbe    6de <printint+0x2e>
  if(neg)
 6ff:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 703:	74 31                	je     736 <printint+0x86>
    buf[i++] = '-';
 705:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 70a:	8d 5f 02             	lea    0x2(%edi),%ebx
 70d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 710:	eb 17                	jmp    729 <printint+0x79>
    x = xx;
 712:	89 c1                	mov    %eax,%ecx
  neg = 0;
 714:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 71b:	eb bc                	jmp    6d9 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 71d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 722:	89 f0                	mov    %esi,%eax
 724:	e8 6d ff ff ff       	call   696 <putc>
  while(--i >= 0)
 729:	83 eb 01             	sub    $0x1,%ebx
 72c:	79 ef                	jns    71d <printint+0x6d>
}
 72e:	83 c4 2c             	add    $0x2c,%esp
 731:	5b                   	pop    %ebx
 732:	5e                   	pop    %esi
 733:	5f                   	pop    %edi
 734:	5d                   	pop    %ebp
 735:	c3                   	ret    
 736:	8b 75 d0             	mov    -0x30(%ebp),%esi
 739:	eb ee                	jmp    729 <printint+0x79>

0000073b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 73b:	55                   	push   %ebp
 73c:	89 e5                	mov    %esp,%ebp
 73e:	57                   	push   %edi
 73f:	56                   	push   %esi
 740:	53                   	push   %ebx
 741:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 744:	8d 45 10             	lea    0x10(%ebp),%eax
 747:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 74a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 74f:	bb 00 00 00 00       	mov    $0x0,%ebx
 754:	eb 14                	jmp    76a <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 756:	89 fa                	mov    %edi,%edx
 758:	8b 45 08             	mov    0x8(%ebp),%eax
 75b:	e8 36 ff ff ff       	call   696 <putc>
 760:	eb 05                	jmp    767 <printf+0x2c>
      }
    } else if(state == '%'){
 762:	83 fe 25             	cmp    $0x25,%esi
 765:	74 25                	je     78c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 767:	83 c3 01             	add    $0x1,%ebx
 76a:	8b 45 0c             	mov    0xc(%ebp),%eax
 76d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 771:	84 c0                	test   %al,%al
 773:	0f 84 20 01 00 00    	je     899 <printf+0x15e>
    c = fmt[i] & 0xff;
 779:	0f be f8             	movsbl %al,%edi
 77c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 77f:	85 f6                	test   %esi,%esi
 781:	75 df                	jne    762 <printf+0x27>
      if(c == '%'){
 783:	83 f8 25             	cmp    $0x25,%eax
 786:	75 ce                	jne    756 <printf+0x1b>
        state = '%';
 788:	89 c6                	mov    %eax,%esi
 78a:	eb db                	jmp    767 <printf+0x2c>
      if(c == 'd'){
 78c:	83 f8 25             	cmp    $0x25,%eax
 78f:	0f 84 cf 00 00 00    	je     864 <printf+0x129>
 795:	0f 8c dd 00 00 00    	jl     878 <printf+0x13d>
 79b:	83 f8 78             	cmp    $0x78,%eax
 79e:	0f 8f d4 00 00 00    	jg     878 <printf+0x13d>
 7a4:	83 f8 63             	cmp    $0x63,%eax
 7a7:	0f 8c cb 00 00 00    	jl     878 <printf+0x13d>
 7ad:	83 e8 63             	sub    $0x63,%eax
 7b0:	83 f8 15             	cmp    $0x15,%eax
 7b3:	0f 87 bf 00 00 00    	ja     878 <printf+0x13d>
 7b9:	ff 24 85 88 0a 00 00 	jmp    *0xa88(,%eax,4)
        printint(fd, *ap, 10, 1);
 7c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c3:	8b 17                	mov    (%edi),%edx
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	6a 01                	push   $0x1
 7ca:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7cf:	8b 45 08             	mov    0x8(%ebp),%eax
 7d2:	e8 d9 fe ff ff       	call   6b0 <printint>
        ap++;
 7d7:	83 c7 04             	add    $0x4,%edi
 7da:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7dd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7e0:	be 00 00 00 00       	mov    $0x0,%esi
 7e5:	eb 80                	jmp    767 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ea:	8b 17                	mov    (%edi),%edx
 7ec:	83 ec 0c             	sub    $0xc,%esp
 7ef:	6a 00                	push   $0x0
 7f1:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	e8 b2 fe ff ff       	call   6b0 <printint>
        ap++;
 7fe:	83 c7 04             	add    $0x4,%edi
 801:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 804:	83 c4 10             	add    $0x10,%esp
      state = 0;
 807:	be 00 00 00 00       	mov    $0x0,%esi
 80c:	e9 56 ff ff ff       	jmp    767 <printf+0x2c>
        s = (char*)*ap;
 811:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 814:	8b 30                	mov    (%eax),%esi
        ap++;
 816:	83 c0 04             	add    $0x4,%eax
 819:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 81c:	85 f6                	test   %esi,%esi
 81e:	75 15                	jne    835 <printf+0xfa>
          s = "(null)";
 820:	be 7e 0a 00 00       	mov    $0xa7e,%esi
 825:	eb 0e                	jmp    835 <printf+0xfa>
          putc(fd, *s);
 827:	0f be d2             	movsbl %dl,%edx
 82a:	8b 45 08             	mov    0x8(%ebp),%eax
 82d:	e8 64 fe ff ff       	call   696 <putc>
          s++;
 832:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 835:	0f b6 16             	movzbl (%esi),%edx
 838:	84 d2                	test   %dl,%dl
 83a:	75 eb                	jne    827 <printf+0xec>
      state = 0;
 83c:	be 00 00 00 00       	mov    $0x0,%esi
 841:	e9 21 ff ff ff       	jmp    767 <printf+0x2c>
        putc(fd, *ap);
 846:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 849:	0f be 17             	movsbl (%edi),%edx
 84c:	8b 45 08             	mov    0x8(%ebp),%eax
 84f:	e8 42 fe ff ff       	call   696 <putc>
        ap++;
 854:	83 c7 04             	add    $0x4,%edi
 857:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 85a:	be 00 00 00 00       	mov    $0x0,%esi
 85f:	e9 03 ff ff ff       	jmp    767 <printf+0x2c>
        putc(fd, c);
 864:	89 fa                	mov    %edi,%edx
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	e8 28 fe ff ff       	call   696 <putc>
      state = 0;
 86e:	be 00 00 00 00       	mov    $0x0,%esi
 873:	e9 ef fe ff ff       	jmp    767 <printf+0x2c>
        putc(fd, '%');
 878:	ba 25 00 00 00       	mov    $0x25,%edx
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
 880:	e8 11 fe ff ff       	call   696 <putc>
        putc(fd, c);
 885:	89 fa                	mov    %edi,%edx
 887:	8b 45 08             	mov    0x8(%ebp),%eax
 88a:	e8 07 fe ff ff       	call   696 <putc>
      state = 0;
 88f:	be 00 00 00 00       	mov    $0x0,%esi
 894:	e9 ce fe ff ff       	jmp    767 <printf+0x2c>
    }
  }
}
 899:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89c:	5b                   	pop    %ebx
 89d:	5e                   	pop    %esi
 89e:	5f                   	pop    %edi
 89f:	5d                   	pop    %ebp
 8a0:	c3                   	ret    

000008a1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a1:	55                   	push   %ebp
 8a2:	89 e5                	mov    %esp,%ebp
 8a4:	57                   	push   %edi
 8a5:	56                   	push   %esi
 8a6:	53                   	push   %ebx
 8a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8aa:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ad:	a1 78 0e 00 00       	mov    0xe78,%eax
 8b2:	eb 02                	jmp    8b6 <free+0x15>
 8b4:	89 d0                	mov    %edx,%eax
 8b6:	39 c8                	cmp    %ecx,%eax
 8b8:	73 04                	jae    8be <free+0x1d>
 8ba:	39 08                	cmp    %ecx,(%eax)
 8bc:	77 12                	ja     8d0 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8be:	8b 10                	mov    (%eax),%edx
 8c0:	39 c2                	cmp    %eax,%edx
 8c2:	77 f0                	ja     8b4 <free+0x13>
 8c4:	39 c8                	cmp    %ecx,%eax
 8c6:	72 08                	jb     8d0 <free+0x2f>
 8c8:	39 ca                	cmp    %ecx,%edx
 8ca:	77 04                	ja     8d0 <free+0x2f>
 8cc:	89 d0                	mov    %edx,%eax
 8ce:	eb e6                	jmp    8b6 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d6:	8b 10                	mov    (%eax),%edx
 8d8:	39 d7                	cmp    %edx,%edi
 8da:	74 19                	je     8f5 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8dc:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8df:	8b 50 04             	mov    0x4(%eax),%edx
 8e2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e5:	39 ce                	cmp    %ecx,%esi
 8e7:	74 1b                	je     904 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8eb:	a3 78 0e 00 00       	mov    %eax,0xe78
}
 8f0:	5b                   	pop    %ebx
 8f1:	5e                   	pop    %esi
 8f2:	5f                   	pop    %edi
 8f3:	5d                   	pop    %ebp
 8f4:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8f5:	03 72 04             	add    0x4(%edx),%esi
 8f8:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8fb:	8b 10                	mov    (%eax),%edx
 8fd:	8b 12                	mov    (%edx),%edx
 8ff:	89 53 f8             	mov    %edx,-0x8(%ebx)
 902:	eb db                	jmp    8df <free+0x3e>
    p->s.size += bp->s.size;
 904:	03 53 fc             	add    -0x4(%ebx),%edx
 907:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 90a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 90d:	89 10                	mov    %edx,(%eax)
 90f:	eb da                	jmp    8eb <free+0x4a>

00000911 <morecore>:

static Header*
morecore(uint nu)
{
 911:	55                   	push   %ebp
 912:	89 e5                	mov    %esp,%ebp
 914:	53                   	push   %ebx
 915:	83 ec 04             	sub    $0x4,%esp
 918:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 91a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 91f:	77 05                	ja     926 <morecore+0x15>
    nu = 4096;
 921:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 926:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 92d:	83 ec 0c             	sub    $0xc,%esp
 930:	50                   	push   %eax
 931:	e8 38 fd ff ff       	call   66e <sbrk>
  if(p == (char*)-1)
 936:	83 c4 10             	add    $0x10,%esp
 939:	83 f8 ff             	cmp    $0xffffffff,%eax
 93c:	74 1c                	je     95a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 93e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 941:	83 c0 08             	add    $0x8,%eax
 944:	83 ec 0c             	sub    $0xc,%esp
 947:	50                   	push   %eax
 948:	e8 54 ff ff ff       	call   8a1 <free>
  return freep;
 94d:	a1 78 0e 00 00       	mov    0xe78,%eax
 952:	83 c4 10             	add    $0x10,%esp
}
 955:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 958:	c9                   	leave  
 959:	c3                   	ret    
    return 0;
 95a:	b8 00 00 00 00       	mov    $0x0,%eax
 95f:	eb f4                	jmp    955 <morecore+0x44>

00000961 <malloc>:

void*
malloc(uint nbytes)
{
 961:	55                   	push   %ebp
 962:	89 e5                	mov    %esp,%ebp
 964:	53                   	push   %ebx
 965:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 968:	8b 45 08             	mov    0x8(%ebp),%eax
 96b:	8d 58 07             	lea    0x7(%eax),%ebx
 96e:	c1 eb 03             	shr    $0x3,%ebx
 971:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 974:	8b 0d 78 0e 00 00    	mov    0xe78,%ecx
 97a:	85 c9                	test   %ecx,%ecx
 97c:	74 04                	je     982 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97e:	8b 01                	mov    (%ecx),%eax
 980:	eb 4a                	jmp    9cc <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 982:	c7 05 78 0e 00 00 7c 	movl   $0xe7c,0xe78
 989:	0e 00 00 
 98c:	c7 05 7c 0e 00 00 7c 	movl   $0xe7c,0xe7c
 993:	0e 00 00 
    base.s.size = 0;
 996:	c7 05 80 0e 00 00 00 	movl   $0x0,0xe80
 99d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9a0:	b9 7c 0e 00 00       	mov    $0xe7c,%ecx
 9a5:	eb d7                	jmp    97e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9a7:	74 19                	je     9c2 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a9:	29 da                	sub    %ebx,%edx
 9ab:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ae:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9b1:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9b4:	89 0d 78 0e 00 00    	mov    %ecx,0xe78
      return (void*)(p + 1);
 9ba:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9c0:	c9                   	leave  
 9c1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c2:	8b 10                	mov    (%eax),%edx
 9c4:	89 11                	mov    %edx,(%ecx)
 9c6:	eb ec                	jmp    9b4 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c8:	89 c1                	mov    %eax,%ecx
 9ca:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9cc:	8b 50 04             	mov    0x4(%eax),%edx
 9cf:	39 da                	cmp    %ebx,%edx
 9d1:	73 d4                	jae    9a7 <malloc+0x46>
    if(p == freep)
 9d3:	39 05 78 0e 00 00    	cmp    %eax,0xe78
 9d9:	75 ed                	jne    9c8 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9db:	89 d8                	mov    %ebx,%eax
 9dd:	e8 2f ff ff ff       	call   911 <morecore>
 9e2:	85 c0                	test   %eax,%eax
 9e4:	75 e2                	jne    9c8 <malloc+0x67>
 9e6:	eb d5                	jmp    9bd <malloc+0x5c>
