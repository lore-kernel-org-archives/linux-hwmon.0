Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A5CC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 14:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239341AbhLMO2s (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 09:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239376AbhLMO2q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 09:28:46 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5712C06173F
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 06:28:45 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id y13so52303144edd.13
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 06:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ygpc4SFsAp5XZZ3iqS6qiq3RqIajhWzXZFI9KjKMIs8=;
        b=pki0FSn5NIeQ8IurjAvXJUwgSWKeR+aUphSXEc42CO9efL3P9ensZqPGO9VNdxIf1k
         8bZxQUOh8wbQWwplZpjU5M7dOoEirtXlImT37HXKn5pfE8b9ArfSMbU8dNb8OvYP182O
         ZkdVU3gt84UOXXSVM8pMYdTQ/GPlZ5xvMDQnox9fIUD7mpWd78wkFV3efI3GgU+8KDu8
         lASh5+szBSd7VF0NE8rqMuHb9vTYRtoT07lqyuywsbhjaOVOXw01Pxia9OAdre8Blzhk
         K3KPpjjzuLxIqfP24eykUToctuOpBxqY9RNIY7f6XusSZa2OIYGCkGLsNLCW0wEvXben
         2m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ygpc4SFsAp5XZZ3iqS6qiq3RqIajhWzXZFI9KjKMIs8=;
        b=jzhl0CImZQfePyDIIMOjQ50IqBjetivTP05gZaZEsu5eX47sG0uD9y/iX1yTtxu/BU
         6wAulg2tuKaDJ6HVeS/C7zqimuP6RQiFky81r1fGJvFH6xM1oFnDjSjCrelOZuHfhfcz
         mRPLSZ0S92/L7wbqjk2ntKAzRUgCei1NfrnhLmiEn8Vl3eIaxynSJtS5waQFIH5ZiobF
         XeVC1qhswN8VuK/ZpgvPg1ZMfCqzUcPVHg/gNjXVvnfPixjPGpYvqetR5Gcd4C1VnzcZ
         gt9T/Q+E4kCx7Fsj9FnSqLDbnyHTMoscVaPDhJtXccRy5mAY0WeM3XYfHz7zQsU4Z8Dk
         +pqw==
X-Gm-Message-State: AOAM533D4H4gxPrzrwwokVWVjCFtKsJvBuBEL2Z7T6Ss2nUs/VzTwzCq
        Vc4iLgunr7yTkLMdqkL8GFKJOaxlG3MRWWqI
X-Google-Smtp-Source: ABdhPJxGQpxqVPCzLf/C/scPYs2YXv56OSpOyFkxjTuxYqv1i28rSX/+BYwRUd8L400mlcxWsRiX0g==
X-Received: by 2002:aa7:d652:: with SMTP id v18mr64359895edr.68.1639405724318;
        Mon, 13 Dec 2021 06:28:44 -0800 (PST)
Received: from t41sarthur.home (ip-193-121-10-250.dsl.scarlet.be. [193.121.10.250])
        by smtp.gmail.com with ESMTPSA id kx3sm5996414ejc.112.2021.12.13.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:28:44 -0800 (PST)
From:   arthur@aheymans.xyz
X-Google-Original-From: arthur.heymans@9elements.com
To:     linux-hwmon@vger.kernel.org
Cc:     patrick.rudolph@9elements.com
Subject: [PATCH v2 3/3] ir38064: Expose a regulator
Date:   Mon, 13 Dec 2021 15:28:14 +0100
Message-Id: <20211213142814.264802-4-arthur.heymans@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213142814.264802-1-arthur.heymans@9elements.com>
References: <20211213142814.264802-1-arthur.heymans@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/hwmon/pmbus/Kconfig   |  6 ++++++
 drivers/hwmon/pmbus/ir38064.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

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
index 4211de048069..07bdbb16f216 100644
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
@@ -34,6 +41,10 @@ static struct pmbus_driver_info ir38064_info = {
 	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
 	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
 	    | PMBUS_HAVE_POUT,
+#if IS_ENABLED(CONFIG_SENSORS_IR38064_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = ir38064_reg_desc,
+#endif
 };
 
 static int ir38064_probe(struct i2c_client *client)
-- 
2.33.1

