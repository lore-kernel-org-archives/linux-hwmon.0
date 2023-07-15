Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D9CC0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 15:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGOPct (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 11:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjGOPcs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 11:32:48 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8252D7B
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 08:32:47 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56] (helo=orangina.lan)
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qKhGI-002uvN-AZ; Sat, 15 Jul 2023 15:32:46 +0000
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH] hwmon: (nct6775) Flip Caseopen alarm as 1 is OK
Date:   Sat, 15 Jul 2023 16:32:34 +0100
Message-Id: <20230715153234.1307325-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

we flip intrusion alarms as nc6796d-s datasheet states:
- CASEOPEN0_STS. CaseOpen Status.
  * 1: Caseopen0 is detected and latched.
  * 0: Caseopen0 is not latched.

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 drivers/hwmon/nct6775-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 1006765d8483..b0435b0bb1ba 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1734,6 +1734,16 @@ nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 		return PTR_ERR(data);
 
 	nr = data->ALARM_BITS[sattr->index];
+
+	/* nc6796d-s datasheet states: CASEOPEN0_STS. CaseOpen Status.
+	 * 1: Caseopen0 is detected and latched.
+	 * 0: Caseopen0 is not latched.
+	 * so we flip intrusion alarms, 1 is OK
+	 */
+	if (data->kind == nct6799 && sattr->index >= INTRUSION_ALARM_BASE)
+		return sprintf(buf, "%u\n",
+		       (unsigned int)!((data->alarms >> nr) & 0x01));
+
 	return sprintf(buf, "%u\n",
 		       (unsigned int)((data->alarms >> nr) & 0x01));
 }

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111
prerequisite-patch-id: 85db508f68cabb50472c0cc5ef3953fc46bee3b1
prerequisite-patch-id: 1504eb67a66d80604d73cda09059629f102fc961
-- 
2.39.2

