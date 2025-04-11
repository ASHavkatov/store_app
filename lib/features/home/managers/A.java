====================================================================================================
I/ViewRootImpl@b437f2c[MainActivity](19496): Relayout returned: old=(0,0,1080,2220) new=(0,0,1080,2220) req=(1080,2220)0 dur=4 res=0x1 s={true 501730000896} ch=false
I/flutter (19496): 111111111111111111111111111111
E/flutter (19496): [ERROR:flutter/runtime/dart_vm_initializer.cc(40)] Unhandled Exception: Exception: /product/list error
E/flutter (19496): #0      ApiClient.fetchProduct (package:store_app/core/client.dart:90:7)
E/flutter (19496): <asynchronous suspension>
E/flutter (19496): #1      ProductRepository.fetchProduct (package:store_app/data/repositories/product_repository.dart:12:22)
E/flutter (19496): <asynchronous suspension>
E/flutter (19496): #2      HomeViewModel.load (package:store_app/features/home/managers/home_view_model.dart:13:16)
E/flutter (19496): <asynchronous suspension>
E/flutter (19496): 
