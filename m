Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34627 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373AbcEUOym (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 21 May 2016 10:54:42 -0400
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] dell-smm-hwmon: In debug mode log duration of SMM calls
Date: Sat, 21 May 2016 16:54:23 +0200
Message-Id: <1463842463-18025-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This allow us to debug how long take each SMM call and how long is system
freezed in SMM handler.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 7a2764a..8a66a42 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -137,6 +137,14 @@ static int i8k_smm(struct smm_regs *regs)
 	int eax = regs->eax;
 	cpumask_var_t old_mask;
 
+#ifdef DEBUG
+	int ebx = regs->ebx;
+	unsigned long duration;
+	ktime_t calltime, delta, rettime;
+
+	calltime = ktime_get();
+#endif
+
 	/* SMM requires CPU 0 */
 	if (!alloc_cpumask_var(&old_mask, GFP_KERNEL))
 		return -ENOMEM;
@@ -208,6 +216,15 @@ static int i8k_smm(struct smm_regs *regs)
 out:
 	set_cpus_allowed_ptr(current, old_mask);
 	free_cpumask_var(old_mask);
+
+#ifdef DEBUG
+	rettime = ktime_get();
+	delta = ktime_sub(rettime, calltime);
+	duration = ktime_to_ns(delta) >> 10;
+	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lu usecs)\n", eax, ebx,
+		(rc ? 0xffff : regs->eax & 0xffff), duration);
+#endif
+
 	return rc;
 }
 
-- 
1.7.9.5

