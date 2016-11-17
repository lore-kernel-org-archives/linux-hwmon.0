Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:49679 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754857AbcKQSgZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Nov 2016 13:36:25 -0500
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: rt@linuxtronix.de, Thomas Gleixner <tglx@linutronix.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 05/20] hwmon/via-cputemp: Remove pointless CPU check on each CPU
Date: Thu, 17 Nov 2016 19:35:26 +0100
Message-Id: <20161117183541.8588-6-bigeasy@linutronix.de>
In-Reply-To: <20161117183541.8588-1-bigeasy@linutronix.de>
References: <20161117183541.8588-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

The check loop for the cpu type is pointless as we already have a cpu model
match before that. The only thing which is not covered by that check would
be a smp system with two different cores. Not likely to happen.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/hwmon/via-cputemp.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/hwmon/via-cputemp.c b/drivers/hwmon/via-cputemp.c
index ac91c07e3f90..5b9866b1b437 100644
--- a/drivers/hwmon/via-cputemp.c
+++ b/drivers/hwmon/via-cputemp.c
@@ -319,22 +319,8 @@ static int __init via_cputemp_init(void)
 		goto exit;
=20
 	cpu_notifier_register_begin();
-	for_each_online_cpu(i) {
-		struct cpuinfo_x86 *c =3D &cpu_data(i);
-
-		if (c->x86 !=3D 6)
-			continue;
-
-		if (c->x86_model < 0x0a)
-			continue;
-
-		if (c->x86_model > 0x0f) {
-			pr_warn("Unknown CPU model 0x%x\n", c->x86_model);
-			continue;
-		}
-
+	for_each_online_cpu(i)
 		via_cputemp_device_add(i);
-	}
=20
 #ifndef CONFIG_HOTPLUG_CPU
 	if (list_empty(&pdev_list)) {
--=20
2.10.2

