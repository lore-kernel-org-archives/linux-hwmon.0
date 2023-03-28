Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427D2C76196
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Mar 2023 15:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbjC1PFI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 28 Mar 2023 11:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjC1PFH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Mar 2023 11:05:07 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB7FEB77
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 08:03:51 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso9667152wmb.0
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1680015819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfc+TC6H1PlSlxFpFQCACZ1XBg01+cDV6KBw8cNxn8g=;
        b=OSxGGIhx4Vg56wUYCQ8KPg1Tn15IEXVy/NE8SBWMkUB+t1fVYmTGzMzAm3e0QMWpo0
         mFD0OFqbk4JF9UVuu1sLUF9zcmjB200QemNxXvwGQEWJ+cauUTiF/NLLKfW5i33tr9x6
         IOZxSnymHZ0Q/vqSBEr0C5QY/RNWiyhS/ANwMlBW0A5f3aJCb4j1shzwZfnt9/a/74ip
         3jcHt6CYFKkvo2t90KcW6wjsCdbRg5eCxBDIYkx6nE5tIToF27jJ4c5ldWacSZfKOc8o
         RN93a69cFu2mrGGIzqa41H/UwG4OSbxPV53X/65FGZ+17LkXm8VynWqRWAKAOmCdv+la
         c+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680015819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfc+TC6H1PlSlxFpFQCACZ1XBg01+cDV6KBw8cNxn8g=;
        b=kN74UIbvdXzAyQWi2s4bfRRp7v6FMprbu0btotvK6N/c3wHTrleoBY3lp2nt2BzKkE
         xY1Ag4ma3OPSEI2XGbl9ATl7ShXo2sLxhrzCiFyXpfM3vbIBk3rhEwqkLdpKXKFQgekB
         9kZPdKga/GgZlWFZ+nKBF9KRsS6pHTExgNL8bxm+Fff2qu7z4p5o2yUz7qQuuWtBaw8+
         2gpLUVj7xSzPPwzqrmfWE4ttytGq2GQJJp9SaFPIvFckQKBJ09+vmm35gHNrgumTKse5
         /Y/rj13AcCrL+pkZRWSh9u7Ckmq6AmmOaTk5jCQh31D+0/NnJSqBsNaRGOyG/WDR3UDV
         IesA==
X-Gm-Message-State: AAQBX9e5tRAnD2LdfTO9VxUbye+bMreXsRpu0IBX03iuTbYbOLMa8ssR
        SpO6fa1xx4+7qhptEJfd5gTBgw==
X-Google-Smtp-Source: AKy350Zq9kh1XDdBrXtJ26uONjHkQWtkYQ+GRH/EveKHYfw0tWJwIteiGoDJWP4n9ulHqlgwF9iL+Q==
X-Received: by 2002:a1c:7714:0:b0:3ed:ea48:cd92 with SMTP id t20-20020a1c7714000000b003edea48cd92mr5643697wmi.15.1680015819441;
        Tue, 28 Mar 2023 08:03:39 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee63fe5203sm17429293wmm.36.2023.03.28.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 08:03:39 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: (pmbus/core): Notify regulator events
Date:   Tue, 28 Mar 2023 17:03:35 +0200
Message-Id: <20230328150335.90238-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230328150335.90238-1-Naresh.Solanki@9elements.com>
References: <20230328150335.90238-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Notify regulator events in PMBus irq handler.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 509bc0ef1706..86cc8001a788 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3159,11 +3159,29 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 
 	return 0;
 }
+
+static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
+{
+		int j;
+
+		for (j = 0; j < data->info->num_regulators; j++) {
+			if (page == rdev_get_id(data->rdevs[j])) {
+				regulator_notifier_call_chain(data->rdevs[j], event, NULL);
+				break;
+			}
+		}
+		return 0;
+}
 #else
 static int pmbus_regulator_register(struct pmbus_data *data)
 {
 	return 0;
 }
+
+static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
+{
+		return 0;
+}
 #endif
 
 static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
@@ -3178,9 +3196,13 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 
 	int i, status, event;
 	mutex_lock(&data->update_lock);
-	for (i = 0; i < data->info->pages; i++)
+	for (i = 0; i < data->info->pages; i++) {
 		_pmbus_get_flags(data, i, &status, &event, true);
 
+		if (event)
+			pmbus_regulator_notify(data, i, event);
+	}
+
 	pmbus_clear_faults(client);
 	mutex_unlock(&data->update_lock);
 
-- 
2.39.1

