
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
  12:	e8 be 05 00 00       	call   5d5 <getpid>
  17:	a3 dc 0d 00 00       	mov    %eax,0xddc
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 a3 08 00 00       	call   8d0 <malloc>
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
  74:	e8 6d 04 00 00       	call   4e6 <thread_join>
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
  9b:	68 58 09 00 00       	push   $0x958
  a0:	68 62 09 00 00       	push   $0x962
  a5:	6a 01                	push   $0x1
  a7:	e8 fe 05 00 00       	call   6aa <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 c0 09 00 00       	push   $0x9c0
  b4:	68 79 09 00 00       	push   $0x979
  b9:	6a 01                	push   $0x1
  bb:	e8 ea 05 00 00       	call   6aa <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 8d 09 00 00       	push   $0x98d
  c8:	6a 01                	push   $0x1
  ca:	e8 db 05 00 00       	call   6aa <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 dc 0d 00 00    	push   0xddc
  d8:	e8 a8 04 00 00       	call   585 <kill>
  dd:	e8 73 04 00 00       	call   555 <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 58 09 00 00       	push   $0x958
  e9:	68 62 09 00 00       	push   $0x962
  ee:	6a 01                	push   $0x1
  f0:	e8 b5 05 00 00       	call   6aa <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 6a 09 00 00       	push   $0x96a
  fd:	68 79 09 00 00       	push   $0x979
 102:	6a 01                	push   $0x1
 104:	e8 a1 05 00 00       	call   6aa <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 8d 09 00 00       	push   $0x98d
 111:	6a 01                	push   $0x1
 113:	e8 92 05 00 00       	call   6aa <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 dc 0d 00 00    	push   0xddc
 121:	e8 5f 04 00 00       	call   585 <kill>
 126:	e8 2a 04 00 00       	call   555 <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 58 09 00 00       	push   $0x958
 132:	68 62 09 00 00       	push   $0x962
 137:	6a 01                	push   $0x1
 139:	e8 6c 05 00 00       	call   6aa <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 9a 09 00 00       	push   $0x99a
 146:	68 79 09 00 00       	push   $0x979
 14b:	6a 01                	push   $0x1
 14d:	e8 58 05 00 00       	call   6aa <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 8d 09 00 00       	push   $0x98d
 15a:	6a 01                	push   $0x1
 15c:	e8 49 05 00 00       	call   6aa <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 dc 0d 00 00    	push   0xddc
 16a:	e8 16 04 00 00       	call   585 <kill>
 16f:	e8 e1 03 00 00       	call   555 <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 58 09 00 00       	push   $0x958
 17b:	68 62 09 00 00       	push   $0x962
 180:	6a 01                	push   $0x1
 182:	e8 23 05 00 00       	call   6aa <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 b1 09 00 00       	push   $0x9b1
 18f:	68 79 09 00 00       	push   $0x979
 194:	6a 01                	push   $0x1
 196:	e8 0f 05 00 00       	call   6aa <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 8d 09 00 00       	push   $0x98d
 1a3:	6a 01                	push   $0x1
 1a5:	e8 00 05 00 00       	call   6aa <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 dc 0d 00 00    	push   0xddc
 1b3:	e8 cd 03 00 00       	call   585 <kill>
 1b8:	e8 98 03 00 00       	call   555 <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 d1 09 00 00       	push   $0x9d1
 1c5:	6a 01                	push   $0x1
 1c7:	e8 de 04 00 00       	call   6aa <printf>
   exit();
 1cc:	e8 84 03 00 00       	call   555 <exit>

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
 2f4:	e8 ed 01 00 00       	call   4e6 <thread_join>
   thread_join();
 2f9:	e8 e8 01 00 00       	call   4e6 <thread_join>
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 2fe:	c1 e3 02             	shl    $0x2,%ebx
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 c7 05 00 00       	call   8d0 <malloc>
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
 31f:	e8 ec 04 00 00       	call   810 <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 2c 02 00 00       	call   555 <exit>
       exit();
 329:	e8 27 02 00 00       	call   555 <exit>

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
 3f4:	e8 74 01 00 00       	call   56d <read>
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
 432:	e8 5e 01 00 00       	call   595 <open>
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
 447:	e8 61 01 00 00       	call   5ad <fstat>
 44c:	89 c6                	mov    %eax,%esi
  close(fd);
 44e:	89 1c 24             	mov    %ebx,(%esp)
 451:	e8 27 01 00 00       	call   57d <close>
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

  void* stack = malloc(PGSIZE);
 4cb:	68 00 10 00 00       	push   $0x1000
 4d0:	e8 fb 03 00 00       	call   8d0 <malloc>

  return clone(start_routine, arg1, arg2, stack);
 4d5:	50                   	push   %eax
 4d6:	ff 75 10             	push   0x10(%ebp)
 4d9:	ff 75 0c             	push   0xc(%ebp)
 4dc:	ff 75 08             	push   0x8(%ebp)
 4df:	e8 11 01 00 00       	call   5f5 <clone>
}
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    

000004e6 <thread_join>:

int thread_join(){
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	53                   	push   %ebx
 4ea:	83 ec 20             	sub    $0x20,%esp
  void *stack; //Get stack as void*
  int x = join(&stack); //Get join results with **stack
 4ed:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4f0:	50                   	push   %eax
 4f1:	e8 07 01 00 00       	call   5fd <join>
  if (x < 0) {
 4f6:	83 c4 10             	add    $0x10,%esp
 4f9:	85 c0                	test   %eax,%eax
 4fb:	78 17                	js     514 <thread_join+0x2e>
 4fd:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  //Free stack
  free(stack);
 4ff:	83 ec 0c             	sub    $0xc,%esp
 502:	ff 75 f4             	push   -0xc(%ebp)
 505:	e8 06 03 00 00       	call   810 <free>
  return x;
 50a:	83 c4 10             	add    $0x10,%esp
}
 50d:	89 d8                	mov    %ebx,%eax
 50f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 512:	c9                   	leave  
 513:	c3                   	ret    
    return -1;
 514:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 519:	eb f2                	jmp    50d <thread_join+0x27>

0000051b <lock_init>:

void lock_init(lock_t *spin){
 51b:	55                   	push   %ebp
 51c:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
 521:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 527:	5d                   	pop    %ebp
 528:	c3                   	ret    

00000529 <lock_acquire>:

void lock_acquire(lock_t *spin){
 529:	55                   	push   %ebp
 52a:	89 e5                	mov    %esp,%ebp
 52c:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 52f:	b8 01 00 00 00       	mov    $0x1,%eax
 534:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
 537:	85 c0                	test   %eax,%eax
 539:	75 f4                	jne    52f <lock_acquire+0x6>

}
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    

0000053d <lock_release>:

void lock_release(lock_t *spin){
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	8b 55 08             	mov    0x8(%ebp),%edx
 543:	b8 00 00 00 00       	mov    $0x0,%eax
 548:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
  //OR  asm volatile("movl $0, %0" : "+m" (spin->locked) : );
}
 54b:	5d                   	pop    %ebp
 54c:	c3                   	ret    

0000054d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 54d:	b8 01 00 00 00       	mov    $0x1,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <exit>:
SYSCALL(exit)
 555:	b8 02 00 00 00       	mov    $0x2,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <wait>:
SYSCALL(wait)
 55d:	b8 03 00 00 00       	mov    $0x3,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <pipe>:
SYSCALL(pipe)
 565:	b8 04 00 00 00       	mov    $0x4,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <read>:
SYSCALL(read)
 56d:	b8 05 00 00 00       	mov    $0x5,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <write>:
SYSCALL(write)
 575:	b8 10 00 00 00       	mov    $0x10,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <close>:
SYSCALL(close)
 57d:	b8 15 00 00 00       	mov    $0x15,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <kill>:
SYSCALL(kill)
 585:	b8 06 00 00 00       	mov    $0x6,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <exec>:
SYSCALL(exec)
 58d:	b8 07 00 00 00       	mov    $0x7,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <open>:
SYSCALL(open)
 595:	b8 0f 00 00 00       	mov    $0xf,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <mknod>:
SYSCALL(mknod)
 59d:	b8 11 00 00 00       	mov    $0x11,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <unlink>:
SYSCALL(unlink)
 5a5:	b8 12 00 00 00       	mov    $0x12,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <fstat>:
SYSCALL(fstat)
 5ad:	b8 08 00 00 00       	mov    $0x8,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <link>:
SYSCALL(link)
 5b5:	b8 13 00 00 00       	mov    $0x13,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <mkdir>:
SYSCALL(mkdir)
 5bd:	b8 14 00 00 00       	mov    $0x14,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <chdir>:
SYSCALL(chdir)
 5c5:	b8 09 00 00 00       	mov    $0x9,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <dup>:
SYSCALL(dup)
 5cd:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <getpid>:
SYSCALL(getpid)
 5d5:	b8 0b 00 00 00       	mov    $0xb,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <sbrk>:
SYSCALL(sbrk)
 5dd:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <sleep>:
SYSCALL(sleep)
 5e5:	b8 0d 00 00 00       	mov    $0xd,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <uptime>:
SYSCALL(uptime)
 5ed:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <clone>:
SYSCALL(clone)
 5f5:	b8 16 00 00 00       	mov    $0x16,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <join>:
 5fd:	b8 17 00 00 00       	mov    $0x17,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	83 ec 1c             	sub    $0x1c,%esp
 60b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 60e:	6a 01                	push   $0x1
 610:	8d 55 f4             	lea    -0xc(%ebp),%edx
 613:	52                   	push   %edx
 614:	50                   	push   %eax
 615:	e8 5b ff ff ff       	call   575 <write>
}
 61a:	83 c4 10             	add    $0x10,%esp
 61d:	c9                   	leave  
 61e:	c3                   	ret    

0000061f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 61f:	55                   	push   %ebp
 620:	89 e5                	mov    %esp,%ebp
 622:	57                   	push   %edi
 623:	56                   	push   %esi
 624:	53                   	push   %ebx
 625:	83 ec 2c             	sub    $0x2c,%esp
 628:	89 45 d0             	mov    %eax,-0x30(%ebp)
 62b:	89 d0                	mov    %edx,%eax
 62d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 62f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 633:	0f 95 c1             	setne  %cl
 636:	c1 ea 1f             	shr    $0x1f,%edx
 639:	84 d1                	test   %dl,%cl
 63b:	74 44                	je     681 <printint+0x62>
    neg = 1;
    x = -xx;
 63d:	f7 d8                	neg    %eax
 63f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 641:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 648:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 64d:	89 c8                	mov    %ecx,%eax
 64f:	ba 00 00 00 00       	mov    $0x0,%edx
 654:	f7 f6                	div    %esi
 656:	89 df                	mov    %ebx,%edi
 658:	83 c3 01             	add    $0x1,%ebx
 65b:	0f b6 92 40 0a 00 00 	movzbl 0xa40(%edx),%edx
 662:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 666:	89 ca                	mov    %ecx,%edx
 668:	89 c1                	mov    %eax,%ecx
 66a:	39 d6                	cmp    %edx,%esi
 66c:	76 df                	jbe    64d <printint+0x2e>
  if(neg)
 66e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 672:	74 31                	je     6a5 <printint+0x86>
    buf[i++] = '-';
 674:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 679:	8d 5f 02             	lea    0x2(%edi),%ebx
 67c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 67f:	eb 17                	jmp    698 <printint+0x79>
    x = xx;
 681:	89 c1                	mov    %eax,%ecx
  neg = 0;
 683:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 68a:	eb bc                	jmp    648 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 68c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 691:	89 f0                	mov    %esi,%eax
 693:	e8 6d ff ff ff       	call   605 <putc>
  while(--i >= 0)
 698:	83 eb 01             	sub    $0x1,%ebx
 69b:	79 ef                	jns    68c <printint+0x6d>
}
 69d:	83 c4 2c             	add    $0x2c,%esp
 6a0:	5b                   	pop    %ebx
 6a1:	5e                   	pop    %esi
 6a2:	5f                   	pop    %edi
 6a3:	5d                   	pop    %ebp
 6a4:	c3                   	ret    
 6a5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6a8:	eb ee                	jmp    698 <printint+0x79>

000006aa <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6aa:	55                   	push   %ebp
 6ab:	89 e5                	mov    %esp,%ebp
 6ad:	57                   	push   %edi
 6ae:	56                   	push   %esi
 6af:	53                   	push   %ebx
 6b0:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6b3:	8d 45 10             	lea    0x10(%ebp),%eax
 6b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6b9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6be:	bb 00 00 00 00       	mov    $0x0,%ebx
 6c3:	eb 14                	jmp    6d9 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6c5:	89 fa                	mov    %edi,%edx
 6c7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ca:	e8 36 ff ff ff       	call   605 <putc>
 6cf:	eb 05                	jmp    6d6 <printf+0x2c>
      }
    } else if(state == '%'){
 6d1:	83 fe 25             	cmp    $0x25,%esi
 6d4:	74 25                	je     6fb <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6d6:	83 c3 01             	add    $0x1,%ebx
 6d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 6dc:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6e0:	84 c0                	test   %al,%al
 6e2:	0f 84 20 01 00 00    	je     808 <printf+0x15e>
    c = fmt[i] & 0xff;
 6e8:	0f be f8             	movsbl %al,%edi
 6eb:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ee:	85 f6                	test   %esi,%esi
 6f0:	75 df                	jne    6d1 <printf+0x27>
      if(c == '%'){
 6f2:	83 f8 25             	cmp    $0x25,%eax
 6f5:	75 ce                	jne    6c5 <printf+0x1b>
        state = '%';
 6f7:	89 c6                	mov    %eax,%esi
 6f9:	eb db                	jmp    6d6 <printf+0x2c>
      if(c == 'd'){
 6fb:	83 f8 25             	cmp    $0x25,%eax
 6fe:	0f 84 cf 00 00 00    	je     7d3 <printf+0x129>
 704:	0f 8c dd 00 00 00    	jl     7e7 <printf+0x13d>
 70a:	83 f8 78             	cmp    $0x78,%eax
 70d:	0f 8f d4 00 00 00    	jg     7e7 <printf+0x13d>
 713:	83 f8 63             	cmp    $0x63,%eax
 716:	0f 8c cb 00 00 00    	jl     7e7 <printf+0x13d>
 71c:	83 e8 63             	sub    $0x63,%eax
 71f:	83 f8 15             	cmp    $0x15,%eax
 722:	0f 87 bf 00 00 00    	ja     7e7 <printf+0x13d>
 728:	ff 24 85 e8 09 00 00 	jmp    *0x9e8(,%eax,4)
        printint(fd, *ap, 10, 1);
 72f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 732:	8b 17                	mov    (%edi),%edx
 734:	83 ec 0c             	sub    $0xc,%esp
 737:	6a 01                	push   $0x1
 739:	b9 0a 00 00 00       	mov    $0xa,%ecx
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	e8 d9 fe ff ff       	call   61f <printint>
        ap++;
 746:	83 c7 04             	add    $0x4,%edi
 749:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 74c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 74f:	be 00 00 00 00       	mov    $0x0,%esi
 754:	eb 80                	jmp    6d6 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 756:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 759:	8b 17                	mov    (%edi),%edx
 75b:	83 ec 0c             	sub    $0xc,%esp
 75e:	6a 00                	push   $0x0
 760:	b9 10 00 00 00       	mov    $0x10,%ecx
 765:	8b 45 08             	mov    0x8(%ebp),%eax
 768:	e8 b2 fe ff ff       	call   61f <printint>
        ap++;
 76d:	83 c7 04             	add    $0x4,%edi
 770:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 773:	83 c4 10             	add    $0x10,%esp
      state = 0;
 776:	be 00 00 00 00       	mov    $0x0,%esi
 77b:	e9 56 ff ff ff       	jmp    6d6 <printf+0x2c>
        s = (char*)*ap;
 780:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 783:	8b 30                	mov    (%eax),%esi
        ap++;
 785:	83 c0 04             	add    $0x4,%eax
 788:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 78b:	85 f6                	test   %esi,%esi
 78d:	75 15                	jne    7a4 <printf+0xfa>
          s = "(null)";
 78f:	be de 09 00 00       	mov    $0x9de,%esi
 794:	eb 0e                	jmp    7a4 <printf+0xfa>
          putc(fd, *s);
 796:	0f be d2             	movsbl %dl,%edx
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	e8 64 fe ff ff       	call   605 <putc>
          s++;
 7a1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7a4:	0f b6 16             	movzbl (%esi),%edx
 7a7:	84 d2                	test   %dl,%dl
 7a9:	75 eb                	jne    796 <printf+0xec>
      state = 0;
 7ab:	be 00 00 00 00       	mov    $0x0,%esi
 7b0:	e9 21 ff ff ff       	jmp    6d6 <printf+0x2c>
        putc(fd, *ap);
 7b5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7b8:	0f be 17             	movsbl (%edi),%edx
 7bb:	8b 45 08             	mov    0x8(%ebp),%eax
 7be:	e8 42 fe ff ff       	call   605 <putc>
        ap++;
 7c3:	83 c7 04             	add    $0x4,%edi
 7c6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7c9:	be 00 00 00 00       	mov    $0x0,%esi
 7ce:	e9 03 ff ff ff       	jmp    6d6 <printf+0x2c>
        putc(fd, c);
 7d3:	89 fa                	mov    %edi,%edx
 7d5:	8b 45 08             	mov    0x8(%ebp),%eax
 7d8:	e8 28 fe ff ff       	call   605 <putc>
      state = 0;
 7dd:	be 00 00 00 00       	mov    $0x0,%esi
 7e2:	e9 ef fe ff ff       	jmp    6d6 <printf+0x2c>
        putc(fd, '%');
 7e7:	ba 25 00 00 00       	mov    $0x25,%edx
 7ec:	8b 45 08             	mov    0x8(%ebp),%eax
 7ef:	e8 11 fe ff ff       	call   605 <putc>
        putc(fd, c);
 7f4:	89 fa                	mov    %edi,%edx
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	e8 07 fe ff ff       	call   605 <putc>
      state = 0;
 7fe:	be 00 00 00 00       	mov    $0x0,%esi
 803:	e9 ce fe ff ff       	jmp    6d6 <printf+0x2c>
    }
  }
}
 808:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80b:	5b                   	pop    %ebx
 80c:	5e                   	pop    %esi
 80d:	5f                   	pop    %edi
 80e:	5d                   	pop    %ebp
 80f:	c3                   	ret    

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 819:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81c:	a1 e0 0d 00 00       	mov    0xde0,%eax
 821:	eb 02                	jmp    825 <free+0x15>
 823:	89 d0                	mov    %edx,%eax
 825:	39 c8                	cmp    %ecx,%eax
 827:	73 04                	jae    82d <free+0x1d>
 829:	39 08                	cmp    %ecx,(%eax)
 82b:	77 12                	ja     83f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82d:	8b 10                	mov    (%eax),%edx
 82f:	39 c2                	cmp    %eax,%edx
 831:	77 f0                	ja     823 <free+0x13>
 833:	39 c8                	cmp    %ecx,%eax
 835:	72 08                	jb     83f <free+0x2f>
 837:	39 ca                	cmp    %ecx,%edx
 839:	77 04                	ja     83f <free+0x2f>
 83b:	89 d0                	mov    %edx,%eax
 83d:	eb e6                	jmp    825 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 83f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 842:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 845:	8b 10                	mov    (%eax),%edx
 847:	39 d7                	cmp    %edx,%edi
 849:	74 19                	je     864 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 84b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 84e:	8b 50 04             	mov    0x4(%eax),%edx
 851:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 854:	39 ce                	cmp    %ecx,%esi
 856:	74 1b                	je     873 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 858:	89 08                	mov    %ecx,(%eax)
  freep = p;
 85a:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 85f:	5b                   	pop    %ebx
 860:	5e                   	pop    %esi
 861:	5f                   	pop    %edi
 862:	5d                   	pop    %ebp
 863:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 864:	03 72 04             	add    0x4(%edx),%esi
 867:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 86a:	8b 10                	mov    (%eax),%edx
 86c:	8b 12                	mov    (%edx),%edx
 86e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 871:	eb db                	jmp    84e <free+0x3e>
    p->s.size += bp->s.size;
 873:	03 53 fc             	add    -0x4(%ebx),%edx
 876:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 879:	8b 53 f8             	mov    -0x8(%ebx),%edx
 87c:	89 10                	mov    %edx,(%eax)
 87e:	eb da                	jmp    85a <free+0x4a>

00000880 <morecore>:

static Header*
morecore(uint nu)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	53                   	push   %ebx
 884:	83 ec 04             	sub    $0x4,%esp
 887:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 889:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 88e:	77 05                	ja     895 <morecore+0x15>
    nu = 4096;
 890:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 895:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 89c:	83 ec 0c             	sub    $0xc,%esp
 89f:	50                   	push   %eax
 8a0:	e8 38 fd ff ff       	call   5dd <sbrk>
  if(p == (char*)-1)
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ab:	74 1c                	je     8c9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8ad:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8b0:	83 c0 08             	add    $0x8,%eax
 8b3:	83 ec 0c             	sub    $0xc,%esp
 8b6:	50                   	push   %eax
 8b7:	e8 54 ff ff ff       	call   810 <free>
  return freep;
 8bc:	a1 e0 0d 00 00       	mov    0xde0,%eax
 8c1:	83 c4 10             	add    $0x10,%esp
}
 8c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c7:	c9                   	leave  
 8c8:	c3                   	ret    
    return 0;
 8c9:	b8 00 00 00 00       	mov    $0x0,%eax
 8ce:	eb f4                	jmp    8c4 <morecore+0x44>

000008d0 <malloc>:

void*
malloc(uint nbytes)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	53                   	push   %ebx
 8d4:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d7:	8b 45 08             	mov    0x8(%ebp),%eax
 8da:	8d 58 07             	lea    0x7(%eax),%ebx
 8dd:	c1 eb 03             	shr    $0x3,%ebx
 8e0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8e3:	8b 0d e0 0d 00 00    	mov    0xde0,%ecx
 8e9:	85 c9                	test   %ecx,%ecx
 8eb:	74 04                	je     8f1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ed:	8b 01                	mov    (%ecx),%eax
 8ef:	eb 4a                	jmp    93b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8f1:	c7 05 e0 0d 00 00 e4 	movl   $0xde4,0xde0
 8f8:	0d 00 00 
 8fb:	c7 05 e4 0d 00 00 e4 	movl   $0xde4,0xde4
 902:	0d 00 00 
    base.s.size = 0;
 905:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 90c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 90f:	b9 e4 0d 00 00       	mov    $0xde4,%ecx
 914:	eb d7                	jmp    8ed <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 916:	74 19                	je     931 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 918:	29 da                	sub    %ebx,%edx
 91a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 91d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 920:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 923:	89 0d e0 0d 00 00    	mov    %ecx,0xde0
      return (void*)(p + 1);
 929:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 92c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 92f:	c9                   	leave  
 930:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 931:	8b 10                	mov    (%eax),%edx
 933:	89 11                	mov    %edx,(%ecx)
 935:	eb ec                	jmp    923 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 937:	89 c1                	mov    %eax,%ecx
 939:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 93b:	8b 50 04             	mov    0x4(%eax),%edx
 93e:	39 da                	cmp    %ebx,%edx
 940:	73 d4                	jae    916 <malloc+0x46>
    if(p == freep)
 942:	39 05 e0 0d 00 00    	cmp    %eax,0xde0
 948:	75 ed                	jne    937 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 94a:	89 d8                	mov    %ebx,%eax
 94c:	e8 2f ff ff ff       	call   880 <morecore>
 951:	85 c0                	test   %eax,%eax
 953:	75 e2                	jne    937 <malloc+0x67>
 955:	eb d5                	jmp    92c <malloc+0x5c>
