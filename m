Return-Path: <SRS0=cQ/s=VU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51888C7618B
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jul 2019 10:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E9BE2171F
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jul 2019 10:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCdOVQO0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387509AbfGWK5I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Jul 2019 06:57:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34123 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731069AbfGWK5I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Jul 2019 06:57:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id 31so42715014wrm.1
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2019 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3tQfYGtm45ybmuDdWhOuWKhyvPBbv7o/2eP517KTWE=;
        b=tCdOVQO0P59diQs7rnGIeqLJN+bzhYjtiuZAbgmCU/FrGmLlI4NMkmFzdXIJLC9M3r
         qdCX2bkdXfDWw70vzcfHeqbFFWdA2anwFRL9EP2IwFBF3er3O1F8Gm1MFiPEshBrHiNu
         uYAxmnxz8SRszdif09RtBiSq3F/Cq5IWQ0Sh0dxVqkKNKwz03RHhqrgl/vD4J3GAll+4
         Yj1niCpHR5op/qArCcDRmlm2qEDfNsjyCpas8NrT3Vzrtc8b5bV+qby7/zDxjE3toU91
         jO9GanWVIMVJ8hAfx8uJMxPGGHluo9u2T+y8VulHeMEjKgA6ZxpZVfg8VwZlXF9/XQ3D
         PSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3tQfYGtm45ybmuDdWhOuWKhyvPBbv7o/2eP517KTWE=;
        b=lQz0xhU5ljTbfrDqD3hZrC4VqBCfId6Aw3P8ld/2C3v8aqcAmBynmk9y7aQ8rPUtFZ
         DmK/osdpSHZtSFdxRz9lNKODMdXCU8WG59+MfFalk7GHsmgNUP6feaKDQW3X/7c3m06v
         NYCj1ADtR1bl5G/wyoneeROaAAeXU+IPE4WbPvebIrLPiIi1gwc/ft4x+pigueNoJqqc
         4ThhTaei80sd3Pf2qnSM9DdCpFsY5NNGUH8f2iarNB5Vu8rtosIaSe02iKAcHICBQtM7
         t/qABVxhjOj95MhMakImM4798b2irQ1gLheFR3iiMYg517rFJ4OPyt94ahs827baeoAG
         LHGA==
X-Gm-Message-State: APjAAAVawMBR7WDjD2ISK01FgvZokmzhMMeytMq1tLRrA4h8SoCpISnt
        sqddc/3G4JqdA1fQ7sR3loZVZGcZcLBAfQ==
X-Google-Smtp-Source: APXvYqzGZ2P1vDthpMppRHARy8QBCRyp7eDtx1b6B/PzMNWHlgz5KS5NONe88dLDuVFVGFcfDfpL0w==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr78738337wrm.12.1563879426660;
        Tue, 23 Jul 2019 03:57:06 -0700 (PDT)
Received: from devenv-shenrwan.novalocal ([131.228.2.3])
        by smtp.gmail.com with ESMTPSA id x18sm37960378wmi.12.2019.07.23.03.57.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 03:57:06 -0700 (PDT)
From:   Wang Shenran <shenran268@gmail.com>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/1] drivers/hwmon/acpi_power_meter.c: Change log level
Date:   Tue, 23 Jul 2019 13:56:58 +0300
Message-Id: <20190723105658.6564-1-shenran268@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

At boot time, the acpi_power_meter driver logs the following error level
message: "Ignoring unsafe software power cap". Having read about it from
a few sources, it seems that the error message can be quite misleading.

While the message can imply that Linux is ignoring the fact that the
system is operating in potentially dangerous conditions, the truth is
the driver found an ACPI_PMC object that supports software power
capping. The driver simply decides not to use it, perhaps because it
doesn't support the object.

The best solution is probably changing the log level from error to warning.
All sources I have found, regarding the error, have downplayed its
significance. There is not much of a reason for it to be on error level,
while causing potential confusions or misinterpretations.

Signed-off-by: Wang Shenran <shenran268@gmail.com>
---
 drivers/hwmon/acpi_power_meter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 6ba1a08253f0..ee0363e5be43 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -681,7 +681,7 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
 
 	if (resource->caps.flags & POWER_METER_CAN_CAP) {
 		if (!can_cap_in_hardware()) {
-			dev_err(&resource->acpi_dev->dev,
+			dev_warn(&resource->acpi_dev->dev,
 				"Ignoring unsafe software power cap!\n");
 			goto skip_unsafe_cap;
 		}
-- 
2.20.1

