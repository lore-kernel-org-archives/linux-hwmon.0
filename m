Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0CBC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 10:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242010AbhLMKhm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 05:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238702AbhLMKh3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 05:37:29 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DB8C042DC3
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 02:19:25 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id z5so51040658edd.3
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 02:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Quf32curq3fCK4wUs8ZsRVMFgnajGKB4rTAD0h3/SZU=;
        b=g7jEdFe0w3pDrQzagWVIffRpAhYrz/6ZuWaLSndgTE/Q+32ItVQESzcUJgtlo1BfzD
         ogPdjvYhErRqlE6WSRXq3sOoTvR4Do9Ag352ECaU5dyE0WcuYILmjGySqTICY3J4gcGB
         JCL0hgBEg2I7Zibwg5WJpV8kYcd1M3jRzJy8zK7Inf7HJkkHOgtukKnJUHZ7SrCF8MCO
         /B7HTEj1BLRj7/BpRX6T9ZC2yde8SYG+2tIvH96YETxnawN9Qn7/N3fPDxr9IBNN/70q
         MLZREGYLjn+xldrv9QfzkD7OmIVGtvTFLYJPQjnSSWh5XDB9YQVltQRK5rqVlthngi2h
         7tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Quf32curq3fCK4wUs8ZsRVMFgnajGKB4rTAD0h3/SZU=;
        b=pqiez+hfeax2FRvowcpqMoc67KkEAgdYI1yzqafZEs96lYst7yHP53s1F+LkP1QpyC
         glNOYY2CWIXZ5kU0MbuOSoCYdg3MY4QDsR/y5P3c3iOhQaRi7w4nv3ihoqINA1Kd/rWw
         rQTnWgfgCXIsEGFXZYJXQb2+LoGyu5rZEVQvU/JoVh/dij74sNq5Rmgx9z7Bu3Pec8LD
         DRZe9BXs0BFiDDUp6losjUdMjJ4MGWmYrODfgIy47rIOf37Fl93kxeTYckXo75kn2/cU
         yEnFJIfxA/UnSKLasrCX2OgsVNVHm/FIbfxRJEnLRAMqnW2t63M9SSn/e/XL+42b8/uU
         vUiQ==
X-Gm-Message-State: AOAM532pnsaSIa5NoR+FebtkG59TWgqmPI+mTsfEKkOBZwCouUCvj30H
        0NcQooG8HAbCwDxYQNZhY8r9/8FG9GGCoFhn
X-Google-Smtp-Source: ABdhPJwWiPlbfpy8uIU2//ThyzkOTigWDAxxBujqL/JoV1vg+tzjYvxvH+08eMuEYnykoNfzBQcRuw==
X-Received: by 2002:a17:906:f44:: with SMTP id h4mr45166162ejj.113.1639390764029;
        Mon, 13 Dec 2021 02:19:24 -0800 (PST)
Received: from t41sarthur.home (ip-193-121-10-250.dsl.scarlet.be. [193.121.10.250])
        by smtp.gmail.com with ESMTPSA id q17sm6143284edd.10.2021.12.13.02.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 02:19:23 -0800 (PST)
From:   arthur@aheymans.xyz
X-Google-Original-From: arthur.heymans@9elements.com
To:     linux-hwmon@vger.kernel.org
Cc:     patrick.rudolph@9elements.com
Subject: [PATCH 3/3] ir38064: Expose a regulator
Date:   Mon, 13 Dec 2021 11:19:02 +0100
Message-Id: <20211213101902.146179-3-arthur.heymans@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213101902.146179-1-arthur.heymans@9elements.com>
References: <20211213101902.146179-1-arthur.heymans@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/hwmon/pmbus/Kconfig   |  6 ++++++
 drivers/hwmon/pmbus/ir38064.c | 17 +++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index d2b178a902f0..fdfe1cd54799 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -131,6 +131,12 @@ config SENSORS_IR38064
 	  This driver can also be built as a module. If so, the module will
 	  be called ir38064.
 
+config SENSORS_IR38064_REGULATOR
+	bool "Regulator support for IR38064 and compatibles"
+	depends on SENSORS_IR38064 && REGULATOR
+	help
+	  Uses the IR38064 or compatible as regulator.
+
 config SENSORS_IRPS5401
 	tristate "Infineon IRPS5401"
 	help
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 429577b027b4..61cbe5063688 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -17,8 +17,15 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/regulator/driver.h>
 #include "pmbus.h"
 
+#if IS_ENABLED(CONFIG_SENSORS_IR38064_REGULATOR)
+static const struct regulator_desc ir38064_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+};
+#endif /* CONFIG_SENSORS_IR38064_REGULATOR */
+
 static struct pmbus_driver_info ir38064_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -33,9 +40,19 @@ static struct pmbus_driver_info ir38064_info = {
 	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
 	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
 	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+#if IS_ENABLED(CONFIG_SENSORS_IR38064_REGULATOR)
+#ifdef PMBUS_HAVE_VOUT_COMMAND
+		| PMBUS_HAVE_VOUT_COMMAND
+#endif
+#endif
 	    | PMBUS_HAVE_POUT,
+#if IS_ENABLED(CONFIG_SENSORS_IR38064_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = ir38064_reg_desc,
+#endif
 };
 
+
 static int ir38064_probe(struct i2c_client *client)
 {
 	return pmbus_do_probe(client, &ir38064_info);
-- 
2.33.1

