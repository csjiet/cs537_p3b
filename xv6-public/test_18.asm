
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
   b:	e8 d7 04 00 00       	call   4e7 <lock_acquire>
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
  31:	e8 c5 04 00 00       	call   4fb <lock_release>
    exit();
  36:	e8 d8 04 00 00       	call   513 <exit>

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
  47:	e8 9b 04 00 00       	call   4e7 <lock_acquire>
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
  6d:	e8 89 04 00 00       	call   4fb <lock_release>

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
  8c:	e8 24 04 00 00       	call   4b5 <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
  a3:	68 18 09 00 00       	push   $0x918
  a8:	68 22 09 00 00       	push   $0x922
  ad:	6a 01                	push   $0x1
  af:	e8 b4 05 00 00       	call   668 <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 9c 09 00 00       	push   $0x99c
  bc:	68 40 09 00 00       	push   $0x940
  c1:	6a 01                	push   $0x1
  c3:	e8 a0 05 00 00       	call   668 <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 54 09 00 00       	push   $0x954
  d0:	6a 01                	push   $0x1
  d2:	e8 91 05 00 00       	call   668 <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 b0 0d 00 00    	push   0xdb0
  e0:	e8 5e 04 00 00       	call   543 <kill>
  e5:	e8 29 04 00 00       	call   513 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 18 09 00 00       	push   $0x918
  f1:	68 22 09 00 00       	push   $0x922
  f6:	6a 01                	push   $0x1
  f8:	e8 6b 05 00 00       	call   668 <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 2a 09 00 00       	push   $0x92a
 105:	68 40 09 00 00       	push   $0x940
 10a:	6a 01                	push   $0x1
 10c:	e8 57 05 00 00       	call   668 <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 54 09 00 00       	push   $0x954
 119:	6a 01                	push   $0x1
 11b:	e8 48 05 00 00       	call   668 <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 b0 0d 00 00    	push   0xdb0
 129:	e8 15 04 00 00       	call   543 <kill>
 12e:	e8 e0 03 00 00       	call   513 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 18 09 00 00       	push   $0x918
 13a:	68 22 09 00 00       	push   $0x922
 13f:	6a 01                	push   $0x1
 141:	e8 22 05 00 00       	call   668 <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 61 09 00 00       	push   $0x961
 14e:	68 40 09 00 00       	push   $0x940
 153:	6a 01                	push   $0x1
 155:	e8 0e 05 00 00       	call   668 <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 54 09 00 00       	push   $0x954
 162:	6a 01                	push   $0x1
 164:	e8 ff 04 00 00       	call   668 <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 b0 0d 00 00    	push   0xdb0
 172:	e8 cc 03 00 00       	call   543 <kill>
 177:	e8 97 03 00 00       	call   513 <exit>

   exit();
 17c:	e8 92 03 00 00       	call   513 <exit>

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
 190:	e8 fe 03 00 00       	call   593 <getpid>
 195:	a3 b0 0d 00 00       	mov    %eax,0xdb0
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 a8 0d 00 00       	push   $0xda8
 1a2:	e8 32 03 00 00       	call   4d9 <lock_init>
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
 1d6:	68 18 09 00 00       	push   $0x918
 1db:	68 22 09 00 00       	push   $0x922
 1e0:	6a 01                	push   $0x1
 1e2:	e8 81 04 00 00       	call   668 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 31 09 00 00       	push   $0x931
 1ef:	68 40 09 00 00       	push   $0x940
 1f4:	6a 01                	push   $0x1
 1f6:	e8 6d 04 00 00       	call   668 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 54 09 00 00       	push   $0x954
 203:	6a 01                	push   $0x1
 205:	e8 5e 04 00 00       	call   668 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 b0 0d 00 00    	push   0xdb0
 213:	e8 2b 03 00 00       	call   543 <kill>
 218:	e8 f6 02 00 00       	call   513 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 a4 0d 00 00       	mov    0xda4,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 85 02 00 00       	call   4b5 <thread_join>
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
 23b:	68 18 09 00 00       	push   $0x918
 240:	68 22 09 00 00       	push   $0x922
 245:	6a 01                	push   $0x1
 247:	e8 1c 04 00 00       	call   668 <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 68 09 00 00       	push   $0x968
 254:	68 40 09 00 00       	push   $0x940
 259:	6a 01                	push   $0x1
 25b:	e8 08 04 00 00       	call   668 <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 54 09 00 00       	push   $0x954
 268:	6a 01                	push   $0x1
 26a:	e8 f9 03 00 00       	call   668 <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 b0 0d 00 00    	push   0xdb0
 278:	e8 c6 02 00 00       	call   543 <kill>
 27d:	e8 91 02 00 00       	call   513 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 ac 0d 00 00    	cmp    0xdac,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 18 09 00 00       	push   $0x918
 293:	68 22 09 00 00       	push   $0x922
 298:	6a 01                	push   $0x1
 29a:	e8 c9 03 00 00       	call   668 <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 75 09 00 00       	push   $0x975
 2a7:	68 40 09 00 00       	push   $0x940
 2ac:	6a 01                	push   $0x1
 2ae:	e8 b5 03 00 00       	call   668 <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 54 09 00 00       	push   $0x954
 2bb:	6a 01                	push   $0x1
 2bd:	e8 a6 03 00 00       	call   668 <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 b0 0d 00 00    	push   0xdb0
 2cb:	e8 73 02 00 00       	call   543 <kill>
 2d0:	e8 3e 02 00 00       	call   513 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 8f 09 00 00       	push   $0x98f
 2dd:	6a 01                	push   $0x1
 2df:	e8 84 03 00 00       	call   668 <printf>
   exit();
 2e4:	e8 2a 02 00 00       	call   513 <exit>

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
 3af:	e8 77 01 00 00       	call   52b <read>
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
 3ed:	e8 61 01 00 00       	call   553 <open>
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
 402:	e8 64 01 00 00       	call   56b <fstat>
 407:	89 c6                	mov    %eax,%esi
  close(fd);
 409:	89 1c 24             	mov    %ebx,(%esp)
 40c:	e8 2a 01 00 00       	call   53b <close>
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

  void* stack = malloc(2 * PGSIZE);
 486:	68 00 20 00 00       	push   $0x2000
 48b:	e8 fe 03 00 00       	call   88e <malloc>
  if ((uint)stack%PGSIZE){
 490:	83 c4 10             	add    $0x10,%esp
 493:	a9 ff 0f 00 00       	test   $0xfff,%eax
 498:	74 0a                	je     4a4 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 49a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 49f:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 4a4:	50                   	push   %eax
 4a5:	ff 75 10             	push   0x10(%ebp)
 4a8:	ff 75 0c             	push   0xc(%ebp)
 4ab:	ff 75 08             	push   0x8(%ebp)
 4ae:	e8 00 01 00 00       	call   5b3 <clone>
}
 4b3:	c9                   	leave  
 4b4:	c3                   	ret    

000004b5 <thread_join>:

int thread_join(){
 4b5:	55                   	push   %ebp
 4b6:	89 e5                	mov    %esp,%ebp
 4b8:	53                   	push   %ebx
 4b9:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 4bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4bf:	50                   	push   %eax
 4c0:	e8 f6 00 00 00       	call   5bb <join>
 4c5:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 4c7:	83 c4 04             	add    $0x4,%esp
 4ca:	ff 75 f4             	push   -0xc(%ebp)
 4cd:	e8 fc 02 00 00       	call   7ce <free>
  return x;
}
 4d2:	89 d8                	mov    %ebx,%eax
 4d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d7:	c9                   	leave  
 4d8:	c3                   	ret    

000004d9 <lock_init>:

void lock_init(lock_t *spin){
 4d9:	55                   	push   %ebp
 4da:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 4dc:	8b 45 08             	mov    0x8(%ebp),%eax
 4df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    

000004e7 <lock_acquire>:

void lock_acquire(lock_t *spin){
 4e7:	55                   	push   %ebp
 4e8:	89 e5                	mov    %esp,%ebp
 4ea:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4ed:	b8 01 00 00 00       	mov    $0x1,%eax
 4f2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4f5:	85 c0                	test   %eax,%eax
 4f7:	75 f4                	jne    4ed <lock_acquire+0x6>

}
 4f9:	5d                   	pop    %ebp
 4fa:	c3                   	ret    

000004fb <lock_release>:

void lock_release(lock_t *spin){
 4fb:	55                   	push   %ebp
 4fc:	89 e5                	mov    %esp,%ebp
 4fe:	8b 55 08             	mov    0x8(%ebp),%edx
 501:	b8 00 00 00 00       	mov    $0x0,%eax
 506:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    

0000050b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 50b:	b8 01 00 00 00       	mov    $0x1,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <exit>:
SYSCALL(exit)
 513:	b8 02 00 00 00       	mov    $0x2,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <wait>:
SYSCALL(wait)
 51b:	b8 03 00 00 00       	mov    $0x3,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <pipe>:
SYSCALL(pipe)
 523:	b8 04 00 00 00       	mov    $0x4,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <read>:
SYSCALL(read)
 52b:	b8 05 00 00 00       	mov    $0x5,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <write>:
SYSCALL(write)
 533:	b8 10 00 00 00       	mov    $0x10,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <close>:
SYSCALL(close)
 53b:	b8 15 00 00 00       	mov    $0x15,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <kill>:
SYSCALL(kill)
 543:	b8 06 00 00 00       	mov    $0x6,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <exec>:
SYSCALL(exec)
 54b:	b8 07 00 00 00       	mov    $0x7,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <open>:
SYSCALL(open)
 553:	b8 0f 00 00 00       	mov    $0xf,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <mknod>:
SYSCALL(mknod)
 55b:	b8 11 00 00 00       	mov    $0x11,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <unlink>:
SYSCALL(unlink)
 563:	b8 12 00 00 00       	mov    $0x12,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <fstat>:
SYSCALL(fstat)
 56b:	b8 08 00 00 00       	mov    $0x8,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <link>:
SYSCALL(link)
 573:	b8 13 00 00 00       	mov    $0x13,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <mkdir>:
SYSCALL(mkdir)
 57b:	b8 14 00 00 00       	mov    $0x14,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <chdir>:
SYSCALL(chdir)
 583:	b8 09 00 00 00       	mov    $0x9,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <dup>:
SYSCALL(dup)
 58b:	b8 0a 00 00 00       	mov    $0xa,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <getpid>:
SYSCALL(getpid)
 593:	b8 0b 00 00 00       	mov    $0xb,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <sbrk>:
SYSCALL(sbrk)
 59b:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <sleep>:
SYSCALL(sleep)
 5a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <uptime>:
SYSCALL(uptime)
 5ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <clone>:
SYSCALL(clone)
 5b3:	b8 16 00 00 00       	mov    $0x16,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <join>:
 5bb:	b8 17 00 00 00       	mov    $0x17,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5c3:	55                   	push   %ebp
 5c4:	89 e5                	mov    %esp,%ebp
 5c6:	83 ec 1c             	sub    $0x1c,%esp
 5c9:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5cc:	6a 01                	push   $0x1
 5ce:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5d1:	52                   	push   %edx
 5d2:	50                   	push   %eax
 5d3:	e8 5b ff ff ff       	call   533 <write>
}
 5d8:	83 c4 10             	add    $0x10,%esp
 5db:	c9                   	leave  
 5dc:	c3                   	ret    

000005dd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5dd:	55                   	push   %ebp
 5de:	89 e5                	mov    %esp,%ebp
 5e0:	57                   	push   %edi
 5e1:	56                   	push   %esi
 5e2:	53                   	push   %ebx
 5e3:	83 ec 2c             	sub    $0x2c,%esp
 5e6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e9:	89 d0                	mov    %edx,%eax
 5eb:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ed:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5f1:	0f 95 c1             	setne  %cl
 5f4:	c1 ea 1f             	shr    $0x1f,%edx
 5f7:	84 d1                	test   %dl,%cl
 5f9:	74 44                	je     63f <printint+0x62>
    neg = 1;
    x = -xx;
 5fb:	f7 d8                	neg    %eax
 5fd:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5ff:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 606:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 60b:	89 c8                	mov    %ecx,%eax
 60d:	ba 00 00 00 00       	mov    $0x0,%edx
 612:	f7 f6                	div    %esi
 614:	89 df                	mov    %ebx,%edi
 616:	83 c3 01             	add    $0x1,%ebx
 619:	0f b6 92 20 0a 00 00 	movzbl 0xa20(%edx),%edx
 620:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 624:	89 ca                	mov    %ecx,%edx
 626:	89 c1                	mov    %eax,%ecx
 628:	39 d6                	cmp    %edx,%esi
 62a:	76 df                	jbe    60b <printint+0x2e>
  if(neg)
 62c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 630:	74 31                	je     663 <printint+0x86>
    buf[i++] = '-';
 632:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 637:	8d 5f 02             	lea    0x2(%edi),%ebx
 63a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 63d:	eb 17                	jmp    656 <printint+0x79>
    x = xx;
 63f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 641:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 648:	eb bc                	jmp    606 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 64a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 64f:	89 f0                	mov    %esi,%eax
 651:	e8 6d ff ff ff       	call   5c3 <putc>
  while(--i >= 0)
 656:	83 eb 01             	sub    $0x1,%ebx
 659:	79 ef                	jns    64a <printint+0x6d>
}
 65b:	83 c4 2c             	add    $0x2c,%esp
 65e:	5b                   	pop    %ebx
 65f:	5e                   	pop    %esi
 660:	5f                   	pop    %edi
 661:	5d                   	pop    %ebp
 662:	c3                   	ret    
 663:	8b 75 d0             	mov    -0x30(%ebp),%esi
 666:	eb ee                	jmp    656 <printint+0x79>

00000668 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 668:	55                   	push   %ebp
 669:	89 e5                	mov    %esp,%ebp
 66b:	57                   	push   %edi
 66c:	56                   	push   %esi
 66d:	53                   	push   %ebx
 66e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 671:	8d 45 10             	lea    0x10(%ebp),%eax
 674:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 677:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 67c:	bb 00 00 00 00       	mov    $0x0,%ebx
 681:	eb 14                	jmp    697 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 683:	89 fa                	mov    %edi,%edx
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	e8 36 ff ff ff       	call   5c3 <putc>
 68d:	eb 05                	jmp    694 <printf+0x2c>
      }
    } else if(state == '%'){
 68f:	83 fe 25             	cmp    $0x25,%esi
 692:	74 25                	je     6b9 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 694:	83 c3 01             	add    $0x1,%ebx
 697:	8b 45 0c             	mov    0xc(%ebp),%eax
 69a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 69e:	84 c0                	test   %al,%al
 6a0:	0f 84 20 01 00 00    	je     7c6 <printf+0x15e>
    c = fmt[i] & 0xff;
 6a6:	0f be f8             	movsbl %al,%edi
 6a9:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ac:	85 f6                	test   %esi,%esi
 6ae:	75 df                	jne    68f <printf+0x27>
      if(c == '%'){
 6b0:	83 f8 25             	cmp    $0x25,%eax
 6b3:	75 ce                	jne    683 <printf+0x1b>
        state = '%';
 6b5:	89 c6                	mov    %eax,%esi
 6b7:	eb db                	jmp    694 <printf+0x2c>
      if(c == 'd'){
 6b9:	83 f8 25             	cmp    $0x25,%eax
 6bc:	0f 84 cf 00 00 00    	je     791 <printf+0x129>
 6c2:	0f 8c dd 00 00 00    	jl     7a5 <printf+0x13d>
 6c8:	83 f8 78             	cmp    $0x78,%eax
 6cb:	0f 8f d4 00 00 00    	jg     7a5 <printf+0x13d>
 6d1:	83 f8 63             	cmp    $0x63,%eax
 6d4:	0f 8c cb 00 00 00    	jl     7a5 <printf+0x13d>
 6da:	83 e8 63             	sub    $0x63,%eax
 6dd:	83 f8 15             	cmp    $0x15,%eax
 6e0:	0f 87 bf 00 00 00    	ja     7a5 <printf+0x13d>
 6e6:	ff 24 85 c8 09 00 00 	jmp    *0x9c8(,%eax,4)
        printint(fd, *ap, 10, 1);
 6ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f0:	8b 17                	mov    (%edi),%edx
 6f2:	83 ec 0c             	sub    $0xc,%esp
 6f5:	6a 01                	push   $0x1
 6f7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	e8 d9 fe ff ff       	call   5dd <printint>
        ap++;
 704:	83 c7 04             	add    $0x4,%edi
 707:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 70a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 70d:	be 00 00 00 00       	mov    $0x0,%esi
 712:	eb 80                	jmp    694 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 714:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 717:	8b 17                	mov    (%edi),%edx
 719:	83 ec 0c             	sub    $0xc,%esp
 71c:	6a 00                	push   $0x0
 71e:	b9 10 00 00 00       	mov    $0x10,%ecx
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	e8 b2 fe ff ff       	call   5dd <printint>
        ap++;
 72b:	83 c7 04             	add    $0x4,%edi
 72e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 731:	83 c4 10             	add    $0x10,%esp
      state = 0;
 734:	be 00 00 00 00       	mov    $0x0,%esi
 739:	e9 56 ff ff ff       	jmp    694 <printf+0x2c>
        s = (char*)*ap;
 73e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 741:	8b 30                	mov    (%eax),%esi
        ap++;
 743:	83 c0 04             	add    $0x4,%eax
 746:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 749:	85 f6                	test   %esi,%esi
 74b:	75 15                	jne    762 <printf+0xfa>
          s = "(null)";
 74d:	be bf 09 00 00       	mov    $0x9bf,%esi
 752:	eb 0e                	jmp    762 <printf+0xfa>
          putc(fd, *s);
 754:	0f be d2             	movsbl %dl,%edx
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	e8 64 fe ff ff       	call   5c3 <putc>
          s++;
 75f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 762:	0f b6 16             	movzbl (%esi),%edx
 765:	84 d2                	test   %dl,%dl
 767:	75 eb                	jne    754 <printf+0xec>
      state = 0;
 769:	be 00 00 00 00       	mov    $0x0,%esi
 76e:	e9 21 ff ff ff       	jmp    694 <printf+0x2c>
        putc(fd, *ap);
 773:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 776:	0f be 17             	movsbl (%edi),%edx
 779:	8b 45 08             	mov    0x8(%ebp),%eax
 77c:	e8 42 fe ff ff       	call   5c3 <putc>
        ap++;
 781:	83 c7 04             	add    $0x4,%edi
 784:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 787:	be 00 00 00 00       	mov    $0x0,%esi
 78c:	e9 03 ff ff ff       	jmp    694 <printf+0x2c>
        putc(fd, c);
 791:	89 fa                	mov    %edi,%edx
 793:	8b 45 08             	mov    0x8(%ebp),%eax
 796:	e8 28 fe ff ff       	call   5c3 <putc>
      state = 0;
 79b:	be 00 00 00 00       	mov    $0x0,%esi
 7a0:	e9 ef fe ff ff       	jmp    694 <printf+0x2c>
        putc(fd, '%');
 7a5:	ba 25 00 00 00       	mov    $0x25,%edx
 7aa:	8b 45 08             	mov    0x8(%ebp),%eax
 7ad:	e8 11 fe ff ff       	call   5c3 <putc>
        putc(fd, c);
 7b2:	89 fa                	mov    %edi,%edx
 7b4:	8b 45 08             	mov    0x8(%ebp),%eax
 7b7:	e8 07 fe ff ff       	call   5c3 <putc>
      state = 0;
 7bc:	be 00 00 00 00       	mov    $0x0,%esi
 7c1:	e9 ce fe ff ff       	jmp    694 <printf+0x2c>
    }
  }
}
 7c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c9:	5b                   	pop    %ebx
 7ca:	5e                   	pop    %esi
 7cb:	5f                   	pop    %edi
 7cc:	5d                   	pop    %ebp
 7cd:	c3                   	ret    

000007ce <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ce:	55                   	push   %ebp
 7cf:	89 e5                	mov    %esp,%ebp
 7d1:	57                   	push   %edi
 7d2:	56                   	push   %esi
 7d3:	53                   	push   %ebx
 7d4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7da:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 7df:	eb 02                	jmp    7e3 <free+0x15>
 7e1:	89 d0                	mov    %edx,%eax
 7e3:	39 c8                	cmp    %ecx,%eax
 7e5:	73 04                	jae    7eb <free+0x1d>
 7e7:	39 08                	cmp    %ecx,(%eax)
 7e9:	77 12                	ja     7fd <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7eb:	8b 10                	mov    (%eax),%edx
 7ed:	39 c2                	cmp    %eax,%edx
 7ef:	77 f0                	ja     7e1 <free+0x13>
 7f1:	39 c8                	cmp    %ecx,%eax
 7f3:	72 08                	jb     7fd <free+0x2f>
 7f5:	39 ca                	cmp    %ecx,%edx
 7f7:	77 04                	ja     7fd <free+0x2f>
 7f9:	89 d0                	mov    %edx,%eax
 7fb:	eb e6                	jmp    7e3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7fd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 800:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 803:	8b 10                	mov    (%eax),%edx
 805:	39 d7                	cmp    %edx,%edi
 807:	74 19                	je     822 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 809:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 80c:	8b 50 04             	mov    0x4(%eax),%edx
 80f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 812:	39 ce                	cmp    %ecx,%esi
 814:	74 1b                	je     831 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 816:	89 08                	mov    %ecx,(%eax)
  freep = p;
 818:	a3 b4 0d 00 00       	mov    %eax,0xdb4
}
 81d:	5b                   	pop    %ebx
 81e:	5e                   	pop    %esi
 81f:	5f                   	pop    %edi
 820:	5d                   	pop    %ebp
 821:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 822:	03 72 04             	add    0x4(%edx),%esi
 825:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 828:	8b 10                	mov    (%eax),%edx
 82a:	8b 12                	mov    (%edx),%edx
 82c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 82f:	eb db                	jmp    80c <free+0x3e>
    p->s.size += bp->s.size;
 831:	03 53 fc             	add    -0x4(%ebx),%edx
 834:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 837:	8b 53 f8             	mov    -0x8(%ebx),%edx
 83a:	89 10                	mov    %edx,(%eax)
 83c:	eb da                	jmp    818 <free+0x4a>

0000083e <morecore>:

static Header*
morecore(uint nu)
{
 83e:	55                   	push   %ebp
 83f:	89 e5                	mov    %esp,%ebp
 841:	53                   	push   %ebx
 842:	83 ec 04             	sub    $0x4,%esp
 845:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 847:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 84c:	77 05                	ja     853 <morecore+0x15>
    nu = 4096;
 84e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 853:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 85a:	83 ec 0c             	sub    $0xc,%esp
 85d:	50                   	push   %eax
 85e:	e8 38 fd ff ff       	call   59b <sbrk>
  if(p == (char*)-1)
 863:	83 c4 10             	add    $0x10,%esp
 866:	83 f8 ff             	cmp    $0xffffffff,%eax
 869:	74 1c                	je     887 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 86b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 86e:	83 c0 08             	add    $0x8,%eax
 871:	83 ec 0c             	sub    $0xc,%esp
 874:	50                   	push   %eax
 875:	e8 54 ff ff ff       	call   7ce <free>
  return freep;
 87a:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 87f:	83 c4 10             	add    $0x10,%esp
}
 882:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 885:	c9                   	leave  
 886:	c3                   	ret    
    return 0;
 887:	b8 00 00 00 00       	mov    $0x0,%eax
 88c:	eb f4                	jmp    882 <morecore+0x44>

0000088e <malloc>:

void*
malloc(uint nbytes)
{
 88e:	55                   	push   %ebp
 88f:	89 e5                	mov    %esp,%ebp
 891:	53                   	push   %ebx
 892:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 895:	8b 45 08             	mov    0x8(%ebp),%eax
 898:	8d 58 07             	lea    0x7(%eax),%ebx
 89b:	c1 eb 03             	shr    $0x3,%ebx
 89e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8a1:	8b 0d b4 0d 00 00    	mov    0xdb4,%ecx
 8a7:	85 c9                	test   %ecx,%ecx
 8a9:	74 04                	je     8af <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ab:	8b 01                	mov    (%ecx),%eax
 8ad:	eb 4a                	jmp    8f9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8af:	c7 05 b4 0d 00 00 b8 	movl   $0xdb8,0xdb4
 8b6:	0d 00 00 
 8b9:	c7 05 b8 0d 00 00 b8 	movl   $0xdb8,0xdb8
 8c0:	0d 00 00 
    base.s.size = 0;
 8c3:	c7 05 bc 0d 00 00 00 	movl   $0x0,0xdbc
 8ca:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8cd:	b9 b8 0d 00 00       	mov    $0xdb8,%ecx
 8d2:	eb d7                	jmp    8ab <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8d4:	74 19                	je     8ef <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8d6:	29 da                	sub    %ebx,%edx
 8d8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8db:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8de:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8e1:	89 0d b4 0d 00 00    	mov    %ecx,0xdb4
      return (void*)(p + 1);
 8e7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ed:	c9                   	leave  
 8ee:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8ef:	8b 10                	mov    (%eax),%edx
 8f1:	89 11                	mov    %edx,(%ecx)
 8f3:	eb ec                	jmp    8e1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f5:	89 c1                	mov    %eax,%ecx
 8f7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8f9:	8b 50 04             	mov    0x4(%eax),%edx
 8fc:	39 da                	cmp    %ebx,%edx
 8fe:	73 d4                	jae    8d4 <malloc+0x46>
    if(p == freep)
 900:	39 05 b4 0d 00 00    	cmp    %eax,0xdb4
 906:	75 ed                	jne    8f5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 908:	89 d8                	mov    %ebx,%eax
 90a:	e8 2f ff ff ff       	call   83e <morecore>
 90f:	85 c0                	test   %eax,%eax
 911:	75 e2                	jne    8f5 <malloc+0x67>
 913:	eb d5                	jmp    8ea <malloc+0x5c>
