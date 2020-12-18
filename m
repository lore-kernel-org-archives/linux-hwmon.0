Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E5CC4361B
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Dec 2020 13:05:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0131B23A62
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Dec 2020 13:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgLRNE7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Dec 2020 08:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgLRNE6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Dec 2020 08:04:58 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D2DC0611CA
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Dec 2020 05:03:42 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c133so2248795wme.4
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Dec 2020 05:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W7MQknUNgfLi/fumFEQOeiLKRWIy/aG8D1EJYUy6tL8=;
        b=HGyhDl2UaSIO9RLlK8B99clY+T5Wo1ifMvC+HbSGiM+D6fE5cC5+YFiwGJDKus9dU8
         8UE6RB6oHdSqUjh54tsxi08f01JYQL8e6YfFgnjlIUhZs0mTioYca+OS8KiYDX0eHU0F
         jS+zA4FMt5yLgwDOQYIGWlhDGLvMQorSny2aKgFnc88dPKPSZIaP6rWSNI5R82iufUbU
         qXguz97wMjtxbnFNBk5MAGNQL70o+XdDvN2xQSBbHlvsrEbQcN1Y9Mv/usNC7JaB0fxU
         PqLDimdNfHYsZEZ3KTMB0c4zmuPIlH0TO3S39skzRFGdEZ7qdFNBQJuTlLuFd4DUs2JH
         fz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7MQknUNgfLi/fumFEQOeiLKRWIy/aG8D1EJYUy6tL8=;
        b=QM9dvm9plnBNq9/kIxYPy/+bnO7nYalWrauzteIXgO8rGg62bsL0RwFV4yQyet/7DK
         /ot72vHG/6NLxsswYwrFO7Y83dxdWo46imPVWVokokH1YMzgzaqpi3MMhCwaabJP9ail
         q2PXraPxOelM8xFMswlh0m2MZxq3cUs7DZ06YGjJu1gNtHfyJ+NgU6Jg//60LjyHj2is
         qP7XitUvfu4bZYb6xP0qyWr10TqjMBm/BRgwge1qMgCEeIKApzmd7i2LaBof05ZHQDgn
         zR8uf7Hy0nAfOkXxLLshBv+oNptUaavPaLF+KBGtomXjxJn1ZJ2QVqKqdcr4VqENNA/p
         fpvA==
X-Gm-Message-State: AOAM533PQEshnlP+OsLAOwDt7vW0zogOplH6wEbUgj0GElWkqs1WeaWs
        O655pvxEJfmLYRSIStlm+5sWxA==
X-Google-Smtp-Source: ABdhPJx2RV1GzhO+KSOtP2FIYANLwsmTin3968ImAOn9rJaC+fcjObllvyq2p6Oyn9BDPS4wO7dCNg==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr4065059wmi.83.1608296621351;
        Fri, 18 Dec 2020 05:03:41 -0800 (PST)
Received: from localhost.localdomain (dh207-99-82.xnet.hr. [88.207.99.82])
        by smtp.googlemail.com with ESMTPSA id l1sm13945720wrq.64.2020.12.18.05.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 05:03:40 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 3/3] MAINTAINERS: Add entry for Texas Instruments TPS23861 PoE PSE
Date:   Fri, 18 Dec 2020 14:03:29 +0100
Message-Id: <20201218130329.258254-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218130329.258254-1-robert.marko@sartura.hr>
References: <20201218130329.258254-1-robert.marko@sartura.hr>
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

