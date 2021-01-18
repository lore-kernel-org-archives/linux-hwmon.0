Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0952C433DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Jan 2021 17:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A9E422CA2
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Jan 2021 17:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436746AbhARRqo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Jan 2021 12:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407197AbhARRjr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Jan 2021 12:39:47 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE29C0613D3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Jan 2021 09:38:59 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q18so17285797wrn.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Jan 2021 09:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=9DsbzojBVFKuQ48xkTo4URNA+UO51ULaaDoVeAXSBBA=;
        b=P8YxMFky/mImBavbpo7nJwdUt/1ifWSE4KBf/sPnkT27LpA0jX50OVfzcgYE3urnZm
         /zIzAmTU+AffMrzt0s0DAw+P7SsU2INfZnLvfwmJLOd+Mh8CyyZdXTsXGoZnwuy72WGj
         cZXqT5I+WLIWRhIXvI6pXoAHV4BIk4byowE5X+6kRfSfrxkO5WYc9xwkQyeDKSJjrVvO
         60AicgS6UW0FTFUl5rmuHTtkW5iAY+MfSNHdfrsqgIzQa7UcxvPYqahyXujM0CfRceuX
         bECOxxao6O1vJZJaQOkXpEkHCG7Bo/m2+HidxOw1ZO+nvXEOsllmTf8zpi9D/O+vt2El
         PwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9DsbzojBVFKuQ48xkTo4URNA+UO51ULaaDoVeAXSBBA=;
        b=sktb0e4EGG7AK/giulYlX40//srr1Kpe4Y6czLG40o0oYtOz3v4F9UK8htv4twi3iN
         1TdZDt8+AEiuGXWCsFXuxBad3m1f5qxrGMaiSvp4xUkMac4l0jx57dPswNZXPhZmsbd4
         PL/2YF0Ys6FlXXZryopFq2mIft/IFbvy/kanOr/uUoe//Uk8x22/g4RunfCtUElY848I
         Jt5arpP5oNPNZcKBH3gu+I2irXeSqe81Fab9/6miFJ1YXD2witWhiaT3VvtnoFn+Bi8P
         SvCJfqZbNpFDLDIsr5jjRYoe/oigyo9Fq3duBY3wHxwLa+r16skqUhUfaJFw8ukRNi62
         L71w==
X-Gm-Message-State: AOAM532MIZyB+uDMX3m7gk0nix0f6ldGbz58RXxO4Zk5+pv67UiI3e3S
        KiP1vVvC/YNYDfEGeHh0Bq40IA==
X-Google-Smtp-Source: ABdhPJyq2aDkR1RLYe+jp7iO6xkLOP6P057ChtKd77qUmfHOQxOSPMkiPb9UzfN72DeGoGnHUzowUg==
X-Received: by 2002:a5d:4882:: with SMTP id g2mr541856wrq.273.1610991537677;
        Mon, 18 Jan 2021 09:38:57 -0800 (PST)
Received: from localhost.localdomain (lns-bzn-59-82-252-148-144.adsl.proxad.net. [82.252.148.144])
        by smtp.gmail.com with ESMTPSA id o8sm30042848wrm.17.2021.01.18.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 09:38:56 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rui.zhang@intel.com
Cc:     Guenter Roeck <linux@roeck-us.net>, Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Amit Kucheria <amitk@kernel.org>,
        linux-hwmon@vger.kernel.org (open list:PWM FAN DRIVER),
        linux-kernel@vger.kernel.org (open list),
        linux-amlogic@lists.infradead.org (open list:KHADAS MCU MFD DRIVER),
        linux-pm@vger.kernel.org (open list:THERMAL)
Subject: [PATCH v2] thermal/core: Make cooling device state change private
Date:   Mon, 18 Jan 2021 18:38:24 +0100
Message-Id: <20210118173824.9970-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The change of the cooling device state should be used by the governor
or at least by the core code, not by the drivers themselves.

Remove the API usage and move the function declaration to the internal
headers.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pwm-fan.c          | 1 -
 drivers/thermal/khadas_mcu_fan.c | 1 -
 drivers/thermal/thermal_core.h   | 2 ++
 include/linux/thermal.h          | 3 ---
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index bdba2143021a..0b1159ceac9b 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -378,7 +378,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
 			return ret;
 		}
 		ctx->cdev = cdev;
-		thermal_cdev_update(cdev);
 	}
 
 	return 0;
diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index 9eadd2d6413e..d35e5313bea4 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -100,7 +100,6 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 		return ret;
 	}
 	ctx->cdev = cdev;
-	thermal_cdev_update(cdev);
 
 	return 0;
 }
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 90f9a80c8b23..86b8cef7310e 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -65,6 +65,8 @@ static inline bool cdev_is_power_actor(struct thermal_cooling_device *cdev)
 		cdev->ops->power2state;
 }
 
+void thermal_cdev_update(struct thermal_cooling_device *);
+
 /**
  * struct thermal_trip - representation of a point in temperature domain
  * @np: pointer to struct device_node that this trip point was created from
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 1e686404951b..6ac7bb1d2b1f 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -390,7 +390,6 @@ int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp);
 int thermal_zone_get_slope(struct thermal_zone_device *tz);
 int thermal_zone_get_offset(struct thermal_zone_device *tz);
 
-void thermal_cdev_update(struct thermal_cooling_device *);
 void thermal_notify_framework(struct thermal_zone_device *, int);
 int thermal_zone_device_enable(struct thermal_zone_device *tz);
 int thermal_zone_device_disable(struct thermal_zone_device *tz);
@@ -437,8 +436,6 @@ static inline int thermal_zone_get_offset(
 		struct thermal_zone_device *tz)
 { return -ENODEV; }
 
-static inline void thermal_cdev_update(struct thermal_cooling_device *cdev)
-{ }
 static inline void thermal_notify_framework(struct thermal_zone_device *tz,
 	int trip)
 { }
-- 
2.17.1

