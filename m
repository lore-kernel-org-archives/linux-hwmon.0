Return-Path: <SRS0=I82Q=LM=vger.kernel.org=linux-kernel-owner@kernel.org>
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] hwmon: drop unnecessary OF name NULL checks
Date: Wed, 29 Aug 2018 15:02:21 -0500
Message-Id: <20180829200221.13492-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

Checking the child node names is pointless as the DT node name can
never be NULL, so remove it.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-hwmon@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/hwmon/ibmpowernv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 4935897f1527..0ccca87f5271 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -458,9 +458,6 @@ static int populate_attr_groups(struct platform_device *pdev)
 	for_each_child_of_node(opal, np) {
 		const char *label;
 
-		if (np->name == NULL)
-			continue;
-
 		type = get_sensor_type(np);
 		if (type == MAX_SENSOR_TYPE)
 			continue;
@@ -589,9 +586,6 @@ static int create_device_attrs(struct platform_device *pdev)
 		const char *label;
 		enum sensors type;
 
-		if (np->name == NULL)
-			continue;
-
 		type = get_sensor_type(np);
 		if (type == MAX_SENSOR_TYPE)
 			continue;
-- 
2.17.1
