Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC162C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 07:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A373864FC0
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 07:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhCKHdp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Mar 2021 02:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhCKHdc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Mar 2021 02:33:32 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649C5C061760
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Mar 2021 23:33:06 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id t83so12202977oih.12
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Mar 2021 23:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=pIQ5/xRwd1kFLv7YBBf2e+jHGkeLTrTdDIdbld6TkAg=;
        b=cgDSpBc7XpW5Wtaf2ZwIDhqogDHw8Bvah6ZOwwKxGm4ytBEtuHLI0Xy5mSGj0MDm88
         XpM/xkaMqOtqCoRD8UdQpNqueNaC7tr5Almd8CxUghFFHtulPDygwt91eFvYAJAdw0c2
         w7fbe6fOcGdB+LzVhiyHAtEW1BbvkB1MWUn6ayACM1AUPqkYqM8cbG+F2R5CWN05dCQL
         ps8FQFLoIe8bys9Omy0I3PPQhKw1DdKV4+MTSOaDToQFtlbAKvnyOMgdgJ4wUoTnEuVq
         e7CWX9lReksuN4Pnp1+GBR2olPA5DA/ealRbTSus8PfXoOK2Oz0/Cwm7Wr/7KVP5ePM5
         vJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=pIQ5/xRwd1kFLv7YBBf2e+jHGkeLTrTdDIdbld6TkAg=;
        b=J4vxv4O/y17nuvQ7pYUUl8HOamTqAB/27itJW06pbbVCWiUFncJP2vVIgeuULhHhiU
         s4GlTE6bVPf+PS8XYXKYa+0wGHPre0qCxISlV9XcbZ9MnaqzwEZ3HU+7AyN5JUaKkFr5
         7byHYhVGNdS0AtzYtdVSFmV8ND5k7NZnakMfhlrNFaE/QMrbQf2BwpVrbM+zuVJaOxej
         pMXEfgLPfIhpoRKf9XKg33wD5Q0YXHlolgaAJlzjFTHjah5uMgUcvBu84QZcR16MDLkN
         1R9dipkxy8vZjkyVV4MM40VwIzyw99iQMEx/5DLJm1zWwCAhefHqA26VGM7yGJZxzRkt
         KawQ==
X-Gm-Message-State: AOAM531eo5qmt8oDIzWxzh1qRDrq/1eQQ+ddwZxSl9xfiKtGGoXR1kMJ
        bopbSbj62sJrEZQk9a5booGRnLWD74Y=
X-Google-Smtp-Source: ABdhPJxK6+x7Y1SHDUurZ/jpImnE7kuCH92hlcGuAhNzc14TPM/anM8t8A7QUUVQc46esVey/24yEw==
X-Received: by 2002:a05:6808:1304:: with SMTP id y4mr5418175oiv.75.1615447985494;
        Wed, 10 Mar 2021 23:33:05 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o197sm392512ooo.44.2021.03.10.23.33.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 23:33:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: [PATCH 1/3] hwmon: (adm9240) Drop log messages from detect function
Date:   Wed, 10 Mar 2021 23:33:00 -0800
Message-Id: <20210311073302.221954-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Not detecting a chip in the detect function is normal and should not
generate any log messages, much less error messages.

Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm9240.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index cc3e0184e720..3bbdd662c9e4 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -730,26 +730,19 @@ static int adm9240_detect(struct i2c_client *new_client,
 		return -ENODEV;
 
 	/* verify chip: reg address should match i2c address */
-	if (i2c_smbus_read_byte_data(new_client, ADM9240_REG_I2C_ADDR)
-			!= address) {
-		dev_err(&adapter->dev, "detect fail: address match, 0x%02x\n",
-			address);
+	if (i2c_smbus_read_byte_data(new_client, ADM9240_REG_I2C_ADDR) != address)
 		return -ENODEV;
-	}
 
 	/* check known chip manufacturer */
 	man_id = i2c_smbus_read_byte_data(new_client, ADM9240_REG_MAN_ID);
-	if (man_id == 0x23) {
+	if (man_id == 0x23)
 		name = "adm9240";
-	} else if (man_id == 0xda) {
+	else if (man_id == 0xda)
 		name = "ds1780";
-	} else if (man_id == 0x01) {
+	else if (man_id == 0x01)
 		name = "lm81";
-	} else {
-		dev_err(&adapter->dev, "detect fail: unknown manuf, 0x%02x\n",
-			man_id);
+	else
 		return -ENODEV;
-	}
 
 	/* successful detect, print chip info */
 	die_rev = i2c_smbus_read_byte_data(new_client, ADM9240_REG_DIE_REV);
-- 
2.17.1

