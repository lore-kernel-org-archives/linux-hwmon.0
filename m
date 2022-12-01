Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A27FC4321E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 19:31:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbiLATbV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbiLATao (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 14:30:44 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35755CAB58
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 11:30:36 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id o13so6652862ejm.1
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 11:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHC6ytZAHLrNLiHuUN2hc1jXap++ZHEcJiLjtBPhfto=;
        b=AUxf8Xm6UpCWhAeGDcR+3W5Z4SnIFEAv3fiL9oHqUJoa5WoxIlahHfcmR9mvTQCvZ0
         MlvtW/BT2XFgh4zIhtnqE+P3QGK1LZrWRLAWuey+2v/ozgM9UmK15XA09InVz968DA1F
         kT7FMPmrydaUJcVh/AKcj5HbAMRaK9NyoDKXhAS792EyNFsK2D2UA39aKXmifavWBdnm
         6aOlCGYV7P/sdQGEXYj8JBDtAk0aJSnSBW2DeD8ycmiGmITghzLW7rFRl5ur9GtNrLku
         rbCusZH9cwlRfbGeKpTG+rw7aAWE8/e27NPrO9MuW4vLQIu2veBTwc6E45+umqQE4IhO
         Cc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHC6ytZAHLrNLiHuUN2hc1jXap++ZHEcJiLjtBPhfto=;
        b=vZx06sXvbo6L/hLpASIhszyv9oGJ0vL8WQEZzmqSPnvCfcnYT8QgDykOZBb8kZa1oU
         5CPjxR13pWEb9bHTNjIrEvWA4QzLuE6XawEB0ZQsYxXVmnh6D8IczjTNVZcy4uC29FDu
         /QMJTbpjj2Sgw3F5X2rsOg4DtvlqAABI7QBzMSC06BEkEKrwYo+tJ/XZm+QA1EQwzFOX
         Ex02ymTvHrTTE2mF13hVj4UqSrAbdDa1f/JCv/TDvQzL9iCP8/xEY6FGVM+Nb1Em+QiK
         MaWerQJ+3yIYN0a99rv2MKIbGUsZvcc7tE4Mftf8+vE4Ms40LaS5LBu18X0zgGdanfDP
         3hZQ==
X-Gm-Message-State: ANoB5pkf7OecL5DWPIjadDWVfkm2zSurn/ScP4h1e/mWznpEvzqvImua
        bMXAT+dDyI9TfvICtS6qvz8LGw==
X-Google-Smtp-Source: AA0mqf4FN2LlAcctT2gQ+2sI+0CRqoL0SJP2GLj//yvst5I/C/b7mWqa3qMoHOBWeC5EOA3kCTVgdQ==
X-Received: by 2002:a17:906:cc8f:b0:78b:8ce7:fe3c with SMTP id oq15-20020a170906cc8f00b0078b8ce7fe3cmr57197229ejb.557.1669923034733;
        Thu, 01 Dec 2022 11:30:34 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id g15-20020aa7c84f000000b004619f024864sm2054110edt.81.2022.12.01.11.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:30:34 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v5 5/5] hwmon: (pmbus/core): Notify regulator events
Date:   Thu,  1 Dec 2022 20:30:24 +0100
Message-Id: <20221201193025.1584365-5-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221201193025.1584365-1-Naresh.Solanki@9elements.com>
References: <20221201193025.1584365-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Notify regulator events in PMBus irq handler.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index caefcb99aadf..5241a3c9bd21 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3158,6 +3158,11 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 		if (ret)
 			return ret;
 
+		if (event) {
+			regulator_notifier_call_chain(data->rdevs[i], event, NULL);
+			ret = IRQ_HANDLED;
+		}
+
 		page = rdev_get_id(data->rdevs[i]);
 		mutex_lock(&data->update_lock);
 		status = pmbus_read_status_word(client, page);
-- 
2.37.3

