Return-Path: <shilpa.bhat@linux.vnet.ibm.com>
Return-path: <shilpa.bhat@linux.vnet.ibm.com>
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: linux@roeck-us.net, clg@kaod.org, stewart@linux.vnet.ibm.com
Cc: jdelvare@suse.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, svaidy@linux.vnet.ibm.com,
        ego@linux.vnet.ibm.com, linux-hwmon@vger.kernel.org,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH V2 2/2] hwmon: (ibmpowernv) Add current(A) sensor
Date: Tue, 20 Jun 2017 10:38:13 +0530
In-Reply-To: <1497935293-31618-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
References: <1497935293-31618-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Message-Id: <1497935293-31618-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

This patch exports current(A) sensors in inband sensors copied to
main memory by OCC.

Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
---
Changes from V1:
- Rebased on top of Cedric's patch to remove legay-compatible type for
  the current(A) sensor.

 drivers/hwmon/ibmpowernv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 6d8909c..9b11b13 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -50,6 +50,7 @@ enum sensors {
 	TEMP,
 	POWER_SUPPLY,
 	POWER_INPUT,
+	CURRENT,
 	MAX_SENSOR_TYPE,
 };
 
@@ -75,7 +76,8 @@ enum sensors {
 	{ "fan"   },
 	{ "temp"  },
 	{ "in"    },
-	{ "power" }
+	{ "power" },
+	{ "curr"  },
 };
 
 struct sensor_data {
-- 
1.8.3.1
