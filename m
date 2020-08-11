Return-Path: <SRS0=x4WH=BV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D92C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Aug 2020 14:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD74A2076C
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Aug 2020 14:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW36UHO4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgHKO5M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Aug 2020 10:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgHKO5M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Aug 2020 10:57:12 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54360C06174A
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2020 07:57:12 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t10so6924359plz.10
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2020 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=HiRyyvPWTm8b2GQeXXjpsfAovyJaui0eVELYWeqdZUk=;
        b=cW36UHO4Gup4UNNIFjGJayEXDnAASuM0vq9VvzLILhqyVF7rAx4XAKpwiqSY0jNWKz
         GJxmsj339VwraLgT+IxMLNN0fyLJWW3Yw1vQ4kKIojVASX3M6i9QyFplfXgvE/Pd5i8V
         t84IEFW++AorrHU+uQRbz+P+nhIHFntEF45FCPZR8Lv4rV01xjRqhTeAfp+X/ALKwIsf
         et2t/v0uNh4j2CQBD5o0hF8YzYt/Vm1MPtEVftizj3gi/a8MmrVVLG3j9sJMVMG7LkKL
         9ESJX1LcO43Vs2wMHLcVbDbbi4mUp0EBoZnw84fpsM7/W5e6yhbxN0wnXHh3kj81GShE
         7cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=HiRyyvPWTm8b2GQeXXjpsfAovyJaui0eVELYWeqdZUk=;
        b=YKT6sbYwfiWs7HlxqD26FGGhRjApNiYy4JdS0KkH8VHPQru0ruGusJYAKYd5At11oP
         zmUp8khzh7mORTGOGVRRsb88UwqGS2NUvMSFxHBWGa2WYpZpGA+yczb8cgp8NPZ7SoMw
         W498geFAkPFP6W0uWtA9UhuZI9ACuWEC+Y3cATwIx+bwL3Y/CS3gwxQigCZKLWqVKLnb
         nvnYttulF/Qq4Z3z75yMiAZlcQWzgHocgDk1zZJzPabckIPxAlNBC+iPvtHr27IzFgh+
         fdm3nASW2rtpQMTT9Qp59kC1m3n4Z2VX6bUV6kugAauEUEkYIJMr8+ZRX1q25MzyLCnz
         bKyQ==
X-Gm-Message-State: AOAM533QTc7JQcMdbBL4RYTehYte8l7yRkVvRbkudQ0TMQbN4HmDmvde
        sZR5Rh23n8trBQqOouvPo0MOX11X
X-Google-Smtp-Source: ABdhPJwwwACHgJUW8oO9/ezJ7AitNAfOTwy66kahSJSDE67ZebRbi7GEty3JcVbxTlvLwY9vspAKSg==
X-Received: by 2002:a17:90a:e107:: with SMTP id c7mr1513960pjz.100.1597157831568;
        Tue, 11 Aug 2020 07:57:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f77sm27344976pfa.216.2020.08.11.07.57.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 07:57:11 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Peter Sulyok <peter@sulyok.net>
Subject: [PATCH] hwmon: (drivetemp) Add usage not describing impact on drive spin-down
Date:   Tue, 11 Aug 2020 07:57:09 -0700
Message-Id: <20200811145709.55940-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On some drives, reading the drive temperature resets the drive's
spin-down timer. If the drive temperature is read too often, affected
drives will never spin down. Add this information as usage note to
the driver documentation.

Reported-by: Peter Sulyok <peter@sulyok.net>
Cc: Peter Sulyok <peter@sulyok.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/drivetemp.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/hwmon/drivetemp.rst b/Documentation/hwmon/drivetemp.rst
index 2d37d049247f..0b1cf2f912c5 100644
--- a/Documentation/hwmon/drivetemp.rst
+++ b/Documentation/hwmon/drivetemp.rst
@@ -30,6 +30,24 @@ Transport is not supported, the driver uses SMART attributes to read
 the drive temperature.
 
 
+Usage Note
+----------
+
+Reading the drive temperature may reset the spin down timer on some drives.
+This has been observed with WD120EFAX drives, but may be seen with other
+drives as well. The same behavior is observed if the 'hdtemp' or 'smartd'
+tools are used to access the drive.
+With the WD120EFAX drive, reading the drive temperature using the drivetemp
+driver is still possible _after_ it transitioned to standby mode, and
+reading the drive temperature in this mode will not cause the drive to
+change its mode (meaning the drive will not spin up). It is unknown if other
+drives experience similar behavior.
+
+A known workaround for WD120EFAX drives is to read the drive temperature at
+intervals larger than twice the spin-down time. Otherwise affected drives
+will never spin down.
+
+
 Sysfs entries
 -------------
 
-- 
2.17.1

