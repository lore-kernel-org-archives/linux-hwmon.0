Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F691C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 14:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239310AbhLMO2l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 09:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239308AbhLMO2l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 09:28:41 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA1BC061751
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 06:28:40 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id z5so53342341edd.3
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eV+0xC7dBgPUXkogLAhA4k3lrBJ6JeRRZ8gm7EyYYoI=;
        b=vYJmceBVBtnAXhL9mOTDnFs9/PZGzLk/xTNVCG95FzsCbhfmFwdYOI5lvDlE1RWS93
         gFKBPpe89veeR8EXhUxL+gOktp9ebmjItquEcNaRMhuNvsOJOPUIJZZqOuW7jNUYqCaL
         2nCDsyOqCsgefxy+8OiqzSlqa+IUb9/6oL7LqO14S8zVmXG+M/8g1ltlrEuoopgldlYK
         pVOXjgLyQIBP4Tc0dwtG+r2Z9d0VrpBP9Xo14GEfrs1HAlC2hJf367nOPy0DhrlGjC1r
         1djhO7+M4pXOvba5ag7pRg94uzUS9HQGqOcuZZ+dp+d1/wkgxwvDPtQTZYC/qQTetCNT
         i46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eV+0xC7dBgPUXkogLAhA4k3lrBJ6JeRRZ8gm7EyYYoI=;
        b=tTzdLMHGH4A++KvsdLwVT50wan13hkSmnH8DPCQDmkjUfK1+KXuETPBbD1/pkD/dOm
         AWYnKqsepQu/WWk6ceOKIEU2TlUPmYmMNOxlnsnqlKmOYlSfGq07vNwo0bf5ozBEWvSc
         t43+nb55j8X8bpfgw0LpqZ+TbHDYD4uCUWRXpxr4F5dTr+rlTdcXTTuAWOGYQmSTxjQw
         +a8QwAVJixL7/0YGkHEwR2O3kBCwg069x89K9qVzMgmt8ZtIe0zQ4l0e/e9HMbG/Jb0x
         pfpSveRnbLzUW1iYe0Uebl8rzmtxX0OjGm7Pm3SToqxiCZu98e4ky2sFyIGM8ehK//6o
         Ra6A==
X-Gm-Message-State: AOAM5301LLd6y1judaD1HUuarfZPhNeHHmR3nQxQpC0p6I13y/3vDK1W
        KyqIDJTsf64j7K9Cq2ruRnpJaZMs0xHfRjwM
X-Google-Smtp-Source: ABdhPJxDAV4pWoxP1JkM+P/lTJLn8GM9Kc+DNzlRWqivxsgeWJ9D/Yr5vKV4pmBwGHMic7jkzuOuUA==
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr66148763edu.237.1639405717232;
        Mon, 13 Dec 2021 06:28:37 -0800 (PST)
Received: from t41sarthur.home (ip-193-121-10-250.dsl.scarlet.be. [193.121.10.250])
        by smtp.gmail.com with ESMTPSA id kx3sm5996414ejc.112.2021.12.13.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:28:37 -0800 (PST)
From:   arthur@aheymans.xyz
X-Google-Original-From: arthur.heymans@9elements.com
To:     linux-hwmon@vger.kernel.org
Cc:     patrick.rudolph@9elements.com,
        Arthur Heymans <arthur.heymans@9elements.com>
Subject: [PATCH v2 1/3] hwmon/ir38064: Add support for IR38060, IR38164 IR38263
Date:   Mon, 13 Dec 2021 15:28:12 +0100
Message-Id: <20211213142814.264802-2-arthur.heymans@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213142814.264802-1-arthur.heymans@9elements.com>
References: <20211213142814.264802-1-arthur.heymans@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The IR38060, IR38164 and IR38263 can be supported using this driver.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Arthur Heymans <arthur.heymans@9elements.com>
---
 .../devicetree/bindings/trivial-devices.yaml  |  6 ++++
 Documentation/hwmon/ir38064.rst               | 28 +++++++++++++++++--
 drivers/hwmon/pmbus/Kconfig                   |  4 +--
 drivers/hwmon/pmbus/ir38064.c                 |  5 +++-
 4 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 791079021f1b..38c3264b3dcb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -121,8 +121,14 @@ properties:
           - ibm,cffps2
             # Infineon IR36021 digital POL buck controller
           - infineon,ir36021
+          # Infineon IR38060 Voltage Regulator
+          - infineon,ir38060
             # Infineon IR38064 Voltage Regulator
           - infineon,ir38064
+          # Infineon IR38164 Voltage Regulator
+          - infineon,ir38164
+          # Infineon IR38263 Voltage Regulator
+          - infineon,ir38263
             # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
           - infineon,slb9635tt
             # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
diff --git a/Documentation/hwmon/ir38064.rst b/Documentation/hwmon/ir38064.rst
index c455d755a267..e1148f21ea2a 100644
--- a/Documentation/hwmon/ir38064.rst
+++ b/Documentation/hwmon/ir38064.rst
@@ -3,14 +3,38 @@ Kernel driver ir38064
 
 Supported chips:
 
+  * Infineon IR38060
+
+    Prefix: 'IR38060'
+    Addresses scanned: -
+
+    Datasheet: Publicly available at the Infineon website
+      https://www.infineon.com/dgdl/Infineon-IR38060M-DS-v03_16-EN.pdf?fileId=5546d4625c167129015c3291ea9a4cee
+
   * Infineon IR38064
 
     Prefix: 'ir38064'
     Addresses scanned: -
 
-    Datasheet: Publicly available at the Infineon webiste
+    Datasheet: Publicly available at the Infineon website
       https://www.infineon.com/dgdl/Infineon-IR38064MTRPBF-DS-v03_07-EN.pdf?fileId=5546d462584d1d4a0158db0d9efb67ca
 
+  * Infineon IR38164
+
+    Prefix: 'ir38164'
+    Addresses scanned: -
+
+    Datasheet: Publicly available at the Infineon website
+      https://www.infineon.com/dgdl/Infineon-IR38164M-DS-v02_02-EN.pdf?fileId=5546d462636cc8fb01640046efea1248
+
+  * Infineon ir38263
+
+    Prefix: 'ir38263'
+    Addresses scanned: -
+
+    Datasheet:  Publicly available at the Infineon website
+      https://www.infineon.com/dgdl/Infineon-IR38263M-DataSheet-v03_05-EN.pdf?fileId=5546d4625b62cd8a015bcf81f90a6e52
+
 Authors:
       - Maxim Sloyko <maxims@google.com>
       - Patrick Venture <venture@google.com>
@@ -18,7 +42,7 @@ Authors:
 Description
 -----------
 
-IR38064 is a Single-input Voltage, Synchronous Buck Regulator, DC-DC Converter.
+IR38x6x are a Single-input Voltage, Synchronous Buck Regulator, DC-DC Converter.
 
 Usage Notes
 -----------
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ffb609cee3a4..d2b178a902f0 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -123,10 +123,10 @@ config SENSORS_IR36021
 	  be called ir36021.
 
 config SENSORS_IR38064
-	tristate "Infineon IR38064"
+	tristate "Infineon IR38064 and compatibles"
 	help
 	  If you say yes here you get hardware monitoring support for Infineon
-	  IR38064.
+	  IR38060, IR38064, IR38164 and IR38263.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called ir38064.
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 1fb7f1248639..4e91d3e54a4a 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -41,7 +41,10 @@ static int ir38064_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ir38064_id[] = {
+	{"ir38060", 0},
 	{"ir38064", 0},
+	{"ir38164", 0},
+	{"ir38263", 0},
 	{}
 };
 
@@ -59,6 +62,6 @@ static struct i2c_driver ir38064_driver = {
 module_i2c_driver(ir38064_driver);
 
 MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
-MODULE_DESCRIPTION("PMBus driver for Infineon IR38064");
+MODULE_DESCRIPTION("PMBus driver for Infineon IR38064 and comaptible chips");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(PMBUS);
-- 
2.33.1

