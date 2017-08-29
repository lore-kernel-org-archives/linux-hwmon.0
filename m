Return-Path: <xow@google.com>
Return-path: <xow@google.com>
From: Xo Wang <xow@google.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: Xo Wang <xow@google.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] hwmon: (pmbus/lm25066) Offset coefficient depends on CL
Date: Tue, 29 Aug 2017 14:21:16 -0700
Message-Id: <20170829212117.143441-2-xow@google.com>
In-Reply-To: <20170829212117.143441-1-xow@google.com>
References: <20170829212117.143441-1-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

When converting the DIRECT format CURRENT_IN and POWER commands, make
the offset coefficient ("b") predicate on the value of the current limit
setting.

Signed-off-by: Xo Wang <xow@google.com>
---
 drivers/hwmon/pmbus/lm25066.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index a3d912cd3b8d..232b4af13e12 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -488,16 +488,18 @@ static int lm25066_probe(struct i2c_client *client,
 	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
 	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
 	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
-	info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
 	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
-	info->b[PSC_POWER] = coeff[PSC_POWER].b;
 	info->R[PSC_POWER] = coeff[PSC_POWER].R;
 	if (config & LM25066_DEV_SETUP_CL) {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
+		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
 		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
+		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
 	} else {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
+		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
 		info->m[PSC_POWER] = coeff[PSC_POWER].m;
+		info->b[PSC_POWER] = coeff[PSC_POWER].b;
 	}
 
 	return pmbus_do_probe(client, id, info);
-- 
2.14.1.342.g6490525c54-goog
