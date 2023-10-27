Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13BAC25B67
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Oct 2023 10:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345649AbjJ0KeI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Oct 2023 06:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbjJ0KeE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Oct 2023 06:34:04 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C154318F
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Oct 2023 03:34:00 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4079ed65582so13985945e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Oct 2023 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1698402839; x=1699007639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XUKyf7v2Vpql9dyi+ajoLVLsPQFQmhMH2gCSqdsIfVw=;
        b=VkdpVUEd7dVwVaAYoXanWqLvbAuPqvpwA9yaCnXE7FK7Jdo8hyn+kz/Jb6wildxt95
         1VzDoqNi4vT/31FgYfhx848HTRnnEtY/9llw9A0wK7swfrq8Yu0BnyGozuaP8/VPoiM+
         oefdvNuQ13HFPcQbcR1AgGR6TfKg5vcCeWJdAe7azcT5U5HtSp5WqaCVLFv1zVmUcW7j
         htfB7pgBjA28Vokerxlo8HcTXH/cvSfqSDw4XfQ6BG9nB9zma9nvlRCyEwZhI3XlFHR1
         XU8fBsKRDsewBRKyDhqPFsTcFJttGRxKf3wzciQ/fW8Hb+Hr+xw0p9/OaA89vmVFUizH
         Emfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698402839; x=1699007639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUKyf7v2Vpql9dyi+ajoLVLsPQFQmhMH2gCSqdsIfVw=;
        b=pwFN5xu7baJaf3o4z72W8g7sz6eBt2+cvennFBhWnhEOKp4YlJK7OWLRxLVSYlPBrw
         Cr0BrqJj2lBetqa965oSf6lehnv+nQP0jlhMoWu80X2kCH8kSkNTA0NBQHOBqrrkPtmX
         E6pQ9yZbj3FeYpcE6nuvNEkpbdf1LlfxpxytyX1Y6ob1talIsQGyGY6QX26IVNV0RsKU
         2nz2P1hjmaGu+aAALwwTOwsi4aJZfRHo7qCcIyqL4TQHFy0A8sK2BuN03RCXH8s1CHTK
         YM3dCfvO5n3RfkGQDLP5XQCWeq1KJyHcz3IoG5BYyZg/gWAjJ6n3Ncdpg2h6+oL17Jy9
         qStw==
X-Gm-Message-State: AOJu0YwOKlZSi+I9l/Nk/LUgxKmn5s9syAojzs/iqqBxd6Z3xAA+M0sv
        /aDkgDNwx0NGRNx7GGX0Fh6ezA==
X-Google-Smtp-Source: AGHT+IFxwiXJ/YgK8t7ooPxrejX4aG8RM4SgcUJ2/M4NBlywqSCH/rH+Qs6MDI0pVpa3tKWWH6uTgw==
X-Received: by 2002:a05:600c:1546:b0:3fe:4cbc:c345 with SMTP id f6-20020a05600c154600b003fe4cbcc345mr1990433wmg.41.1698402839177;
        Fri, 27 Oct 2023 03:33:59 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c130f00b003fbe4cecc3bsm4701804wmf.16.2023.10.27.03.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 03:33:58 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Naresh Solanki <naresh.solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/mp2975) Move PGOOD fix
Date:   Fri, 27 Oct 2023 10:33:52 +0000
Message-ID: <20231027103352.918895-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The PGOOD fix was intended for MP2973 & MP2971 & not for MP2975.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/pmbus/mp2975.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 26ba50633100..b9bb469e2d8f 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -297,6 +297,11 @@ static int mp2973_read_word_data(struct i2c_client *client, int page,
 	int ret;
 
 	switch (reg) {
+	case PMBUS_STATUS_WORD:
+		/* MP2973 & MP2971 return PGOOD instead of PB_STATUS_POWER_GOOD_N. */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		ret ^= PB_STATUS_POWER_GOOD_N;
+		break;
 	case PMBUS_OT_FAULT_LIMIT:
 		ret = mp2975_read_word_helper(client, page, phase, reg,
 					      GENMASK(7, 0));
@@ -380,11 +385,6 @@ static int mp2975_read_word_data(struct i2c_client *client, int page,
 	int ret;
 
 	switch (reg) {
-	case PMBUS_STATUS_WORD:
-		/* MP2973 & MP2971 return PGOOD instead of PB_STATUS_POWER_GOOD_N. */
-		ret = pmbus_read_word_data(client, page, phase, reg);
-		ret ^= PB_STATUS_POWER_GOOD_N;
-		break;
 	case PMBUS_OT_FAULT_LIMIT:
 		ret = mp2975_read_word_helper(client, page, phase, reg,
 					      GENMASK(7, 0));

base-commit: 5421af83a43bdcb646564fec238253d11009ad3f
-- 
2.41.0

