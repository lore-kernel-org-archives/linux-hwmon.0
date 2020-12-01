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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5067DC71155
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 19:11:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D42BC20639
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 19:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWGxoJVm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgLATKr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Dec 2020 14:10:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgLATKp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Dec 2020 14:10:45 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0883C0613CF
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Dec 2020 11:09:59 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id k5so1677439plt.6
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Dec 2020 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1woGiBV2GTNGxzxpa8s59z3SnS9/3boxLOfUkVkkNU=;
        b=jWGxoJVm7l5laLbk+nnb1ChzEm94ZBGuSihH/Lg1kWrwTXVxLY3vIG4tsbsO+SsTGM
         dbuFpT9PEEJlbx8lf8HzfkSl22WZ/e3GxI5PYVWPi8o4r2gg8UxY+Rbdm1o+JGWgnF5z
         rsfPqP3+ygQ9pZHOFKb2B56mA/REgnF+aGLbdYsFQ5SWjNclMPfhM3Vke0ALz+lOt40+
         QL+dwr2/ocMXZ28C59t8ornSNfF2qs3jJU0v97qKzy1I10C8fhwg0uFkR2g7K3shtCcg
         QcamzmYL1A23SfsDtfNqsI/jxwQ1BOm6OmRxCNCbVR+Td1UgALK6iO5MgultsINR+Imd
         H+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1woGiBV2GTNGxzxpa8s59z3SnS9/3boxLOfUkVkkNU=;
        b=A2Gby2SWG+Fj4h1g6eVhGVRg2gdaQch2K+L0gGRpMJoXhWNm5iE0TGxZYqkX/0k5JS
         fDwxNn5NLt9LvoZjRZy0VhanQVrTuz/ZZ5S3U/koJqap9a2/mGT8o5hUpgtYnvTOOnwc
         4A+Z0DhzCAUlLjWswHDN58YGVfbPNw8CdKwlD6qn0qtdq2M3fS8/CZVKVl/VLq5GXJJi
         vA06C2Jn4EGTZY5AfqI0iAREwNoemEFV2riEvKtnKx+m7+cW4xn1H+gFBx3GmzNW7DuY
         gHmmkCeXUrA6nXWYZkcZXXDdOHJQDhlN2zEd4z65kR7vikkdOmIWB1unPbEq6w3Kfnwy
         lhDg==
X-Gm-Message-State: AOAM533FHemmabRQA+Vi0I8CCleob8Zw0tqVqHT8o2wbya9wwB06sDpa
        1wKgVouzBQw6NS/pWO630e67RAe19ZC7RqII
X-Google-Smtp-Source: ABdhPJyv9AeDXir2EgJZQjTnKmdwT4zzUAE83MPfpSWAoqZXS8j5fAIs9Ygq1rMDnPGQjWqPlWEOww==
X-Received: by 2002:a17:902:eb54:b029:da:29d7:cffd with SMTP id i20-20020a170902eb54b02900da29d7cffdmr4288354pli.28.1606849797838;
        Tue, 01 Dec 2020 11:09:57 -0800 (PST)
Received: from localhost.localdomain (c-71-202-86-11.hsd1.ca.comcast.net. [71.202.86.11])
        by smtp.googlemail.com with ESMTPSA id j9sm504839pfi.116.2020.12.01.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 11:09:57 -0800 (PST)
From:   David Bartley <andareed@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     David Bartley <andareed@gmail.com>
Subject: [PATCH] hwmon: (nct6683) Support NCT6687D.
Date:   Tue,  1 Dec 2020 11:09:31 -0800
Message-Id: <20201201190931.72437-1-andareed@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is found on many MSI motherboards.

Signed-off-by: David Bartley <andareed@gmail.com>
---
 Documentation/hwmon/nct6683.rst | 3 ++-
 drivers/hwmon/nct6683.c         | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index efbf7e9703ec..7ceab770ae4e 100644
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
+MSI B550	N/A
 =============== ===============================================
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 2d299149f4d2..53e8d0cb3231 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -63,6 +63,7 @@ static const char * const nct6683_chip_names[] = {
 
 #define SIO_NCT6681_ID		0xb270	/* for later */
 #define SIO_NCT6683_ID		0xc730
+#define SIO_NCT6687_ID		0xd590
 #define SIO_ID_MASK		0xFFF0
 
 static inline void
@@ -164,6 +165,7 @@ superio_exit(int ioreg)
 #define NCT6683_REG_CUSTOMER_ID		0x602
 #define NCT6683_CUSTOMER_ID_INTEL	0x805
 #define NCT6683_CUSTOMER_ID_MITAC	0xa0e
+#define NCT6683_CUSTOMER_ID_MSI		0x201
 
 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1218,6 +1220,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_MITAC:
 		break;
+	case NCT6683_CUSTOMER_ID_MSI:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;
@@ -1352,6 +1356,9 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
 	case SIO_NCT6683_ID:
 		sio_data->kind = nct6683;
 		break;
+	case SIO_NCT6687_ID:
+		sio_data->kind = nct6683;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
-- 
2.27.0

