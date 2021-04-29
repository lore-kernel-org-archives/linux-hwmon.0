Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63FFC433B4
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Apr 2021 12:12:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9986A61447
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Apr 2021 12:12:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234862AbhD2MMq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Apr 2021 08:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbhD2MMq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Apr 2021 08:12:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E83C06138E
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Apr 2021 05:11:58 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l189-20020a1cbbc60000b0290140319ad207so8758723wmf.2
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Apr 2021 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CC13qMvTdvBCfEYuNiDCZJobaHEjHZxq8P5a0QZdtXc=;
        b=X14AJPDlkVkNEVIX9g7+UTTAmbWGGctjy2/y34OgMHMOgsCyuCNebBr0hYkiJ0TVuB
         uuiPQDZou3QMXiaIuUjBqAS94UKyf7ITQ83mVpGjoJWVYRTdTmne/lMYeXtMH6KSEYgG
         TNQzUb8kNjjDGWZhUJKv0kGS9va9nT//1+jGC1Kz8gdWSl2VBeDM9AZLa3s7ia3hQTNd
         K3uGiX/Myi9A7uV08TT4EvgPbjbMGbwpUF4buRB5w9moFVJPF8Q87YaXTP40uk5esAoE
         uKM0IqYd7uj7RzuVDd5tMzMj911jlPs3A30q5ej4EEsb8HArdOVnAy5WtJ6A94L0e6cQ
         qFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CC13qMvTdvBCfEYuNiDCZJobaHEjHZxq8P5a0QZdtXc=;
        b=IxgS4gvOLLJEX1ke4WhTWX50dJhx70VCAs7NhigGik0vHsd6ec3oMLZjHAl+Az5svg
         vgT/PFFyi68GRLXgd8exlZ7ziUiS2C+NhR/CP17MorFjMiY0rA4bAVNCt9o1BBQ4P6rm
         mdCzTotFmdkzd0O7nQ/vgsqb1Z4fSzypt/QE5xpeJTAscMBaljKK0Acj6nfbpPR0Q3ih
         JAbdPDBs80bwJL88k0+2rO847/jyr2OnuZ1+8d1f0Rn3XAkDEdUd1bcQt7qkDogpgr6h
         agOuuEgGF3cEKgr1sEY8Gl3N4Zv411H0FdRnYizNj73Hpa+UnMNNsI5qRXB31XReZ5Kt
         AyBA==
X-Gm-Message-State: AOAM531joYaxLRu+ZAKY2gZoI/ZCkfehBJUyKz38dGA9FQA2uAB/kM3s
        JMP+aVwgjDpw8x9jXXcZMhxblg==
X-Google-Smtp-Source: ABdhPJyXvLLMtW6YOY8kXf16jcHOoCucImYQ6t//OjljaEvzl2+wBfBjnhGXNR0ErdAc3Shl7gkiWA==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr36919791wmc.92.1619698316454;
        Thu, 29 Apr 2021 05:11:56 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-15.xnet.hr. [88.207.97.15])
        by smtp.googlemail.com with ESMTPSA id 18sm10075640wmo.47.2021.04.29.05.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 05:11:56 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/2] hwmon: lm75: Add TI TMP1075 support
Date:   Thu, 29 Apr 2021 14:11:49 +0200
Message-Id: <20210429121150.106804-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TI TMP1075 is a LM75 compatible sensor, so lets
add support for it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/hwmon/lm75.rst |  6 ++++--
 drivers/hwmon/lm75.c         | 13 +++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 81257d5fc48f..8d0ab4ad5fb5 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -93,9 +93,9 @@ Supported chips:
 
 	       https://www.st.com/resource/en/datasheet/stlm75.pdf
 
-  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75B, TMP75C, TMP175, TMP275
+  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75B, TMP75C, TMP175, TMP275, TMP1075
 
-    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175', 'tmp75', 'tmp75b', 'tmp75c', 'tmp275'
+    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175', 'tmp75', 'tmp75b', 'tmp75c', 'tmp275', 'tmp1075'
 
     Addresses scanned: none
 
@@ -119,6 +119,8 @@ Supported chips:
 
 	       https://www.ti.com/product/tmp275
 
+         https://www.ti.com/product/TMP1075
+
   * NXP LM75B, PCT2075
 
     Prefix: 'lm75b', 'pct2075'
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index e447febd121a..afdbb63237b9 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -50,6 +50,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	tmp75,
 	tmp75b,
 	tmp75c,
+	tmp1075,
 };
 
 /**
@@ -293,6 +294,13 @@ static const struct lm75_params device_params[] = {
 		.clr_mask = 1 << 5,	/*not one-shot mode*/
 		.default_resolution = 12,
 		.default_sample_time = MSEC_PER_SEC / 12,
+	},
+	[tmp1075] = { /* not one-shot mode, 27.5 ms sample rate */
+		.clr_mask = 1 << 5 | 1 << 6 | 1 << 7,
+		.default_resolution = 12,
+		.default_sample_time = 28,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 28, 55, 110, 220 },
 	}
 };
 
@@ -662,6 +670,7 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "tmp75", tmp75, },
 	{ "tmp75b", tmp75b, },
 	{ "tmp75c", tmp75c, },
+	{ "tmp1075", tmp1075, },
 	{ /* LIST END */ }
 };
 MODULE_DEVICE_TABLE(i2c, lm75_ids);
@@ -771,6 +780,10 @@ static const struct of_device_id __maybe_unused lm75_of_match[] = {
 		.compatible = "ti,tmp75c",
 		.data = (void *)tmp75c
 	},
+	{
+		.compatible = "ti,tmp1075",
+		.data = (void *)tmp1075
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, lm75_of_match);
-- 
2.31.1

