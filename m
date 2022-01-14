Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8321EC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243409AbiANQf2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243424AbiANQf2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:28 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E239C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:28 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id v10-20020a4a244a000000b002ddfb22ab49so2392342oov.0
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dmevg3985+oCjOlGzgO9q/KJUcVhHLIyP6bMnt1osD8=;
        b=aD85WCiPJJajsgAASIlylz8yt7Xtdt6trooDpmYeG2uWUVztfXghwgUe4egN7/YAn2
         RGSPcSJxhHcz2fvOz4ob8s7a0zCJ6wjKx49vkCIFbVqY8qFG4Cj/tAoKjUjrhmify1G+
         AEijeDCaz6Oqo4w8zbX+UT3IFafTkeyBq+DDKMbw4FEmd7fvZqTfKlwBDGsJS2FO0kAm
         It1jHcEBEe4agAt5077YlW01t4iX0fK/kSVdam1/T1xVenRhzKNiSE4ye+Q4ZK+KotmB
         bv3jh1GcqvZLjQSwclhubQzQxi9JpVS7U20YF2xNsk0Ktog1WvEZFVx9DaRBEQJCjP7Y
         ZlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Dmevg3985+oCjOlGzgO9q/KJUcVhHLIyP6bMnt1osD8=;
        b=y3kRjMlRTPAM0xqPzR+pFqZLTnyT0VjgCQnGyzoKEVcxz1YOr6XQa6WX97RvzPvEdt
         pVZIas80mfZ4Vveg0YUq4t7892v124rqVA+qKSPK+bU7XYCmCE9k/VJGz69lgVIvCD+u
         6kz/5Anzy7/XLEZrYNvRMm6IoKaDPpu9jJGxdQqFajkeMu5NaP4kYC3HV2mkw/81UMnU
         ocKhV8JQydcjOmCp5YkcV8OoDw08eBVkSByZh6uVF+TShupnuRIgMt/s02aubQnsrpeV
         hJhCCA+xEV7nSnT2Na9rgyxWTm9A6vbq8i58m6vqdDZ3q1/JGE4ko7kPTdmZdsO9uvx/
         FYlw==
X-Gm-Message-State: AOAM533iuWAkurDUFukfg7Owk7uab1kC8i7KPA6FNp+nW0bSxBeP/ma4
        t88E14SMMfwhkrtnDPnAYxJr8ph3Zf0=
X-Google-Smtp-Source: ABdhPJw+U2VZ4kzBMbuhOIEm7e5SlUBlaHf7xspW9cG3wr3H5Yu5Lgj6EN5dcMHWquavsGv/8UtjtA==
X-Received: by 2002:a4a:2a45:: with SMTP id x5mr2372372oox.64.1642178127464;
        Fri, 14 Jan 2022 08:35:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c27sm2040822ooe.45.2022.01.14.08.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/8] hwmon: (lm83) Demote log message if chip identification fails
Date:   Fri, 14 Jan 2022 08:35:10 -0800
Message-Id: <20220114163512.1094472-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114163512.1094472-1-linux@roeck-us.net>
References: <20220114163512.1094472-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There should be no message in the kernel function if the detect function
fails to identify a chip; this is perfectly normal and does not warrant
a kernel log entry. Demote message to debug.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm83.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index 434bd5b903d2..82d7ef264f6f 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -341,9 +341,9 @@ static int lm83_detect(struct i2c_client *client,
 		break;
 	default:
 		/* identification failed */
-		dev_info(&adapter->dev,
-			 "Unsupported chip (man_id=0x%02X, chip_id=0x%02X)\n",
-			 man_id, chip_id);
+		dev_dbg(&adapter->dev,
+			"Unsupported chip (man_id=0x%02X, chip_id=0x%02X)\n",
+			man_id, chip_id);
 		return -ENODEV;
 	}
 
-- 
2.33.0

