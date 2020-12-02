Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB3DC64E7A
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 02:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B135620C56
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 02:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgLBCv4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Dec 2020 21:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727611AbgLBCv4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Dec 2020 21:51:56 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070A0C0613CF
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Dec 2020 18:51:16 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id j13so148297pjz.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Dec 2020 18:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=su1kF5H9OgA8Wi+ZPuGP33pGwEjipcFQHGfODYpVSLU=;
        b=RxnwNPOeWI+IOo4U/9a/KvEobt7ahzjUugB96bLfONXf8uw7w4o8MOHBks9F+W+Zne
         b1z5j3OBlywnu4k5eI/ca1DNjB4jOZjnG+6w2Mq2h5l1vUeUU054eEJC7P9mUM6/fhAj
         ZPQoPFhJEOHbpKWcLWctz3mDqrNhZk7e+gzpquM+lV6TNA0PGabeyzST2fNKvENP1nf7
         a9Ax2mv/d1ilPJSdjC3R38IH1gdJp9sg0NC4fFejqXrMOq00B9cyEE9VSrmFdkUvipms
         K2rmCU8ps89PTP/tFxdaNOwjout58CoTrY1/dsczSHAI94ppSlvfQs61Z7qJHQEKipda
         SOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=su1kF5H9OgA8Wi+ZPuGP33pGwEjipcFQHGfODYpVSLU=;
        b=PNR2Nj/g6gGEYk0D83FavrPmMEdWHjSlVXYA7xE84p2vsVToaRXJX9M1n6+PAYp6vO
         a8q34lJpdO2w30cX70QrbcXJ5SyM76G9Ug2gR7xndbwlCLpCimkfMI/wnzHEJHkZGvbE
         TOc/inJKGW4qt1xx4BAQqYde3BRg9OyL1JVmscRp+EglxvLGaDKUDbF7GNNVWUtyEuN8
         WGYK2k1+OS5Eb4KrHQXs06ZaKNuseBUGxLk4jbX2DuqGUzturKDVDd7Gswlgi4n42JyF
         2MDeQhXUXMvzB5msxWSDoge7PotB4vPAdElLczBDAZPl9BxiNrs2/X5K0zQ/r32VtvOy
         lteA==
X-Gm-Message-State: AOAM531CmHP5Pe83Ht//0aV3QLs7V5FK8shSgQSNLVfpEaXAwLuCEAn+
        zFu7/UuP0V/Qmf7pj1L3hCbbKqgvBHMr7eWt
X-Google-Smtp-Source: ABdhPJxhifR6KPQq2BddBKusPeYvt0AkTqepWsJY6eDI+339FLOtKGcMImWGTpGkKFcH5E+fPJQhOw==
X-Received: by 2002:a17:902:468:b029:d5:ad3c:cf52 with SMTP id 95-20020a1709020468b02900d5ad3ccf52mr545598ple.7.1606877475093;
        Tue, 01 Dec 2020 18:51:15 -0800 (PST)
Received: from localhost.localdomain (c-71-202-86-11.hsd1.ca.comcast.net. [71.202.86.11])
        by smtp.googlemail.com with ESMTPSA id h11sm273891pfo.69.2020.12.01.18.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 18:51:14 -0800 (PST)
From:   David Bartley <andareed@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        David Bartley <andareed@gmail.com>
Subject: [PATCH v2] hwmon: (nct6683) Support NCT6687D.
Date:   Tue,  1 Dec 2020 18:50:57 -0800
Message-Id: <20201202025057.5492-1-andareed@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAM9zjRMsu68ZePpLJdSSdobCd8Ax51duqgG+LRKjKpsGrc+_ng@mail.gmail.com>
References: <CAM9zjRMsu68ZePpLJdSSdobCd8Ax51duqgG+LRKjKpsGrc+_ng@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is found on many MSI motherboards.

Signed-off-by: David Bartley <andareed@gmail.com>
---
 Documentation/hwmon/nct6683.rst |  3 ++-
 drivers/hwmon/nct6683.c         | 14 ++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index efbf7e9703ec..8646ad519fcd 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -3,7 +3,7 @@ Kernel driver nct6683
 
 Supported chips:
 
-  * Nuvoton NCT6683D
+  * Nuvoton NCT6683D/NCT6687D
 
     Prefix: 'nct6683'
 
@@ -61,4 +61,5 @@ Board		Firmware version
 Intel DH87RL	NCT6683D EC firmware version 1.0 build 04/03/13
 Intel DH87MC	NCT6683D EC firmware version 1.0 build 04/03/13
 Intel DB85FL	NCT6683D EC firmware version 1.0 build 04/03/13
+MSI B550	NCT6687D EC firmware version 1.0 build 05/07/20
 =============== ===============================================
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 2d299149f4d2..7f7e30f0de7b 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * nct6683 - Driver for the hardware monitoring functionality of
- *	     Nuvoton NCT6683D eSIO
+ *	     Nuvoton NCT6683D/NCT6687D eSIO
  *
  * Copyright (C) 2013  Guenter Roeck <linux@roeck-us.net>
  *
@@ -12,6 +12,7 @@
  *
  * Chip        #vin    #fan    #pwm    #temp  chip ID
  * nct6683d     21(1)   16      8       32(1) 0xc730
+ * nct6687d     21(1)   16      8       32(1) 0xd590
  *
  * Notes:
  *	(1) Total number of vin and temp inputs is 32.
@@ -32,7 +33,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-enum kinds { nct6683 };
+enum kinds { nct6683, nct6687 };
 
 static bool force;
 module_param(force, bool, 0);
@@ -40,10 +41,12 @@ MODULE_PARM_DESC(force, "Set to one to enable support for unknown vendors");
 
 static const char * const nct6683_device_names[] = {
 	"nct6683",
+	"nct6687",
 };
 
 static const char * const nct6683_chip_names[] = {
 	"NCT6683D",
+	"NCT6687D",
 };
 
 #define DRVNAME "nct6683"
@@ -63,6 +66,7 @@ static const char * const nct6683_chip_names[] = {
 
 #define SIO_NCT6681_ID		0xb270	/* for later */
 #define SIO_NCT6683_ID		0xc730
+#define SIO_NCT6687_ID		0xd590
 #define SIO_ID_MASK		0xFFF0
 
 static inline void
@@ -164,6 +168,7 @@ superio_exit(int ioreg)
 #define NCT6683_REG_CUSTOMER_ID		0x602
 #define NCT6683_CUSTOMER_ID_INTEL	0x805
 #define NCT6683_CUSTOMER_ID_MITAC	0xa0e
+#define NCT6683_CUSTOMER_ID_MSI		0x201
 
 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1218,6 +1223,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_MITAC:
 		break;
+	case NCT6683_CUSTOMER_ID_MSI:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;
@@ -1352,6 +1359,9 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
 	case SIO_NCT6683_ID:
 		sio_data->kind = nct6683;
 		break;
+	case SIO_NCT6687_ID:
+		sio_data->kind = nct6687;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
-- 
2.27.0

