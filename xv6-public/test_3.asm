
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
   6:	6a 06                	push   $0x6
   8:	68 f8 08 00 00       	push   $0x8f8
   d:	6a 03                	push   $0x3
   f:	e8 00 05 00 00       	call   514 <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 ff 08 00 00       	push   $0x8ff
  23:	68 08 09 00 00       	push   $0x908
  28:	6a 01                	push   $0x1
  2a:	e8 1a 06 00 00       	call   649 <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 10 09 00 00       	push   $0x910
  37:	68 2c 09 00 00       	push   $0x92c
  3c:	6a 01                	push   $0x1
  3e:	e8 06 06 00 00       	call   649 <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 40 09 00 00       	push   $0x940
  4b:	6a 01                	push   $0x1
  4d:	e8 f7 05 00 00       	call   649 <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 98 0d 00 00    	push   0xd98
  5b:	e8 c4 04 00 00       	call   524 <kill>
  60:	e8 8f 04 00 00       	call   4f4 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 4d 09 00 00       	push   $0x94d
  72:	e8 bd 04 00 00       	call   534 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 94 0d 00 00 	lock xchg %eax,0xd94
   exit();
  7e:	e8 71 04 00 00       	call   4f4 <exit>

00000083 <main>:
{
  83:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  87:	83 e4 f0             	and    $0xfffffff0,%esp
  8a:	ff 71 fc             	push   -0x4(%ecx)
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	51                   	push   %ecx
  93:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  96:	e8 d9 04 00 00       	call   574 <getpid>
  9b:	a3 98 0d 00 00       	mov    %eax,0xd98
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 c2 07 00 00       	call   86f <malloc>
   assert(p != NULL);
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	85 c0                	test   %eax,%eax
  b2:	74 7d                	je     131 <main+0xae>
  b4:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b6:	25 ff 0f 00 00       	and    $0xfff,%eax
  bb:	0f 84 b9 00 00 00    	je     17a <main+0xf7>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c1:	be 00 10 00 00       	mov    $0x1000,%esi
  c6:	29 c6                	sub    %eax,%esi
  c8:	01 de                	add    %ebx,%esi
   int fd = open("tmp", O_WRONLY|O_CREATE);
  ca:	83 ec 08             	sub    $0x8,%esp
  cd:	68 01 02 00 00       	push   $0x201
  d2:	68 5c 09 00 00       	push   $0x95c
  d7:	e8 58 04 00 00       	call   534 <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 ff 08 00 00       	push   $0x8ff
  ef:	68 08 09 00 00       	push   $0x908
  f4:	6a 01                	push   $0x1
  f6:	e8 4e 05 00 00       	call   649 <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 60 09 00 00       	push   $0x960
 103:	68 2c 09 00 00       	push   $0x92c
 108:	6a 01                	push   $0x1
 10a:	e8 3a 05 00 00       	call   649 <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 40 09 00 00       	push   $0x940
 117:	6a 01                	push   $0x1
 119:	e8 2b 05 00 00       	call   649 <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 98 0d 00 00    	push   0xd98
 127:	e8 f8 03 00 00       	call   524 <kill>
 12c:	e8 c3 03 00 00       	call   4f4 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 ff 08 00 00       	push   $0x8ff
 138:	68 08 09 00 00       	push   $0x908
 13d:	6a 01                	push   $0x1
 13f:	e8 05 05 00 00       	call   649 <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 52 09 00 00       	push   $0x952
 14c:	68 2c 09 00 00       	push   $0x92c
 151:	6a 01                	push   $0x1
 153:	e8 f1 04 00 00       	call   649 <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 40 09 00 00       	push   $0x940
 160:	6a 01                	push   $0x1
 162:	e8 e2 04 00 00       	call   649 <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 98 0d 00 00    	push   0xd98
 170:	e8 af 03 00 00       	call   524 <kill>
 175:	e8 7a 03 00 00       	call   4f4 <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 04 04 00 00       	call   594 <clone>
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
 199:	a1 94 0d 00 00       	mov    0xd94,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 94 0d 00 00       	mov    0xd94,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 76 09 00 00       	push   $0x976
 1b1:	50                   	push   %eax
 1b2:	e8 5d 03 00 00       	call   514 <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 ff 08 00 00       	push   $0x8ff
 1ca:	68 08 09 00 00       	push   $0x908
 1cf:	6a 01                	push   $0x1
 1d1:	e8 73 04 00 00       	call   649 <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 a4 09 00 00       	push   $0x9a4
 1de:	68 2c 09 00 00       	push   $0x92c
 1e3:	6a 01                	push   $0x1
 1e5:	e8 5f 04 00 00       	call   649 <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 40 09 00 00       	push   $0x940
 1f2:	6a 01                	push   $0x1
 1f4:	e8 50 04 00 00       	call   649 <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 98 0d 00 00    	push   0xd98
 202:	e8 1d 03 00 00       	call   524 <kill>
 207:	e8 e8 02 00 00       	call   4f4 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 ff 08 00 00       	push   $0x8ff
 213:	68 08 09 00 00       	push   $0x908
 218:	6a 01                	push   $0x1
 21a:	e8 2a 04 00 00       	call   649 <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 68 09 00 00       	push   $0x968
 227:	68 2c 09 00 00       	push   $0x92c
 22c:	6a 01                	push   $0x1
 22e:	e8 16 04 00 00       	call   649 <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 40 09 00 00       	push   $0x940
 23b:	6a 01                	push   $0x1
 23d:	e8 07 04 00 00       	call   649 <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 98 0d 00 00    	push   0xd98
 24b:	e8 d4 02 00 00       	call   524 <kill>
 250:	e8 9f 02 00 00       	call   4f4 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 7f 09 00 00       	push   $0x97f
 25d:	6a 01                	push   $0x1
 25f:	e8 e5 03 00 00       	call   649 <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 2d 03 00 00       	call   59c <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 ff 08 00 00       	push   $0x8ff
 27d:	68 08 09 00 00       	push   $0x908
 282:	6a 01                	push   $0x1
 284:	e8 c0 03 00 00       	call   649 <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 8c 09 00 00       	push   $0x98c
 291:	68 2c 09 00 00       	push   $0x92c
 296:	6a 01                	push   $0x1
 298:	e8 ac 03 00 00       	call   649 <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 40 09 00 00       	push   $0x940
 2a5:	6a 01                	push   $0x1
 2a7:	e8 9d 03 00 00       	call   649 <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 98 0d 00 00    	push   0xd98
 2b5:	e8 6a 02 00 00       	call   524 <kill>
 2ba:	e8 35 02 00 00       	call   4f4 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 e7 04 00 00       	call   7af <free>
   exit();
 2c8:	e8 27 02 00 00       	call   4f4 <exit>

000002cd <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	8b 75 08             	mov    0x8(%ebp),%esi
 2d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2d8:	89 f0                	mov    %esi,%eax
 2da:	89 d1                	mov    %edx,%ecx
 2dc:	83 c2 01             	add    $0x1,%edx
 2df:	89 c3                	mov    %eax,%ebx
 2e1:	83 c0 01             	add    $0x1,%eax
 2e4:	0f b6 09             	movzbl (%ecx),%ecx
 2e7:	88 0b                	mov    %cl,(%ebx)
 2e9:	84 c9                	test   %cl,%cl
 2eb:	75 ed                	jne    2da <strcpy+0xd>
    ;
  return os;
}
 2ed:	89 f0                	mov    %esi,%eax
 2ef:	5b                   	pop    %ebx
 2f0:	5e                   	pop    %esi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    

000002f3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2fc:	eb 06                	jmp    304 <strcmp+0x11>
    p++, q++;
 2fe:	83 c1 01             	add    $0x1,%ecx
 301:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 304:	0f b6 01             	movzbl (%ecx),%eax
 307:	84 c0                	test   %al,%al
 309:	74 04                	je     30f <strcmp+0x1c>
 30b:	3a 02                	cmp    (%edx),%al
 30d:	74 ef                	je     2fe <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 30f:	0f b6 c0             	movzbl %al,%eax
 312:	0f b6 12             	movzbl (%edx),%edx
 315:	29 d0                	sub    %edx,%eax
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    

00000319 <strlen>:

uint
strlen(const char *s)
{
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 31f:	b8 00 00 00 00       	mov    $0x0,%eax
 324:	eb 03                	jmp    329 <strlen+0x10>
 326:	83 c0 01             	add    $0x1,%eax
 329:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 32d:	75 f7                	jne    326 <strlen+0xd>
    ;
  return n;
}
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    

00000331 <memset>:

void*
memset(void *dst, int c, uint n)
{
 331:	55                   	push   %ebp
 332:	89 e5                	mov    %esp,%ebp
 334:	57                   	push   %edi
 335:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 338:	89 d7                	mov    %edx,%edi
 33a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 33d:	8b 45 0c             	mov    0xc(%ebp),%eax
 340:	fc                   	cld    
 341:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 343:	89 d0                	mov    %edx,%eax
 345:	8b 7d fc             	mov    -0x4(%ebp),%edi
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <strchr>:

char*
strchr(const char *s, char c)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 354:	eb 03                	jmp    359 <strchr+0xf>
 356:	83 c0 01             	add    $0x1,%eax
 359:	0f b6 10             	movzbl (%eax),%edx
 35c:	84 d2                	test   %dl,%dl
 35e:	74 06                	je     366 <strchr+0x1c>
    if(*s == c)
 360:	38 ca                	cmp    %cl,%dl
 362:	75 f2                	jne    356 <strchr+0xc>
 364:	eb 05                	jmp    36b <strchr+0x21>
      return (char*)s;
  return 0;
 366:	b8 00 00 00 00       	mov    $0x0,%eax
}
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    

0000036d <gets>:

char*
gets(char *buf, int max)
{
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	57                   	push   %edi
 371:	56                   	push   %esi
 372:	53                   	push   %ebx
 373:	83 ec 1c             	sub    $0x1c,%esp
 376:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 379:	bb 00 00 00 00       	mov    $0x0,%ebx
 37e:	89 de                	mov    %ebx,%esi
 380:	83 c3 01             	add    $0x1,%ebx
 383:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 386:	7d 2e                	jge    3b6 <gets+0x49>
    cc = read(0, &c, 1);
 388:	83 ec 04             	sub    $0x4,%esp
 38b:	6a 01                	push   $0x1
 38d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 390:	50                   	push   %eax
 391:	6a 00                	push   $0x0
 393:	e8 74 01 00 00       	call   50c <read>
    if(cc < 1)
 398:	83 c4 10             	add    $0x10,%esp
 39b:	85 c0                	test   %eax,%eax
 39d:	7e 17                	jle    3b6 <gets+0x49>
      break;
    buf[i++] = c;
 39f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3a6:	3c 0a                	cmp    $0xa,%al
 3a8:	0f 94 c2             	sete   %dl
 3ab:	3c 0d                	cmp    $0xd,%al
 3ad:	0f 94 c0             	sete   %al
 3b0:	08 c2                	or     %al,%dl
 3b2:	74 ca                	je     37e <gets+0x11>
    buf[i++] = c;
 3b4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3b6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3ba:	89 f8                	mov    %edi,%eax
 3bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bf:	5b                   	pop    %ebx
 3c0:	5e                   	pop    %esi
 3c1:	5f                   	pop    %edi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    

000003c4 <stat>:

int
stat(const char *n, struct stat *st)
{
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	56                   	push   %esi
 3c8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c9:	83 ec 08             	sub    $0x8,%esp
 3cc:	6a 00                	push   $0x0
 3ce:	ff 75 08             	push   0x8(%ebp)
 3d1:	e8 5e 01 00 00       	call   534 <open>
  if(fd < 0)
 3d6:	83 c4 10             	add    $0x10,%esp
 3d9:	85 c0                	test   %eax,%eax
 3db:	78 24                	js     401 <stat+0x3d>
 3dd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3df:	83 ec 08             	sub    $0x8,%esp
 3e2:	ff 75 0c             	push   0xc(%ebp)
 3e5:	50                   	push   %eax
 3e6:	e8 61 01 00 00       	call   54c <fstat>
 3eb:	89 c6                	mov    %eax,%esi
  close(fd);
 3ed:	89 1c 24             	mov    %ebx,(%esp)
 3f0:	e8 27 01 00 00       	call   51c <close>
  return r;
 3f5:	83 c4 10             	add    $0x10,%esp
}
 3f8:	89 f0                	mov    %esi,%eax
 3fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3fd:	5b                   	pop    %ebx
 3fe:	5e                   	pop    %esi
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    
    return -1;
 401:	be ff ff ff ff       	mov    $0xffffffff,%esi
 406:	eb f0                	jmp    3f8 <stat+0x34>

00000408 <atoi>:

int
atoi(const char *s)
{
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	53                   	push   %ebx
 40c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 414:	eb 10                	jmp    426 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 416:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 419:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 41c:	83 c1 01             	add    $0x1,%ecx
 41f:	0f be c0             	movsbl %al,%eax
 422:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 426:	0f b6 01             	movzbl (%ecx),%eax
 429:	8d 58 d0             	lea    -0x30(%eax),%ebx
 42c:	80 fb 09             	cmp    $0x9,%bl
 42f:	76 e5                	jbe    416 <atoi+0xe>
  return n;
}
 431:	89 d0                	mov    %edx,%eax
 433:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 436:	c9                   	leave  
 437:	c3                   	ret    

00000438 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	56                   	push   %esi
 43c:	53                   	push   %ebx
 43d:	8b 75 08             	mov    0x8(%ebp),%esi
 440:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 443:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 446:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 448:	eb 0d                	jmp    457 <memmove+0x1f>
    *dst++ = *src++;
 44a:	0f b6 01             	movzbl (%ecx),%eax
 44d:	88 02                	mov    %al,(%edx)
 44f:	8d 49 01             	lea    0x1(%ecx),%ecx
 452:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 455:	89 d8                	mov    %ebx,%eax
 457:	8d 58 ff             	lea    -0x1(%eax),%ebx
 45a:	85 c0                	test   %eax,%eax
 45c:	7f ec                	jg     44a <memmove+0x12>
  return vdst;
}
 45e:	89 f0                	mov    %esi,%eax
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    

00000464 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 46a:	68 00 10 00 00       	push   $0x1000
 46f:	e8 fb 03 00 00       	call   86f <malloc>

  return clone(start_routine, arg1, arg2, stack);
 474:	50                   	push   %eax
 475:	ff 75 10             	push   0x10(%ebp)
 478:	ff 75 0c             	push   0xc(%ebp)
 47b:	ff 75 08             	push   0x8(%ebp)
 47e:	e8 11 01 00 00       	call   594 <clone>
}
 483:	c9                   	leave  
 484:	c3                   	ret    

00000485 <thread_join>:

int thread_join(){
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
 488:	53                   	push   %ebx
 489:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 48c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 48f:	50                   	push   %eax
 490:	e8 07 01 00 00       	call   59c <join>
  if (x < 0) {
 495:	83 c4 10             	add    $0x10,%esp
 498:	85 c0                	test   %eax,%eax
 49a:	78 17                	js     4b3 <thread_join+0x2e>
 49c:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 49e:	83 ec 0c             	sub    $0xc,%esp
 4a1:	ff 75 f4             	push   -0xc(%ebp)
 4a4:	e8 06 03 00 00       	call   7af <free>
  return x;
 4a9:	83 c4 10             	add    $0x10,%esp
}
 4ac:	89 d8                	mov    %ebx,%eax
 4ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4b1:	c9                   	leave  
 4b2:	c3                   	ret    
    return -1;
 4b3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 4b8:	eb f2                	jmp    4ac <thread_join+0x27>

000004ba <lock_init>:

void lock_init(lock_t *spin){
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 4bd:	8b 45 08             	mov    0x8(%ebp),%eax
 4c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4c6:	5d                   	pop    %ebp
 4c7:	c3                   	ret    

000004c8 <lock_acquire>:

void lock_acquire(lock_t *spin){
 4c8:	55                   	push   %ebp
 4c9:	89 e5                	mov    %esp,%ebp
 4cb:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("lock; xchgl %0, %1" :
 4ce:	b8 01 00 00 00       	mov    $0x1,%eax
 4d3:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4d6:	85 c0                	test   %eax,%eax
 4d8:	75 f4                	jne    4ce <lock_acquire+0x6>

}
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    

000004dc <lock_release>:

void lock_release(lock_t *spin){
 4dc:	55                   	push   %ebp
 4dd:	89 e5                	mov    %esp,%ebp
 4df:	8b 55 08             	mov    0x8(%ebp),%edx
 4e2:	b8 00 00 00 00       	mov    $0x0,%eax
 4e7:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 4ea:	5d                   	pop    %ebp
 4eb:	c3                   	ret    

000004ec <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ec:	b8 01 00 00 00       	mov    $0x1,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <exit>:
SYSCALL(exit)
 4f4:	b8 02 00 00 00       	mov    $0x2,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <wait>:
SYSCALL(wait)
 4fc:	b8 03 00 00 00       	mov    $0x3,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <pipe>:
SYSCALL(pipe)
 504:	b8 04 00 00 00       	mov    $0x4,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <read>:
SYSCALL(read)
 50c:	b8 05 00 00 00       	mov    $0x5,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <write>:
SYSCALL(write)
 514:	b8 10 00 00 00       	mov    $0x10,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <close>:
SYSCALL(close)
 51c:	b8 15 00 00 00       	mov    $0x15,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <kill>:
SYSCALL(kill)
 524:	b8 06 00 00 00       	mov    $0x6,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <exec>:
SYSCALL(exec)
 52c:	b8 07 00 00 00       	mov    $0x7,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <open>:
SYSCALL(open)
 534:	b8 0f 00 00 00       	mov    $0xf,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <mknod>:
SYSCALL(mknod)
 53c:	b8 11 00 00 00       	mov    $0x11,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <unlink>:
SYSCALL(unlink)
 544:	b8 12 00 00 00       	mov    $0x12,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <fstat>:
SYSCALL(fstat)
 54c:	b8 08 00 00 00       	mov    $0x8,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <link>:
SYSCALL(link)
 554:	b8 13 00 00 00       	mov    $0x13,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <mkdir>:
SYSCALL(mkdir)
 55c:	b8 14 00 00 00       	mov    $0x14,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <chdir>:
SYSCALL(chdir)
 564:	b8 09 00 00 00       	mov    $0x9,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <dup>:
SYSCALL(dup)
 56c:	b8 0a 00 00 00       	mov    $0xa,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <getpid>:
SYSCALL(getpid)
 574:	b8 0b 00 00 00       	mov    $0xb,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <sbrk>:
SYSCALL(sbrk)
 57c:	b8 0c 00 00 00       	mov    $0xc,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <sleep>:
SYSCALL(sleep)
 584:	b8 0d 00 00 00       	mov    $0xd,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <uptime>:
SYSCALL(uptime)
 58c:	b8 0e 00 00 00       	mov    $0xe,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <clone>:
SYSCALL(clone)
 594:	b8 16 00 00 00       	mov    $0x16,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <join>:
 59c:	b8 17 00 00 00       	mov    $0x17,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	83 ec 1c             	sub    $0x1c,%esp
 5aa:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5ad:	6a 01                	push   $0x1
 5af:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5b2:	52                   	push   %edx
 5b3:	50                   	push   %eax
 5b4:	e8 5b ff ff ff       	call   514 <write>
}
 5b9:	83 c4 10             	add    $0x10,%esp
 5bc:	c9                   	leave  
 5bd:	c3                   	ret    

000005be <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5be:	55                   	push   %ebp
 5bf:	89 e5                	mov    %esp,%ebp
 5c1:	57                   	push   %edi
 5c2:	56                   	push   %esi
 5c3:	53                   	push   %ebx
 5c4:	83 ec 2c             	sub    $0x2c,%esp
 5c7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5ca:	89 d0                	mov    %edx,%eax
 5cc:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ce:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5d2:	0f 95 c1             	setne  %cl
 5d5:	c1 ea 1f             	shr    $0x1f,%edx
 5d8:	84 d1                	test   %dl,%cl
 5da:	74 44                	je     620 <printint+0x62>
    neg = 1;
    x = -xx;
 5dc:	f7 d8                	neg    %eax
 5de:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5e0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5e7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5ec:	89 c8                	mov    %ecx,%eax
 5ee:	ba 00 00 00 00       	mov    $0x0,%edx
 5f3:	f7 f6                	div    %esi
 5f5:	89 df                	mov    %ebx,%edi
 5f7:	83 c3 01             	add    $0x1,%ebx
 5fa:	0f b6 92 28 0a 00 00 	movzbl 0xa28(%edx),%edx
 601:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 605:	89 ca                	mov    %ecx,%edx
 607:	89 c1                	mov    %eax,%ecx
 609:	39 d6                	cmp    %edx,%esi
 60b:	76 df                	jbe    5ec <printint+0x2e>
  if(neg)
 60d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 611:	74 31                	je     644 <printint+0x86>
    buf[i++] = '-';
 613:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 618:	8d 5f 02             	lea    0x2(%edi),%ebx
 61b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 61e:	eb 17                	jmp    637 <printint+0x79>
    x = xx;
 620:	89 c1                	mov    %eax,%ecx
  neg = 0;
 622:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 629:	eb bc                	jmp    5e7 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 62b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 630:	89 f0                	mov    %esi,%eax
 632:	e8 6d ff ff ff       	call   5a4 <putc>
  while(--i >= 0)
 637:	83 eb 01             	sub    $0x1,%ebx
 63a:	79 ef                	jns    62b <printint+0x6d>
}
 63c:	83 c4 2c             	add    $0x2c,%esp
 63f:	5b                   	pop    %ebx
 640:	5e                   	pop    %esi
 641:	5f                   	pop    %edi
 642:	5d                   	pop    %ebp
 643:	c3                   	ret    
 644:	8b 75 d0             	mov    -0x30(%ebp),%esi
 647:	eb ee                	jmp    637 <printint+0x79>

00000649 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 649:	55                   	push   %ebp
 64a:	89 e5                	mov    %esp,%ebp
 64c:	57                   	push   %edi
 64d:	56                   	push   %esi
 64e:	53                   	push   %ebx
 64f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 652:	8d 45 10             	lea    0x10(%ebp),%eax
 655:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 658:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 65d:	bb 00 00 00 00       	mov    $0x0,%ebx
 662:	eb 14                	jmp    678 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 664:	89 fa                	mov    %edi,%edx
 666:	8b 45 08             	mov    0x8(%ebp),%eax
 669:	e8 36 ff ff ff       	call   5a4 <putc>
 66e:	eb 05                	jmp    675 <printf+0x2c>
      }
    } else if(state == '%'){
 670:	83 fe 25             	cmp    $0x25,%esi
 673:	74 25                	je     69a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 675:	83 c3 01             	add    $0x1,%ebx
 678:	8b 45 0c             	mov    0xc(%ebp),%eax
 67b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 67f:	84 c0                	test   %al,%al
 681:	0f 84 20 01 00 00    	je     7a7 <printf+0x15e>
    c = fmt[i] & 0xff;
 687:	0f be f8             	movsbl %al,%edi
 68a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 68d:	85 f6                	test   %esi,%esi
 68f:	75 df                	jne    670 <printf+0x27>
      if(c == '%'){
 691:	83 f8 25             	cmp    $0x25,%eax
 694:	75 ce                	jne    664 <printf+0x1b>
        state = '%';
 696:	89 c6                	mov    %eax,%esi
 698:	eb db                	jmp    675 <printf+0x2c>
      if(c == 'd'){
 69a:	83 f8 25             	cmp    $0x25,%eax
 69d:	0f 84 cf 00 00 00    	je     772 <printf+0x129>
 6a3:	0f 8c dd 00 00 00    	jl     786 <printf+0x13d>
 6a9:	83 f8 78             	cmp    $0x78,%eax
 6ac:	0f 8f d4 00 00 00    	jg     786 <printf+0x13d>
 6b2:	83 f8 63             	cmp    $0x63,%eax
 6b5:	0f 8c cb 00 00 00    	jl     786 <printf+0x13d>
 6bb:	83 e8 63             	sub    $0x63,%eax
 6be:	83 f8 15             	cmp    $0x15,%eax
 6c1:	0f 87 bf 00 00 00    	ja     786 <printf+0x13d>
 6c7:	ff 24 85 d0 09 00 00 	jmp    *0x9d0(,%eax,4)
        printint(fd, *ap, 10, 1);
 6ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d1:	8b 17                	mov    (%edi),%edx
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	6a 01                	push   $0x1
 6d8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	e8 d9 fe ff ff       	call   5be <printint>
        ap++;
 6e5:	83 c7 04             	add    $0x4,%edi
 6e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6eb:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6ee:	be 00 00 00 00       	mov    $0x0,%esi
 6f3:	eb 80                	jmp    675 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6f5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f8:	8b 17                	mov    (%edi),%edx
 6fa:	83 ec 0c             	sub    $0xc,%esp
 6fd:	6a 00                	push   $0x0
 6ff:	b9 10 00 00 00       	mov    $0x10,%ecx
 704:	8b 45 08             	mov    0x8(%ebp),%eax
 707:	e8 b2 fe ff ff       	call   5be <printint>
        ap++;
 70c:	83 c7 04             	add    $0x4,%edi
 70f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 712:	83 c4 10             	add    $0x10,%esp
      state = 0;
 715:	be 00 00 00 00       	mov    $0x0,%esi
 71a:	e9 56 ff ff ff       	jmp    675 <printf+0x2c>
        s = (char*)*ap;
 71f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 722:	8b 30                	mov    (%eax),%esi
        ap++;
 724:	83 c0 04             	add    $0x4,%eax
 727:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 72a:	85 f6                	test   %esi,%esi
 72c:	75 15                	jne    743 <printf+0xfa>
          s = "(null)";
 72e:	be c7 09 00 00       	mov    $0x9c7,%esi
 733:	eb 0e                	jmp    743 <printf+0xfa>
          putc(fd, *s);
 735:	0f be d2             	movsbl %dl,%edx
 738:	8b 45 08             	mov    0x8(%ebp),%eax
 73b:	e8 64 fe ff ff       	call   5a4 <putc>
          s++;
 740:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 743:	0f b6 16             	movzbl (%esi),%edx
 746:	84 d2                	test   %dl,%dl
 748:	75 eb                	jne    735 <printf+0xec>
      state = 0;
 74a:	be 00 00 00 00       	mov    $0x0,%esi
 74f:	e9 21 ff ff ff       	jmp    675 <printf+0x2c>
        putc(fd, *ap);
 754:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 757:	0f be 17             	movsbl (%edi),%edx
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
 75d:	e8 42 fe ff ff       	call   5a4 <putc>
        ap++;
 762:	83 c7 04             	add    $0x4,%edi
 765:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 768:	be 00 00 00 00       	mov    $0x0,%esi
 76d:	e9 03 ff ff ff       	jmp    675 <printf+0x2c>
        putc(fd, c);
 772:	89 fa                	mov    %edi,%edx
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	e8 28 fe ff ff       	call   5a4 <putc>
      state = 0;
 77c:	be 00 00 00 00       	mov    $0x0,%esi
 781:	e9 ef fe ff ff       	jmp    675 <printf+0x2c>
        putc(fd, '%');
 786:	ba 25 00 00 00       	mov    $0x25,%edx
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	e8 11 fe ff ff       	call   5a4 <putc>
        putc(fd, c);
 793:	89 fa                	mov    %edi,%edx
 795:	8b 45 08             	mov    0x8(%ebp),%eax
 798:	e8 07 fe ff ff       	call   5a4 <putc>
      state = 0;
 79d:	be 00 00 00 00       	mov    $0x0,%esi
 7a2:	e9 ce fe ff ff       	jmp    675 <printf+0x2c>
    }
  }
}
 7a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7aa:	5b                   	pop    %ebx
 7ab:	5e                   	pop    %esi
 7ac:	5f                   	pop    %edi
 7ad:	5d                   	pop    %ebp
 7ae:	c3                   	ret    

000007af <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7af:	55                   	push   %ebp
 7b0:	89 e5                	mov    %esp,%ebp
 7b2:	57                   	push   %edi
 7b3:	56                   	push   %esi
 7b4:	53                   	push   %ebx
 7b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bb:	a1 9c 0d 00 00       	mov    0xd9c,%eax
 7c0:	eb 02                	jmp    7c4 <free+0x15>
 7c2:	89 d0                	mov    %edx,%eax
 7c4:	39 c8                	cmp    %ecx,%eax
 7c6:	73 04                	jae    7cc <free+0x1d>
 7c8:	39 08                	cmp    %ecx,(%eax)
 7ca:	77 12                	ja     7de <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7cc:	8b 10                	mov    (%eax),%edx
 7ce:	39 c2                	cmp    %eax,%edx
 7d0:	77 f0                	ja     7c2 <free+0x13>
 7d2:	39 c8                	cmp    %ecx,%eax
 7d4:	72 08                	jb     7de <free+0x2f>
 7d6:	39 ca                	cmp    %ecx,%edx
 7d8:	77 04                	ja     7de <free+0x2f>
 7da:	89 d0                	mov    %edx,%eax
 7dc:	eb e6                	jmp    7c4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7de:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7e4:	8b 10                	mov    (%eax),%edx
 7e6:	39 d7                	cmp    %edx,%edi
 7e8:	74 19                	je     803 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ed:	8b 50 04             	mov    0x4(%eax),%edx
 7f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f3:	39 ce                	cmp    %ecx,%esi
 7f5:	74 1b                	je     812 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7f7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7f9:	a3 9c 0d 00 00       	mov    %eax,0xd9c
}
 7fe:	5b                   	pop    %ebx
 7ff:	5e                   	pop    %esi
 800:	5f                   	pop    %edi
 801:	5d                   	pop    %ebp
 802:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 803:	03 72 04             	add    0x4(%edx),%esi
 806:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 809:	8b 10                	mov    (%eax),%edx
 80b:	8b 12                	mov    (%edx),%edx
 80d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 810:	eb db                	jmp    7ed <free+0x3e>
    p->s.size += bp->s.size;
 812:	03 53 fc             	add    -0x4(%ebx),%edx
 815:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 818:	8b 53 f8             	mov    -0x8(%ebx),%edx
 81b:	89 10                	mov    %edx,(%eax)
 81d:	eb da                	jmp    7f9 <free+0x4a>

0000081f <morecore>:

static Header*
morecore(uint nu)
{
 81f:	55                   	push   %ebp
 820:	89 e5                	mov    %esp,%ebp
 822:	53                   	push   %ebx
 823:	83 ec 04             	sub    $0x4,%esp
 826:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 828:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 82d:	77 05                	ja     834 <morecore+0x15>
    nu = 4096;
 82f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 834:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 83b:	83 ec 0c             	sub    $0xc,%esp
 83e:	50                   	push   %eax
 83f:	e8 38 fd ff ff       	call   57c <sbrk>
  if(p == (char*)-1)
 844:	83 c4 10             	add    $0x10,%esp
 847:	83 f8 ff             	cmp    $0xffffffff,%eax
 84a:	74 1c                	je     868 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 84c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 84f:	83 c0 08             	add    $0x8,%eax
 852:	83 ec 0c             	sub    $0xc,%esp
 855:	50                   	push   %eax
 856:	e8 54 ff ff ff       	call   7af <free>
  return freep;
 85b:	a1 9c 0d 00 00       	mov    0xd9c,%eax
 860:	83 c4 10             	add    $0x10,%esp
}
 863:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 866:	c9                   	leave  
 867:	c3                   	ret    
    return 0;
 868:	b8 00 00 00 00       	mov    $0x0,%eax
 86d:	eb f4                	jmp    863 <morecore+0x44>

0000086f <malloc>:

void*
malloc(uint nbytes)
{
 86f:	55                   	push   %ebp
 870:	89 e5                	mov    %esp,%ebp
 872:	53                   	push   %ebx
 873:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	8d 58 07             	lea    0x7(%eax),%ebx
 87c:	c1 eb 03             	shr    $0x3,%ebx
 87f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 882:	8b 0d 9c 0d 00 00    	mov    0xd9c,%ecx
 888:	85 c9                	test   %ecx,%ecx
 88a:	74 04                	je     890 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88c:	8b 01                	mov    (%ecx),%eax
 88e:	eb 4a                	jmp    8da <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 9c 0d 00 00 a0 	movl   $0xda0,0xd9c
 897:	0d 00 00 
 89a:	c7 05 a0 0d 00 00 a0 	movl   $0xda0,0xda0
 8a1:	0d 00 00 
    base.s.size = 0;
 8a4:	c7 05 a4 0d 00 00 00 	movl   $0x0,0xda4
 8ab:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8ae:	b9 a0 0d 00 00       	mov    $0xda0,%ecx
 8b3:	eb d7                	jmp    88c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8b5:	74 19                	je     8d0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8b7:	29 da                	sub    %ebx,%edx
 8b9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8bc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8bf:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8c2:	89 0d 9c 0d 00 00    	mov    %ecx,0xd9c
      return (void*)(p + 1);
 8c8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ce:	c9                   	leave  
 8cf:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 10                	mov    (%eax),%edx
 8d2:	89 11                	mov    %edx,(%ecx)
 8d4:	eb ec                	jmp    8c2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d6:	89 c1                	mov    %eax,%ecx
 8d8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8da:	8b 50 04             	mov    0x4(%eax),%edx
 8dd:	39 da                	cmp    %ebx,%edx
 8df:	73 d4                	jae    8b5 <malloc+0x46>
    if(p == freep)
 8e1:	39 05 9c 0d 00 00    	cmp    %eax,0xd9c
 8e7:	75 ed                	jne    8d6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8e9:	89 d8                	mov    %ebx,%eax
 8eb:	e8 2f ff ff ff       	call   81f <morecore>
 8f0:	85 c0                	test   %eax,%eax
 8f2:	75 e2                	jne    8d6 <malloc+0x67>
 8f4:	eb d5                	jmp    8cb <malloc+0x5c>
