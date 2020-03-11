Return-Path: <SRS0=GxSE=44=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF96DC10F25
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Mar 2020 07:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E7EC20873
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Mar 2020 07:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCKHjr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Mar 2020 03:39:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:46324 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgCKHjr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Mar 2020 03:39:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 87D21AD72;
        Wed, 11 Mar 2020 07:39:45 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] hwmon: (ibmpowernv) Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 08:39:44 +0100
Message-Id: <20200311073944.7487-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/hwmon/ibmpowernv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 0e525cfbdfc5..a750647e66a4 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -186,7 +186,7 @@ static void make_sensor_label(struct device_node *np,
 	u32 id;
 	size_t n;
 
-	n = snprintf(sdata->label, sizeof(sdata->label), "%s", label);
+	n = scnprintf(sdata->label, sizeof(sdata->label), "%s", label);
 
 	/*
 	 * Core temp pretty print
@@ -199,11 +199,11 @@ static void make_sensor_label(struct device_node *np,
 			 * The digital thermal sensors are associated
 			 * with a core.
 			 */
-			n += snprintf(sdata->label + n,
+			n += scnprintf(sdata->label + n,
 				      sizeof(sdata->label) - n, " %d",
 				      cpuid);
 		else
-			n += snprintf(sdata->label + n,
+			n += scnprintf(sdata->label + n,
 				      sizeof(sdata->label) - n, " phy%d", id);
 	}
 
@@ -211,7 +211,7 @@ static void make_sensor_label(struct device_node *np,
 	 * Membuffer pretty print
 	 */
 	if (!of_property_read_u32(np, "ibm,chip-id", &id))
-		n += snprintf(sdata->label + n, sizeof(sdata->label) - n,
+		n += scnprintf(sdata->label + n, sizeof(sdata->label) - n,
 			      " %d", id & 0xffff);
 }
 
-- 
2.16.4

