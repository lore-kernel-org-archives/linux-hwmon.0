Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1C9C43460
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Apr 2021 13:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05530613ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Apr 2021 13:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhD3N2l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Apr 2021 09:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbhD3N2i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Apr 2021 09:28:38 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E921C06138F
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Apr 2021 06:27:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id bf4so2892308edb.11
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Apr 2021 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BrHzjCIjcxZkJy9xCDsVVmc4mUH4dxwi8qiCMIL3boQ=;
        b=WHs6mBQtb4fpjoVjZ+cVtt6GhzL2tNuBl3RQj7ToEdMeXGAJlyOX1xaCIKcgHIBEU0
         aGSzoi7pZEGErH+4fMsuxBDuKQuS+b7PkBJcXQaaZXios21NzvjxJ5V0VFT7z95oKmoQ
         Nk+l3Bao+8LGEh11aCzDDqpbPSiqJwevNVBvHapzsSbDf30N+31dNgryS3OYpK1E2sFB
         V378L4THAU87DQJk3cEbFnEA5a2iYrd2/8jC1mPFapmf0rkpltNltjtGEtS/gxxDWRms
         Wz4mblH5yiT+eat3ENIkLrXVLGnUET0UxYX6b16y/tEQhtcYHfaIpxhOOOq2fG/3r5pQ
         8g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrHzjCIjcxZkJy9xCDsVVmc4mUH4dxwi8qiCMIL3boQ=;
        b=JUi9+ffBgAMZcaQOpdOwmpNI2X7wjZEU0F/k3xRlyp7gkl8J+h31yPUJOd9fE922F8
         Vg2C7lL4kBLYBTSAoX2yyzyIU96DJgESf5SsbKTJCi6eFB3HjF6xdK/AdXwJrW0P/plM
         MhaHMzB2IovbGRKepGwrBkkXbkcQyLAvCjOKUmWx+aE5SYr9rzQTzoPAkvy/uXxI3byP
         R2VlWyXuMPATDKGDJ+sy6CUZ11IgWRf+6rhrAGyd6oa1UrEk6tXqnIhJosVc0eME/Y49
         YT0BgJ/m2ZmK+Eozf5BvnIr5eyya/IBjmEmQIKX5ukZwPTDAnYw9Rz/Wqlv6snvN5CjS
         Bveg==
X-Gm-Message-State: AOAM530Xn+vR1lJaIZU+7/FgtW6mMKonH2WnTBCIeH62sf45vaGytYv+
        69oBhf4M3HcUPAvQNgT7FWdfAg==
X-Google-Smtp-Source: ABdhPJw4+kF8jdVXcYU1JGtpwIfG8ESLqUdsxJFFs43bfID8S367bkAPJ8oDqCwsOrgg9Yvmua1goQ==
X-Received: by 2002:a05:6402:10cd:: with SMTP id p13mr5972199edu.382.1619789267009;
        Fri, 30 Apr 2021 06:27:47 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-15.xnet.hr. [88.207.97.15])
        by smtp.googlemail.com with ESMTPSA id o6sm1245776edw.24.2021.04.30.06.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 06:27:46 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/3] MAINTAINERS: Add Delta DPS920AB PSU driver
Date:   Fri, 30 Apr 2021 15:27:35 +0200
Message-Id: <20210430132735.127342-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430132735.127342-1-robert.marko@sartura.hr>
References: <20210430132735.127342-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add maintainers entry for the Delta DPS920AB PSU driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7193624868c7..90eecde2a229 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5106,6 +5106,14 @@ F:	drivers/mfd/tn48m-cpld.c
 F:	include/dt-bindings/gpio/tn48m-gpio.h
 F:	include/linux/mfd/tn48m.h
 
+DELTA DPS920AB PSU DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/delta,dps920ab.yaml
+F:	Documentation/hwmon/dps920ab.rst
+F:	drivers/hwmon/pmbus/dps920ab.c
+
 DENALI NAND DRIVER
 L:	linux-mtd@lists.infradead.org
 S:	Orphan
-- 
2.31.1

