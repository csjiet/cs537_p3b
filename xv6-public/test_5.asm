
_test_5:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 e0 0d 00 00       	mov    0xde0,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 60 09 00 00       	push   $0x960
  31:	68 69 09 00 00       	push   $0x969
  36:	6a 01                	push   $0x1
  38:	e8 75 06 00 00       	call   6b2 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 a8 09 00 00       	push   $0x9a8
  45:	68 7c 09 00 00       	push   $0x97c
  4a:	6a 01                	push   $0x1
  4c:	e8 61 06 00 00       	call   6b2 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 90 09 00 00       	push   $0x990
  59:	6a 01                	push   $0x1
  5b:	e8 52 06 00 00       	call   6b2 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 e4 0d 00 00    	push   0xde4
  69:	e8 1f 05 00 00       	call   58d <kill>
  6e:	e8 ea 04 00 00       	call   55d <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 60 09 00 00       	push   $0x960
  7a:	68 69 09 00 00       	push   $0x969
  7f:	6a 01                	push   $0x1
  81:	e8 2c 06 00 00       	call   6b2 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 71 09 00 00       	push   $0x971
  8e:	68 7c 09 00 00       	push   $0x97c
  93:	6a 01                	push   $0x1
  95:	e8 18 06 00 00       	call   6b2 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 90 09 00 00       	push   $0x990
  a2:	6a 01                	push   $0x1
  a4:	e8 09 06 00 00       	call   6b2 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 e4 0d 00 00    	push   0xde4
  b2:	e8 d6 04 00 00       	call   58d <kill>
  b7:	e8 a1 04 00 00       	call   55d <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 60 09 00 00       	push   $0x960
  c3:	68 69 09 00 00       	push   $0x969
  c8:	6a 01                	push   $0x1
  ca:	e8 e3 05 00 00       	call   6b2 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 9d 09 00 00       	push   $0x99d
  d7:	68 7c 09 00 00       	push   $0x97c
  dc:	6a 01                	push   $0x1
  de:	e8 cf 05 00 00       	call   6b2 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 90 09 00 00       	push   $0x990
  eb:	6a 01                	push   $0x1
  ed:	e8 c0 05 00 00       	call   6b2 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 e4 0d 00 00    	push   0xde4
  fb:	e8 8d 04 00 00       	call   58d <kill>
 100:	e8 58 04 00 00       	call   55d <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 e0 0d 00 00       	mov    %eax,0xde0
   exit();
 10d:	e8 4b 04 00 00       	call   55d <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 b2 04 00 00       	call   5dd <getpid>
 12b:	a3 e4 0d 00 00       	mov    %eax,0xde4
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 9b 07 00 00       	call   8d8 <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 60 09 00 00       	push   $0x960
 15f:	68 69 09 00 00       	push   $0x969
 164:	6a 01                	push   $0x1
 166:	e8 47 05 00 00       	call   6b2 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 b4 09 00 00       	push   $0x9b4
 173:	68 7c 09 00 00       	push   $0x97c
 178:	6a 01                	push   $0x1
 17a:	e8 33 05 00 00       	call   6b2 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 90 09 00 00       	push   $0x990
 187:	6a 01                	push   $0x1
 189:	e8 24 05 00 00       	call   6b2 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 e4 0d 00 00    	push   0xde4
 197:	e8 f1 03 00 00       	call   58d <kill>
 19c:	e8 bc 03 00 00       	call   55d <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 39 04 00 00       	call   5fd <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 2c 04 00 00       	call   605 <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 60 09 00 00       	push   $0x960
 1f4:	68 69 09 00 00       	push   $0x969
 1f9:	6a 01                	push   $0x1
 1fb:	e8 b2 04 00 00       	call   6b2 <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 e2 09 00 00       	push   $0x9e2
 208:	68 7c 09 00 00       	push   $0x97c
 20d:	6a 01                	push   $0x1
 20f:	e8 9e 04 00 00       	call   6b2 <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 90 09 00 00       	push   $0x990
 21c:	6a 01                	push   $0x1
 21e:	e8 8f 04 00 00       	call   6b2 <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 e4 0d 00 00    	push   0xde4
 22c:	e8 5c 03 00 00       	call   58d <kill>
 231:	e8 27 03 00 00       	call   55d <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 60 09 00 00       	push   $0x960
 23d:	68 69 09 00 00       	push   $0x969
 242:	6a 01                	push   $0x1
 244:	e8 69 04 00 00       	call   6b2 <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 be 09 00 00       	push   $0x9be
 251:	68 7c 09 00 00       	push   $0x97c
 256:	6a 01                	push   $0x1
 258:	e8 55 04 00 00       	call   6b2 <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 90 09 00 00       	push   $0x990
 265:	6a 01                	push   $0x1
 267:	e8 46 04 00 00       	call   6b2 <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 e4 0d 00 00    	push   0xde4
 275:	e8 13 03 00 00       	call   58d <kill>
 27a:	e8 de 02 00 00       	call   55d <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 60 09 00 00       	push   $0x960
 286:	68 69 09 00 00       	push   $0x969
 28b:	6a 01                	push   $0x1
 28d:	e8 20 04 00 00       	call   6b2 <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 cc 09 00 00       	push   $0x9cc
 29a:	68 7c 09 00 00       	push   $0x97c
 29f:	6a 01                	push   $0x1
 2a1:	e8 0c 04 00 00       	call   6b2 <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 90 09 00 00       	push   $0x990
 2ae:	6a 01                	push   $0x1
 2b0:	e8 fd 03 00 00       	call   6b2 <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 e4 0d 00 00    	push   0xde4
 2be:	e8 ca 02 00 00       	call   58d <kill>
 2c3:	e8 95 02 00 00       	call   55d <exit>
   assert(global == 2);
 2c8:	83 3d e0 0d 00 00 02 	cmpl   $0x2,0xde0
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 60 09 00 00       	push   $0x960
 2d8:	68 69 09 00 00       	push   $0x969
 2dd:	6a 01                	push   $0x1
 2df:	e8 ce 03 00 00       	call   6b2 <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 f6 09 00 00       	push   $0x9f6
 2ec:	68 7c 09 00 00       	push   $0x97c
 2f1:	6a 01                	push   $0x1
 2f3:	e8 ba 03 00 00       	call   6b2 <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 90 09 00 00       	push   $0x990
 300:	6a 01                	push   $0x1
 302:	e8 ab 03 00 00       	call   6b2 <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 e4 0d 00 00    	push   0xde4
 310:	e8 78 02 00 00       	call   58d <kill>
 315:	e8 43 02 00 00       	call   55d <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 02 0a 00 00       	push   $0xa02
 322:	6a 01                	push   $0x1
 324:	e8 89 03 00 00       	call   6b2 <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 e7 04 00 00       	call   818 <free>
   exit();
 331:	e8 27 02 00 00       	call   55d <exit>

00000336 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	56                   	push   %esi
 33a:	53                   	push   %ebx
 33b:	8b 75 08             	mov    0x8(%ebp),%esi
 33e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	89 f0                	mov    %esi,%eax
 343:	89 d1                	mov    %edx,%ecx
 345:	83 c2 01             	add    $0x1,%edx
 348:	89 c3                	mov    %eax,%ebx
 34a:	83 c0 01             	add    $0x1,%eax
 34d:	0f b6 09             	movzbl (%ecx),%ecx
 350:	88 0b                	mov    %cl,(%ebx)
 352:	84 c9                	test   %cl,%cl
 354:	75 ed                	jne    343 <strcpy+0xd>
    ;
  return os;
}
 356:	89 f0                	mov    %esi,%eax
 358:	5b                   	pop    %ebx
 359:	5e                   	pop    %esi
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 362:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 365:	eb 06                	jmp    36d <strcmp+0x11>
    p++, q++;
 367:	83 c1 01             	add    $0x1,%ecx
 36a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 36d:	0f b6 01             	movzbl (%ecx),%eax
 370:	84 c0                	test   %al,%al
 372:	74 04                	je     378 <strcmp+0x1c>
 374:	3a 02                	cmp    (%edx),%al
 376:	74 ef                	je     367 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 378:	0f b6 c0             	movzbl %al,%eax
 37b:	0f b6 12             	movzbl (%edx),%edx
 37e:	29 d0                	sub    %edx,%eax
}
 380:	5d                   	pop    %ebp
 381:	c3                   	ret    

00000382 <strlen>:

uint
strlen(const char *s)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 388:	b8 00 00 00 00       	mov    $0x0,%eax
 38d:	eb 03                	jmp    392 <strlen+0x10>
 38f:	83 c0 01             	add    $0x1,%eax
 392:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 396:	75 f7                	jne    38f <strlen+0xd>
    ;
  return n;
}
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <memset>:

void*
memset(void *dst, int c, uint n)
{
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
 39d:	57                   	push   %edi
 39e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3a1:	89 d7                	mov    %edx,%edi
 3a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	fc                   	cld    
 3aa:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ac:	89 d0                	mov    %edx,%eax
 3ae:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3b1:	c9                   	leave  
 3b2:	c3                   	ret    

000003b3 <strchr>:

char*
strchr(const char *s, char c)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3bd:	eb 03                	jmp    3c2 <strchr+0xf>
 3bf:	83 c0 01             	add    $0x1,%eax
 3c2:	0f b6 10             	movzbl (%eax),%edx
 3c5:	84 d2                	test   %dl,%dl
 3c7:	74 06                	je     3cf <strchr+0x1c>
    if(*s == c)
 3c9:	38 ca                	cmp    %cl,%dl
 3cb:	75 f2                	jne    3bf <strchr+0xc>
 3cd:	eb 05                	jmp    3d4 <strchr+0x21>
      return (char*)s;
  return 0;
 3cf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    

000003d6 <gets>:

char*
gets(char *buf, int max)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	57                   	push   %edi
 3da:	56                   	push   %esi
 3db:	53                   	push   %ebx
 3dc:	83 ec 1c             	sub    $0x1c,%esp
 3df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e7:	89 de                	mov    %ebx,%esi
 3e9:	83 c3 01             	add    $0x1,%ebx
 3ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ef:	7d 2e                	jge    41f <gets+0x49>
    cc = read(0, &c, 1);
 3f1:	83 ec 04             	sub    $0x4,%esp
 3f4:	6a 01                	push   $0x1
 3f6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f9:	50                   	push   %eax
 3fa:	6a 00                	push   $0x0
 3fc:	e8 74 01 00 00       	call   575 <read>
    if(cc < 1)
 401:	83 c4 10             	add    $0x10,%esp
 404:	85 c0                	test   %eax,%eax
 406:	7e 17                	jle    41f <gets+0x49>
      break;
    buf[i++] = c;
 408:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 40c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 40f:	3c 0a                	cmp    $0xa,%al
 411:	0f 94 c2             	sete   %dl
 414:	3c 0d                	cmp    $0xd,%al
 416:	0f 94 c0             	sete   %al
 419:	08 c2                	or     %al,%dl
 41b:	74 ca                	je     3e7 <gets+0x11>
    buf[i++] = c;
 41d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 41f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 423:	89 f8                	mov    %edi,%eax
 425:	8d 65 f4             	lea    -0xc(%ebp),%esp
 428:	5b                   	pop    %ebx
 429:	5e                   	pop    %esi
 42a:	5f                   	pop    %edi
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret    

0000042d <stat>:

int
stat(const char *n, struct stat *st)
{
 42d:	55                   	push   %ebp
 42e:	89 e5                	mov    %esp,%ebp
 430:	56                   	push   %esi
 431:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 432:	83 ec 08             	sub    $0x8,%esp
 435:	6a 00                	push   $0x0
 437:	ff 75 08             	push   0x8(%ebp)
 43a:	e8 5e 01 00 00       	call   59d <open>
  if(fd < 0)
 43f:	83 c4 10             	add    $0x10,%esp
 442:	85 c0                	test   %eax,%eax
 444:	78 24                	js     46a <stat+0x3d>
 446:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	ff 75 0c             	push   0xc(%ebp)
 44e:	50                   	push   %eax
 44f:	e8 61 01 00 00       	call   5b5 <fstat>
 454:	89 c6                	mov    %eax,%esi
  close(fd);
 456:	89 1c 24             	mov    %ebx,(%esp)
 459:	e8 27 01 00 00       	call   585 <close>
  return r;
 45e:	83 c4 10             	add    $0x10,%esp
}
 461:	89 f0                	mov    %esi,%eax
 463:	8d 65 f8             	lea    -0x8(%ebp),%esp
 466:	5b                   	pop    %ebx
 467:	5e                   	pop    %esi
 468:	5d                   	pop    %ebp
 469:	c3                   	ret    
    return -1;
 46a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 46f:	eb f0                	jmp    461 <stat+0x34>

00000471 <atoi>:

int
atoi(const char *s)
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	53                   	push   %ebx
 475:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 478:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 47d:	eb 10                	jmp    48f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 47f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 482:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 485:	83 c1 01             	add    $0x1,%ecx
 488:	0f be c0             	movsbl %al,%eax
 48b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 48f:	0f b6 01             	movzbl (%ecx),%eax
 492:	8d 58 d0             	lea    -0x30(%eax),%ebx
 495:	80 fb 09             	cmp    $0x9,%bl
 498:	76 e5                	jbe    47f <atoi+0xe>
  return n;
}
 49a:	89 d0                	mov    %edx,%eax
 49c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49f:	c9                   	leave  
 4a0:	c3                   	ret    

000004a1 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	8b 75 08             	mov    0x8(%ebp),%esi
 4a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ac:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4af:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4b1:	eb 0d                	jmp    4c0 <memmove+0x1f>
    *dst++ = *src++;
 4b3:	0f b6 01             	movzbl (%ecx),%eax
 4b6:	88 02                	mov    %al,(%edx)
 4b8:	8d 49 01             	lea    0x1(%ecx),%ecx
 4bb:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4be:	89 d8                	mov    %ebx,%eax
 4c0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4c3:	85 c0                	test   %eax,%eax
 4c5:	7f ec                	jg     4b3 <memmove+0x12>
  return vdst;
}
 4c7:	89 f0                	mov    %esi,%eax
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    

000004cd <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 4cd:	55                   	push   %ebp
 4ce:	89 e5                	mov    %esp,%ebp
 4d0:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 4d3:	68 00 10 00 00       	push   $0x1000
 4d8:	e8 fb 03 00 00       	call   8d8 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 4dd:	50                   	push   %eax
 4de:	ff 75 10             	push   0x10(%ebp)
 4e1:	ff 75 0c             	push   0xc(%ebp)
 4e4:	ff 75 08             	push   0x8(%ebp)
 4e7:	e8 11 01 00 00       	call   5fd <clone>
}
 4ec:	c9                   	leave  
 4ed:	c3                   	ret    

000004ee <thread_join>:

int thread_join(){
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
 4f1:	53                   	push   %ebx
 4f2:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 4f5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4f8:	50                   	push   %eax
 4f9:	e8 07 01 00 00       	call   605 <join>
  if (x < 0) {
 4fe:	83 c4 10             	add    $0x10,%esp
 501:	85 c0                	test   %eax,%eax
 503:	78 17                	js     51c <thread_join+0x2e>
 505:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 507:	83 ec 0c             	sub    $0xc,%esp
 50a:	ff 75 f4             	push   -0xc(%ebp)
 50d:	e8 06 03 00 00       	call   818 <free>
  return x;
 512:	83 c4 10             	add    $0x10,%esp
}
 515:	89 d8                	mov    %ebx,%eax
 517:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 51a:	c9                   	leave  
 51b:	c3                   	ret    
    return -1;
 51c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 521:	eb f2                	jmp    515 <thread_join+0x27>

00000523 <lock_init>:

void lock_init(lock_t *spin){
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 526:	8b 45 08             	mov    0x8(%ebp),%eax
 529:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 52f:	5d                   	pop    %ebp
 530:	c3                   	ret    

00000531 <lock_acquire>:

void lock_acquire(lock_t *spin){
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 537:	b8 01 00 00 00       	mov    $0x1,%eax
 53c:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 53f:	85 c0                	test   %eax,%eax
 541:	75 f4                	jne    537 <lock_acquire+0x6>

}
 543:	5d                   	pop    %ebp
 544:	c3                   	ret    

00000545 <lock_release>:

void lock_release(lock_t *spin){
 545:	55                   	push   %ebp
 546:	89 e5                	mov    %esp,%ebp
 548:	8b 55 08             	mov    0x8(%ebp),%edx
 54b:	b8 00 00 00 00       	mov    $0x0,%eax
 550:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 553:	5d                   	pop    %ebp
 554:	c3                   	ret    

00000555 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 555:	b8 01 00 00 00       	mov    $0x1,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <exit>:
SYSCALL(exit)
 55d:	b8 02 00 00 00       	mov    $0x2,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <wait>:
SYSCALL(wait)
 565:	b8 03 00 00 00       	mov    $0x3,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <pipe>:
SYSCALL(pipe)
 56d:	b8 04 00 00 00       	mov    $0x4,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <read>:
SYSCALL(read)
 575:	b8 05 00 00 00       	mov    $0x5,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <write>:
SYSCALL(write)
 57d:	b8 10 00 00 00       	mov    $0x10,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <close>:
SYSCALL(close)
 585:	b8 15 00 00 00       	mov    $0x15,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <kill>:
SYSCALL(kill)
 58d:	b8 06 00 00 00       	mov    $0x6,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <exec>:
SYSCALL(exec)
 595:	b8 07 00 00 00       	mov    $0x7,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <open>:
SYSCALL(open)
 59d:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <mknod>:
SYSCALL(mknod)
 5a5:	b8 11 00 00 00       	mov    $0x11,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <unlink>:
SYSCALL(unlink)
 5ad:	b8 12 00 00 00       	mov    $0x12,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <fstat>:
SYSCALL(fstat)
 5b5:	b8 08 00 00 00       	mov    $0x8,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <link>:
SYSCALL(link)
 5bd:	b8 13 00 00 00       	mov    $0x13,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <mkdir>:
SYSCALL(mkdir)
 5c5:	b8 14 00 00 00       	mov    $0x14,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <chdir>:
SYSCALL(chdir)
 5cd:	b8 09 00 00 00       	mov    $0x9,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <dup>:
SYSCALL(dup)
 5d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <getpid>:
SYSCALL(getpid)
 5dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <sbrk>:
SYSCALL(sbrk)
 5e5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <sleep>:
SYSCALL(sleep)
 5ed:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <uptime>:
SYSCALL(uptime)
 5f5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <clone>:
SYSCALL(clone)
 5fd:	b8 16 00 00 00       	mov    $0x16,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <join>:
 605:	b8 17 00 00 00       	mov    $0x17,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 60d:	55                   	push   %ebp
 60e:	89 e5                	mov    %esp,%ebp
 610:	83 ec 1c             	sub    $0x1c,%esp
 613:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 616:	6a 01                	push   $0x1
 618:	8d 55 f4             	lea    -0xc(%ebp),%edx
 61b:	52                   	push   %edx
 61c:	50                   	push   %eax
 61d:	e8 5b ff ff ff       	call   57d <write>
}
 622:	83 c4 10             	add    $0x10,%esp
 625:	c9                   	leave  
 626:	c3                   	ret    

00000627 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 627:	55                   	push   %ebp
 628:	89 e5                	mov    %esp,%ebp
 62a:	57                   	push   %edi
 62b:	56                   	push   %esi
 62c:	53                   	push   %ebx
 62d:	83 ec 2c             	sub    $0x2c,%esp
 630:	89 45 d0             	mov    %eax,-0x30(%ebp)
 633:	89 d0                	mov    %edx,%eax
 635:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 637:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 63b:	0f 95 c1             	setne  %cl
 63e:	c1 ea 1f             	shr    $0x1f,%edx
 641:	84 d1                	test   %dl,%cl
 643:	74 44                	je     689 <printint+0x62>
    neg = 1;
    x = -xx;
 645:	f7 d8                	neg    %eax
 647:	89 c1                	mov    %eax,%ecx
    neg = 1;
 649:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 650:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 655:	89 c8                	mov    %ecx,%eax
 657:	ba 00 00 00 00       	mov    $0x0,%edx
 65c:	f7 f6                	div    %esi
 65e:	89 df                	mov    %ebx,%edi
 660:	83 c3 01             	add    $0x1,%ebx
 663:	0f b6 92 70 0a 00 00 	movzbl 0xa70(%edx),%edx
 66a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 66e:	89 ca                	mov    %ecx,%edx
 670:	89 c1                	mov    %eax,%ecx
 672:	39 d6                	cmp    %edx,%esi
 674:	76 df                	jbe    655 <printint+0x2e>
  if(neg)
 676:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 67a:	74 31                	je     6ad <printint+0x86>
    buf[i++] = '-';
 67c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 681:	8d 5f 02             	lea    0x2(%edi),%ebx
 684:	8b 75 d0             	mov    -0x30(%ebp),%esi
 687:	eb 17                	jmp    6a0 <printint+0x79>
    x = xx;
 689:	89 c1                	mov    %eax,%ecx
  neg = 0;
 68b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 692:	eb bc                	jmp    650 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 694:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 699:	89 f0                	mov    %esi,%eax
 69b:	e8 6d ff ff ff       	call   60d <putc>
  while(--i >= 0)
 6a0:	83 eb 01             	sub    $0x1,%ebx
 6a3:	79 ef                	jns    694 <printint+0x6d>
}
 6a5:	83 c4 2c             	add    $0x2c,%esp
 6a8:	5b                   	pop    %ebx
 6a9:	5e                   	pop    %esi
 6aa:	5f                   	pop    %edi
 6ab:	5d                   	pop    %ebp
 6ac:	c3                   	ret    
 6ad:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6b0:	eb ee                	jmp    6a0 <printint+0x79>

000006b2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b2:	55                   	push   %ebp
 6b3:	89 e5                	mov    %esp,%ebp
 6b5:	57                   	push   %edi
 6b6:	56                   	push   %esi
 6b7:	53                   	push   %ebx
 6b8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6bb:	8d 45 10             	lea    0x10(%ebp),%eax
 6be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6c1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6c6:	bb 00 00 00 00       	mov    $0x0,%ebx
 6cb:	eb 14                	jmp    6e1 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6cd:	89 fa                	mov    %edi,%edx
 6cf:	8b 45 08             	mov    0x8(%ebp),%eax
 6d2:	e8 36 ff ff ff       	call   60d <putc>
 6d7:	eb 05                	jmp    6de <printf+0x2c>
      }
    } else if(state == '%'){
 6d9:	83 fe 25             	cmp    $0x25,%esi
 6dc:	74 25                	je     703 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6de:	83 c3 01             	add    $0x1,%ebx
 6e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e4:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6e8:	84 c0                	test   %al,%al
 6ea:	0f 84 20 01 00 00    	je     810 <printf+0x15e>
    c = fmt[i] & 0xff;
 6f0:	0f be f8             	movsbl %al,%edi
 6f3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6f6:	85 f6                	test   %esi,%esi
 6f8:	75 df                	jne    6d9 <printf+0x27>
      if(c == '%'){
 6fa:	83 f8 25             	cmp    $0x25,%eax
 6fd:	75 ce                	jne    6cd <printf+0x1b>
        state = '%';
 6ff:	89 c6                	mov    %eax,%esi
 701:	eb db                	jmp    6de <printf+0x2c>
      if(c == 'd'){
 703:	83 f8 25             	cmp    $0x25,%eax
 706:	0f 84 cf 00 00 00    	je     7db <printf+0x129>
 70c:	0f 8c dd 00 00 00    	jl     7ef <printf+0x13d>
 712:	83 f8 78             	cmp    $0x78,%eax
 715:	0f 8f d4 00 00 00    	jg     7ef <printf+0x13d>
 71b:	83 f8 63             	cmp    $0x63,%eax
 71e:	0f 8c cb 00 00 00    	jl     7ef <printf+0x13d>
 724:	83 e8 63             	sub    $0x63,%eax
 727:	83 f8 15             	cmp    $0x15,%eax
 72a:	0f 87 bf 00 00 00    	ja     7ef <printf+0x13d>
 730:	ff 24 85 18 0a 00 00 	jmp    *0xa18(,%eax,4)
        printint(fd, *ap, 10, 1);
 737:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 73a:	8b 17                	mov    (%edi),%edx
 73c:	83 ec 0c             	sub    $0xc,%esp
 73f:	6a 01                	push   $0x1
 741:	b9 0a 00 00 00       	mov    $0xa,%ecx
 746:	8b 45 08             	mov    0x8(%ebp),%eax
 749:	e8 d9 fe ff ff       	call   627 <printint>
        ap++;
 74e:	83 c7 04             	add    $0x4,%edi
 751:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 754:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 757:	be 00 00 00 00       	mov    $0x0,%esi
 75c:	eb 80                	jmp    6de <printf+0x2c>
        printint(fd, *ap, 16, 0);
 75e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 761:	8b 17                	mov    (%edi),%edx
 763:	83 ec 0c             	sub    $0xc,%esp
 766:	6a 00                	push   $0x0
 768:	b9 10 00 00 00       	mov    $0x10,%ecx
 76d:	8b 45 08             	mov    0x8(%ebp),%eax
 770:	e8 b2 fe ff ff       	call   627 <printint>
        ap++;
 775:	83 c7 04             	add    $0x4,%edi
 778:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 77b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77e:	be 00 00 00 00       	mov    $0x0,%esi
 783:	e9 56 ff ff ff       	jmp    6de <printf+0x2c>
        s = (char*)*ap;
 788:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 78b:	8b 30                	mov    (%eax),%esi
        ap++;
 78d:	83 c0 04             	add    $0x4,%eax
 790:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 793:	85 f6                	test   %esi,%esi
 795:	75 15                	jne    7ac <printf+0xfa>
          s = "(null)";
 797:	be 0f 0a 00 00       	mov    $0xa0f,%esi
 79c:	eb 0e                	jmp    7ac <printf+0xfa>
          putc(fd, *s);
 79e:	0f be d2             	movsbl %dl,%edx
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	e8 64 fe ff ff       	call   60d <putc>
          s++;
 7a9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7ac:	0f b6 16             	movzbl (%esi),%edx
 7af:	84 d2                	test   %dl,%dl
 7b1:	75 eb                	jne    79e <printf+0xec>
      state = 0;
 7b3:	be 00 00 00 00       	mov    $0x0,%esi
 7b8:	e9 21 ff ff ff       	jmp    6de <printf+0x2c>
        putc(fd, *ap);
 7bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c0:	0f be 17             	movsbl (%edi),%edx
 7c3:	8b 45 08             	mov    0x8(%ebp),%eax
 7c6:	e8 42 fe ff ff       	call   60d <putc>
        ap++;
 7cb:	83 c7 04             	add    $0x4,%edi
 7ce:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7d1:	be 00 00 00 00       	mov    $0x0,%esi
 7d6:	e9 03 ff ff ff       	jmp    6de <printf+0x2c>
        putc(fd, c);
 7db:	89 fa                	mov    %edi,%edx
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	e8 28 fe ff ff       	call   60d <putc>
      state = 0;
 7e5:	be 00 00 00 00       	mov    $0x0,%esi
 7ea:	e9 ef fe ff ff       	jmp    6de <printf+0x2c>
        putc(fd, '%');
 7ef:	ba 25 00 00 00       	mov    $0x25,%edx
 7f4:	8b 45 08             	mov    0x8(%ebp),%eax
 7f7:	e8 11 fe ff ff       	call   60d <putc>
        putc(fd, c);
 7fc:	89 fa                	mov    %edi,%edx
 7fe:	8b 45 08             	mov    0x8(%ebp),%eax
 801:	e8 07 fe ff ff       	call   60d <putc>
      state = 0;
 806:	be 00 00 00 00       	mov    $0x0,%esi
 80b:	e9 ce fe ff ff       	jmp    6de <printf+0x2c>
    }
  }
}
 810:	8d 65 f4             	lea    -0xc(%ebp),%esp
 813:	5b                   	pop    %ebx
 814:	5e                   	pop    %esi
 815:	5f                   	pop    %edi
 816:	5d                   	pop    %ebp
 817:	c3                   	ret    

00000818 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 818:	55                   	push   %ebp
 819:	89 e5                	mov    %esp,%ebp
 81b:	57                   	push   %edi
 81c:	56                   	push   %esi
 81d:	53                   	push   %ebx
 81e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 821:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 824:	a1 e8 0d 00 00       	mov    0xde8,%eax
 829:	eb 02                	jmp    82d <free+0x15>
 82b:	89 d0                	mov    %edx,%eax
 82d:	39 c8                	cmp    %ecx,%eax
 82f:	73 04                	jae    835 <free+0x1d>
 831:	39 08                	cmp    %ecx,(%eax)
 833:	77 12                	ja     847 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 835:	8b 10                	mov    (%eax),%edx
 837:	39 c2                	cmp    %eax,%edx
 839:	77 f0                	ja     82b <free+0x13>
 83b:	39 c8                	cmp    %ecx,%eax
 83d:	72 08                	jb     847 <free+0x2f>
 83f:	39 ca                	cmp    %ecx,%edx
 841:	77 04                	ja     847 <free+0x2f>
 843:	89 d0                	mov    %edx,%eax
 845:	eb e6                	jmp    82d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 847:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84d:	8b 10                	mov    (%eax),%edx
 84f:	39 d7                	cmp    %edx,%edi
 851:	74 19                	je     86c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 853:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 856:	8b 50 04             	mov    0x4(%eax),%edx
 859:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 85c:	39 ce                	cmp    %ecx,%esi
 85e:	74 1b                	je     87b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 860:	89 08                	mov    %ecx,(%eax)
  freep = p;
 862:	a3 e8 0d 00 00       	mov    %eax,0xde8
}
 867:	5b                   	pop    %ebx
 868:	5e                   	pop    %esi
 869:	5f                   	pop    %edi
 86a:	5d                   	pop    %ebp
 86b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 86c:	03 72 04             	add    0x4(%edx),%esi
 86f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 872:	8b 10                	mov    (%eax),%edx
 874:	8b 12                	mov    (%edx),%edx
 876:	89 53 f8             	mov    %edx,-0x8(%ebx)
 879:	eb db                	jmp    856 <free+0x3e>
    p->s.size += bp->s.size;
 87b:	03 53 fc             	add    -0x4(%ebx),%edx
 87e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 881:	8b 53 f8             	mov    -0x8(%ebx),%edx
 884:	89 10                	mov    %edx,(%eax)
 886:	eb da                	jmp    862 <free+0x4a>

00000888 <morecore>:

static Header*
morecore(uint nu)
{
 888:	55                   	push   %ebp
 889:	89 e5                	mov    %esp,%ebp
 88b:	53                   	push   %ebx
 88c:	83 ec 04             	sub    $0x4,%esp
 88f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 891:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 896:	77 05                	ja     89d <morecore+0x15>
    nu = 4096;
 898:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 89d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8a4:	83 ec 0c             	sub    $0xc,%esp
 8a7:	50                   	push   %eax
 8a8:	e8 38 fd ff ff       	call   5e5 <sbrk>
  if(p == (char*)-1)
 8ad:	83 c4 10             	add    $0x10,%esp
 8b0:	83 f8 ff             	cmp    $0xffffffff,%eax
 8b3:	74 1c                	je     8d1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8b5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8b8:	83 c0 08             	add    $0x8,%eax
 8bb:	83 ec 0c             	sub    $0xc,%esp
 8be:	50                   	push   %eax
 8bf:	e8 54 ff ff ff       	call   818 <free>
  return freep;
 8c4:	a1 e8 0d 00 00       	mov    0xde8,%eax
 8c9:	83 c4 10             	add    $0x10,%esp
}
 8cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8cf:	c9                   	leave  
 8d0:	c3                   	ret    
    return 0;
 8d1:	b8 00 00 00 00       	mov    $0x0,%eax
 8d6:	eb f4                	jmp    8cc <morecore+0x44>

000008d8 <malloc>:

void*
malloc(uint nbytes)
{
 8d8:	55                   	push   %ebp
 8d9:	89 e5                	mov    %esp,%ebp
 8db:	53                   	push   %ebx
 8dc:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8df:	8b 45 08             	mov    0x8(%ebp),%eax
 8e2:	8d 58 07             	lea    0x7(%eax),%ebx
 8e5:	c1 eb 03             	shr    $0x3,%ebx
 8e8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8eb:	8b 0d e8 0d 00 00    	mov    0xde8,%ecx
 8f1:	85 c9                	test   %ecx,%ecx
 8f3:	74 04                	je     8f9 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f5:	8b 01                	mov    (%ecx),%eax
 8f7:	eb 4a                	jmp    943 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8f9:	c7 05 e8 0d 00 00 ec 	movl   $0xdec,0xde8
 900:	0d 00 00 
 903:	c7 05 ec 0d 00 00 ec 	movl   $0xdec,0xdec
 90a:	0d 00 00 
    base.s.size = 0;
 90d:	c7 05 f0 0d 00 00 00 	movl   $0x0,0xdf0
 914:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 917:	b9 ec 0d 00 00       	mov    $0xdec,%ecx
 91c:	eb d7                	jmp    8f5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 91e:	74 19                	je     939 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 920:	29 da                	sub    %ebx,%edx
 922:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 925:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 928:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 92b:	89 0d e8 0d 00 00    	mov    %ecx,0xde8
      return (void*)(p + 1);
 931:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 934:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 937:	c9                   	leave  
 938:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 939:	8b 10                	mov    (%eax),%edx
 93b:	89 11                	mov    %edx,(%ecx)
 93d:	eb ec                	jmp    92b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93f:	89 c1                	mov    %eax,%ecx
 941:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 943:	8b 50 04             	mov    0x4(%eax),%edx
 946:	39 da                	cmp    %ebx,%edx
 948:	73 d4                	jae    91e <malloc+0x46>
    if(p == freep)
 94a:	39 05 e8 0d 00 00    	cmp    %eax,0xde8
 950:	75 ed                	jne    93f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 952:	89 d8                	mov    %ebx,%eax
 954:	e8 2f ff ff ff       	call   888 <morecore>
 959:	85 c0                	test   %eax,%eax
 95b:	75 e2                	jne    93f <malloc+0x67>
 95d:	eb d5                	jmp    934 <malloc+0x5c>
