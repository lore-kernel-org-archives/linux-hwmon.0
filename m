Return-Path: <SRS0=9cdn=4D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0370C7114E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 789712082F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fidofetq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgBOM0N (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Feb 2020 07:26:13 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54533 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgBOM0N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 07:26:13 -0500
Received: by mail-pj1-f65.google.com with SMTP id dw13so5182193pjb.4
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2020 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V80Rj9uWCqbUwOljaNc1fQM4FIcB47cZEgf4BZ3vhOQ=;
        b=fidofetqHEjtWTsajb4Iy4QVKHfIDlxZwqGyYa2Ay0E8cJGDwRidmFCCP0Q5E0tY2i
         tRSIFQ9s3GrIp9T9uquFUN9N6hxDua2KEFuxeIOoLWiHtt3UB1/EiGx4zXGhtMymM9nd
         7gEqpvkjTNqyPlySfZl8v9ubEPeIX59uVZxhAacfzGqgRLs/XVBTc9nkemf/O3i8bF4b
         VgbGe8t2fYitOMAwDe6DwkZ6wInpyUuyw1I7o3Emi393k8e3REuJygeuGkuKxeFVZxoU
         x3l8d2yabNFAJa2TLp/nmlMeIMA+5HrfXkqCoGZICoqP1YTMC+pabdhwXYxBnLuG0LfX
         yQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=V80Rj9uWCqbUwOljaNc1fQM4FIcB47cZEgf4BZ3vhOQ=;
        b=hRypKnk5GOROG8PFw4msj02Qd2jnXwCU7z6DcUMvGWttbc4mI3przF6cBjJ3jXeZFO
         c/1EWSIqah+AGIXbVUNDjFapY19yN9HyMyQOw66UMnFxUi7eYO+rhAPxaP4yFXcCz5X3
         c5t3+An99EjS8xP6r4d3jP1E8BpD4EkbuHMYDF7erkIZ2sHJb+Hv43UPCANDNkMoy+FW
         5WeGq82K+JkWry+EiG6KI8NvJiZI6kaKOpa+c1YZt+SWCb5Svti+gDevpAZ4l8siQt5f
         euakhWjdzYe7I4CW8p6GR4hCwq3jOBCyc8ibxbHiuWylAKPhTpV4//2OWN0XhkKJpCYu
         F5Hg==
X-Gm-Message-State: APjAAAXKFJ/Z24D8B7HZZuqpXA/yO+JcEM7Ou46Gw88mwaHSfNEZKu5t
        Q9K+cf8EPH04nG1GMa/J8sl8wpL/
X-Google-Smtp-Source: APXvYqx+8wLMb/7QNRhzAJhwqsDRW/LbsTrU0XFnc6zbc9PdJpkymBqVCFj97DQnA6rACGoyTk2G/Q==
X-Received: by 2002:a17:902:8d83:: with SMTP id v3mr8037036plo.282.1581769572127;
        Sat, 15 Feb 2020 04:26:12 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm10515875pjb.4.2020.02.15.04.26.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:26:11 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/8] hwmon: (pmbus/tps53679) Add support for IIN and PIN to TPS53679 and TPS53688
Date:   Sat, 15 Feb 2020 04:25:59 -0800
Message-Id: <20200215122602.14245-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215122602.14245-1-linux@roeck-us.net>
References: <20200215122602.14245-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

All chips of this series with published datasheets support IIN, PIN, and
STATUS_INPUT PMBus commands. Per TI Power Management Forum, "TPS53679 and
TPS53681 have the same PMBus command set". There is no reason to believe
that this does not apply to TPS53688. Let's assume that this is correct
and add support for IIN, PIN, and STATUS_INPUT to TPS53679 and TPS53688
to simplify adding support for more chips of the same series.

At the same time, drop reporting VIN on channel 2. On chips with published
datasheets this voltage is identical to the voltage reported on channel 1,
and there is no reason to believe that this is different for TPS53679 and
TPS53888.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/tps53679.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 77b2fb06c0d2..2a6495424a87 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -63,13 +63,13 @@ static struct pmbus_driver_info tps53679_info = {
 	.format[PSC_TEMPERATURE] = linear,
 	.format[PSC_CURRENT_OUT] = linear,
 	.format[PSC_POWER] = linear,
-	.func[0] = PMBUS_HAVE_VIN |
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_STATUS_INPUT |
 		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_POUT,
-	.func[1] = PMBUS_HAVE_VIN |
-		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_POUT,
-- 
2.17.1

