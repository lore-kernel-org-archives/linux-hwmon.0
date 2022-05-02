Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66DBC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 12:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385075AbiEBMq3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 08:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385068AbiEBMq2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 08:46:28 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAAA13EA8
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 05:42:58 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id p7-20020a05600c358700b00393e80c59daso7646620wmq.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 May 2022 05:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YRohQUQY1r31dYmkznaNZNn9Fl2VO85KxdP3sYAcMUM=;
        b=k9grHfbrrC3FM3EZ8uwO6c1lhprHP1M2ungmO+8k/CJj2KtYZSeJ8Lg1mMyyYAYxJj
         dY9P2H1sTs03loGURWfIpkZ7CZFYb4xYofBngTa8OQYrGh2P2g1aZ+Muuju6kEdxur5J
         ewoGAM3NtEPvfxaryq05U+PUVM4gebpKVCGA0uostgLf4hCCpPl81yLDlgk9dDu8AuAX
         o2PPyeto0Ugr2/P/SL6PG5Y9YlkiE3VQHuDBFqCcxrX4xVlOx+TJ1SRbUKQvFDFfzjBB
         It5y6XhzOBi7wIv/1hMWqdLvDsSPcNHi1Z7Hr+v5vhiLae1BebzWpM1DD+iAkbbvCyjY
         LpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRohQUQY1r31dYmkznaNZNn9Fl2VO85KxdP3sYAcMUM=;
        b=E6ioT4rZJdMOJdwQ8v6dIn1dsmQFFmiSTbxLyExA6hkkQTz1J4GCbc+FVR8+MzSeXg
         7curWWsZ12FVJktl/64yn2HHSkf9QUEWt8aYmDohwY6fgBk4vEVxHNqwiDiH+Z44yfHg
         rLXrI0eZchpVTy+8+JPVPRFDYB0Cg4TBxQ9BzRXa7FgMUCcEkmHodNVjXNqr1g5buzuN
         zNCP6YtOZ08ErDiDMAR6clL8jZEFv/bZil3yolya2WO99MYXuxWOU0vLkwqPo/fZoBLU
         xRLFpLQWOsOo+1iT+dHcpR57iTcTFRky4XXpcDagGpNuVjZiDS39Vu4lx/0kBw+V4doz
         sXKQ==
X-Gm-Message-State: AOAM530taYTtwdErV5zVDeE9Uk38ZBQLnp2VQSJSDGTcbNEtw64TSS4u
        5N088Vbvw1qS4DjNDXVjeSNxk/N8eFLICw==
X-Google-Smtp-Source: ABdhPJw/0Id57UK+1QzuBmq0NXZmplKf9bzx/9jA+FdfPUEAhchgkqFRMVKmr4Oh4lVZ9XOO0oCsIQ==
X-Received: by 2002:a7b:c082:0:b0:394:3a45:bcc5 with SMTP id r2-20020a7bc082000000b003943a45bcc5mr4132421wmh.138.1651495376833;
        Mon, 02 May 2022 05:42:56 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id n10-20020a05600c294a00b003942a244f30sm6254680wmd.9.2022.05.02.05.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 05:42:56 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/2] hwmon: acpi_power_meter: convert to hwmon_device_register_with_info
Date:   Mon,  2 May 2022 12:42:49 +0000
Message-Id: <20220502124249.682058-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502124249.682058-1-clabbe@baylibre.com>
References: <20220502124249.682058-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Booting lead to a hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
So let's convert the driver to use hwmon_device_register_with_info().

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/hwmon/acpi_power_meter.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index d2545a1be9fc..98293727f980 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -891,7 +891,10 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	if (res)
 		goto exit_free_capability;
 
-	resource->hwmon_dev = hwmon_device_register(&device->dev);
+	resource->hwmon_dev = hwmon_device_register_with_info(&device->dev,
+							      ACPI_POWER_METER_DEVICE_NAME,
+							      NULL, NULL,
+							      NULL);
 	if (IS_ERR(resource->hwmon_dev)) {
 		res = PTR_ERR(resource->hwmon_dev);
 		goto exit_remove;
-- 
2.35.1

