Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419E2C4708C
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 10:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27D2261157
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 10:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236575AbhE1KkV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 06:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236523AbhE1KkQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 06:40:16 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A617C06138D
        for <linux-hwmon@vger.kernel.org>; Fri, 28 May 2021 03:38:40 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id l1so4633071ejb.6
        for <linux-hwmon@vger.kernel.org>; Fri, 28 May 2021 03:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p/SoT+1SWGTsxMqTiV2xoAlXSkh7qhcMepCQ/DP40UY=;
        b=HC3PSx0gMRIJ1vyroJY8aSH8wkXeIkCxUBwG40bfIoKA5TporB1fTMXQ6Jo2/QwCs5
         tQ0d6pm5XH9t7U8Mk/TnL4bcuZFRhXLHdOjYwjJfWCwhYCKUw8alsT9xRwEGZZ3X6J0O
         XzcxTlc2C8dZk1Lf+18M3mmQZtjsRYrtv7Y6V0IQblGh5hScp8VLoaYAcyg8mzo5Q4Z6
         Q+w/bjama9XLPXP5+dg8uNvUiM0xayJuGZki48AqzgD7I7q7mJDosbdHdfubyp9qtlKS
         I+nxgwK/8DTnYsYO+D3WHejEz51aPNbIvC4tRPoTu8m11zx4bEXvGwbWIyM0QLJu8eZp
         05ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p/SoT+1SWGTsxMqTiV2xoAlXSkh7qhcMepCQ/DP40UY=;
        b=HdK7BHhbYEy1XP/rsW8lGQeBxx2vQOuViCV8usGIaOWIh9sO4eedhf8+eSvE9bscHQ
         VeF8c4HruXkLPtpNq6OkEzvMQnCpanJxhUOAoXYD9f5PLGT+6XbMr2knuUYYe+QtcX1r
         jsiqaqB0TpdMpBDJ/HoGCYbcB8LMmZ3EF1U0C5X/P79R5bq4zqu6Stx8aCKMDHJcjWnS
         VZ6vDt6iQLnK0NOzDCJB59nHxg9ULotsvCLiGIn3lHSN11kp195PuxuVcLIMY+3kOkh+
         /PWQxrijC9Kuhs3i/+8L0wnTQQ33HgAgkGvQv3gUmQTkACyIsa1n1NsbhygMbKMQvifx
         lAiA==
X-Gm-Message-State: AOAM5323zQYnAZciUvMlP0UzIZgtwZNeqFj4liTZBPd3g/k2nhQoezJU
        d1a5CDvlaSvAlMhEZkMq/wNMjg==
X-Google-Smtp-Source: ABdhPJzzlw1vrY/6KZz4b5DnJHsFLDoqZ1+bjpyJiKN6yb0U3K7Ib8TAkhF/J3bs5VLGkDV+s3VoSQ==
X-Received: by 2002:a17:906:a451:: with SMTP id cb17mr8507930ejb.510.1622198319086;
        Fri, 28 May 2021 03:38:39 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-158.xnet.hr. [88.207.97.158])
        by smtp.googlemail.com with ESMTPSA id jw9sm2192446ejb.77.2021.05.28.03.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 03:38:38 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, Jonathan.Cameron@huawei.com,
        alexandre.belloni@bootlin.com, sst@poczta.fm, krzk@kernel.org,
        alexandru.ardelean@analog.com, devicetree@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 3/3] MAINTAINERS: Add Delta DPS920AB PSU driver
Date:   Fri, 28 May 2021 12:38:28 +0200
Message-Id: <20210528103828.53320-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528103828.53320-1-robert.marko@sartura.hr>
References: <20210528103828.53320-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add maintainers entry for the Delta DPS920AB PSU driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Drop YAML bindings

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c3e2177349d..d12cac63689e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5103,6 +5103,13 @@ F:	Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
 F:	Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
 F:	drivers/gpio/gpio-tn48m.c
 
+DELTA DPS920AB PSU DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/dps920ab.rst
+F:	drivers/hwmon/pmbus/dps920ab.c
+
 DENALI NAND DRIVER
 L:	linux-mtd@lists.infradead.org
 S:	Orphan
-- 
2.31.1

