Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx3.molgen.mpg.de ([141.14.17.11]:42253 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754400AbeFLVus (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Jun 2018 17:50:48 -0400
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Paul Menzel <pmenzel+linux-hwmon@molgen.mpg.de>
Subject: nct6775: UBSAN: shift exponent 32 is too large for 32-bit type 'long
 unsigned int'
Message-ID: <d02001e2-fa4c-6a2e-cc50-a8d9a8146d57@molgen.mpg.de>
Date: Tue, 12 Jun 2018 23:50:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Dear Guenther, dear Jean,


Building Linux with the undefined behavior sanitizer (UBSAN), loading 
the module *nct6775* on the ASRock E350M1 shows the error below.

```
[   28.322775] UBSAN: Undefined behaviour in drivers/hwmon/nct6775.c:4179:27
[   28.322833] shift exponent 32 is too large for 32-bit type 'long 
unsigned int'
```

I believe this was introduced by commit cc66b3038254 (hwmon: (nct6775) 
Rework temperature source and label handling), but the same issue was 
already present before.

```
-       for (i = 0; i < data->temp_label_num - 1; i++) {
+       for (i = 0; i < 32; i++) {
+               if (!(data->temp_mask & BIT(i + 1)))
+                       continue;
```

`include/linux/bitops.h` has the macros below.

```
#define BIT(nr)                 (1UL << (nr))
#define BIT_ULL(nr)             (1ULL << (nr))
```

Maybe `BIT_ULL` should be used, but I do not know, if that’d would work 
with `data->temp_mask`, which has type `u32`.


Kind regards,

Paul
