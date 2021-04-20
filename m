Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726FEC433B4
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 06:19:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A6F8608FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 06:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhDTGTg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Apr 2021 02:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhDTGTg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Apr 2021 02:19:36 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A892AC06174A
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Apr 2021 23:19:04 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id v6so10120711oiv.3
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Apr 2021 23:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7t/pmHpGCYV7roLy2oPNna7D4LYIm6zD+rQ1W8126rg=;
        b=bVqOZrRwAhBpYcKsGtuLTfOUnygehdRQKj+1a9A4d9oqKAYeYcAKaPRmcgAFHwX4vW
         VsClqGiEvenkgrRQVlNxKQIRe9q3+L/++Wy40UGXzI5aRI5ZSELVWWoIWpvyKJuQawSq
         QmjGsYrMYvMefoTbpyVTk/wB3xhNrzkFT5UFnxRTwaMGThU5JN47Z5Nvzwy5tiHBXJLb
         y02haekTZegahvb45LzRhnpIxprKq8+AKhx/Yay0oNyTL6imCIiVceA4LshxwC3MSTIJ
         EVgQN46gpeyyCRL9NXq09tSMydNxi3ePiVRpbmfdNuSL8xRamVMYxYFcW0ZWlwHQZ+eK
         FkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=7t/pmHpGCYV7roLy2oPNna7D4LYIm6zD+rQ1W8126rg=;
        b=ajXvA26/AtBum/iIITZxy47rUMP2+6ath/et3mEVOEMShuZbrdffr0Q1cKO/krFZwe
         XuvTN06Fi1MhMJyhWvtwTejqgk0B/EExdE735uRVjgAcuZusEg6Pua7dhLkhm4fU9E4s
         2cXHRvmvvnc/UnsDO+zaQmgtQnjw7K/kdEkCJBOn9i7pcl1TmOs35ZX5PNfqYfETY+CF
         xFUozD6pfkrap3gN+nhSeamm0RLuIKgaH9BXd0YUlaFudbaNejfNkqxqnng7NVq1f//x
         gAFPKhkP3Xy4jP3AEVgHlonZJLO4ES87MrkVM/vEIdk5DPuDMFuqVfdRi1oRvo908ICB
         eYPw==
X-Gm-Message-State: AOAM533Xym1wUBzlILSh0CZTKQirOFdca7IAxaTEXkiUAcwpLc2rZ88i
        Eqg+as0+GGt4al5KdlNN4aiLI0bSjSk=
X-Google-Smtp-Source: ABdhPJzL81EBCaPCZQIAnBM7mPyMsrs9Up+VHlGmmWb5bVd0JJ1KpiFleJn1/tn0JptTBQLqKRsmMw==
X-Received: by 2002:aca:f156:: with SMTP id p83mr1941345oih.91.1618899543376;
        Mon, 19 Apr 2021 23:19:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm4005023otr.28.2021.04.19.23.19.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 23:19:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] hwmon: (pmbus) Introduce PMBUS symbol namespace
Date:   Mon, 19 Apr 2021 23:19:00 -0700
Message-Id: <20210420061900.196637-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Exported pmbus symbols are only supposed to be used from PMBus code.
Introduce PMBUS symbol namespace to prevent misuse from other code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Declare MODULE_IMPORT_NS(PMBUS) in drivers using the MBUS namespace
    exports.

 drivers/hwmon/pmbus/adm1266.c      |  1 +
 drivers/hwmon/pmbus/adm1275.c      |  1 +
 drivers/hwmon/pmbus/bel-pfe.c      |  1 +
 drivers/hwmon/pmbus/bpa-rs600.c    |  1 +
 drivers/hwmon/pmbus/fsp-3y.c       |  1 +
 drivers/hwmon/pmbus/ibm-cffps.c    |  1 +
 drivers/hwmon/pmbus/inspur-ipsps.c |  1 +
 drivers/hwmon/pmbus/ir35221.c      |  1 +
 drivers/hwmon/pmbus/ir36021.c      |  1 +
 drivers/hwmon/pmbus/ir38064.c      |  1 +
 drivers/hwmon/pmbus/irps5401.c     |  1 +
 drivers/hwmon/pmbus/isl68137.c     |  1 +
 drivers/hwmon/pmbus/lm25066.c      |  1 +
 drivers/hwmon/pmbus/ltc2978.c      |  1 +
 drivers/hwmon/pmbus/ltc3815.c      |  1 +
 drivers/hwmon/pmbus/max15301.c     |  1 +
 drivers/hwmon/pmbus/max16064.c     |  1 +
 drivers/hwmon/pmbus/max16601.c     |  1 +
 drivers/hwmon/pmbus/max20730.c     |  1 +
 drivers/hwmon/pmbus/max20751.c     |  1 +
 drivers/hwmon/pmbus/max31785.c     |  1 +
 drivers/hwmon/pmbus/max34440.c     |  1 +
 drivers/hwmon/pmbus/max8688.c      |  1 +
 drivers/hwmon/pmbus/mp2975.c       |  1 +
 drivers/hwmon/pmbus/pm6764tr.c     |  1 +
 drivers/hwmon/pmbus/pmbus.c        |  1 +
 drivers/hwmon/pmbus/pmbus_core.c   | 38 +++++++++++++++---------------
 drivers/hwmon/pmbus/pxe1610.c      |  1 +
 drivers/hwmon/pmbus/q54sj108a2.c   |  1 +
 drivers/hwmon/pmbus/stpddc60.c     |  1 +
 drivers/hwmon/pmbus/tps40422.c     |  1 +
 drivers/hwmon/pmbus/tps53679.c     |  1 +
 drivers/hwmon/pmbus/ucd9000.c      |  1 +
 drivers/hwmon/pmbus/ucd9200.c      |  1 +
 drivers/hwmon/pmbus/xdpe12284.c    |  1 +
 drivers/hwmon/pmbus/zl6100.c       |  1 +
 36 files changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 4d2e4ddcfbfd..ec5f932fc6f0 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -510,3 +510,4 @@ module_i2c_driver(adm1266_driver);
 MODULE_AUTHOR("Alexandru Tachici <alexandru.tachici@analog.com>");
 MODULE_DESCRIPTION("PMBus driver for Analog Devices ADM1266");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 38a6515b0763..980a3850b2f3 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -805,3 +805,4 @@ module_i2c_driver(adm1275_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Analog Devices ADM1275 and compatibles");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
index aed7542d7ce5..4100eefb7ac3 100644
--- a/drivers/hwmon/pmbus/bel-pfe.c
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -129,3 +129,4 @@ module_i2c_driver(pfe_pmbus_driver);
 MODULE_AUTHOR("Tao Ren <rentao.bupt@gmail.com>");
 MODULE_DESCRIPTION("PMBus driver for BEL PFE Family Power Supplies");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/bpa-rs600.c b/drivers/hwmon/pmbus/bpa-rs600.c
index c4ede68b3e26..f6558ee9dec3 100644
--- a/drivers/hwmon/pmbus/bpa-rs600.c
+++ b/drivers/hwmon/pmbus/bpa-rs600.c
@@ -170,3 +170,4 @@ module_i2c_driver(bpa_rs600_driver);
 MODULE_AUTHOR("Chris Packham");
 MODULE_DESCRIPTION("PMBus driver for BluTek BPA-RS600");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
index 284b73aaed46..b177987286ae 100644
--- a/drivers/hwmon/pmbus/fsp-3y.c
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -251,3 +251,4 @@ module_i2c_driver(fsp3y_driver);
 MODULE_AUTHOR("Václav Kubernát");
 MODULE_DESCRIPTION("PMBus driver for FSP/3Y-Power power supplies");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index ffde5aaa5036..5668d8305b78 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -625,3 +625,4 @@ module_i2c_driver(ibm_cffps_driver);
 MODULE_AUTHOR("Eddie James");
 MODULE_DESCRIPTION("PMBus driver for IBM Common Form Factor power supplies");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index bf593fd04a1a..0f614e8d95f6 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -224,3 +224,4 @@ module_i2c_driver(ipsps_driver);
 MODULE_AUTHOR("John Wang");
 MODULE_DESCRIPTION("PMBus driver for Inspur Power System power supplies");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index 3aebeb1443fd..a6cf98e49666 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -145,3 +145,4 @@ module_i2c_driver(ir35221_driver);
 MODULE_AUTHOR("Samuel Mendoza-Jonas <sam@mendozajonas.com");
 MODULE_DESCRIPTION("PMBus driver for IR35221");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/ir36021.c b/drivers/hwmon/pmbus/ir36021.c
index 4767e39cc965..4dca4767f571 100644
--- a/drivers/hwmon/pmbus/ir36021.c
+++ b/drivers/hwmon/pmbus/ir36021.c
@@ -77,3 +77,4 @@ module_i2c_driver(ir36021_driver);
 MODULE_AUTHOR("Chris Packham <chris.packham@alliedtelesis.co.nz>");
 MODULE_DESCRIPTION("PMBus driver for Infineon IR36021");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 46f17c4b4873..1fb7f1248639 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -61,3 +61,4 @@ module_i2c_driver(ir38064_driver);
 MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
 MODULE_DESCRIPTION("PMBus driver for Infineon IR38064");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/irps5401.c b/drivers/hwmon/pmbus/irps5401.c
index 93ef6d64a33a..de3449e4d77a 100644
--- a/drivers/hwmon/pmbus/irps5401.c
+++ b/drivers/hwmon/pmbus/irps5401.c
@@ -63,3 +63,4 @@ module_i2c_driver(irps5401_driver);
 MODULE_AUTHOR("Robert Hancock");
 MODULE_DESCRIPTION("PMBus driver for Infineon IRPS5401");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2bee930d3900..40597a9e799f 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -332,3 +332,4 @@ module_i2c_driver(isl68137_driver);
 MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
 MODULE_DESCRIPTION("PMBus driver for Renesas digital multiphase voltage regulators");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index e9a66fd9e144..d209e0afc2ca 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -511,3 +511,4 @@ module_i2c_driver(lm25066_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for LM25066 and compatible chips");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 7e53fa95b92d..0127273883f0 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -883,3 +883,4 @@ module_i2c_driver(ltc2978_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for LTC2978 and compatible chips");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/ltc3815.c b/drivers/hwmon/pmbus/ltc3815.c
index e45e14d26c9a..8e13a7ddcb42 100644
--- a/drivers/hwmon/pmbus/ltc3815.c
+++ b/drivers/hwmon/pmbus/ltc3815.c
@@ -208,3 +208,4 @@ module_i2c_driver(ltc3815_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for LTC3815");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index 727455e5740b..0b6f88428ea8 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -187,3 +187,4 @@ module_i2c_driver(max15301_driver);
 MODULE_AUTHOR("Erik Rosen <erik.rosen@metormote.com>");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX15301");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/max16064.c b/drivers/hwmon/pmbus/max16064.c
index d79add99083e..94f869039071 100644
--- a/drivers/hwmon/pmbus/max16064.c
+++ b/drivers/hwmon/pmbus/max16064.c
@@ -111,3 +111,4 @@ module_i2c_driver(max16064_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX16064");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 0d1204c2dd54..5a226a564776 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -359,3 +359,4 @@ module_i2c_driver(max16601_driver);
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX16601");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 9dd3dd79bc18..ba39f03c6374 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -785,3 +785,4 @@ module_i2c_driver(max20730_driver);
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX20710 / MAX20730 / MAX20734 / MAX20743");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/max20751.c b/drivers/hwmon/pmbus/max20751.c
index 9d42f82fdd99..2272dc8c2e38 100644
--- a/drivers/hwmon/pmbus/max20751.c
+++ b/drivers/hwmon/pmbus/max20751.c
@@ -51,3 +51,4 @@ module_i2c_driver(max20751_driver);
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX20751");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 17489abc49d5..95d79a64b483 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -403,3 +403,4 @@ module_i2c_driver(max31785_driver);
 MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
 MODULE_DESCRIPTION("PMBus driver for the Maxim MAX31785");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index dad66b3c0116..ea7609058a12 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -529,3 +529,4 @@ module_i2c_driver(max34440_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX34440/MAX34441");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/max8688.c b/drivers/hwmon/pmbus/max8688.c
index 329dc851fc59..5e66c28c0b71 100644
--- a/drivers/hwmon/pmbus/max8688.c
+++ b/drivers/hwmon/pmbus/max8688.c
@@ -191,3 +191,4 @@ module_i2c_driver(max8688_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX8688");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 60fbdb371332..eb94bd5f4e2a 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -766,3 +766,4 @@ module_i2c_driver(mp2975_driver);
 MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MP2975 device");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/pm6764tr.c b/drivers/hwmon/pmbus/pm6764tr.c
index d97cb6d6c87f..e0bbc8a30d21 100644
--- a/drivers/hwmon/pmbus/pm6764tr.c
+++ b/drivers/hwmon/pmbus/pm6764tr.c
@@ -73,3 +73,4 @@ module_i2c_driver(pm6764tr_driver);
 MODULE_AUTHOR("Charles Hsu");
 MODULE_DESCRIPTION("PMBus driver for  ST PM6764TR");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index a1b4260e75b2..618c377664c4 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -246,3 +246,4 @@ module_i2c_driver(pmbus_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("Generic PMBus driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index e9e6a47f3bf7..bbd745178147 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -139,7 +139,7 @@ void pmbus_clear_cache(struct i2c_client *client)
 	for (sensor = data->sensors; sensor; sensor = sensor->next)
 		sensor->data = -ENODATA;
 }
-EXPORT_SYMBOL_GPL(pmbus_clear_cache);
+EXPORT_SYMBOL_NS_GPL(pmbus_clear_cache, PMBUS);
 
 void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
 {
@@ -150,7 +150,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
 		if (sensor->reg == reg)
 			sensor->update = update;
 }
-EXPORT_SYMBOL_GPL(pmbus_set_update);
+EXPORT_SYMBOL_NS_GPL(pmbus_set_update, PMBUS);
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
 {
@@ -186,7 +186,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pmbus_set_page);
+EXPORT_SYMBOL_NS_GPL(pmbus_set_page, PMBUS);
 
 int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 {
@@ -198,7 +198,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	return i2c_smbus_write_byte(client, value);
 }
-EXPORT_SYMBOL_GPL(pmbus_write_byte);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_byte, PMBUS);
 
 /*
  * _pmbus_write_byte() is similar to pmbus_write_byte(), but checks if
@@ -229,7 +229,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	return i2c_smbus_write_word_data(client, reg, word);
 }
-EXPORT_SYMBOL_GPL(pmbus_write_word_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_word_data, PMBUS);
 
 
 static int pmbus_write_virt_reg(struct i2c_client *client, int page, int reg,
@@ -299,7 +299,7 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
 	return _pmbus_write_word_data(client, page,
 				      pmbus_fan_command_registers[id], command);
 }
-EXPORT_SYMBOL_GPL(pmbus_update_fan);
+EXPORT_SYMBOL_NS_GPL(pmbus_update_fan, PMBUS);
 
 int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 {
@@ -311,7 +311,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	return i2c_smbus_read_word_data(client, reg);
 }
-EXPORT_SYMBOL_GPL(pmbus_read_word_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_read_word_data, PMBUS);
 
 static int pmbus_read_virt_reg(struct i2c_client *client, int page, int reg)
 {
@@ -370,7 +370,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	return i2c_smbus_read_byte_data(client, reg);
 }
-EXPORT_SYMBOL_GPL(pmbus_read_byte_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_read_byte_data, PMBUS);
 
 int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 {
@@ -382,7 +382,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	return i2c_smbus_write_byte_data(client, reg, value);
 }
-EXPORT_SYMBOL_GPL(pmbus_write_byte_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_byte_data, PMBUS);
 
 int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 			   u8 mask, u8 value)
@@ -401,7 +401,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 
 	return rv;
 }
-EXPORT_SYMBOL_GPL(pmbus_update_byte_data);
+EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
 
 /*
  * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
@@ -474,14 +474,14 @@ int pmbus_get_fan_rate_device(struct i2c_client *client, int page, int id,
 {
 	return pmbus_get_fan_rate(client, page, id, mode, false);
 }
-EXPORT_SYMBOL_GPL(pmbus_get_fan_rate_device);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_fan_rate_device, PMBUS);
 
 int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
 			      enum pmbus_fan_mode mode)
 {
 	return pmbus_get_fan_rate(client, page, id, mode, true);
 }
-EXPORT_SYMBOL_GPL(pmbus_get_fan_rate_cached);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_fan_rate_cached, PMBUS);
 
 static void pmbus_clear_fault_page(struct i2c_client *client, int page)
 {
@@ -496,7 +496,7 @@ void pmbus_clear_faults(struct i2c_client *client)
 	for (i = 0; i < data->info->pages; i++)
 		pmbus_clear_fault_page(client, i);
 }
-EXPORT_SYMBOL_GPL(pmbus_clear_faults);
+EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, PMBUS);
 
 static int pmbus_check_status_cml(struct i2c_client *client)
 {
@@ -548,13 +548,13 @@ bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
 }
-EXPORT_SYMBOL_GPL(pmbus_check_byte_register);
+EXPORT_SYMBOL_NS_GPL(pmbus_check_byte_register, PMBUS);
 
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, __pmbus_read_word_data, page, reg);
 }
-EXPORT_SYMBOL_GPL(pmbus_check_word_register);
+EXPORT_SYMBOL_NS_GPL(pmbus_check_word_register, PMBUS);
 
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *client)
 {
@@ -562,7 +562,7 @@ const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *client)
 
 	return data->info;
 }
-EXPORT_SYMBOL_GPL(pmbus_get_driver_info);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_driver_info, PMBUS);
 
 static int pmbus_get_status(struct i2c_client *client, int page, int reg)
 {
@@ -2299,7 +2299,7 @@ const struct regulator_ops pmbus_regulator_ops = {
 	.disable = pmbus_regulator_disable,
 	.is_enabled = pmbus_regulator_is_enabled,
 };
-EXPORT_SYMBOL_GPL(pmbus_regulator_ops);
+EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
 static int pmbus_regulator_register(struct pmbus_data *data)
 {
@@ -2642,7 +2642,7 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pmbus_do_probe);
+EXPORT_SYMBOL_NS_GPL(pmbus_do_probe, PMBUS);
 
 struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
 {
@@ -2650,7 +2650,7 @@ struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
 
 	return data->debugfs;
 }
-EXPORT_SYMBOL_GPL(pmbus_get_debugfs_dir);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_debugfs_dir, PMBUS);
 
 static int __init pmbus_core_init(void)
 {
diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
index eb4a06003b7f..52bee5de2988 100644
--- a/drivers/hwmon/pmbus/pxe1610.c
+++ b/drivers/hwmon/pmbus/pxe1610.c
@@ -148,3 +148,4 @@ module_i2c_driver(pxe1610_driver);
 MODULE_AUTHOR("Vijay Khemka <vijaykhemka@fb.com>");
 MODULE_DESCRIPTION("PMBus driver for Infineon PXE1610, PXE1110 and PXM1310");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index aec512766c31..b6e8b20466f1 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -420,3 +420,4 @@ module_i2c_driver(q54sj108a2_driver);
 MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
 MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/stpddc60.c b/drivers/hwmon/pmbus/stpddc60.c
index 3e6709542b63..357b9d9d896b 100644
--- a/drivers/hwmon/pmbus/stpddc60.c
+++ b/drivers/hwmon/pmbus/stpddc60.c
@@ -246,3 +246,4 @@ module_i2c_driver(stpddc60_driver);
 MODULE_AUTHOR("Erik Rosen <erik.rosen@metormote.com>");
 MODULE_DESCRIPTION("PMBus driver for ST STPDDC60");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/tps40422.c b/drivers/hwmon/pmbus/tps40422.c
index f7f00ab6f46c..31bb83c0ef3e 100644
--- a/drivers/hwmon/pmbus/tps40422.c
+++ b/drivers/hwmon/pmbus/tps40422.c
@@ -51,3 +51,4 @@ module_i2c_driver(tps40422_driver);
 MODULE_AUTHOR("Zhu Laiwen <richard.zhu@nsn.com>");
 MODULE_DESCRIPTION("PMBus driver for TI TPS40422");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 21ba0b18c014..81b9d813655a 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -308,3 +308,4 @@ module_i2c_driver(tps53679_driver);
 MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
 MODULE_DESCRIPTION("PMBus driver for Texas Instruments TPS53679");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index a15e6fe3e425..75fc770c9e40 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -629,3 +629,4 @@ module_i2c_driver(ucd9000_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for TI UCD90xxx");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 47cc7ca9d329..6bc3273e31e7 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -209,3 +209,4 @@ module_i2c_driver(ucd9200_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for TI UCD922x, UCD924x");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index f8bc0f41cd5f..b07da06a40c9 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -168,3 +168,4 @@ module_i2c_driver(xdpe122_driver);
 MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
 MODULE_DESCRIPTION("PMBus driver for Infineon XDPE122 family");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 69120ca7aaa8..b7d4eacdc3ef 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -404,3 +404,4 @@ module_i2c_driver(zl6100_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for ZL6100 and compatibles");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.17.1

