Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7904C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243394AbiANQfU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243422AbiANQfS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:18 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA9AC061401
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:18 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so10609739oti.11
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kcuY71NcT1P5uKtYlPWtdN65iuiBkZNSK9GIZKL4294=;
        b=VurhK2ecj08A2QMWG6wJKwO3rh6PGIX4ah181Rv9ITBRfULvUMHNY8KZ9BTzO92gFu
         N76uw145lQKY2LzjPpkoGjQZqaMSm6Z018VLlTwYaEcc5z0g16kPXtH1WQu/JyqdFs4N
         RxSGyqPmNHCMTCGLv14UF2Ura7fd4jtYHIW8F9yxzyBy50hUog/Dz96SSFTC/dIP53Wx
         eSfJVFE8FK+k3hsiw7dc1OMdwM+iq9Y8JlCiNma99uhjPyDOJnraVgLSpfm6osr4Benp
         WP8+qhYhIm6fO80zaFPNwO6PkL54+d3xAmg1u0hGOtS7DAwA+5N9ZGM0KDUWBii5TfMS
         5ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=kcuY71NcT1P5uKtYlPWtdN65iuiBkZNSK9GIZKL4294=;
        b=0D2jkUFqysX1+qCkN9kLs8m188OWowRxuUvpwYd8DEfL31lE5GHnKizkhe3sHOyR+d
         wd+uQeMUgZ3qvQvF/Dtt4rhS+4DEmMDsJ8Utb+9n9wIf7WzI/27K6zEisQR7EwWAKVnn
         xz24MC//g2AqWDucj4T1ZGkVsJPr1OJu8z3U2FzJyxIe84ix9WxtieZ8tjKXlqWDkgRw
         62yM7+R6WScg5A/Mskg55wsEuxZh4zK6DnxiclShL43eIMvzQd4tctIhiU2nHEG1A4Da
         fDuftLsAdZPTADwsWZocLZzPu/dBBY09eYWe31lKWV6X3s5TCVDmG8/kJiIGDANf07Az
         L5wg==
X-Gm-Message-State: AOAM5323+/Qfp1idgXJyaa4sRHZdis8utz8NI00CgiOQmKAGYC7VLIEl
        ylMweVW35sdpv0vj1EfoIcJHMNVFlDY=
X-Google-Smtp-Source: ABdhPJwi8vYGwFMeqmlU0uD/RFNCGptSElXVBowWV4Jfs8u7exODFXvCsFHvP6PcTc3hCA+ax1H43w==
X-Received: by 2002:a05:6830:111a:: with SMTP id w26mr7253788otq.33.1642178117723;
        Fri, 14 Jan 2022 08:35:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p23sm1704281otp.46.2022.01.14.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/8] hwmon: (lm83) Reorder include files to be in alphabetic order
Date:   Fri, 14 Jan 2022 08:35:05 -0800
Message-Id: <20220114163512.1094472-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114163512.1094472-1-linux@roeck-us.net>
References: <20220114163512.1094472-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Reorder include files to be in alphabetic order to simplify
driver maintenance.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm83.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index 74fd7aa373a3..44d720af2473 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -18,15 +18,15 @@
  * http://www.national.com/pf/LM/LM82.html
  */
 
-#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/slab.h>
 #include <linux/jiffies.h>
-#include <linux/i2c.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
-#include <linux/err.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 
 /*
-- 
2.33.0

