Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0386DC0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 19:53:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjGOTxG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 15:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGOTxF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 15:53:05 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648C1E5C
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 12:53:04 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56] (helo=orangina.lan)
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qKlKA-002vws-M1; Sat, 15 Jul 2023 19:53:02 +0000
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH v2] hwmon: (nct6775) Change labels for nct6799
Date:   Sat, 15 Jul 2023 20:52:44 +0100
Message-Id: <20230715195244.1334723-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

nct6799d-r and nct6796d-s are very similar and chip_id is only
different in the version nibblet.

Since both will be detected by the driver anyway due to the
chipid mask, they should be labeled together for dmesg msg.

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 Documentation/hwmon/nct6775.rst  | 11 ++++++++++-
 drivers/hwmon/nct6775-core.c     |  3 ++-
 drivers/hwmon/nct6775-platform.c |  2 +-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/nct6775.rst b/Documentation/hwmon/nct6775.rst
index 5ba8276aad4b..9d7a10de61a7 100644
--- a/Documentation/hwmon/nct6775.rst
+++ b/Documentation/hwmon/nct6775.rst
@@ -80,7 +80,13 @@ Supported chips:
 
     Datasheet: Available from Nuvoton upon request
 
+  * Nuvoton NCT6796D-S/NCT6799D-R
 
+    Prefix: 'nct6799'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Available from Nuvoton upon request
 
 Authors:
 
@@ -277,4 +283,7 @@ will not reflect a usable value. It often reports unreasonably high
 temperatures, and in some cases the reported temperature declines if the actual
 temperature increases (similar to the raw PECI temperature value - see PECI
 specification for details). CPUTIN should therefore be ignored on ASUS
-boards. The CPU temperature on ASUS boards is reported from PECI 0.
+boards. The CPU temperature on ASUS boards is reported from PECI 0 or TSI 0.
+
+NCT6796D-S and NCT6799D-R chips are very similar and their chip_id indicates
+they are different versions. This driver treats them the same way.
diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 236dc97f4d22..029344b933ed 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -33,7 +33,8 @@
  *                                           (0xd451)
  * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
  *                                           (0xd429)
- * nct6799d    14      7       7       2+6    0xd802 0xc1    0x5ca3
+ * nct6796d-s  18      7       7       6+2    0xd801 0xc1    0x5ca3
+ * nct6799d-r  18      7       7       6+2    0xd802 0xc1    0x5ca3
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index a409d7a0b813..81bf03dad6bb 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -35,7 +35,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6796D",
 	"NCT6797D",
 	"NCT6798D",
-	"NCT6799D",
+	"NCT6796D-S/NCT6799D-R",
 };
 
 static unsigned short force_id;

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111
-- 
2.39.2

