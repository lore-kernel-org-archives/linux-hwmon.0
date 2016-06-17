Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34824 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753495AbcFQWzN (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 17 Jun 2016 18:55:13 -0400
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
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 1/6] hwmon: (dell-smm) Fail in ioctl I8K_BIOS_VERSION when bios version is not a number
Date: Sat, 18 Jun 2016 00:54:44 +0200
Message-Id: <1466204089-17030-2-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

ABI of I8K_BIOS_VERSION ioctl can return only number. But new BIOS versions
contain also other characters, which does not fit into that ABI. So in case
of non digit values return -EINVAL.

Reported-by: Mario Limonciello <Mario_Limonciello@dell.com>
Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index c43318d..480b2fa 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -35,6 +35,7 @@
 #include <linux/uaccess.h>
 #include <linux/io.h>
 #include <linux/sched.h>
+#include <linux/ctype.h>
 
 #include <linux/i8k.h>
 
@@ -387,6 +388,10 @@ i8k_ioctl_unlocked(struct file *fp, unsigned int cmd, unsigned long arg)
 
 	switch (cmd) {
 	case I8K_BIOS_VERSION:
+		if (!isdigit(bios_version[0]) || !isdigit(bios_version[1]) ||
+		    !isdigit(bios_version[2]))
+			return -EINVAL;
+
 		val = (bios_version[0] << 16) |
 				(bios_version[1] << 8) | bios_version[2];
 		break;
-- 
1.7.9.5

