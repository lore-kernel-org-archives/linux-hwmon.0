Return-Path: <SRS0=7DvS=2D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3B0C2D0C8
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Dec 2019 01:49:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1BDB22527
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Dec 2019 01:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnnFw7oG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731666AbfLMBt4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Dec 2019 20:49:56 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:39353 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731568AbfLMBtz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Dec 2019 20:49:55 -0500
Received: by mail-pj1-f65.google.com with SMTP id v93so484171pjb.6
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Dec 2019 17:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=/wtstk43nLo2U9tOljAumOLWBRYpMwRIk5X4SbZV9fE=;
        b=bnnFw7oG5y0LtcIH+FC0T1FifGjHgqWpLIiLsxEHT+vL+f0fuuoqApv9nnfKr1eiC/
         Bcj/a1JErWaoSnVf/kdU7X1AtYAFhhGs/S6Bs0ljSzm63X0jDd+Pa2IE+fBv3B6pVGmf
         p9Uug03KpJyix+ML0l2TJh7mINgc2f90sJsBRYRX1Dtz7/eWlITDCNM3YHjottgknYzh
         fZ5cccMLHSRQW5Fkbrcjp3Upx3nfFkxLf7FU30lktqGgFW85uqgnafRgd5zK2j+4Wo18
         xepuiuS4uPs+HaokiWooiVXDwJh/AafrWE2NJhpsSgAIcJWaBzs++xJM0MkXrvKgBYN4
         9S3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=/wtstk43nLo2U9tOljAumOLWBRYpMwRIk5X4SbZV9fE=;
        b=SMUjFzLYxc4svPWnNOpubcpzA38e/VWMFehgD8Od+W+m4Bxc2tHKvA3uh2njtLaYZN
         Q+uOSatue93JkD1Mz46blpgw58zZkZbo68Eavv9muxgf6Lck5tMG9m3z4jMtRYzgoF03
         VKs4IXbJ8kHNfq1TT+rv+2fJd9vhnRrG1vSRJYxPT7j8/IFQQywobQgpDkYSHfDopfvt
         KPFVSxZ7AShFeCHm0Xvw//tNwISGUXGGW2cuWp0X8OvJbdB9xQK03tffmsJajbisaiIa
         ZqSMvTNzhH73lU85hKAtQCscskufBjRQGnIRgy6GGR7kqvlbJdIAShFilZRYt0hVoxt7
         aalw==
X-Gm-Message-State: APjAAAWiSV12FHiWyIz0Y9/blakfU1kc5JhMzHeMFJ6J4DMwaca5kdub
        fkTAmHJwVZMqar8aYGJwwVxT69Bu
X-Google-Smtp-Source: APXvYqxRj0iWhdWhfQqJKU6UXyv49bS+zgD3i95cVshQ53fY2lMga9ayLajWZuQSxMNlHkyFeKLuqA==
X-Received: by 2002:a17:902:7c84:: with SMTP id y4mr12629891pll.297.1576201794373;
        Thu, 12 Dec 2019 17:49:54 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f7sm9047446pfk.183.2019.12.12.17.49.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 17:49:53 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus) Detect if chip is write protected
Date:   Thu, 12 Dec 2019 17:49:49 -0800
Message-Id: <20191213014949.24904-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If a chip is write protected, we can not change any limits, and we can
not clear status flags. This may be the reason why clearing status flags
is reported to not work for some chips. Detect the condition in the pmbus
core. If the chip is write protected, set limit attributes as read-only,
and set the flag indicating that the status flag should be ignored.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus.h      | 11 +++++++++++
 drivers/hwmon/pmbus/pmbus_core.c | 12 ++++++++++++
 include/linux/pmbus.h            | 11 ++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d198af3a92b6..90d6c9e23d5f 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -22,6 +22,8 @@ enum pmbus_regs {
 	PMBUS_CLEAR_FAULTS		= 0x03,
 	PMBUS_PHASE			= 0x04,
 
+	PMBUS_WRITE_PROTECT		= 0x10,
+
 	PMBUS_CAPABILITY		= 0x19,
 	PMBUS_QUERY			= 0x1A,
 
@@ -225,6 +227,15 @@ enum pmbus_regs {
  */
 #define PB_OPERATION_CONTROL_ON		BIT(7)
 
+/*
+ * WRITE_PROTECT
+ */
+#define PB_WP_ALL	BIT(7)	/* all but WRITE_PROTECT */
+#define PB_WP_OP	BIT(6)	/* all but WP, OPERATION, PAGE */
+#define PB_WP_VOUT	BIT(5)	/* all but WP, OPERATION, PAGE, VOUT, ON_OFF */
+
+#define PB_WP_ANY	(PB_WP_ALL | PB_WP_OP | PB_WP_VOUT)
+
 /*
  * CAPABILITY
  */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 8470097907bc..2c196eddbb8d 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1088,6 +1088,9 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 		snprintf(sensor->name, sizeof(sensor->name), "%s%d",
 			 name, seq);
 
+	if (data->flags & PMBUS_WRITE_PROTECTED)
+		readonly = true;
+
 	sensor->page = page;
 	sensor->reg = reg;
 	sensor->class = class;
@@ -2141,6 +2144,15 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
 		client->flags |= I2C_CLIENT_PEC;
 
+	/*
+	 * Check if the chip is write protected. If it is, we can not clear
+	 * faults, and we should not try it. Also, in that case, writes into
+	 * limit registers need to be disabled.
+	 */
+	ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
+	if (ret > 0 && (ret & PB_WP_ANY))
+		data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
+
 	if (data->info->pages)
 		pmbus_clear_faults(client);
 	else
diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index 08468fca5ea2..1ea5bae708a1 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -8,6 +8,8 @@
 #ifndef _PMBUS_H_
 #define _PMBUS_H_
 
+#include <linux/bits.h>
+
 /* flags */
 
 /*
@@ -23,7 +25,14 @@
  * communication errors for no explicable reason. For such chips, checking
  * the status register must be disabled.
  */
-#define PMBUS_SKIP_STATUS_CHECK	(1 << 0)
+#define PMBUS_SKIP_STATUS_CHECK	BIT(0)
+
+/*
+ * PMBUS_WRITE_PROTECTED
+ * Set if the chip is write protected and write protection is not determined
+ * by the standard WRITE_PROTECT command.
+ */
+#define PMBUS_WRITE_PROTECTED	BIT(1)
 
 struct pmbus_platform_data {
 	u32 flags;		/* Device specific flags */
-- 
2.17.1

