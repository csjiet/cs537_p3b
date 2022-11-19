
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
  2c:	68 64 09 00 00       	push   $0x964
  31:	68 6d 09 00 00       	push   $0x96d
  36:	6a 01                	push   $0x1
  38:	e8 78 06 00 00       	call   6b5 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 ac 09 00 00       	push   $0x9ac
  45:	68 80 09 00 00       	push   $0x980
  4a:	6a 01                	push   $0x1
  4c:	e8 64 06 00 00       	call   6b5 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 94 09 00 00       	push   $0x994
  59:	6a 01                	push   $0x1
  5b:	e8 55 06 00 00       	call   6b5 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 e4 0d 00 00    	push   0xde4
  69:	e8 22 05 00 00       	call   590 <kill>
  6e:	e8 ed 04 00 00       	call   560 <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 64 09 00 00       	push   $0x964
  7a:	68 6d 09 00 00       	push   $0x96d
  7f:	6a 01                	push   $0x1
  81:	e8 2f 06 00 00       	call   6b5 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 75 09 00 00       	push   $0x975
  8e:	68 80 09 00 00       	push   $0x980
  93:	6a 01                	push   $0x1
  95:	e8 1b 06 00 00       	call   6b5 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 94 09 00 00       	push   $0x994
  a2:	6a 01                	push   $0x1
  a4:	e8 0c 06 00 00       	call   6b5 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 e4 0d 00 00    	push   0xde4
  b2:	e8 d9 04 00 00       	call   590 <kill>
  b7:	e8 a4 04 00 00       	call   560 <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 64 09 00 00       	push   $0x964
  c3:	68 6d 09 00 00       	push   $0x96d
  c8:	6a 01                	push   $0x1
  ca:	e8 e6 05 00 00       	call   6b5 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 a1 09 00 00       	push   $0x9a1
  d7:	68 80 09 00 00       	push   $0x980
  dc:	6a 01                	push   $0x1
  de:	e8 d2 05 00 00       	call   6b5 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 94 09 00 00       	push   $0x994
  eb:	6a 01                	push   $0x1
  ed:	e8 c3 05 00 00       	call   6b5 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 e4 0d 00 00    	push   0xde4
  fb:	e8 90 04 00 00       	call   590 <kill>
 100:	e8 5b 04 00 00       	call   560 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 e0 0d 00 00       	mov    %eax,0xde0
   exit();
 10d:	e8 4e 04 00 00       	call   560 <exit>

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
 126:	e8 b5 04 00 00       	call   5e0 <getpid>
 12b:	a3 e4 0d 00 00       	mov    %eax,0xde4
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 9e 07 00 00       	call   8db <malloc>
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
 15a:	68 64 09 00 00       	push   $0x964
 15f:	68 6d 09 00 00       	push   $0x96d
 164:	6a 01                	push   $0x1
 166:	e8 4a 05 00 00       	call   6b5 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 b8 09 00 00       	push   $0x9b8
 173:	68 80 09 00 00       	push   $0x980
 178:	6a 01                	push   $0x1
 17a:	e8 36 05 00 00       	call   6b5 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 94 09 00 00       	push   $0x994
 187:	6a 01                	push   $0x1
 189:	e8 27 05 00 00       	call   6b5 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 e4 0d 00 00    	push   0xde4
 197:	e8 f4 03 00 00       	call   590 <kill>
 19c:	e8 bf 03 00 00       	call   560 <exit>
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
 1bf:	e8 3c 04 00 00       	call   600 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 2f 04 00 00       	call   608 <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 64 09 00 00       	push   $0x964
 1f4:	68 6d 09 00 00       	push   $0x96d
 1f9:	6a 01                	push   $0x1
 1fb:	e8 b5 04 00 00       	call   6b5 <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 e6 09 00 00       	push   $0x9e6
 208:	68 80 09 00 00       	push   $0x980
 20d:	6a 01                	push   $0x1
 20f:	e8 a1 04 00 00       	call   6b5 <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 94 09 00 00       	push   $0x994
 21c:	6a 01                	push   $0x1
 21e:	e8 92 04 00 00       	call   6b5 <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 e4 0d 00 00    	push   0xde4
 22c:	e8 5f 03 00 00       	call   590 <kill>
 231:	e8 2a 03 00 00       	call   560 <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 64 09 00 00       	push   $0x964
 23d:	68 6d 09 00 00       	push   $0x96d
 242:	6a 01                	push   $0x1
 244:	e8 6c 04 00 00       	call   6b5 <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 c2 09 00 00       	push   $0x9c2
 251:	68 80 09 00 00       	push   $0x980
 256:	6a 01                	push   $0x1
 258:	e8 58 04 00 00       	call   6b5 <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 94 09 00 00       	push   $0x994
 265:	6a 01                	push   $0x1
 267:	e8 49 04 00 00       	call   6b5 <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 e4 0d 00 00    	push   0xde4
 275:	e8 16 03 00 00       	call   590 <kill>
 27a:	e8 e1 02 00 00       	call   560 <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 64 09 00 00       	push   $0x964
 286:	68 6d 09 00 00       	push   $0x96d
 28b:	6a 01                	push   $0x1
 28d:	e8 23 04 00 00       	call   6b5 <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 d0 09 00 00       	push   $0x9d0
 29a:	68 80 09 00 00       	push   $0x980
 29f:	6a 01                	push   $0x1
 2a1:	e8 0f 04 00 00       	call   6b5 <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 94 09 00 00       	push   $0x994
 2ae:	6a 01                	push   $0x1
 2b0:	e8 00 04 00 00       	call   6b5 <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 e4 0d 00 00    	push   0xde4
 2be:	e8 cd 02 00 00       	call   590 <kill>
 2c3:	e8 98 02 00 00       	call   560 <exit>
   assert(global == 2);
 2c8:	83 3d e0 0d 00 00 02 	cmpl   $0x2,0xde0
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 64 09 00 00       	push   $0x964
 2d8:	68 6d 09 00 00       	push   $0x96d
 2dd:	6a 01                	push   $0x1
 2df:	e8 d1 03 00 00       	call   6b5 <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 fa 09 00 00       	push   $0x9fa
 2ec:	68 80 09 00 00       	push   $0x980
 2f1:	6a 01                	push   $0x1
 2f3:	e8 bd 03 00 00       	call   6b5 <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 94 09 00 00       	push   $0x994
 300:	6a 01                	push   $0x1
 302:	e8 ae 03 00 00       	call   6b5 <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 e4 0d 00 00    	push   0xde4
 310:	e8 7b 02 00 00       	call   590 <kill>
 315:	e8 46 02 00 00       	call   560 <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 06 0a 00 00       	push   $0xa06
 322:	6a 01                	push   $0x1
 324:	e8 8c 03 00 00       	call   6b5 <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 ea 04 00 00       	call   81b <free>
   exit();
 331:	e8 2a 02 00 00       	call   560 <exit>

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
 3fc:	e8 77 01 00 00       	call   578 <read>
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
 43a:	e8 61 01 00 00       	call   5a0 <open>
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
 44f:	e8 64 01 00 00       	call   5b8 <fstat>
 454:	89 c6                	mov    %eax,%esi
  close(fd);
 456:	89 1c 24             	mov    %ebx,(%esp)
 459:	e8 2a 01 00 00       	call   588 <close>
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

  void* stack = malloc(2 * PGSIZE);
 4d3:	68 00 20 00 00       	push   $0x2000
 4d8:	e8 fe 03 00 00       	call   8db <malloc>
  if ((uint)stack%PGSIZE){
 4dd:	83 c4 10             	add    $0x10,%esp
 4e0:	a9 ff 0f 00 00       	test   $0xfff,%eax
 4e5:	74 0a                	je     4f1 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 4e7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 4ec:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 4f1:	50                   	push   %eax
 4f2:	ff 75 10             	push   0x10(%ebp)
 4f5:	ff 75 0c             	push   0xc(%ebp)
 4f8:	ff 75 08             	push   0x8(%ebp)
 4fb:	e8 00 01 00 00       	call   600 <clone>
}
 500:	c9                   	leave  
 501:	c3                   	ret    

00000502 <thread_join>:

int thread_join(){
 502:	55                   	push   %ebp
 503:	89 e5                	mov    %esp,%ebp
 505:	53                   	push   %ebx
 506:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 509:	8d 45 f4             	lea    -0xc(%ebp),%eax
 50c:	50                   	push   %eax
 50d:	e8 f6 00 00 00       	call   608 <join>
 512:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 514:	83 c4 04             	add    $0x4,%esp
 517:	ff 75 f4             	push   -0xc(%ebp)
 51a:	e8 fc 02 00 00       	call   81b <free>
  return x;
}
 51f:	89 d8                	mov    %ebx,%eax
 521:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 524:	c9                   	leave  
 525:	c3                   	ret    

00000526 <lock_init>:

void lock_init(lock_t *spin){
 526:	55                   	push   %ebp
 527:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 529:	8b 45 08             	mov    0x8(%ebp),%eax
 52c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 532:	5d                   	pop    %ebp
 533:	c3                   	ret    

00000534 <lock_acquire>:

void lock_acquire(lock_t *spin){
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 53a:	b8 01 00 00 00       	mov    $0x1,%eax
 53f:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 542:	85 c0                	test   %eax,%eax
 544:	75 f4                	jne    53a <lock_acquire+0x6>

}
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    

00000548 <lock_release>:

void lock_release(lock_t *spin){
 548:	55                   	push   %ebp
 549:	89 e5                	mov    %esp,%ebp
 54b:	8b 55 08             	mov    0x8(%ebp),%edx
 54e:	b8 00 00 00 00       	mov    $0x0,%eax
 553:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    

00000558 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 558:	b8 01 00 00 00       	mov    $0x1,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <exit>:
SYSCALL(exit)
 560:	b8 02 00 00 00       	mov    $0x2,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <wait>:
SYSCALL(wait)
 568:	b8 03 00 00 00       	mov    $0x3,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <pipe>:
SYSCALL(pipe)
 570:	b8 04 00 00 00       	mov    $0x4,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <read>:
SYSCALL(read)
 578:	b8 05 00 00 00       	mov    $0x5,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <write>:
SYSCALL(write)
 580:	b8 10 00 00 00       	mov    $0x10,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <close>:
SYSCALL(close)
 588:	b8 15 00 00 00       	mov    $0x15,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <kill>:
SYSCALL(kill)
 590:	b8 06 00 00 00       	mov    $0x6,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <exec>:
SYSCALL(exec)
 598:	b8 07 00 00 00       	mov    $0x7,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <open>:
SYSCALL(open)
 5a0:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <mknod>:
SYSCALL(mknod)
 5a8:	b8 11 00 00 00       	mov    $0x11,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <unlink>:
SYSCALL(unlink)
 5b0:	b8 12 00 00 00       	mov    $0x12,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <fstat>:
SYSCALL(fstat)
 5b8:	b8 08 00 00 00       	mov    $0x8,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <link>:
SYSCALL(link)
 5c0:	b8 13 00 00 00       	mov    $0x13,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <mkdir>:
SYSCALL(mkdir)
 5c8:	b8 14 00 00 00       	mov    $0x14,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <chdir>:
SYSCALL(chdir)
 5d0:	b8 09 00 00 00       	mov    $0x9,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <dup>:
SYSCALL(dup)
 5d8:	b8 0a 00 00 00       	mov    $0xa,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <getpid>:
SYSCALL(getpid)
 5e0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <sbrk>:
SYSCALL(sbrk)
 5e8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <sleep>:
SYSCALL(sleep)
 5f0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <uptime>:
SYSCALL(uptime)
 5f8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <clone>:
SYSCALL(clone)
 600:	b8 16 00 00 00       	mov    $0x16,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <join>:
 608:	b8 17 00 00 00       	mov    $0x17,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	83 ec 1c             	sub    $0x1c,%esp
 616:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 619:	6a 01                	push   $0x1
 61b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 61e:	52                   	push   %edx
 61f:	50                   	push   %eax
 620:	e8 5b ff ff ff       	call   580 <write>
}
 625:	83 c4 10             	add    $0x10,%esp
 628:	c9                   	leave  
 629:	c3                   	ret    

0000062a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	57                   	push   %edi
 62e:	56                   	push   %esi
 62f:	53                   	push   %ebx
 630:	83 ec 2c             	sub    $0x2c,%esp
 633:	89 45 d0             	mov    %eax,-0x30(%ebp)
 636:	89 d0                	mov    %edx,%eax
 638:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 63a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 63e:	0f 95 c1             	setne  %cl
 641:	c1 ea 1f             	shr    $0x1f,%edx
 644:	84 d1                	test   %dl,%cl
 646:	74 44                	je     68c <printint+0x62>
    neg = 1;
    x = -xx;
 648:	f7 d8                	neg    %eax
 64a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 64c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 653:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 658:	89 c8                	mov    %ecx,%eax
 65a:	ba 00 00 00 00       	mov    $0x0,%edx
 65f:	f7 f6                	div    %esi
 661:	89 df                	mov    %ebx,%edi
 663:	83 c3 01             	add    $0x1,%ebx
 666:	0f b6 92 74 0a 00 00 	movzbl 0xa74(%edx),%edx
 66d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 671:	89 ca                	mov    %ecx,%edx
 673:	89 c1                	mov    %eax,%ecx
 675:	39 d6                	cmp    %edx,%esi
 677:	76 df                	jbe    658 <printint+0x2e>
  if(neg)
 679:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 67d:	74 31                	je     6b0 <printint+0x86>
    buf[i++] = '-';
 67f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 684:	8d 5f 02             	lea    0x2(%edi),%ebx
 687:	8b 75 d0             	mov    -0x30(%ebp),%esi
 68a:	eb 17                	jmp    6a3 <printint+0x79>
    x = xx;
 68c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 68e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 695:	eb bc                	jmp    653 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 697:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 69c:	89 f0                	mov    %esi,%eax
 69e:	e8 6d ff ff ff       	call   610 <putc>
  while(--i >= 0)
 6a3:	83 eb 01             	sub    $0x1,%ebx
 6a6:	79 ef                	jns    697 <printint+0x6d>
}
 6a8:	83 c4 2c             	add    $0x2c,%esp
 6ab:	5b                   	pop    %ebx
 6ac:	5e                   	pop    %esi
 6ad:	5f                   	pop    %edi
 6ae:	5d                   	pop    %ebp
 6af:	c3                   	ret    
 6b0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6b3:	eb ee                	jmp    6a3 <printint+0x79>

000006b5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b5:	55                   	push   %ebp
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	53                   	push   %ebx
 6bb:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6be:	8d 45 10             	lea    0x10(%ebp),%eax
 6c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6c4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6c9:	bb 00 00 00 00       	mov    $0x0,%ebx
 6ce:	eb 14                	jmp    6e4 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6d0:	89 fa                	mov    %edi,%edx
 6d2:	8b 45 08             	mov    0x8(%ebp),%eax
 6d5:	e8 36 ff ff ff       	call   610 <putc>
 6da:	eb 05                	jmp    6e1 <printf+0x2c>
      }
    } else if(state == '%'){
 6dc:	83 fe 25             	cmp    $0x25,%esi
 6df:	74 25                	je     706 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6e1:	83 c3 01             	add    $0x1,%ebx
 6e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6eb:	84 c0                	test   %al,%al
 6ed:	0f 84 20 01 00 00    	je     813 <printf+0x15e>
    c = fmt[i] & 0xff;
 6f3:	0f be f8             	movsbl %al,%edi
 6f6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6f9:	85 f6                	test   %esi,%esi
 6fb:	75 df                	jne    6dc <printf+0x27>
      if(c == '%'){
 6fd:	83 f8 25             	cmp    $0x25,%eax
 700:	75 ce                	jne    6d0 <printf+0x1b>
        state = '%';
 702:	89 c6                	mov    %eax,%esi
 704:	eb db                	jmp    6e1 <printf+0x2c>
      if(c == 'd'){
 706:	83 f8 25             	cmp    $0x25,%eax
 709:	0f 84 cf 00 00 00    	je     7de <printf+0x129>
 70f:	0f 8c dd 00 00 00    	jl     7f2 <printf+0x13d>
 715:	83 f8 78             	cmp    $0x78,%eax
 718:	0f 8f d4 00 00 00    	jg     7f2 <printf+0x13d>
 71e:	83 f8 63             	cmp    $0x63,%eax
 721:	0f 8c cb 00 00 00    	jl     7f2 <printf+0x13d>
 727:	83 e8 63             	sub    $0x63,%eax
 72a:	83 f8 15             	cmp    $0x15,%eax
 72d:	0f 87 bf 00 00 00    	ja     7f2 <printf+0x13d>
 733:	ff 24 85 1c 0a 00 00 	jmp    *0xa1c(,%eax,4)
        printint(fd, *ap, 10, 1);
 73a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 73d:	8b 17                	mov    (%edi),%edx
 73f:	83 ec 0c             	sub    $0xc,%esp
 742:	6a 01                	push   $0x1
 744:	b9 0a 00 00 00       	mov    $0xa,%ecx
 749:	8b 45 08             	mov    0x8(%ebp),%eax
 74c:	e8 d9 fe ff ff       	call   62a <printint>
        ap++;
 751:	83 c7 04             	add    $0x4,%edi
 754:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 757:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 75a:	be 00 00 00 00       	mov    $0x0,%esi
 75f:	eb 80                	jmp    6e1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 761:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 764:	8b 17                	mov    (%edi),%edx
 766:	83 ec 0c             	sub    $0xc,%esp
 769:	6a 00                	push   $0x0
 76b:	b9 10 00 00 00       	mov    $0x10,%ecx
 770:	8b 45 08             	mov    0x8(%ebp),%eax
 773:	e8 b2 fe ff ff       	call   62a <printint>
        ap++;
 778:	83 c7 04             	add    $0x4,%edi
 77b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 77e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 781:	be 00 00 00 00       	mov    $0x0,%esi
 786:	e9 56 ff ff ff       	jmp    6e1 <printf+0x2c>
        s = (char*)*ap;
 78b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 78e:	8b 30                	mov    (%eax),%esi
        ap++;
 790:	83 c0 04             	add    $0x4,%eax
 793:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 796:	85 f6                	test   %esi,%esi
 798:	75 15                	jne    7af <printf+0xfa>
          s = "(null)";
 79a:	be 13 0a 00 00       	mov    $0xa13,%esi
 79f:	eb 0e                	jmp    7af <printf+0xfa>
          putc(fd, *s);
 7a1:	0f be d2             	movsbl %dl,%edx
 7a4:	8b 45 08             	mov    0x8(%ebp),%eax
 7a7:	e8 64 fe ff ff       	call   610 <putc>
          s++;
 7ac:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7af:	0f b6 16             	movzbl (%esi),%edx
 7b2:	84 d2                	test   %dl,%dl
 7b4:	75 eb                	jne    7a1 <printf+0xec>
      state = 0;
 7b6:	be 00 00 00 00       	mov    $0x0,%esi
 7bb:	e9 21 ff ff ff       	jmp    6e1 <printf+0x2c>
        putc(fd, *ap);
 7c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c3:	0f be 17             	movsbl (%edi),%edx
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	e8 42 fe ff ff       	call   610 <putc>
        ap++;
 7ce:	83 c7 04             	add    $0x4,%edi
 7d1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7d4:	be 00 00 00 00       	mov    $0x0,%esi
 7d9:	e9 03 ff ff ff       	jmp    6e1 <printf+0x2c>
        putc(fd, c);
 7de:	89 fa                	mov    %edi,%edx
 7e0:	8b 45 08             	mov    0x8(%ebp),%eax
 7e3:	e8 28 fe ff ff       	call   610 <putc>
      state = 0;
 7e8:	be 00 00 00 00       	mov    $0x0,%esi
 7ed:	e9 ef fe ff ff       	jmp    6e1 <printf+0x2c>
        putc(fd, '%');
 7f2:	ba 25 00 00 00       	mov    $0x25,%edx
 7f7:	8b 45 08             	mov    0x8(%ebp),%eax
 7fa:	e8 11 fe ff ff       	call   610 <putc>
        putc(fd, c);
 7ff:	89 fa                	mov    %edi,%edx
 801:	8b 45 08             	mov    0x8(%ebp),%eax
 804:	e8 07 fe ff ff       	call   610 <putc>
      state = 0;
 809:	be 00 00 00 00       	mov    $0x0,%esi
 80e:	e9 ce fe ff ff       	jmp    6e1 <printf+0x2c>
    }
  }
}
 813:	8d 65 f4             	lea    -0xc(%ebp),%esp
 816:	5b                   	pop    %ebx
 817:	5e                   	pop    %esi
 818:	5f                   	pop    %edi
 819:	5d                   	pop    %ebp
 81a:	c3                   	ret    

0000081b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 81b:	55                   	push   %ebp
 81c:	89 e5                	mov    %esp,%ebp
 81e:	57                   	push   %edi
 81f:	56                   	push   %esi
 820:	53                   	push   %ebx
 821:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 824:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 827:	a1 e8 0d 00 00       	mov    0xde8,%eax
 82c:	eb 02                	jmp    830 <free+0x15>
 82e:	89 d0                	mov    %edx,%eax
 830:	39 c8                	cmp    %ecx,%eax
 832:	73 04                	jae    838 <free+0x1d>
 834:	39 08                	cmp    %ecx,(%eax)
 836:	77 12                	ja     84a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 838:	8b 10                	mov    (%eax),%edx
 83a:	39 c2                	cmp    %eax,%edx
 83c:	77 f0                	ja     82e <free+0x13>
 83e:	39 c8                	cmp    %ecx,%eax
 840:	72 08                	jb     84a <free+0x2f>
 842:	39 ca                	cmp    %ecx,%edx
 844:	77 04                	ja     84a <free+0x2f>
 846:	89 d0                	mov    %edx,%eax
 848:	eb e6                	jmp    830 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 84a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 850:	8b 10                	mov    (%eax),%edx
 852:	39 d7                	cmp    %edx,%edi
 854:	74 19                	je     86f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 856:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 859:	8b 50 04             	mov    0x4(%eax),%edx
 85c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 85f:	39 ce                	cmp    %ecx,%esi
 861:	74 1b                	je     87e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 863:	89 08                	mov    %ecx,(%eax)
  freep = p;
 865:	a3 e8 0d 00 00       	mov    %eax,0xde8
}
 86a:	5b                   	pop    %ebx
 86b:	5e                   	pop    %esi
 86c:	5f                   	pop    %edi
 86d:	5d                   	pop    %ebp
 86e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 86f:	03 72 04             	add    0x4(%edx),%esi
 872:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 875:	8b 10                	mov    (%eax),%edx
 877:	8b 12                	mov    (%edx),%edx
 879:	89 53 f8             	mov    %edx,-0x8(%ebx)
 87c:	eb db                	jmp    859 <free+0x3e>
    p->s.size += bp->s.size;
 87e:	03 53 fc             	add    -0x4(%ebx),%edx
 881:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 884:	8b 53 f8             	mov    -0x8(%ebx),%edx
 887:	89 10                	mov    %edx,(%eax)
 889:	eb da                	jmp    865 <free+0x4a>

0000088b <morecore>:

static Header*
morecore(uint nu)
{
 88b:	55                   	push   %ebp
 88c:	89 e5                	mov    %esp,%ebp
 88e:	53                   	push   %ebx
 88f:	83 ec 04             	sub    $0x4,%esp
 892:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 894:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 899:	77 05                	ja     8a0 <morecore+0x15>
    nu = 4096;
 89b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8a0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8a7:	83 ec 0c             	sub    $0xc,%esp
 8aa:	50                   	push   %eax
 8ab:	e8 38 fd ff ff       	call   5e8 <sbrk>
  if(p == (char*)-1)
 8b0:	83 c4 10             	add    $0x10,%esp
 8b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8b6:	74 1c                	je     8d4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8bb:	83 c0 08             	add    $0x8,%eax
 8be:	83 ec 0c             	sub    $0xc,%esp
 8c1:	50                   	push   %eax
 8c2:	e8 54 ff ff ff       	call   81b <free>
  return freep;
 8c7:	a1 e8 0d 00 00       	mov    0xde8,%eax
 8cc:	83 c4 10             	add    $0x10,%esp
}
 8cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d2:	c9                   	leave  
 8d3:	c3                   	ret    
    return 0;
 8d4:	b8 00 00 00 00       	mov    $0x0,%eax
 8d9:	eb f4                	jmp    8cf <morecore+0x44>

000008db <malloc>:

void*
malloc(uint nbytes)
{
 8db:	55                   	push   %ebp
 8dc:	89 e5                	mov    %esp,%ebp
 8de:	53                   	push   %ebx
 8df:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e2:	8b 45 08             	mov    0x8(%ebp),%eax
 8e5:	8d 58 07             	lea    0x7(%eax),%ebx
 8e8:	c1 eb 03             	shr    $0x3,%ebx
 8eb:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8ee:	8b 0d e8 0d 00 00    	mov    0xde8,%ecx
 8f4:	85 c9                	test   %ecx,%ecx
 8f6:	74 04                	je     8fc <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f8:	8b 01                	mov    (%ecx),%eax
 8fa:	eb 4a                	jmp    946 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8fc:	c7 05 e8 0d 00 00 ec 	movl   $0xdec,0xde8
 903:	0d 00 00 
 906:	c7 05 ec 0d 00 00 ec 	movl   $0xdec,0xdec
 90d:	0d 00 00 
    base.s.size = 0;
 910:	c7 05 f0 0d 00 00 00 	movl   $0x0,0xdf0
 917:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 91a:	b9 ec 0d 00 00       	mov    $0xdec,%ecx
 91f:	eb d7                	jmp    8f8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 921:	74 19                	je     93c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 923:	29 da                	sub    %ebx,%edx
 925:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 928:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 92b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 92e:	89 0d e8 0d 00 00    	mov    %ecx,0xde8
      return (void*)(p + 1);
 934:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 937:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 93a:	c9                   	leave  
 93b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 93c:	8b 10                	mov    (%eax),%edx
 93e:	89 11                	mov    %edx,(%ecx)
 940:	eb ec                	jmp    92e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 942:	89 c1                	mov    %eax,%ecx
 944:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 946:	8b 50 04             	mov    0x4(%eax),%edx
 949:	39 da                	cmp    %ebx,%edx
 94b:	73 d4                	jae    921 <malloc+0x46>
    if(p == freep)
 94d:	39 05 e8 0d 00 00    	cmp    %eax,0xde8
 953:	75 ed                	jne    942 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 955:	89 d8                	mov    %ebx,%eax
 957:	e8 2f ff ff ff       	call   88b <morecore>
 95c:	85 c0                	test   %eax,%eax
 95e:	75 e2                	jne    942 <malloc+0x67>
 960:	eb d5                	jmp    937 <malloc+0x5c>
