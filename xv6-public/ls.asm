
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   8:	83 ec 0c             	sub    $0xc,%esp
   b:	53                   	push   %ebx
   c:	e8 1f 03 00 00       	call   330 <strlen>
  11:	01 d8                	add    %ebx,%eax
  13:	83 c4 10             	add    $0x10,%esp
  16:	eb 03                	jmp    1b <fmtname+0x1b>
  18:	83 e8 01             	sub    $0x1,%eax
  1b:	39 d8                	cmp    %ebx,%eax
  1d:	72 05                	jb     24 <fmtname+0x24>
  1f:	80 38 2f             	cmpb   $0x2f,(%eax)
  22:	75 f4                	jne    18 <fmtname+0x18>
    ;
  p++;
  24:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  27:	83 ec 0c             	sub    $0xc,%esp
  2a:	53                   	push   %ebx
  2b:	e8 00 03 00 00       	call   330 <strlen>
  30:	83 c4 10             	add    $0x10,%esp
  33:	83 f8 0d             	cmp    $0xd,%eax
  36:	76 09                	jbe    41 <fmtname+0x41>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}
  38:	89 d8                	mov    %ebx,%eax
  3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3d:	5b                   	pop    %ebx
  3e:	5e                   	pop    %esi
  3f:	5d                   	pop    %ebp
  40:	c3                   	ret    
  memmove(buf, p, strlen(p));
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	53                   	push   %ebx
  45:	e8 e6 02 00 00       	call   330 <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 6c 0d 00 00       	push   $0xd6c
  54:	e8 f6 03 00 00       	call   44f <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 cf 02 00 00       	call   330 <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 c5 02 00 00       	call   330 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 6c 0d 00 00       	add    $0xd6c,%eax
  7d:	50                   	push   %eax
  7e:	e8 c5 02 00 00       	call   348 <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 6c 0d 00 00       	mov    $0xd6c,%ebx
  8b:	eb ab                	jmp    38 <fmtname+0x38>

0000008d <ls>:

void
ls(char *path)
{
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	57                   	push   %edi
  91:	56                   	push   %esi
  92:	53                   	push   %ebx
  93:	81 ec 54 02 00 00    	sub    $0x254,%esp
  99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  9c:	6a 00                	push   $0x0
  9e:	53                   	push   %ebx
  9f:	e8 a7 04 00 00       	call   54b <open>
  a4:	83 c4 10             	add    $0x10,%esp
  a7:	85 c0                	test   %eax,%eax
  a9:	0f 88 8c 00 00 00    	js     13b <ls+0xae>
  af:	89 c7                	mov    %eax,%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  b1:	83 ec 08             	sub    $0x8,%esp
  b4:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
  ba:	50                   	push   %eax
  bb:	57                   	push   %edi
  bc:	e8 a2 04 00 00       	call   563 <fstat>
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	85 c0                	test   %eax,%eax
  c6:	0f 88 84 00 00 00    	js     150 <ls+0xc3>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  cc:	0f b7 85 c4 fd ff ff 	movzwl -0x23c(%ebp),%eax
  d3:	0f bf f0             	movswl %ax,%esi
  d6:	66 83 f8 01          	cmp    $0x1,%ax
  da:	0f 84 8d 00 00 00    	je     16d <ls+0xe0>
  e0:	66 83 f8 02          	cmp    $0x2,%ax
  e4:	75 41                	jne    127 <ls+0x9a>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
  e6:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
  ec:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
  f2:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
  f8:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
  fe:	83 ec 0c             	sub    $0xc,%esp
 101:	53                   	push   %ebx
 102:	e8 f9 fe ff ff       	call   0 <fmtname>
 107:	83 c4 08             	add    $0x8,%esp
 10a:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 110:	ff b5 b0 fd ff ff    	push   -0x250(%ebp)
 116:	56                   	push   %esi
 117:	50                   	push   %eax
 118:	68 38 09 00 00       	push   $0x938
 11d:	6a 01                	push   $0x1
 11f:	e8 3c 05 00 00       	call   660 <printf>
    break;
 124:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 127:	83 ec 0c             	sub    $0xc,%esp
 12a:	57                   	push   %edi
 12b:	e8 03 04 00 00       	call   533 <close>
 130:	83 c4 10             	add    $0x10,%esp
}
 133:	8d 65 f4             	lea    -0xc(%ebp),%esp
 136:	5b                   	pop    %ebx
 137:	5e                   	pop    %esi
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
    printf(2, "ls: cannot open %s\n", path);
 13b:	83 ec 04             	sub    $0x4,%esp
 13e:	53                   	push   %ebx
 13f:	68 10 09 00 00       	push   $0x910
 144:	6a 02                	push   $0x2
 146:	e8 15 05 00 00       	call   660 <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 24 09 00 00       	push   $0x924
 159:	6a 02                	push   $0x2
 15b:	e8 00 05 00 00       	call   660 <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 cb 03 00 00       	call   533 <close>
    return;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb c6                	jmp    133 <ls+0xa6>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	53                   	push   %ebx
 171:	e8 ba 01 00 00       	call   330 <strlen>
 176:	83 c0 10             	add    $0x10,%eax
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3d 00 02 00 00       	cmp    $0x200,%eax
 181:	76 14                	jbe    197 <ls+0x10a>
      printf(1, "ls: path too long\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 45 09 00 00       	push   $0x945
 18b:	6a 01                	push   $0x1
 18d:	e8 ce 04 00 00       	call   660 <printf>
      break;
 192:	83 c4 10             	add    $0x10,%esp
 195:	eb 90                	jmp    127 <ls+0x9a>
    strcpy(buf, path);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	53                   	push   %ebx
 19b:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a1:	56                   	push   %esi
 1a2:	e8 3d 01 00 00       	call   2e4 <strcpy>
    p = buf+strlen(buf);
 1a7:	89 34 24             	mov    %esi,(%esp)
 1aa:	e8 81 01 00 00       	call   330 <strlen>
 1af:	01 c6                	add    %eax,%esi
    *p++ = '/';
 1b1:	8d 46 01             	lea    0x1(%esi),%eax
 1b4:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 1ba:	c6 06 2f             	movb   $0x2f,(%esi)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	eb 19                	jmp    1db <ls+0x14e>
        printf(1, "ls: cannot stat %s\n", buf);
 1c2:	83 ec 04             	sub    $0x4,%esp
 1c5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1cb:	50                   	push   %eax
 1cc:	68 24 09 00 00       	push   $0x924
 1d1:	6a 01                	push   $0x1
 1d3:	e8 88 04 00 00       	call   660 <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 36 03 00 00       	call   523 <read>
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	83 f8 10             	cmp    $0x10,%eax
 1f3:	0f 85 2e ff ff ff    	jne    127 <ls+0x9a>
      if(de.inum == 0)
 1f9:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 200:	00 
 201:	74 d8                	je     1db <ls+0x14e>
      memmove(p, de.name, DIRSIZ);
 203:	83 ec 04             	sub    $0x4,%esp
 206:	6a 0e                	push   $0xe
 208:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 20e:	50                   	push   %eax
 20f:	ff b5 ac fd ff ff    	push   -0x254(%ebp)
 215:	e8 35 02 00 00       	call   44f <memmove>
      p[DIRSIZ] = 0;
 21a:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 21e:	83 c4 08             	add    $0x8,%esp
 221:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	e8 a7 01 00 00       	call   3db <stat>
 234:	83 c4 10             	add    $0x10,%esp
 237:	85 c0                	test   %eax,%eax
 239:	78 87                	js     1c2 <ls+0x135>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 23b:	8b 9d d4 fd ff ff    	mov    -0x22c(%ebp),%ebx
 241:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
 247:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 24d:	0f b7 8d c4 fd ff ff 	movzwl -0x23c(%ebp),%ecx
 254:	66 89 8d b0 fd ff ff 	mov    %cx,-0x250(%ebp)
 25b:	83 ec 0c             	sub    $0xc,%esp
 25e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 264:	50                   	push   %eax
 265:	e8 96 fd ff ff       	call   0 <fmtname>
 26a:	89 c2                	mov    %eax,%edx
 26c:	83 c4 08             	add    $0x8,%esp
 26f:	53                   	push   %ebx
 270:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 276:	0f bf 85 b0 fd ff ff 	movswl -0x250(%ebp),%eax
 27d:	50                   	push   %eax
 27e:	52                   	push   %edx
 27f:	68 38 09 00 00       	push   $0x938
 284:	6a 01                	push   $0x1
 286:	e8 d5 03 00 00       	call   660 <printf>
 28b:	83 c4 20             	add    $0x20,%esp
 28e:	e9 48 ff ff ff       	jmp    1db <ls+0x14e>

00000293 <main>:

int
main(int argc, char *argv[])
{
 293:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 297:	83 e4 f0             	and    $0xfffffff0,%esp
 29a:	ff 71 fc             	push   -0x4(%ecx)
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	57                   	push   %edi
 2a1:	56                   	push   %esi
 2a2:	53                   	push   %ebx
 2a3:	51                   	push   %ecx
 2a4:	83 ec 08             	sub    $0x8,%esp
 2a7:	8b 31                	mov    (%ecx),%esi
 2a9:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
 2ac:	83 fe 01             	cmp    $0x1,%esi
 2af:	7e 07                	jle    2b8 <main+0x25>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 2b1:	bb 01 00 00 00       	mov    $0x1,%ebx
 2b6:	eb 23                	jmp    2db <main+0x48>
    ls(".");
 2b8:	83 ec 0c             	sub    $0xc,%esp
 2bb:	68 58 09 00 00       	push   $0x958
 2c0:	e8 c8 fd ff ff       	call   8d <ls>
    exit();
 2c5:	e8 41 02 00 00       	call   50b <exit>
    ls(argv[i]);
 2ca:	83 ec 0c             	sub    $0xc,%esp
 2cd:	ff 34 9f             	push   (%edi,%ebx,4)
 2d0:	e8 b8 fd ff ff       	call   8d <ls>
  for(i=1; i<argc; i++)
 2d5:	83 c3 01             	add    $0x1,%ebx
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	39 f3                	cmp    %esi,%ebx
 2dd:	7c eb                	jl     2ca <main+0x37>
  exit();
 2df:	e8 27 02 00 00       	call   50b <exit>

000002e4 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	56                   	push   %esi
 2e8:	53                   	push   %ebx
 2e9:	8b 75 08             	mov    0x8(%ebp),%esi
 2ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ef:	89 f0                	mov    %esi,%eax
 2f1:	89 d1                	mov    %edx,%ecx
 2f3:	83 c2 01             	add    $0x1,%edx
 2f6:	89 c3                	mov    %eax,%ebx
 2f8:	83 c0 01             	add    $0x1,%eax
 2fb:	0f b6 09             	movzbl (%ecx),%ecx
 2fe:	88 0b                	mov    %cl,(%ebx)
 300:	84 c9                	test   %cl,%cl
 302:	75 ed                	jne    2f1 <strcpy+0xd>
    ;
  return os;
}
 304:	89 f0                	mov    %esi,%eax
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
 30d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 310:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 313:	eb 06                	jmp    31b <strcmp+0x11>
    p++, q++;
 315:	83 c1 01             	add    $0x1,%ecx
 318:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 31b:	0f b6 01             	movzbl (%ecx),%eax
 31e:	84 c0                	test   %al,%al
 320:	74 04                	je     326 <strcmp+0x1c>
 322:	3a 02                	cmp    (%edx),%al
 324:	74 ef                	je     315 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 326:	0f b6 c0             	movzbl %al,%eax
 329:	0f b6 12             	movzbl (%edx),%edx
 32c:	29 d0                	sub    %edx,%eax
}
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    

00000330 <strlen>:

uint
strlen(const char *s)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 336:	b8 00 00 00 00       	mov    $0x0,%eax
 33b:	eb 03                	jmp    340 <strlen+0x10>
 33d:	83 c0 01             	add    $0x1,%eax
 340:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 344:	75 f7                	jne    33d <strlen+0xd>
    ;
  return n;
}
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    

00000348 <memset>:

void*
memset(void *dst, int c, uint n)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	57                   	push   %edi
 34c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 34f:	89 d7                	mov    %edx,%edi
 351:	8b 4d 10             	mov    0x10(%ebp),%ecx
 354:	8b 45 0c             	mov    0xc(%ebp),%eax
 357:	fc                   	cld    
 358:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35a:	89 d0                	mov    %edx,%eax
 35c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <strchr>:

char*
strchr(const char *s, char c)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36b:	eb 03                	jmp    370 <strchr+0xf>
 36d:	83 c0 01             	add    $0x1,%eax
 370:	0f b6 10             	movzbl (%eax),%edx
 373:	84 d2                	test   %dl,%dl
 375:	74 06                	je     37d <strchr+0x1c>
    if(*s == c)
 377:	38 ca                	cmp    %cl,%dl
 379:	75 f2                	jne    36d <strchr+0xc>
 37b:	eb 05                	jmp    382 <strchr+0x21>
      return (char*)s;
  return 0;
 37d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 382:	5d                   	pop    %ebp
 383:	c3                   	ret    

00000384 <gets>:

char*
gets(char *buf, int max)
{
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	56                   	push   %esi
 389:	53                   	push   %ebx
 38a:	83 ec 1c             	sub    $0x1c,%esp
 38d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 390:	bb 00 00 00 00       	mov    $0x0,%ebx
 395:	89 de                	mov    %ebx,%esi
 397:	83 c3 01             	add    $0x1,%ebx
 39a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 39d:	7d 2e                	jge    3cd <gets+0x49>
    cc = read(0, &c, 1);
 39f:	83 ec 04             	sub    $0x4,%esp
 3a2:	6a 01                	push   $0x1
 3a4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3a7:	50                   	push   %eax
 3a8:	6a 00                	push   $0x0
 3aa:	e8 74 01 00 00       	call   523 <read>
    if(cc < 1)
 3af:	83 c4 10             	add    $0x10,%esp
 3b2:	85 c0                	test   %eax,%eax
 3b4:	7e 17                	jle    3cd <gets+0x49>
      break;
    buf[i++] = c;
 3b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3ba:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3bd:	3c 0a                	cmp    $0xa,%al
 3bf:	0f 94 c2             	sete   %dl
 3c2:	3c 0d                	cmp    $0xd,%al
 3c4:	0f 94 c0             	sete   %al
 3c7:	08 c2                	or     %al,%dl
 3c9:	74 ca                	je     395 <gets+0x11>
    buf[i++] = c;
 3cb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3cd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d1:	89 f8                	mov    %edi,%eax
 3d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3d6:	5b                   	pop    %ebx
 3d7:	5e                   	pop    %esi
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <stat>:

int
stat(const char *n, struct stat *st)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	56                   	push   %esi
 3df:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e0:	83 ec 08             	sub    $0x8,%esp
 3e3:	6a 00                	push   $0x0
 3e5:	ff 75 08             	push   0x8(%ebp)
 3e8:	e8 5e 01 00 00       	call   54b <open>
  if(fd < 0)
 3ed:	83 c4 10             	add    $0x10,%esp
 3f0:	85 c0                	test   %eax,%eax
 3f2:	78 24                	js     418 <stat+0x3d>
 3f4:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3f6:	83 ec 08             	sub    $0x8,%esp
 3f9:	ff 75 0c             	push   0xc(%ebp)
 3fc:	50                   	push   %eax
 3fd:	e8 61 01 00 00       	call   563 <fstat>
 402:	89 c6                	mov    %eax,%esi
  close(fd);
 404:	89 1c 24             	mov    %ebx,(%esp)
 407:	e8 27 01 00 00       	call   533 <close>
  return r;
 40c:	83 c4 10             	add    $0x10,%esp
}
 40f:	89 f0                	mov    %esi,%eax
 411:	8d 65 f8             	lea    -0x8(%ebp),%esp
 414:	5b                   	pop    %ebx
 415:	5e                   	pop    %esi
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
    return -1;
 418:	be ff ff ff ff       	mov    $0xffffffff,%esi
 41d:	eb f0                	jmp    40f <stat+0x34>

0000041f <atoi>:

int
atoi(const char *s)
{
 41f:	55                   	push   %ebp
 420:	89 e5                	mov    %esp,%ebp
 422:	53                   	push   %ebx
 423:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 426:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 42b:	eb 10                	jmp    43d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 42d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 430:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 433:	83 c1 01             	add    $0x1,%ecx
 436:	0f be c0             	movsbl %al,%eax
 439:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 43d:	0f b6 01             	movzbl (%ecx),%eax
 440:	8d 58 d0             	lea    -0x30(%eax),%ebx
 443:	80 fb 09             	cmp    $0x9,%bl
 446:	76 e5                	jbe    42d <atoi+0xe>
  return n;
}
 448:	89 d0                	mov    %edx,%eax
 44a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	56                   	push   %esi
 453:	53                   	push   %ebx
 454:	8b 75 08             	mov    0x8(%ebp),%esi
 457:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 45a:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 45d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 45f:	eb 0d                	jmp    46e <memmove+0x1f>
    *dst++ = *src++;
 461:	0f b6 01             	movzbl (%ecx),%eax
 464:	88 02                	mov    %al,(%edx)
 466:	8d 49 01             	lea    0x1(%ecx),%ecx
 469:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 46c:	89 d8                	mov    %ebx,%eax
 46e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 471:	85 c0                	test   %eax,%eax
 473:	7f ec                	jg     461 <memmove+0x12>
  return vdst;
}
 475:	89 f0                	mov    %esi,%eax
 477:	5b                   	pop    %ebx
 478:	5e                   	pop    %esi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    

0000047b <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 47b:	55                   	push   %ebp
 47c:	89 e5                	mov    %esp,%ebp
 47e:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(PGSIZE);
 481:	68 00 10 00 00       	push   $0x1000
 486:	e8 fb 03 00 00       	call   886 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 48b:	50                   	push   %eax
 48c:	ff 75 10             	push   0x10(%ebp)
 48f:	ff 75 0c             	push   0xc(%ebp)
 492:	ff 75 08             	push   0x8(%ebp)
 495:	e8 11 01 00 00       	call   5ab <clone>
}
 49a:	c9                   	leave  
 49b:	c3                   	ret    

0000049c <thread_join>:

int thread_join(){
 49c:	55                   	push   %ebp
 49d:	89 e5                	mov    %esp,%ebp
 49f:	53                   	push   %ebx
 4a0:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 4a3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a6:	50                   	push   %eax
 4a7:	e8 07 01 00 00       	call   5b3 <join>
  if (x < 0) {
 4ac:	83 c4 10             	add    $0x10,%esp
 4af:	85 c0                	test   %eax,%eax
 4b1:	78 17                	js     4ca <thread_join+0x2e>
 4b3:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 4b5:	83 ec 0c             	sub    $0xc,%esp
 4b8:	ff 75 f4             	push   -0xc(%ebp)
 4bb:	e8 06 03 00 00       	call   7c6 <free>
  return x;
 4c0:	83 c4 10             	add    $0x10,%esp
}
 4c3:	89 d8                	mov    %ebx,%eax
 4c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4c8:	c9                   	leave  
 4c9:	c3                   	ret    
    return -1;
 4ca:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 4cf:	eb f2                	jmp    4c3 <thread_join+0x27>

000004d1 <lock_init>:

void lock_init(lock_t *spin){
 4d1:	55                   	push   %ebp
 4d2:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
 4d7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4dd:	5d                   	pop    %ebp
 4de:	c3                   	ret    

000004df <lock_acquire>:

void lock_acquire(lock_t *spin){
 4df:	55                   	push   %ebp
 4e0:	89 e5                	mov    %esp,%ebp
 4e2:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4e5:	b8 01 00 00 00       	mov    $0x1,%eax
 4ea:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4ed:	85 c0                	test   %eax,%eax
 4ef:	75 f4                	jne    4e5 <lock_acquire+0x6>

}
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    

000004f3 <lock_release>:

void lock_release(lock_t *spin){
 4f3:	55                   	push   %ebp
 4f4:	89 e5                	mov    %esp,%ebp
 4f6:	8b 55 08             	mov    0x8(%ebp),%edx
 4f9:	b8 00 00 00 00       	mov    $0x0,%eax
 4fe:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 501:	5d                   	pop    %ebp
 502:	c3                   	ret    

00000503 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 503:	b8 01 00 00 00       	mov    $0x1,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <exit>:
SYSCALL(exit)
 50b:	b8 02 00 00 00       	mov    $0x2,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <wait>:
SYSCALL(wait)
 513:	b8 03 00 00 00       	mov    $0x3,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <pipe>:
SYSCALL(pipe)
 51b:	b8 04 00 00 00       	mov    $0x4,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <read>:
SYSCALL(read)
 523:	b8 05 00 00 00       	mov    $0x5,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <write>:
SYSCALL(write)
 52b:	b8 10 00 00 00       	mov    $0x10,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <close>:
SYSCALL(close)
 533:	b8 15 00 00 00       	mov    $0x15,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <kill>:
SYSCALL(kill)
 53b:	b8 06 00 00 00       	mov    $0x6,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <exec>:
SYSCALL(exec)
 543:	b8 07 00 00 00       	mov    $0x7,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <open>:
SYSCALL(open)
 54b:	b8 0f 00 00 00       	mov    $0xf,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <mknod>:
SYSCALL(mknod)
 553:	b8 11 00 00 00       	mov    $0x11,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <unlink>:
SYSCALL(unlink)
 55b:	b8 12 00 00 00       	mov    $0x12,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <fstat>:
SYSCALL(fstat)
 563:	b8 08 00 00 00       	mov    $0x8,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <link>:
SYSCALL(link)
 56b:	b8 13 00 00 00       	mov    $0x13,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <mkdir>:
SYSCALL(mkdir)
 573:	b8 14 00 00 00       	mov    $0x14,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <chdir>:
SYSCALL(chdir)
 57b:	b8 09 00 00 00       	mov    $0x9,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <dup>:
SYSCALL(dup)
 583:	b8 0a 00 00 00       	mov    $0xa,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <getpid>:
SYSCALL(getpid)
 58b:	b8 0b 00 00 00       	mov    $0xb,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <sbrk>:
SYSCALL(sbrk)
 593:	b8 0c 00 00 00       	mov    $0xc,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <sleep>:
SYSCALL(sleep)
 59b:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <uptime>:
SYSCALL(uptime)
 5a3:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <clone>:
SYSCALL(clone)
 5ab:	b8 16 00 00 00       	mov    $0x16,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <join>:
 5b3:	b8 17 00 00 00       	mov    $0x17,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5bb:	55                   	push   %ebp
 5bc:	89 e5                	mov    %esp,%ebp
 5be:	83 ec 1c             	sub    $0x1c,%esp
 5c1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5c4:	6a 01                	push   $0x1
 5c6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5c9:	52                   	push   %edx
 5ca:	50                   	push   %eax
 5cb:	e8 5b ff ff ff       	call   52b <write>
}
 5d0:	83 c4 10             	add    $0x10,%esp
 5d3:	c9                   	leave  
 5d4:	c3                   	ret    

000005d5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5d5:	55                   	push   %ebp
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	83 ec 2c             	sub    $0x2c,%esp
 5de:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e1:	89 d0                	mov    %edx,%eax
 5e3:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5e5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5e9:	0f 95 c1             	setne  %cl
 5ec:	c1 ea 1f             	shr    $0x1f,%edx
 5ef:	84 d1                	test   %dl,%cl
 5f1:	74 44                	je     637 <printint+0x62>
    neg = 1;
    x = -xx;
 5f3:	f7 d8                	neg    %eax
 5f5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5f7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5fe:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 603:	89 c8                	mov    %ecx,%eax
 605:	ba 00 00 00 00       	mov    $0x0,%edx
 60a:	f7 f6                	div    %esi
 60c:	89 df                	mov    %ebx,%edi
 60e:	83 c3 01             	add    $0x1,%ebx
 611:	0f b6 92 bc 09 00 00 	movzbl 0x9bc(%edx),%edx
 618:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 61c:	89 ca                	mov    %ecx,%edx
 61e:	89 c1                	mov    %eax,%ecx
 620:	39 d6                	cmp    %edx,%esi
 622:	76 df                	jbe    603 <printint+0x2e>
  if(neg)
 624:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 628:	74 31                	je     65b <printint+0x86>
    buf[i++] = '-';
 62a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 62f:	8d 5f 02             	lea    0x2(%edi),%ebx
 632:	8b 75 d0             	mov    -0x30(%ebp),%esi
 635:	eb 17                	jmp    64e <printint+0x79>
    x = xx;
 637:	89 c1                	mov    %eax,%ecx
  neg = 0;
 639:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 640:	eb bc                	jmp    5fe <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 642:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 647:	89 f0                	mov    %esi,%eax
 649:	e8 6d ff ff ff       	call   5bb <putc>
  while(--i >= 0)
 64e:	83 eb 01             	sub    $0x1,%ebx
 651:	79 ef                	jns    642 <printint+0x6d>
}
 653:	83 c4 2c             	add    $0x2c,%esp
 656:	5b                   	pop    %ebx
 657:	5e                   	pop    %esi
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret    
 65b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 65e:	eb ee                	jmp    64e <printint+0x79>

00000660 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 669:	8d 45 10             	lea    0x10(%ebp),%eax
 66c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 66f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 674:	bb 00 00 00 00       	mov    $0x0,%ebx
 679:	eb 14                	jmp    68f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 67b:	89 fa                	mov    %edi,%edx
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	e8 36 ff ff ff       	call   5bb <putc>
 685:	eb 05                	jmp    68c <printf+0x2c>
      }
    } else if(state == '%'){
 687:	83 fe 25             	cmp    $0x25,%esi
 68a:	74 25                	je     6b1 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 68c:	83 c3 01             	add    $0x1,%ebx
 68f:	8b 45 0c             	mov    0xc(%ebp),%eax
 692:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 696:	84 c0                	test   %al,%al
 698:	0f 84 20 01 00 00    	je     7be <printf+0x15e>
    c = fmt[i] & 0xff;
 69e:	0f be f8             	movsbl %al,%edi
 6a1:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6a4:	85 f6                	test   %esi,%esi
 6a6:	75 df                	jne    687 <printf+0x27>
      if(c == '%'){
 6a8:	83 f8 25             	cmp    $0x25,%eax
 6ab:	75 ce                	jne    67b <printf+0x1b>
        state = '%';
 6ad:	89 c6                	mov    %eax,%esi
 6af:	eb db                	jmp    68c <printf+0x2c>
      if(c == 'd'){
 6b1:	83 f8 25             	cmp    $0x25,%eax
 6b4:	0f 84 cf 00 00 00    	je     789 <printf+0x129>
 6ba:	0f 8c dd 00 00 00    	jl     79d <printf+0x13d>
 6c0:	83 f8 78             	cmp    $0x78,%eax
 6c3:	0f 8f d4 00 00 00    	jg     79d <printf+0x13d>
 6c9:	83 f8 63             	cmp    $0x63,%eax
 6cc:	0f 8c cb 00 00 00    	jl     79d <printf+0x13d>
 6d2:	83 e8 63             	sub    $0x63,%eax
 6d5:	83 f8 15             	cmp    $0x15,%eax
 6d8:	0f 87 bf 00 00 00    	ja     79d <printf+0x13d>
 6de:	ff 24 85 64 09 00 00 	jmp    *0x964(,%eax,4)
        printint(fd, *ap, 10, 1);
 6e5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e8:	8b 17                	mov    (%edi),%edx
 6ea:	83 ec 0c             	sub    $0xc,%esp
 6ed:	6a 01                	push   $0x1
 6ef:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	e8 d9 fe ff ff       	call   5d5 <printint>
        ap++;
 6fc:	83 c7 04             	add    $0x4,%edi
 6ff:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 702:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 705:	be 00 00 00 00       	mov    $0x0,%esi
 70a:	eb 80                	jmp    68c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 70c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 70f:	8b 17                	mov    (%edi),%edx
 711:	83 ec 0c             	sub    $0xc,%esp
 714:	6a 00                	push   $0x0
 716:	b9 10 00 00 00       	mov    $0x10,%ecx
 71b:	8b 45 08             	mov    0x8(%ebp),%eax
 71e:	e8 b2 fe ff ff       	call   5d5 <printint>
        ap++;
 723:	83 c7 04             	add    $0x4,%edi
 726:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 729:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72c:	be 00 00 00 00       	mov    $0x0,%esi
 731:	e9 56 ff ff ff       	jmp    68c <printf+0x2c>
        s = (char*)*ap;
 736:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 739:	8b 30                	mov    (%eax),%esi
        ap++;
 73b:	83 c0 04             	add    $0x4,%eax
 73e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 741:	85 f6                	test   %esi,%esi
 743:	75 15                	jne    75a <printf+0xfa>
          s = "(null)";
 745:	be 5a 09 00 00       	mov    $0x95a,%esi
 74a:	eb 0e                	jmp    75a <printf+0xfa>
          putc(fd, *s);
 74c:	0f be d2             	movsbl %dl,%edx
 74f:	8b 45 08             	mov    0x8(%ebp),%eax
 752:	e8 64 fe ff ff       	call   5bb <putc>
          s++;
 757:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 75a:	0f b6 16             	movzbl (%esi),%edx
 75d:	84 d2                	test   %dl,%dl
 75f:	75 eb                	jne    74c <printf+0xec>
      state = 0;
 761:	be 00 00 00 00       	mov    $0x0,%esi
 766:	e9 21 ff ff ff       	jmp    68c <printf+0x2c>
        putc(fd, *ap);
 76b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 76e:	0f be 17             	movsbl (%edi),%edx
 771:	8b 45 08             	mov    0x8(%ebp),%eax
 774:	e8 42 fe ff ff       	call   5bb <putc>
        ap++;
 779:	83 c7 04             	add    $0x4,%edi
 77c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 77f:	be 00 00 00 00       	mov    $0x0,%esi
 784:	e9 03 ff ff ff       	jmp    68c <printf+0x2c>
        putc(fd, c);
 789:	89 fa                	mov    %edi,%edx
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	e8 28 fe ff ff       	call   5bb <putc>
      state = 0;
 793:	be 00 00 00 00       	mov    $0x0,%esi
 798:	e9 ef fe ff ff       	jmp    68c <printf+0x2c>
        putc(fd, '%');
 79d:	ba 25 00 00 00       	mov    $0x25,%edx
 7a2:	8b 45 08             	mov    0x8(%ebp),%eax
 7a5:	e8 11 fe ff ff       	call   5bb <putc>
        putc(fd, c);
 7aa:	89 fa                	mov    %edi,%edx
 7ac:	8b 45 08             	mov    0x8(%ebp),%eax
 7af:	e8 07 fe ff ff       	call   5bb <putc>
      state = 0;
 7b4:	be 00 00 00 00       	mov    $0x0,%esi
 7b9:	e9 ce fe ff ff       	jmp    68c <printf+0x2c>
    }
  }
}
 7be:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c1:	5b                   	pop    %ebx
 7c2:	5e                   	pop    %esi
 7c3:	5f                   	pop    %edi
 7c4:	5d                   	pop    %ebp
 7c5:	c3                   	ret    

000007c6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c6:	55                   	push   %ebp
 7c7:	89 e5                	mov    %esp,%ebp
 7c9:	57                   	push   %edi
 7ca:	56                   	push   %esi
 7cb:	53                   	push   %ebx
 7cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7cf:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d2:	a1 7c 0d 00 00       	mov    0xd7c,%eax
 7d7:	eb 02                	jmp    7db <free+0x15>
 7d9:	89 d0                	mov    %edx,%eax
 7db:	39 c8                	cmp    %ecx,%eax
 7dd:	73 04                	jae    7e3 <free+0x1d>
 7df:	39 08                	cmp    %ecx,(%eax)
 7e1:	77 12                	ja     7f5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e3:	8b 10                	mov    (%eax),%edx
 7e5:	39 c2                	cmp    %eax,%edx
 7e7:	77 f0                	ja     7d9 <free+0x13>
 7e9:	39 c8                	cmp    %ecx,%eax
 7eb:	72 08                	jb     7f5 <free+0x2f>
 7ed:	39 ca                	cmp    %ecx,%edx
 7ef:	77 04                	ja     7f5 <free+0x2f>
 7f1:	89 d0                	mov    %edx,%eax
 7f3:	eb e6                	jmp    7db <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fb:	8b 10                	mov    (%eax),%edx
 7fd:	39 d7                	cmp    %edx,%edi
 7ff:	74 19                	je     81a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 801:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 804:	8b 50 04             	mov    0x4(%eax),%edx
 807:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 80a:	39 ce                	cmp    %ecx,%esi
 80c:	74 1b                	je     829 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 80e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 810:	a3 7c 0d 00 00       	mov    %eax,0xd7c
}
 815:	5b                   	pop    %ebx
 816:	5e                   	pop    %esi
 817:	5f                   	pop    %edi
 818:	5d                   	pop    %ebp
 819:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 81a:	03 72 04             	add    0x4(%edx),%esi
 81d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 820:	8b 10                	mov    (%eax),%edx
 822:	8b 12                	mov    (%edx),%edx
 824:	89 53 f8             	mov    %edx,-0x8(%ebx)
 827:	eb db                	jmp    804 <free+0x3e>
    p->s.size += bp->s.size;
 829:	03 53 fc             	add    -0x4(%ebx),%edx
 82c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 82f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 832:	89 10                	mov    %edx,(%eax)
 834:	eb da                	jmp    810 <free+0x4a>

00000836 <morecore>:

static Header*
morecore(uint nu)
{
 836:	55                   	push   %ebp
 837:	89 e5                	mov    %esp,%ebp
 839:	53                   	push   %ebx
 83a:	83 ec 04             	sub    $0x4,%esp
 83d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 83f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 844:	77 05                	ja     84b <morecore+0x15>
    nu = 4096;
 846:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 84b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 852:	83 ec 0c             	sub    $0xc,%esp
 855:	50                   	push   %eax
 856:	e8 38 fd ff ff       	call   593 <sbrk>
  if(p == (char*)-1)
 85b:	83 c4 10             	add    $0x10,%esp
 85e:	83 f8 ff             	cmp    $0xffffffff,%eax
 861:	74 1c                	je     87f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 863:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 866:	83 c0 08             	add    $0x8,%eax
 869:	83 ec 0c             	sub    $0xc,%esp
 86c:	50                   	push   %eax
 86d:	e8 54 ff ff ff       	call   7c6 <free>
  return freep;
 872:	a1 7c 0d 00 00       	mov    0xd7c,%eax
 877:	83 c4 10             	add    $0x10,%esp
}
 87a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 87d:	c9                   	leave  
 87e:	c3                   	ret    
    return 0;
 87f:	b8 00 00 00 00       	mov    $0x0,%eax
 884:	eb f4                	jmp    87a <morecore+0x44>

00000886 <malloc>:

void*
malloc(uint nbytes)
{
 886:	55                   	push   %ebp
 887:	89 e5                	mov    %esp,%ebp
 889:	53                   	push   %ebx
 88a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88d:	8b 45 08             	mov    0x8(%ebp),%eax
 890:	8d 58 07             	lea    0x7(%eax),%ebx
 893:	c1 eb 03             	shr    $0x3,%ebx
 896:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 899:	8b 0d 7c 0d 00 00    	mov    0xd7c,%ecx
 89f:	85 c9                	test   %ecx,%ecx
 8a1:	74 04                	je     8a7 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a3:	8b 01                	mov    (%ecx),%eax
 8a5:	eb 4a                	jmp    8f1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8a7:	c7 05 7c 0d 00 00 80 	movl   $0xd80,0xd7c
 8ae:	0d 00 00 
 8b1:	c7 05 80 0d 00 00 80 	movl   $0xd80,0xd80
 8b8:	0d 00 00 
    base.s.size = 0;
 8bb:	c7 05 84 0d 00 00 00 	movl   $0x0,0xd84
 8c2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8c5:	b9 80 0d 00 00       	mov    $0xd80,%ecx
 8ca:	eb d7                	jmp    8a3 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8cc:	74 19                	je     8e7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8ce:	29 da                	sub    %ebx,%edx
 8d0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8d6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8d9:	89 0d 7c 0d 00 00    	mov    %ecx,0xd7c
      return (void*)(p + 1);
 8df:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8e5:	c9                   	leave  
 8e6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8e7:	8b 10                	mov    (%eax),%edx
 8e9:	89 11                	mov    %edx,(%ecx)
 8eb:	eb ec                	jmp    8d9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ed:	89 c1                	mov    %eax,%ecx
 8ef:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8f1:	8b 50 04             	mov    0x4(%eax),%edx
 8f4:	39 da                	cmp    %ebx,%edx
 8f6:	73 d4                	jae    8cc <malloc+0x46>
    if(p == freep)
 8f8:	39 05 7c 0d 00 00    	cmp    %eax,0xd7c
 8fe:	75 ed                	jne    8ed <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 900:	89 d8                	mov    %ebx,%eax
 902:	e8 2f ff ff ff       	call   836 <morecore>
 907:	85 c0                	test   %eax,%eax
 909:	75 e2                	jne    8ed <malloc+0x67>
 90b:	eb d5                	jmp    8e2 <malloc+0x5c>
