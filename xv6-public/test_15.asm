
_test_15:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
   7:	bb 00 00 00 00       	mov    $0x0,%ebx
   c:	eb 23                	jmp    31 <worker+0x31>
      lock_acquire(&lock);
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
   e:	83 c0 01             	add    $0x1,%eax
  11:	83 f8 31             	cmp    $0x31,%eax
  14:	7e f8                	jle    e <worker+0xe>
      global = tmp + 1;
  16:	8d 42 01             	lea    0x1(%edx),%eax
  19:	a3 44 0c 00 00       	mov    %eax,0xc44
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 40 0c 00 00       	push   $0xc40
  26:	e8 ac 03 00 00       	call   3d7 <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d 38 0c 00 00    	cmp    %ebx,0xc38
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 40 0c 00 00       	push   $0xc40
  41:	e8 7d 03 00 00       	call   3c3 <lock_acquire>
      tmp = global;
  46:	8b 15 44 0c 00 00    	mov    0xc44,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 94 03 00 00       	call   3ef <exit>

0000005b <main>:
{
  5b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  5f:	83 e4 f0             	and    $0xfffffff0,%esp
  62:	ff 71 fc             	push   -0x4(%ecx)
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	53                   	push   %ebx
  69:	51                   	push   %ecx
   ppid = getpid();
  6a:	e8 00 04 00 00       	call   46f <getpid>
  6f:	a3 48 0c 00 00       	mov    %eax,0xc48
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 40 0c 00 00       	push   $0xc40
  7c:	e8 34 03 00 00       	call   3b5 <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d 3c 0c 00 00    	cmp    %ebx,0xc3c
  94:	7e 61                	jle    f7 <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	6a 00                	push   $0x0
  9b:	6a 00                	push   $0x0
  9d:	68 00 00 00 00       	push   $0x0
  a2:	e8 b8 02 00 00       	call   35f <thread_create>
      assert(thread_pid > 0);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	7f dd                	jg     8b <main+0x30>
  ae:	6a 25                	push   $0x25
  b0:	68 f4 07 00 00       	push   $0x7f4
  b5:	68 fe 07 00 00       	push   $0x7fe
  ba:	6a 01                	push   $0x1
  bc:	e8 83 04 00 00       	call   544 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 06 08 00 00       	push   $0x806
  c9:	68 15 08 00 00       	push   $0x815
  ce:	6a 01                	push   $0x1
  d0:	e8 6f 04 00 00       	call   544 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 29 08 00 00       	push   $0x829
  dd:	6a 01                	push   $0x1
  df:	e8 60 04 00 00       	call   544 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 48 0c 00 00    	push   0xc48
  ed:	e8 2d 03 00 00       	call   41f <kill>
  f2:	e8 f8 02 00 00       	call   3ef <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 76 02 00 00       	call   380 <thread_join>
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
 115:	68 f4 07 00 00       	push   $0x7f4
 11a:	68 fe 07 00 00       	push   $0x7fe
 11f:	6a 01                	push   $0x1
 121:	e8 1e 04 00 00       	call   544 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 36 08 00 00       	push   $0x836
 12e:	68 15 08 00 00       	push   $0x815
 133:	6a 01                	push   $0x1
 135:	e8 0a 04 00 00       	call   544 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 29 08 00 00       	push   $0x829
 142:	6a 01                	push   $0x1
 144:	e8 fb 03 00 00       	call   544 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 48 0c 00 00    	push   0xc48
 152:	e8 c8 02 00 00       	call   41f <kill>
 157:	e8 93 02 00 00       	call   3ef <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 38 0c 00 00 	imul   0xc38,%eax
 163:	3b 05 44 0c 00 00    	cmp    0xc44,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 f4 07 00 00       	push   $0x7f4
 172:	68 fe 07 00 00       	push   $0x7fe
 177:	6a 01                	push   $0x1
 179:	e8 c6 03 00 00       	call   544 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 43 08 00 00       	push   $0x843
 186:	68 15 08 00 00       	push   $0x815
 18b:	6a 01                	push   $0x1
 18d:	e8 b2 03 00 00       	call   544 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 29 08 00 00       	push   $0x829
 19a:	6a 01                	push   $0x1
 19c:	e8 a3 03 00 00       	call   544 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 48 0c 00 00    	push   0xc48
 1aa:	e8 70 02 00 00       	call   41f <kill>
 1af:	e8 3b 02 00 00       	call   3ef <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 61 08 00 00       	push   $0x861
 1bc:	6a 01                	push   $0x1
 1be:	e8 81 03 00 00       	call   544 <printf>
   exit();
 1c3:	e8 27 02 00 00       	call   3ef <exit>

000001c8 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	56                   	push   %esi
 1cc:	53                   	push   %ebx
 1cd:	8b 75 08             	mov    0x8(%ebp),%esi
 1d0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d3:	89 f0                	mov    %esi,%eax
 1d5:	89 d1                	mov    %edx,%ecx
 1d7:	83 c2 01             	add    $0x1,%edx
 1da:	89 c3                	mov    %eax,%ebx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	0f b6 09             	movzbl (%ecx),%ecx
 1e2:	88 0b                	mov    %cl,(%ebx)
 1e4:	84 c9                	test   %cl,%cl
 1e6:	75 ed                	jne    1d5 <strcpy+0xd>
    ;
  return os;
}
 1e8:	89 f0                	mov    %esi,%eax
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret    

000001ee <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1f7:	eb 06                	jmp    1ff <strcmp+0x11>
    p++, q++;
 1f9:	83 c1 01             	add    $0x1,%ecx
 1fc:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ff:	0f b6 01             	movzbl (%ecx),%eax
 202:	84 c0                	test   %al,%al
 204:	74 04                	je     20a <strcmp+0x1c>
 206:	3a 02                	cmp    (%edx),%al
 208:	74 ef                	je     1f9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 20a:	0f b6 c0             	movzbl %al,%eax
 20d:	0f b6 12             	movzbl (%edx),%edx
 210:	29 d0                	sub    %edx,%eax
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <strlen>:

uint
strlen(const char *s)
{
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
 21f:	eb 03                	jmp    224 <strlen+0x10>
 221:	83 c0 01             	add    $0x1,%eax
 224:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 228:	75 f7                	jne    221 <strlen+0xd>
    ;
  return n;
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    

0000022c <memset>:

void*
memset(void *dst, int c, uint n)
{
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	57                   	push   %edi
 230:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 233:	89 d7                	mov    %edx,%edi
 235:	8b 4d 10             	mov    0x10(%ebp),%ecx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	fc                   	cld    
 23c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 23e:	89 d0                	mov    %edx,%eax
 240:	8b 7d fc             	mov    -0x4(%ebp),%edi
 243:	c9                   	leave  
 244:	c3                   	ret    

00000245 <strchr>:

char*
strchr(const char *s, char c)
{
 245:	55                   	push   %ebp
 246:	89 e5                	mov    %esp,%ebp
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 24f:	eb 03                	jmp    254 <strchr+0xf>
 251:	83 c0 01             	add    $0x1,%eax
 254:	0f b6 10             	movzbl (%eax),%edx
 257:	84 d2                	test   %dl,%dl
 259:	74 06                	je     261 <strchr+0x1c>
    if(*s == c)
 25b:	38 ca                	cmp    %cl,%dl
 25d:	75 f2                	jne    251 <strchr+0xc>
 25f:	eb 05                	jmp    266 <strchr+0x21>
      return (char*)s;
  return 0;
 261:	b8 00 00 00 00       	mov    $0x0,%eax
}
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    

00000268 <gets>:

char*
gets(char *buf, int max)
{
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	57                   	push   %edi
 26c:	56                   	push   %esi
 26d:	53                   	push   %ebx
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 274:	bb 00 00 00 00       	mov    $0x0,%ebx
 279:	89 de                	mov    %ebx,%esi
 27b:	83 c3 01             	add    $0x1,%ebx
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7d 2e                	jge    2b1 <gets+0x49>
    cc = read(0, &c, 1);
 283:	83 ec 04             	sub    $0x4,%esp
 286:	6a 01                	push   $0x1
 288:	8d 45 e7             	lea    -0x19(%ebp),%eax
 28b:	50                   	push   %eax
 28c:	6a 00                	push   $0x0
 28e:	e8 74 01 00 00       	call   407 <read>
    if(cc < 1)
 293:	83 c4 10             	add    $0x10,%esp
 296:	85 c0                	test   %eax,%eax
 298:	7e 17                	jle    2b1 <gets+0x49>
      break;
    buf[i++] = c;
 29a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	0f 94 c2             	sete   %dl
 2a6:	3c 0d                	cmp    $0xd,%al
 2a8:	0f 94 c0             	sete   %al
 2ab:	08 c2                	or     %al,%dl
 2ad:	74 ca                	je     279 <gets+0x11>
    buf[i++] = c;
 2af:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2b1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2b5:	89 f8                	mov    %edi,%eax
 2b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ba:	5b                   	pop    %ebx
 2bb:	5e                   	pop    %esi
 2bc:	5f                   	pop    %edi
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    

000002bf <stat>:

int
stat(const char *n, struct stat *st)
{
 2bf:	55                   	push   %ebp
 2c0:	89 e5                	mov    %esp,%ebp
 2c2:	56                   	push   %esi
 2c3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c4:	83 ec 08             	sub    $0x8,%esp
 2c7:	6a 00                	push   $0x0
 2c9:	ff 75 08             	push   0x8(%ebp)
 2cc:	e8 5e 01 00 00       	call   42f <open>
  if(fd < 0)
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	85 c0                	test   %eax,%eax
 2d6:	78 24                	js     2fc <stat+0x3d>
 2d8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2da:	83 ec 08             	sub    $0x8,%esp
 2dd:	ff 75 0c             	push   0xc(%ebp)
 2e0:	50                   	push   %eax
 2e1:	e8 61 01 00 00       	call   447 <fstat>
 2e6:	89 c6                	mov    %eax,%esi
  close(fd);
 2e8:	89 1c 24             	mov    %ebx,(%esp)
 2eb:	e8 27 01 00 00       	call   417 <close>
  return r;
 2f0:	83 c4 10             	add    $0x10,%esp
}
 2f3:	89 f0                	mov    %esi,%eax
 2f5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f8:	5b                   	pop    %ebx
 2f9:	5e                   	pop    %esi
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    
    return -1;
 2fc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 301:	eb f0                	jmp    2f3 <stat+0x34>

00000303 <atoi>:

int
atoi(const char *s)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	53                   	push   %ebx
 307:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 30a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 30f:	eb 10                	jmp    321 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 311:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 314:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 317:	83 c1 01             	add    $0x1,%ecx
 31a:	0f be c0             	movsbl %al,%eax
 31d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 321:	0f b6 01             	movzbl (%ecx),%eax
 324:	8d 58 d0             	lea    -0x30(%eax),%ebx
 327:	80 fb 09             	cmp    $0x9,%bl
 32a:	76 e5                	jbe    311 <atoi+0xe>
  return n;
}
 32c:	89 d0                	mov    %edx,%eax
 32e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 331:	c9                   	leave  
 332:	c3                   	ret    

00000333 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	56                   	push   %esi
 337:	53                   	push   %ebx
 338:	8b 75 08             	mov    0x8(%ebp),%esi
 33b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 33e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 341:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 343:	eb 0d                	jmp    352 <memmove+0x1f>
    *dst++ = *src++;
 345:	0f b6 01             	movzbl (%ecx),%eax
 348:	88 02                	mov    %al,(%edx)
 34a:	8d 49 01             	lea    0x1(%ecx),%ecx
 34d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 350:	89 d8                	mov    %ebx,%eax
 352:	8d 58 ff             	lea    -0x1(%eax),%ebx
 355:	85 c0                	test   %eax,%eax
 357:	7f ec                	jg     345 <memmove+0x12>
  return vdst;
}
 359:	89 f0                	mov    %esi,%eax
 35b:	5b                   	pop    %ebx
 35c:	5e                   	pop    %esi
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    

0000035f <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 365:	68 00 10 00 00       	push   $0x1000
 36a:	e8 fb 03 00 00       	call   76a <malloc>

  return clone(start_routine, arg1, arg2, stack);
 36f:	50                   	push   %eax
 370:	ff 75 10             	push   0x10(%ebp)
 373:	ff 75 0c             	push   0xc(%ebp)
 376:	ff 75 08             	push   0x8(%ebp)
 379:	e8 11 01 00 00       	call   48f <clone>
}
 37e:	c9                   	leave  
 37f:	c3                   	ret    

00000380 <thread_join>:

int thread_join(){
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 387:	8d 45 f4             	lea    -0xc(%ebp),%eax
 38a:	50                   	push   %eax
 38b:	e8 07 01 00 00       	call   497 <join>
  if (x < 0) {
 390:	83 c4 10             	add    $0x10,%esp
 393:	85 c0                	test   %eax,%eax
 395:	78 17                	js     3ae <thread_join+0x2e>
 397:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 399:	83 ec 0c             	sub    $0xc,%esp
 39c:	ff 75 f4             	push   -0xc(%ebp)
 39f:	e8 06 03 00 00       	call   6aa <free>
  return x;
 3a4:	83 c4 10             	add    $0x10,%esp
}
 3a7:	89 d8                	mov    %ebx,%eax
 3a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ac:	c9                   	leave  
 3ad:	c3                   	ret    
    return -1;
 3ae:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 3b3:	eb f2                	jmp    3a7 <thread_join+0x27>

000003b5 <lock_init>:

void lock_init(lock_t *spin){
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 3b8:	8b 45 08             	mov    0x8(%ebp),%eax
 3bb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3c1:	5d                   	pop    %ebp
 3c2:	c3                   	ret    

000003c3 <lock_acquire>:

void lock_acquire(lock_t *spin){
 3c3:	55                   	push   %ebp
 3c4:	89 e5                	mov    %esp,%ebp
 3c6:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3c9:	b8 01 00 00 00       	mov    $0x1,%eax
 3ce:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 3d1:	85 c0                	test   %eax,%eax
 3d3:	75 f4                	jne    3c9 <lock_acquire+0x6>

}
 3d5:	5d                   	pop    %ebp
 3d6:	c3                   	ret    

000003d7 <lock_release>:

void lock_release(lock_t *spin){
 3d7:	55                   	push   %ebp
 3d8:	89 e5                	mov    %esp,%ebp
 3da:	8b 55 08             	mov    0x8(%ebp),%edx
 3dd:	b8 00 00 00 00       	mov    $0x0,%eax
 3e2:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    

000003e7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e7:	b8 01 00 00 00       	mov    $0x1,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <exit>:
SYSCALL(exit)
 3ef:	b8 02 00 00 00       	mov    $0x2,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <wait>:
SYSCALL(wait)
 3f7:	b8 03 00 00 00       	mov    $0x3,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <pipe>:
SYSCALL(pipe)
 3ff:	b8 04 00 00 00       	mov    $0x4,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <read>:
SYSCALL(read)
 407:	b8 05 00 00 00       	mov    $0x5,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <write>:
SYSCALL(write)
 40f:	b8 10 00 00 00       	mov    $0x10,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <close>:
SYSCALL(close)
 417:	b8 15 00 00 00       	mov    $0x15,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <kill>:
SYSCALL(kill)
 41f:	b8 06 00 00 00       	mov    $0x6,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <exec>:
SYSCALL(exec)
 427:	b8 07 00 00 00       	mov    $0x7,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <open>:
SYSCALL(open)
 42f:	b8 0f 00 00 00       	mov    $0xf,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <mknod>:
SYSCALL(mknod)
 437:	b8 11 00 00 00       	mov    $0x11,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <unlink>:
SYSCALL(unlink)
 43f:	b8 12 00 00 00       	mov    $0x12,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <fstat>:
SYSCALL(fstat)
 447:	b8 08 00 00 00       	mov    $0x8,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <link>:
SYSCALL(link)
 44f:	b8 13 00 00 00       	mov    $0x13,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <mkdir>:
SYSCALL(mkdir)
 457:	b8 14 00 00 00       	mov    $0x14,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <chdir>:
SYSCALL(chdir)
 45f:	b8 09 00 00 00       	mov    $0x9,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <dup>:
SYSCALL(dup)
 467:	b8 0a 00 00 00       	mov    $0xa,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <getpid>:
SYSCALL(getpid)
 46f:	b8 0b 00 00 00       	mov    $0xb,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <sbrk>:
SYSCALL(sbrk)
 477:	b8 0c 00 00 00       	mov    $0xc,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <sleep>:
SYSCALL(sleep)
 47f:	b8 0d 00 00 00       	mov    $0xd,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <uptime>:
SYSCALL(uptime)
 487:	b8 0e 00 00 00       	mov    $0xe,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <clone>:
SYSCALL(clone)
 48f:	b8 16 00 00 00       	mov    $0x16,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <join>:
 497:	b8 17 00 00 00       	mov    $0x17,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 49f:	55                   	push   %ebp
 4a0:	89 e5                	mov    %esp,%ebp
 4a2:	83 ec 1c             	sub    $0x1c,%esp
 4a5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4a8:	6a 01                	push   $0x1
 4aa:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4ad:	52                   	push   %edx
 4ae:	50                   	push   %eax
 4af:	e8 5b ff ff ff       	call   40f <write>
}
 4b4:	83 c4 10             	add    $0x10,%esp
 4b7:	c9                   	leave  
 4b8:	c3                   	ret    

000004b9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4b9:	55                   	push   %ebp
 4ba:	89 e5                	mov    %esp,%ebp
 4bc:	57                   	push   %edi
 4bd:	56                   	push   %esi
 4be:	53                   	push   %ebx
 4bf:	83 ec 2c             	sub    $0x2c,%esp
 4c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c5:	89 d0                	mov    %edx,%eax
 4c7:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4c9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4cd:	0f 95 c1             	setne  %cl
 4d0:	c1 ea 1f             	shr    $0x1f,%edx
 4d3:	84 d1                	test   %dl,%cl
 4d5:	74 44                	je     51b <printint+0x62>
    neg = 1;
    x = -xx;
 4d7:	f7 d8                	neg    %eax
 4d9:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4db:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4e7:	89 c8                	mov    %ecx,%eax
 4e9:	ba 00 00 00 00       	mov    $0x0,%edx
 4ee:	f7 f6                	div    %esi
 4f0:	89 df                	mov    %ebx,%edi
 4f2:	83 c3 01             	add    $0x1,%ebx
 4f5:	0f b6 92 d0 08 00 00 	movzbl 0x8d0(%edx),%edx
 4fc:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 500:	89 ca                	mov    %ecx,%edx
 502:	89 c1                	mov    %eax,%ecx
 504:	39 d6                	cmp    %edx,%esi
 506:	76 df                	jbe    4e7 <printint+0x2e>
  if(neg)
 508:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 50c:	74 31                	je     53f <printint+0x86>
    buf[i++] = '-';
 50e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 513:	8d 5f 02             	lea    0x2(%edi),%ebx
 516:	8b 75 d0             	mov    -0x30(%ebp),%esi
 519:	eb 17                	jmp    532 <printint+0x79>
    x = xx;
 51b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 51d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 524:	eb bc                	jmp    4e2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 526:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 52b:	89 f0                	mov    %esi,%eax
 52d:	e8 6d ff ff ff       	call   49f <putc>
  while(--i >= 0)
 532:	83 eb 01             	sub    $0x1,%ebx
 535:	79 ef                	jns    526 <printint+0x6d>
}
 537:	83 c4 2c             	add    $0x2c,%esp
 53a:	5b                   	pop    %ebx
 53b:	5e                   	pop    %esi
 53c:	5f                   	pop    %edi
 53d:	5d                   	pop    %ebp
 53e:	c3                   	ret    
 53f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 542:	eb ee                	jmp    532 <printint+0x79>

00000544 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	57                   	push   %edi
 548:	56                   	push   %esi
 549:	53                   	push   %ebx
 54a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 54d:	8d 45 10             	lea    0x10(%ebp),%eax
 550:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 553:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 558:	bb 00 00 00 00       	mov    $0x0,%ebx
 55d:	eb 14                	jmp    573 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 55f:	89 fa                	mov    %edi,%edx
 561:	8b 45 08             	mov    0x8(%ebp),%eax
 564:	e8 36 ff ff ff       	call   49f <putc>
 569:	eb 05                	jmp    570 <printf+0x2c>
      }
    } else if(state == '%'){
 56b:	83 fe 25             	cmp    $0x25,%esi
 56e:	74 25                	je     595 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 570:	83 c3 01             	add    $0x1,%ebx
 573:	8b 45 0c             	mov    0xc(%ebp),%eax
 576:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 57a:	84 c0                	test   %al,%al
 57c:	0f 84 20 01 00 00    	je     6a2 <printf+0x15e>
    c = fmt[i] & 0xff;
 582:	0f be f8             	movsbl %al,%edi
 585:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 588:	85 f6                	test   %esi,%esi
 58a:	75 df                	jne    56b <printf+0x27>
      if(c == '%'){
 58c:	83 f8 25             	cmp    $0x25,%eax
 58f:	75 ce                	jne    55f <printf+0x1b>
        state = '%';
 591:	89 c6                	mov    %eax,%esi
 593:	eb db                	jmp    570 <printf+0x2c>
      if(c == 'd'){
 595:	83 f8 25             	cmp    $0x25,%eax
 598:	0f 84 cf 00 00 00    	je     66d <printf+0x129>
 59e:	0f 8c dd 00 00 00    	jl     681 <printf+0x13d>
 5a4:	83 f8 78             	cmp    $0x78,%eax
 5a7:	0f 8f d4 00 00 00    	jg     681 <printf+0x13d>
 5ad:	83 f8 63             	cmp    $0x63,%eax
 5b0:	0f 8c cb 00 00 00    	jl     681 <printf+0x13d>
 5b6:	83 e8 63             	sub    $0x63,%eax
 5b9:	83 f8 15             	cmp    $0x15,%eax
 5bc:	0f 87 bf 00 00 00    	ja     681 <printf+0x13d>
 5c2:	ff 24 85 78 08 00 00 	jmp    *0x878(,%eax,4)
        printint(fd, *ap, 10, 1);
 5c9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5cc:	8b 17                	mov    (%edi),%edx
 5ce:	83 ec 0c             	sub    $0xc,%esp
 5d1:	6a 01                	push   $0x1
 5d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5d8:	8b 45 08             	mov    0x8(%ebp),%eax
 5db:	e8 d9 fe ff ff       	call   4b9 <printint>
        ap++;
 5e0:	83 c7 04             	add    $0x4,%edi
 5e3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5e6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5e9:	be 00 00 00 00       	mov    $0x0,%esi
 5ee:	eb 80                	jmp    570 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5f0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f3:	8b 17                	mov    (%edi),%edx
 5f5:	83 ec 0c             	sub    $0xc,%esp
 5f8:	6a 00                	push   $0x0
 5fa:	b9 10 00 00 00       	mov    $0x10,%ecx
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
 602:	e8 b2 fe ff ff       	call   4b9 <printint>
        ap++;
 607:	83 c7 04             	add    $0x4,%edi
 60a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 60d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 610:	be 00 00 00 00       	mov    $0x0,%esi
 615:	e9 56 ff ff ff       	jmp    570 <printf+0x2c>
        s = (char*)*ap;
 61a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61d:	8b 30                	mov    (%eax),%esi
        ap++;
 61f:	83 c0 04             	add    $0x4,%eax
 622:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 625:	85 f6                	test   %esi,%esi
 627:	75 15                	jne    63e <printf+0xfa>
          s = "(null)";
 629:	be 6e 08 00 00       	mov    $0x86e,%esi
 62e:	eb 0e                	jmp    63e <printf+0xfa>
          putc(fd, *s);
 630:	0f be d2             	movsbl %dl,%edx
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	e8 64 fe ff ff       	call   49f <putc>
          s++;
 63b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 63e:	0f b6 16             	movzbl (%esi),%edx
 641:	84 d2                	test   %dl,%dl
 643:	75 eb                	jne    630 <printf+0xec>
      state = 0;
 645:	be 00 00 00 00       	mov    $0x0,%esi
 64a:	e9 21 ff ff ff       	jmp    570 <printf+0x2c>
        putc(fd, *ap);
 64f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 652:	0f be 17             	movsbl (%edi),%edx
 655:	8b 45 08             	mov    0x8(%ebp),%eax
 658:	e8 42 fe ff ff       	call   49f <putc>
        ap++;
 65d:	83 c7 04             	add    $0x4,%edi
 660:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 663:	be 00 00 00 00       	mov    $0x0,%esi
 668:	e9 03 ff ff ff       	jmp    570 <printf+0x2c>
        putc(fd, c);
 66d:	89 fa                	mov    %edi,%edx
 66f:	8b 45 08             	mov    0x8(%ebp),%eax
 672:	e8 28 fe ff ff       	call   49f <putc>
      state = 0;
 677:	be 00 00 00 00       	mov    $0x0,%esi
 67c:	e9 ef fe ff ff       	jmp    570 <printf+0x2c>
        putc(fd, '%');
 681:	ba 25 00 00 00       	mov    $0x25,%edx
 686:	8b 45 08             	mov    0x8(%ebp),%eax
 689:	e8 11 fe ff ff       	call   49f <putc>
        putc(fd, c);
 68e:	89 fa                	mov    %edi,%edx
 690:	8b 45 08             	mov    0x8(%ebp),%eax
 693:	e8 07 fe ff ff       	call   49f <putc>
      state = 0;
 698:	be 00 00 00 00       	mov    $0x0,%esi
 69d:	e9 ce fe ff ff       	jmp    570 <printf+0x2c>
    }
  }
}
 6a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a5:	5b                   	pop    %ebx
 6a6:	5e                   	pop    %esi
 6a7:	5f                   	pop    %edi
 6a8:	5d                   	pop    %ebp
 6a9:	c3                   	ret    

000006aa <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6aa:	55                   	push   %ebp
 6ab:	89 e5                	mov    %esp,%ebp
 6ad:	57                   	push   %edi
 6ae:	56                   	push   %esi
 6af:	53                   	push   %ebx
 6b0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6b3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b6:	a1 4c 0c 00 00       	mov    0xc4c,%eax
 6bb:	eb 02                	jmp    6bf <free+0x15>
 6bd:	89 d0                	mov    %edx,%eax
 6bf:	39 c8                	cmp    %ecx,%eax
 6c1:	73 04                	jae    6c7 <free+0x1d>
 6c3:	39 08                	cmp    %ecx,(%eax)
 6c5:	77 12                	ja     6d9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c7:	8b 10                	mov    (%eax),%edx
 6c9:	39 c2                	cmp    %eax,%edx
 6cb:	77 f0                	ja     6bd <free+0x13>
 6cd:	39 c8                	cmp    %ecx,%eax
 6cf:	72 08                	jb     6d9 <free+0x2f>
 6d1:	39 ca                	cmp    %ecx,%edx
 6d3:	77 04                	ja     6d9 <free+0x2f>
 6d5:	89 d0                	mov    %edx,%eax
 6d7:	eb e6                	jmp    6bf <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6dc:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6df:	8b 10                	mov    (%eax),%edx
 6e1:	39 d7                	cmp    %edx,%edi
 6e3:	74 19                	je     6fe <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e8:	8b 50 04             	mov    0x4(%eax),%edx
 6eb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ee:	39 ce                	cmp    %ecx,%esi
 6f0:	74 1b                	je     70d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6f2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6f4:	a3 4c 0c 00 00       	mov    %eax,0xc4c
}
 6f9:	5b                   	pop    %ebx
 6fa:	5e                   	pop    %esi
 6fb:	5f                   	pop    %edi
 6fc:	5d                   	pop    %ebp
 6fd:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6fe:	03 72 04             	add    0x4(%edx),%esi
 701:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 704:	8b 10                	mov    (%eax),%edx
 706:	8b 12                	mov    (%edx),%edx
 708:	89 53 f8             	mov    %edx,-0x8(%ebx)
 70b:	eb db                	jmp    6e8 <free+0x3e>
    p->s.size += bp->s.size;
 70d:	03 53 fc             	add    -0x4(%ebx),%edx
 710:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 713:	8b 53 f8             	mov    -0x8(%ebx),%edx
 716:	89 10                	mov    %edx,(%eax)
 718:	eb da                	jmp    6f4 <free+0x4a>

0000071a <morecore>:

static Header*
morecore(uint nu)
{
 71a:	55                   	push   %ebp
 71b:	89 e5                	mov    %esp,%ebp
 71d:	53                   	push   %ebx
 71e:	83 ec 04             	sub    $0x4,%esp
 721:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 723:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 728:	77 05                	ja     72f <morecore+0x15>
    nu = 4096;
 72a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 72f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 736:	83 ec 0c             	sub    $0xc,%esp
 739:	50                   	push   %eax
 73a:	e8 38 fd ff ff       	call   477 <sbrk>
  if(p == (char*)-1)
 73f:	83 c4 10             	add    $0x10,%esp
 742:	83 f8 ff             	cmp    $0xffffffff,%eax
 745:	74 1c                	je     763 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 747:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 74a:	83 c0 08             	add    $0x8,%eax
 74d:	83 ec 0c             	sub    $0xc,%esp
 750:	50                   	push   %eax
 751:	e8 54 ff ff ff       	call   6aa <free>
  return freep;
 756:	a1 4c 0c 00 00       	mov    0xc4c,%eax
 75b:	83 c4 10             	add    $0x10,%esp
}
 75e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 761:	c9                   	leave  
 762:	c3                   	ret    
    return 0;
 763:	b8 00 00 00 00       	mov    $0x0,%eax
 768:	eb f4                	jmp    75e <morecore+0x44>

0000076a <malloc>:

void*
malloc(uint nbytes)
{
 76a:	55                   	push   %ebp
 76b:	89 e5                	mov    %esp,%ebp
 76d:	53                   	push   %ebx
 76e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 771:	8b 45 08             	mov    0x8(%ebp),%eax
 774:	8d 58 07             	lea    0x7(%eax),%ebx
 777:	c1 eb 03             	shr    $0x3,%ebx
 77a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 77d:	8b 0d 4c 0c 00 00    	mov    0xc4c,%ecx
 783:	85 c9                	test   %ecx,%ecx
 785:	74 04                	je     78b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 787:	8b 01                	mov    (%ecx),%eax
 789:	eb 4a                	jmp    7d5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 78b:	c7 05 4c 0c 00 00 50 	movl   $0xc50,0xc4c
 792:	0c 00 00 
 795:	c7 05 50 0c 00 00 50 	movl   $0xc50,0xc50
 79c:	0c 00 00 
    base.s.size = 0;
 79f:	c7 05 54 0c 00 00 00 	movl   $0x0,0xc54
 7a6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7a9:	b9 50 0c 00 00       	mov    $0xc50,%ecx
 7ae:	eb d7                	jmp    787 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7b0:	74 19                	je     7cb <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7b2:	29 da                	sub    %ebx,%edx
 7b4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7ba:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7bd:	89 0d 4c 0c 00 00    	mov    %ecx,0xc4c
      return (void*)(p + 1);
 7c3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c9:	c9                   	leave  
 7ca:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7cb:	8b 10                	mov    (%eax),%edx
 7cd:	89 11                	mov    %edx,(%ecx)
 7cf:	eb ec                	jmp    7bd <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d1:	89 c1                	mov    %eax,%ecx
 7d3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7d5:	8b 50 04             	mov    0x4(%eax),%edx
 7d8:	39 da                	cmp    %ebx,%edx
 7da:	73 d4                	jae    7b0 <malloc+0x46>
    if(p == freep)
 7dc:	39 05 4c 0c 00 00    	cmp    %eax,0xc4c
 7e2:	75 ed                	jne    7d1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7e4:	89 d8                	mov    %ebx,%eax
 7e6:	e8 2f ff ff ff       	call   71a <morecore>
 7eb:	85 c0                	test   %eax,%eax
 7ed:	75 e2                	jne    7d1 <malloc+0x67>
 7ef:	eb d5                	jmp    7c6 <malloc+0x5c>
