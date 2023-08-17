Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB89CC2FC1A
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Aug 2023 09:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349529AbjHQJZz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Aug 2023 05:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349559AbjHQJZg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Aug 2023 05:25:36 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8152D4A
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Aug 2023 02:25:33 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so68282875e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Aug 2023 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692264332; x=1692869132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDYTjOqD9a7nigPaAwe0v/hIS9KrkksYARbZO5uDh1M=;
        b=ghcI2ri+K53r4/l9Yj61XMf1NFBBWoQXz/nXujh3NrmNp3qqpegOPcDYRMQE9JdbJo
         GNJGQ3EQ0l68OxnVs4BxRPjomKLlnzZpQTy+2UgNVJj43K+Gir77jzVNM+rmlUrSkXBw
         pSA9hUhCHBZHt6K6KDWJRU6p6C84N5lyajDBUQl1vBnGtzakVccAkMQT/N8nJ2snS5YE
         jUGxCgL0s/Uv5iiGkvUkyTcAs0MOf8N5h1Sro4fGCSdw8EJZhCwT8GE5Od+wesMiU6AF
         8Fg/TfgExbdUiSbv1dl5yc2FbbpQUtPnKfmfqH9d2Biv0EcqX2QfpeA4fqO+eAmeu1qT
         a3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692264332; x=1692869132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDYTjOqD9a7nigPaAwe0v/hIS9KrkksYARbZO5uDh1M=;
        b=G5wHlP1FIJGVlLdy5OYxfrFFZM40VDQ3WL7W4SZ7XY5eEQpFW36e7qz7q6kfyvOyGx
         s5AqiTQCGN89iEYXRsvERiC/eF/ncOaavaBcSsof9Qaaewl7ymVDx4egdjC2utkOuU8l
         JSDljonFKly4Df3wEz/DwUH/1Iv/dYJAx/HQJ5OiOXRV0unjJ8QUE0U+UQKPh7UWj/bw
         43ccZ//6BIIxgsCNWKZPvm0gd6zBE/yI48X334EJt5ZepFegQnm4I4HWIesq7qL1t3Z9
         /OJ302ugBlKdQzEoscJD0qUPdJMfEImMsN18845g2NJhnkQC+XHlDJQspNvAQdwEMk9o
         x4bw==
X-Gm-Message-State: AOJu0Yyl+IW0pJKV7wGmwq9ynWBxkGnatlWmxW1J4x6IKtSPakjVxLyi
        W33FeHJ4ysT1O/wrqlaBckHhRD4ZsTrboRFfB21ZLg==
X-Google-Smtp-Source: AGHT+IFmFTcexEqwbWm8wdjByrW9Bzndus23V4XdfarvKrp8GuW1ZndlP+l/yUgoFoMPEpyHyhwMBQ==
X-Received: by 2002:a7b:c307:0:b0:3f9:c0f2:e1a4 with SMTP id k7-20020a7bc307000000b003f9c0f2e1a4mr3437772wmj.34.1692264331852;
        Thu, 17 Aug 2023 02:25:31 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id x10-20020a05600c2a4a00b003fc00892c13sm2227934wme.35.2023.08.17.02.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 02:25:31 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwmon: pmbus: Reduce clear fault page invocations
Date:   Thu, 17 Aug 2023 11:25:24 +0200
Message-ID: <20230817092527.808631-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Observing I2C traffic revealed consecutive transmission of CLEAR_FAULT
commands. While this doesn't cause issues, it extends driver probe time.

Avoid invoking pmbus_clear_fault_page for virtual registers, as they're
managed by the driver, not the chip.

TEST: Verified using an I2C bus analyzer that only one CLEAR_FAULT
      command is send instead 5 in a row.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 69a4e62b6c8d..cbfabdd69056 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -561,7 +561,8 @@ static bool pmbus_check_register(struct i2c_client *client,
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
-	pmbus_clear_fault_page(client, -1);
+	if (reg < PMBUS_VIRT_BASE)
+		pmbus_clear_fault_page(client, -1);
 	return rv >= 0;
 }
 

base-commit: fc8df28be7155ddcf8731b4c85fd3372811ba5ac
-- 
2.41.0

