Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5F3C001E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 13:51:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235878AbjGNNvw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235880AbjGNNvr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 09:51:47 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24FE3A81
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:38 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9924ac01f98so254437666b.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689342697; x=1691934697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHXEv10hBdP+g4q7rSvrgYwQ+atbmqNIuqpCrMhKX+g=;
        b=c1Vs56fgyh1Kds4GklD5N3Wl7ycrlA+IAH1+0fmHoRAFn7X8ddeYo59DBANRqjH6Im
         Ebjq/LvLnSBL14jcKcWy3K/oAOGR8NIPK79Z86zyCq5ecXsgBGAHAhpZXpMi9AhilcBZ
         uX/xQl3TgBChomZgSaiLt8Lel2vvEwOQb/qYDhfQTKMfiEhYg7t5nwkbUtVh2r7UBbd9
         YLYCbkwJXy5xyl6RlP4icGKqb4+noTFoSVEQXXan7tldmouKYx1Iyjmm3mG0c4iR3/ZE
         UMmXgdJg7yg9gnjWspAYLSg1fW/f0TcOlBSQg/kRsP8XumslV5FGihI+p8hIgHMKYQg4
         hENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342697; x=1691934697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHXEv10hBdP+g4q7rSvrgYwQ+atbmqNIuqpCrMhKX+g=;
        b=V1gMwzom+vcjRN7paws4lGfPMPI5Nyvcg20xRJwVqFc18NQZ9P2jXer/WihkDWmxH6
         jzUTokQ5jeQyljVpiXpCk5uUpNcNDn6l8qpUk5kPICdLYipXkT3FDE0WQ2qFqnbolVGP
         bbTs6xW1WN0YKtdbcuc/sRU/6xtPont8KJQrkL0hlWEM+1hRFzXspZDzchNBry1E4PiY
         YoJyPU0SoBwByUPSrTDAQ/K6l5dan5jRa7BxoRpvDacVcYx4MmJwvqn4f3hPU0LEuoom
         K/IyPLtq3mL/4RDKr4ulT+A14hSvX7tU9qw9XZ92eOimIjhwMx/t7o6XQvf3v2/tQHF1
         eR5w==
X-Gm-Message-State: ABy/qLYMqJl9OHFGUdUQK+IMVccmMbSao7i6KANZOqyQj974pWfLv3tg
        lCOj++hd7szgCgsbFtQOn8oEUQ==
X-Google-Smtp-Source: APBJJlEdHgcVQIaCpSmrBRIjYGzE2AT6yKq4E2S2S2aosOymNYV67To3p+ioZhjomR7A8vl4poXm3w==
X-Received: by 2002:a17:906:74d1:b0:993:e752:1a6a with SMTP id z17-20020a17090674d100b00993e7521a6amr4464650ejl.21.1689342697333;
        Fri, 14 Jul 2023 06:51:37 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h21-20020a170906261500b0099236e3f270sm5405991ejc.58.2023.07.14.06.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:51:36 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v2 7/8] hwmon: (pmbus/mp2975) Add regulator support
Date:   Fri, 14 Jul 2023 15:51:15 +0200
Message-ID: <20230714135124.2645339-7-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
References: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add support to expose the PMBUS regulator.

Tested on MP2973 and MP2971.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V2:
- Use IS_ENABLED for configs in if statement.
---
 drivers/hwmon/pmbus/Kconfig  |  7 +++++++
 drivers/hwmon/pmbus/mp2975.c | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 270b6336b76d..b4e93bd5835e 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -317,6 +317,13 @@ config SENSORS_MP2975
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2975.
 
+config SENSORS_MP2975_REGULATOR
+	depends on SENSORS_MP2975 && REGULATOR
+	bool "Regulator support for MPS MP2975"
+	help
+	  If you say yes here you get regulator support for MPS MP2975
+	  Dual Loop Digital Multi-Phase Controller.
+
 config SENSORS_MP5023
 	tristate "MPS MP5023"
 	help
diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 4d72ed18cc8c..7684f8667657 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -115,6 +115,11 @@ static const struct i2c_device_id mp2975_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, mp2975_id);
 
+static const struct regulator_desc __maybe_unused mp2975_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+	PMBUS_REGULATOR("vout", 1),
+};
+
 #define to_mp2975_data(x)  container_of(x, struct mp2975_data, info)
 
 static int
@@ -806,6 +811,10 @@ static struct pmbus_driver_info mp2975_info = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
 		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT | PMBUS_PHASE_VIRTUAL,
 	.read_word_data = mp2975_read_word_data,
+#if IS_ENABLED(CONFIG_SENSORS_MP2975_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = mp2975_reg_desc,
+#endif
 };
 
 static struct pmbus_driver_info mp2973_info = {
@@ -823,6 +832,10 @@ static struct pmbus_driver_info mp2973_info = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
 		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
 	.read_word_data = mp2973_read_word_data,
+#if IS_ENABLED(CONFIG_SENSORS_MP2975_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = mp2975_reg_desc,
+#endif
 };
 
 static int mp2975_probe(struct i2c_client *client)
@@ -861,6 +874,8 @@ static int mp2975_probe(struct i2c_client *client)
 		data->info.pages = MP2975_PAGE_NUM;
 		data->info.phases[1] = ret;
 		data->info.func[1] = MP2975_RAIL2_FUNC;
+		if (IS_ENABLED(CONFIG_SENSORS_MP2975_REGULATOR))
+			data->info.num_regulators = MP2975_PAGE_NUM;
 	}
 
 	if (data->chip_id == mp2975) {
-- 
2.41.0

