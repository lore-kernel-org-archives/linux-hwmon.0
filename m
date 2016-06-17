Return-path: <pali.rohar@gmail.com>
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	=?UTF-8?q?David=20Santamar=C3=ADa=20Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Tolga Cakir <cevelnet@gmail.com>,
	"Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
	Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
	Dakota Whipple <dakotajaywhipple@gmail.com>,
	Leon Yu <leon@leonyu.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 6/6] hwmon: (dell-smm) In debug mode log duration of SMM calls
Date: Sat, 18 Jun 2016 00:54:49 +0200
Message-Id: <1466204089-17030-7-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

This allow us to debug how long take each SMM call and how long is system
frozen in SMM handler.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 571d498..acf9c03 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -140,6 +140,14 @@ static int i8k_smm(struct smm_regs *regs)
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
@@ -211,6 +219,15 @@ static int i8k_smm(struct smm_regs *regs)
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
