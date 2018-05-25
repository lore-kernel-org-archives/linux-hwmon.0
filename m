Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47976 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967951AbeEYUSt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 May 2018 16:18:49 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] MAINTAINERS: hwmon: Add Documentation/devicetree/bindings/hwmon
Date: Fri, 25 May 2018 13:18:37 -0700
Message-Id: <1527279517-30270-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The hardware monitoring mailing list should be copied for changes
in hwmon devicetree bindings.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 078fd80f664f..1de11c4c3b56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6218,6 +6218,7 @@ L:	linux-hwmon@vger.kernel.org
 W:	http://hwmon.wiki.kernel.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/
 F:	Documentation/hwmon/
 F:	drivers/hwmon/
 F:	include/linux/hwmon*.h
-- 
2.7.4

