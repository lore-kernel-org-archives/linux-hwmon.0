Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B75C468BD
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 20:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEEC820868
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 20:30:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6q0CjEy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730091AbfFGUah (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 16:30:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45367 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbfFGUah (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 16:30:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id w34so1717417pga.12
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 13:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IawoHpcm2yDTDm6rV1CuFi4J7WuWEOEooBRwSH26MYg=;
        b=W6q0CjEym4NgwkT6iPKAlJCEPwFzFnB/suUJR4oAXoFLw65SqnGx5tyDQLQXRsIuKI
         PBW7kMpzgXGgm03y6MLHgMiaVvPvasml8lGjghxoxOKrbURhHYCKCEzbuST24xTv47qO
         gv5/j91d3tJ/sF1SvKkceXerEy3vtdkd0uky5nDNRt1qcpdJA2vbexO8KjiUKXKQrC94
         eQqVmAlmUTz1rwuA8ouRHrveYenUe+pykoljn7SBVMPB2ctCIizPj1CZ5E8QyxIsfGlB
         kVEXQ9tj/mFmqQbCZLp0SCTfz+Qp+yMLsEzo4DNrIEh7jC1Q3EwGXoiWcY/GCkWKfwuZ
         haSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=IawoHpcm2yDTDm6rV1CuFi4J7WuWEOEooBRwSH26MYg=;
        b=DTwdH89qqE6z4zoRyalEhID3FfvrDK0RTjoP02TSij3vQTV2JUa6lXtFup7FkWWPJ4
         TpDfVlysiD7tDpPl0ZiyxnOc+e0F+GdjylUGQFKvqAdPbcvYWq+z9nS5UJXrbBkyfq8v
         2YqGcy0PFRoM+CarzJzAKPHW/krNC3WbzrWXtVrgHye7NLwzmA8qnoxAES41hEjISvDe
         jkcnW6NYcVw6QoSb7VZmr0O1iwBJMMQA9Y+JrUTO4A6Uytvk8eeuzwh0tBTZTpiNrEgq
         N8j13F1a+I9QqQBvPrXnhLeEmIba/mB27X1QTbFGas3MnV15mL+TG+bi5vxKS0/YXr0H
         RG8A==
X-Gm-Message-State: APjAAAWQspAdJk5GKZdwmdorH4CKaj6PrLj1CiwshzqIW3Fxz5tRg9EM
        2N6jY6419twPyWZ4lBS+vDjqGOEo
X-Google-Smtp-Source: APXvYqzOi64abK8A2eYhzzXetTF5/AUV1rteom+kJ6Cpv+7QprqpSLWB/ceUz8J4yZV/81hgyK9lLA==
X-Received: by 2002:a17:90a:1b4c:: with SMTP id q70mr7581661pjq.69.1559939436867;
        Fri, 07 Jun 2019 13:30:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i4sm2724015pjd.31.2019.06.07.13.30.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 13:30:36 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (pwm-fan) Check return value from devm_add_action_or_reset
Date:   Fri,  7 Jun 2019 13:30:31 -0700
Message-Id: <1559939431-18731-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559939431-18731-1-git-send-email-linux@roeck-us.net>
References: <1559939431-18731-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

devm_add_action_or_reset() can fail due to a memory allocation failure.
Check for it and return the error if that happens.

Fixes: 37bcec5d9f71 ("hwmon: (pwm-fan) Use devm_thermal_of_cooling_device_register")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pwm-fan.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 08c9b9f1c16e..54c0ff00d67f 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -320,8 +320,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
 			dev_err(dev, "Failed to enable fan supply: %d\n", ret);
 			return ret;
 		}
-		devm_add_action_or_reset(dev, pwm_fan_regulator_disable,
-					 ctx->reg_en);
+		ret = devm_add_action_or_reset(dev, pwm_fan_regulator_disable,
+					       ctx->reg_en);
+		if (ret)
+			return ret;
 	}
 
 	ctx->pwm_value = MAX_PWM;
@@ -337,7 +339,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		return ret;
 	}
 	timer_setup(&ctx->rpm_timer, sample_timer, 0);
-	devm_add_action_or_reset(dev, pwm_fan_pwm_disable, ctx);
+	ret = devm_add_action_or_reset(dev, pwm_fan_pwm_disable, ctx);
+	if (ret)
+		return ret;
 
 	of_property_read_u32(dev->of_node, "pulses-per-revolution", &ppr);
 	ctx->pulses_per_revolution = ppr;
-- 
2.7.4

