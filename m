Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from zxshcas1.zhaoxin.com ([180.169.121.91]:48092 "EHLO
        ZXSHCAS1.zhaoxin.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751191AbeC3BFZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Mar 2018 21:05:25 -0400
From: David Wang <davidwang@zhaoxin.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <tglx@linutronix.de>,
        <mingo@redhat.com>, <rafel.j.wysocki@intel.com>,
        <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <brucechang@via-alliance.com>, <cooperyan@zhaoxin.com>,
        <qiyuanwang@zhaoxin.com>, <benjaminpan@viatech.com>,
        <lukelin@viacpu.com>, <timguo@zhaoxin.com>,
        David Wang <davidwang@zhaoxin.com>
Subject: [PATCH v3] hwmon, via-cputem: support new centaur CPUs
Date: Fri, 30 Mar 2018 09:04:48 +0800
Message-ID: <1522371888-30013-1-git-send-email-davidwang@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

New centaur CPUs(Familiy == 7) also support this cpu temperature sensor.

Change from v2 to v3:
*replace "goto" with "if...else.." according to suggestion from Guenter
 
Change from v1 to v2:
*fixed the wrong if condition in patch v1.
	
Signed-off-by: David Wang <davidwang@zhaoxin.com>
---
 drivers/hwmon/via-cputemp.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/via-cputemp.c b/drivers/hwmon/via-cputemp.c
index 07a0cb0..0e81f28 100644
--- a/drivers/hwmon/via-cputemp.c
+++ b/drivers/hwmon/via-cputemp.c
@@ -136,20 +136,24 @@ static int via_cputemp_probe(struct platform_device *pdev)
 	data->id = pdev->id;
 	data->name = "via_cputemp";
 
-	switch (c->x86_model) {
-	case 0xA:
-		/* C7 A */
-	case 0xD:
-		/* C7 D */
-		data->msr_temp = 0x1169;
-		data->msr_vid = 0x198;
-		break;
-	case 0xF:
-		/* Nano */
+	if (c->x86 == 7) {
 		data->msr_temp = 0x1423;
-		break;
-	default:
-		return -ENODEV;
+	} else {
+		switch (c->x86_model) {
+		case 0xA:
+			/* C7 A */
+		case 0xD:
+			/* C7 D */
+			data->msr_temp = 0x1169;
+			data->msr_vid = 0x198;
+			break;
+		case 0xF:
+			/* Nano */
+			data->msr_temp = 0x1423;
+			break;
+		default:
+			return -ENODEV;
+		}
 	}
 
 	/* test if we can access the TEMPERATURE MSR */
@@ -283,6 +287,7 @@ static int via_cputemp_down_prep(unsigned int cpu)
 	{ X86_VENDOR_CENTAUR, 6, 0xa, }, /* C7 A */
 	{ X86_VENDOR_CENTAUR, 6, 0xd, }, /* C7 D */
 	{ X86_VENDOR_CENTAUR, 6, 0xf, }, /* Nano */
+	{ X86_VENDOR_CENTAUR, 7, X86_MODEL_ANY, },
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, cputemp_ids);
-- 
1.9.1

