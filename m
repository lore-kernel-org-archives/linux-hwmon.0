Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E538C77B76
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Apr 2023 11:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbjDRLcb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Apr 2023 07:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbjDRLca (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Apr 2023 07:32:30 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB4F4221
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 04:32:28 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-2eed43bfa4bso2187871f8f.2
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681817547; x=1684409547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SH6qJUfWL9zJ79gRC7zWLV6OUPZJsPitBsnwEKwZJzc=;
        b=dYUwrH3cwlb/VxM7YYjAPDY7d/PWsWZ/ahEUtKV2iEx7AIXgFCrrdTZXOwllrCJKk4
         srvp+L2cb/LktGtpfu5JSBX4pUGDwDShUHIN6jCGJTax2V2m5sO22+0vljXw4Iq/w6gS
         37D5Br1I1D8fcOgYJbpfgwUXQUHIkJR1uXMqHp3HyBOylbE5VJaBcF6OAfP34b/tQqgc
         96kCNRXyfTxcMfuE4BxW1kTgICp/XQljEdZ376ffZd3ERJc22tW7BlkXvm0lk6axHOm6
         49Aeeh50xLWdUPqeSyqwi3O10KWRFvU1MD2Baya16XDu9Z9diOwGvkXNmCbFKY/i4+df
         0qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681817547; x=1684409547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SH6qJUfWL9zJ79gRC7zWLV6OUPZJsPitBsnwEKwZJzc=;
        b=SqQhClJsPytK2RWcvL3Rd9u8M2wnRQoFhWwazKHUbzqMU5Q9Xhr3TDn5t5iq7zxQ37
         uRUlDy1OIT6Qoy83ghcXUYJh8EpUAnqCL1SaF9wD9St7pBm4pzonBmaCcglhgH4EH4X2
         GeoK1xRBrSRMlA8RW7o67nALBY/pHTw2pjaas9FtHZNm+A4fZO+qSymRFT1m80/l46fN
         h0us/E1/mXraGSjUKy/S/FbdAqHiogUoHvWhawgGLmC+0c9e7fE5eel8VaZpYKmUBND2
         K9tX/iTYOYIFX2SC2xJ0TqEQgWX0hEU2mGn0d7k/KAXkPqtw0yWEGjT8q7MGQS37YM5D
         zBFQ==
X-Gm-Message-State: AAQBX9cOuZwImdcNyGhw8hTbNcyupnzGYVTMR/J4Sq4jNSyNOr+Zze95
        3brtdpuy2QG2k23y+Hr/HijmB3U5BDJ9Yc0QgtWpoA==
X-Google-Smtp-Source: AKy350aMjaf6xGbP/S2Z5Z9i+emE+iz2bk11Y03Ha/+prgGlprwQ0eo2pRL8eH3nq2LMMAa+9bdzxg==
X-Received: by 2002:a5d:688e:0:b0:2f8:f775:c885 with SMTP id h14-20020a5d688e000000b002f8f775c885mr1543151wru.6.1681817547289;
        Tue, 18 Apr 2023 04:32:27 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id z18-20020adfd0d2000000b002da75c5e143sm12901633wrh.29.2023.04.18.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 04:32:27 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (max6639) Add compatible string
Date:   Tue, 18 Apr 2023 13:32:17 +0200
Message-Id: <20230418113217.781524-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230418113217.781524-1-Naresh.Solanki@9elements.com>
References: <20230418113217.781524-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use maxim,max6639 as compatible string for the driver.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/max6639.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 9b895402c80d..ada410bfb7b6 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -618,11 +618,17 @@ MODULE_DEVICE_TABLE(i2c, max6639_id);
 
 static DEFINE_SIMPLE_DEV_PM_OPS(max6639_pm_ops, max6639_suspend, max6639_resume);
 
+static const struct of_device_id max6639_of_match[] = {
+	{ .compatible = "maxim,max6639", },
+	{ },
+};
+
 static struct i2c_driver max6639_driver = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		   .name = "max6639",
 		   .pm = pm_sleep_ptr(&max6639_pm_ops),
+		   .of_match_table = max6639_of_match,
 		   },
 	.probe_new = max6639_probe,
 	.id_table = max6639_id,
-- 
2.39.1

