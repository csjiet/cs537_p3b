
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   7:	8b 55 08             	mov    0x8(%ebp),%edx
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   int tmp1 = *(int*)arg1;
   d:	8b 0a                	mov    (%edx),%ecx
   int tmp2 = *(int*)arg2;
   f:	8b 18                	mov    (%eax),%ebx
   *(int*)arg1 = 44;
  11:	c7 02 2c 00 00 00    	movl   $0x2c,(%edx)
   *(int*)arg2 = 55;
  17:	c7 00 37 00 00 00    	movl   $0x37,(%eax)
   assert(global == 1);
  1d:	a1 30 0d 00 00       	mov    0xd30,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 d8 08 00 00       	push   $0x8d8
  2e:	68 e1 08 00 00       	push   $0x8e1
  33:	6a 01                	push   $0x1
  35:	e8 f0 05 00 00       	call   62a <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 e9 08 00 00       	push   $0x8e9
  42:	68 f5 08 00 00       	push   $0x8f5
  47:	6a 01                	push   $0x1
  49:	e8 dc 05 00 00       	call   62a <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 09 09 00 00       	push   $0x909
  56:	6a 01                	push   $0x1
  58:	e8 cd 05 00 00       	call   62a <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 3c 0d 00 00    	push   0xd3c
  66:	e8 9a 04 00 00       	call   505 <kill>
  6b:	e8 65 04 00 00       	call   4d5 <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d 30 0d 00 00    	mov    %ecx,0xd30
   exit();
  78:	e8 58 04 00 00       	call   4d5 <exit>

0000007d <main>:
{
  7d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  81:	83 e4 f0             	and    $0xfffffff0,%esp
  84:	ff 71 fc             	push   -0x4(%ecx)
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  8a:	56                   	push   %esi
  8b:	53                   	push   %ebx
  8c:	51                   	push   %ecx
  8d:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  90:	e8 c0 04 00 00       	call   555 <getpid>
  95:	a3 3c 0d 00 00       	mov    %eax,0xd3c
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 a9 07 00 00       	call   850 <malloc>
   assert(p != NULL);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	0f 84 a6 00 00 00    	je     158 <main+0xdb>
  b2:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b4:	89 c2                	mov    %eax,%edx
  b6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  bc:	74 09                	je     c7 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  be:	b8 00 10 00 00       	mov    $0x1000,%eax
  c3:	29 d0                	sub    %edx,%eax
  c5:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, (void*)&arg1, (void*)&arg2, stack);
  c7:	50                   	push   %eax
  c8:	68 34 0d 00 00       	push   $0xd34
  cd:	68 38 0d 00 00       	push   $0xd38
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 99 04 00 00       	call   575 <clone>
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
  e9:	a1 30 0d 00 00       	mov    0xd30,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 38 0d 00 00       	mov    0xd38,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 34 0d 00 00       	mov    0xd34,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 d8 08 00 00       	push   $0x8d8
 116:	68 e1 08 00 00       	push   $0x8e1
 11b:	6a 01                	push   $0x1
 11d:	e8 08 05 00 00       	call   62a <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 39 09 00 00       	push   $0x939
 12a:	68 f5 08 00 00       	push   $0x8f5
 12f:	6a 01                	push   $0x1
 131:	e8 f4 04 00 00       	call   62a <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 09 09 00 00       	push   $0x909
 13e:	6a 01                	push   $0x1
 140:	e8 e5 04 00 00       	call   62a <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 3c 0d 00 00    	push   0xd3c
 14e:	e8 b2 03 00 00       	call   505 <kill>
 153:	e8 7d 03 00 00       	call   4d5 <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 d8 08 00 00       	push   $0x8d8
 15f:	68 e1 08 00 00       	push   $0x8e1
 164:	6a 01                	push   $0x1
 166:	e8 bf 04 00 00       	call   62a <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 16 09 00 00       	push   $0x916
 173:	68 f5 08 00 00       	push   $0x8f5
 178:	6a 01                	push   $0x1
 17a:	e8 ab 04 00 00       	call   62a <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 09 09 00 00       	push   $0x909
 187:	6a 01                	push   $0x1
 189:	e8 9c 04 00 00       	call   62a <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 3c 0d 00 00    	push   0xd3c
 197:	e8 69 03 00 00       	call   505 <kill>
 19c:	e8 34 03 00 00       	call   4d5 <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 d8 08 00 00       	push   $0x8d8
 1a8:	68 e1 08 00 00       	push   $0x8e1
 1ad:	6a 01                	push   $0x1
 1af:	e8 76 04 00 00       	call   62a <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 20 09 00 00       	push   $0x920
 1bc:	68 f5 08 00 00       	push   $0x8f5
 1c1:	6a 01                	push   $0x1
 1c3:	e8 62 04 00 00       	call   62a <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 09 09 00 00       	push   $0x909
 1d0:	6a 01                	push   $0x1
 1d2:	e8 53 04 00 00       	call   62a <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 3c 0d 00 00    	push   0xd3c
 1e0:	e8 20 03 00 00       	call   505 <kill>
 1e5:	e8 eb 02 00 00       	call   4d5 <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 d8 08 00 00       	push   $0x8d8
 1f1:	68 e1 08 00 00       	push   $0x8e1
 1f6:	6a 01                	push   $0x1
 1f8:	e8 2d 04 00 00       	call   62a <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 2e 09 00 00       	push   $0x92e
 205:	68 f5 08 00 00       	push   $0x8f5
 20a:	6a 01                	push   $0x1
 20c:	e8 19 04 00 00       	call   62a <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 09 09 00 00       	push   $0x909
 219:	6a 01                	push   $0x1
 21b:	e8 0a 04 00 00       	call   62a <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 3c 0d 00 00    	push   0xd3c
 229:	e8 d7 02 00 00       	call   505 <kill>
 22e:	e8 a2 02 00 00       	call   4d5 <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 44 09 00 00       	push   $0x944
 23b:	6a 01                	push   $0x1
 23d:	e8 e8 03 00 00       	call   62a <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 30 03 00 00       	call   57d <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 d8 08 00 00       	push   $0x8d8
 25b:	68 e1 08 00 00       	push   $0x8e1
 260:	6a 01                	push   $0x1
 262:	e8 c3 03 00 00       	call   62a <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 51 09 00 00       	push   $0x951
 26f:	68 f5 08 00 00       	push   $0x8f5
 274:	6a 01                	push   $0x1
 276:	e8 af 03 00 00       	call   62a <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 09 09 00 00       	push   $0x909
 283:	6a 01                	push   $0x1
 285:	e8 a0 03 00 00       	call   62a <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 3c 0d 00 00    	push   0xd3c
 293:	e8 6d 02 00 00       	call   505 <kill>
 298:	e8 38 02 00 00       	call   4d5 <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 ea 04 00 00       	call   790 <free>
   exit();
 2a6:	e8 2a 02 00 00       	call   4d5 <exit>

000002ab <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	56                   	push   %esi
 2af:	53                   	push   %ebx
 2b0:	8b 75 08             	mov    0x8(%ebp),%esi
 2b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b6:	89 f0                	mov    %esi,%eax
 2b8:	89 d1                	mov    %edx,%ecx
 2ba:	83 c2 01             	add    $0x1,%edx
 2bd:	89 c3                	mov    %eax,%ebx
 2bf:	83 c0 01             	add    $0x1,%eax
 2c2:	0f b6 09             	movzbl (%ecx),%ecx
 2c5:	88 0b                	mov    %cl,(%ebx)
 2c7:	84 c9                	test   %cl,%cl
 2c9:	75 ed                	jne    2b8 <strcpy+0xd>
    ;
  return os;
}
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    

000002d1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2da:	eb 06                	jmp    2e2 <strcmp+0x11>
    p++, q++;
 2dc:	83 c1 01             	add    $0x1,%ecx
 2df:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2e2:	0f b6 01             	movzbl (%ecx),%eax
 2e5:	84 c0                	test   %al,%al
 2e7:	74 04                	je     2ed <strcmp+0x1c>
 2e9:	3a 02                	cmp    (%edx),%al
 2eb:	74 ef                	je     2dc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2ed:	0f b6 c0             	movzbl %al,%eax
 2f0:	0f b6 12             	movzbl (%edx),%edx
 2f3:	29 d0                	sub    %edx,%eax
}
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    

000002f7 <strlen>:

uint
strlen(const char *s)
{
 2f7:	55                   	push   %ebp
 2f8:	89 e5                	mov    %esp,%ebp
 2fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2fd:	b8 00 00 00 00       	mov    $0x0,%eax
 302:	eb 03                	jmp    307 <strlen+0x10>
 304:	83 c0 01             	add    $0x1,%eax
 307:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 30b:	75 f7                	jne    304 <strlen+0xd>
    ;
  return n;
}
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    

0000030f <memset>:

void*
memset(void *dst, int c, uint n)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	57                   	push   %edi
 313:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 316:	89 d7                	mov    %edx,%edi
 318:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31b:	8b 45 0c             	mov    0xc(%ebp),%eax
 31e:	fc                   	cld    
 31f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 321:	89 d0                	mov    %edx,%eax
 323:	8b 7d fc             	mov    -0x4(%ebp),%edi
 326:	c9                   	leave  
 327:	c3                   	ret    

00000328 <strchr>:

char*
strchr(const char *s, char c)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 332:	eb 03                	jmp    337 <strchr+0xf>
 334:	83 c0 01             	add    $0x1,%eax
 337:	0f b6 10             	movzbl (%eax),%edx
 33a:	84 d2                	test   %dl,%dl
 33c:	74 06                	je     344 <strchr+0x1c>
    if(*s == c)
 33e:	38 ca                	cmp    %cl,%dl
 340:	75 f2                	jne    334 <strchr+0xc>
 342:	eb 05                	jmp    349 <strchr+0x21>
      return (char*)s;
  return 0;
 344:	b8 00 00 00 00       	mov    $0x0,%eax
}
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    

0000034b <gets>:

char*
gets(char *buf, int max)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	57                   	push   %edi
 34f:	56                   	push   %esi
 350:	53                   	push   %ebx
 351:	83 ec 1c             	sub    $0x1c,%esp
 354:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 357:	bb 00 00 00 00       	mov    $0x0,%ebx
 35c:	89 de                	mov    %ebx,%esi
 35e:	83 c3 01             	add    $0x1,%ebx
 361:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 364:	7d 2e                	jge    394 <gets+0x49>
    cc = read(0, &c, 1);
 366:	83 ec 04             	sub    $0x4,%esp
 369:	6a 01                	push   $0x1
 36b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 36e:	50                   	push   %eax
 36f:	6a 00                	push   $0x0
 371:	e8 77 01 00 00       	call   4ed <read>
    if(cc < 1)
 376:	83 c4 10             	add    $0x10,%esp
 379:	85 c0                	test   %eax,%eax
 37b:	7e 17                	jle    394 <gets+0x49>
      break;
    buf[i++] = c;
 37d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 381:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 384:	3c 0a                	cmp    $0xa,%al
 386:	0f 94 c2             	sete   %dl
 389:	3c 0d                	cmp    $0xd,%al
 38b:	0f 94 c0             	sete   %al
 38e:	08 c2                	or     %al,%dl
 390:	74 ca                	je     35c <gets+0x11>
    buf[i++] = c;
 392:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 394:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 398:	89 f8                	mov    %edi,%eax
 39a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39d:	5b                   	pop    %ebx
 39e:	5e                   	pop    %esi
 39f:	5f                   	pop    %edi
 3a0:	5d                   	pop    %ebp
 3a1:	c3                   	ret    

000003a2 <stat>:

int
stat(const char *n, struct stat *st)
{
 3a2:	55                   	push   %ebp
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	56                   	push   %esi
 3a6:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a7:	83 ec 08             	sub    $0x8,%esp
 3aa:	6a 00                	push   $0x0
 3ac:	ff 75 08             	push   0x8(%ebp)
 3af:	e8 61 01 00 00       	call   515 <open>
  if(fd < 0)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	78 24                	js     3df <stat+0x3d>
 3bb:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3bd:	83 ec 08             	sub    $0x8,%esp
 3c0:	ff 75 0c             	push   0xc(%ebp)
 3c3:	50                   	push   %eax
 3c4:	e8 64 01 00 00       	call   52d <fstat>
 3c9:	89 c6                	mov    %eax,%esi
  close(fd);
 3cb:	89 1c 24             	mov    %ebx,(%esp)
 3ce:	e8 2a 01 00 00       	call   4fd <close>
  return r;
 3d3:	83 c4 10             	add    $0x10,%esp
}
 3d6:	89 f0                	mov    %esi,%eax
 3d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    
    return -1;
 3df:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3e4:	eb f0                	jmp    3d6 <stat+0x34>

000003e6 <atoi>:

int
atoi(const char *s)
{
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
 3e9:	53                   	push   %ebx
 3ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3ed:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3f2:	eb 10                	jmp    404 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3f4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3f7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3fa:	83 c1 01             	add    $0x1,%ecx
 3fd:	0f be c0             	movsbl %al,%eax
 400:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 404:	0f b6 01             	movzbl (%ecx),%eax
 407:	8d 58 d0             	lea    -0x30(%eax),%ebx
 40a:	80 fb 09             	cmp    $0x9,%bl
 40d:	76 e5                	jbe    3f4 <atoi+0xe>
  return n;
}
 40f:	89 d0                	mov    %edx,%eax
 411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	56                   	push   %esi
 41a:	53                   	push   %ebx
 41b:	8b 75 08             	mov    0x8(%ebp),%esi
 41e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 421:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 424:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 426:	eb 0d                	jmp    435 <memmove+0x1f>
    *dst++ = *src++;
 428:	0f b6 01             	movzbl (%ecx),%eax
 42b:	88 02                	mov    %al,(%edx)
 42d:	8d 49 01             	lea    0x1(%ecx),%ecx
 430:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 58 ff             	lea    -0x1(%eax),%ebx
 438:	85 c0                	test   %eax,%eax
 43a:	7f ec                	jg     428 <memmove+0x12>
  return vdst;
}
 43c:	89 f0                	mov    %esi,%eax
 43e:	5b                   	pop    %ebx
 43f:	5e                   	pop    %esi
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    

00000442 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 442:	55                   	push   %ebp
 443:	89 e5                	mov    %esp,%ebp
 445:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 448:	68 00 20 00 00       	push   $0x2000
 44d:	e8 fe 03 00 00       	call   850 <malloc>
  if ((uint)stack%PGSIZE){
 452:	83 c4 10             	add    $0x10,%esp
 455:	a9 ff 0f 00 00       	test   $0xfff,%eax
 45a:	74 0a                	je     466 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 45c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 461:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 466:	50                   	push   %eax
 467:	ff 75 10             	push   0x10(%ebp)
 46a:	ff 75 0c             	push   0xc(%ebp)
 46d:	ff 75 08             	push   0x8(%ebp)
 470:	e8 00 01 00 00       	call   575 <clone>
}
 475:	c9                   	leave  
 476:	c3                   	ret    

00000477 <thread_join>:

int thread_join(){
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	53                   	push   %ebx
 47b:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 47e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 481:	50                   	push   %eax
 482:	e8 f6 00 00 00       	call   57d <join>
 487:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 489:	83 c4 04             	add    $0x4,%esp
 48c:	ff 75 f4             	push   -0xc(%ebp)
 48f:	e8 fc 02 00 00       	call   790 <free>
  return x;
}
 494:	89 d8                	mov    %ebx,%eax
 496:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 499:	c9                   	leave  
 49a:	c3                   	ret    

0000049b <lock_init>:

void lock_init(lock_t *spin){
 49b:	55                   	push   %ebp
 49c:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 49e:	8b 45 08             	mov    0x8(%ebp),%eax
 4a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4a7:	5d                   	pop    %ebp
 4a8:	c3                   	ret    

000004a9 <lock_acquire>:

void lock_acquire(lock_t *spin){
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4af:	b8 01 00 00 00       	mov    $0x1,%eax
 4b4:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4b7:	85 c0                	test   %eax,%eax
 4b9:	75 f4                	jne    4af <lock_acquire+0x6>

}
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    

000004bd <lock_release>:

void lock_release(lock_t *spin){
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	8b 55 08             	mov    0x8(%ebp),%edx
 4c3:	b8 00 00 00 00       	mov    $0x0,%eax
 4c8:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    

000004cd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4cd:	b8 01 00 00 00       	mov    $0x1,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <exit>:
SYSCALL(exit)
 4d5:	b8 02 00 00 00       	mov    $0x2,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <wait>:
SYSCALL(wait)
 4dd:	b8 03 00 00 00       	mov    $0x3,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <pipe>:
SYSCALL(pipe)
 4e5:	b8 04 00 00 00       	mov    $0x4,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <read>:
SYSCALL(read)
 4ed:	b8 05 00 00 00       	mov    $0x5,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <write>:
SYSCALL(write)
 4f5:	b8 10 00 00 00       	mov    $0x10,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <close>:
SYSCALL(close)
 4fd:	b8 15 00 00 00       	mov    $0x15,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <kill>:
SYSCALL(kill)
 505:	b8 06 00 00 00       	mov    $0x6,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <exec>:
SYSCALL(exec)
 50d:	b8 07 00 00 00       	mov    $0x7,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <open>:
SYSCALL(open)
 515:	b8 0f 00 00 00       	mov    $0xf,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <mknod>:
SYSCALL(mknod)
 51d:	b8 11 00 00 00       	mov    $0x11,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <unlink>:
SYSCALL(unlink)
 525:	b8 12 00 00 00       	mov    $0x12,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <fstat>:
SYSCALL(fstat)
 52d:	b8 08 00 00 00       	mov    $0x8,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <link>:
SYSCALL(link)
 535:	b8 13 00 00 00       	mov    $0x13,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <mkdir>:
SYSCALL(mkdir)
 53d:	b8 14 00 00 00       	mov    $0x14,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <chdir>:
SYSCALL(chdir)
 545:	b8 09 00 00 00       	mov    $0x9,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <dup>:
SYSCALL(dup)
 54d:	b8 0a 00 00 00       	mov    $0xa,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <getpid>:
SYSCALL(getpid)
 555:	b8 0b 00 00 00       	mov    $0xb,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <sbrk>:
SYSCALL(sbrk)
 55d:	b8 0c 00 00 00       	mov    $0xc,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <sleep>:
SYSCALL(sleep)
 565:	b8 0d 00 00 00       	mov    $0xd,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <uptime>:
SYSCALL(uptime)
 56d:	b8 0e 00 00 00       	mov    $0xe,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <clone>:
SYSCALL(clone)
 575:	b8 16 00 00 00       	mov    $0x16,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <join>:
 57d:	b8 17 00 00 00       	mov    $0x17,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 585:	55                   	push   %ebp
 586:	89 e5                	mov    %esp,%ebp
 588:	83 ec 1c             	sub    $0x1c,%esp
 58b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 58e:	6a 01                	push   $0x1
 590:	8d 55 f4             	lea    -0xc(%ebp),%edx
 593:	52                   	push   %edx
 594:	50                   	push   %eax
 595:	e8 5b ff ff ff       	call   4f5 <write>
}
 59a:	83 c4 10             	add    $0x10,%esp
 59d:	c9                   	leave  
 59e:	c3                   	ret    

0000059f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 59f:	55                   	push   %ebp
 5a0:	89 e5                	mov    %esp,%ebp
 5a2:	57                   	push   %edi
 5a3:	56                   	push   %esi
 5a4:	53                   	push   %ebx
 5a5:	83 ec 2c             	sub    $0x2c,%esp
 5a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5ab:	89 d0                	mov    %edx,%eax
 5ad:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5af:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5b3:	0f 95 c1             	setne  %cl
 5b6:	c1 ea 1f             	shr    $0x1f,%edx
 5b9:	84 d1                	test   %dl,%cl
 5bb:	74 44                	je     601 <printint+0x62>
    neg = 1;
    x = -xx;
 5bd:	f7 d8                	neg    %eax
 5bf:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5c1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5c8:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5cd:	89 c8                	mov    %ecx,%eax
 5cf:	ba 00 00 00 00       	mov    $0x0,%edx
 5d4:	f7 f6                	div    %esi
 5d6:	89 df                	mov    %ebx,%edi
 5d8:	83 c3 01             	add    $0x1,%ebx
 5db:	0f b6 92 c8 09 00 00 	movzbl 0x9c8(%edx),%edx
 5e2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5e6:	89 ca                	mov    %ecx,%edx
 5e8:	89 c1                	mov    %eax,%ecx
 5ea:	39 d6                	cmp    %edx,%esi
 5ec:	76 df                	jbe    5cd <printint+0x2e>
  if(neg)
 5ee:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5f2:	74 31                	je     625 <printint+0x86>
    buf[i++] = '-';
 5f4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5f9:	8d 5f 02             	lea    0x2(%edi),%ebx
 5fc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ff:	eb 17                	jmp    618 <printint+0x79>
    x = xx;
 601:	89 c1                	mov    %eax,%ecx
  neg = 0;
 603:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 60a:	eb bc                	jmp    5c8 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 60c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 611:	89 f0                	mov    %esi,%eax
 613:	e8 6d ff ff ff       	call   585 <putc>
  while(--i >= 0)
 618:	83 eb 01             	sub    $0x1,%ebx
 61b:	79 ef                	jns    60c <printint+0x6d>
}
 61d:	83 c4 2c             	add    $0x2c,%esp
 620:	5b                   	pop    %ebx
 621:	5e                   	pop    %esi
 622:	5f                   	pop    %edi
 623:	5d                   	pop    %ebp
 624:	c3                   	ret    
 625:	8b 75 d0             	mov    -0x30(%ebp),%esi
 628:	eb ee                	jmp    618 <printint+0x79>

0000062a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	57                   	push   %edi
 62e:	56                   	push   %esi
 62f:	53                   	push   %ebx
 630:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 633:	8d 45 10             	lea    0x10(%ebp),%eax
 636:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 639:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 63e:	bb 00 00 00 00       	mov    $0x0,%ebx
 643:	eb 14                	jmp    659 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 645:	89 fa                	mov    %edi,%edx
 647:	8b 45 08             	mov    0x8(%ebp),%eax
 64a:	e8 36 ff ff ff       	call   585 <putc>
 64f:	eb 05                	jmp    656 <printf+0x2c>
      }
    } else if(state == '%'){
 651:	83 fe 25             	cmp    $0x25,%esi
 654:	74 25                	je     67b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 656:	83 c3 01             	add    $0x1,%ebx
 659:	8b 45 0c             	mov    0xc(%ebp),%eax
 65c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 660:	84 c0                	test   %al,%al
 662:	0f 84 20 01 00 00    	je     788 <printf+0x15e>
    c = fmt[i] & 0xff;
 668:	0f be f8             	movsbl %al,%edi
 66b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 66e:	85 f6                	test   %esi,%esi
 670:	75 df                	jne    651 <printf+0x27>
      if(c == '%'){
 672:	83 f8 25             	cmp    $0x25,%eax
 675:	75 ce                	jne    645 <printf+0x1b>
        state = '%';
 677:	89 c6                	mov    %eax,%esi
 679:	eb db                	jmp    656 <printf+0x2c>
      if(c == 'd'){
 67b:	83 f8 25             	cmp    $0x25,%eax
 67e:	0f 84 cf 00 00 00    	je     753 <printf+0x129>
 684:	0f 8c dd 00 00 00    	jl     767 <printf+0x13d>
 68a:	83 f8 78             	cmp    $0x78,%eax
 68d:	0f 8f d4 00 00 00    	jg     767 <printf+0x13d>
 693:	83 f8 63             	cmp    $0x63,%eax
 696:	0f 8c cb 00 00 00    	jl     767 <printf+0x13d>
 69c:	83 e8 63             	sub    $0x63,%eax
 69f:	83 f8 15             	cmp    $0x15,%eax
 6a2:	0f 87 bf 00 00 00    	ja     767 <printf+0x13d>
 6a8:	ff 24 85 70 09 00 00 	jmp    *0x970(,%eax,4)
        printint(fd, *ap, 10, 1);
 6af:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b2:	8b 17                	mov    (%edi),%edx
 6b4:	83 ec 0c             	sub    $0xc,%esp
 6b7:	6a 01                	push   $0x1
 6b9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6be:	8b 45 08             	mov    0x8(%ebp),%eax
 6c1:	e8 d9 fe ff ff       	call   59f <printint>
        ap++;
 6c6:	83 c7 04             	add    $0x4,%edi
 6c9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6cc:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6cf:	be 00 00 00 00       	mov    $0x0,%esi
 6d4:	eb 80                	jmp    656 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6d6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d9:	8b 17                	mov    (%edi),%edx
 6db:	83 ec 0c             	sub    $0xc,%esp
 6de:	6a 00                	push   $0x0
 6e0:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e5:	8b 45 08             	mov    0x8(%ebp),%eax
 6e8:	e8 b2 fe ff ff       	call   59f <printint>
        ap++;
 6ed:	83 c7 04             	add    $0x4,%edi
 6f0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f6:	be 00 00 00 00       	mov    $0x0,%esi
 6fb:	e9 56 ff ff ff       	jmp    656 <printf+0x2c>
        s = (char*)*ap;
 700:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 703:	8b 30                	mov    (%eax),%esi
        ap++;
 705:	83 c0 04             	add    $0x4,%eax
 708:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 70b:	85 f6                	test   %esi,%esi
 70d:	75 15                	jne    724 <printf+0xfa>
          s = "(null)";
 70f:	be 67 09 00 00       	mov    $0x967,%esi
 714:	eb 0e                	jmp    724 <printf+0xfa>
          putc(fd, *s);
 716:	0f be d2             	movsbl %dl,%edx
 719:	8b 45 08             	mov    0x8(%ebp),%eax
 71c:	e8 64 fe ff ff       	call   585 <putc>
          s++;
 721:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 724:	0f b6 16             	movzbl (%esi),%edx
 727:	84 d2                	test   %dl,%dl
 729:	75 eb                	jne    716 <printf+0xec>
      state = 0;
 72b:	be 00 00 00 00       	mov    $0x0,%esi
 730:	e9 21 ff ff ff       	jmp    656 <printf+0x2c>
        putc(fd, *ap);
 735:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 738:	0f be 17             	movsbl (%edi),%edx
 73b:	8b 45 08             	mov    0x8(%ebp),%eax
 73e:	e8 42 fe ff ff       	call   585 <putc>
        ap++;
 743:	83 c7 04             	add    $0x4,%edi
 746:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 749:	be 00 00 00 00       	mov    $0x0,%esi
 74e:	e9 03 ff ff ff       	jmp    656 <printf+0x2c>
        putc(fd, c);
 753:	89 fa                	mov    %edi,%edx
 755:	8b 45 08             	mov    0x8(%ebp),%eax
 758:	e8 28 fe ff ff       	call   585 <putc>
      state = 0;
 75d:	be 00 00 00 00       	mov    $0x0,%esi
 762:	e9 ef fe ff ff       	jmp    656 <printf+0x2c>
        putc(fd, '%');
 767:	ba 25 00 00 00       	mov    $0x25,%edx
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	e8 11 fe ff ff       	call   585 <putc>
        putc(fd, c);
 774:	89 fa                	mov    %edi,%edx
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	e8 07 fe ff ff       	call   585 <putc>
      state = 0;
 77e:	be 00 00 00 00       	mov    $0x0,%esi
 783:	e9 ce fe ff ff       	jmp    656 <printf+0x2c>
    }
  }
}
 788:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78b:	5b                   	pop    %ebx
 78c:	5e                   	pop    %esi
 78d:	5f                   	pop    %edi
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret    

00000790 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 799:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79c:	a1 40 0d 00 00       	mov    0xd40,%eax
 7a1:	eb 02                	jmp    7a5 <free+0x15>
 7a3:	89 d0                	mov    %edx,%eax
 7a5:	39 c8                	cmp    %ecx,%eax
 7a7:	73 04                	jae    7ad <free+0x1d>
 7a9:	39 08                	cmp    %ecx,(%eax)
 7ab:	77 12                	ja     7bf <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ad:	8b 10                	mov    (%eax),%edx
 7af:	39 c2                	cmp    %eax,%edx
 7b1:	77 f0                	ja     7a3 <free+0x13>
 7b3:	39 c8                	cmp    %ecx,%eax
 7b5:	72 08                	jb     7bf <free+0x2f>
 7b7:	39 ca                	cmp    %ecx,%edx
 7b9:	77 04                	ja     7bf <free+0x2f>
 7bb:	89 d0                	mov    %edx,%eax
 7bd:	eb e6                	jmp    7a5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7bf:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7c2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7c5:	8b 10                	mov    (%eax),%edx
 7c7:	39 d7                	cmp    %edx,%edi
 7c9:	74 19                	je     7e4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7cb:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ce:	8b 50 04             	mov    0x4(%eax),%edx
 7d1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d4:	39 ce                	cmp    %ecx,%esi
 7d6:	74 1b                	je     7f3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7d8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7da:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 7df:	5b                   	pop    %ebx
 7e0:	5e                   	pop    %esi
 7e1:	5f                   	pop    %edi
 7e2:	5d                   	pop    %ebp
 7e3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7e4:	03 72 04             	add    0x4(%edx),%esi
 7e7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ea:	8b 10                	mov    (%eax),%edx
 7ec:	8b 12                	mov    (%edx),%edx
 7ee:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7f1:	eb db                	jmp    7ce <free+0x3e>
    p->s.size += bp->s.size;
 7f3:	03 53 fc             	add    -0x4(%ebx),%edx
 7f6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7fc:	89 10                	mov    %edx,(%eax)
 7fe:	eb da                	jmp    7da <free+0x4a>

00000800 <morecore>:

static Header*
morecore(uint nu)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	53                   	push   %ebx
 804:	83 ec 04             	sub    $0x4,%esp
 807:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 809:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 80e:	77 05                	ja     815 <morecore+0x15>
    nu = 4096;
 810:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 815:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 81c:	83 ec 0c             	sub    $0xc,%esp
 81f:	50                   	push   %eax
 820:	e8 38 fd ff ff       	call   55d <sbrk>
  if(p == (char*)-1)
 825:	83 c4 10             	add    $0x10,%esp
 828:	83 f8 ff             	cmp    $0xffffffff,%eax
 82b:	74 1c                	je     849 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 82d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 830:	83 c0 08             	add    $0x8,%eax
 833:	83 ec 0c             	sub    $0xc,%esp
 836:	50                   	push   %eax
 837:	e8 54 ff ff ff       	call   790 <free>
  return freep;
 83c:	a1 40 0d 00 00       	mov    0xd40,%eax
 841:	83 c4 10             	add    $0x10,%esp
}
 844:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 847:	c9                   	leave  
 848:	c3                   	ret    
    return 0;
 849:	b8 00 00 00 00       	mov    $0x0,%eax
 84e:	eb f4                	jmp    844 <morecore+0x44>

00000850 <malloc>:

void*
malloc(uint nbytes)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	53                   	push   %ebx
 854:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 857:	8b 45 08             	mov    0x8(%ebp),%eax
 85a:	8d 58 07             	lea    0x7(%eax),%ebx
 85d:	c1 eb 03             	shr    $0x3,%ebx
 860:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 863:	8b 0d 40 0d 00 00    	mov    0xd40,%ecx
 869:	85 c9                	test   %ecx,%ecx
 86b:	74 04                	je     871 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86d:	8b 01                	mov    (%ecx),%eax
 86f:	eb 4a                	jmp    8bb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 871:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 878:	0d 00 00 
 87b:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 882:	0d 00 00 
    base.s.size = 0;
 885:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 88c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 88f:	b9 44 0d 00 00       	mov    $0xd44,%ecx
 894:	eb d7                	jmp    86d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 896:	74 19                	je     8b1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 898:	29 da                	sub    %ebx,%edx
 89a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 89d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8a0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8a3:	89 0d 40 0d 00 00    	mov    %ecx,0xd40
      return (void*)(p + 1);
 8a9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8af:	c9                   	leave  
 8b0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8b1:	8b 10                	mov    (%eax),%edx
 8b3:	89 11                	mov    %edx,(%ecx)
 8b5:	eb ec                	jmp    8a3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b7:	89 c1                	mov    %eax,%ecx
 8b9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8bb:	8b 50 04             	mov    0x4(%eax),%edx
 8be:	39 da                	cmp    %ebx,%edx
 8c0:	73 d4                	jae    896 <malloc+0x46>
    if(p == freep)
 8c2:	39 05 40 0d 00 00    	cmp    %eax,0xd40
 8c8:	75 ed                	jne    8b7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8ca:	89 d8                	mov    %ebx,%eax
 8cc:	e8 2f ff ff ff       	call   800 <morecore>
 8d1:	85 c0                	test   %eax,%eax
 8d3:	75 e2                	jne    8b7 <malloc+0x67>
 8d5:	eb d5                	jmp    8ac <malloc+0x5c>
