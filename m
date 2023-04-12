Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB47C77B6E
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Apr 2023 18:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjDLSWT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Apr 2023 14:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjDLSWS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2023 14:22:18 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7E9B7
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Apr 2023 11:22:17 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id 21so4098879plg.12
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Apr 2023 11:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681323736; x=1683915736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ+VbT8J+ll7BalmEF0l9WNrlwLSWc9wDs6vDknhbiA=;
        b=MaeNwXyEtcZrzDhbS7Z5jPschRhmgLQtpaFGtesN7aN3g4/9llpARxrrLM2l+0nywX
         nayxRqKaARBjQ5UqHT3S6nHUZNcHj6TGx/LTK6fkHgiY5Uyd154JqbD+asbCvJPoTYpj
         GoZnEG/MGaxg1Ag4JTKEp7nN5h+xeGt8/xqx9VCpS+Dabm9vssGLC56Q4wXsG2hXI3SX
         ymGHFdulMjGUcaiMwPi5lVu6neh699lK7zQxLKnbpZ/NhvajeFghh6SpvafvVu1+FDPI
         BfOq6b1l5C9KxvVaazelEqzNdsPoEXg6tQauTXpvFVVS3GbJXGnYn5ehX/iFOvtOcDdM
         kCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681323736; x=1683915736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ+VbT8J+ll7BalmEF0l9WNrlwLSWc9wDs6vDknhbiA=;
        b=c/qcQp+LAy3konNVN1ammSnAtq/Y0gBdg5loTvnTwlU94c9NW+zBoKyzSpP9rZ4Y2M
         aV+H+UKTdezT5CfYFeATj1brtoTpqrtXmO/TuSuO/+fu5s6Rl4t72ApeoaIoQM6a9ROh
         hCwewsDVmK0c7dl16jJZLt7w37eUJNW8m+GNB/kQAaAJPrNSHeeaEhPVNE+MS7tApFi/
         dRuPXq1ESIsSMQTTo2Gd8NHf3xsFUx0lqsnXfYFyR+NNVtchveBoBYq9h1wCw3U7ThMo
         bH7SCOZWyycNuu1b4NqQnwu6mdo98J2I8GoxKBsqd9QY56LgV+bQoEqGbvw6YR3ngmQf
         BVhQ==
X-Gm-Message-State: AAQBX9cYi3B6eDI5HhknRZfzfbdgR3402EjHW/QT2hyx1gAxmzSzf2TL
        0SMKniR7ccquiBfH2NEanyrYRbvPJok=
X-Google-Smtp-Source: AKy350aGvwqywlVeQtLWkohaezBxtfoKDkLcXlZtnv3Wv0gbOmOTRRxmnVyggqfvnPf2mIYXu/xMDQ==
X-Received: by 2002:a17:903:41d2:b0:1a5:1e15:9291 with SMTP id u18-20020a17090341d200b001a51e159291mr8903717ple.22.1681323736297;
        Wed, 12 Apr 2023 11:22:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902bf4c00b001a64fb8cb21sm4300436pls.237.2023.04.12.11.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 11:22:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        kernel test robot <lkp@intel.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH] hwmon: (pmbus/core) Request threaded interrupt with IRQF_ONESHOT
Date:   Wed, 12 Apr 2023 11:22:12 -0700
Message-Id: <20230412182212.2672455-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

0-day rightfully complains:

drivers/hwmon/pmbus/pmbus_core.c:3164:7-32: WARNING:
	Threaded IRQ with no primary handler requested without IRQF_ONESHOT
	(unless it is nested IRQ)

Without IRQF_ONESHOT, the primary interrupt may end up in a loop,
and the threaded interrupt handler may never execute. Request interrupt
with IRQF_ONESHOT and assume that the interrupt will cleared and re-enabled
by clearing the fault condition in the threaded interrupt handler.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-hwmon/6436efbb.08+e+yEDqvRxvHDP%25lkp@intel.com/T/#u
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Naresh Solanki <Naresh.Solanki@9elements.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Patrick, Naresh: please let me know if this is the correct fix, or suggest
an alternative.

Thanks,
Guenter

 drivers/hwmon/pmbus/pmbus_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 86cc8001a788..bf561277c430 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3246,8 +3246,8 @@ static int pmbus_irq_setup(struct i2c_client *client, struct pmbus_data *data)
 	}
 
 	/* Register notifiers */
-	err = devm_request_threaded_irq(dev, client->irq, NULL, pmbus_fault_handler, 0,
-					"pmbus-irq", data);
+	err = devm_request_threaded_irq(dev, client->irq, NULL, pmbus_fault_handler,
+					IRQF_ONESHOT, "pmbus-irq", data);
 	if (err) {
 		dev_err(dev, "failed to request an irq %d\n", err);
 		return err;
-- 
2.39.2

