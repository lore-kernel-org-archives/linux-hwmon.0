Return-Path: <SRS0=upQx=6X=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262A1C54E49
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 May 2020 20:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA27C21582
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 May 2020 20:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t/n8eC9s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgEIUUg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 9 May 2020 16:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgEIUUg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 9 May 2020 16:20:36 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BF5C061A0C
        for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2020 13:20:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id p25so2740401pfn.11
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2020 13:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=2Fvz5LV+bnOvF+wHDBzQk+opaej/1gtelj+GALj08JU=;
        b=t/n8eC9s5syk9Gh14ssdQ/vzkZr6fyaX1CVebwBUDkQqVe45lgPdkA4AXvVrzCNMUk
         0LSZdqBiY0/1DzqtOf7PDFvZpFaXmUrPwNXRLo2/wp5epCcwuZaqaadhc41hEYuGx6mI
         Z6Nqk17uMnlYWjwl10EVR0Pn+KPhXBy2lMzKDOkM+trFgJHvdi70IxDj9FiGGUlAGGS4
         YDAOZhvvCAQD9rgr0spLPBMOOvaq8Lpme/Ve1Rkd8GeWNF5JXy+6F0d8JYkoYuyYsNMl
         X5nfgLHUikEp5XkElMd09QnPaxxQ2KT1xZ5B63VGngLjgbQmS/Z29Ufh0wqQThoFwVdn
         NS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=2Fvz5LV+bnOvF+wHDBzQk+opaej/1gtelj+GALj08JU=;
        b=Ft/HtfJIH2YVB+MsARTXMK6zEfoAwI2qcE4tQul/L6zU9tAQpUkCsX2j0gYz+1g+s+
         cCZoJIm9YT/z1C+aCV5dYwiWDoqlG1b/qOXzOkm+/KdBpgDP956nAUgdTpF7v8VD9QZA
         23AVeYBTYqpWX4w2HmJMlasToSDQkhS+6NjiJNkwxvcvwsXew8zXZXQFxEH92FDPkIth
         kyLYt2Q5z/QjXxlQC6rkDzS36mwoybi0vXvq8x2g9ke4lmaJYS6y4xhIC/F49scHGgNu
         eC1GyWseN2SniqdQ6FJRJwIT5BCcE2i9icdjGNvzT9ABlrWRm8uspwmqAj1bYR+QoHCE
         /hSg==
X-Gm-Message-State: AGi0PuZm0ZJFuhwfkUgQ+jsVHHaDzzw1EYUQQOwtnGj94MPFiRTBGgnC
        E5/HXX/AzzQ4e9S0MPfpWdlDvwOk
X-Google-Smtp-Source: APiQypLcJw2nT7IWC4HO479DnFC0fpvZ26MHFKnCCxUMhA+wLBK1K63M2Zh4y/oMqe03jKNqathopw==
X-Received: by 2002:a63:a043:: with SMTP id u3mr7478999pgn.287.1589055635823;
        Sat, 09 May 2020 13:20:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p64sm5660137pjp.7.2020.05.09.13.20.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 May 2020 13:20:35 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (drivetemp) Fix SCT support if SCT data tables are not supported
Date:   Sat,  9 May 2020 13:20:32 -0700
Message-Id: <20200509202032.202455-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If SCT is supported but SCT data tables are not, the driver unnecessarily
tries to fall back to SMART. Use SCT without data tables instead in this
situation.

Fixes: 5b46903d8bf3 ("hwmon: Driver for disk and solid state drives with temperature sensors")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/drivetemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 9179460c2d9d..0d4f3d97ffc6 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -346,7 +346,7 @@ static int drivetemp_identify_sata(struct drivetemp_data *st)
 	st->have_temp_highest = temp_is_valid(buf[SCT_STATUS_TEMP_HIGHEST]);
 
 	if (!have_sct_data_table)
-		goto skip_sct;
+		goto skip_sct_data;
 
 	/* Request and read temperature history table */
 	memset(buf, '\0', sizeof(st->smartdata));
-- 
2.17.1

