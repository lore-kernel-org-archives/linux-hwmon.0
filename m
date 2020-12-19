Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D46FC3526D
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Dec 2020 19:13:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 232A023602
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Dec 2020 19:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgLSTNZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Dec 2020 14:13:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbgLSTNI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Dec 2020 14:13:08 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A37DC0611CB
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Dec 2020 11:11:33 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id j22so7984840eja.13
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Dec 2020 11:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W7MQknUNgfLi/fumFEQOeiLKRWIy/aG8D1EJYUy6tL8=;
        b=JxoBhYkTL2ZHpGI0Ze8E4247eAu83x00wW3etACBj6rJ6kRaZ3IM31SrX2Im0jgzm4
         DtolModXybBqIsRpgO5soGVkCddReHwa45NQKna8wF3i90a1pCL0ZBCElRVfNI+rtO0E
         4l6BIQp1KGCvT5Ml3w/343xjYUs/VupLFoBQ0XvCZkd56XH3ysXsHpso1Gvjp6SM6fWv
         IdGFMPBndXolvI1W6klpXS2+fkY/d2Y9aDQSY/5e7VO9iFLv5GZS9MPxcwp+YIczDH54
         m8CFQF29dB6rGLip59peeUAqmr1BWkRId6d2ZliJFVNtVxF5A/8XpkURpCy0EGanBo63
         REkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7MQknUNgfLi/fumFEQOeiLKRWIy/aG8D1EJYUy6tL8=;
        b=uKLH0vzGenRLPud5ybREXPwTpKi+CvP8XnesdlIiKIU8gS87uza1ZRMWZJvV1oWhSM
         U1muW1btiOwViMBIlRtFM1VS5myVI7FY1gnS9Y460pO3Oo56NbJshrbFXnCusNSAprCv
         fBSe8uVe9ItM7sjWT1O++sotbqNAjw2Rlzv8q5GMr3doS2cffQvVbLtO1pKvAvofcp+P
         vYxWGuUROZHvyrrHpPYj2/7fei7itm0z7F0qhK2ClC8cmkw832BI5uqTe5Ex2pREpQLS
         b92tfIWkYk2SEELAQkSZfZnxoOF0iRSSODv58J34nKbBiuEKbHrlgDrxZeuM6qqcIQcy
         1lIg==
X-Gm-Message-State: AOAM5319qtcPF4Fsr8LgIOvkUUF1W42Z4CPWSuaB+S+SRC33P0ARGSOx
        7OkwZI2knTOdkCyIGJIsz6/pBQ==
X-Google-Smtp-Source: ABdhPJzDphxy2HHNe5npeVq3Rsq94sKB2aYn/L2GQrQHnieu1+ACIFt0Wd7e26z95PzpRlgxz4YS0w==
X-Received: by 2002:a17:906:7c49:: with SMTP id g9mr9495383ejp.185.1608405091966;
        Sat, 19 Dec 2020 11:11:31 -0800 (PST)
Received: from localhost.localdomain ([88.207.4.44])
        by smtp.googlemail.com with ESMTPSA id o10sm7081955eju.89.2020.12.19.11.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 11:11:31 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for Texas Instruments TPS23861 PoE PSE
Date:   Sat, 19 Dec 2020 20:11:21 +0100
Message-Id: <20201219191121.85142-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219191121.85142-1-robert.marko@sartura.hr>
References: <20201219191121.85142-1-robert.marko@sartura.hr>
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

