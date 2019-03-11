Return-Path: <SRS0=8uXM=RO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ED2C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73F2E206BA
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ingics-com.20150623.gappssmtp.com header.i=@ingics-com.20150623.gappssmtp.com header.b="0KMpBNh2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfCKJ5l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Mar 2019 05:57:41 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45587 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbfCKJ5l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Mar 2019 05:57:41 -0400
Received: by mail-pf1-f195.google.com with SMTP id v21so3305701pfm.12
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Mar 2019 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=KMd4S39YGLM60NflETesnzW8/ynOuVrYRvzjKGQhx38=;
        b=0KMpBNh2hypG9lZ21nxsueO8DZDwXw/OJC6J1YqFkOxjQoeKnj3emdjYRAwtdlWbKv
         j7GjvSzWCyXD0PqQr+TqejbrF45pVF4W1pcsDisoTfj6EcjPcSp5MbWQDBxjAVccTcWQ
         GDxJcME8E1yx2xlVfNfyXTbMsNEJgAxz0mPWRDAW5qUAS63nmK+dc6TitPv2pwY/sfgw
         Bx26BLN5FLG6wqS5LrZGxjrjbdpVHAOSKTIY/1V3nv//w2OxUTCJ+1OAJa3+lEQp9NzM
         ua49L01lluHn3hTyIVyU0HNSZYrxqET9sbKxNVKh38zZ3/Mf99bWN8N54DyLAe42WrQQ
         Wx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KMd4S39YGLM60NflETesnzW8/ynOuVrYRvzjKGQhx38=;
        b=U7fpzlwXEOddhVKW6FTAQ3LB9xk/mR+MUJy2Lg38+VX21x5mG3gKbSfc5KthEcPFpx
         0rxZNtFm28JaRDJ7xcfVC8zu0/oJskfqODWZjlnyG7u9HG/A6w8lF4gfPE8RMYW60lkg
         2AEkOZTWBCdiYUL/W684/3S7XORq2i8pNg7QnwAN7EWNjrsk7dys1lYq53+5FuoJOTm8
         bgkoPwZB1A9nvVWU0gU9Y19xe6OOIC34ZODRck2a7eH4lO2kQTsNBV7DesLxrGfZjcgi
         3BJ3OttoatM3KLApoH1ywIBLHoburcuACehK+i6Cqx4jf61pfdXda5ajrWJermI2L4bO
         zT9Q==
X-Gm-Message-State: APjAAAVh2ts39H8eChA48OQOyj+J5TpOddwBgXzldjjidgbl0aPCsq1o
        ugCtWXVg721UWUi0MpsEbRHaam3zoNKomw==
X-Google-Smtp-Source: APXvYqygJA3DJXyyssqqlkaQXAI7uME5b9PLMdYibnetZWShBXe7Uwei8eRnTx3+MVyJRunOgEUYRA==
X-Received: by 2002:a63:4c18:: with SMTP id z24mr29601920pga.62.1552298260918;
        Mon, 11 Mar 2019 02:57:40 -0700 (PDT)
Received: from localhost.localdomain (220-133-186-239.HINET-IP.hinet.net. [220.133.186.239])
        by smtp.gmail.com with ESMTPSA id m17sm8690994pff.170.2019.03.11.02.57.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 02:57:39 -0700 (PDT)
From:   Axel Lin <axel.lin@ingics.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Lei YU <mine260309@gmail.com>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] hwmon: (w83773g) Select REGMAP_I2C to fix build error
Date:   Mon, 11 Mar 2019 17:57:30 +0800
Message-Id: <20190311095730.3288-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Select REGMAP_I2C to avoid below build error:
ERROR: "__devm_regmap_init_i2c" [drivers/hwmon/w83773g.ko] undefined!

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 6f929bfa9fcd..d0f1dfe2bcbb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1759,6 +1759,7 @@ config SENSORS_VT8231
 config SENSORS_W83773G
 	tristate "Nuvoton W83773G"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the Nuvoton W83773G hardware
 	  monitoring chip.
-- 
2.17.1

