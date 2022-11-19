
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
   8:	68 fc 08 00 00       	push   $0x8fc
   d:	6a 03                	push   $0x3
   f:	e8 03 05 00 00       	call   517 <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 03 09 00 00       	push   $0x903
  23:	68 0c 09 00 00       	push   $0x90c
  28:	6a 01                	push   $0x1
  2a:	e8 1d 06 00 00       	call   64c <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 14 09 00 00       	push   $0x914
  37:	68 30 09 00 00       	push   $0x930
  3c:	6a 01                	push   $0x1
  3e:	e8 09 06 00 00       	call   64c <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 44 09 00 00       	push   $0x944
  4b:	6a 01                	push   $0x1
  4d:	e8 fa 05 00 00       	call   64c <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 98 0d 00 00    	push   0xd98
  5b:	e8 c7 04 00 00       	call   527 <kill>
  60:	e8 92 04 00 00       	call   4f7 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 51 09 00 00       	push   $0x951
  72:	e8 c0 04 00 00       	call   537 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 94 0d 00 00 	lock xchg %eax,0xd94
   exit();
  7e:	e8 74 04 00 00       	call   4f7 <exit>

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
  96:	e8 dc 04 00 00       	call   577 <getpid>
  9b:	a3 98 0d 00 00       	mov    %eax,0xd98
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 c5 07 00 00       	call   872 <malloc>
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
  d2:	68 60 09 00 00       	push   $0x960
  d7:	e8 5b 04 00 00       	call   537 <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 03 09 00 00       	push   $0x903
  ef:	68 0c 09 00 00       	push   $0x90c
  f4:	6a 01                	push   $0x1
  f6:	e8 51 05 00 00       	call   64c <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 64 09 00 00       	push   $0x964
 103:	68 30 09 00 00       	push   $0x930
 108:	6a 01                	push   $0x1
 10a:	e8 3d 05 00 00       	call   64c <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 44 09 00 00       	push   $0x944
 117:	6a 01                	push   $0x1
 119:	e8 2e 05 00 00       	call   64c <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 98 0d 00 00    	push   0xd98
 127:	e8 fb 03 00 00       	call   527 <kill>
 12c:	e8 c6 03 00 00       	call   4f7 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 03 09 00 00       	push   $0x903
 138:	68 0c 09 00 00       	push   $0x90c
 13d:	6a 01                	push   $0x1
 13f:	e8 08 05 00 00       	call   64c <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 56 09 00 00       	push   $0x956
 14c:	68 30 09 00 00       	push   $0x930
 151:	6a 01                	push   $0x1
 153:	e8 f4 04 00 00       	call   64c <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 44 09 00 00       	push   $0x944
 160:	6a 01                	push   $0x1
 162:	e8 e5 04 00 00       	call   64c <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 98 0d 00 00    	push   0xd98
 170:	e8 b2 03 00 00       	call   527 <kill>
 175:	e8 7d 03 00 00       	call   4f7 <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 07 04 00 00       	call   597 <clone>
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
 1ac:	68 7a 09 00 00       	push   $0x97a
 1b1:	50                   	push   %eax
 1b2:	e8 60 03 00 00       	call   517 <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 03 09 00 00       	push   $0x903
 1ca:	68 0c 09 00 00       	push   $0x90c
 1cf:	6a 01                	push   $0x1
 1d1:	e8 76 04 00 00       	call   64c <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 a8 09 00 00       	push   $0x9a8
 1de:	68 30 09 00 00       	push   $0x930
 1e3:	6a 01                	push   $0x1
 1e5:	e8 62 04 00 00       	call   64c <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 44 09 00 00       	push   $0x944
 1f2:	6a 01                	push   $0x1
 1f4:	e8 53 04 00 00       	call   64c <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 98 0d 00 00    	push   0xd98
 202:	e8 20 03 00 00       	call   527 <kill>
 207:	e8 eb 02 00 00       	call   4f7 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 03 09 00 00       	push   $0x903
 213:	68 0c 09 00 00       	push   $0x90c
 218:	6a 01                	push   $0x1
 21a:	e8 2d 04 00 00       	call   64c <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 6c 09 00 00       	push   $0x96c
 227:	68 30 09 00 00       	push   $0x930
 22c:	6a 01                	push   $0x1
 22e:	e8 19 04 00 00       	call   64c <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 44 09 00 00       	push   $0x944
 23b:	6a 01                	push   $0x1
 23d:	e8 0a 04 00 00       	call   64c <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 98 0d 00 00    	push   0xd98
 24b:	e8 d7 02 00 00       	call   527 <kill>
 250:	e8 a2 02 00 00       	call   4f7 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 83 09 00 00       	push   $0x983
 25d:	6a 01                	push   $0x1
 25f:	e8 e8 03 00 00       	call   64c <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 30 03 00 00       	call   59f <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 03 09 00 00       	push   $0x903
 27d:	68 0c 09 00 00       	push   $0x90c
 282:	6a 01                	push   $0x1
 284:	e8 c3 03 00 00       	call   64c <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 90 09 00 00       	push   $0x990
 291:	68 30 09 00 00       	push   $0x930
 296:	6a 01                	push   $0x1
 298:	e8 af 03 00 00       	call   64c <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 44 09 00 00       	push   $0x944
 2a5:	6a 01                	push   $0x1
 2a7:	e8 a0 03 00 00       	call   64c <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 98 0d 00 00    	push   0xd98
 2b5:	e8 6d 02 00 00       	call   527 <kill>
 2ba:	e8 38 02 00 00       	call   4f7 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 ea 04 00 00       	call   7b2 <free>
   exit();
 2c8:	e8 2a 02 00 00       	call   4f7 <exit>

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
 393:	e8 77 01 00 00       	call   50f <read>
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
 3d1:	e8 61 01 00 00       	call   537 <open>
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
 3e6:	e8 64 01 00 00       	call   54f <fstat>
 3eb:	89 c6                	mov    %eax,%esi
  close(fd);
 3ed:	89 1c 24             	mov    %ebx,(%esp)
 3f0:	e8 2a 01 00 00       	call   51f <close>
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

  void* stack = malloc(2 * PGSIZE);
 46a:	68 00 20 00 00       	push   $0x2000
 46f:	e8 fe 03 00 00       	call   872 <malloc>
  if ((uint)stack%PGSIZE){
 474:	83 c4 10             	add    $0x10,%esp
 477:	a9 ff 0f 00 00       	test   $0xfff,%eax
 47c:	74 0a                	je     488 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 47e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 483:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 488:	50                   	push   %eax
 489:	ff 75 10             	push   0x10(%ebp)
 48c:	ff 75 0c             	push   0xc(%ebp)
 48f:	ff 75 08             	push   0x8(%ebp)
 492:	e8 00 01 00 00       	call   597 <clone>
}
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <thread_join>:

int thread_join(){
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	53                   	push   %ebx
 49d:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 4a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a3:	50                   	push   %eax
 4a4:	e8 f6 00 00 00       	call   59f <join>
 4a9:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 4ab:	83 c4 04             	add    $0x4,%esp
 4ae:	ff 75 f4             	push   -0xc(%ebp)
 4b1:	e8 fc 02 00 00       	call   7b2 <free>
  return x;
}
 4b6:	89 d8                	mov    %ebx,%eax
 4b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4bb:	c9                   	leave  
 4bc:	c3                   	ret    

000004bd <lock_init>:

void lock_init(lock_t *spin){
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 4c0:	8b 45 08             	mov    0x8(%ebp),%eax
 4c3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4c9:	5d                   	pop    %ebp
 4ca:	c3                   	ret    

000004cb <lock_acquire>:

void lock_acquire(lock_t *spin){
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("lock; xchgl %0, %1" :
 4d1:	b8 01 00 00 00       	mov    $0x1,%eax
 4d6:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4d9:	85 c0                	test   %eax,%eax
 4db:	75 f4                	jne    4d1 <lock_acquire+0x6>

}
 4dd:	5d                   	pop    %ebp
 4de:	c3                   	ret    

000004df <lock_release>:

void lock_release(lock_t *spin){
 4df:	55                   	push   %ebp
 4e0:	89 e5                	mov    %esp,%ebp
 4e2:	8b 55 08             	mov    0x8(%ebp),%edx
 4e5:	b8 00 00 00 00       	mov    $0x0,%eax
 4ea:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 4ed:	5d                   	pop    %ebp
 4ee:	c3                   	ret    

000004ef <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ef:	b8 01 00 00 00       	mov    $0x1,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <exit>:
SYSCALL(exit)
 4f7:	b8 02 00 00 00       	mov    $0x2,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <wait>:
SYSCALL(wait)
 4ff:	b8 03 00 00 00       	mov    $0x3,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <pipe>:
SYSCALL(pipe)
 507:	b8 04 00 00 00       	mov    $0x4,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <read>:
SYSCALL(read)
 50f:	b8 05 00 00 00       	mov    $0x5,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <write>:
SYSCALL(write)
 517:	b8 10 00 00 00       	mov    $0x10,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <close>:
SYSCALL(close)
 51f:	b8 15 00 00 00       	mov    $0x15,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <kill>:
SYSCALL(kill)
 527:	b8 06 00 00 00       	mov    $0x6,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <exec>:
SYSCALL(exec)
 52f:	b8 07 00 00 00       	mov    $0x7,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <open>:
SYSCALL(open)
 537:	b8 0f 00 00 00       	mov    $0xf,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <mknod>:
SYSCALL(mknod)
 53f:	b8 11 00 00 00       	mov    $0x11,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <unlink>:
SYSCALL(unlink)
 547:	b8 12 00 00 00       	mov    $0x12,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <fstat>:
SYSCALL(fstat)
 54f:	b8 08 00 00 00       	mov    $0x8,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <link>:
SYSCALL(link)
 557:	b8 13 00 00 00       	mov    $0x13,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <mkdir>:
SYSCALL(mkdir)
 55f:	b8 14 00 00 00       	mov    $0x14,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <chdir>:
SYSCALL(chdir)
 567:	b8 09 00 00 00       	mov    $0x9,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <dup>:
SYSCALL(dup)
 56f:	b8 0a 00 00 00       	mov    $0xa,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <getpid>:
SYSCALL(getpid)
 577:	b8 0b 00 00 00       	mov    $0xb,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <sbrk>:
SYSCALL(sbrk)
 57f:	b8 0c 00 00 00       	mov    $0xc,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <sleep>:
SYSCALL(sleep)
 587:	b8 0d 00 00 00       	mov    $0xd,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <uptime>:
SYSCALL(uptime)
 58f:	b8 0e 00 00 00       	mov    $0xe,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <clone>:
SYSCALL(clone)
 597:	b8 16 00 00 00       	mov    $0x16,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <join>:
 59f:	b8 17 00 00 00       	mov    $0x17,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a7:	55                   	push   %ebp
 5a8:	89 e5                	mov    %esp,%ebp
 5aa:	83 ec 1c             	sub    $0x1c,%esp
 5ad:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5b0:	6a 01                	push   $0x1
 5b2:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5b5:	52                   	push   %edx
 5b6:	50                   	push   %eax
 5b7:	e8 5b ff ff ff       	call   517 <write>
}
 5bc:	83 c4 10             	add    $0x10,%esp
 5bf:	c9                   	leave  
 5c0:	c3                   	ret    

000005c1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c1:	55                   	push   %ebp
 5c2:	89 e5                	mov    %esp,%ebp
 5c4:	57                   	push   %edi
 5c5:	56                   	push   %esi
 5c6:	53                   	push   %ebx
 5c7:	83 ec 2c             	sub    $0x2c,%esp
 5ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5cd:	89 d0                	mov    %edx,%eax
 5cf:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5d5:	0f 95 c1             	setne  %cl
 5d8:	c1 ea 1f             	shr    $0x1f,%edx
 5db:	84 d1                	test   %dl,%cl
 5dd:	74 44                	je     623 <printint+0x62>
    neg = 1;
    x = -xx;
 5df:	f7 d8                	neg    %eax
 5e1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5e3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5ea:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5ef:	89 c8                	mov    %ecx,%eax
 5f1:	ba 00 00 00 00       	mov    $0x0,%edx
 5f6:	f7 f6                	div    %esi
 5f8:	89 df                	mov    %ebx,%edi
 5fa:	83 c3 01             	add    $0x1,%ebx
 5fd:	0f b6 92 2c 0a 00 00 	movzbl 0xa2c(%edx),%edx
 604:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 608:	89 ca                	mov    %ecx,%edx
 60a:	89 c1                	mov    %eax,%ecx
 60c:	39 d6                	cmp    %edx,%esi
 60e:	76 df                	jbe    5ef <printint+0x2e>
  if(neg)
 610:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 614:	74 31                	je     647 <printint+0x86>
    buf[i++] = '-';
 616:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 61b:	8d 5f 02             	lea    0x2(%edi),%ebx
 61e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 621:	eb 17                	jmp    63a <printint+0x79>
    x = xx;
 623:	89 c1                	mov    %eax,%ecx
  neg = 0;
 625:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 62c:	eb bc                	jmp    5ea <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 62e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 633:	89 f0                	mov    %esi,%eax
 635:	e8 6d ff ff ff       	call   5a7 <putc>
  while(--i >= 0)
 63a:	83 eb 01             	sub    $0x1,%ebx
 63d:	79 ef                	jns    62e <printint+0x6d>
}
 63f:	83 c4 2c             	add    $0x2c,%esp
 642:	5b                   	pop    %ebx
 643:	5e                   	pop    %esi
 644:	5f                   	pop    %edi
 645:	5d                   	pop    %ebp
 646:	c3                   	ret    
 647:	8b 75 d0             	mov    -0x30(%ebp),%esi
 64a:	eb ee                	jmp    63a <printint+0x79>

0000064c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 64c:	55                   	push   %ebp
 64d:	89 e5                	mov    %esp,%ebp
 64f:	57                   	push   %edi
 650:	56                   	push   %esi
 651:	53                   	push   %ebx
 652:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 655:	8d 45 10             	lea    0x10(%ebp),%eax
 658:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 65b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 660:	bb 00 00 00 00       	mov    $0x0,%ebx
 665:	eb 14                	jmp    67b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 667:	89 fa                	mov    %edi,%edx
 669:	8b 45 08             	mov    0x8(%ebp),%eax
 66c:	e8 36 ff ff ff       	call   5a7 <putc>
 671:	eb 05                	jmp    678 <printf+0x2c>
      }
    } else if(state == '%'){
 673:	83 fe 25             	cmp    $0x25,%esi
 676:	74 25                	je     69d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 678:	83 c3 01             	add    $0x1,%ebx
 67b:	8b 45 0c             	mov    0xc(%ebp),%eax
 67e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 682:	84 c0                	test   %al,%al
 684:	0f 84 20 01 00 00    	je     7aa <printf+0x15e>
    c = fmt[i] & 0xff;
 68a:	0f be f8             	movsbl %al,%edi
 68d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 690:	85 f6                	test   %esi,%esi
 692:	75 df                	jne    673 <printf+0x27>
      if(c == '%'){
 694:	83 f8 25             	cmp    $0x25,%eax
 697:	75 ce                	jne    667 <printf+0x1b>
        state = '%';
 699:	89 c6                	mov    %eax,%esi
 69b:	eb db                	jmp    678 <printf+0x2c>
      if(c == 'd'){
 69d:	83 f8 25             	cmp    $0x25,%eax
 6a0:	0f 84 cf 00 00 00    	je     775 <printf+0x129>
 6a6:	0f 8c dd 00 00 00    	jl     789 <printf+0x13d>
 6ac:	83 f8 78             	cmp    $0x78,%eax
 6af:	0f 8f d4 00 00 00    	jg     789 <printf+0x13d>
 6b5:	83 f8 63             	cmp    $0x63,%eax
 6b8:	0f 8c cb 00 00 00    	jl     789 <printf+0x13d>
 6be:	83 e8 63             	sub    $0x63,%eax
 6c1:	83 f8 15             	cmp    $0x15,%eax
 6c4:	0f 87 bf 00 00 00    	ja     789 <printf+0x13d>
 6ca:	ff 24 85 d4 09 00 00 	jmp    *0x9d4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6d1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d4:	8b 17                	mov    (%edi),%edx
 6d6:	83 ec 0c             	sub    $0xc,%esp
 6d9:	6a 01                	push   $0x1
 6db:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e0:	8b 45 08             	mov    0x8(%ebp),%eax
 6e3:	e8 d9 fe ff ff       	call   5c1 <printint>
        ap++;
 6e8:	83 c7 04             	add    $0x4,%edi
 6eb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ee:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f1:	be 00 00 00 00       	mov    $0x0,%esi
 6f6:	eb 80                	jmp    678 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6f8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6fb:	8b 17                	mov    (%edi),%edx
 6fd:	83 ec 0c             	sub    $0xc,%esp
 700:	6a 00                	push   $0x0
 702:	b9 10 00 00 00       	mov    $0x10,%ecx
 707:	8b 45 08             	mov    0x8(%ebp),%eax
 70a:	e8 b2 fe ff ff       	call   5c1 <printint>
        ap++;
 70f:	83 c7 04             	add    $0x4,%edi
 712:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 715:	83 c4 10             	add    $0x10,%esp
      state = 0;
 718:	be 00 00 00 00       	mov    $0x0,%esi
 71d:	e9 56 ff ff ff       	jmp    678 <printf+0x2c>
        s = (char*)*ap;
 722:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 725:	8b 30                	mov    (%eax),%esi
        ap++;
 727:	83 c0 04             	add    $0x4,%eax
 72a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 72d:	85 f6                	test   %esi,%esi
 72f:	75 15                	jne    746 <printf+0xfa>
          s = "(null)";
 731:	be cb 09 00 00       	mov    $0x9cb,%esi
 736:	eb 0e                	jmp    746 <printf+0xfa>
          putc(fd, *s);
 738:	0f be d2             	movsbl %dl,%edx
 73b:	8b 45 08             	mov    0x8(%ebp),%eax
 73e:	e8 64 fe ff ff       	call   5a7 <putc>
          s++;
 743:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 746:	0f b6 16             	movzbl (%esi),%edx
 749:	84 d2                	test   %dl,%dl
 74b:	75 eb                	jne    738 <printf+0xec>
      state = 0;
 74d:	be 00 00 00 00       	mov    $0x0,%esi
 752:	e9 21 ff ff ff       	jmp    678 <printf+0x2c>
        putc(fd, *ap);
 757:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 75a:	0f be 17             	movsbl (%edi),%edx
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	e8 42 fe ff ff       	call   5a7 <putc>
        ap++;
 765:	83 c7 04             	add    $0x4,%edi
 768:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 76b:	be 00 00 00 00       	mov    $0x0,%esi
 770:	e9 03 ff ff ff       	jmp    678 <printf+0x2c>
        putc(fd, c);
 775:	89 fa                	mov    %edi,%edx
 777:	8b 45 08             	mov    0x8(%ebp),%eax
 77a:	e8 28 fe ff ff       	call   5a7 <putc>
      state = 0;
 77f:	be 00 00 00 00       	mov    $0x0,%esi
 784:	e9 ef fe ff ff       	jmp    678 <printf+0x2c>
        putc(fd, '%');
 789:	ba 25 00 00 00       	mov    $0x25,%edx
 78e:	8b 45 08             	mov    0x8(%ebp),%eax
 791:	e8 11 fe ff ff       	call   5a7 <putc>
        putc(fd, c);
 796:	89 fa                	mov    %edi,%edx
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	e8 07 fe ff ff       	call   5a7 <putc>
      state = 0;
 7a0:	be 00 00 00 00       	mov    $0x0,%esi
 7a5:	e9 ce fe ff ff       	jmp    678 <printf+0x2c>
    }
  }
}
 7aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ad:	5b                   	pop    %ebx
 7ae:	5e                   	pop    %esi
 7af:	5f                   	pop    %edi
 7b0:	5d                   	pop    %ebp
 7b1:	c3                   	ret    

000007b2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b2:	55                   	push   %ebp
 7b3:	89 e5                	mov    %esp,%ebp
 7b5:	57                   	push   %edi
 7b6:	56                   	push   %esi
 7b7:	53                   	push   %ebx
 7b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7bb:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7be:	a1 9c 0d 00 00       	mov    0xd9c,%eax
 7c3:	eb 02                	jmp    7c7 <free+0x15>
 7c5:	89 d0                	mov    %edx,%eax
 7c7:	39 c8                	cmp    %ecx,%eax
 7c9:	73 04                	jae    7cf <free+0x1d>
 7cb:	39 08                	cmp    %ecx,(%eax)
 7cd:	77 12                	ja     7e1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7cf:	8b 10                	mov    (%eax),%edx
 7d1:	39 c2                	cmp    %eax,%edx
 7d3:	77 f0                	ja     7c5 <free+0x13>
 7d5:	39 c8                	cmp    %ecx,%eax
 7d7:	72 08                	jb     7e1 <free+0x2f>
 7d9:	39 ca                	cmp    %ecx,%edx
 7db:	77 04                	ja     7e1 <free+0x2f>
 7dd:	89 d0                	mov    %edx,%eax
 7df:	eb e6                	jmp    7c7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7e7:	8b 10                	mov    (%eax),%edx
 7e9:	39 d7                	cmp    %edx,%edi
 7eb:	74 19                	je     806 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7f0:	8b 50 04             	mov    0x4(%eax),%edx
 7f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f6:	39 ce                	cmp    %ecx,%esi
 7f8:	74 1b                	je     815 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7fa:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7fc:	a3 9c 0d 00 00       	mov    %eax,0xd9c
}
 801:	5b                   	pop    %ebx
 802:	5e                   	pop    %esi
 803:	5f                   	pop    %edi
 804:	5d                   	pop    %ebp
 805:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 806:	03 72 04             	add    0x4(%edx),%esi
 809:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 80c:	8b 10                	mov    (%eax),%edx
 80e:	8b 12                	mov    (%edx),%edx
 810:	89 53 f8             	mov    %edx,-0x8(%ebx)
 813:	eb db                	jmp    7f0 <free+0x3e>
    p->s.size += bp->s.size;
 815:	03 53 fc             	add    -0x4(%ebx),%edx
 818:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 81b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 81e:	89 10                	mov    %edx,(%eax)
 820:	eb da                	jmp    7fc <free+0x4a>

00000822 <morecore>:

static Header*
morecore(uint nu)
{
 822:	55                   	push   %ebp
 823:	89 e5                	mov    %esp,%ebp
 825:	53                   	push   %ebx
 826:	83 ec 04             	sub    $0x4,%esp
 829:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 82b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 830:	77 05                	ja     837 <morecore+0x15>
    nu = 4096;
 832:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 837:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 83e:	83 ec 0c             	sub    $0xc,%esp
 841:	50                   	push   %eax
 842:	e8 38 fd ff ff       	call   57f <sbrk>
  if(p == (char*)-1)
 847:	83 c4 10             	add    $0x10,%esp
 84a:	83 f8 ff             	cmp    $0xffffffff,%eax
 84d:	74 1c                	je     86b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 84f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 852:	83 c0 08             	add    $0x8,%eax
 855:	83 ec 0c             	sub    $0xc,%esp
 858:	50                   	push   %eax
 859:	e8 54 ff ff ff       	call   7b2 <free>
  return freep;
 85e:	a1 9c 0d 00 00       	mov    0xd9c,%eax
 863:	83 c4 10             	add    $0x10,%esp
}
 866:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 869:	c9                   	leave  
 86a:	c3                   	ret    
    return 0;
 86b:	b8 00 00 00 00       	mov    $0x0,%eax
 870:	eb f4                	jmp    866 <morecore+0x44>

00000872 <malloc>:

void*
malloc(uint nbytes)
{
 872:	55                   	push   %ebp
 873:	89 e5                	mov    %esp,%ebp
 875:	53                   	push   %ebx
 876:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 879:	8b 45 08             	mov    0x8(%ebp),%eax
 87c:	8d 58 07             	lea    0x7(%eax),%ebx
 87f:	c1 eb 03             	shr    $0x3,%ebx
 882:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 885:	8b 0d 9c 0d 00 00    	mov    0xd9c,%ecx
 88b:	85 c9                	test   %ecx,%ecx
 88d:	74 04                	je     893 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88f:	8b 01                	mov    (%ecx),%eax
 891:	eb 4a                	jmp    8dd <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 893:	c7 05 9c 0d 00 00 a0 	movl   $0xda0,0xd9c
 89a:	0d 00 00 
 89d:	c7 05 a0 0d 00 00 a0 	movl   $0xda0,0xda0
 8a4:	0d 00 00 
    base.s.size = 0;
 8a7:	c7 05 a4 0d 00 00 00 	movl   $0x0,0xda4
 8ae:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8b1:	b9 a0 0d 00 00       	mov    $0xda0,%ecx
 8b6:	eb d7                	jmp    88f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8b8:	74 19                	je     8d3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8ba:	29 da                	sub    %ebx,%edx
 8bc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8bf:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8c2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8c5:	89 0d 9c 0d 00 00    	mov    %ecx,0xd9c
      return (void*)(p + 1);
 8cb:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d1:	c9                   	leave  
 8d2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8d3:	8b 10                	mov    (%eax),%edx
 8d5:	89 11                	mov    %edx,(%ecx)
 8d7:	eb ec                	jmp    8c5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d9:	89 c1                	mov    %eax,%ecx
 8db:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8dd:	8b 50 04             	mov    0x4(%eax),%edx
 8e0:	39 da                	cmp    %ebx,%edx
 8e2:	73 d4                	jae    8b8 <malloc+0x46>
    if(p == freep)
 8e4:	39 05 9c 0d 00 00    	cmp    %eax,0xd9c
 8ea:	75 ed                	jne    8d9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8ec:	89 d8                	mov    %ebx,%eax
 8ee:	e8 2f ff ff ff       	call   822 <morecore>
 8f3:	85 c0                	test   %eax,%eax
 8f5:	75 e2                	jne    8d9 <malloc+0x67>
 8f7:	eb d5                	jmp    8ce <malloc+0x5c>
