Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C37C61DA4
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Feb 2023 19:38:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjBPTi4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Feb 2023 14:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBPTiz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Feb 2023 14:38:55 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E98442FB
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Feb 2023 11:38:55 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id bx13so2722193oib.13
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Feb 2023 11:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8dUR5A9Fb0Rs9cO9/+lv1jXaiLLNc6BatxehXoZtbxQ=;
        b=gKSYp+mYZTJo/4vdWeJcbNHVyShoyYbZbySSX/wKC3C+Kcxa8QoNRJK0hi5myEZIln
         98IB1Z5Po+W3Q0+/Iyf5P5dhKvctqUDdXS6cnm+NeeTX3HLSp9SR8OSt/QYglPed6v7o
         cqLQ4mUXxZRI72KKeSkyvy/JRfV4AITvbMKCEzqQMd5r9s49ORs1gsV/S/RatE4Qfzv5
         oeHgRsKZUa5v+9rg4T8qXUWWp5IsbPOiMSpUpZI79lFRt2NIEE0pTOxTogVPl9G+klAD
         N/03X+QxRYU0UvsJzpDQs2/gOtnUeV+8EgauIR8VzMw0bvTrDCx58DjOURFo3DPsvEjU
         U81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dUR5A9Fb0Rs9cO9/+lv1jXaiLLNc6BatxehXoZtbxQ=;
        b=Ky5rwfCimQ5DoMUb+yYMvYorpeWtmrc/ni9TV7pz9ezSpP+O8UxkbMEJ/zQFK76SXg
         Chq0LowVgiMH43Yem3Nc3xqH+56o39Zmdn6sr7jUfSSIvxt3aHMMeGLpdy0wWm1Ppcto
         eUqAN+As78CMqfkfvkRBstCLScNJREu/Qgpu7oKw5oM5u3PhDKNZVFQYoSw+0RDWHQ6B
         qfjswYisjC9Pzb71y6YKBL3Ln1cVMsJ45x3TGKtF03AB/piY1V0B9zxoWnqj2Qi/HS/H
         1IwntVqAPB7HsYZtyfUMMawdQe8gsDxgd82qvgSYAEUxcb/IexyqxuOCpQ2m5Kcxg0WS
         3Pfg==
X-Gm-Message-State: AO0yUKV7cx9+pCrG8Te5cWfewfX6rMVFcSG2q5BqWF3qVGzZfRyI9jxz
        5sv8Vld8h0e4zCGSfoMtPydhluFn9M0=
X-Google-Smtp-Source: AK7set9SUby0+NRkqH05Hx2zY6sWUy9uTp64wvZZUPbqLax7i3mTdbPPCpPoXomdqNz1c93B14YrUA==
X-Received: by 2002:a05:6808:aa2:b0:37e:c952:2bee with SMTP id r2-20020a0568080aa200b0037ec9522beemr2619981oij.22.1676576334109;
        Thu, 16 Feb 2023 11:38:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n4-20020acabd04000000b003645b64d7b3sm917472oif.4.2023.02.16.11.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 11:38:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Deprecate [devm_]hwmon_device_register_with_groups
Date:   Thu, 16 Feb 2023 11:38:51 -0800
Message-Id: <20230216193851.2942890-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Even though the hardware monitoring documentation already stated that new
drivers should use [devm_]devm_hwmon_device_register_with_info() to
register with the hardware monitoring subsystem, we still get submissions
for new drivers using the older APIs. There is no benefit to use those
APIs. On the contrary, using the older APIs results in substantially larger
code size. Explicitly deprecate [devm_]hwmon_device_register_with_groups()
to ensure that all new drivers use the latest API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/submitting-patches.rst | 2 +-
 include/linux/hwmon.h                      | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/submitting-patches.rst b/Documentation/hwmon/submitting-patches.rst
index d953ee763c96..6482c4f137dc 100644
--- a/Documentation/hwmon/submitting-patches.rst
+++ b/Documentation/hwmon/submitting-patches.rst
@@ -126,7 +126,7 @@ increase the chances of your change being accepted.
 * Use devm_hwmon_device_register_with_info() or, if your driver needs a remove
   function, hwmon_device_register_with_info() to register your driver with the
   hwmon subsystem. Try using devm_add_action() instead of a remove function if
-  possible. Do not use hwmon_device_register().
+  possible. Do not use any of the deprecated registration functions.
 
 * Your driver should be buildable as module. If not, please be prepared to
   explain why it has to be built into the kernel.
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 14325f93c6b2..c1b62384b6ee 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -436,6 +436,10 @@ struct hwmon_chip_info {
 /* hwmon_device_register() is deprecated */
 struct device *hwmon_device_register(struct device *dev);
 
+/*
+ * hwmon_device_register_with_groups() and
+ * devm_hwmon_device_register_with_groups() are deprecated.
+ */
 struct device *
 hwmon_device_register_with_groups(struct device *dev, const char *name,
 				  void *drvdata,
-- 
2.39.1

