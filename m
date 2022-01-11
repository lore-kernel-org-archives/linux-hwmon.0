Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D23C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 16:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240789AbiAKQvc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 11:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiAKQvc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 11:51:32 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C0FC06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:31 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so19201568oti.11
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NN8jZHxmNR2+eehiNfF2xVHlflpLBNPp8ULvGMALP8A=;
        b=IPU4vczu2oaXdUd6fPPEt4bRButHTKO7xY9whNtesvOARqFQHeInT6SJuAVrIUC97D
         WbvFXM24S979OqtSIb04MI5lJVl1ptpdKrtKobc7fmFqCCDnl26fj3e2jhRheJNbcNQM
         0ET/62qLysJUc8yioNR+z0VWL3lwS08XOKiLwoQI9If0rrcHV97DPLmatd/IBFNr/t7h
         Bg6u84ZiTliD44b1UyCdE/unL7+NqygbHwAez/Gcln9AbBtVdJ7U5unODatvIlSgSWX6
         +zNbekx8Jtb39qsAiS3GjANzp0h5+RaX9t0TSY0gfkb6UJ7NoH5JSMMM9V/perl/lWxv
         LJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=NN8jZHxmNR2+eehiNfF2xVHlflpLBNPp8ULvGMALP8A=;
        b=BPIGiemS1L6MXaRDWrDksTWdCdtI6E8+i3Bw3vX2Buwt6zLHNMESwRBHlxQthUmsNn
         lVG9HUbFk0vhxp+oJoKZTqngIFRo2Th9VxY+izAGad1MTIstd4UZLjTaabZ7jKdNGYbE
         B06LVXhGu9TZRUbgn9VYSMbixpYRsGeMuZfbcR9YXUktHUWM45m9OSSb4UU4BTsmvo6y
         KE4GYXvcrhN4AFyTdPMeEC+pa6nsvjZBTXC3srJmSLdmZuLB9WoTih79ELfjkwqv+DPb
         M3yOsLYWo/jtGttlrP7EvfDm/Bbx+dsWSeRKFpwKJWy9Rx91lAru5f+FP++abiunOxAT
         Eq8Q==
X-Gm-Message-State: AOAM531Q17guM9HUK2BiYdgaUbYyLfitbYAalCXzMCiPoZR6R4bJ0O/x
        mxtg40zTnhUlSg5BGnzVFWgRRRyUhh0=
X-Google-Smtp-Source: ABdhPJyclrJGDpr2HI8W/wyAp5nzbUf3bwvtfmcE932/Ab9iOOQxxDx2W0T5+CbNh2kNY9Ce6zcquA==
X-Received: by 2002:a05:6830:4127:: with SMTP id w39mr3881190ott.98.1641919891064;
        Tue, 11 Jan 2022 08:51:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 184sm1746998oih.58.2022.01.11.08.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:51:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/6] hwmon: (lm90) Mark alert as broken for MAX6646/6647/6649
Date:   Tue, 11 Jan 2022 08:51:15 -0800
Message-Id: <20220111165116.1298459-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111165116.1298459-1-linux@roeck-us.net>
References: <20220111165116.1298459-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Experiments with MAX6646 and MAX6648 show that the alert function of those
chips is broken, similar to other chips supported by the lm90 driver.
Mark it accordingly.

Fixes: 4667bcb8d8fc ("hwmon: (lm90) Introduce chip parameter structure")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 06cb971c889b..ba01127c1deb 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -394,7 +394,7 @@ static const struct lm90_params lm90_params[] = {
 		.max_convrate = 9,
 	},
 	[max6646] = {
-		.flags = LM90_HAVE_CRIT,
+		.flags = LM90_HAVE_CRIT | LM90_HAVE_BROKEN_ALERT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 6,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
-- 
2.33.0

