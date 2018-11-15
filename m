Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39426 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbeKOQA2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Nov 2018 11:00:28 -0500
From: Huacai Chen <chenhc@lemote.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>,
        "# 2 . 6 . 36+" <stable@vger.kernel.org>
Subject: [PATCH V5 5/8] MIPS: Align kernel load address to 64KB
Date: Thu, 15 Nov 2018 13:50:54 +0800
Message-Id: <1542261057-6019-6-git-send-email-chenhc@lemote.com>
In-Reply-To: <1542261057-6019-1-git-send-email-chenhc@lemote.com>
References: <1542261057-6019-1-git-send-email-chenhc@lemote.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

KEXEC needs the new kernel's load address to be aligned on a page
boundary (see sanity_check_segment_list()), but on MIPS the default
vmlinuz load address is only explicitly aligned to 16 bytes.

Since the largest PAGE_SIZE supported by MIPS kernels is 64KB, increase
the alignment calculated by calc_vmlinuz_load_addr to 64KB.

Cc: <stable@vger.kernel.org>  # 2.6.36+
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/boot/compressed/calc_vmlinuz_load_addr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c b/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
index 37fe58c..542c3ed 100644
--- a/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
+++ b/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
@@ -13,6 +13,7 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include "../../../../include/linux/sizes.h"
 
 int main(int argc, char *argv[])
 {
@@ -45,11 +46,11 @@ int main(int argc, char *argv[])
 	vmlinuz_load_addr = vmlinux_load_addr + vmlinux_size;
 
 	/*
-	 * Align with 16 bytes: "greater than that used for any standard data
-	 * types by a MIPS compiler." -- See MIPS Run Linux (Second Edition).
+	 * Align with 64KB: KEXEC needs load sections to be aligned to PAGE_SIZE,
+	 * which may be as large as 64KB depending on the kernel configuration.
 	 */
 
-	vmlinuz_load_addr += (16 - vmlinux_size % 16);
+	vmlinuz_load_addr += (SZ_64K - vmlinux_size % SZ_64K);
 
 	printf("0x%llx\n", vmlinuz_load_addr);
 
-- 
2.7.0
