
_test_17:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void merge_sort(void *array, void *size);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
  12:	e8 c1 05 00 00       	call   5d8 <getpid>
  17:	a3 dc 0d 00 00       	mov    %eax,0xddc
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 a6 08 00 00       	call   8d3 <malloc>
  2d:	a3 d8 0d 00 00       	mov    %eax,0xdd8
    for(int i = 0; i < size; i++){
  32:	83 c4 10             	add    $0x10,%esp
  35:	ba 00 00 00 00       	mov    $0x0,%edx
  3a:	eb 11                	jmp    4d <main+0x4d>
        global[i] = size - i - 1;
  3c:	29 d0                	sub    %edx,%eax
  3e:	83 e8 01             	sub    $0x1,%eax
  41:	8b 0d d8 0d 00 00    	mov    0xdd8,%ecx
  47:	89 04 91             	mov    %eax,(%ecx,%edx,4)
    for(int i = 0; i < size; i++){
  4a:	83 c2 01             	add    $0x1,%edx
  4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  50:	39 d0                	cmp    %edx,%eax
  52:	7f e8                	jg     3c <main+0x3c>
    }

   int thread_pid = thread_create(merge_sort, global, &size);
  54:	83 ec 04             	sub    $0x4,%esp
  57:	8d 45 f4             	lea    -0xc(%ebp),%eax
  5a:	50                   	push   %eax
  5b:	ff 35 d8 0d 00 00    	push   0xdd8
  61:	68 a3 02 00 00       	push   $0x2a3
  66:	e8 5a 04 00 00       	call   4c5 <thread_create>
  6b:	89 c3                	mov    %eax,%ebx
   assert(thread_pid > 0);
  6d:	83 c4 10             	add    $0x10,%esp
  70:	85 c0                	test   %eax,%eax
  72:	7e 6e                	jle    e2 <main+0xe2>

   int join_pid = thread_join();
  74:	e8 81 04 00 00       	call   4fa <thread_join>
   assert(join_pid == thread_pid);
  79:	39 c3                	cmp    %eax,%ebx
  7b:	0f 85 aa 00 00 00    	jne    12b <main+0x12b>
   assert(global[0] == 0);
  81:	a1 d8 0d 00 00       	mov    0xdd8,%eax
  86:	83 38 00             	cmpl   $0x0,(%eax)
  89:	0f 85 e5 00 00 00    	jne    174 <main+0x174>
   assert(global[10] == 10); 
  8f:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  93:	0f 84 24 01 00 00    	je     1bd <main+0x1bd>
  99:	6a 35                	push   $0x35
  9b:	68 5c 09 00 00       	push   $0x95c
  a0:	68 66 09 00 00       	push   $0x966
  a5:	6a 01                	push   $0x1
  a7:	e8 01 06 00 00       	call   6ad <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 c4 09 00 00       	push   $0x9c4
  b4:	68 7d 09 00 00       	push   $0x97d
  b9:	6a 01                	push   $0x1
  bb:	e8 ed 05 00 00       	call   6ad <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 91 09 00 00       	push   $0x991
  c8:	6a 01                	push   $0x1
  ca:	e8 de 05 00 00       	call   6ad <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 dc 0d 00 00    	push   0xddc
  d8:	e8 ab 04 00 00       	call   588 <kill>
  dd:	e8 76 04 00 00       	call   558 <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 5c 09 00 00       	push   $0x95c
  e9:	68 66 09 00 00       	push   $0x966
  ee:	6a 01                	push   $0x1
  f0:	e8 b8 05 00 00       	call   6ad <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 6e 09 00 00       	push   $0x96e
  fd:	68 7d 09 00 00       	push   $0x97d
 102:	6a 01                	push   $0x1
 104:	e8 a4 05 00 00       	call   6ad <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 91 09 00 00       	push   $0x991
 111:	6a 01                	push   $0x1
 113:	e8 95 05 00 00       	call   6ad <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 dc 0d 00 00    	push   0xddc
 121:	e8 62 04 00 00       	call   588 <kill>
 126:	e8 2d 04 00 00       	call   558 <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 5c 09 00 00       	push   $0x95c
 132:	68 66 09 00 00       	push   $0x966
 137:	6a 01                	push   $0x1
 139:	e8 6f 05 00 00       	call   6ad <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 9e 09 00 00       	push   $0x99e
 146:	68 7d 09 00 00       	push   $0x97d
 14b:	6a 01                	push   $0x1
 14d:	e8 5b 05 00 00       	call   6ad <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 91 09 00 00       	push   $0x991
 15a:	6a 01                	push   $0x1
 15c:	e8 4c 05 00 00       	call   6ad <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 dc 0d 00 00    	push   0xddc
 16a:	e8 19 04 00 00       	call   588 <kill>
 16f:	e8 e4 03 00 00       	call   558 <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 5c 09 00 00       	push   $0x95c
 17b:	68 66 09 00 00       	push   $0x966
 180:	6a 01                	push   $0x1
 182:	e8 26 05 00 00       	call   6ad <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 b5 09 00 00       	push   $0x9b5
 18f:	68 7d 09 00 00       	push   $0x97d
 194:	6a 01                	push   $0x1
 196:	e8 12 05 00 00       	call   6ad <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 91 09 00 00       	push   $0x991
 1a3:	6a 01                	push   $0x1
 1a5:	e8 03 05 00 00       	call   6ad <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 dc 0d 00 00    	push   0xddc
 1b3:	e8 d0 03 00 00       	call   588 <kill>
 1b8:	e8 9b 03 00 00       	call   558 <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 d5 09 00 00       	push   $0x9d5
 1c5:	6a 01                	push   $0x1
 1c7:	e8 e1 04 00 00       	call   6ad <printf>
   exit();
 1cc:	e8 87 03 00 00       	call   558 <exit>

000001d1 <merge>:
}

void merge(int* array, int* array_right,int size_left, int size_right,int*temp_array){
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	57                   	push   %edi
 1d5:	56                   	push   %esi
 1d6:	53                   	push   %ebx
 1d7:	83 ec 04             	sub    $0x4,%esp
    int i = 0;
    int j = 0;
    int k = 0;
 1da:	b8 00 00 00 00       	mov    $0x0,%eax
    int j = 0;
 1df:	ba 00 00 00 00       	mov    $0x0,%edx
    int i = 0;
 1e4:	b9 00 00 00 00       	mov    $0x0,%ecx
    while(i < size_left && j < size_right){
 1e9:	eb 0c                	jmp    1f7 <merge+0x26>
        if(array[i] < array_right[j]){
            temp_array[k] = array[i];
            i++;
        }
        else{
            temp_array[k] = array_right[j];
 1eb:	8b 7d 18             	mov    0x18(%ebp),%edi
 1ee:	89 34 87             	mov    %esi,(%edi,%eax,4)
            j++;
 1f1:	83 c2 01             	add    $0x1,%edx
        }
        k++;
 1f4:	83 c0 01             	add    $0x1,%eax
    while(i < size_left && j < size_right){
 1f7:	3b 4d 10             	cmp    0x10(%ebp),%ecx
 1fa:	0f 9c c3             	setl   %bl
 1fd:	89 de                	mov    %ebx,%esi
 1ff:	3b 55 14             	cmp    0x14(%ebp),%edx
 202:	0f 9c c3             	setl   %bl
 205:	89 df                	mov    %ebx,%edi
 207:	89 f3                	mov    %esi,%ebx
 209:	84 db                	test   %bl,%bl
 20b:	74 50                	je     25d <merge+0x8c>
 20d:	89 fb                	mov    %edi,%ebx
 20f:	84 db                	test   %bl,%bl
 211:	74 1b                	je     22e <merge+0x5d>
        if(array[i] < array_right[j]){
 213:	8b 7d 08             	mov    0x8(%ebp),%edi
 216:	8b 3c 8f             	mov    (%edi,%ecx,4),%edi
 219:	8b 75 0c             	mov    0xc(%ebp),%esi
 21c:	8b 34 96             	mov    (%esi,%edx,4),%esi
 21f:	39 f7                	cmp    %esi,%edi
 221:	7d c8                	jge    1eb <merge+0x1a>
            temp_array[k] = array[i];
 223:	8b 75 18             	mov    0x18(%ebp),%esi
 226:	89 3c 86             	mov    %edi,(%esi,%eax,4)
            i++;
 229:	83 c1 01             	add    $0x1,%ecx
 22c:	eb c6                	jmp    1f4 <merge+0x23>
 22e:	8b 7d 08             	mov    0x8(%ebp),%edi
 231:	8b 5d 18             	mov    0x18(%ebp),%ebx
 234:	89 55 f0             	mov    %edx,-0x10(%ebp)
 237:	8b 75 10             	mov    0x10(%ebp),%esi
 23a:	eb 0c                	jmp    248 <merge+0x77>
    }
    while(i < size_left){
        temp_array[k] = array[i];
 23c:	8b 14 8f             	mov    (%edi,%ecx,4),%edx
 23f:	89 14 83             	mov    %edx,(%ebx,%eax,4)
        i++;
 242:	83 c1 01             	add    $0x1,%ecx
        k++;
 245:	83 c0 01             	add    $0x1,%eax
    while(i < size_left){
 248:	39 f1                	cmp    %esi,%ecx
 24a:	7c f0                	jl     23c <merge+0x6b>
 24c:	8b 55 f0             	mov    -0x10(%ebp),%edx
 24f:	89 75 10             	mov    %esi,0x10(%ebp)
 252:	89 7d 08             	mov    %edi,0x8(%ebp)
 255:	8b 75 0c             	mov    0xc(%ebp),%esi
 258:	8b 4d 14             	mov    0x14(%ebp),%ecx
 25b:	eb 1a                	jmp    277 <merge+0xa6>
 25d:	89 55 f0             	mov    %edx,-0x10(%ebp)
 260:	8b 7d 08             	mov    0x8(%ebp),%edi
 263:	8b 75 10             	mov    0x10(%ebp),%esi
 266:	8b 5d 18             	mov    0x18(%ebp),%ebx
 269:	eb dd                	jmp    248 <merge+0x77>
    }
    while(j < size_right){
        temp_array[k] = array_right[j];
 26b:	8b 3c 96             	mov    (%esi,%edx,4),%edi
 26e:	89 3c 83             	mov    %edi,(%ebx,%eax,4)
        j++;
 271:	83 c2 01             	add    $0x1,%edx
        k++;
 274:	83 c0 01             	add    $0x1,%eax
    while(j < size_right){
 277:	39 ca                	cmp    %ecx,%edx
 279:	7c f0                	jl     26b <merge+0x9a>
    }
    for(int i = 0; i < size_left + size_right; i++){
 27b:	8b 7d 08             	mov    0x8(%ebp),%edi
 27e:	b8 00 00 00 00       	mov    $0x0,%eax
 283:	8b 4d 10             	mov    0x10(%ebp),%ecx
 286:	8b 75 14             	mov    0x14(%ebp),%esi
 289:	eb 09                	jmp    294 <merge+0xc3>
        array[i] = temp_array[i];
 28b:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 28e:	89 14 87             	mov    %edx,(%edi,%eax,4)
    for(int i = 0; i < size_left + size_right; i++){
 291:	83 c0 01             	add    $0x1,%eax
 294:	8d 14 31             	lea    (%ecx,%esi,1),%edx
 297:	39 c2                	cmp    %eax,%edx
 299:	7f f0                	jg     28b <merge+0xba>
    }
   
}
 29b:	83 c4 04             	add    $0x4,%esp
 29e:	5b                   	pop    %ebx
 29f:	5e                   	pop    %esi
 2a0:	5f                   	pop    %edi
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    

000002a3 <merge_sort>:

void merge_sort(void *arg1, void *arg2) {
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	57                   	push   %edi
 2a7:	56                   	push   %esi
 2a8:	53                   	push   %ebx
 2a9:	83 ec 1c             	sub    $0x1c,%esp
 2ac:	8b 75 08             	mov    0x8(%ebp),%esi
   int *array = (int*)arg1;
   int size = *(int*)arg2;
 2af:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b2:	8b 18                	mov    (%eax),%ebx

   if (size==1){
 2b4:	83 fb 01             	cmp    $0x1,%ebx
 2b7:	74 70                	je     329 <merge_sort+0x86>
       exit();
   }

   
   int size_left = size/2;
 2b9:	b9 02 00 00 00       	mov    $0x2,%ecx
 2be:	89 d8                	mov    %ebx,%eax
 2c0:	99                   	cltd   
 2c1:	f7 f9                	idiv   %ecx
 2c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   int size_right = size-size/2;
 2c6:	89 da                	mov    %ebx,%edx
 2c8:	29 c2                	sub    %eax,%edx
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)

   int* array_right = (int*)(array + size_left);
 2cd:	8d 3c 86             	lea    (%esi,%eax,4),%edi
//    merge_sort(array_right, size_right);

//    int nested_thread_pid_l = thread_create(merge_sort, array, &size_left);
//    int nested_thread_pid_r = thread_create(merge_sort, array_right, &size_right);
   
   thread_create(merge_sort, array, &size_left);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 2d6:	50                   	push   %eax
 2d7:	56                   	push   %esi
 2d8:	68 a3 02 00 00       	push   $0x2a3
 2dd:	e8 e3 01 00 00       	call   4c5 <thread_create>
   thread_create(merge_sort, array_right, &size_right);
 2e2:	83 c4 0c             	add    $0xc,%esp
 2e5:	8d 45 e0             	lea    -0x20(%ebp),%eax
 2e8:	50                   	push   %eax
 2e9:	57                   	push   %edi
 2ea:	68 a3 02 00 00       	push   $0x2a3
 2ef:	e8 d1 01 00 00       	call   4c5 <thread_create>

   thread_join();
 2f4:	e8 01 02 00 00       	call   4fa <thread_join>
   thread_join();
 2f9:	e8 fc 01 00 00       	call   4fa <thread_join>
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 2fe:	c1 e3 02             	shl    $0x2,%ebx
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 ca 05 00 00       	call   8d3 <malloc>
 309:	89 c3                	mov    %eax,%ebx

   merge(array,array_right,size_left,size_right,temp_array);
 30b:	89 04 24             	mov    %eax,(%esp)
 30e:	ff 75 e0             	push   -0x20(%ebp)
 311:	ff 75 e4             	push   -0x1c(%ebp)
 314:	57                   	push   %edi
 315:	56                   	push   %esi
 316:	e8 b6 fe ff ff       	call   1d1 <merge>

   free(temp_array);
 31b:	83 c4 14             	add    $0x14,%esp
 31e:	53                   	push   %ebx
 31f:	e8 ef 04 00 00       	call   813 <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 2f 02 00 00       	call   558 <exit>
       exit();
 329:	e8 2a 02 00 00       	call   558 <exit>

0000032e <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	56                   	push   %esi
 332:	53                   	push   %ebx
 333:	8b 75 08             	mov    0x8(%ebp),%esi
 336:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 339:	89 f0                	mov    %esi,%eax
 33b:	89 d1                	mov    %edx,%ecx
 33d:	83 c2 01             	add    $0x1,%edx
 340:	89 c3                	mov    %eax,%ebx
 342:	83 c0 01             	add    $0x1,%eax
 345:	0f b6 09             	movzbl (%ecx),%ecx
 348:	88 0b                	mov    %cl,(%ebx)
 34a:	84 c9                	test   %cl,%cl
 34c:	75 ed                	jne    33b <strcpy+0xd>
    ;
  return os;
}
 34e:	89 f0                	mov    %esi,%eax
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    

00000354 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 35d:	eb 06                	jmp    365 <strcmp+0x11>
    p++, q++;
 35f:	83 c1 01             	add    $0x1,%ecx
 362:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 365:	0f b6 01             	movzbl (%ecx),%eax
 368:	84 c0                	test   %al,%al
 36a:	74 04                	je     370 <strcmp+0x1c>
 36c:	3a 02                	cmp    (%edx),%al
 36e:	74 ef                	je     35f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 370:	0f b6 c0             	movzbl %al,%eax
 373:	0f b6 12             	movzbl (%edx),%edx
 376:	29 d0                	sub    %edx,%eax
}
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    

0000037a <strlen>:

uint
strlen(const char *s)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 380:	b8 00 00 00 00       	mov    $0x0,%eax
 385:	eb 03                	jmp    38a <strlen+0x10>
 387:	83 c0 01             	add    $0x1,%eax
 38a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 38e:	75 f7                	jne    387 <strlen+0xd>
    ;
  return n;
}
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <memset>:

void*
memset(void *dst, int c, uint n)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	57                   	push   %edi
 396:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 399:	89 d7                	mov    %edx,%edi
 39b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	fc                   	cld    
 3a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a4:	89 d0                	mov    %edx,%eax
 3a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a9:	c9                   	leave  
 3aa:	c3                   	ret    

000003ab <strchr>:

char*
strchr(const char *s, char c)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	8b 45 08             	mov    0x8(%ebp),%eax
 3b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3b5:	eb 03                	jmp    3ba <strchr+0xf>
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	0f b6 10             	movzbl (%eax),%edx
 3bd:	84 d2                	test   %dl,%dl
 3bf:	74 06                	je     3c7 <strchr+0x1c>
    if(*s == c)
 3c1:	38 ca                	cmp    %cl,%dl
 3c3:	75 f2                	jne    3b7 <strchr+0xc>
 3c5:	eb 05                	jmp    3cc <strchr+0x21>
      return (char*)s;
  return 0;
 3c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3cc:	5d                   	pop    %ebp
 3cd:	c3                   	ret    

000003ce <gets>:

char*
gets(char *buf, int max)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	57                   	push   %edi
 3d2:	56                   	push   %esi
 3d3:	53                   	push   %ebx
 3d4:	83 ec 1c             	sub    $0x1c,%esp
 3d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3da:	bb 00 00 00 00       	mov    $0x0,%ebx
 3df:	89 de                	mov    %ebx,%esi
 3e1:	83 c3 01             	add    $0x1,%ebx
 3e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e7:	7d 2e                	jge    417 <gets+0x49>
    cc = read(0, &c, 1);
 3e9:	83 ec 04             	sub    $0x4,%esp
 3ec:	6a 01                	push   $0x1
 3ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f1:	50                   	push   %eax
 3f2:	6a 00                	push   $0x0
 3f4:	e8 77 01 00 00       	call   570 <read>
    if(cc < 1)
 3f9:	83 c4 10             	add    $0x10,%esp
 3fc:	85 c0                	test   %eax,%eax
 3fe:	7e 17                	jle    417 <gets+0x49>
      break;
    buf[i++] = c;
 400:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 404:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 407:	3c 0a                	cmp    $0xa,%al
 409:	0f 94 c2             	sete   %dl
 40c:	3c 0d                	cmp    $0xd,%al
 40e:	0f 94 c0             	sete   %al
 411:	08 c2                	or     %al,%dl
 413:	74 ca                	je     3df <gets+0x11>
    buf[i++] = c;
 415:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 417:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 41b:	89 f8                	mov    %edi,%eax
 41d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    

00000425 <stat>:

int
stat(const char *n, struct stat *st)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	56                   	push   %esi
 429:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 42a:	83 ec 08             	sub    $0x8,%esp
 42d:	6a 00                	push   $0x0
 42f:	ff 75 08             	push   0x8(%ebp)
 432:	e8 61 01 00 00       	call   598 <open>
  if(fd < 0)
 437:	83 c4 10             	add    $0x10,%esp
 43a:	85 c0                	test   %eax,%eax
 43c:	78 24                	js     462 <stat+0x3d>
 43e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 440:	83 ec 08             	sub    $0x8,%esp
 443:	ff 75 0c             	push   0xc(%ebp)
 446:	50                   	push   %eax
 447:	e8 64 01 00 00       	call   5b0 <fstat>
 44c:	89 c6                	mov    %eax,%esi
  close(fd);
 44e:	89 1c 24             	mov    %ebx,(%esp)
 451:	e8 2a 01 00 00       	call   580 <close>
  return r;
 456:	83 c4 10             	add    $0x10,%esp
}
 459:	89 f0                	mov    %esi,%eax
 45b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    
    return -1;
 462:	be ff ff ff ff       	mov    $0xffffffff,%esi
 467:	eb f0                	jmp    459 <stat+0x34>

00000469 <atoi>:

int
atoi(const char *s)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	53                   	push   %ebx
 46d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 470:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 475:	eb 10                	jmp    487 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 477:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 47a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 47d:	83 c1 01             	add    $0x1,%ecx
 480:	0f be c0             	movsbl %al,%eax
 483:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 487:	0f b6 01             	movzbl (%ecx),%eax
 48a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 48d:	80 fb 09             	cmp    $0x9,%bl
 490:	76 e5                	jbe    477 <atoi+0xe>
  return n;
}
 492:	89 d0                	mov    %edx,%eax
 494:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	8b 75 08             	mov    0x8(%ebp),%esi
 4a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4a9:	eb 0d                	jmp    4b8 <memmove+0x1f>
    *dst++ = *src++;
 4ab:	0f b6 01             	movzbl (%ecx),%eax
 4ae:	88 02                	mov    %al,(%edx)
 4b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 4b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4b6:	89 d8                	mov    %ebx,%eax
 4b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4bb:	85 c0                	test   %eax,%eax
 4bd:	7f ec                	jg     4ab <memmove+0x12>
  return vdst;
}
 4bf:	89 f0                	mov    %esi,%eax
 4c1:	5b                   	pop    %ebx
 4c2:	5e                   	pop    %esi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    

000004c5 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
 4cb:	68 00 20 00 00       	push   $0x2000
 4d0:	e8 fe 03 00 00       	call   8d3 <malloc>
  if ((uint)stack%PGSIZE){
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	a9 ff 0f 00 00       	test   $0xfff,%eax
 4dd:	74 0a                	je     4e9 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
 4df:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 4e4:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
 4e9:	50                   	push   %eax
 4ea:	ff 75 10             	push   0x10(%ebp)
 4ed:	ff 75 0c             	push   0xc(%ebp)
 4f0:	ff 75 08             	push   0x8(%ebp)
 4f3:	e8 00 01 00 00       	call   5f8 <clone>
}
 4f8:	c9                   	leave  
 4f9:	c3                   	ret    

000004fa <thread_join>:

int thread_join(){
 4fa:	55                   	push   %ebp
 4fb:	89 e5                	mov    %esp,%ebp
 4fd:	53                   	push   %ebx
 4fe:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 501:	8d 45 f4             	lea    -0xc(%ebp),%eax
 504:	50                   	push   %eax
 505:	e8 f6 00 00 00       	call   600 <join>
 50a:	89 c3                	mov    %eax,%ebx
  // if (x < 0) {
  //   return -1;
  // }
  // //Free stack
  free(stack);
 50c:	83 c4 04             	add    $0x4,%esp
 50f:	ff 75 f4             	push   -0xc(%ebp)
 512:	e8 fc 02 00 00       	call   813 <free>
  return x;
}
 517:	89 d8                	mov    %ebx,%eax
 519:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 51c:	c9                   	leave  
 51d:	c3                   	ret    

0000051e <lock_init>:

void lock_init(lock_t *spin){
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 52a:	5d                   	pop    %ebp
 52b:	c3                   	ret    

0000052c <lock_acquire>:

void lock_acquire(lock_t *spin){
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 532:	b8 01 00 00 00       	mov    $0x1,%eax
 537:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 53a:	85 c0                	test   %eax,%eax
 53c:	75 f4                	jne    532 <lock_acquire+0x6>

}
 53e:	5d                   	pop    %ebp
 53f:	c3                   	ret    

00000540 <lock_release>:

void lock_release(lock_t *spin){
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	8b 55 08             	mov    0x8(%ebp),%edx
 546:	b8 00 00 00 00       	mov    $0x0,%eax
 54b:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 54e:	5d                   	pop    %ebp
 54f:	c3                   	ret    

00000550 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 550:	b8 01 00 00 00       	mov    $0x1,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <exit>:
SYSCALL(exit)
 558:	b8 02 00 00 00       	mov    $0x2,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <wait>:
SYSCALL(wait)
 560:	b8 03 00 00 00       	mov    $0x3,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <pipe>:
SYSCALL(pipe)
 568:	b8 04 00 00 00       	mov    $0x4,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <read>:
SYSCALL(read)
 570:	b8 05 00 00 00       	mov    $0x5,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <write>:
SYSCALL(write)
 578:	b8 10 00 00 00       	mov    $0x10,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <close>:
SYSCALL(close)
 580:	b8 15 00 00 00       	mov    $0x15,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <kill>:
SYSCALL(kill)
 588:	b8 06 00 00 00       	mov    $0x6,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <exec>:
SYSCALL(exec)
 590:	b8 07 00 00 00       	mov    $0x7,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <open>:
SYSCALL(open)
 598:	b8 0f 00 00 00       	mov    $0xf,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <mknod>:
SYSCALL(mknod)
 5a0:	b8 11 00 00 00       	mov    $0x11,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <unlink>:
SYSCALL(unlink)
 5a8:	b8 12 00 00 00       	mov    $0x12,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <fstat>:
SYSCALL(fstat)
 5b0:	b8 08 00 00 00       	mov    $0x8,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <link>:
SYSCALL(link)
 5b8:	b8 13 00 00 00       	mov    $0x13,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <mkdir>:
SYSCALL(mkdir)
 5c0:	b8 14 00 00 00       	mov    $0x14,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <chdir>:
SYSCALL(chdir)
 5c8:	b8 09 00 00 00       	mov    $0x9,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <dup>:
SYSCALL(dup)
 5d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <getpid>:
SYSCALL(getpid)
 5d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <sbrk>:
SYSCALL(sbrk)
 5e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <sleep>:
SYSCALL(sleep)
 5e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <uptime>:
SYSCALL(uptime)
 5f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <clone>:
SYSCALL(clone)
 5f8:	b8 16 00 00 00       	mov    $0x16,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <join>:
 600:	b8 17 00 00 00       	mov    $0x17,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 608:	55                   	push   %ebp
 609:	89 e5                	mov    %esp,%ebp
 60b:	83 ec 1c             	sub    $0x1c,%esp
 60e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 611:	6a 01                	push   $0x1
 613:	8d 55 f4             	lea    -0xc(%ebp),%edx
 616:	52                   	push   %edx
 617:	50                   	push   %eax
 618:	e8 5b ff ff ff       	call   578 <write>
}
 61d:	83 c4 10             	add    $0x10,%esp
 620:	c9                   	leave  
 621:	c3                   	ret    

00000622 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 622:	55                   	push   %ebp
 623:	89 e5                	mov    %esp,%ebp
 625:	57                   	push   %edi
 626:	56                   	push   %esi
 627:	53                   	push   %ebx
 628:	83 ec 2c             	sub    $0x2c,%esp
 62b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 62e:	89 d0                	mov    %edx,%eax
 630:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 632:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 636:	0f 95 c1             	setne  %cl
 639:	c1 ea 1f             	shr    $0x1f,%edx
 63c:	84 d1                	test   %dl,%cl
 63e:	74 44                	je     684 <printint+0x62>
    neg = 1;
    x = -xx;
 640:	f7 d8                	neg    %eax
 642:	89 c1                	mov    %eax,%ecx
    neg = 1;
 644:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 64b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 650:	89 c8                	mov    %ecx,%eax
 652:	ba 00 00 00 00       	mov    $0x0,%edx
 657:	f7 f6                	div    %esi
 659:	89 df                	mov    %ebx,%edi
 65b:	83 c3 01             	add    $0x1,%ebx
 65e:	0f b6 92 44 0a 00 00 	movzbl 0xa44(%edx),%edx
 665:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 669:	89 ca                	mov    %ecx,%edx
 66b:	89 c1                	mov    %eax,%ecx
 66d:	39 d6                	cmp    %edx,%esi
 66f:	76 df                	jbe    650 <printint+0x2e>
  if(neg)
 671:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 675:	74 31                	je     6a8 <printint+0x86>
    buf[i++] = '-';
 677:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 67c:	8d 5f 02             	lea    0x2(%edi),%ebx
 67f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 682:	eb 17                	jmp    69b <printint+0x79>
    x = xx;
 684:	89 c1                	mov    %eax,%ecx
  neg = 0;
 686:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 68d:	eb bc                	jmp    64b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 68f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 694:	89 f0                	mov    %esi,%eax
 696:	e8 6d ff ff ff       	call   608 <putc>
  while(--i >= 0)
 69b:	83 eb 01             	sub    $0x1,%ebx
 69e:	79 ef                	jns    68f <printint+0x6d>
}
 6a0:	83 c4 2c             	add    $0x2c,%esp
 6a3:	5b                   	pop    %ebx
 6a4:	5e                   	pop    %esi
 6a5:	5f                   	pop    %edi
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    
 6a8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ab:	eb ee                	jmp    69b <printint+0x79>

000006ad <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6ad:	55                   	push   %ebp
 6ae:	89 e5                	mov    %esp,%ebp
 6b0:	57                   	push   %edi
 6b1:	56                   	push   %esi
 6b2:	53                   	push   %ebx
 6b3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6b6:	8d 45 10             	lea    0x10(%ebp),%eax
 6b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6bc:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6c1:	bb 00 00 00 00       	mov    $0x0,%ebx
 6c6:	eb 14                	jmp    6dc <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6c8:	89 fa                	mov    %edi,%edx
 6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 6cd:	e8 36 ff ff ff       	call   608 <putc>
 6d2:	eb 05                	jmp    6d9 <printf+0x2c>
      }
    } else if(state == '%'){
 6d4:	83 fe 25             	cmp    $0x25,%esi
 6d7:	74 25                	je     6fe <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6d9:	83 c3 01             	add    $0x1,%ebx
 6dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 6df:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6e3:	84 c0                	test   %al,%al
 6e5:	0f 84 20 01 00 00    	je     80b <printf+0x15e>
    c = fmt[i] & 0xff;
 6eb:	0f be f8             	movsbl %al,%edi
 6ee:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6f1:	85 f6                	test   %esi,%esi
 6f3:	75 df                	jne    6d4 <printf+0x27>
      if(c == '%'){
 6f5:	83 f8 25             	cmp    $0x25,%eax
 6f8:	75 ce                	jne    6c8 <printf+0x1b>
        state = '%';
 6fa:	89 c6                	mov    %eax,%esi
 6fc:	eb db                	jmp    6d9 <printf+0x2c>
      if(c == 'd'){
 6fe:	83 f8 25             	cmp    $0x25,%eax
 701:	0f 84 cf 00 00 00    	je     7d6 <printf+0x129>
 707:	0f 8c dd 00 00 00    	jl     7ea <printf+0x13d>
 70d:	83 f8 78             	cmp    $0x78,%eax
 710:	0f 8f d4 00 00 00    	jg     7ea <printf+0x13d>
 716:	83 f8 63             	cmp    $0x63,%eax
 719:	0f 8c cb 00 00 00    	jl     7ea <printf+0x13d>
 71f:	83 e8 63             	sub    $0x63,%eax
 722:	83 f8 15             	cmp    $0x15,%eax
 725:	0f 87 bf 00 00 00    	ja     7ea <printf+0x13d>
 72b:	ff 24 85 ec 09 00 00 	jmp    *0x9ec(,%eax,4)
        printint(fd, *ap, 10, 1);
 732:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 735:	8b 17                	mov    (%edi),%edx
 737:	83 ec 0c             	sub    $0xc,%esp
 73a:	6a 01                	push   $0x1
 73c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	e8 d9 fe ff ff       	call   622 <printint>
        ap++;
 749:	83 c7 04             	add    $0x4,%edi
 74c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 74f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 752:	be 00 00 00 00       	mov    $0x0,%esi
 757:	eb 80                	jmp    6d9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 759:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 75c:	8b 17                	mov    (%edi),%edx
 75e:	83 ec 0c             	sub    $0xc,%esp
 761:	6a 00                	push   $0x0
 763:	b9 10 00 00 00       	mov    $0x10,%ecx
 768:	8b 45 08             	mov    0x8(%ebp),%eax
 76b:	e8 b2 fe ff ff       	call   622 <printint>
        ap++;
 770:	83 c7 04             	add    $0x4,%edi
 773:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 776:	83 c4 10             	add    $0x10,%esp
      state = 0;
 779:	be 00 00 00 00       	mov    $0x0,%esi
 77e:	e9 56 ff ff ff       	jmp    6d9 <printf+0x2c>
        s = (char*)*ap;
 783:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 786:	8b 30                	mov    (%eax),%esi
        ap++;
 788:	83 c0 04             	add    $0x4,%eax
 78b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 78e:	85 f6                	test   %esi,%esi
 790:	75 15                	jne    7a7 <printf+0xfa>
          s = "(null)";
 792:	be e2 09 00 00       	mov    $0x9e2,%esi
 797:	eb 0e                	jmp    7a7 <printf+0xfa>
          putc(fd, *s);
 799:	0f be d2             	movsbl %dl,%edx
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	e8 64 fe ff ff       	call   608 <putc>
          s++;
 7a4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7a7:	0f b6 16             	movzbl (%esi),%edx
 7aa:	84 d2                	test   %dl,%dl
 7ac:	75 eb                	jne    799 <printf+0xec>
      state = 0;
 7ae:	be 00 00 00 00       	mov    $0x0,%esi
 7b3:	e9 21 ff ff ff       	jmp    6d9 <printf+0x2c>
        putc(fd, *ap);
 7b8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7bb:	0f be 17             	movsbl (%edi),%edx
 7be:	8b 45 08             	mov    0x8(%ebp),%eax
 7c1:	e8 42 fe ff ff       	call   608 <putc>
        ap++;
 7c6:	83 c7 04             	add    $0x4,%edi
 7c9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7cc:	be 00 00 00 00       	mov    $0x0,%esi
 7d1:	e9 03 ff ff ff       	jmp    6d9 <printf+0x2c>
        putc(fd, c);
 7d6:	89 fa                	mov    %edi,%edx
 7d8:	8b 45 08             	mov    0x8(%ebp),%eax
 7db:	e8 28 fe ff ff       	call   608 <putc>
      state = 0;
 7e0:	be 00 00 00 00       	mov    $0x0,%esi
 7e5:	e9 ef fe ff ff       	jmp    6d9 <printf+0x2c>
        putc(fd, '%');
 7ea:	ba 25 00 00 00       	mov    $0x25,%edx
 7ef:	8b 45 08             	mov    0x8(%ebp),%eax
 7f2:	e8 11 fe ff ff       	call   608 <putc>
        putc(fd, c);
 7f7:	89 fa                	mov    %edi,%edx
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
 7fc:	e8 07 fe ff ff       	call   608 <putc>
      state = 0;
 801:	be 00 00 00 00       	mov    $0x0,%esi
 806:	e9 ce fe ff ff       	jmp    6d9 <printf+0x2c>
    }
  }
}
 80b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80e:	5b                   	pop    %ebx
 80f:	5e                   	pop    %esi
 810:	5f                   	pop    %edi
 811:	5d                   	pop    %ebp
 812:	c3                   	ret    

00000813 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 813:	55                   	push   %ebp
 814:	89 e5                	mov    %esp,%ebp
 816:	57                   	push   %edi
 817:	56                   	push   %esi
 818:	53                   	push   %ebx
 819:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 81c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81f:	a1 e0 0d 00 00       	mov    0xde0,%eax
 824:	eb 02                	jmp    828 <free+0x15>
 826:	89 d0                	mov    %edx,%eax
 828:	39 c8                	cmp    %ecx,%eax
 82a:	73 04                	jae    830 <free+0x1d>
 82c:	39 08                	cmp    %ecx,(%eax)
 82e:	77 12                	ja     842 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 830:	8b 10                	mov    (%eax),%edx
 832:	39 c2                	cmp    %eax,%edx
 834:	77 f0                	ja     826 <free+0x13>
 836:	39 c8                	cmp    %ecx,%eax
 838:	72 08                	jb     842 <free+0x2f>
 83a:	39 ca                	cmp    %ecx,%edx
 83c:	77 04                	ja     842 <free+0x2f>
 83e:	89 d0                	mov    %edx,%eax
 840:	eb e6                	jmp    828 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 842:	8b 73 fc             	mov    -0x4(%ebx),%esi
 845:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 848:	8b 10                	mov    (%eax),%edx
 84a:	39 d7                	cmp    %edx,%edi
 84c:	74 19                	je     867 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 84e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 851:	8b 50 04             	mov    0x4(%eax),%edx
 854:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 857:	39 ce                	cmp    %ecx,%esi
 859:	74 1b                	je     876 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 85b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 85d:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 862:	5b                   	pop    %ebx
 863:	5e                   	pop    %esi
 864:	5f                   	pop    %edi
 865:	5d                   	pop    %ebp
 866:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 867:	03 72 04             	add    0x4(%edx),%esi
 86a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 86d:	8b 10                	mov    (%eax),%edx
 86f:	8b 12                	mov    (%edx),%edx
 871:	89 53 f8             	mov    %edx,-0x8(%ebx)
 874:	eb db                	jmp    851 <free+0x3e>
    p->s.size += bp->s.size;
 876:	03 53 fc             	add    -0x4(%ebx),%edx
 879:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 87c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 87f:	89 10                	mov    %edx,(%eax)
 881:	eb da                	jmp    85d <free+0x4a>

00000883 <morecore>:

static Header*
morecore(uint nu)
{
 883:	55                   	push   %ebp
 884:	89 e5                	mov    %esp,%ebp
 886:	53                   	push   %ebx
 887:	83 ec 04             	sub    $0x4,%esp
 88a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 88c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 891:	77 05                	ja     898 <morecore+0x15>
    nu = 4096;
 893:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 898:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 89f:	83 ec 0c             	sub    $0xc,%esp
 8a2:	50                   	push   %eax
 8a3:	e8 38 fd ff ff       	call   5e0 <sbrk>
  if(p == (char*)-1)
 8a8:	83 c4 10             	add    $0x10,%esp
 8ab:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ae:	74 1c                	je     8cc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8b3:	83 c0 08             	add    $0x8,%eax
 8b6:	83 ec 0c             	sub    $0xc,%esp
 8b9:	50                   	push   %eax
 8ba:	e8 54 ff ff ff       	call   813 <free>
  return freep;
 8bf:	a1 e0 0d 00 00       	mov    0xde0,%eax
 8c4:	83 c4 10             	add    $0x10,%esp
}
 8c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ca:	c9                   	leave  
 8cb:	c3                   	ret    
    return 0;
 8cc:	b8 00 00 00 00       	mov    $0x0,%eax
 8d1:	eb f4                	jmp    8c7 <morecore+0x44>

000008d3 <malloc>:

void*
malloc(uint nbytes)
{
 8d3:	55                   	push   %ebp
 8d4:	89 e5                	mov    %esp,%ebp
 8d6:	53                   	push   %ebx
 8d7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8da:	8b 45 08             	mov    0x8(%ebp),%eax
 8dd:	8d 58 07             	lea    0x7(%eax),%ebx
 8e0:	c1 eb 03             	shr    $0x3,%ebx
 8e3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8e6:	8b 0d e0 0d 00 00    	mov    0xde0,%ecx
 8ec:	85 c9                	test   %ecx,%ecx
 8ee:	74 04                	je     8f4 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f0:	8b 01                	mov    (%ecx),%eax
 8f2:	eb 4a                	jmp    93e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8f4:	c7 05 e0 0d 00 00 e4 	movl   $0xde4,0xde0
 8fb:	0d 00 00 
 8fe:	c7 05 e4 0d 00 00 e4 	movl   $0xde4,0xde4
 905:	0d 00 00 
    base.s.size = 0;
 908:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 90f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 912:	b9 e4 0d 00 00       	mov    $0xde4,%ecx
 917:	eb d7                	jmp    8f0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 919:	74 19                	je     934 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 91b:	29 da                	sub    %ebx,%edx
 91d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 920:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 923:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 926:	89 0d e0 0d 00 00    	mov    %ecx,0xde0
      return (void*)(p + 1);
 92c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 92f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 932:	c9                   	leave  
 933:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 934:	8b 10                	mov    (%eax),%edx
 936:	89 11                	mov    %edx,(%ecx)
 938:	eb ec                	jmp    926 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93a:	89 c1                	mov    %eax,%ecx
 93c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 93e:	8b 50 04             	mov    0x4(%eax),%edx
 941:	39 da                	cmp    %ebx,%edx
 943:	73 d4                	jae    919 <malloc+0x46>
    if(p == freep)
 945:	39 05 e0 0d 00 00    	cmp    %eax,0xde0
 94b:	75 ed                	jne    93a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 94d:	89 d8                	mov    %ebx,%eax
 94f:	e8 2f ff ff ff       	call   883 <morecore>
 954:	85 c0                	test   %eax,%eax
 956:	75 e2                	jne    93a <malloc+0x67>
 958:	eb d5                	jmp    92f <malloc+0x5c>
