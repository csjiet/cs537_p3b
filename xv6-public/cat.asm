
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 40 0b 00 00       	push   $0xb40
  15:	56                   	push   %esi
  16:	e8 1f 03 00 00       	call   33a <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 40 0b 00 00       	push   $0xb40
  2d:	6a 01                	push   $0x1
  2f:	e8 0e 03 00 00       	call   342 <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 24 07 00 00       	push   $0x724
  43:	6a 01                	push   $0x1
  45:	e8 2d 04 00 00       	call   477 <printf>
      exit();
  4a:	e8 d3 02 00 00       	call   322 <exit>
    }
  }
  if(n < 0){
  4f:	78 07                	js     58 <cat+0x58>
    printf(1, "cat: read error\n");
    exit();
  }
}
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
    printf(1, "cat: read error\n");
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 36 07 00 00       	push   $0x736
  60:	6a 01                	push   $0x1
  62:	e8 10 04 00 00       	call   477 <printf>
    exit();
  67:	e8 b6 02 00 00       	call   322 <exit>

0000006c <main>:

int
main(int argc, char *argv[])
{
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
    cat(0);
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 7c 02 00 00       	call   322 <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
    close(fd);
  af:	89 1c 24             	mov    %ebx,(%esp)
  b2:	e8 93 02 00 00       	call   34a <close>
  for(i = 1; i < argc; i++){
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
    if((fd = open(argv[i], 0)) < 0){
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	push   (%edi)
  cf:	e8 8e 02 00 00       	call   362 <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 47 07 00 00       	push   $0x747
  e7:	6a 01                	push   $0x1
  e9:	e8 89 03 00 00       	call   477 <printf>
      exit();
  ee:	e8 2f 02 00 00       	call   322 <exit>
  }
  exit();
  f3:	e8 2a 02 00 00       	call   322 <exit>

000000f8 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	56                   	push   %esi
  fc:	53                   	push   %ebx
  fd:	8b 75 08             	mov    0x8(%ebp),%esi
 100:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 103:	89 f0                	mov    %esi,%eax
 105:	89 d1                	mov    %edx,%ecx
 107:	83 c2 01             	add    $0x1,%edx
 10a:	89 c3                	mov    %eax,%ebx
 10c:	83 c0 01             	add    $0x1,%eax
 10f:	0f b6 09             	movzbl (%ecx),%ecx
 112:	88 0b                	mov    %cl,(%ebx)
 114:	84 c9                	test   %cl,%cl
 116:	75 ed                	jne    105 <strcpy+0xd>
    ;
  return os;
}
 118:	89 f0                	mov    %esi,%eax
 11a:	5b                   	pop    %ebx
 11b:	5e                   	pop    %esi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    

0000011e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	8b 4d 08             	mov    0x8(%ebp),%ecx
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 127:	eb 06                	jmp    12f <strcmp+0x11>
    p++, q++;
 129:	83 c1 01             	add    $0x1,%ecx
 12c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 12f:	0f b6 01             	movzbl (%ecx),%eax
 132:	84 c0                	test   %al,%al
 134:	74 04                	je     13a <strcmp+0x1c>
 136:	3a 02                	cmp    (%edx),%al
 138:	74 ef                	je     129 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 13a:	0f b6 c0             	movzbl %al,%eax
 13d:	0f b6 12             	movzbl (%edx),%edx
 140:	29 d0                	sub    %edx,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

00000144 <strlen>:

uint
strlen(const char *s)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 14a:	b8 00 00 00 00       	mov    $0x0,%eax
 14f:	eb 03                	jmp    154 <strlen+0x10>
 151:	83 c0 01             	add    $0x1,%eax
 154:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 158:	75 f7                	jne    151 <strlen+0xd>
    ;
  return n;
}
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <memset>:

void*
memset(void *dst, int c, uint n)
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	57                   	push   %edi
 160:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 163:	89 d7                	mov    %edx,%edi
 165:	8b 4d 10             	mov    0x10(%ebp),%ecx
 168:	8b 45 0c             	mov    0xc(%ebp),%eax
 16b:	fc                   	cld    
 16c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 16e:	89 d0                	mov    %edx,%eax
 170:	8b 7d fc             	mov    -0x4(%ebp),%edi
 173:	c9                   	leave  
 174:	c3                   	ret    

00000175 <strchr>:

char*
strchr(const char *s, char c)
{
 175:	55                   	push   %ebp
 176:	89 e5                	mov    %esp,%ebp
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17f:	eb 03                	jmp    184 <strchr+0xf>
 181:	83 c0 01             	add    $0x1,%eax
 184:	0f b6 10             	movzbl (%eax),%edx
 187:	84 d2                	test   %dl,%dl
 189:	74 06                	je     191 <strchr+0x1c>
    if(*s == c)
 18b:	38 ca                	cmp    %cl,%dl
 18d:	75 f2                	jne    181 <strchr+0xc>
 18f:	eb 05                	jmp    196 <strchr+0x21>
      return (char*)s;
  return 0;
 191:	b8 00 00 00 00       	mov    $0x0,%eax
}
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    

00000198 <gets>:

char*
gets(char *buf, int max)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	57                   	push   %edi
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a9:	89 de                	mov    %ebx,%esi
 1ab:	83 c3 01             	add    $0x1,%ebx
 1ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b1:	7d 2e                	jge    1e1 <gets+0x49>
    cc = read(0, &c, 1);
 1b3:	83 ec 04             	sub    $0x4,%esp
 1b6:	6a 01                	push   $0x1
 1b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1bb:	50                   	push   %eax
 1bc:	6a 00                	push   $0x0
 1be:	e8 77 01 00 00       	call   33a <read>
    if(cc < 1)
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	85 c0                	test   %eax,%eax
 1c8:	7e 17                	jle    1e1 <gets+0x49>
      break;
    buf[i++] = c;
 1ca:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ce:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	0f 94 c2             	sete   %dl
 1d6:	3c 0d                	cmp    $0xd,%al
 1d8:	0f 94 c0             	sete   %al
 1db:	08 c2                	or     %al,%dl
 1dd:	74 ca                	je     1a9 <gets+0x11>
    buf[i++] = c;
 1df:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1e1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1e5:	89 f8                	mov    %edi,%eax
 1e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5f                   	pop    %edi
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	56                   	push   %esi
 1f3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	6a 00                	push   $0x0
 1f9:	ff 75 08             	push   0x8(%ebp)
 1fc:	e8 61 01 00 00       	call   362 <open>
  if(fd < 0)
 201:	83 c4 10             	add    $0x10,%esp
 204:	85 c0                	test   %eax,%eax
 206:	78 24                	js     22c <stat+0x3d>
 208:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20a:	83 ec 08             	sub    $0x8,%esp
 20d:	ff 75 0c             	push   0xc(%ebp)
 210:	50                   	push   %eax
 211:	e8 64 01 00 00       	call   37a <fstat>
 216:	89 c6                	mov    %eax,%esi
  close(fd);
 218:	89 1c 24             	mov    %ebx,(%esp)
 21b:	e8 2a 01 00 00       	call   34a <close>
  return r;
 220:	83 c4 10             	add    $0x10,%esp
}
 223:	89 f0                	mov    %esi,%eax
 225:	8d 65 f8             	lea    -0x8(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
    return -1;
 22c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 231:	eb f0                	jmp    223 <stat+0x34>

00000233 <atoi>:

int
atoi(const char *s)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	53                   	push   %ebx
 237:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 23a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 23f:	eb 10                	jmp    251 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 241:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 244:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 247:	83 c1 01             	add    $0x1,%ecx
 24a:	0f be c0             	movsbl %al,%eax
 24d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 251:	0f b6 01             	movzbl (%ecx),%eax
 254:	8d 58 d0             	lea    -0x30(%eax),%ebx
 257:	80 fb 09             	cmp    $0x9,%bl
 25a:	76 e5                	jbe    241 <atoi+0xe>
  return n;
}
 25c:	89 d0                	mov    %edx,%eax
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 26e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 271:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 273:	eb 0d                	jmp    282 <memmove+0x1f>
    *dst++ = *src++;
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	88 02                	mov    %al,(%edx)
 27a:	8d 49 01             	lea    0x1(%ecx),%ecx
 27d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 280:	89 d8                	mov    %ebx,%eax
 282:	8d 58 ff             	lea    -0x1(%eax),%ebx
 285:	85 c0                	test   %eax,%eax
 287:	7f ec                	jg     275 <memmove+0x12>
  return vdst;
}
 289:	89 f0                	mov    %esi,%eax
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    

0000028f <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 295:	68 00 20 00 00       	push   $0x2000
 29a:	e8 fe 03 00 00       	call   69d <malloc>
  if ((uint)stack%PGSIZE){
 29f:	83 c4 10             	add    $0x10,%esp
 2a2:	a9 ff 0f 00 00       	test   $0xfff,%eax
 2a7:	74 0a                	je     2b3 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 2a9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 2ae:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 2b3:	50                   	push   %eax
 2b4:	ff 75 10             	push   0x10(%ebp)
 2b7:	ff 75 0c             	push   0xc(%ebp)
 2ba:	ff 75 08             	push   0x8(%ebp)
 2bd:	e8 00 01 00 00       	call   3c2 <clone>
}
 2c2:	c9                   	leave  
 2c3:	c3                   	ret    

000002c4 <thread_join>:

int thread_join(){
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	53                   	push   %ebx
 2c8:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 2cb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2ce:	50                   	push   %eax
 2cf:	e8 f6 00 00 00       	call   3ca <join>
 2d4:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 2d6:	83 c4 04             	add    $0x4,%esp
 2d9:	ff 75 f4             	push   -0xc(%ebp)
 2dc:	e8 fc 02 00 00       	call   5dd <free>
  return x;
}
 2e1:	89 d8                	mov    %ebx,%eax
 2e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e6:	c9                   	leave  
 2e7:	c3                   	ret    

000002e8 <lock_init>:

void lock_init(lock_t *spin){
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    

000002f6 <lock_acquire>:

void lock_acquire(lock_t *spin){
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 2fc:	b8 01 00 00 00       	mov    $0x1,%eax
 301:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 304:	85 c0                	test   %eax,%eax
 306:	75 f4                	jne    2fc <lock_acquire+0x6>

}
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <lock_release>:

void lock_release(lock_t *spin){
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
 30d:	8b 55 08             	mov    0x8(%ebp),%edx
 310:	b8 00 00 00 00       	mov    $0x0,%eax
 315:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31a:	b8 01 00 00 00       	mov    $0x1,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <exit>:
SYSCALL(exit)
 322:	b8 02 00 00 00       	mov    $0x2,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <wait>:
SYSCALL(wait)
 32a:	b8 03 00 00 00       	mov    $0x3,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <pipe>:
SYSCALL(pipe)
 332:	b8 04 00 00 00       	mov    $0x4,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <read>:
SYSCALL(read)
 33a:	b8 05 00 00 00       	mov    $0x5,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <write>:
SYSCALL(write)
 342:	b8 10 00 00 00       	mov    $0x10,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <close>:
SYSCALL(close)
 34a:	b8 15 00 00 00       	mov    $0x15,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <kill>:
SYSCALL(kill)
 352:	b8 06 00 00 00       	mov    $0x6,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <exec>:
SYSCALL(exec)
 35a:	b8 07 00 00 00       	mov    $0x7,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <open>:
SYSCALL(open)
 362:	b8 0f 00 00 00       	mov    $0xf,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mknod>:
SYSCALL(mknod)
 36a:	b8 11 00 00 00       	mov    $0x11,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <unlink>:
SYSCALL(unlink)
 372:	b8 12 00 00 00       	mov    $0x12,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <fstat>:
SYSCALL(fstat)
 37a:	b8 08 00 00 00       	mov    $0x8,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <link>:
SYSCALL(link)
 382:	b8 13 00 00 00       	mov    $0x13,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <mkdir>:
SYSCALL(mkdir)
 38a:	b8 14 00 00 00       	mov    $0x14,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <chdir>:
SYSCALL(chdir)
 392:	b8 09 00 00 00       	mov    $0x9,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <dup>:
SYSCALL(dup)
 39a:	b8 0a 00 00 00       	mov    $0xa,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getpid>:
SYSCALL(getpid)
 3a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <sbrk>:
SYSCALL(sbrk)
 3aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <sleep>:
SYSCALL(sleep)
 3b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <uptime>:
SYSCALL(uptime)
 3ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <clone>:
SYSCALL(clone)
 3c2:	b8 16 00 00 00       	mov    $0x16,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <join>:
 3ca:	b8 17 00 00 00       	mov    $0x17,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3d2:	55                   	push   %ebp
 3d3:	89 e5                	mov    %esp,%ebp
 3d5:	83 ec 1c             	sub    $0x1c,%esp
 3d8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3db:	6a 01                	push   $0x1
 3dd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3e0:	52                   	push   %edx
 3e1:	50                   	push   %eax
 3e2:	e8 5b ff ff ff       	call   342 <write>
}
 3e7:	83 c4 10             	add    $0x10,%esp
 3ea:	c9                   	leave  
 3eb:	c3                   	ret    

000003ec <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	57                   	push   %edi
 3f0:	56                   	push   %esi
 3f1:	53                   	push   %ebx
 3f2:	83 ec 2c             	sub    $0x2c,%esp
 3f5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3f8:	89 d0                	mov    %edx,%eax
 3fa:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3fc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 400:	0f 95 c1             	setne  %cl
 403:	c1 ea 1f             	shr    $0x1f,%edx
 406:	84 d1                	test   %dl,%cl
 408:	74 44                	je     44e <printint+0x62>
    neg = 1;
    x = -xx;
 40a:	f7 d8                	neg    %eax
 40c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 40e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 415:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 41a:	89 c8                	mov    %ecx,%eax
 41c:	ba 00 00 00 00       	mov    $0x0,%edx
 421:	f7 f6                	div    %esi
 423:	89 df                	mov    %ebx,%edi
 425:	83 c3 01             	add    $0x1,%ebx
 428:	0f b6 92 bc 07 00 00 	movzbl 0x7bc(%edx),%edx
 42f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 433:	89 ca                	mov    %ecx,%edx
 435:	89 c1                	mov    %eax,%ecx
 437:	39 d6                	cmp    %edx,%esi
 439:	76 df                	jbe    41a <printint+0x2e>
  if(neg)
 43b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 43f:	74 31                	je     472 <printint+0x86>
    buf[i++] = '-';
 441:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 446:	8d 5f 02             	lea    0x2(%edi),%ebx
 449:	8b 75 d0             	mov    -0x30(%ebp),%esi
 44c:	eb 17                	jmp    465 <printint+0x79>
    x = xx;
 44e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 450:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 457:	eb bc                	jmp    415 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 459:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 45e:	89 f0                	mov    %esi,%eax
 460:	e8 6d ff ff ff       	call   3d2 <putc>
  while(--i >= 0)
 465:	83 eb 01             	sub    $0x1,%ebx
 468:	79 ef                	jns    459 <printint+0x6d>
}
 46a:	83 c4 2c             	add    $0x2c,%esp
 46d:	5b                   	pop    %ebx
 46e:	5e                   	pop    %esi
 46f:	5f                   	pop    %edi
 470:	5d                   	pop    %ebp
 471:	c3                   	ret    
 472:	8b 75 d0             	mov    -0x30(%ebp),%esi
 475:	eb ee                	jmp    465 <printint+0x79>

00000477 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	57                   	push   %edi
 47b:	56                   	push   %esi
 47c:	53                   	push   %ebx
 47d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 480:	8d 45 10             	lea    0x10(%ebp),%eax
 483:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 486:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 48b:	bb 00 00 00 00       	mov    $0x0,%ebx
 490:	eb 14                	jmp    4a6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 492:	89 fa                	mov    %edi,%edx
 494:	8b 45 08             	mov    0x8(%ebp),%eax
 497:	e8 36 ff ff ff       	call   3d2 <putc>
 49c:	eb 05                	jmp    4a3 <printf+0x2c>
      }
    } else if(state == '%'){
 49e:	83 fe 25             	cmp    $0x25,%esi
 4a1:	74 25                	je     4c8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4a3:	83 c3 01             	add    $0x1,%ebx
 4a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4ad:	84 c0                	test   %al,%al
 4af:	0f 84 20 01 00 00    	je     5d5 <printf+0x15e>
    c = fmt[i] & 0xff;
 4b5:	0f be f8             	movsbl %al,%edi
 4b8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4bb:	85 f6                	test   %esi,%esi
 4bd:	75 df                	jne    49e <printf+0x27>
      if(c == '%'){
 4bf:	83 f8 25             	cmp    $0x25,%eax
 4c2:	75 ce                	jne    492 <printf+0x1b>
        state = '%';
 4c4:	89 c6                	mov    %eax,%esi
 4c6:	eb db                	jmp    4a3 <printf+0x2c>
      if(c == 'd'){
 4c8:	83 f8 25             	cmp    $0x25,%eax
 4cb:	0f 84 cf 00 00 00    	je     5a0 <printf+0x129>
 4d1:	0f 8c dd 00 00 00    	jl     5b4 <printf+0x13d>
 4d7:	83 f8 78             	cmp    $0x78,%eax
 4da:	0f 8f d4 00 00 00    	jg     5b4 <printf+0x13d>
 4e0:	83 f8 63             	cmp    $0x63,%eax
 4e3:	0f 8c cb 00 00 00    	jl     5b4 <printf+0x13d>
 4e9:	83 e8 63             	sub    $0x63,%eax
 4ec:	83 f8 15             	cmp    $0x15,%eax
 4ef:	0f 87 bf 00 00 00    	ja     5b4 <printf+0x13d>
 4f5:	ff 24 85 64 07 00 00 	jmp    *0x764(,%eax,4)
        printint(fd, *ap, 10, 1);
 4fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ff:	8b 17                	mov    (%edi),%edx
 501:	83 ec 0c             	sub    $0xc,%esp
 504:	6a 01                	push   $0x1
 506:	b9 0a 00 00 00       	mov    $0xa,%ecx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	e8 d9 fe ff ff       	call   3ec <printint>
        ap++;
 513:	83 c7 04             	add    $0x4,%edi
 516:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 519:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 51c:	be 00 00 00 00       	mov    $0x0,%esi
 521:	eb 80                	jmp    4a3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 523:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 526:	8b 17                	mov    (%edi),%edx
 528:	83 ec 0c             	sub    $0xc,%esp
 52b:	6a 00                	push   $0x0
 52d:	b9 10 00 00 00       	mov    $0x10,%ecx
 532:	8b 45 08             	mov    0x8(%ebp),%eax
 535:	e8 b2 fe ff ff       	call   3ec <printint>
        ap++;
 53a:	83 c7 04             	add    $0x4,%edi
 53d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 540:	83 c4 10             	add    $0x10,%esp
      state = 0;
 543:	be 00 00 00 00       	mov    $0x0,%esi
 548:	e9 56 ff ff ff       	jmp    4a3 <printf+0x2c>
        s = (char*)*ap;
 54d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 550:	8b 30                	mov    (%eax),%esi
        ap++;
 552:	83 c0 04             	add    $0x4,%eax
 555:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 558:	85 f6                	test   %esi,%esi
 55a:	75 15                	jne    571 <printf+0xfa>
          s = "(null)";
 55c:	be 5c 07 00 00       	mov    $0x75c,%esi
 561:	eb 0e                	jmp    571 <printf+0xfa>
          putc(fd, *s);
 563:	0f be d2             	movsbl %dl,%edx
 566:	8b 45 08             	mov    0x8(%ebp),%eax
 569:	e8 64 fe ff ff       	call   3d2 <putc>
          s++;
 56e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 571:	0f b6 16             	movzbl (%esi),%edx
 574:	84 d2                	test   %dl,%dl
 576:	75 eb                	jne    563 <printf+0xec>
      state = 0;
 578:	be 00 00 00 00       	mov    $0x0,%esi
 57d:	e9 21 ff ff ff       	jmp    4a3 <printf+0x2c>
        putc(fd, *ap);
 582:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 585:	0f be 17             	movsbl (%edi),%edx
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	e8 42 fe ff ff       	call   3d2 <putc>
        ap++;
 590:	83 c7 04             	add    $0x4,%edi
 593:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 596:	be 00 00 00 00       	mov    $0x0,%esi
 59b:	e9 03 ff ff ff       	jmp    4a3 <printf+0x2c>
        putc(fd, c);
 5a0:	89 fa                	mov    %edi,%edx
 5a2:	8b 45 08             	mov    0x8(%ebp),%eax
 5a5:	e8 28 fe ff ff       	call   3d2 <putc>
      state = 0;
 5aa:	be 00 00 00 00       	mov    $0x0,%esi
 5af:	e9 ef fe ff ff       	jmp    4a3 <printf+0x2c>
        putc(fd, '%');
 5b4:	ba 25 00 00 00       	mov    $0x25,%edx
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	e8 11 fe ff ff       	call   3d2 <putc>
        putc(fd, c);
 5c1:	89 fa                	mov    %edi,%edx
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	e8 07 fe ff ff       	call   3d2 <putc>
      state = 0;
 5cb:	be 00 00 00 00       	mov    $0x0,%esi
 5d0:	e9 ce fe ff ff       	jmp    4a3 <printf+0x2c>
    }
  }
}
 5d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d8:	5b                   	pop    %ebx
 5d9:	5e                   	pop    %esi
 5da:	5f                   	pop    %edi
 5db:	5d                   	pop    %ebp
 5dc:	c3                   	ret    

000005dd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5dd:	55                   	push   %ebp
 5de:	89 e5                	mov    %esp,%ebp
 5e0:	57                   	push   %edi
 5e1:	56                   	push   %esi
 5e2:	53                   	push   %ebx
 5e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e9:	a1 40 0d 00 00       	mov    0xd40,%eax
 5ee:	eb 02                	jmp    5f2 <free+0x15>
 5f0:	89 d0                	mov    %edx,%eax
 5f2:	39 c8                	cmp    %ecx,%eax
 5f4:	73 04                	jae    5fa <free+0x1d>
 5f6:	39 08                	cmp    %ecx,(%eax)
 5f8:	77 12                	ja     60c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fa:	8b 10                	mov    (%eax),%edx
 5fc:	39 c2                	cmp    %eax,%edx
 5fe:	77 f0                	ja     5f0 <free+0x13>
 600:	39 c8                	cmp    %ecx,%eax
 602:	72 08                	jb     60c <free+0x2f>
 604:	39 ca                	cmp    %ecx,%edx
 606:	77 04                	ja     60c <free+0x2f>
 608:	89 d0                	mov    %edx,%eax
 60a:	eb e6                	jmp    5f2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 60c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 60f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 612:	8b 10                	mov    (%eax),%edx
 614:	39 d7                	cmp    %edx,%edi
 616:	74 19                	je     631 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 618:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 61b:	8b 50 04             	mov    0x4(%eax),%edx
 61e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 621:	39 ce                	cmp    %ecx,%esi
 623:	74 1b                	je     640 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 625:	89 08                	mov    %ecx,(%eax)
  freep = p;
 627:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 62c:	5b                   	pop    %ebx
 62d:	5e                   	pop    %esi
 62e:	5f                   	pop    %edi
 62f:	5d                   	pop    %ebp
 630:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 631:	03 72 04             	add    0x4(%edx),%esi
 634:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 637:	8b 10                	mov    (%eax),%edx
 639:	8b 12                	mov    (%edx),%edx
 63b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 63e:	eb db                	jmp    61b <free+0x3e>
    p->s.size += bp->s.size;
 640:	03 53 fc             	add    -0x4(%ebx),%edx
 643:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 646:	8b 53 f8             	mov    -0x8(%ebx),%edx
 649:	89 10                	mov    %edx,(%eax)
 64b:	eb da                	jmp    627 <free+0x4a>

0000064d <morecore>:

static Header*
morecore(uint nu)
{
 64d:	55                   	push   %ebp
 64e:	89 e5                	mov    %esp,%ebp
 650:	53                   	push   %ebx
 651:	83 ec 04             	sub    $0x4,%esp
 654:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 656:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 65b:	77 05                	ja     662 <morecore+0x15>
    nu = 4096;
 65d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 662:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 669:	83 ec 0c             	sub    $0xc,%esp
 66c:	50                   	push   %eax
 66d:	e8 38 fd ff ff       	call   3aa <sbrk>
  if(p == (char*)-1)
 672:	83 c4 10             	add    $0x10,%esp
 675:	83 f8 ff             	cmp    $0xffffffff,%eax
 678:	74 1c                	je     696 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 67a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 67d:	83 c0 08             	add    $0x8,%eax
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	50                   	push   %eax
 684:	e8 54 ff ff ff       	call   5dd <free>
  return freep;
 689:	a1 40 0d 00 00       	mov    0xd40,%eax
 68e:	83 c4 10             	add    $0x10,%esp
}
 691:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 694:	c9                   	leave  
 695:	c3                   	ret    
    return 0;
 696:	b8 00 00 00 00       	mov    $0x0,%eax
 69b:	eb f4                	jmp    691 <morecore+0x44>

0000069d <malloc>:

void*
malloc(uint nbytes)
{
 69d:	55                   	push   %ebp
 69e:	89 e5                	mov    %esp,%ebp
 6a0:	53                   	push   %ebx
 6a1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	8d 58 07             	lea    0x7(%eax),%ebx
 6aa:	c1 eb 03             	shr    $0x3,%ebx
 6ad:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6b0:	8b 0d 40 0d 00 00    	mov    0xd40,%ecx
 6b6:	85 c9                	test   %ecx,%ecx
 6b8:	74 04                	je     6be <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6ba:	8b 01                	mov    (%ecx),%eax
 6bc:	eb 4a                	jmp    708 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6be:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 6c5:	0d 00 00 
 6c8:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 6cf:	0d 00 00 
    base.s.size = 0;
 6d2:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 6d9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6dc:	b9 44 0d 00 00       	mov    $0xd44,%ecx
 6e1:	eb d7                	jmp    6ba <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6e3:	74 19                	je     6fe <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6e5:	29 da                	sub    %ebx,%edx
 6e7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6ea:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6ed:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6f0:	89 0d 40 0d 00 00    	mov    %ecx,0xd40
      return (void*)(p + 1);
 6f6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6fc:	c9                   	leave  
 6fd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6fe:	8b 10                	mov    (%eax),%edx
 700:	89 11                	mov    %edx,(%ecx)
 702:	eb ec                	jmp    6f0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 704:	89 c1                	mov    %eax,%ecx
 706:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 708:	8b 50 04             	mov    0x4(%eax),%edx
 70b:	39 da                	cmp    %ebx,%edx
 70d:	73 d4                	jae    6e3 <malloc+0x46>
    if(p == freep)
 70f:	39 05 40 0d 00 00    	cmp    %eax,0xd40
 715:	75 ed                	jne    704 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 717:	89 d8                	mov    %ebx,%eax
 719:	e8 2f ff ff ff       	call   64d <morecore>
 71e:	85 c0                	test   %eax,%eax
 720:	75 e2                	jne    704 <malloc+0x67>
 722:	eb d5                	jmp    6f9 <malloc+0x5c>
