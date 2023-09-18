Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE74C46CA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 18:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjIRSrb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 14:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjIRSrb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 14:47:31 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13EF109
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 11:47:25 -0700 (PDT)
Received: from [2a00:23c5:dcb3:cb33::b56] (helo=orangina.lan)
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qiJHG-007KYM-TK; Mon, 18 Sep 2023 18:47:22 +0000
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Doug Smythies <dsmythies@telus.net>
Subject: [PATCH] hwmon: (nct6775) Fix non-existent ALARM warning
Date:   Mon, 18 Sep 2023 19:47:22 +0100
Message-Id: <20230918184722.2033225-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Skip non-existent ALARM attribute to avoid a shift-out-of-bounds
dmesg warning.

Reported-by: Doug Smythies <dsmythies@telus.net>
Closes: https://lore.kernel.org/linux-hwmon/ZQVzdlHgWdFhOVyQ@debian.me/T/#mc69b690660eb50734a6b07506d74a119e0266f1b
Fixes: b7f1f7b2523a ("hwmon: (nct6775) Additional TEMP registers for nct6799")
Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 drivers/hwmon/nct6775-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 02a71244fc3b..b5b81bd83bb1 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1910,6 +1910,10 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct nct6775_data *data = dev_get_drvdata(dev);
 	int in = index / 5;	/* voltage index */
+	int nr = index % 5;	/* attribute index */
+
+	if (nr == 1 && data->ALARM_BITS[in] == -1)
+		return 0;
 
 	if (!(data->have_in & BIT(in)))
 		return 0;
-- 
2.39.2

