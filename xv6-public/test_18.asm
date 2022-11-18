
_test_18:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:

   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1,void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
    int j;
    lock_acquire(&lock);
   6:	68 a8 0d 00 00       	push   $0xda8
   b:	e8 d4 04 00 00       	call   4e4 <lock_acquire>
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
  22:	83 05 ac 0d 00 00 01 	addl   $0x1,0xdac
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 a8 0d 00 00       	push   $0xda8
  31:	e8 c2 04 00 00       	call   4f8 <lock_release>
    exit();
  36:	e8 d5 04 00 00       	call   510 <exit>

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
  42:	68 a8 0d 00 00       	push   $0xda8
  47:	e8 98 04 00 00       	call   4e4 <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
  5e:	83 05 ac 0d 00 00 01 	addl   $0x1,0xdac
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 a8 0d 00 00       	push   $0xda8
  6d:	e8 86 04 00 00       	call   4f8 <lock_release>

    int nested_thread_pid = thread_create(worker2, 0, 0);
  72:	83 c4 0c             	add    $0xc,%esp
  75:	6a 00                	push   $0x0
  77:	6a 00                	push   $0x0
  79:	68 00 00 00 00       	push   $0x0
  7e:	e8 fd 03 00 00       	call   480 <thread_create>
  83:	89 c3                	mov    %eax,%ebx
    assert(nested_thread_pid > 0);
  85:	83 c4 10             	add    $0x10,%esp
  88:	85 c0                	test   %eax,%eax
  8a:	7e 5e                	jle    ea <worker+0xaf>
    int nested_join_pid = thread_join();
  8c:	e8 10 04 00 00       	call   4a1 <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
  a3:	68 14 09 00 00       	push   $0x914
  a8:	68 1e 09 00 00       	push   $0x91e
  ad:	6a 01                	push   $0x1
  af:	e8 b1 05 00 00       	call   665 <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 98 09 00 00       	push   $0x998
  bc:	68 3c 09 00 00       	push   $0x93c
  c1:	6a 01                	push   $0x1
  c3:	e8 9d 05 00 00       	call   665 <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 50 09 00 00       	push   $0x950
  d0:	6a 01                	push   $0x1
  d2:	e8 8e 05 00 00       	call   665 <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 b0 0d 00 00    	push   0xdb0
  e0:	e8 5b 04 00 00       	call   540 <kill>
  e5:	e8 26 04 00 00       	call   510 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 14 09 00 00       	push   $0x914
  f1:	68 1e 09 00 00       	push   $0x91e
  f6:	6a 01                	push   $0x1
  f8:	e8 68 05 00 00       	call   665 <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 26 09 00 00       	push   $0x926
 105:	68 3c 09 00 00       	push   $0x93c
 10a:	6a 01                	push   $0x1
 10c:	e8 54 05 00 00       	call   665 <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 50 09 00 00       	push   $0x950
 119:	6a 01                	push   $0x1
 11b:	e8 45 05 00 00       	call   665 <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 b0 0d 00 00    	push   0xdb0
 129:	e8 12 04 00 00       	call   540 <kill>
 12e:	e8 dd 03 00 00       	call   510 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 14 09 00 00       	push   $0x914
 13a:	68 1e 09 00 00       	push   $0x91e
 13f:	6a 01                	push   $0x1
 141:	e8 1f 05 00 00       	call   665 <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 5d 09 00 00       	push   $0x95d
 14e:	68 3c 09 00 00       	push   $0x93c
 153:	6a 01                	push   $0x1
 155:	e8 0b 05 00 00       	call   665 <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 50 09 00 00       	push   $0x950
 162:	6a 01                	push   $0x1
 164:	e8 fc 04 00 00       	call   665 <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 b0 0d 00 00    	push   0xdb0
 172:	e8 c9 03 00 00       	call   540 <kill>
 177:	e8 94 03 00 00       	call   510 <exit>

   exit();
 17c:	e8 8f 03 00 00       	call   510 <exit>

00000181 <main>:
{
 181:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 185:	83 e4 f0             	and    $0xfffffff0,%esp
 188:	ff 71 fc             	push   -0x4(%ecx)
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	53                   	push   %ebx
 18f:	51                   	push   %ecx
   ppid = getpid();
 190:	e8 fb 03 00 00       	call   590 <getpid>
 195:	a3 b0 0d 00 00       	mov    %eax,0xdb0
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 a8 0d 00 00       	push   $0xda8
 1a2:	e8 2f 03 00 00       	call   4d6 <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d a4 0d 00 00    	cmp    %ebx,0xda4
 1ba:	7e 61                	jle    21d <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
 1bc:	83 ec 04             	sub    $0x4,%esp
 1bf:	6a 00                	push   $0x0
 1c1:	6a 00                	push   $0x0
 1c3:	68 3b 00 00 00       	push   $0x3b
 1c8:	e8 b3 02 00 00       	call   480 <thread_create>
      assert(thread_pid > 0);
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7f dd                	jg     1b1 <main+0x30>
 1d4:	6a 26                	push   $0x26
 1d6:	68 14 09 00 00       	push   $0x914
 1db:	68 1e 09 00 00       	push   $0x91e
 1e0:	6a 01                	push   $0x1
 1e2:	e8 7e 04 00 00       	call   665 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 2d 09 00 00       	push   $0x92d
 1ef:	68 3c 09 00 00       	push   $0x93c
 1f4:	6a 01                	push   $0x1
 1f6:	e8 6a 04 00 00       	call   665 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 50 09 00 00       	push   $0x950
 203:	6a 01                	push   $0x1
 205:	e8 5b 04 00 00       	call   665 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 b0 0d 00 00    	push   0xdb0
 213:	e8 28 03 00 00       	call   540 <kill>
 218:	e8 f3 02 00 00       	call   510 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 a4 0d 00 00       	mov    0xda4,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 71 02 00 00       	call   4a1 <thread_join>
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
 23b:	68 14 09 00 00       	push   $0x914
 240:	68 1e 09 00 00       	push   $0x91e
 245:	6a 01                	push   $0x1
 247:	e8 19 04 00 00       	call   665 <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 64 09 00 00       	push   $0x964
 254:	68 3c 09 00 00       	push   $0x93c
 259:	6a 01                	push   $0x1
 25b:	e8 05 04 00 00       	call   665 <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 50 09 00 00       	push   $0x950
 268:	6a 01                	push   $0x1
 26a:	e8 f6 03 00 00       	call   665 <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 b0 0d 00 00    	push   0xdb0
 278:	e8 c3 02 00 00       	call   540 <kill>
 27d:	e8 8e 02 00 00       	call   510 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 ac 0d 00 00    	cmp    0xdac,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 14 09 00 00       	push   $0x914
 293:	68 1e 09 00 00       	push   $0x91e
 298:	6a 01                	push   $0x1
 29a:	e8 c6 03 00 00       	call   665 <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 71 09 00 00       	push   $0x971
 2a7:	68 3c 09 00 00       	push   $0x93c
 2ac:	6a 01                	push   $0x1
 2ae:	e8 b2 03 00 00       	call   665 <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 50 09 00 00       	push   $0x950
 2bb:	6a 01                	push   $0x1
 2bd:	e8 a3 03 00 00       	call   665 <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 b0 0d 00 00    	push   0xdb0
 2cb:	e8 70 02 00 00       	call   540 <kill>
 2d0:	e8 3b 02 00 00       	call   510 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 8b 09 00 00       	push   $0x98b
 2dd:	6a 01                	push   $0x1
 2df:	e8 81 03 00 00       	call   665 <printf>
   exit();
 2e4:	e8 27 02 00 00       	call   510 <exit>

000002e9 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	56                   	push   %esi
 2ed:	53                   	push   %ebx
 2ee:	8b 75 08             	mov    0x8(%ebp),%esi
 2f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2f4:	89 f0                	mov    %esi,%eax
 2f6:	89 d1                	mov    %edx,%ecx
 2f8:	83 c2 01             	add    $0x1,%edx
 2fb:	89 c3                	mov    %eax,%ebx
 2fd:	83 c0 01             	add    $0x1,%eax
 300:	0f b6 09             	movzbl (%ecx),%ecx
 303:	88 0b                	mov    %cl,(%ebx)
 305:	84 c9                	test   %cl,%cl
 307:	75 ed                	jne    2f6 <strcpy+0xd>
    ;
  return os;
}
 309:	89 f0                	mov    %esi,%eax
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    

0000030f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	8b 4d 08             	mov    0x8(%ebp),%ecx
 315:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 318:	eb 06                	jmp    320 <strcmp+0x11>
    p++, q++;
 31a:	83 c1 01             	add    $0x1,%ecx
 31d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 320:	0f b6 01             	movzbl (%ecx),%eax
 323:	84 c0                	test   %al,%al
 325:	74 04                	je     32b <strcmp+0x1c>
 327:	3a 02                	cmp    (%edx),%al
 329:	74 ef                	je     31a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 32b:	0f b6 c0             	movzbl %al,%eax
 32e:	0f b6 12             	movzbl (%edx),%edx
 331:	29 d0                	sub    %edx,%eax
}
 333:	5d                   	pop    %ebp
 334:	c3                   	ret    

00000335 <strlen>:

uint
strlen(const char *s)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 33b:	b8 00 00 00 00       	mov    $0x0,%eax
 340:	eb 03                	jmp    345 <strlen+0x10>
 342:	83 c0 01             	add    $0x1,%eax
 345:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 349:	75 f7                	jne    342 <strlen+0xd>
    ;
  return n;
}
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    

0000034d <memset>:

void*
memset(void *dst, int c, uint n)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	57                   	push   %edi
 351:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 354:	89 d7                	mov    %edx,%edi
 356:	8b 4d 10             	mov    0x10(%ebp),%ecx
 359:	8b 45 0c             	mov    0xc(%ebp),%eax
 35c:	fc                   	cld    
 35d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35f:	89 d0                	mov    %edx,%eax
 361:	8b 7d fc             	mov    -0x4(%ebp),%edi
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <strchr>:

char*
strchr(const char *s, char c)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	8b 45 08             	mov    0x8(%ebp),%eax
 36c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 370:	eb 03                	jmp    375 <strchr+0xf>
 372:	83 c0 01             	add    $0x1,%eax
 375:	0f b6 10             	movzbl (%eax),%edx
 378:	84 d2                	test   %dl,%dl
 37a:	74 06                	je     382 <strchr+0x1c>
    if(*s == c)
 37c:	38 ca                	cmp    %cl,%dl
 37e:	75 f2                	jne    372 <strchr+0xc>
 380:	eb 05                	jmp    387 <strchr+0x21>
      return (char*)s;
  return 0;
 382:	b8 00 00 00 00       	mov    $0x0,%eax
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <gets>:

char*
gets(char *buf, int max)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	57                   	push   %edi
 38d:	56                   	push   %esi
 38e:	53                   	push   %ebx
 38f:	83 ec 1c             	sub    $0x1c,%esp
 392:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 395:	bb 00 00 00 00       	mov    $0x0,%ebx
 39a:	89 de                	mov    %ebx,%esi
 39c:	83 c3 01             	add    $0x1,%ebx
 39f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3a2:	7d 2e                	jge    3d2 <gets+0x49>
    cc = read(0, &c, 1);
 3a4:	83 ec 04             	sub    $0x4,%esp
 3a7:	6a 01                	push   $0x1
 3a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3ac:	50                   	push   %eax
 3ad:	6a 00                	push   $0x0
 3af:	e8 74 01 00 00       	call   528 <read>
    if(cc < 1)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	7e 17                	jle    3d2 <gets+0x49>
      break;
    buf[i++] = c;
 3bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3c2:	3c 0a                	cmp    $0xa,%al
 3c4:	0f 94 c2             	sete   %dl
 3c7:	3c 0d                	cmp    $0xd,%al
 3c9:	0f 94 c0             	sete   %al
 3cc:	08 c2                	or     %al,%dl
 3ce:	74 ca                	je     39a <gets+0x11>
    buf[i++] = c;
 3d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d6:	89 f8                	mov    %edi,%eax
 3d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5f                   	pop    %edi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e5:	83 ec 08             	sub    $0x8,%esp
 3e8:	6a 00                	push   $0x0
 3ea:	ff 75 08             	push   0x8(%ebp)
 3ed:	e8 5e 01 00 00       	call   550 <open>
  if(fd < 0)
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	85 c0                	test   %eax,%eax
 3f7:	78 24                	js     41d <stat+0x3d>
 3f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3fb:	83 ec 08             	sub    $0x8,%esp
 3fe:	ff 75 0c             	push   0xc(%ebp)
 401:	50                   	push   %eax
 402:	e8 61 01 00 00       	call   568 <fstat>
 407:	89 c6                	mov    %eax,%esi
  close(fd);
 409:	89 1c 24             	mov    %ebx,(%esp)
 40c:	e8 27 01 00 00       	call   538 <close>
  return r;
 411:	83 c4 10             	add    $0x10,%esp
}
 414:	89 f0                	mov    %esi,%eax
 416:	8d 65 f8             	lea    -0x8(%ebp),%esp
 419:	5b                   	pop    %ebx
 41a:	5e                   	pop    %esi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
    return -1;
 41d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 422:	eb f0                	jmp    414 <stat+0x34>

00000424 <atoi>:

int
atoi(const char *s)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	53                   	push   %ebx
 428:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 42b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 430:	eb 10                	jmp    442 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 432:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 435:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 438:	83 c1 01             	add    $0x1,%ecx
 43b:	0f be c0             	movsbl %al,%eax
 43e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 442:	0f b6 01             	movzbl (%ecx),%eax
 445:	8d 58 d0             	lea    -0x30(%eax),%ebx
 448:	80 fb 09             	cmp    $0x9,%bl
 44b:	76 e5                	jbe    432 <atoi+0xe>
  return n;
}
 44d:	89 d0                	mov    %edx,%eax
 44f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 452:	c9                   	leave  
 453:	c3                   	ret    

00000454 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	56                   	push   %esi
 458:	53                   	push   %ebx
 459:	8b 75 08             	mov    0x8(%ebp),%esi
 45c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 45f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 462:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 464:	eb 0d                	jmp    473 <memmove+0x1f>
    *dst++ = *src++;
 466:	0f b6 01             	movzbl (%ecx),%eax
 469:	88 02                	mov    %al,(%edx)
 46b:	8d 49 01             	lea    0x1(%ecx),%ecx
 46e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 471:	89 d8                	mov    %ebx,%eax
 473:	8d 58 ff             	lea    -0x1(%eax),%ebx
 476:	85 c0                	test   %eax,%eax
 478:	7f ec                	jg     466 <memmove+0x12>
  return vdst;
}
 47a:	89 f0                	mov    %esi,%eax
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 486:	68 00 10 00 00       	push   $0x1000
 48b:	e8 fb 03 00 00       	call   88b <malloc>

  return clone(start_routine, arg1, arg2, stack);
 490:	50                   	push   %eax
 491:	ff 75 10             	push   0x10(%ebp)
 494:	ff 75 0c             	push   0xc(%ebp)
 497:	ff 75 08             	push   0x8(%ebp)
 49a:	e8 11 01 00 00       	call   5b0 <clone>
}
 49f:	c9                   	leave  
 4a0:	c3                   	ret    

000004a1 <thread_join>:

int thread_join(){
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
 4a4:	53                   	push   %ebx
 4a5:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 4a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ab:	50                   	push   %eax
 4ac:	e8 07 01 00 00       	call   5b8 <join>
  if (x < 0) {
 4b1:	83 c4 10             	add    $0x10,%esp
 4b4:	85 c0                	test   %eax,%eax
 4b6:	78 17                	js     4cf <thread_join+0x2e>
 4b8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 4ba:	83 ec 0c             	sub    $0xc,%esp
 4bd:	ff 75 f4             	push   -0xc(%ebp)
 4c0:	e8 06 03 00 00       	call   7cb <free>
  return x;
 4c5:	83 c4 10             	add    $0x10,%esp
}
 4c8:	89 d8                	mov    %ebx,%eax
 4ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cd:	c9                   	leave  
 4ce:	c3                   	ret    
    return -1;
 4cf:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 4d4:	eb f2                	jmp    4c8 <thread_join+0x27>

000004d6 <lock_init>:

void lock_init(lock_t *spin){
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 4dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    

000004e4 <lock_acquire>:

void lock_acquire(lock_t *spin){
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4ea:	b8 01 00 00 00       	mov    $0x1,%eax
 4ef:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4f2:	85 c0                	test   %eax,%eax
 4f4:	75 f4                	jne    4ea <lock_acquire+0x6>

}
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    

000004f8 <lock_release>:

void lock_release(lock_t *spin){
 4f8:	55                   	push   %ebp
 4f9:	89 e5                	mov    %esp,%ebp
 4fb:	8b 55 08             	mov    0x8(%ebp),%edx
 4fe:	b8 00 00 00 00       	mov    $0x0,%eax
 503:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 506:	5d                   	pop    %ebp
 507:	c3                   	ret    

00000508 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 508:	b8 01 00 00 00       	mov    $0x1,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <exit>:
SYSCALL(exit)
 510:	b8 02 00 00 00       	mov    $0x2,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <wait>:
SYSCALL(wait)
 518:	b8 03 00 00 00       	mov    $0x3,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <pipe>:
SYSCALL(pipe)
 520:	b8 04 00 00 00       	mov    $0x4,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <read>:
SYSCALL(read)
 528:	b8 05 00 00 00       	mov    $0x5,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <write>:
SYSCALL(write)
 530:	b8 10 00 00 00       	mov    $0x10,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <close>:
SYSCALL(close)
 538:	b8 15 00 00 00       	mov    $0x15,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <kill>:
SYSCALL(kill)
 540:	b8 06 00 00 00       	mov    $0x6,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <exec>:
SYSCALL(exec)
 548:	b8 07 00 00 00       	mov    $0x7,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <open>:
SYSCALL(open)
 550:	b8 0f 00 00 00       	mov    $0xf,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <mknod>:
SYSCALL(mknod)
 558:	b8 11 00 00 00       	mov    $0x11,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <unlink>:
SYSCALL(unlink)
 560:	b8 12 00 00 00       	mov    $0x12,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <fstat>:
SYSCALL(fstat)
 568:	b8 08 00 00 00       	mov    $0x8,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <link>:
SYSCALL(link)
 570:	b8 13 00 00 00       	mov    $0x13,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <mkdir>:
SYSCALL(mkdir)
 578:	b8 14 00 00 00       	mov    $0x14,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <chdir>:
SYSCALL(chdir)
 580:	b8 09 00 00 00       	mov    $0x9,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <dup>:
SYSCALL(dup)
 588:	b8 0a 00 00 00       	mov    $0xa,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <getpid>:
SYSCALL(getpid)
 590:	b8 0b 00 00 00       	mov    $0xb,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <sbrk>:
SYSCALL(sbrk)
 598:	b8 0c 00 00 00       	mov    $0xc,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <sleep>:
SYSCALL(sleep)
 5a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <uptime>:
SYSCALL(uptime)
 5a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <clone>:
SYSCALL(clone)
 5b0:	b8 16 00 00 00       	mov    $0x16,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <join>:
 5b8:	b8 17 00 00 00       	mov    $0x17,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	83 ec 1c             	sub    $0x1c,%esp
 5c6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5c9:	6a 01                	push   $0x1
 5cb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5ce:	52                   	push   %edx
 5cf:	50                   	push   %eax
 5d0:	e8 5b ff ff ff       	call   530 <write>
}
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	c9                   	leave  
 5d9:	c3                   	ret    

000005da <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
 5dd:	57                   	push   %edi
 5de:	56                   	push   %esi
 5df:	53                   	push   %ebx
 5e0:	83 ec 2c             	sub    $0x2c,%esp
 5e3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e6:	89 d0                	mov    %edx,%eax
 5e8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ea:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5ee:	0f 95 c1             	setne  %cl
 5f1:	c1 ea 1f             	shr    $0x1f,%edx
 5f4:	84 d1                	test   %dl,%cl
 5f6:	74 44                	je     63c <printint+0x62>
    neg = 1;
    x = -xx;
 5f8:	f7 d8                	neg    %eax
 5fa:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5fc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 603:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 608:	89 c8                	mov    %ecx,%eax
 60a:	ba 00 00 00 00       	mov    $0x0,%edx
 60f:	f7 f6                	div    %esi
 611:	89 df                	mov    %ebx,%edi
 613:	83 c3 01             	add    $0x1,%ebx
 616:	0f b6 92 1c 0a 00 00 	movzbl 0xa1c(%edx),%edx
 61d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 621:	89 ca                	mov    %ecx,%edx
 623:	89 c1                	mov    %eax,%ecx
 625:	39 d6                	cmp    %edx,%esi
 627:	76 df                	jbe    608 <printint+0x2e>
  if(neg)
 629:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 62d:	74 31                	je     660 <printint+0x86>
    buf[i++] = '-';
 62f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 634:	8d 5f 02             	lea    0x2(%edi),%ebx
 637:	8b 75 d0             	mov    -0x30(%ebp),%esi
 63a:	eb 17                	jmp    653 <printint+0x79>
    x = xx;
 63c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 63e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 645:	eb bc                	jmp    603 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 647:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 64c:	89 f0                	mov    %esi,%eax
 64e:	e8 6d ff ff ff       	call   5c0 <putc>
  while(--i >= 0)
 653:	83 eb 01             	sub    $0x1,%ebx
 656:	79 ef                	jns    647 <printint+0x6d>
}
 658:	83 c4 2c             	add    $0x2c,%esp
 65b:	5b                   	pop    %ebx
 65c:	5e                   	pop    %esi
 65d:	5f                   	pop    %edi
 65e:	5d                   	pop    %ebp
 65f:	c3                   	ret    
 660:	8b 75 d0             	mov    -0x30(%ebp),%esi
 663:	eb ee                	jmp    653 <printint+0x79>

00000665 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 665:	55                   	push   %ebp
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 66e:	8d 45 10             	lea    0x10(%ebp),%eax
 671:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 674:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 679:	bb 00 00 00 00       	mov    $0x0,%ebx
 67e:	eb 14                	jmp    694 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 680:	89 fa                	mov    %edi,%edx
 682:	8b 45 08             	mov    0x8(%ebp),%eax
 685:	e8 36 ff ff ff       	call   5c0 <putc>
 68a:	eb 05                	jmp    691 <printf+0x2c>
      }
    } else if(state == '%'){
 68c:	83 fe 25             	cmp    $0x25,%esi
 68f:	74 25                	je     6b6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 691:	83 c3 01             	add    $0x1,%ebx
 694:	8b 45 0c             	mov    0xc(%ebp),%eax
 697:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 69b:	84 c0                	test   %al,%al
 69d:	0f 84 20 01 00 00    	je     7c3 <printf+0x15e>
    c = fmt[i] & 0xff;
 6a3:	0f be f8             	movsbl %al,%edi
 6a6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6a9:	85 f6                	test   %esi,%esi
 6ab:	75 df                	jne    68c <printf+0x27>
      if(c == '%'){
 6ad:	83 f8 25             	cmp    $0x25,%eax
 6b0:	75 ce                	jne    680 <printf+0x1b>
        state = '%';
 6b2:	89 c6                	mov    %eax,%esi
 6b4:	eb db                	jmp    691 <printf+0x2c>
      if(c == 'd'){
 6b6:	83 f8 25             	cmp    $0x25,%eax
 6b9:	0f 84 cf 00 00 00    	je     78e <printf+0x129>
 6bf:	0f 8c dd 00 00 00    	jl     7a2 <printf+0x13d>
 6c5:	83 f8 78             	cmp    $0x78,%eax
 6c8:	0f 8f d4 00 00 00    	jg     7a2 <printf+0x13d>
 6ce:	83 f8 63             	cmp    $0x63,%eax
 6d1:	0f 8c cb 00 00 00    	jl     7a2 <printf+0x13d>
 6d7:	83 e8 63             	sub    $0x63,%eax
 6da:	83 f8 15             	cmp    $0x15,%eax
 6dd:	0f 87 bf 00 00 00    	ja     7a2 <printf+0x13d>
 6e3:	ff 24 85 c4 09 00 00 	jmp    *0x9c4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ed:	8b 17                	mov    (%edi),%edx
 6ef:	83 ec 0c             	sub    $0xc,%esp
 6f2:	6a 01                	push   $0x1
 6f4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
 6fc:	e8 d9 fe ff ff       	call   5da <printint>
        ap++;
 701:	83 c7 04             	add    $0x4,%edi
 704:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 707:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 70a:	be 00 00 00 00       	mov    $0x0,%esi
 70f:	eb 80                	jmp    691 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 711:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 714:	8b 17                	mov    (%edi),%edx
 716:	83 ec 0c             	sub    $0xc,%esp
 719:	6a 00                	push   $0x0
 71b:	b9 10 00 00 00       	mov    $0x10,%ecx
 720:	8b 45 08             	mov    0x8(%ebp),%eax
 723:	e8 b2 fe ff ff       	call   5da <printint>
        ap++;
 728:	83 c7 04             	add    $0x4,%edi
 72b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 72e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 731:	be 00 00 00 00       	mov    $0x0,%esi
 736:	e9 56 ff ff ff       	jmp    691 <printf+0x2c>
        s = (char*)*ap;
 73b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73e:	8b 30                	mov    (%eax),%esi
        ap++;
 740:	83 c0 04             	add    $0x4,%eax
 743:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 746:	85 f6                	test   %esi,%esi
 748:	75 15                	jne    75f <printf+0xfa>
          s = "(null)";
 74a:	be bb 09 00 00       	mov    $0x9bb,%esi
 74f:	eb 0e                	jmp    75f <printf+0xfa>
          putc(fd, *s);
 751:	0f be d2             	movsbl %dl,%edx
 754:	8b 45 08             	mov    0x8(%ebp),%eax
 757:	e8 64 fe ff ff       	call   5c0 <putc>
          s++;
 75c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 75f:	0f b6 16             	movzbl (%esi),%edx
 762:	84 d2                	test   %dl,%dl
 764:	75 eb                	jne    751 <printf+0xec>
      state = 0;
 766:	be 00 00 00 00       	mov    $0x0,%esi
 76b:	e9 21 ff ff ff       	jmp    691 <printf+0x2c>
        putc(fd, *ap);
 770:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 773:	0f be 17             	movsbl (%edi),%edx
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	e8 42 fe ff ff       	call   5c0 <putc>
        ap++;
 77e:	83 c7 04             	add    $0x4,%edi
 781:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 784:	be 00 00 00 00       	mov    $0x0,%esi
 789:	e9 03 ff ff ff       	jmp    691 <printf+0x2c>
        putc(fd, c);
 78e:	89 fa                	mov    %edi,%edx
 790:	8b 45 08             	mov    0x8(%ebp),%eax
 793:	e8 28 fe ff ff       	call   5c0 <putc>
      state = 0;
 798:	be 00 00 00 00       	mov    $0x0,%esi
 79d:	e9 ef fe ff ff       	jmp    691 <printf+0x2c>
        putc(fd, '%');
 7a2:	ba 25 00 00 00       	mov    $0x25,%edx
 7a7:	8b 45 08             	mov    0x8(%ebp),%eax
 7aa:	e8 11 fe ff ff       	call   5c0 <putc>
        putc(fd, c);
 7af:	89 fa                	mov    %edi,%edx
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	e8 07 fe ff ff       	call   5c0 <putc>
      state = 0;
 7b9:	be 00 00 00 00       	mov    $0x0,%esi
 7be:	e9 ce fe ff ff       	jmp    691 <printf+0x2c>
    }
  }
}
 7c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c6:	5b                   	pop    %ebx
 7c7:	5e                   	pop    %esi
 7c8:	5f                   	pop    %edi
 7c9:	5d                   	pop    %ebp
 7ca:	c3                   	ret    

000007cb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7cb:	55                   	push   %ebp
 7cc:	89 e5                	mov    %esp,%ebp
 7ce:	57                   	push   %edi
 7cf:	56                   	push   %esi
 7d0:	53                   	push   %ebx
 7d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d7:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 7dc:	eb 02                	jmp    7e0 <free+0x15>
 7de:	89 d0                	mov    %edx,%eax
 7e0:	39 c8                	cmp    %ecx,%eax
 7e2:	73 04                	jae    7e8 <free+0x1d>
 7e4:	39 08                	cmp    %ecx,(%eax)
 7e6:	77 12                	ja     7fa <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	39 c2                	cmp    %eax,%edx
 7ec:	77 f0                	ja     7de <free+0x13>
 7ee:	39 c8                	cmp    %ecx,%eax
 7f0:	72 08                	jb     7fa <free+0x2f>
 7f2:	39 ca                	cmp    %ecx,%edx
 7f4:	77 04                	ja     7fa <free+0x2f>
 7f6:	89 d0                	mov    %edx,%eax
 7f8:	eb e6                	jmp    7e0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7fa:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7fd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 800:	8b 10                	mov    (%eax),%edx
 802:	39 d7                	cmp    %edx,%edi
 804:	74 19                	je     81f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 806:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 809:	8b 50 04             	mov    0x4(%eax),%edx
 80c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 80f:	39 ce                	cmp    %ecx,%esi
 811:	74 1b                	je     82e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 813:	89 08                	mov    %ecx,(%eax)
  freep = p;
 815:	a3 b4 0d 00 00       	mov    %eax,0xdb4
}
 81a:	5b                   	pop    %ebx
 81b:	5e                   	pop    %esi
 81c:	5f                   	pop    %edi
 81d:	5d                   	pop    %ebp
 81e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 81f:	03 72 04             	add    0x4(%edx),%esi
 822:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 825:	8b 10                	mov    (%eax),%edx
 827:	8b 12                	mov    (%edx),%edx
 829:	89 53 f8             	mov    %edx,-0x8(%ebx)
 82c:	eb db                	jmp    809 <free+0x3e>
    p->s.size += bp->s.size;
 82e:	03 53 fc             	add    -0x4(%ebx),%edx
 831:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 834:	8b 53 f8             	mov    -0x8(%ebx),%edx
 837:	89 10                	mov    %edx,(%eax)
 839:	eb da                	jmp    815 <free+0x4a>

0000083b <morecore>:

static Header*
morecore(uint nu)
{
 83b:	55                   	push   %ebp
 83c:	89 e5                	mov    %esp,%ebp
 83e:	53                   	push   %ebx
 83f:	83 ec 04             	sub    $0x4,%esp
 842:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 844:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 849:	77 05                	ja     850 <morecore+0x15>
    nu = 4096;
 84b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 850:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 857:	83 ec 0c             	sub    $0xc,%esp
 85a:	50                   	push   %eax
 85b:	e8 38 fd ff ff       	call   598 <sbrk>
  if(p == (char*)-1)
 860:	83 c4 10             	add    $0x10,%esp
 863:	83 f8 ff             	cmp    $0xffffffff,%eax
 866:	74 1c                	je     884 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 868:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 86b:	83 c0 08             	add    $0x8,%eax
 86e:	83 ec 0c             	sub    $0xc,%esp
 871:	50                   	push   %eax
 872:	e8 54 ff ff ff       	call   7cb <free>
  return freep;
 877:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 87c:	83 c4 10             	add    $0x10,%esp
}
 87f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 882:	c9                   	leave  
 883:	c3                   	ret    
    return 0;
 884:	b8 00 00 00 00       	mov    $0x0,%eax
 889:	eb f4                	jmp    87f <morecore+0x44>

0000088b <malloc>:

void*
malloc(uint nbytes)
{
 88b:	55                   	push   %ebp
 88c:	89 e5                	mov    %esp,%ebp
 88e:	53                   	push   %ebx
 88f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 892:	8b 45 08             	mov    0x8(%ebp),%eax
 895:	8d 58 07             	lea    0x7(%eax),%ebx
 898:	c1 eb 03             	shr    $0x3,%ebx
 89b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 89e:	8b 0d b4 0d 00 00    	mov    0xdb4,%ecx
 8a4:	85 c9                	test   %ecx,%ecx
 8a6:	74 04                	je     8ac <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a8:	8b 01                	mov    (%ecx),%eax
 8aa:	eb 4a                	jmp    8f6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8ac:	c7 05 b4 0d 00 00 b8 	movl   $0xdb8,0xdb4
 8b3:	0d 00 00 
 8b6:	c7 05 b8 0d 00 00 b8 	movl   $0xdb8,0xdb8
 8bd:	0d 00 00 
    base.s.size = 0;
 8c0:	c7 05 bc 0d 00 00 00 	movl   $0x0,0xdbc
 8c7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8ca:	b9 b8 0d 00 00       	mov    $0xdb8,%ecx
 8cf:	eb d7                	jmp    8a8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8d1:	74 19                	je     8ec <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8d3:	29 da                	sub    %ebx,%edx
 8d5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8db:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8de:	89 0d b4 0d 00 00    	mov    %ecx,0xdb4
      return (void*)(p + 1);
 8e4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ea:	c9                   	leave  
 8eb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8ec:	8b 10                	mov    (%eax),%edx
 8ee:	89 11                	mov    %edx,(%ecx)
 8f0:	eb ec                	jmp    8de <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f2:	89 c1                	mov    %eax,%ecx
 8f4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8f6:	8b 50 04             	mov    0x4(%eax),%edx
 8f9:	39 da                	cmp    %ebx,%edx
 8fb:	73 d4                	jae    8d1 <malloc+0x46>
    if(p == freep)
 8fd:	39 05 b4 0d 00 00    	cmp    %eax,0xdb4
 903:	75 ed                	jne    8f2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 905:	89 d8                	mov    %ebx,%eax
 907:	e8 2f ff ff ff       	call   83b <morecore>
 90c:	85 c0                	test   %eax,%eax
 90e:	75 e2                	jne    8f2 <malloc+0x67>
 910:	eb d5                	jmp    8e7 <malloc+0x5c>
