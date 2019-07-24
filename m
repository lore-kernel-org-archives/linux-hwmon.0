Return-Path: <SRS0=COWf=VV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A235DC7618B
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jul 2019 08:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79F31217D4
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jul 2019 08:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUXdAN+q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfGXIB0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Jul 2019 04:01:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37408 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfGXIBZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Jul 2019 04:01:25 -0400
Received: by mail-pf1-f195.google.com with SMTP id 19so20521890pfa.4
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2019 01:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/yBU2V0n0/xptEsLU02qC6A+6q2tq+AxgEnaiKKdSkA=;
        b=dUXdAN+qjPZf3JKL8uPv8gVjdEaO9qSNUmWP6TMRUFX59cXH+cBIxqoXtnw49ae1l7
         Wowewg8DWaAi2OkI6j382Rw3ZRIwmxL1r40J766LsQVW7+pZXnxs09LDZVGCV/BBSkDX
         MUF2x6rmMTAxz00FoT3kwDE2t1TKFUPpxNgqz1eeEvlrq4WJpibRch/UIrbVvCH4w1qF
         9GuiN1+UkI+VBqJqGnYGUWfyWjTNUmN0SSF+dHd9HYdWn0Xf+sMqbSFGerAzmVQJFVKc
         NlM5BLSUzll+FEMK4WqTiuwT4boOkWUU4TjdxWI3shYYyoDWTlu+ThNXqmtslIafX8tH
         yP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/yBU2V0n0/xptEsLU02qC6A+6q2tq+AxgEnaiKKdSkA=;
        b=P2LTss1V9m7xpW+lvjeZ4ANHBVH8y44vr4FX++KoaiwO9M7v0ixzipI6fqlUOZS+gw
         avf/H5T81OUI7XAfnhwp4oj4rGSwSHt7FKEBMVRR6JPGgaFStXohginbzJFnGE8+YJFm
         9YuqVD56MzhIUbd1OuyZXXDAryuulNuzL+zGomYouOGkTiZ7NZiFtK6HVMFOEYe+Nx00
         fCbxbh6vNAmyV8CFUz4eI+BikoWh7l3rBlO5AmEjLEDThcT984jrpoUb7dQzJVtmS2Mp
         PWvtMZpGSt3mLiF6roYpHf9l4QqH4hsEJpt5sU0doSk1tlCsOZrBLGgh/BRh6lFFhKtJ
         FPjA==
X-Gm-Message-State: APjAAAW+sqntWdL/STcMRomd2jrxI4wlh535oPs+y/ZIrz+UaVzx/0aN
        ZB47xH3lMzW8ofM9VdrckJXJoFGCWGWy9Q==
X-Google-Smtp-Source: APXvYqy+eAt4mBH9mevtLeWpJiwD49Qfmf/Rebgi+o273CVKoiQaGAhyor20U7qeWUqb1wsRT9pCGQ==
X-Received: by 2002:a62:187:: with SMTP id 129mr10105979pfb.128.1563955285252;
        Wed, 24 Jul 2019 01:01:25 -0700 (PDT)
Received: from devenv-shenrwan.novalocal ([131.228.2.3])
        by smtp.gmail.com with ESMTPSA id h1sm57539032pfo.152.2019.07.24.01.01.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:01:24 -0700 (PDT)
From:   Wang Shenran <shenran268@gmail.com>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/1] drivers/hwmon/acpi_power_meter.c: Change log level
Date:   Wed, 24 Jul 2019 11:01:10 +0300
Message-Id: <20190724080110.6952-1-shenran268@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <6b6af74c-2a2b-1704-173b-bb1b466b2197@roeck-us.net>
References: <6b6af74c-2a2b-1704-173b-bb1b466b2197@roeck-us.net>
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
 drivers/hwmon/acpi_power_meter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 6ba1a08253f0..4cf25458f0b9 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -681,8 +681,8 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
 
 	if (resource->caps.flags & POWER_METER_CAN_CAP) {
 		if (!can_cap_in_hardware()) {
-			dev_err(&resource->acpi_dev->dev,
-				"Ignoring unsafe software power cap!\n");
+			dev_warn(&resource->acpi_dev->dev,
+				 "Ignoring unsafe software power cap!\n");
 			goto skip_unsafe_cap;
 		}
 
-- 
2.20.1

