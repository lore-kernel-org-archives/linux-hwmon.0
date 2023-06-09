Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275AFC7EE37
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jun 2023 18:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbjFISfB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Jun 2023 14:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjFISev (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Jun 2023 14:34:51 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DBF3A81
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Jun 2023 11:34:38 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-55ab0f777acso1396291eaf.1
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jun 2023 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686335677; x=1688927677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tzN8nupiDg4YTMNsf4FMJfF6dPn08x98RlKFzo5rvEk=;
        b=nZ7zcwHlnEAtnIz58YVuXlNnQ3dkE5OWjv2P6V5EVIi+wp48l3Id586oW3fZXImO81
         ZGfhowfd7/ZyzW0tGzUI1/qOdyUOpjRfh7XnBkwYEWmyhGC1G2kIbpsuQl1/v2VzWBHn
         +WbgSjWz10fGb8hq6vDv8fDNrOzOYZHDB/t7x40ozLwGauxyzZBuElRQo9HOEc9rfSZ4
         eXCgxS1PscEqueoTyQH2dYessvHEAwiUBB3c3UeAoO6YtzjETkebAPzO7oZkGzgYsEgj
         Sb0+X5a1Ub8kUdMGwUDEWXP55AD5MoyYQSWYngHnEWAZwDVcQDdnwC5K0cebEVd54/uZ
         I8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335677; x=1688927677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzN8nupiDg4YTMNsf4FMJfF6dPn08x98RlKFzo5rvEk=;
        b=Tq/KhOUneMRIRddz12u8OpzKnTKod0Vk+bEhb3UqTN9YjET5H8fRZL0exL8nUvhS4D
         NzgnrNcOZPFgvLrrn8BsdVEUbnrZcL6H6ev6m+tWDtgL0fI9CUAZ6345Yk56kjtucal3
         hYQsmryogbubI9qWG5IEe6TAghUVngQCFnC2L0jMNj2Xorh3b00Hp7O7eVt3I/M6dJ1m
         GYTljIZCkFaH388w2JeWupbZsF8KvhP0mHnU0N1iBtdl/jvaceo2b3ichsysIjU/0RHJ
         XiBIZZRpfqQtEbFw8osKrjC3JUsLDvs0emQWOmBAUKMp1kX2Jx4X488PqP710hSMNNYm
         +7Xg==
X-Gm-Message-State: AC+VfDwcsN/vdr2Gs/IcLNx3IYR/cKkWwoWMieditmfFRcwxvZj4GS6g
        ThroSdNC5etEun6/TUEbgBSVicrxxIY=
X-Google-Smtp-Source: ACHHUZ4hyoB8e+CjdalIqh45L6Gf6nPXTnYYHCFxqiTVSMBBziGBVhM3x3jAsOHpH9usTNCaLWn19g==
X-Received: by 2002:a05:6359:587:b0:129:c30e:5c2c with SMTP id ee7-20020a056359058700b00129c30e5c2cmr2158516rwb.8.1686335676991;
        Fri, 09 Jun 2023 11:34:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l191-20020a6391c8000000b00544c0c45c21sm3199721pge.19.2023.06.09.11.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:34:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vlad Sytchenko <vsytch@google.com>,
        Steve Foreman <foremans@google.com>
Subject: [PATCH] hwmon: (pmbus/max16601) Add support for new revisions of MAX16508
Date:   Fri,  9 Jun 2023 11:34:33 -0700
Message-Id: <20230609183433.3633598-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

New revisions of MAX16508 report MAX16508.xx or MAX16508y.xx as device ID,
but are functionally similar to MAX16508. Add support for those chip
variants.

Cc: Vlad Sytchenko <vsytch@google.com>
Cc: Steve Foreman <foremans@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/max16601.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 6724f723f74c..2eb8a61decee 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -283,10 +283,10 @@ static int max16601_get_id(struct i2c_client *client)
 		return -ENODEV;
 
 	/*
-	 * PMBUS_IC_DEVICE_ID is expected to return MAX1660[012]y.xx" or
-	 * "MAX16500y.xx".cdxxcccccccccc
+	 * PMBUS_IC_DEVICE_ID is expected to return MAX1660[012]y.xx",
+	 * "MAX16500y.xx".cdxxcccccccccc, or "MAX16508y.xx".
 	 */
-	if (!strncmp(buf, "MAX16500", 8)) {
+	if (!strncmp(buf, "MAX16500", 8) || !strncmp(buf, "MAX16508", 8)) {
 		id = max16508;
 	} else if (!strncmp(buf, "MAX16600", 8)) {
 		id = max16600;
-- 
2.39.2

