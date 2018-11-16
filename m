Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58685 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727767AbeKPWEN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Nov 2018 17:04:13 -0500
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, michaelsh@mellanox.com,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH hwmon-next v1 1/1] hwmon: (mlxreg-fan) Fix macros for tacho fault reading
Date: Fri, 16 Nov 2018 13:47:11 +0000
Message-Id: <1542376031-179816-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Fix macros for tacometer fault reading.
This fix is relevant for three Mellanox systems MQMB7, MSN37, MSN34,
which are about to be released to the customers.
At the moment, none of them is at customers sites.

Fixes: 65afb4c8e7e4 ("hwmon: (mlxreg-fan) Add support for Mellanox FAN driver")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/mlxreg-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index de46577..d8fa4be 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -51,7 +51,7 @@
  */
 #define MLXREG_FAN_GET_RPM(rval, d, s)	(DIV_ROUND_CLOSEST(15000000 * 100, \
 					 ((rval) + (s)) * (d)))
-#define MLXREG_FAN_GET_FAULT(val, mask) (!!((val) ^ (mask)))
+#define MLXREG_FAN_GET_FAULT(val, mask) (!((val) ^ (mask)))
 #define MLXREG_FAN_PWM_DUTY2STATE(duty)	(DIV_ROUND_CLOSEST((duty) *	\
 					 MLXREG_FAN_MAX_STATE,		\
 					 MLXREG_FAN_MAX_DUTY))
-- 
2.1.4
