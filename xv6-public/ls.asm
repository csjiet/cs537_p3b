
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
  4f:	68 68 0d 00 00       	push   $0xd68
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
  78:	05 68 0d 00 00       	add    $0xd68,%eax
  7d:	50                   	push   %eax
  7e:	e8 c5 02 00 00       	call   348 <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 68 0d 00 00       	mov    $0xd68,%ebx
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
  9f:	e8 aa 04 00 00       	call   54e <open>
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
  bc:	e8 a5 04 00 00       	call   566 <fstat>
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
 11f:	e8 3f 05 00 00       	call   663 <printf>
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
 12b:	e8 06 04 00 00       	call   536 <close>
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
 146:	e8 18 05 00 00       	call   663 <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 24 09 00 00       	push   $0x924
 159:	6a 02                	push   $0x2
 15b:	e8 03 05 00 00       	call   663 <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 ce 03 00 00       	call   536 <close>
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
 18d:	e8 d1 04 00 00       	call   663 <printf>
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
 1d3:	e8 8b 04 00 00       	call   663 <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 39 03 00 00       	call   526 <read>
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
 286:	e8 d8 03 00 00       	call   663 <printf>
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
 2c5:	e8 44 02 00 00       	call   50e <exit>
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
 2df:	e8 2a 02 00 00       	call   50e <exit>

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
 3aa:	e8 77 01 00 00       	call   526 <read>
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
 3e8:	e8 61 01 00 00       	call   54e <open>
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
 3fd:	e8 64 01 00 00       	call   566 <fstat>
 402:	89 c6                	mov    %eax,%esi
  close(fd);
 404:	89 1c 24             	mov    %ebx,(%esp)
 407:	e8 2a 01 00 00       	call   536 <close>
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

  void* stack = malloc(2 * PGSIZE);
 481:	68 00 20 00 00       	push   $0x2000
 486:	e8 fe 03 00 00       	call   889 <malloc>
  if ((uint)stack%PGSIZE){
 48b:	83 c4 10             	add    $0x10,%esp
 48e:	a9 ff 0f 00 00       	test   $0xfff,%eax
 493:	74 0a                	je     49f <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 495:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 49a:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 49f:	50                   	push   %eax
 4a0:	ff 75 10             	push   0x10(%ebp)
 4a3:	ff 75 0c             	push   0xc(%ebp)
 4a6:	ff 75 08             	push   0x8(%ebp)
 4a9:	e8 00 01 00 00       	call   5ae <clone>
}
 4ae:	c9                   	leave  
 4af:	c3                   	ret    

000004b0 <thread_join>:

int thread_join(){
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 4b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ba:	50                   	push   %eax
 4bb:	e8 f6 00 00 00       	call   5b6 <join>
 4c0:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 4c2:	83 c4 04             	add    $0x4,%esp
 4c5:	ff 75 f4             	push   -0xc(%ebp)
 4c8:	e8 fc 02 00 00       	call   7c9 <free>
  return x;
}
 4cd:	89 d8                	mov    %ebx,%eax
 4cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d2:	c9                   	leave  
 4d3:	c3                   	ret    

000004d4 <lock_init>:

void lock_init(lock_t *spin){
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4e0:	5d                   	pop    %ebp
 4e1:	c3                   	ret    

000004e2 <lock_acquire>:

void lock_acquire(lock_t *spin){
 4e2:	55                   	push   %ebp
 4e3:	89 e5                	mov    %esp,%ebp
 4e5:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 4e8:	b8 01 00 00 00       	mov    $0x1,%eax
 4ed:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 4f0:	85 c0                	test   %eax,%eax
 4f2:	75 f4                	jne    4e8 <lock_acquire+0x6>

}
 4f4:	5d                   	pop    %ebp
 4f5:	c3                   	ret    

000004f6 <lock_release>:

void lock_release(lock_t *spin){
 4f6:	55                   	push   %ebp
 4f7:	89 e5                	mov    %esp,%ebp
 4f9:	8b 55 08             	mov    0x8(%ebp),%edx
 4fc:	b8 00 00 00 00       	mov    $0x0,%eax
 501:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 504:	5d                   	pop    %ebp
 505:	c3                   	ret    

00000506 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 506:	b8 01 00 00 00       	mov    $0x1,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <exit>:
SYSCALL(exit)
 50e:	b8 02 00 00 00       	mov    $0x2,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <wait>:
SYSCALL(wait)
 516:	b8 03 00 00 00       	mov    $0x3,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <pipe>:
SYSCALL(pipe)
 51e:	b8 04 00 00 00       	mov    $0x4,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <read>:
SYSCALL(read)
 526:	b8 05 00 00 00       	mov    $0x5,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <write>:
SYSCALL(write)
 52e:	b8 10 00 00 00       	mov    $0x10,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <close>:
SYSCALL(close)
 536:	b8 15 00 00 00       	mov    $0x15,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <kill>:
SYSCALL(kill)
 53e:	b8 06 00 00 00       	mov    $0x6,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <exec>:
SYSCALL(exec)
 546:	b8 07 00 00 00       	mov    $0x7,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <open>:
SYSCALL(open)
 54e:	b8 0f 00 00 00       	mov    $0xf,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <mknod>:
SYSCALL(mknod)
 556:	b8 11 00 00 00       	mov    $0x11,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <unlink>:
SYSCALL(unlink)
 55e:	b8 12 00 00 00       	mov    $0x12,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <fstat>:
SYSCALL(fstat)
 566:	b8 08 00 00 00       	mov    $0x8,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <link>:
SYSCALL(link)
 56e:	b8 13 00 00 00       	mov    $0x13,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <mkdir>:
SYSCALL(mkdir)
 576:	b8 14 00 00 00       	mov    $0x14,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <chdir>:
SYSCALL(chdir)
 57e:	b8 09 00 00 00       	mov    $0x9,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <dup>:
SYSCALL(dup)
 586:	b8 0a 00 00 00       	mov    $0xa,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <getpid>:
SYSCALL(getpid)
 58e:	b8 0b 00 00 00       	mov    $0xb,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <sbrk>:
SYSCALL(sbrk)
 596:	b8 0c 00 00 00       	mov    $0xc,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <sleep>:
SYSCALL(sleep)
 59e:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <uptime>:
SYSCALL(uptime)
 5a6:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <clone>:
SYSCALL(clone)
 5ae:	b8 16 00 00 00       	mov    $0x16,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <join>:
 5b6:	b8 17 00 00 00       	mov    $0x17,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5be:	55                   	push   %ebp
 5bf:	89 e5                	mov    %esp,%ebp
 5c1:	83 ec 1c             	sub    $0x1c,%esp
 5c4:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5c7:	6a 01                	push   $0x1
 5c9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5cc:	52                   	push   %edx
 5cd:	50                   	push   %eax
 5ce:	e8 5b ff ff ff       	call   52e <write>
}
 5d3:	83 c4 10             	add    $0x10,%esp
 5d6:	c9                   	leave  
 5d7:	c3                   	ret    

000005d8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5d8:	55                   	push   %ebp
 5d9:	89 e5                	mov    %esp,%ebp
 5db:	57                   	push   %edi
 5dc:	56                   	push   %esi
 5dd:	53                   	push   %ebx
 5de:	83 ec 2c             	sub    $0x2c,%esp
 5e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e4:	89 d0                	mov    %edx,%eax
 5e6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5e8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5ec:	0f 95 c1             	setne  %cl
 5ef:	c1 ea 1f             	shr    $0x1f,%edx
 5f2:	84 d1                	test   %dl,%cl
 5f4:	74 44                	je     63a <printint+0x62>
    neg = 1;
    x = -xx;
 5f6:	f7 d8                	neg    %eax
 5f8:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5fa:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 601:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 606:	89 c8                	mov    %ecx,%eax
 608:	ba 00 00 00 00       	mov    $0x0,%edx
 60d:	f7 f6                	div    %esi
 60f:	89 df                	mov    %ebx,%edi
 611:	83 c3 01             	add    $0x1,%ebx
 614:	0f b6 92 bc 09 00 00 	movzbl 0x9bc(%edx),%edx
 61b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 61f:	89 ca                	mov    %ecx,%edx
 621:	89 c1                	mov    %eax,%ecx
 623:	39 d6                	cmp    %edx,%esi
 625:	76 df                	jbe    606 <printint+0x2e>
  if(neg)
 627:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 62b:	74 31                	je     65e <printint+0x86>
    buf[i++] = '-';
 62d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 632:	8d 5f 02             	lea    0x2(%edi),%ebx
 635:	8b 75 d0             	mov    -0x30(%ebp),%esi
 638:	eb 17                	jmp    651 <printint+0x79>
    x = xx;
 63a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 63c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 643:	eb bc                	jmp    601 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 645:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 64a:	89 f0                	mov    %esi,%eax
 64c:	e8 6d ff ff ff       	call   5be <putc>
  while(--i >= 0)
 651:	83 eb 01             	sub    $0x1,%ebx
 654:	79 ef                	jns    645 <printint+0x6d>
}
 656:	83 c4 2c             	add    $0x2c,%esp
 659:	5b                   	pop    %ebx
 65a:	5e                   	pop    %esi
 65b:	5f                   	pop    %edi
 65c:	5d                   	pop    %ebp
 65d:	c3                   	ret    
 65e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 661:	eb ee                	jmp    651 <printint+0x79>

00000663 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 663:	55                   	push   %ebp
 664:	89 e5                	mov    %esp,%ebp
 666:	57                   	push   %edi
 667:	56                   	push   %esi
 668:	53                   	push   %ebx
 669:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 66c:	8d 45 10             	lea    0x10(%ebp),%eax
 66f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 672:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 677:	bb 00 00 00 00       	mov    $0x0,%ebx
 67c:	eb 14                	jmp    692 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 67e:	89 fa                	mov    %edi,%edx
 680:	8b 45 08             	mov    0x8(%ebp),%eax
 683:	e8 36 ff ff ff       	call   5be <putc>
 688:	eb 05                	jmp    68f <printf+0x2c>
      }
    } else if(state == '%'){
 68a:	83 fe 25             	cmp    $0x25,%esi
 68d:	74 25                	je     6b4 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 68f:	83 c3 01             	add    $0x1,%ebx
 692:	8b 45 0c             	mov    0xc(%ebp),%eax
 695:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 699:	84 c0                	test   %al,%al
 69b:	0f 84 20 01 00 00    	je     7c1 <printf+0x15e>
    c = fmt[i] & 0xff;
 6a1:	0f be f8             	movsbl %al,%edi
 6a4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6a7:	85 f6                	test   %esi,%esi
 6a9:	75 df                	jne    68a <printf+0x27>
      if(c == '%'){
 6ab:	83 f8 25             	cmp    $0x25,%eax
 6ae:	75 ce                	jne    67e <printf+0x1b>
        state = '%';
 6b0:	89 c6                	mov    %eax,%esi
 6b2:	eb db                	jmp    68f <printf+0x2c>
      if(c == 'd'){
 6b4:	83 f8 25             	cmp    $0x25,%eax
 6b7:	0f 84 cf 00 00 00    	je     78c <printf+0x129>
 6bd:	0f 8c dd 00 00 00    	jl     7a0 <printf+0x13d>
 6c3:	83 f8 78             	cmp    $0x78,%eax
 6c6:	0f 8f d4 00 00 00    	jg     7a0 <printf+0x13d>
 6cc:	83 f8 63             	cmp    $0x63,%eax
 6cf:	0f 8c cb 00 00 00    	jl     7a0 <printf+0x13d>
 6d5:	83 e8 63             	sub    $0x63,%eax
 6d8:	83 f8 15             	cmp    $0x15,%eax
 6db:	0f 87 bf 00 00 00    	ja     7a0 <printf+0x13d>
 6e1:	ff 24 85 64 09 00 00 	jmp    *0x964(,%eax,4)
        printint(fd, *ap, 10, 1);
 6e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6eb:	8b 17                	mov    (%edi),%edx
 6ed:	83 ec 0c             	sub    $0xc,%esp
 6f0:	6a 01                	push   $0x1
 6f2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	e8 d9 fe ff ff       	call   5d8 <printint>
        ap++;
 6ff:	83 c7 04             	add    $0x4,%edi
 702:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 705:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 708:	be 00 00 00 00       	mov    $0x0,%esi
 70d:	eb 80                	jmp    68f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 70f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 712:	8b 17                	mov    (%edi),%edx
 714:	83 ec 0c             	sub    $0xc,%esp
 717:	6a 00                	push   $0x0
 719:	b9 10 00 00 00       	mov    $0x10,%ecx
 71e:	8b 45 08             	mov    0x8(%ebp),%eax
 721:	e8 b2 fe ff ff       	call   5d8 <printint>
        ap++;
 726:	83 c7 04             	add    $0x4,%edi
 729:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 72c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72f:	be 00 00 00 00       	mov    $0x0,%esi
 734:	e9 56 ff ff ff       	jmp    68f <printf+0x2c>
        s = (char*)*ap;
 739:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73c:	8b 30                	mov    (%eax),%esi
        ap++;
 73e:	83 c0 04             	add    $0x4,%eax
 741:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 744:	85 f6                	test   %esi,%esi
 746:	75 15                	jne    75d <printf+0xfa>
          s = "(null)";
 748:	be 5a 09 00 00       	mov    $0x95a,%esi
 74d:	eb 0e                	jmp    75d <printf+0xfa>
          putc(fd, *s);
 74f:	0f be d2             	movsbl %dl,%edx
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	e8 64 fe ff ff       	call   5be <putc>
          s++;
 75a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 75d:	0f b6 16             	movzbl (%esi),%edx
 760:	84 d2                	test   %dl,%dl
 762:	75 eb                	jne    74f <printf+0xec>
      state = 0;
 764:	be 00 00 00 00       	mov    $0x0,%esi
 769:	e9 21 ff ff ff       	jmp    68f <printf+0x2c>
        putc(fd, *ap);
 76e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 771:	0f be 17             	movsbl (%edi),%edx
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	e8 42 fe ff ff       	call   5be <putc>
        ap++;
 77c:	83 c7 04             	add    $0x4,%edi
 77f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 782:	be 00 00 00 00       	mov    $0x0,%esi
 787:	e9 03 ff ff ff       	jmp    68f <printf+0x2c>
        putc(fd, c);
 78c:	89 fa                	mov    %edi,%edx
 78e:	8b 45 08             	mov    0x8(%ebp),%eax
 791:	e8 28 fe ff ff       	call   5be <putc>
      state = 0;
 796:	be 00 00 00 00       	mov    $0x0,%esi
 79b:	e9 ef fe ff ff       	jmp    68f <printf+0x2c>
        putc(fd, '%');
 7a0:	ba 25 00 00 00       	mov    $0x25,%edx
 7a5:	8b 45 08             	mov    0x8(%ebp),%eax
 7a8:	e8 11 fe ff ff       	call   5be <putc>
        putc(fd, c);
 7ad:	89 fa                	mov    %edi,%edx
 7af:	8b 45 08             	mov    0x8(%ebp),%eax
 7b2:	e8 07 fe ff ff       	call   5be <putc>
      state = 0;
 7b7:	be 00 00 00 00       	mov    $0x0,%esi
 7bc:	e9 ce fe ff ff       	jmp    68f <printf+0x2c>
    }
  }
}
 7c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c4:	5b                   	pop    %ebx
 7c5:	5e                   	pop    %esi
 7c6:	5f                   	pop    %edi
 7c7:	5d                   	pop    %ebp
 7c8:	c3                   	ret    

000007c9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c9:	55                   	push   %ebp
 7ca:	89 e5                	mov    %esp,%ebp
 7cc:	57                   	push   %edi
 7cd:	56                   	push   %esi
 7ce:	53                   	push   %ebx
 7cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d5:	a1 78 0d 00 00       	mov    0xd78,%eax
 7da:	eb 02                	jmp    7de <free+0x15>
 7dc:	89 d0                	mov    %edx,%eax
 7de:	39 c8                	cmp    %ecx,%eax
 7e0:	73 04                	jae    7e6 <free+0x1d>
 7e2:	39 08                	cmp    %ecx,(%eax)
 7e4:	77 12                	ja     7f8 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e6:	8b 10                	mov    (%eax),%edx
 7e8:	39 c2                	cmp    %eax,%edx
 7ea:	77 f0                	ja     7dc <free+0x13>
 7ec:	39 c8                	cmp    %ecx,%eax
 7ee:	72 08                	jb     7f8 <free+0x2f>
 7f0:	39 ca                	cmp    %ecx,%edx
 7f2:	77 04                	ja     7f8 <free+0x2f>
 7f4:	89 d0                	mov    %edx,%eax
 7f6:	eb e6                	jmp    7de <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fe:	8b 10                	mov    (%eax),%edx
 800:	39 d7                	cmp    %edx,%edi
 802:	74 19                	je     81d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 804:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 807:	8b 50 04             	mov    0x4(%eax),%edx
 80a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 80d:	39 ce                	cmp    %ecx,%esi
 80f:	74 1b                	je     82c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 811:	89 08                	mov    %ecx,(%eax)
  freep = p;
 813:	a3 78 0d 00 00       	mov    %eax,0xd78
}
 818:	5b                   	pop    %ebx
 819:	5e                   	pop    %esi
 81a:	5f                   	pop    %edi
 81b:	5d                   	pop    %ebp
 81c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 81d:	03 72 04             	add    0x4(%edx),%esi
 820:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 823:	8b 10                	mov    (%eax),%edx
 825:	8b 12                	mov    (%edx),%edx
 827:	89 53 f8             	mov    %edx,-0x8(%ebx)
 82a:	eb db                	jmp    807 <free+0x3e>
    p->s.size += bp->s.size;
 82c:	03 53 fc             	add    -0x4(%ebx),%edx
 82f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 832:	8b 53 f8             	mov    -0x8(%ebx),%edx
 835:	89 10                	mov    %edx,(%eax)
 837:	eb da                	jmp    813 <free+0x4a>

00000839 <morecore>:

static Header*
morecore(uint nu)
{
 839:	55                   	push   %ebp
 83a:	89 e5                	mov    %esp,%ebp
 83c:	53                   	push   %ebx
 83d:	83 ec 04             	sub    $0x4,%esp
 840:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 842:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 847:	77 05                	ja     84e <morecore+0x15>
    nu = 4096;
 849:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 84e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 855:	83 ec 0c             	sub    $0xc,%esp
 858:	50                   	push   %eax
 859:	e8 38 fd ff ff       	call   596 <sbrk>
  if(p == (char*)-1)
 85e:	83 c4 10             	add    $0x10,%esp
 861:	83 f8 ff             	cmp    $0xffffffff,%eax
 864:	74 1c                	je     882 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 866:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 869:	83 c0 08             	add    $0x8,%eax
 86c:	83 ec 0c             	sub    $0xc,%esp
 86f:	50                   	push   %eax
 870:	e8 54 ff ff ff       	call   7c9 <free>
  return freep;
 875:	a1 78 0d 00 00       	mov    0xd78,%eax
 87a:	83 c4 10             	add    $0x10,%esp
}
 87d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 880:	c9                   	leave  
 881:	c3                   	ret    
    return 0;
 882:	b8 00 00 00 00       	mov    $0x0,%eax
 887:	eb f4                	jmp    87d <morecore+0x44>

00000889 <malloc>:

void*
malloc(uint nbytes)
{
 889:	55                   	push   %ebp
 88a:	89 e5                	mov    %esp,%ebp
 88c:	53                   	push   %ebx
 88d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 890:	8b 45 08             	mov    0x8(%ebp),%eax
 893:	8d 58 07             	lea    0x7(%eax),%ebx
 896:	c1 eb 03             	shr    $0x3,%ebx
 899:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 89c:	8b 0d 78 0d 00 00    	mov    0xd78,%ecx
 8a2:	85 c9                	test   %ecx,%ecx
 8a4:	74 04                	je     8aa <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a6:	8b 01                	mov    (%ecx),%eax
 8a8:	eb 4a                	jmp    8f4 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8aa:	c7 05 78 0d 00 00 7c 	movl   $0xd7c,0xd78
 8b1:	0d 00 00 
 8b4:	c7 05 7c 0d 00 00 7c 	movl   $0xd7c,0xd7c
 8bb:	0d 00 00 
    base.s.size = 0;
 8be:	c7 05 80 0d 00 00 00 	movl   $0x0,0xd80
 8c5:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8c8:	b9 7c 0d 00 00       	mov    $0xd7c,%ecx
 8cd:	eb d7                	jmp    8a6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8cf:	74 19                	je     8ea <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8d1:	29 da                	sub    %ebx,%edx
 8d3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8d9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8dc:	89 0d 78 0d 00 00    	mov    %ecx,0xd78
      return (void*)(p + 1);
 8e2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8e8:	c9                   	leave  
 8e9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8ea:	8b 10                	mov    (%eax),%edx
 8ec:	89 11                	mov    %edx,(%ecx)
 8ee:	eb ec                	jmp    8dc <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f0:	89 c1                	mov    %eax,%ecx
 8f2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8f4:	8b 50 04             	mov    0x4(%eax),%edx
 8f7:	39 da                	cmp    %ebx,%edx
 8f9:	73 d4                	jae    8cf <malloc+0x46>
    if(p == freep)
 8fb:	39 05 78 0d 00 00    	cmp    %eax,0xd78
 901:	75 ed                	jne    8f0 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 903:	89 d8                	mov    %ebx,%eax
 905:	e8 2f ff ff ff       	call   839 <morecore>
 90a:	85 c0                	test   %eax,%eax
 90c:	75 e2                	jne    8f0 <malloc+0x67>
 90e:	eb d5                	jmp    8e5 <malloc+0x5c>
