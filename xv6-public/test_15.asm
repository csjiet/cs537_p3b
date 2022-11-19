
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
  19:	a3 40 0c 00 00       	mov    %eax,0xc40
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 3c 0c 00 00       	push   $0xc3c
  26:	e8 af 03 00 00       	call   3da <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d 34 0c 00 00    	cmp    %ebx,0xc34
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 3c 0c 00 00       	push   $0xc3c
  41:	e8 80 03 00 00       	call   3c6 <lock_acquire>
      tmp = global;
  46:	8b 15 40 0c 00 00    	mov    0xc40,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 97 03 00 00       	call   3f2 <exit>

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
  6a:	e8 03 04 00 00       	call   472 <getpid>
  6f:	a3 44 0c 00 00       	mov    %eax,0xc44
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 3c 0c 00 00       	push   $0xc3c
  7c:	e8 37 03 00 00       	call   3b8 <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d 38 0c 00 00    	cmp    %ebx,0xc38
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
  bc:	e8 86 04 00 00       	call   547 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 06 08 00 00       	push   $0x806
  c9:	68 15 08 00 00       	push   $0x815
  ce:	6a 01                	push   $0x1
  d0:	e8 72 04 00 00       	call   547 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 29 08 00 00       	push   $0x829
  dd:	6a 01                	push   $0x1
  df:	e8 63 04 00 00       	call   547 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 44 0c 00 00    	push   0xc44
  ed:	e8 30 03 00 00       	call   422 <kill>
  f2:	e8 fb 02 00 00       	call   3f2 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 38 0c 00 00       	mov    0xc38,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 8a 02 00 00       	call   394 <thread_join>
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
 121:	e8 21 04 00 00       	call   547 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 36 08 00 00       	push   $0x836
 12e:	68 15 08 00 00       	push   $0x815
 133:	6a 01                	push   $0x1
 135:	e8 0d 04 00 00       	call   547 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 29 08 00 00       	push   $0x829
 142:	6a 01                	push   $0x1
 144:	e8 fe 03 00 00       	call   547 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 44 0c 00 00    	push   0xc44
 152:	e8 cb 02 00 00       	call   422 <kill>
 157:	e8 96 02 00 00       	call   3f2 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 34 0c 00 00 	imul   0xc34,%eax
 163:	3b 05 40 0c 00 00    	cmp    0xc40,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 f4 07 00 00       	push   $0x7f4
 172:	68 fe 07 00 00       	push   $0x7fe
 177:	6a 01                	push   $0x1
 179:	e8 c9 03 00 00       	call   547 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 43 08 00 00       	push   $0x843
 186:	68 15 08 00 00       	push   $0x815
 18b:	6a 01                	push   $0x1
 18d:	e8 b5 03 00 00       	call   547 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 29 08 00 00       	push   $0x829
 19a:	6a 01                	push   $0x1
 19c:	e8 a6 03 00 00       	call   547 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 44 0c 00 00    	push   0xc44
 1aa:	e8 73 02 00 00       	call   422 <kill>
 1af:	e8 3e 02 00 00       	call   3f2 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 61 08 00 00       	push   $0x861
 1bc:	6a 01                	push   $0x1
 1be:	e8 84 03 00 00       	call   547 <printf>
   exit();
 1c3:	e8 2a 02 00 00       	call   3f2 <exit>

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
 28e:	e8 77 01 00 00       	call   40a <read>
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
 2cc:	e8 61 01 00 00       	call   432 <open>
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
 2e1:	e8 64 01 00 00       	call   44a <fstat>
 2e6:	89 c6                	mov    %eax,%esi
  close(fd);
 2e8:	89 1c 24             	mov    %ebx,(%esp)
 2eb:	e8 2a 01 00 00       	call   41a <close>
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

  void* stack = malloc(2 * PGSIZE);
 365:	68 00 20 00 00       	push   $0x2000
 36a:	e8 fe 03 00 00       	call   76d <malloc>
  if ((uint)stack%PGSIZE){
 36f:	83 c4 10             	add    $0x10,%esp
 372:	a9 ff 0f 00 00       	test   $0xfff,%eax
 377:	74 0a                	je     383 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 379:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 37e:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 383:	50                   	push   %eax
 384:	ff 75 10             	push   0x10(%ebp)
 387:	ff 75 0c             	push   0xc(%ebp)
 38a:	ff 75 08             	push   0x8(%ebp)
 38d:	e8 00 01 00 00       	call   492 <clone>
}
 392:	c9                   	leave  
 393:	c3                   	ret    

00000394 <thread_join>:

int thread_join(){
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	53                   	push   %ebx
 398:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 39b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 39e:	50                   	push   %eax
 39f:	e8 f6 00 00 00       	call   49a <join>
 3a4:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 3a6:	83 c4 04             	add    $0x4,%esp
 3a9:	ff 75 f4             	push   -0xc(%ebp)
 3ac:	e8 fc 02 00 00       	call   6ad <free>
  return x;
}
 3b1:	89 d8                	mov    %ebx,%eax
 3b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b6:	c9                   	leave  
 3b7:	c3                   	ret    

000003b8 <lock_init>:

void lock_init(lock_t *spin){
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 3bb:	8b 45 08             	mov    0x8(%ebp),%eax
 3be:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3c4:	5d                   	pop    %ebp
 3c5:	c3                   	ret    

000003c6 <lock_acquire>:

void lock_acquire(lock_t *spin){
 3c6:	55                   	push   %ebp
 3c7:	89 e5                	mov    %esp,%ebp
 3c9:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3cc:	b8 01 00 00 00       	mov    $0x1,%eax
 3d1:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 3d4:	85 c0                	test   %eax,%eax
 3d6:	75 f4                	jne    3cc <lock_acquire+0x6>

}
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <lock_release>:

void lock_release(lock_t *spin){
 3da:	55                   	push   %ebp
 3db:	89 e5                	mov    %esp,%ebp
 3dd:	8b 55 08             	mov    0x8(%ebp),%edx
 3e0:	b8 00 00 00 00       	mov    $0x0,%eax
 3e5:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 3e8:	5d                   	pop    %ebp
 3e9:	c3                   	ret    

000003ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ea:	b8 01 00 00 00       	mov    $0x1,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <exit>:
SYSCALL(exit)
 3f2:	b8 02 00 00 00       	mov    $0x2,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <wait>:
SYSCALL(wait)
 3fa:	b8 03 00 00 00       	mov    $0x3,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <pipe>:
SYSCALL(pipe)
 402:	b8 04 00 00 00       	mov    $0x4,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <read>:
SYSCALL(read)
 40a:	b8 05 00 00 00       	mov    $0x5,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <write>:
SYSCALL(write)
 412:	b8 10 00 00 00       	mov    $0x10,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <close>:
SYSCALL(close)
 41a:	b8 15 00 00 00       	mov    $0x15,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <kill>:
SYSCALL(kill)
 422:	b8 06 00 00 00       	mov    $0x6,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <exec>:
SYSCALL(exec)
 42a:	b8 07 00 00 00       	mov    $0x7,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <open>:
SYSCALL(open)
 432:	b8 0f 00 00 00       	mov    $0xf,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <mknod>:
SYSCALL(mknod)
 43a:	b8 11 00 00 00       	mov    $0x11,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <unlink>:
SYSCALL(unlink)
 442:	b8 12 00 00 00       	mov    $0x12,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <fstat>:
SYSCALL(fstat)
 44a:	b8 08 00 00 00       	mov    $0x8,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <link>:
SYSCALL(link)
 452:	b8 13 00 00 00       	mov    $0x13,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <mkdir>:
SYSCALL(mkdir)
 45a:	b8 14 00 00 00       	mov    $0x14,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <chdir>:
SYSCALL(chdir)
 462:	b8 09 00 00 00       	mov    $0x9,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <dup>:
SYSCALL(dup)
 46a:	b8 0a 00 00 00       	mov    $0xa,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <getpid>:
SYSCALL(getpid)
 472:	b8 0b 00 00 00       	mov    $0xb,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <sbrk>:
SYSCALL(sbrk)
 47a:	b8 0c 00 00 00       	mov    $0xc,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <sleep>:
SYSCALL(sleep)
 482:	b8 0d 00 00 00       	mov    $0xd,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <uptime>:
SYSCALL(uptime)
 48a:	b8 0e 00 00 00       	mov    $0xe,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <clone>:
SYSCALL(clone)
 492:	b8 16 00 00 00       	mov    $0x16,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <join>:
 49a:	b8 17 00 00 00       	mov    $0x17,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	83 ec 1c             	sub    $0x1c,%esp
 4a8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4ab:	6a 01                	push   $0x1
 4ad:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4b0:	52                   	push   %edx
 4b1:	50                   	push   %eax
 4b2:	e8 5b ff ff ff       	call   412 <write>
}
 4b7:	83 c4 10             	add    $0x10,%esp
 4ba:	c9                   	leave  
 4bb:	c3                   	ret    

000004bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4bc:	55                   	push   %ebp
 4bd:	89 e5                	mov    %esp,%ebp
 4bf:	57                   	push   %edi
 4c0:	56                   	push   %esi
 4c1:	53                   	push   %ebx
 4c2:	83 ec 2c             	sub    $0x2c,%esp
 4c5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c8:	89 d0                	mov    %edx,%eax
 4ca:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4cc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4d0:	0f 95 c1             	setne  %cl
 4d3:	c1 ea 1f             	shr    $0x1f,%edx
 4d6:	84 d1                	test   %dl,%cl
 4d8:	74 44                	je     51e <printint+0x62>
    neg = 1;
    x = -xx;
 4da:	f7 d8                	neg    %eax
 4dc:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4de:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4e5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4ea:	89 c8                	mov    %ecx,%eax
 4ec:	ba 00 00 00 00       	mov    $0x0,%edx
 4f1:	f7 f6                	div    %esi
 4f3:	89 df                	mov    %ebx,%edi
 4f5:	83 c3 01             	add    $0x1,%ebx
 4f8:	0f b6 92 d0 08 00 00 	movzbl 0x8d0(%edx),%edx
 4ff:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 503:	89 ca                	mov    %ecx,%edx
 505:	89 c1                	mov    %eax,%ecx
 507:	39 d6                	cmp    %edx,%esi
 509:	76 df                	jbe    4ea <printint+0x2e>
  if(neg)
 50b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 50f:	74 31                	je     542 <printint+0x86>
    buf[i++] = '-';
 511:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 516:	8d 5f 02             	lea    0x2(%edi),%ebx
 519:	8b 75 d0             	mov    -0x30(%ebp),%esi
 51c:	eb 17                	jmp    535 <printint+0x79>
    x = xx;
 51e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 520:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 527:	eb bc                	jmp    4e5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 529:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 52e:	89 f0                	mov    %esi,%eax
 530:	e8 6d ff ff ff       	call   4a2 <putc>
  while(--i >= 0)
 535:	83 eb 01             	sub    $0x1,%ebx
 538:	79 ef                	jns    529 <printint+0x6d>
}
 53a:	83 c4 2c             	add    $0x2c,%esp
 53d:	5b                   	pop    %ebx
 53e:	5e                   	pop    %esi
 53f:	5f                   	pop    %edi
 540:	5d                   	pop    %ebp
 541:	c3                   	ret    
 542:	8b 75 d0             	mov    -0x30(%ebp),%esi
 545:	eb ee                	jmp    535 <printint+0x79>

00000547 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 547:	55                   	push   %ebp
 548:	89 e5                	mov    %esp,%ebp
 54a:	57                   	push   %edi
 54b:	56                   	push   %esi
 54c:	53                   	push   %ebx
 54d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 550:	8d 45 10             	lea    0x10(%ebp),%eax
 553:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 556:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 55b:	bb 00 00 00 00       	mov    $0x0,%ebx
 560:	eb 14                	jmp    576 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 562:	89 fa                	mov    %edi,%edx
 564:	8b 45 08             	mov    0x8(%ebp),%eax
 567:	e8 36 ff ff ff       	call   4a2 <putc>
 56c:	eb 05                	jmp    573 <printf+0x2c>
      }
    } else if(state == '%'){
 56e:	83 fe 25             	cmp    $0x25,%esi
 571:	74 25                	je     598 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 573:	83 c3 01             	add    $0x1,%ebx
 576:	8b 45 0c             	mov    0xc(%ebp),%eax
 579:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 57d:	84 c0                	test   %al,%al
 57f:	0f 84 20 01 00 00    	je     6a5 <printf+0x15e>
    c = fmt[i] & 0xff;
 585:	0f be f8             	movsbl %al,%edi
 588:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 58b:	85 f6                	test   %esi,%esi
 58d:	75 df                	jne    56e <printf+0x27>
      if(c == '%'){
 58f:	83 f8 25             	cmp    $0x25,%eax
 592:	75 ce                	jne    562 <printf+0x1b>
        state = '%';
 594:	89 c6                	mov    %eax,%esi
 596:	eb db                	jmp    573 <printf+0x2c>
      if(c == 'd'){
 598:	83 f8 25             	cmp    $0x25,%eax
 59b:	0f 84 cf 00 00 00    	je     670 <printf+0x129>
 5a1:	0f 8c dd 00 00 00    	jl     684 <printf+0x13d>
 5a7:	83 f8 78             	cmp    $0x78,%eax
 5aa:	0f 8f d4 00 00 00    	jg     684 <printf+0x13d>
 5b0:	83 f8 63             	cmp    $0x63,%eax
 5b3:	0f 8c cb 00 00 00    	jl     684 <printf+0x13d>
 5b9:	83 e8 63             	sub    $0x63,%eax
 5bc:	83 f8 15             	cmp    $0x15,%eax
 5bf:	0f 87 bf 00 00 00    	ja     684 <printf+0x13d>
 5c5:	ff 24 85 78 08 00 00 	jmp    *0x878(,%eax,4)
        printint(fd, *ap, 10, 1);
 5cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5cf:	8b 17                	mov    (%edi),%edx
 5d1:	83 ec 0c             	sub    $0xc,%esp
 5d4:	6a 01                	push   $0x1
 5d6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	e8 d9 fe ff ff       	call   4bc <printint>
        ap++;
 5e3:	83 c7 04             	add    $0x4,%edi
 5e6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5e9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ec:	be 00 00 00 00       	mov    $0x0,%esi
 5f1:	eb 80                	jmp    573 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f6:	8b 17                	mov    (%edi),%edx
 5f8:	83 ec 0c             	sub    $0xc,%esp
 5fb:	6a 00                	push   $0x0
 5fd:	b9 10 00 00 00       	mov    $0x10,%ecx
 602:	8b 45 08             	mov    0x8(%ebp),%eax
 605:	e8 b2 fe ff ff       	call   4bc <printint>
        ap++;
 60a:	83 c7 04             	add    $0x4,%edi
 60d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 610:	83 c4 10             	add    $0x10,%esp
      state = 0;
 613:	be 00 00 00 00       	mov    $0x0,%esi
 618:	e9 56 ff ff ff       	jmp    573 <printf+0x2c>
        s = (char*)*ap;
 61d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 620:	8b 30                	mov    (%eax),%esi
        ap++;
 622:	83 c0 04             	add    $0x4,%eax
 625:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 628:	85 f6                	test   %esi,%esi
 62a:	75 15                	jne    641 <printf+0xfa>
          s = "(null)";
 62c:	be 6e 08 00 00       	mov    $0x86e,%esi
 631:	eb 0e                	jmp    641 <printf+0xfa>
          putc(fd, *s);
 633:	0f be d2             	movsbl %dl,%edx
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	e8 64 fe ff ff       	call   4a2 <putc>
          s++;
 63e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 641:	0f b6 16             	movzbl (%esi),%edx
 644:	84 d2                	test   %dl,%dl
 646:	75 eb                	jne    633 <printf+0xec>
      state = 0;
 648:	be 00 00 00 00       	mov    $0x0,%esi
 64d:	e9 21 ff ff ff       	jmp    573 <printf+0x2c>
        putc(fd, *ap);
 652:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 655:	0f be 17             	movsbl (%edi),%edx
 658:	8b 45 08             	mov    0x8(%ebp),%eax
 65b:	e8 42 fe ff ff       	call   4a2 <putc>
        ap++;
 660:	83 c7 04             	add    $0x4,%edi
 663:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 666:	be 00 00 00 00       	mov    $0x0,%esi
 66b:	e9 03 ff ff ff       	jmp    573 <printf+0x2c>
        putc(fd, c);
 670:	89 fa                	mov    %edi,%edx
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	e8 28 fe ff ff       	call   4a2 <putc>
      state = 0;
 67a:	be 00 00 00 00       	mov    $0x0,%esi
 67f:	e9 ef fe ff ff       	jmp    573 <printf+0x2c>
        putc(fd, '%');
 684:	ba 25 00 00 00       	mov    $0x25,%edx
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	e8 11 fe ff ff       	call   4a2 <putc>
        putc(fd, c);
 691:	89 fa                	mov    %edi,%edx
 693:	8b 45 08             	mov    0x8(%ebp),%eax
 696:	e8 07 fe ff ff       	call   4a2 <putc>
      state = 0;
 69b:	be 00 00 00 00       	mov    $0x0,%esi
 6a0:	e9 ce fe ff ff       	jmp    573 <printf+0x2c>
    }
  }
}
 6a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a8:	5b                   	pop    %ebx
 6a9:	5e                   	pop    %esi
 6aa:	5f                   	pop    %edi
 6ab:	5d                   	pop    %ebp
 6ac:	c3                   	ret    

000006ad <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ad:	55                   	push   %ebp
 6ae:	89 e5                	mov    %esp,%ebp
 6b0:	57                   	push   %edi
 6b1:	56                   	push   %esi
 6b2:	53                   	push   %ebx
 6b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6b6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b9:	a1 48 0c 00 00       	mov    0xc48,%eax
 6be:	eb 02                	jmp    6c2 <free+0x15>
 6c0:	89 d0                	mov    %edx,%eax
 6c2:	39 c8                	cmp    %ecx,%eax
 6c4:	73 04                	jae    6ca <free+0x1d>
 6c6:	39 08                	cmp    %ecx,(%eax)
 6c8:	77 12                	ja     6dc <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ca:	8b 10                	mov    (%eax),%edx
 6cc:	39 c2                	cmp    %eax,%edx
 6ce:	77 f0                	ja     6c0 <free+0x13>
 6d0:	39 c8                	cmp    %ecx,%eax
 6d2:	72 08                	jb     6dc <free+0x2f>
 6d4:	39 ca                	cmp    %ecx,%edx
 6d6:	77 04                	ja     6dc <free+0x2f>
 6d8:	89 d0                	mov    %edx,%eax
 6da:	eb e6                	jmp    6c2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6dc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6df:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6e2:	8b 10                	mov    (%eax),%edx
 6e4:	39 d7                	cmp    %edx,%edi
 6e6:	74 19                	je     701 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6eb:	8b 50 04             	mov    0x4(%eax),%edx
 6ee:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f1:	39 ce                	cmp    %ecx,%esi
 6f3:	74 1b                	je     710 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6f5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6f7:	a3 48 0c 00 00       	mov    %eax,0xc48
}
 6fc:	5b                   	pop    %ebx
 6fd:	5e                   	pop    %esi
 6fe:	5f                   	pop    %edi
 6ff:	5d                   	pop    %ebp
 700:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 701:	03 72 04             	add    0x4(%edx),%esi
 704:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 707:	8b 10                	mov    (%eax),%edx
 709:	8b 12                	mov    (%edx),%edx
 70b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 70e:	eb db                	jmp    6eb <free+0x3e>
    p->s.size += bp->s.size;
 710:	03 53 fc             	add    -0x4(%ebx),%edx
 713:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 716:	8b 53 f8             	mov    -0x8(%ebx),%edx
 719:	89 10                	mov    %edx,(%eax)
 71b:	eb da                	jmp    6f7 <free+0x4a>

0000071d <morecore>:

static Header*
morecore(uint nu)
{
 71d:	55                   	push   %ebp
 71e:	89 e5                	mov    %esp,%ebp
 720:	53                   	push   %ebx
 721:	83 ec 04             	sub    $0x4,%esp
 724:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 726:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 72b:	77 05                	ja     732 <morecore+0x15>
    nu = 4096;
 72d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 732:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 739:	83 ec 0c             	sub    $0xc,%esp
 73c:	50                   	push   %eax
 73d:	e8 38 fd ff ff       	call   47a <sbrk>
  if(p == (char*)-1)
 742:	83 c4 10             	add    $0x10,%esp
 745:	83 f8 ff             	cmp    $0xffffffff,%eax
 748:	74 1c                	je     766 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 74a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 74d:	83 c0 08             	add    $0x8,%eax
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	50                   	push   %eax
 754:	e8 54 ff ff ff       	call   6ad <free>
  return freep;
 759:	a1 48 0c 00 00       	mov    0xc48,%eax
 75e:	83 c4 10             	add    $0x10,%esp
}
 761:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 764:	c9                   	leave  
 765:	c3                   	ret    
    return 0;
 766:	b8 00 00 00 00       	mov    $0x0,%eax
 76b:	eb f4                	jmp    761 <morecore+0x44>

0000076d <malloc>:

void*
malloc(uint nbytes)
{
 76d:	55                   	push   %ebp
 76e:	89 e5                	mov    %esp,%ebp
 770:	53                   	push   %ebx
 771:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	8d 58 07             	lea    0x7(%eax),%ebx
 77a:	c1 eb 03             	shr    $0x3,%ebx
 77d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 780:	8b 0d 48 0c 00 00    	mov    0xc48,%ecx
 786:	85 c9                	test   %ecx,%ecx
 788:	74 04                	je     78e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 78a:	8b 01                	mov    (%ecx),%eax
 78c:	eb 4a                	jmp    7d8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 78e:	c7 05 48 0c 00 00 4c 	movl   $0xc4c,0xc48
 795:	0c 00 00 
 798:	c7 05 4c 0c 00 00 4c 	movl   $0xc4c,0xc4c
 79f:	0c 00 00 
    base.s.size = 0;
 7a2:	c7 05 50 0c 00 00 00 	movl   $0x0,0xc50
 7a9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7ac:	b9 4c 0c 00 00       	mov    $0xc4c,%ecx
 7b1:	eb d7                	jmp    78a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7b3:	74 19                	je     7ce <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7b5:	29 da                	sub    %ebx,%edx
 7b7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7ba:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7bd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7c0:	89 0d 48 0c 00 00    	mov    %ecx,0xc48
      return (void*)(p + 1);
 7c6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7cc:	c9                   	leave  
 7cd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7ce:	8b 10                	mov    (%eax),%edx
 7d0:	89 11                	mov    %edx,(%ecx)
 7d2:	eb ec                	jmp    7c0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d4:	89 c1                	mov    %eax,%ecx
 7d6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7d8:	8b 50 04             	mov    0x4(%eax),%edx
 7db:	39 da                	cmp    %ebx,%edx
 7dd:	73 d4                	jae    7b3 <malloc+0x46>
    if(p == freep)
 7df:	39 05 48 0c 00 00    	cmp    %eax,0xc48
 7e5:	75 ed                	jne    7d4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7e7:	89 d8                	mov    %ebx,%eax
 7e9:	e8 2f ff ff ff       	call   71d <morecore>
 7ee:	85 c0                	test   %eax,%eax
 7f0:	75 e2                	jne    7d4 <malloc+0x67>
 7f2:	eb d5                	jmp    7c9 <malloc+0x5c>
