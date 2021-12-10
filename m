Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ED9C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 20:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240478AbhLJUFS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 15:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbhLJUFR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 15:05:17 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FFFC061746
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:42 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id o4so14680598oia.10
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=324RA3Gg2dJx1zBs0E3znK4Ivd7vMuSkoiZtjRKOIuU=;
        b=PSCzCHVyAFhTWoDjWd9ApM1TnFkLO/6G4PQwW81eOq3T1MR4/W1kvVSbcQmVLRUAMx
         70Yem1YIeGtmFVg6X/a2MHB1JWJGFffB81qR7SC9CdGvxM3RWQzVJL77UN4vFJCnCnFD
         xVnhtL0DV6e0ir1zE+2bj/peJzSJEk2ykVMmtXKRivjMTUM6tfhQYGnw2zg8/WHye6/F
         Cinl10bUe5OoZjedpJ8HuM9Z+jdivziXMSAf+xqs8h3gPMIPZS95Q+Xh5KSzQbWBXdwa
         ODpRN6jQiMgaTWPGaKO1JOxgmUeBymGd3Y+nWfnRb12z1PCRdT+FfwzhgHK+94IjMLP1
         NZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=324RA3Gg2dJx1zBs0E3znK4Ivd7vMuSkoiZtjRKOIuU=;
        b=NQ1PdPgNEa0zoVRZjqTyRT7fE6INaVYi5TdOCVv/OPKs5DOxV0S6YXY/BCIMBLObSL
         BsXodpspCPgBke2h5hxOKEnDkc+F7NWnYsvsFcX1gO//OYUHWVZLJPLJ/J4eaIEcg1qc
         Eea2yBkhv4XxG7UeXOsSiXJLTjj8MAh3xKqn+Rmvp+0phCDROerOKFQ34ILjnL3fXz/h
         oVdZRB1EuUEWghDeZQmdN2k4Fy8OzWfZBCpOdsWolgGINW5Glq8x1NffJZ8deDNFokC8
         D0jyGVJbQV9s2VpfbnkX0QxeBFVw1ZfFhNzYutzQxwChncS43PMWLvMEFlhSRD9uY/im
         UFYw==
X-Gm-Message-State: AOAM532LFPKuuuDWY8ACqbzZpPVwg7T+BYbWmFU8nR1SOCul8jJXgAvP
        kkKOK7E5O1uer0ry2O9iefRePHXeN9o=
X-Google-Smtp-Source: ABdhPJwcplvaR8xgXs+KBQOn2srNo8Ia4yFn8yPCudUCfX7ZabmTexgUaPyGtso/7FUkyMf5LTbyDA==
X-Received: by 2002:a05:6808:2181:: with SMTP id be1mr13775671oib.147.1639166501512;
        Fri, 10 Dec 2021 12:01:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g17sm873433oiy.14.2021.12.10.12.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 12:01:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/5] hwmon: (lm90) Fix usage of CONFIG2 register in detect function
Date:   Fri, 10 Dec 2021 12:01:32 -0800
Message-Id: <20211210200136.1662127-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211210200136.1662127-1-linux@roeck-us.net>
References: <20211210200136.1662127-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The detect function had a comment "Make compiler happy" when id did not
read the second configuration register. As it turns out, the code was
checking the contents of this register for manufacturer ID 0xA1 (NXP
Semiconductor/Philips), but never actually read the register. So it
wasn't surprising that the compiler complained, and it indeed had a point.
Fix the code to read the register contents for manufacturer ID 0xa1.

At the same time, the code was reading the register for manufacturer ID
0x41 (Analog Devices), but it was not using the results. In effect it was
just checking if reading the register returned an error. That doesn't
really add much if any value, so stop doing that.

Fixes: f90be42fb383 ("hwmon: (lm90) Refactor reading of config2 register")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 618052c6cdb6..b05d73c4fbe2 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1465,12 +1465,11 @@ static int lm90_detect(struct i2c_client *client,
 	if (man_id < 0 || chip_id < 0 || config1 < 0 || convrate < 0)
 		return -ENODEV;
 
-	if (man_id == 0x01 || man_id == 0x5C || man_id == 0x41) {
+	if (man_id == 0x01 || man_id == 0x5C || man_id == 0xA1) {
 		config2 = i2c_smbus_read_byte_data(client, LM90_REG_R_CONFIG2);
 		if (config2 < 0)
 			return -ENODEV;
-	} else
-		config2 = 0;		/* Make compiler happy */
+	}
 
 	if ((address == 0x4C || address == 0x4D)
 	 && man_id == 0x01) { /* National Semiconductor */
-- 
2.33.0

