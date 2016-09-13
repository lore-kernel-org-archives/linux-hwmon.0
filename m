Return-path: <mikey@neuling.org>
From: Michael Neuling <mikey@neuling.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
	linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
	me@neuling.org
Subject: [PATCH] hwmon: (ibmpowernv) Fix label for cores numbers not threads
Date: Tue, 13 Sep 2016 15:47:41 +1000
Message-Id: <1473745661-11890-1-git-send-email-mikey@neuling.org>
List-ID: <linux-hwmon@vger.kernel.org>

Currently the label says "Core" but lists the thread numbers. This
ends up looking like this:
    # cat /sys/class/hwmon/hwmon0/temp[1-4]_label
    Core 0-7
    Core 8-15
    Core 16-23
    Core 24-31

This is misleading as it looks like it's cores 0-7 when it's actually
threads 0-7.

This changes the print to just give the core number, so the output now
looks like this:
    # cat /sys/class/hwmon/hwmon0/temp[1-4]_label
    Core 0
    Core 8
    Core 16
    Core 24

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 drivers/hwmon/ibmpowernv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 55b5a8ff1c..6d2e660575 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -143,13 +143,11 @@ static void __init make_sensor_label(struct device_node *np,
 		if (cpuid >= 0)
 			/*
 			 * The digital thermal sensors are associated
-			 * with a core. Let's print out the range of
-			 * cpu ids corresponding to the hardware
-			 * threads of the core.
+			 * with a core.
 			 */
 			n += snprintf(sdata->label + n,
-				      sizeof(sdata->label) - n, " %d-%d",
-				      cpuid, cpuid + threads_per_core - 1);
+				      sizeof(sdata->label) - n, " %d",
+				      cpuid);
 		else
 			n += snprintf(sdata->label + n,
 				      sizeof(sdata->label) - n, " phy%d", id);
-- 
2.7.4
