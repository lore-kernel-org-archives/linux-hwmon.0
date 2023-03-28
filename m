Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AC0C76196
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Mar 2023 12:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjC1MRV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 28 Mar 2023 08:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjC1MRT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Mar 2023 08:17:19 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36E193E5
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 05:17:17 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q19so8901011wrc.5
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1680005836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeUPgXrF4K4m85vkJ85zA0RhoqDQvOd+JPknE/eMLR8=;
        b=eBjNkUOBU95KtnjFGpzQFxa3gTNmPuNDntlkXc0qwkcbY7mHOfNLISGY6mMjTNf4sV
         +7TPX8S8bRz4BApgEYC/4JJAC0rXQygZeAC352q5f0q6pWgOtRrhHeAXRx8HbMoEyg8k
         wDzJqERukynPcleQ1ncNqqHIoewQXRVRAmvNXW0YSd8TGBkBzIQwNm5mA+T7ZdccOXJE
         W6A8/SdXdynu1Y6yQDTIeKN1FTMaCn+w+zJUFSt/AyKdmqRY9iLuttba8p4UifiEBsAC
         dp8W2mVnlKU9D52W1xxiuruzJlOqSQsajC19kgVbNo4kEq8DI/c2mdjt+8C2GtmyfqLr
         XwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680005836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeUPgXrF4K4m85vkJ85zA0RhoqDQvOd+JPknE/eMLR8=;
        b=S6wihv++Xv8cTefY03l040JrA7uITNdX0ISncVlgSGArQ7Ht1RbWtej2iasif3hfjy
         CgMNdsVO1Vkg4PA8mbh4iUQkxq8dWkON9MPnoKyQQY/pth/xDbqhCC4gJmPbjkC6Dt1t
         b5uOy/oNjuCGJGah/ot/dGdD1KTRJUIMQ8Vzl9tXj0ZVNHY25YpvyWpbugPr3OAYnfSe
         8fCivPwa2mByby/LeVoJrv0CVkquPN8Oe4gxyYhBSrCYoLPKSIzio3j5j9Y6dIGK0C3M
         tkhnRbFe3koQQgejvaUlFCuOKNoJLhTxTrTtq/y/ryKll17EW+09jtMFP9jn/aeb4aj3
         vESw==
X-Gm-Message-State: AAQBX9c+3ID+7n8pGQGKsRB3Eb5aKrY0sAgJy+RHsBA5BpT50Flu9QgK
        AsAbIMVmmN4ANxpxwTncA8X2wQ==
X-Google-Smtp-Source: AKy350ZPv5J5EjhsTFkyeB7zHYHckKUZVcTZsIHycXcHYI0ywfBDD/aQuSB3+Bjmx+pChrH0EmpypA==
X-Received: by 2002:adf:fd11:0:b0:2c7:1a86:aecd with SMTP id e17-20020adffd11000000b002c71a86aecdmr14392097wrr.2.1680005836346;
        Tue, 28 Mar 2023 05:17:16 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id c9-20020a5d4cc9000000b002d21379bcabsm27503187wrt.110.2023.03.28.05.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 05:17:16 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwmon: (pmbus/core): Notify regulator events
Date:   Tue, 28 Mar 2023 14:17:11 +0200
Message-Id: <20230328121712.4057359-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230328121712.4057359-1-Naresh.Solanki@9elements.com>
References: <20230328121712.4057359-1-Naresh.Solanki@9elements.com>
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
index 18a3f3b1ec07..6475b2fe489f 100644
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

