Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADD4C43333
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Dec 2020 14:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E98723139
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Dec 2020 14:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgLVObP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Dec 2020 09:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727704AbgLVObF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Dec 2020 09:31:05 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB6AC0611D0
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Dec 2020 06:30:23 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b2so13133620edm.3
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Dec 2020 06:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W7MQknUNgfLi/fumFEQOeiLKRWIy/aG8D1EJYUy6tL8=;
        b=jBX9nztfQcPXEjVMwnk21ruKkoLxUS1MgYhJj3wDAkcRcf9KXbhVt7pHh0977ou7Wr
         54Q9X6bMFiYM4VtrH/LSWoIC7q3Bkq1K4T+IjizolTH7Glze2ZrB8wetmkUVQnhMMDKj
         fzOW5UnqaSajFTTSmCplT53xwYb72LNhCKhOh1cO1tAf2WjhrA6GC3aun0amICb7TOQt
         WBwazbfIATu4U1ub0vaTfrsy87Du8TITu2vkIM2UNzJ5raMjnDI0erTr6DtkRAisYVRc
         ioYatjSELhgFQU3GpXbFgazQ+9TNr8C8gnUHoTVhMGqg2lwXsS5CN3EGhhioUGnhrkaP
         bHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7MQknUNgfLi/fumFEQOeiLKRWIy/aG8D1EJYUy6tL8=;
        b=sa4DLux6sMoKN53I4PEPrI7wqtDCXkcZo9d66+7Dlr94octriGU1yrWXB+IUvfQ3v6
         zfqOestEMrRFRKq7hXecf0D+HfXARquow9UdLU0KDMNvJsv0qbw5hisslQdsCU3SaVIz
         qg/6b0OyUSrjTAdlZhWPRIP2dzjBmgCP8MBTLR7RjVVd9skBSccrMA6u0LYK6/Efiqav
         LCUZGywY7Gl62n4X13R4qzRfOAYBoQ8oev5sxEbjT+0NWuq2C+JoE48K5J069usjSvmP
         yq+TLWSLzbwalk6LsMhoeQRpNG171y7ZvkVVNJGUnnK/duBqN36uZPfIcnlscGd7HX4d
         GpPg==
X-Gm-Message-State: AOAM533EgV7buBxnS3cUlu06TFQ3xIejJOWfrN8HoAN84DJO61sdbmPc
        tp3PHPHvVEO1qzvPehpjyeaXFg==
X-Google-Smtp-Source: ABdhPJy++1Le2msaWn/K1l3VFk+h7JwyCtlOkwbkNSRlLVe1Eqdy3NF5D45K12eS/cRumAwt813IQQ==
X-Received: by 2002:a05:6402:2207:: with SMTP id cq7mr20427116edb.310.1608647422296;
        Tue, 22 Dec 2020 06:30:22 -0800 (PST)
Received: from localhost.localdomain (dh207-99-167.xnet.hr. [88.207.99.167])
        by smtp.googlemail.com with ESMTPSA id z1sm8434896edm.89.2020.12.22.06.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:30:21 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for Texas Instruments TPS23861 PoE PSE
Date:   Tue, 22 Dec 2020 15:30:12 +0100
Message-Id: <20201222143012.1618807-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222143012.1618807-1-robert.marko@sartura.hr>
References: <20201222143012.1618807-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add maintainers entry for the Texas Instruments TPS23861 PoE PSE driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 830244166a7c..5441be7a5c26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17336,6 +17336,14 @@ F:	include/dt-bindings/soc/ti,sci_pm_domain.h
 F:	include/linux/soc/ti/ti_sci_inta_msi.h
 F:	include/linux/soc/ti/ti_sci_protocol.h
 
+TEXAS INSTRUMENTS TPS23861 PoE PSE DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
+F:	drivers/hwmon/tps23861.c
+
 THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
-- 
2.29.2

