Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394DFC4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 May 2022 06:43:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbiEIGqa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 May 2022 02:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbiEIGec (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 May 2022 02:34:32 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B3D9FDE
        for <linux-hwmon@vger.kernel.org>; Sun,  8 May 2022 23:30:32 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id u3so17955591wrg.3
        for <linux-hwmon@vger.kernel.org>; Sun, 08 May 2022 23:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vVvWe9CoZBTdNyE3eHbun0xPih5mbPe7IlFMtVIhZ0k=;
        b=MOLzcEDMe1y6FCozVl6TnJUpB7oHIbvublW8A/Zk1jKtktM7sLQOm1XJryDMd5yJq2
         OSZjwQvAE3HP8ZH932R5lyVc40cqAKCFi2+B+KtNA8Uvs3NNKJgQCZ76onjK9o49TiBr
         /sKg60y+VDkNFwE7toeDnxqyAzQcEDtkggjj1EM8Lft6ING7Du+Wkg13C7vnE+kH8zHj
         NsmzzMr0gZYau6ggCmTLKnAqUPHktuThv0HBrojoC8JBvsd9u8kOY6oIJQWQojEF2vnJ
         BM4XNoIwyNwgJTKJEPSqbxujkRwTx/UZwpO+uw/txKREWt/gafE2gYkg5jwCpxFZCCjG
         xA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vVvWe9CoZBTdNyE3eHbun0xPih5mbPe7IlFMtVIhZ0k=;
        b=Lcq48u2muoifUvlz/3n95SeBrxdaDcblMQi2UsfOBXFRkV/5VfJyZ+ZA4ZCAJa5VHf
         JkWE2dP74aitBFZPJXQTsj3kXdbwxr8WaI5jYkAS/wSMj7a4hRKJSYj4Ziux/PWV0UJO
         7pAxpV9nvAfh6hijZvPHMXDCzRIJStLH4SDWMfwvtgNXK5dxO1btsIJq1el+gPGNKhMD
         ZJkoiu/6EfltgbVkSqpheIz7R7tyEhIzbbwbKfY9ZstIWvy5ulSjBHKByEDmAVuv6yYT
         Epo6SrVKYv0bsmsl+gjbAuFMabJoEc/TPit6BYpewiKkVwah0mus3qY/+ZTMu4QKQl89
         1jjw==
X-Gm-Message-State: AOAM5321hutayqTbpYYJqMJXM8kVk9Q6OEK7DnCXj5CrEQNpZhawEzkX
        FX7WD2PzlR/UISPaqoKs8Sm1Rg==
X-Google-Smtp-Source: ABdhPJyKEzM+oTZA8CGO87qivdU2FEjZvFn+JGied66/bemneEPFkFYCPT1OT6Z0Ic9e8Jtdf/+yJA==
X-Received: by 2002:a05:6000:1d98:b0:20c:c29d:76db with SMTP id bk24-20020a0560001d9800b0020cc29d76dbmr4585218wrb.710.1652077817942;
        Sun, 08 May 2022 23:30:17 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z18-20020adff1d2000000b0020c77f36b13sm10074833wro.100.2022.05.08.23.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 23:30:17 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 1/2] hwmon: acpi_power_meter: fix style issue
Date:   Mon,  9 May 2022 06:30:09 +0000
Message-Id: <20220509063010.3878134-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509063010.3878134-1-clabbe@baylibre.com>
References: <20220509063010.3878134-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix style issues found by checkpatch.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/hwmon/acpi_power_meter.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index c405a5869581..d2545a1be9fc 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -481,7 +481,7 @@ static struct sensor_template meter_attrs[] = {
 	RO_SENSOR_TEMPLATE("power1_average_interval_max", show_val, 1),
 	RO_SENSOR_TEMPLATE("power1_is_battery", show_val, 5),
 	RW_SENSOR_TEMPLATE(POWER_AVG_INTERVAL_NAME, show_avg_interval,
-		set_avg_interval, 0),
+			   set_avg_interval, 0),
 	{},
 };
 
@@ -530,6 +530,7 @@ static void remove_domain_devices(struct acpi_power_meter_resource *resource)
 
 	for (i = 0; i < resource->num_domain_devices; i++) {
 		struct acpi_device *obj = resource->domain_devices[i];
+
 		if (!obj)
 			continue;
 
@@ -580,7 +581,7 @@ static int read_domain_devices(struct acpi_power_meter_resource *resource)
 	}
 
 	resource->holders_dir = kobject_create_and_add("measures",
-					&resource->acpi_dev->dev.kobj);
+						       &resource->acpi_dev->dev.kobj);
 	if (!resource->holders_dir) {
 		res = -ENOMEM;
 		goto exit_free;
@@ -590,7 +591,7 @@ static int read_domain_devices(struct acpi_power_meter_resource *resource)
 
 	for (i = 0; i < pss->package.count; i++) {
 		struct acpi_device *obj;
-		union acpi_object *element = &(pss->package.elements[i]);
+		union acpi_object *element = &pss->package.elements[i];
 
 		/* Refuse non-references */
 		if (element->type != ACPI_TYPE_LOCAL_REFERENCE)
@@ -603,7 +604,7 @@ static int read_domain_devices(struct acpi_power_meter_resource *resource)
 			continue;
 
 		res = sysfs_create_link(resource->holders_dir, &obj->dev.kobj,
-				      kobject_name(&obj->dev.kobj));
+					kobject_name(&obj->dev.kobj));
 		if (res) {
 			acpi_dev_put(obj);
 			resource->domain_devices[i] = NULL;
@@ -788,7 +789,7 @@ static int read_capabilities(struct acpi_power_meter_resource *resource)
 	str = &resource->model_number;
 
 	for (i = 11; i < 14; i++) {
-		union acpi_object *element = &(pss->package.elements[i]);
+		union acpi_object *element = &pss->package.elements[i];
 
 		if (element->type != ACPI_TYPE_STRING) {
 			res = -EINVAL;
@@ -868,8 +869,7 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
-	resource = kzalloc(sizeof(struct acpi_power_meter_resource),
-			   GFP_KERNEL);
+	resource = kzalloc(sizeof(*resource), GFP_KERNEL);
 	if (!resource)
 		return -ENOMEM;
 
@@ -884,7 +884,8 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	if (res)
 		goto exit_free;
 
-	resource->trip[0] = resource->trip[1] = -1;
+	resource->trip[0] = -1;
+	resource->trip[1] = -1;
 
 	res = setup_attrs(resource);
 	if (res)
-- 
2.35.1

