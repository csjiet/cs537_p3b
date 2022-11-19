
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
   b:	e8 ad 05 00 00       	call   5bd <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 55 06 00 00       	call   671 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 6c 0e 00 00    	cmp    0xe6c,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 ec 09 00 00       	push   $0x9ec
  2e:	68 f6 09 00 00       	push   $0x9f6
  33:	6a 01                	push   $0x1
  35:	e8 04 07 00 00       	call   73e <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 fe 09 00 00       	push   $0x9fe
  42:	68 1c 0a 00 00       	push   $0xa1c
  47:	6a 01                	push   $0x1
  49:	e8 f0 06 00 00       	call   73e <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 30 0a 00 00       	push   $0xa30
  56:	6a 01                	push   $0x1
  58:	e8 e1 06 00 00       	call   73e <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 74 0e 00 00    	push   0xe74
  66:	e8 ae 05 00 00       	call   619 <kill>
  6b:	e8 79 05 00 00       	call   5e9 <exit>
   global++;
  70:	83 05 70 0e 00 00 01 	addl   $0x1,0xe70
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 68 0e 00 00       	push   $0xe68
  7f:	e8 4d 05 00 00       	call   5d1 <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 64 0e 00 00 	movl   $0xe64,(%esp)
  8b:	e8 2d 05 00 00       	call   5bd <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 d5 05 00 00       	call   671 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 6c 0e 00 00    	cmp    0xe6c,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 ec 09 00 00       	push   $0x9ec
  ae:	68 f6 09 00 00       	push   $0x9f6
  b3:	6a 01                	push   $0x1
  b5:	e8 84 06 00 00       	call   73e <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 fe 09 00 00       	push   $0x9fe
  c2:	68 1c 0a 00 00       	push   $0xa1c
  c7:	6a 01                	push   $0x1
  c9:	e8 70 06 00 00       	call   73e <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 30 0a 00 00       	push   $0xa30
  d6:	6a 01                	push   $0x1
  d8:	e8 61 06 00 00       	call   73e <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 74 0e 00 00    	push   0xe74
  e6:	e8 2e 05 00 00       	call   619 <kill>
  eb:	e8 f9 04 00 00       	call   5e9 <exit>
   global++;
  f0:	83 05 70 0e 00 00 01 	addl   $0x1,0xe70
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 64 0e 00 00       	push   $0xe64
  ff:	e8 cd 04 00 00       	call   5d1 <lock_release>

   
   exit();
 104:	e8 e0 04 00 00       	call   5e9 <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 68 0e 00 00       	push   $0xe68
 114:	e8 96 04 00 00       	call   5af <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 64 0e 00 00 	movl   $0xe64,(%esp)
 120:	e8 8a 04 00 00       	call   5af <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 68 0e 00 00 	movl   $0xe68,(%esp)
 12c:	e8 8c 04 00 00       	call   5bd <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 64 0e 00 00 	movl   $0xe64,(%esp)
 138:	e8 80 04 00 00       	call   5bd <lock_acquire>

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
 15a:	e8 12 05 00 00       	call   671 <sbrk>
 15f:	a3 6c 0e 00 00       	mov    %eax,0xe6c

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 ec 09 00 00       	push   $0x9ec
 170:	68 f6 09 00 00       	push   $0x9f6
 175:	6a 01                	push   $0x1
 177:	e8 c2 05 00 00       	call   73e <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 3d 0a 00 00       	push   $0xa3d
 184:	68 1c 0a 00 00       	push   $0xa1c
 189:	6a 01                	push   $0x1
 18b:	e8 ae 05 00 00       	call   73e <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 30 0a 00 00       	push   $0xa30
 198:	6a 01                	push   $0x1
 19a:	e8 9f 05 00 00       	call   73e <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 74 0e 00 00    	push   0xe74
 1a8:	e8 6c 04 00 00       	call   619 <kill>
 1ad:	e8 37 04 00 00       	call   5e9 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 68 0e 00 00       	push   $0xe68
 1ba:	e8 12 04 00 00       	call   5d1 <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 ae 04 00 00       	call   679 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 68 0e 00 00 	movl   $0xe68,(%esp)
 1d2:	e8 e6 03 00 00       	call   5bd <lock_acquire>
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
 1f9:	e8 73 04 00 00       	call   671 <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 67 04 00 00       	call   671 <sbrk>
 20a:	a3 6c 0e 00 00       	mov    %eax,0xe6c
   lock_release(&lock);
 20f:	c7 04 24 68 0e 00 00 	movl   $0xe68,(%esp)
 216:	e8 b6 03 00 00       	call   5d1 <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 64 0e 00 00       	push   $0xe64
 228:	e8 a4 03 00 00       	call   5d1 <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 40 04 00 00       	call   679 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 64 0e 00 00 	movl   $0xe64,(%esp)
 240:	e8 78 03 00 00       	call   5bd <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 60 0e 00 00       	mov    0xe60,%eax
 24d:	39 05 70 0e 00 00    	cmp    %eax,0xe70
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 64 0e 00 00       	push   $0xe64
 25d:	e8 6f 03 00 00       	call   5d1 <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 24 03 00 00       	call   58b <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 76 03 00 00       	call   5e9 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 ec 09 00 00       	push   $0x9ec
 27a:	68 f6 09 00 00       	push   $0x9f6
 27f:	6a 01                	push   $0x1
 281:	e8 b8 04 00 00       	call   73e <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 52 0a 00 00       	push   $0xa52
 28e:	68 1c 0a 00 00       	push   $0xa1c
 293:	6a 01                	push   $0x1
 295:	e8 a4 04 00 00       	call   73e <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 30 0a 00 00       	push   $0xa30
 2a2:	6a 01                	push   $0x1
 2a4:	e8 95 04 00 00       	call   73e <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 74 0e 00 00    	push   0xe74
 2b2:	e8 62 03 00 00       	call   619 <kill>
 2b7:	e8 2d 03 00 00       	call   5e9 <exit>

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
 2cd:	e8 97 03 00 00       	call   669 <getpid>
 2d2:	a3 74 0e 00 00       	mov    %eax,0xe74
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 82 03 00 00       	call   671 <sbrk>
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
 310:	e8 76 02 00 00       	call   58b <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 75 0a 00 00       	push   $0xa75
 321:	6a 01                	push   $0x1
 323:	e8 16 04 00 00       	call   73e <printf>
   exit();
 328:	e8 bc 02 00 00       	call   5e9 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 ec 09 00 00       	push   $0x9ec
 334:	68 f6 09 00 00       	push   $0x9f6
 339:	6a 01                	push   $0x1
 33b:	e8 fe 03 00 00       	call   73e <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 66 0a 00 00       	push   $0xa66
 348:	68 1c 0a 00 00       	push   $0xa1c
 34d:	6a 01                	push   $0x1
 34f:	e8 ea 03 00 00       	call   73e <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 30 0a 00 00       	push   $0xa30
 35c:	6a 01                	push   $0x1
 35e:	e8 db 03 00 00       	call   73e <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 74 0e 00 00    	push   0xe74
 36c:	e8 a8 02 00 00       	call   619 <kill>
 371:	e8 73 02 00 00       	call   5e9 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 ec 09 00 00       	push   $0x9ec
 37d:	68 f6 09 00 00       	push   $0x9f6
 382:	6a 01                	push   $0x1
 384:	e8 b5 03 00 00       	call   73e <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 59 0a 00 00       	push   $0xa59
 391:	68 1c 0a 00 00       	push   $0xa1c
 396:	6a 01                	push   $0x1
 398:	e8 a1 03 00 00       	call   73e <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 30 0a 00 00       	push   $0xa30
 3a5:	6a 01                	push   $0x1
 3a7:	e8 92 03 00 00       	call   73e <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 74 0e 00 00    	push   0xe74
 3b5:	e8 5f 02 00 00       	call   619 <kill>
 3ba:	e8 2a 02 00 00       	call   5e9 <exit>

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
 485:	e8 77 01 00 00       	call   601 <read>
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
 4c3:	e8 61 01 00 00       	call   629 <open>
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
 4d8:	e8 64 01 00 00       	call   641 <fstat>
 4dd:	89 c6                	mov    %eax,%esi
  close(fd);
 4df:	89 1c 24             	mov    %ebx,(%esp)
 4e2:	e8 2a 01 00 00       	call   611 <close>
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

  void* stack = malloc(2 * PGSIZE);
 55c:	68 00 20 00 00       	push   $0x2000
 561:	e8 fe 03 00 00       	call   964 <malloc>
  if ((uint)stack%PGSIZE){
 566:	83 c4 10             	add    $0x10,%esp
 569:	a9 ff 0f 00 00       	test   $0xfff,%eax
 56e:	74 0a                	je     57a <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 570:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 575:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 57a:	50                   	push   %eax
 57b:	ff 75 10             	push   0x10(%ebp)
 57e:	ff 75 0c             	push   0xc(%ebp)
 581:	ff 75 08             	push   0x8(%ebp)
 584:	e8 00 01 00 00       	call   689 <clone>
}
 589:	c9                   	leave  
 58a:	c3                   	ret    

0000058b <thread_join>:

int thread_join(){
 58b:	55                   	push   %ebp
 58c:	89 e5                	mov    %esp,%ebp
 58e:	53                   	push   %ebx
 58f:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 592:	8d 45 f4             	lea    -0xc(%ebp),%eax
 595:	50                   	push   %eax
 596:	e8 f6 00 00 00       	call   691 <join>
 59b:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 59d:	83 c4 04             	add    $0x4,%esp
 5a0:	ff 75 f4             	push   -0xc(%ebp)
 5a3:	e8 fc 02 00 00       	call   8a4 <free>
  return x;
}
 5a8:	89 d8                	mov    %ebx,%eax
 5aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ad:	c9                   	leave  
 5ae:	c3                   	ret    

000005af <lock_init>:

void lock_init(lock_t *spin){
 5af:	55                   	push   %ebp
 5b0:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5bb:	5d                   	pop    %ebp
 5bc:	c3                   	ret    

000005bd <lock_acquire>:

void lock_acquire(lock_t *spin){
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 5c3:	b8 01 00 00 00       	mov    $0x1,%eax
 5c8:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 5cb:	85 c0                	test   %eax,%eax
 5cd:	75 f4                	jne    5c3 <lock_acquire+0x6>

}
 5cf:	5d                   	pop    %ebp
 5d0:	c3                   	ret    

000005d1 <lock_release>:

void lock_release(lock_t *spin){
 5d1:	55                   	push   %ebp
 5d2:	89 e5                	mov    %esp,%ebp
 5d4:	8b 55 08             	mov    0x8(%ebp),%edx
 5d7:	b8 00 00 00 00       	mov    $0x0,%eax
 5dc:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 5df:	5d                   	pop    %ebp
 5e0:	c3                   	ret    

000005e1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5e1:	b8 01 00 00 00       	mov    $0x1,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <exit>:
SYSCALL(exit)
 5e9:	b8 02 00 00 00       	mov    $0x2,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <wait>:
SYSCALL(wait)
 5f1:	b8 03 00 00 00       	mov    $0x3,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <pipe>:
SYSCALL(pipe)
 5f9:	b8 04 00 00 00       	mov    $0x4,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <read>:
SYSCALL(read)
 601:	b8 05 00 00 00       	mov    $0x5,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <write>:
SYSCALL(write)
 609:	b8 10 00 00 00       	mov    $0x10,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <close>:
SYSCALL(close)
 611:	b8 15 00 00 00       	mov    $0x15,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <kill>:
SYSCALL(kill)
 619:	b8 06 00 00 00       	mov    $0x6,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <exec>:
SYSCALL(exec)
 621:	b8 07 00 00 00       	mov    $0x7,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <open>:
SYSCALL(open)
 629:	b8 0f 00 00 00       	mov    $0xf,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <mknod>:
SYSCALL(mknod)
 631:	b8 11 00 00 00       	mov    $0x11,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <unlink>:
SYSCALL(unlink)
 639:	b8 12 00 00 00       	mov    $0x12,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <fstat>:
SYSCALL(fstat)
 641:	b8 08 00 00 00       	mov    $0x8,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <link>:
SYSCALL(link)
 649:	b8 13 00 00 00       	mov    $0x13,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <mkdir>:
SYSCALL(mkdir)
 651:	b8 14 00 00 00       	mov    $0x14,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <chdir>:
SYSCALL(chdir)
 659:	b8 09 00 00 00       	mov    $0x9,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <dup>:
SYSCALL(dup)
 661:	b8 0a 00 00 00       	mov    $0xa,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <getpid>:
SYSCALL(getpid)
 669:	b8 0b 00 00 00       	mov    $0xb,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <sbrk>:
SYSCALL(sbrk)
 671:	b8 0c 00 00 00       	mov    $0xc,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <sleep>:
SYSCALL(sleep)
 679:	b8 0d 00 00 00       	mov    $0xd,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <uptime>:
SYSCALL(uptime)
 681:	b8 0e 00 00 00       	mov    $0xe,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <clone>:
SYSCALL(clone)
 689:	b8 16 00 00 00       	mov    $0x16,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <join>:
 691:	b8 17 00 00 00       	mov    $0x17,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 699:	55                   	push   %ebp
 69a:	89 e5                	mov    %esp,%ebp
 69c:	83 ec 1c             	sub    $0x1c,%esp
 69f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6a2:	6a 01                	push   $0x1
 6a4:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6a7:	52                   	push   %edx
 6a8:	50                   	push   %eax
 6a9:	e8 5b ff ff ff       	call   609 <write>
}
 6ae:	83 c4 10             	add    $0x10,%esp
 6b1:	c9                   	leave  
 6b2:	c3                   	ret    

000006b3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b3:	55                   	push   %ebp
 6b4:	89 e5                	mov    %esp,%ebp
 6b6:	57                   	push   %edi
 6b7:	56                   	push   %esi
 6b8:	53                   	push   %ebx
 6b9:	83 ec 2c             	sub    $0x2c,%esp
 6bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6bf:	89 d0                	mov    %edx,%eax
 6c1:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6c3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6c7:	0f 95 c1             	setne  %cl
 6ca:	c1 ea 1f             	shr    $0x1f,%edx
 6cd:	84 d1                	test   %dl,%cl
 6cf:	74 44                	je     715 <printint+0x62>
    neg = 1;
    x = -xx;
 6d1:	f7 d8                	neg    %eax
 6d3:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6d5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6dc:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6e1:	89 c8                	mov    %ecx,%eax
 6e3:	ba 00 00 00 00       	mov    $0x0,%edx
 6e8:	f7 f6                	div    %esi
 6ea:	89 df                	mov    %ebx,%edi
 6ec:	83 c3 01             	add    $0x1,%ebx
 6ef:	0f b6 92 e4 0a 00 00 	movzbl 0xae4(%edx),%edx
 6f6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6fa:	89 ca                	mov    %ecx,%edx
 6fc:	89 c1                	mov    %eax,%ecx
 6fe:	39 d6                	cmp    %edx,%esi
 700:	76 df                	jbe    6e1 <printint+0x2e>
  if(neg)
 702:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 706:	74 31                	je     739 <printint+0x86>
    buf[i++] = '-';
 708:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 70d:	8d 5f 02             	lea    0x2(%edi),%ebx
 710:	8b 75 d0             	mov    -0x30(%ebp),%esi
 713:	eb 17                	jmp    72c <printint+0x79>
    x = xx;
 715:	89 c1                	mov    %eax,%ecx
  neg = 0;
 717:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 71e:	eb bc                	jmp    6dc <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 720:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 725:	89 f0                	mov    %esi,%eax
 727:	e8 6d ff ff ff       	call   699 <putc>
  while(--i >= 0)
 72c:	83 eb 01             	sub    $0x1,%ebx
 72f:	79 ef                	jns    720 <printint+0x6d>
}
 731:	83 c4 2c             	add    $0x2c,%esp
 734:	5b                   	pop    %ebx
 735:	5e                   	pop    %esi
 736:	5f                   	pop    %edi
 737:	5d                   	pop    %ebp
 738:	c3                   	ret    
 739:	8b 75 d0             	mov    -0x30(%ebp),%esi
 73c:	eb ee                	jmp    72c <printint+0x79>

0000073e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 73e:	55                   	push   %ebp
 73f:	89 e5                	mov    %esp,%ebp
 741:	57                   	push   %edi
 742:	56                   	push   %esi
 743:	53                   	push   %ebx
 744:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 747:	8d 45 10             	lea    0x10(%ebp),%eax
 74a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 74d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 752:	bb 00 00 00 00       	mov    $0x0,%ebx
 757:	eb 14                	jmp    76d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 759:	89 fa                	mov    %edi,%edx
 75b:	8b 45 08             	mov    0x8(%ebp),%eax
 75e:	e8 36 ff ff ff       	call   699 <putc>
 763:	eb 05                	jmp    76a <printf+0x2c>
      }
    } else if(state == '%'){
 765:	83 fe 25             	cmp    $0x25,%esi
 768:	74 25                	je     78f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 76a:	83 c3 01             	add    $0x1,%ebx
 76d:	8b 45 0c             	mov    0xc(%ebp),%eax
 770:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 774:	84 c0                	test   %al,%al
 776:	0f 84 20 01 00 00    	je     89c <printf+0x15e>
    c = fmt[i] & 0xff;
 77c:	0f be f8             	movsbl %al,%edi
 77f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 782:	85 f6                	test   %esi,%esi
 784:	75 df                	jne    765 <printf+0x27>
      if(c == '%'){
 786:	83 f8 25             	cmp    $0x25,%eax
 789:	75 ce                	jne    759 <printf+0x1b>
        state = '%';
 78b:	89 c6                	mov    %eax,%esi
 78d:	eb db                	jmp    76a <printf+0x2c>
      if(c == 'd'){
 78f:	83 f8 25             	cmp    $0x25,%eax
 792:	0f 84 cf 00 00 00    	je     867 <printf+0x129>
 798:	0f 8c dd 00 00 00    	jl     87b <printf+0x13d>
 79e:	83 f8 78             	cmp    $0x78,%eax
 7a1:	0f 8f d4 00 00 00    	jg     87b <printf+0x13d>
 7a7:	83 f8 63             	cmp    $0x63,%eax
 7aa:	0f 8c cb 00 00 00    	jl     87b <printf+0x13d>
 7b0:	83 e8 63             	sub    $0x63,%eax
 7b3:	83 f8 15             	cmp    $0x15,%eax
 7b6:	0f 87 bf 00 00 00    	ja     87b <printf+0x13d>
 7bc:	ff 24 85 8c 0a 00 00 	jmp    *0xa8c(,%eax,4)
        printint(fd, *ap, 10, 1);
 7c3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c6:	8b 17                	mov    (%edi),%edx
 7c8:	83 ec 0c             	sub    $0xc,%esp
 7cb:	6a 01                	push   $0x1
 7cd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	e8 d9 fe ff ff       	call   6b3 <printint>
        ap++;
 7da:	83 c7 04             	add    $0x4,%edi
 7dd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7e0:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7e3:	be 00 00 00 00       	mov    $0x0,%esi
 7e8:	eb 80                	jmp    76a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ed:	8b 17                	mov    (%edi),%edx
 7ef:	83 ec 0c             	sub    $0xc,%esp
 7f2:	6a 00                	push   $0x0
 7f4:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
 7fc:	e8 b2 fe ff ff       	call   6b3 <printint>
        ap++;
 801:	83 c7 04             	add    $0x4,%edi
 804:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 807:	83 c4 10             	add    $0x10,%esp
      state = 0;
 80a:	be 00 00 00 00       	mov    $0x0,%esi
 80f:	e9 56 ff ff ff       	jmp    76a <printf+0x2c>
        s = (char*)*ap;
 814:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 817:	8b 30                	mov    (%eax),%esi
        ap++;
 819:	83 c0 04             	add    $0x4,%eax
 81c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 81f:	85 f6                	test   %esi,%esi
 821:	75 15                	jne    838 <printf+0xfa>
          s = "(null)";
 823:	be 82 0a 00 00       	mov    $0xa82,%esi
 828:	eb 0e                	jmp    838 <printf+0xfa>
          putc(fd, *s);
 82a:	0f be d2             	movsbl %dl,%edx
 82d:	8b 45 08             	mov    0x8(%ebp),%eax
 830:	e8 64 fe ff ff       	call   699 <putc>
          s++;
 835:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 838:	0f b6 16             	movzbl (%esi),%edx
 83b:	84 d2                	test   %dl,%dl
 83d:	75 eb                	jne    82a <printf+0xec>
      state = 0;
 83f:	be 00 00 00 00       	mov    $0x0,%esi
 844:	e9 21 ff ff ff       	jmp    76a <printf+0x2c>
        putc(fd, *ap);
 849:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 84c:	0f be 17             	movsbl (%edi),%edx
 84f:	8b 45 08             	mov    0x8(%ebp),%eax
 852:	e8 42 fe ff ff       	call   699 <putc>
        ap++;
 857:	83 c7 04             	add    $0x4,%edi
 85a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 85d:	be 00 00 00 00       	mov    $0x0,%esi
 862:	e9 03 ff ff ff       	jmp    76a <printf+0x2c>
        putc(fd, c);
 867:	89 fa                	mov    %edi,%edx
 869:	8b 45 08             	mov    0x8(%ebp),%eax
 86c:	e8 28 fe ff ff       	call   699 <putc>
      state = 0;
 871:	be 00 00 00 00       	mov    $0x0,%esi
 876:	e9 ef fe ff ff       	jmp    76a <printf+0x2c>
        putc(fd, '%');
 87b:	ba 25 00 00 00       	mov    $0x25,%edx
 880:	8b 45 08             	mov    0x8(%ebp),%eax
 883:	e8 11 fe ff ff       	call   699 <putc>
        putc(fd, c);
 888:	89 fa                	mov    %edi,%edx
 88a:	8b 45 08             	mov    0x8(%ebp),%eax
 88d:	e8 07 fe ff ff       	call   699 <putc>
      state = 0;
 892:	be 00 00 00 00       	mov    $0x0,%esi
 897:	e9 ce fe ff ff       	jmp    76a <printf+0x2c>
    }
  }
}
 89c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89f:	5b                   	pop    %ebx
 8a0:	5e                   	pop    %esi
 8a1:	5f                   	pop    %edi
 8a2:	5d                   	pop    %ebp
 8a3:	c3                   	ret    

000008a4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a4:	55                   	push   %ebp
 8a5:	89 e5                	mov    %esp,%ebp
 8a7:	57                   	push   %edi
 8a8:	56                   	push   %esi
 8a9:	53                   	push   %ebx
 8aa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8ad:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b0:	a1 78 0e 00 00       	mov    0xe78,%eax
 8b5:	eb 02                	jmp    8b9 <free+0x15>
 8b7:	89 d0                	mov    %edx,%eax
 8b9:	39 c8                	cmp    %ecx,%eax
 8bb:	73 04                	jae    8c1 <free+0x1d>
 8bd:	39 08                	cmp    %ecx,(%eax)
 8bf:	77 12                	ja     8d3 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c1:	8b 10                	mov    (%eax),%edx
 8c3:	39 c2                	cmp    %eax,%edx
 8c5:	77 f0                	ja     8b7 <free+0x13>
 8c7:	39 c8                	cmp    %ecx,%eax
 8c9:	72 08                	jb     8d3 <free+0x2f>
 8cb:	39 ca                	cmp    %ecx,%edx
 8cd:	77 04                	ja     8d3 <free+0x2f>
 8cf:	89 d0                	mov    %edx,%eax
 8d1:	eb e6                	jmp    8b9 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d3:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d9:	8b 10                	mov    (%eax),%edx
 8db:	39 d7                	cmp    %edx,%edi
 8dd:	74 19                	je     8f8 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8df:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8e2:	8b 50 04             	mov    0x4(%eax),%edx
 8e5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e8:	39 ce                	cmp    %ecx,%esi
 8ea:	74 1b                	je     907 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8ec:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8ee:	a3 78 0e 00 00       	mov    %eax,0xe78
}
 8f3:	5b                   	pop    %ebx
 8f4:	5e                   	pop    %esi
 8f5:	5f                   	pop    %edi
 8f6:	5d                   	pop    %ebp
 8f7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8f8:	03 72 04             	add    0x4(%edx),%esi
 8fb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8fe:	8b 10                	mov    (%eax),%edx
 900:	8b 12                	mov    (%edx),%edx
 902:	89 53 f8             	mov    %edx,-0x8(%ebx)
 905:	eb db                	jmp    8e2 <free+0x3e>
    p->s.size += bp->s.size;
 907:	03 53 fc             	add    -0x4(%ebx),%edx
 90a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 90d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 910:	89 10                	mov    %edx,(%eax)
 912:	eb da                	jmp    8ee <free+0x4a>

00000914 <morecore>:

static Header*
morecore(uint nu)
{
 914:	55                   	push   %ebp
 915:	89 e5                	mov    %esp,%ebp
 917:	53                   	push   %ebx
 918:	83 ec 04             	sub    $0x4,%esp
 91b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 91d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 922:	77 05                	ja     929 <morecore+0x15>
    nu = 4096;
 924:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 929:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 930:	83 ec 0c             	sub    $0xc,%esp
 933:	50                   	push   %eax
 934:	e8 38 fd ff ff       	call   671 <sbrk>
  if(p == (char*)-1)
 939:	83 c4 10             	add    $0x10,%esp
 93c:	83 f8 ff             	cmp    $0xffffffff,%eax
 93f:	74 1c                	je     95d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 941:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 944:	83 c0 08             	add    $0x8,%eax
 947:	83 ec 0c             	sub    $0xc,%esp
 94a:	50                   	push   %eax
 94b:	e8 54 ff ff ff       	call   8a4 <free>
  return freep;
 950:	a1 78 0e 00 00       	mov    0xe78,%eax
 955:	83 c4 10             	add    $0x10,%esp
}
 958:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 95b:	c9                   	leave  
 95c:	c3                   	ret    
    return 0;
 95d:	b8 00 00 00 00       	mov    $0x0,%eax
 962:	eb f4                	jmp    958 <morecore+0x44>

00000964 <malloc>:

void*
malloc(uint nbytes)
{
 964:	55                   	push   %ebp
 965:	89 e5                	mov    %esp,%ebp
 967:	53                   	push   %ebx
 968:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 96b:	8b 45 08             	mov    0x8(%ebp),%eax
 96e:	8d 58 07             	lea    0x7(%eax),%ebx
 971:	c1 eb 03             	shr    $0x3,%ebx
 974:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 977:	8b 0d 78 0e 00 00    	mov    0xe78,%ecx
 97d:	85 c9                	test   %ecx,%ecx
 97f:	74 04                	je     985 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 981:	8b 01                	mov    (%ecx),%eax
 983:	eb 4a                	jmp    9cf <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 985:	c7 05 78 0e 00 00 7c 	movl   $0xe7c,0xe78
 98c:	0e 00 00 
 98f:	c7 05 7c 0e 00 00 7c 	movl   $0xe7c,0xe7c
 996:	0e 00 00 
    base.s.size = 0;
 999:	c7 05 80 0e 00 00 00 	movl   $0x0,0xe80
 9a0:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9a3:	b9 7c 0e 00 00       	mov    $0xe7c,%ecx
 9a8:	eb d7                	jmp    981 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9aa:	74 19                	je     9c5 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9ac:	29 da                	sub    %ebx,%edx
 9ae:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b1:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9b4:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9b7:	89 0d 78 0e 00 00    	mov    %ecx,0xe78
      return (void*)(p + 1);
 9bd:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9c3:	c9                   	leave  
 9c4:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c5:	8b 10                	mov    (%eax),%edx
 9c7:	89 11                	mov    %edx,(%ecx)
 9c9:	eb ec                	jmp    9b7 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9cb:	89 c1                	mov    %eax,%ecx
 9cd:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9cf:	8b 50 04             	mov    0x4(%eax),%edx
 9d2:	39 da                	cmp    %ebx,%edx
 9d4:	73 d4                	jae    9aa <malloc+0x46>
    if(p == freep)
 9d6:	39 05 78 0e 00 00    	cmp    %eax,0xe78
 9dc:	75 ed                	jne    9cb <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9de:	89 d8                	mov    %ebx,%eax
 9e0:	e8 2f ff ff ff       	call   914 <morecore>
 9e5:	85 c0                	test   %eax,%eax
 9e7:	75 e2                	jne    9cb <malloc+0x67>
 9e9:	eb d5                	jmp    9c0 <malloc+0x5c>
