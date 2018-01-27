Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33233 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753161AbeA0QYO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 11:24:14 -0500
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Mario Limonciello <mario.limonciello@dell.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 4/4] hwmon: (dell-smm) Measure time duration of SMM call around inlined asm
Date: Sat, 27 Jan 2018 17:23:51 +0100
Message-Id: <20180127162351.13858-1-pali.rohar@gmail.com>
In-Reply-To: <20180127162204.13752-1-pali.rohar@gmail.com>
References: <20180127162204.13752-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Measure only inlined asm code, not other functions to have as precise as
possible measured time.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index bf3bb7e1adab..e001afd53f46 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -147,14 +147,16 @@ static int i8k_smm_func(void *par)
 	int ebx = regs->ebx;
 	unsigned long duration;
 	ktime_t calltime, delta, rettime;
-
-	calltime = ktime_get();
 #endif
 
 	/* SMM requires CPU 0 */
 	if (smp_processor_id() != 0)
 		return -EBUSY;
 
+#ifdef DEBUG
+	calltime = ktime_get();
+#endif
+
 #if defined(CONFIG_X86_64)
 	asm volatile("pushq %%rax\n\t"
 		"movl 0(%%rax),%%edx\n\t"
@@ -208,13 +210,17 @@ static int i8k_smm_func(void *par)
 	    :    "a"(regs)
 	    :    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
 #endif
-	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
-		rc = -EINVAL;
 
 #ifdef DEBUG
 	rettime = ktime_get();
 	delta = ktime_sub(rettime, calltime);
 	duration = ktime_to_ns(delta) >> 10;
+#endif
+
+	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
+		rc = -EINVAL;
+
+#ifdef DEBUG
 	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lu usecs)\n", eax, ebx,
 		(rc ? 0xffff : regs->eax & 0xffff), duration);
 #endif
-- 
2.11.0

