Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:47858 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725828AbeKUHwp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Nov 2018 02:52:45 -0500
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, michaelsh@mellanox.com,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH hwmon-next v1 1/1] hwmon: (mlxreg-fan) Modify macros for tachometer fault status reading
Date: Tue, 20 Nov 2018 23:16:36 +0000
Message-Id: <1542755796-70329-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Modify macros for tachometer fault status reading for making it more
simple and clear.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/mlxreg-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index d8fa4be..db8c6de 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -51,7 +51,7 @@
  */
 #define MLXREG_FAN_GET_RPM(rval, d, s)	(DIV_ROUND_CLOSEST(15000000 * 100, \
 					 ((rval) + (s)) * (d)))
-#define MLXREG_FAN_GET_FAULT(val, mask) (!((val) ^ (mask)))
+#define MLXREG_FAN_GET_FAULT(val, mask) ((val) == (mask))
 #define MLXREG_FAN_PWM_DUTY2STATE(duty)	(DIV_ROUND_CLOSEST((duty) *	\
 					 MLXREG_FAN_MAX_STATE,		\
 					 MLXREG_FAN_MAX_DUTY))
-- 
2.1.4
