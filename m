Return-Path: <SRS0=ykys=B6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5596C433E3
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Aug 2020 13:22:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D6DE22D07
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Aug 2020 13:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdG67+29"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbgHTNVy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Aug 2020 09:21:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25973 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729117AbgHTNTm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Aug 2020 09:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597929580;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=EYEbh/d854a4Cvi1ZmxUctES1NziyUONjpMTuL++zu0=;
        b=KdG67+296sUS/O13+DONjGFaD2c0ki3U1m7m7GME2wVW1Po0iaIxDewcGkTsbWO44sH2cZ
        ec+mIy4nro0yifSDNqUfFpSubq3CE9GEkGR9Pv6H++ZCU0iJmyOTtXi4rR6ixb6TbjtULA
        n1uEOzFSwZ85M+Oo1TWra6v42F9v0vs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-FUeuprS0MqG7t_nXsP9mNg-1; Thu, 20 Aug 2020 09:19:39 -0400
X-MC-Unique: FUeuprS0MqG7t_nXsP9mNg-1
Received: by mail-qt1-f198.google.com with SMTP id z5so1524082qtc.2
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2020 06:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EYEbh/d854a4Cvi1ZmxUctES1NziyUONjpMTuL++zu0=;
        b=bHgMZI3Z5H+HtII7T9gXBIv+wv13ya1DC5CAny09MwzBfGFrmeyDjdLjKDgmQvXju4
         Coy1yW1eV2Vddke07Tab9clNIWMwJlXwrnYTfcWP3kDBcbzSzlNwQKLw6LZejDsKEw8w
         qvGr8TOGgA2s3mzVLdqoo8/OMqBJDlDDvCZwLpTuONXxwor0qc6D0UhIe/M5ABGp2jnD
         kVjOsgmP/g+TXLfRh+qk7F3fHd0RZyJy4kt/G80fShR6emD+HyYDmS9asOcoREod6WV7
         VNK/7IH5xkQZM2feiSCDgZISk2wBw8a17UH+uUdMyOTJ1svH1ryWz8YrljR9bUvZRfw2
         I5+Q==
X-Gm-Message-State: AOAM533Vi9Lc+YYPEvQwwvhIcbFnpk3z4iOfJvghjcrQfkY1lHgyQQzN
        5qMmFgNj3d0v1ezBiv6zJYTOnRsMoSA9yLWR4JNf6KOog0ELbg3kvaSiW3xOy4dAODatkA6B1gq
        NaXhf2rIzb6MkrKrXz/GL0Ak=
X-Received: by 2002:ac8:71d6:: with SMTP id i22mr2532263qtp.371.1597929578429;
        Thu, 20 Aug 2020 06:19:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylmGEqva8k65GQbvrfrvomBJaM4CqPY7z4t1eMT+zT+dmuDhYUfv1MeCKO+nFkDiWH+W8K5w==
X-Received: by 2002:ac8:71d6:: with SMTP id i22mr2532245qtp.371.1597929578139;
        Thu, 20 Aug 2020 06:19:38 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b37sm3022312qtk.85.2020.08.20.06.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 06:19:37 -0700 (PDT)
From:   trix@redhat.com
To:     rydberg@bitmath.org, jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] hwmon: applesmc: check status earlier.
Date:   Thu, 20 Aug 2020 06:19:32 -0700
Message-Id: <20200820131932.10590-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this representative problem

applesmc.c:758:10: warning: 1st function call argument is an
  uninitialized value
        left = be16_to_cpu(*(__be16 *)(buffer + 6)) >> 2;
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

buffer is filled by the earlier call

	ret = applesmc_read_key(LIGHT_SENSOR_LEFT_KEY, ...

This problem is reported because a goto skips the status check.
Other similar problems use data from applesmc_read_key before checking
the status.  So move the checks to before the use.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/hwmon/applesmc.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 316618409315..a18887990f4a 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -753,15 +753,18 @@ static ssize_t applesmc_light_show(struct device *dev,
 	}
 
 	ret = applesmc_read_key(LIGHT_SENSOR_LEFT_KEY, buffer, data_length);
+	if (ret)
+		goto out;
 	/* newer macbooks report a single 10-bit bigendian value */
 	if (data_length == 10) {
 		left = be16_to_cpu(*(__be16 *)(buffer + 6)) >> 2;
 		goto out;
 	}
 	left = buffer[2];
+
+	ret = applesmc_read_key(LIGHT_SENSOR_RIGHT_KEY, buffer, data_length);
 	if (ret)
 		goto out;
-	ret = applesmc_read_key(LIGHT_SENSOR_RIGHT_KEY, buffer, data_length);
 	right = buffer[2];
 
 out:
@@ -810,12 +813,11 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
 		  to_index(attr));
 
 	ret = applesmc_read_key(newkey, buffer, 2);
-	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
-
 	if (ret)
 		return ret;
-	else
-		return snprintf(sysfsbuf, PAGE_SIZE, "%u\n", speed);
+
+	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
+	return snprintf(sysfsbuf, PAGE_SIZE, "%u\n", speed);
 }
 
 static ssize_t applesmc_store_fan_speed(struct device *dev,
@@ -851,12 +853,11 @@ static ssize_t applesmc_show_fan_manual(struct device *dev,
 	u8 buffer[2];
 
 	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
-	manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
-
 	if (ret)
 		return ret;
-	else
-		return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", manual);
+
+	manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
+	return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", manual);
 }
 
 static ssize_t applesmc_store_fan_manual(struct device *dev,
@@ -872,10 +873,11 @@ static ssize_t applesmc_store_fan_manual(struct device *dev,
 		return -EINVAL;
 
 	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
-	val = (buffer[0] << 8 | buffer[1]);
 	if (ret)
 		goto out;
 
+	val = (buffer[0] << 8 | buffer[1]);
+
 	if (input)
 		val = val | (0x01 << to_index(attr));
 	else
@@ -951,13 +953,12 @@ static ssize_t applesmc_key_count_show(struct device *dev,
 	u32 count;
 
 	ret = applesmc_read_key(KEY_COUNT_KEY, buffer, 4);
-	count = ((u32)buffer[0]<<24) + ((u32)buffer[1]<<16) +
-						((u32)buffer[2]<<8) + buffer[3];
-
 	if (ret)
 		return ret;
-	else
-		return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", count);
+
+	count = ((u32)buffer[0]<<24) + ((u32)buffer[1]<<16) +
+						((u32)buffer[2]<<8) + buffer[3];
+	return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", count);
 }
 
 static ssize_t applesmc_key_at_index_read_show(struct device *dev,
-- 
2.18.1

