Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF5DC4321E
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 19:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbiLETZU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 14:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbiLETYl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 14:24:41 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2CD25C5D
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 11:19:50 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id bj12so821649ejb.13
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 11:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmisXUUTcc/2wLYtw2JwGMf2iLn2WSeYXglBIEeZoho=;
        b=Y4YvMsNmXqwQtQ6fylpBqSvy3d7S0QQKyzC+msMpaJ9yJ2fXrCtlT8C6h1WiGav9r4
         TDZ3jUw0Gsmhvma6muAvIM/saALuR5+52UawobQWBDvSS5Ew2WxebwU/YuO/PrsvpTMk
         gfwlDJ0LQvEQkbTqdoiWwQUHgkra8WZWKwtSKF9bYjQNUshjJi73kqWZFv4Nz/hmJrz2
         98myjXjxobhazglF9IJyWQlrhaaZpKQZ75vM0vyHYpdAAAEUdsmMn7UI7BMRAGFewOtk
         TiRCnmEHDvo5dJ6kMIdW6pELmO5XoPZeiaCy0qVeG2Kr+Myn85Fm7lK7tBGphWc17N8v
         DdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmisXUUTcc/2wLYtw2JwGMf2iLn2WSeYXglBIEeZoho=;
        b=UdXKU3duHwWsGuTzxNEM42bXDNOGWq77PrIqTHdWQdI2v44JL5JHHUE4EGjrH/dHFN
         SOy+0wTVHTqiKdd3CsqKsUakxxvqJBQHbj0uooXIrDYEE8WIse/OPfUPtRaC0lCnCpDj
         8TQKNfetI/NcoGHAAefJoLqSZ4jE/0iwrSymOAMmQlo+xgabTpM8prUd8srsDBisjvcv
         jxo+S8ZIN2jYZn96L+1Ad0DVnaSsy8g/L5V6TA4rRYlKvbttDcNKPQ0UugIU/brvZJvA
         /J4GeHcCZdb5gvZswwWyB68Nyo64NJQtjd1azhI3gWJcRI8LnxHjpnpYdfkU8CvmAm58
         HV3A==
X-Gm-Message-State: ANoB5plEJ7q9ImAvT3I6Xvb8+eW5wf4V6EOSmPyFuDoq7ZSbXOxjBnOt
        LCZGHEzdtWSe2jLEOu/I/xojuw==
X-Google-Smtp-Source: AA0mqf62EG0f6npo76wD2RQldxw2ZuSO3bPY8/OKQ9K9hhSaGTbejpbzJ3Z1YlSk4OWCtLd/Gmdfpg==
X-Received: by 2002:a17:906:5156:b0:7c0:efb6:8744 with SMTP id jr22-20020a170906515600b007c0efb68744mr5950005ejc.267.1670267990223;
        Mon, 05 Dec 2022 11:19:50 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id t16-20020aa7db10000000b0045cf4f72b04sm112739eds.94.2022.12.05.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 11:19:50 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v6 5/5] hwmon: (pmbus/core): Notify regulator events
Date:   Mon,  5 Dec 2022 20:19:16 +0100
Message-Id: <20221205191917.2614603-5-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221205191917.2614603-1-Naresh.Solanki@9elements.com>
References: <20221205191917.2614603-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Notify regulator events in PMBus irq handler.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 22176f266891..c8fae2a9502d 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3154,7 +3154,7 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 {
 	struct pmbus_data *data = pdata;
 	struct i2c_client *client = to_i2c_client(data->dev);
-	int i, status, ret, event;
+	int i, j, status, ret, event;
 
 	for (i = 0; i < data->info->pages; i++) {
 
@@ -3163,6 +3163,15 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 		if (ret)
 			return ret;
 
+		if (event) {
+			for (j = 0; j < data->info->num_regulators; j++) {
+				if (i == rdev_get_id(data->rdevs[i])) {
+					regulator_notifier_call_chain(data->rdevs[i], event, NULL);
+					ret = IRQ_HANDLED;
+				}
+			}
+		}
+
 		mutex_lock(&data->update_lock);
 		status = pmbus_read_status_word(client, i);
 		if (status < 0) {
-- 
2.37.3

