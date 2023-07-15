Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EF1C0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 15:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjGOP36 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 11:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjGOP36 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 11:29:58 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6213593
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 08:29:53 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56] (helo=orangina.lan)
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qKhDU-002uuR-3h; Sat, 15 Jul 2023 15:29:52 +0000
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH] hwmon: (nct6775) Change labels for nct6799
Date:   Sat, 15 Jul 2023 16:29:31 +0100
Message-Id: <20230715152931.1307087-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

nct6799d-r and nct6796d-s seem to be revisions where the former
appears on ASUS boards and the latter on ASRock.

The datasheet for nct6796d-s (dated 2022) has several updates
over the datasheet for nct6796d (dated 2017) so we know it's
closer to the nct6799d-r (though have some minor diversions).

Since both will be detected by the driver anyway due to the
chipid mask, they should be labeled together for dmesg msg.

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 drivers/hwmon/nct6775-core.c     | 5 ++++-
 drivers/hwmon/nct6775-platform.c | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 236dc97f4d22..7163a2473fa0 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -33,10 +33,13 @@
  *                                           (0xd451)
  * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
  *                                           (0xd429)
- * nct6799d    14      7       7       2+6    0xd802 0xc1    0x5ca3
+ * nct6796d-s  18      7       7       6+2    0xd801 0xc1    0x5ca3 (*)
+ * nct6799d-r  18      7       7       6+2    0xd802 0xc1    0x5ca3
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
+ *
+ * (*) nct6799d-r based on nct6796d-s and both quite different to nct6796d
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index a409d7a0b813..e8298befb77f 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -35,7 +35,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6796D",
 	"NCT6797D",
 	"NCT6798D",
-	"NCT6799D",
+	"NCT6799D-R/NCT6796D-S",
 };
 
 static unsigned short force_id;

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111
-- 
2.39.2

