
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
  29:	68 d4 08 00 00       	push   $0x8d4
  2e:	68 dd 08 00 00       	push   $0x8dd
  33:	6a 01                	push   $0x1
  35:	e8 ed 05 00 00       	call   627 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 e5 08 00 00       	push   $0x8e5
  42:	68 f1 08 00 00       	push   $0x8f1
  47:	6a 01                	push   $0x1
  49:	e8 d9 05 00 00       	call   627 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 05 09 00 00       	push   $0x905
  56:	6a 01                	push   $0x1
  58:	e8 ca 05 00 00       	call   627 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 3c 0d 00 00    	push   0xd3c
  66:	e8 97 04 00 00       	call   502 <kill>
  6b:	e8 62 04 00 00       	call   4d2 <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d 30 0d 00 00    	mov    %ecx,0xd30
   exit();
  78:	e8 55 04 00 00       	call   4d2 <exit>

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
  90:	e8 bd 04 00 00       	call   552 <getpid>
  95:	a3 3c 0d 00 00       	mov    %eax,0xd3c
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 a6 07 00 00       	call   84d <malloc>
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
  d7:	e8 96 04 00 00       	call   572 <clone>
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
 111:	68 d4 08 00 00       	push   $0x8d4
 116:	68 dd 08 00 00       	push   $0x8dd
 11b:	6a 01                	push   $0x1
 11d:	e8 05 05 00 00       	call   627 <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 35 09 00 00       	push   $0x935
 12a:	68 f1 08 00 00       	push   $0x8f1
 12f:	6a 01                	push   $0x1
 131:	e8 f1 04 00 00       	call   627 <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 05 09 00 00       	push   $0x905
 13e:	6a 01                	push   $0x1
 140:	e8 e2 04 00 00       	call   627 <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 3c 0d 00 00    	push   0xd3c
 14e:	e8 af 03 00 00       	call   502 <kill>
 153:	e8 7a 03 00 00       	call   4d2 <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 d4 08 00 00       	push   $0x8d4
 15f:	68 dd 08 00 00       	push   $0x8dd
 164:	6a 01                	push   $0x1
 166:	e8 bc 04 00 00       	call   627 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 12 09 00 00       	push   $0x912
 173:	68 f1 08 00 00       	push   $0x8f1
 178:	6a 01                	push   $0x1
 17a:	e8 a8 04 00 00       	call   627 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 05 09 00 00       	push   $0x905
 187:	6a 01                	push   $0x1
 189:	e8 99 04 00 00       	call   627 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 3c 0d 00 00    	push   0xd3c
 197:	e8 66 03 00 00       	call   502 <kill>
 19c:	e8 31 03 00 00       	call   4d2 <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 d4 08 00 00       	push   $0x8d4
 1a8:	68 dd 08 00 00       	push   $0x8dd
 1ad:	6a 01                	push   $0x1
 1af:	e8 73 04 00 00       	call   627 <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 1c 09 00 00       	push   $0x91c
 1bc:	68 f1 08 00 00       	push   $0x8f1
 1c1:	6a 01                	push   $0x1
 1c3:	e8 5f 04 00 00       	call   627 <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 05 09 00 00       	push   $0x905
 1d0:	6a 01                	push   $0x1
 1d2:	e8 50 04 00 00       	call   627 <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 3c 0d 00 00    	push   0xd3c
 1e0:	e8 1d 03 00 00       	call   502 <kill>
 1e5:	e8 e8 02 00 00       	call   4d2 <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 d4 08 00 00       	push   $0x8d4
 1f1:	68 dd 08 00 00       	push   $0x8dd
 1f6:	6a 01                	push   $0x1
 1f8:	e8 2a 04 00 00       	call   627 <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 2a 09 00 00       	push   $0x92a
 205:	68 f1 08 00 00       	push   $0x8f1
 20a:	6a 01                	push   $0x1
 20c:	e8 16 04 00 00       	call   627 <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 05 09 00 00       	push   $0x905
 219:	6a 01                	push   $0x1
 21b:	e8 07 04 00 00       	call   627 <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 3c 0d 00 00    	push   0xd3c
 229:	e8 d4 02 00 00       	call   502 <kill>
 22e:	e8 9f 02 00 00       	call   4d2 <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 40 09 00 00       	push   $0x940
 23b:	6a 01                	push   $0x1
 23d:	e8 e5 03 00 00       	call   627 <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 2d 03 00 00       	call   57a <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 d4 08 00 00       	push   $0x8d4
 25b:	68 dd 08 00 00       	push   $0x8dd
 260:	6a 01                	push   $0x1
 262:	e8 c0 03 00 00       	call   627 <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 4d 09 00 00       	push   $0x94d
 26f:	68 f1 08 00 00       	push   $0x8f1
 274:	6a 01                	push   $0x1
 276:	e8 ac 03 00 00       	call   627 <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 05 09 00 00       	push   $0x905
 283:	6a 01                	push   $0x1
 285:	e8 9d 03 00 00       	call   627 <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 3c 0d 00 00    	push   0xd3c
 293:	e8 6a 02 00 00       	call   502 <kill>
 298:	e8 35 02 00 00       	call   4d2 <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 e7 04 00 00       	call   78d <free>
   exit();
 2a6:	e8 27 02 00 00       	call   4d2 <exit>

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
 371:	e8 74 01 00 00       	call   4ea <read>
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
 3af:	e8 5e 01 00 00       	call   512 <open>
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
 3c4:	e8 61 01 00 00       	call   52a <fstat>
 3c9:	89 c6                	mov    %eax,%esi
  close(fd);
 3cb:	89 1c 24             	mov    %ebx,(%esp)
 3ce:	e8 27 01 00 00       	call   4fa <close>
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

  void* stack = malloc(PGSIZE);
 448:	68 00 10 00 00       	push   $0x1000
 44d:	e8 fb 03 00 00       	call   84d <malloc>

  return clone(start_routine, arg1, arg2, stack);
 452:	50                   	push   %eax
 453:	ff 75 10             	push   0x10(%ebp)
 456:	ff 75 0c             	push   0xc(%ebp)
 459:	ff 75 08             	push   0x8(%ebp)
 45c:	e8 11 01 00 00       	call   572 <clone>
}
 461:	c9                   	leave  
 462:	c3                   	ret    

00000463 <thread_join>:

int thread_join(){
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
 466:	53                   	push   %ebx
 467:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 46a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 46d:	50                   	push   %eax
 46e:	e8 07 01 00 00       	call   57a <join>
  if (x < 0) {
 473:	83 c4 10             	add    $0x10,%esp
 476:	85 c0                	test   %eax,%eax
 478:	78 17                	js     491 <thread_join+0x2e>
 47a:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 47c:	83 ec 0c             	sub    $0xc,%esp
 47f:	ff 75 f4             	push   -0xc(%ebp)
 482:	e8 06 03 00 00       	call   78d <free>
  return x;
 487:	83 c4 10             	add    $0x10,%esp
}
 48a:	89 d8                	mov    %ebx,%eax
 48c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 48f:	c9                   	leave  
 490:	c3                   	ret    
    return -1;
 491:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 496:	eb f2                	jmp    48a <thread_join+0x27>

00000498 <lock_init>:

void lock_init(lock_t *spin){
 498:	55                   	push   %ebp
 499:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4a4:	5d                   	pop    %ebp
 4a5:	c3                   	ret    

000004a6 <lock_acquire>:

void lock_acquire(lock_t *spin){
 4a6:	55                   	push   %ebp
 4a7:	89 e5                	mov    %esp,%ebp
 4a9:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4ac:	b8 01 00 00 00       	mov    $0x1,%eax
 4b1:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4b4:	85 c0                	test   %eax,%eax
 4b6:	75 f4                	jne    4ac <lock_acquire+0x6>

}
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <lock_release>:

void lock_release(lock_t *spin){
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	8b 55 08             	mov    0x8(%ebp),%edx
 4c0:	b8 00 00 00 00       	mov    $0x0,%eax
 4c5:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 4c8:	5d                   	pop    %ebp
 4c9:	c3                   	ret    

000004ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ca:	b8 01 00 00 00       	mov    $0x1,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <exit>:
SYSCALL(exit)
 4d2:	b8 02 00 00 00       	mov    $0x2,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <wait>:
SYSCALL(wait)
 4da:	b8 03 00 00 00       	mov    $0x3,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <pipe>:
SYSCALL(pipe)
 4e2:	b8 04 00 00 00       	mov    $0x4,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <read>:
SYSCALL(read)
 4ea:	b8 05 00 00 00       	mov    $0x5,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <write>:
SYSCALL(write)
 4f2:	b8 10 00 00 00       	mov    $0x10,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <close>:
SYSCALL(close)
 4fa:	b8 15 00 00 00       	mov    $0x15,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <kill>:
SYSCALL(kill)
 502:	b8 06 00 00 00       	mov    $0x6,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <exec>:
SYSCALL(exec)
 50a:	b8 07 00 00 00       	mov    $0x7,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <open>:
SYSCALL(open)
 512:	b8 0f 00 00 00       	mov    $0xf,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <mknod>:
SYSCALL(mknod)
 51a:	b8 11 00 00 00       	mov    $0x11,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <unlink>:
SYSCALL(unlink)
 522:	b8 12 00 00 00       	mov    $0x12,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <fstat>:
SYSCALL(fstat)
 52a:	b8 08 00 00 00       	mov    $0x8,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <link>:
SYSCALL(link)
 532:	b8 13 00 00 00       	mov    $0x13,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <mkdir>:
SYSCALL(mkdir)
 53a:	b8 14 00 00 00       	mov    $0x14,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <chdir>:
SYSCALL(chdir)
 542:	b8 09 00 00 00       	mov    $0x9,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <dup>:
SYSCALL(dup)
 54a:	b8 0a 00 00 00       	mov    $0xa,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <getpid>:
SYSCALL(getpid)
 552:	b8 0b 00 00 00       	mov    $0xb,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <sbrk>:
SYSCALL(sbrk)
 55a:	b8 0c 00 00 00       	mov    $0xc,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <sleep>:
SYSCALL(sleep)
 562:	b8 0d 00 00 00       	mov    $0xd,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <uptime>:
SYSCALL(uptime)
 56a:	b8 0e 00 00 00       	mov    $0xe,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <clone>:
SYSCALL(clone)
 572:	b8 16 00 00 00       	mov    $0x16,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <join>:
 57a:	b8 17 00 00 00       	mov    $0x17,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 582:	55                   	push   %ebp
 583:	89 e5                	mov    %esp,%ebp
 585:	83 ec 1c             	sub    $0x1c,%esp
 588:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 58b:	6a 01                	push   $0x1
 58d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 590:	52                   	push   %edx
 591:	50                   	push   %eax
 592:	e8 5b ff ff ff       	call   4f2 <write>
}
 597:	83 c4 10             	add    $0x10,%esp
 59a:	c9                   	leave  
 59b:	c3                   	ret    

0000059c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 59c:	55                   	push   %ebp
 59d:	89 e5                	mov    %esp,%ebp
 59f:	57                   	push   %edi
 5a0:	56                   	push   %esi
 5a1:	53                   	push   %ebx
 5a2:	83 ec 2c             	sub    $0x2c,%esp
 5a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a8:	89 d0                	mov    %edx,%eax
 5aa:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ac:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5b0:	0f 95 c1             	setne  %cl
 5b3:	c1 ea 1f             	shr    $0x1f,%edx
 5b6:	84 d1                	test   %dl,%cl
 5b8:	74 44                	je     5fe <printint+0x62>
    neg = 1;
    x = -xx;
 5ba:	f7 d8                	neg    %eax
 5bc:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5be:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5c5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5ca:	89 c8                	mov    %ecx,%eax
 5cc:	ba 00 00 00 00       	mov    $0x0,%edx
 5d1:	f7 f6                	div    %esi
 5d3:	89 df                	mov    %ebx,%edi
 5d5:	83 c3 01             	add    $0x1,%ebx
 5d8:	0f b6 92 c4 09 00 00 	movzbl 0x9c4(%edx),%edx
 5df:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5e3:	89 ca                	mov    %ecx,%edx
 5e5:	89 c1                	mov    %eax,%ecx
 5e7:	39 d6                	cmp    %edx,%esi
 5e9:	76 df                	jbe    5ca <printint+0x2e>
  if(neg)
 5eb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5ef:	74 31                	je     622 <printint+0x86>
    buf[i++] = '-';
 5f1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5f6:	8d 5f 02             	lea    0x2(%edi),%ebx
 5f9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5fc:	eb 17                	jmp    615 <printint+0x79>
    x = xx;
 5fe:	89 c1                	mov    %eax,%ecx
  neg = 0;
 600:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 607:	eb bc                	jmp    5c5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 609:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 60e:	89 f0                	mov    %esi,%eax
 610:	e8 6d ff ff ff       	call   582 <putc>
  while(--i >= 0)
 615:	83 eb 01             	sub    $0x1,%ebx
 618:	79 ef                	jns    609 <printint+0x6d>
}
 61a:	83 c4 2c             	add    $0x2c,%esp
 61d:	5b                   	pop    %ebx
 61e:	5e                   	pop    %esi
 61f:	5f                   	pop    %edi
 620:	5d                   	pop    %ebp
 621:	c3                   	ret    
 622:	8b 75 d0             	mov    -0x30(%ebp),%esi
 625:	eb ee                	jmp    615 <printint+0x79>

00000627 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 627:	55                   	push   %ebp
 628:	89 e5                	mov    %esp,%ebp
 62a:	57                   	push   %edi
 62b:	56                   	push   %esi
 62c:	53                   	push   %ebx
 62d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 630:	8d 45 10             	lea    0x10(%ebp),%eax
 633:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 636:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 63b:	bb 00 00 00 00       	mov    $0x0,%ebx
 640:	eb 14                	jmp    656 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 642:	89 fa                	mov    %edi,%edx
 644:	8b 45 08             	mov    0x8(%ebp),%eax
 647:	e8 36 ff ff ff       	call   582 <putc>
 64c:	eb 05                	jmp    653 <printf+0x2c>
      }
    } else if(state == '%'){
 64e:	83 fe 25             	cmp    $0x25,%esi
 651:	74 25                	je     678 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 653:	83 c3 01             	add    $0x1,%ebx
 656:	8b 45 0c             	mov    0xc(%ebp),%eax
 659:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 65d:	84 c0                	test   %al,%al
 65f:	0f 84 20 01 00 00    	je     785 <printf+0x15e>
    c = fmt[i] & 0xff;
 665:	0f be f8             	movsbl %al,%edi
 668:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 66b:	85 f6                	test   %esi,%esi
 66d:	75 df                	jne    64e <printf+0x27>
      if(c == '%'){
 66f:	83 f8 25             	cmp    $0x25,%eax
 672:	75 ce                	jne    642 <printf+0x1b>
        state = '%';
 674:	89 c6                	mov    %eax,%esi
 676:	eb db                	jmp    653 <printf+0x2c>
      if(c == 'd'){
 678:	83 f8 25             	cmp    $0x25,%eax
 67b:	0f 84 cf 00 00 00    	je     750 <printf+0x129>
 681:	0f 8c dd 00 00 00    	jl     764 <printf+0x13d>
 687:	83 f8 78             	cmp    $0x78,%eax
 68a:	0f 8f d4 00 00 00    	jg     764 <printf+0x13d>
 690:	83 f8 63             	cmp    $0x63,%eax
 693:	0f 8c cb 00 00 00    	jl     764 <printf+0x13d>
 699:	83 e8 63             	sub    $0x63,%eax
 69c:	83 f8 15             	cmp    $0x15,%eax
 69f:	0f 87 bf 00 00 00    	ja     764 <printf+0x13d>
 6a5:	ff 24 85 6c 09 00 00 	jmp    *0x96c(,%eax,4)
        printint(fd, *ap, 10, 1);
 6ac:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6af:	8b 17                	mov    (%edi),%edx
 6b1:	83 ec 0c             	sub    $0xc,%esp
 6b4:	6a 01                	push   $0x1
 6b6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6bb:	8b 45 08             	mov    0x8(%ebp),%eax
 6be:	e8 d9 fe ff ff       	call   59c <printint>
        ap++;
 6c3:	83 c7 04             	add    $0x4,%edi
 6c6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6c9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6cc:	be 00 00 00 00       	mov    $0x0,%esi
 6d1:	eb 80                	jmp    653 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d6:	8b 17                	mov    (%edi),%edx
 6d8:	83 ec 0c             	sub    $0xc,%esp
 6db:	6a 00                	push   $0x0
 6dd:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	e8 b2 fe ff ff       	call   59c <printint>
        ap++;
 6ea:	83 c7 04             	add    $0x4,%edi
 6ed:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f3:	be 00 00 00 00       	mov    $0x0,%esi
 6f8:	e9 56 ff ff ff       	jmp    653 <printf+0x2c>
        s = (char*)*ap;
 6fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 700:	8b 30                	mov    (%eax),%esi
        ap++;
 702:	83 c0 04             	add    $0x4,%eax
 705:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 708:	85 f6                	test   %esi,%esi
 70a:	75 15                	jne    721 <printf+0xfa>
          s = "(null)";
 70c:	be 63 09 00 00       	mov    $0x963,%esi
 711:	eb 0e                	jmp    721 <printf+0xfa>
          putc(fd, *s);
 713:	0f be d2             	movsbl %dl,%edx
 716:	8b 45 08             	mov    0x8(%ebp),%eax
 719:	e8 64 fe ff ff       	call   582 <putc>
          s++;
 71e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 721:	0f b6 16             	movzbl (%esi),%edx
 724:	84 d2                	test   %dl,%dl
 726:	75 eb                	jne    713 <printf+0xec>
      state = 0;
 728:	be 00 00 00 00       	mov    $0x0,%esi
 72d:	e9 21 ff ff ff       	jmp    653 <printf+0x2c>
        putc(fd, *ap);
 732:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 735:	0f be 17             	movsbl (%edi),%edx
 738:	8b 45 08             	mov    0x8(%ebp),%eax
 73b:	e8 42 fe ff ff       	call   582 <putc>
        ap++;
 740:	83 c7 04             	add    $0x4,%edi
 743:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 746:	be 00 00 00 00       	mov    $0x0,%esi
 74b:	e9 03 ff ff ff       	jmp    653 <printf+0x2c>
        putc(fd, c);
 750:	89 fa                	mov    %edi,%edx
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	e8 28 fe ff ff       	call   582 <putc>
      state = 0;
 75a:	be 00 00 00 00       	mov    $0x0,%esi
 75f:	e9 ef fe ff ff       	jmp    653 <printf+0x2c>
        putc(fd, '%');
 764:	ba 25 00 00 00       	mov    $0x25,%edx
 769:	8b 45 08             	mov    0x8(%ebp),%eax
 76c:	e8 11 fe ff ff       	call   582 <putc>
        putc(fd, c);
 771:	89 fa                	mov    %edi,%edx
 773:	8b 45 08             	mov    0x8(%ebp),%eax
 776:	e8 07 fe ff ff       	call   582 <putc>
      state = 0;
 77b:	be 00 00 00 00       	mov    $0x0,%esi
 780:	e9 ce fe ff ff       	jmp    653 <printf+0x2c>
    }
  }
}
 785:	8d 65 f4             	lea    -0xc(%ebp),%esp
 788:	5b                   	pop    %ebx
 789:	5e                   	pop    %esi
 78a:	5f                   	pop    %edi
 78b:	5d                   	pop    %ebp
 78c:	c3                   	ret    

0000078d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 78d:	55                   	push   %ebp
 78e:	89 e5                	mov    %esp,%ebp
 790:	57                   	push   %edi
 791:	56                   	push   %esi
 792:	53                   	push   %ebx
 793:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 796:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 799:	a1 40 0d 00 00       	mov    0xd40,%eax
 79e:	eb 02                	jmp    7a2 <free+0x15>
 7a0:	89 d0                	mov    %edx,%eax
 7a2:	39 c8                	cmp    %ecx,%eax
 7a4:	73 04                	jae    7aa <free+0x1d>
 7a6:	39 08                	cmp    %ecx,(%eax)
 7a8:	77 12                	ja     7bc <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7aa:	8b 10                	mov    (%eax),%edx
 7ac:	39 c2                	cmp    %eax,%edx
 7ae:	77 f0                	ja     7a0 <free+0x13>
 7b0:	39 c8                	cmp    %ecx,%eax
 7b2:	72 08                	jb     7bc <free+0x2f>
 7b4:	39 ca                	cmp    %ecx,%edx
 7b6:	77 04                	ja     7bc <free+0x2f>
 7b8:	89 d0                	mov    %edx,%eax
 7ba:	eb e6                	jmp    7a2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7bc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7bf:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7c2:	8b 10                	mov    (%eax),%edx
 7c4:	39 d7                	cmp    %edx,%edi
 7c6:	74 19                	je     7e1 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7c8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cb:	8b 50 04             	mov    0x4(%eax),%edx
 7ce:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d1:	39 ce                	cmp    %ecx,%esi
 7d3:	74 1b                	je     7f0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7d5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7d7:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 7dc:	5b                   	pop    %ebx
 7dd:	5e                   	pop    %esi
 7de:	5f                   	pop    %edi
 7df:	5d                   	pop    %ebp
 7e0:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7e1:	03 72 04             	add    0x4(%edx),%esi
 7e4:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e7:	8b 10                	mov    (%eax),%edx
 7e9:	8b 12                	mov    (%edx),%edx
 7eb:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7ee:	eb db                	jmp    7cb <free+0x3e>
    p->s.size += bp->s.size;
 7f0:	03 53 fc             	add    -0x4(%ebx),%edx
 7f3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f9:	89 10                	mov    %edx,(%eax)
 7fb:	eb da                	jmp    7d7 <free+0x4a>

000007fd <morecore>:

static Header*
morecore(uint nu)
{
 7fd:	55                   	push   %ebp
 7fe:	89 e5                	mov    %esp,%ebp
 800:	53                   	push   %ebx
 801:	83 ec 04             	sub    $0x4,%esp
 804:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 806:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 80b:	77 05                	ja     812 <morecore+0x15>
    nu = 4096;
 80d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 812:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 819:	83 ec 0c             	sub    $0xc,%esp
 81c:	50                   	push   %eax
 81d:	e8 38 fd ff ff       	call   55a <sbrk>
  if(p == (char*)-1)
 822:	83 c4 10             	add    $0x10,%esp
 825:	83 f8 ff             	cmp    $0xffffffff,%eax
 828:	74 1c                	je     846 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 82a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 82d:	83 c0 08             	add    $0x8,%eax
 830:	83 ec 0c             	sub    $0xc,%esp
 833:	50                   	push   %eax
 834:	e8 54 ff ff ff       	call   78d <free>
  return freep;
 839:	a1 40 0d 00 00       	mov    0xd40,%eax
 83e:	83 c4 10             	add    $0x10,%esp
}
 841:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 844:	c9                   	leave  
 845:	c3                   	ret    
    return 0;
 846:	b8 00 00 00 00       	mov    $0x0,%eax
 84b:	eb f4                	jmp    841 <morecore+0x44>

0000084d <malloc>:

void*
malloc(uint nbytes)
{
 84d:	55                   	push   %ebp
 84e:	89 e5                	mov    %esp,%ebp
 850:	53                   	push   %ebx
 851:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 854:	8b 45 08             	mov    0x8(%ebp),%eax
 857:	8d 58 07             	lea    0x7(%eax),%ebx
 85a:	c1 eb 03             	shr    $0x3,%ebx
 85d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 860:	8b 0d 40 0d 00 00    	mov    0xd40,%ecx
 866:	85 c9                	test   %ecx,%ecx
 868:	74 04                	je     86e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86a:	8b 01                	mov    (%ecx),%eax
 86c:	eb 4a                	jmp    8b8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 86e:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 875:	0d 00 00 
 878:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 87f:	0d 00 00 
    base.s.size = 0;
 882:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 889:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 88c:	b9 44 0d 00 00       	mov    $0xd44,%ecx
 891:	eb d7                	jmp    86a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 893:	74 19                	je     8ae <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 895:	29 da                	sub    %ebx,%edx
 897:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 89a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 89d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8a0:	89 0d 40 0d 00 00    	mov    %ecx,0xd40
      return (void*)(p + 1);
 8a6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ac:	c9                   	leave  
 8ad:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8ae:	8b 10                	mov    (%eax),%edx
 8b0:	89 11                	mov    %edx,(%ecx)
 8b2:	eb ec                	jmp    8a0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b4:	89 c1                	mov    %eax,%ecx
 8b6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8b8:	8b 50 04             	mov    0x4(%eax),%edx
 8bb:	39 da                	cmp    %ebx,%edx
 8bd:	73 d4                	jae    893 <malloc+0x46>
    if(p == freep)
 8bf:	39 05 40 0d 00 00    	cmp    %eax,0xd40
 8c5:	75 ed                	jne    8b4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8c7:	89 d8                	mov    %ebx,%eax
 8c9:	e8 2f ff ff ff       	call   7fd <morecore>
 8ce:	85 c0                	test   %eax,%eax
 8d0:	75 e2                	jne    8b4 <malloc+0x67>
 8d2:	eb d5                	jmp    8a9 <malloc+0x5c>
