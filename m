Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF30C4321E
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Nov 2022 18:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbiK1SwT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Nov 2022 13:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbiK1SwT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Nov 2022 13:52:19 -0500
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420BC18B07;
        Mon, 28 Nov 2022 10:52:18 -0800 (PST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-13bd2aea61bso14203189fac.0;
        Mon, 28 Nov 2022 10:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4d6e/poia8EJLhp/tI1ugk9yl6fSii07DeeYRHBuBKM=;
        b=AkSl7pbbC7gxPQsyfK9IRFQjP0ZsGb38KcqF+RcguOtxCaztlv8szuQDErf1ewCn7d
         XJheoDTh4rCqVjm8/PcNJm5ZEvyAZn+mqVzrPG7rbJ20o+qDmKWBqCM8LxXN2VFlkbR9
         TUpX7BSxQtxP9niHx5g/ACN6su8dyfzJ8/g3NE8lXkoSvJqaOPQkqzgB7zHsAp9GlO+w
         2X3h3mV/Yhiy1PJyryP3snm7EqKEQWUgb6F5Q3i4Lggcd90o4cw7ujpb+abq47ieqhCl
         x0N7QFg0CtnIzdMROYkSMRLLZgZxV/sEGCO32cSGCUf3NFufxW9KH9/5dphiRqeVay/K
         bAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4d6e/poia8EJLhp/tI1ugk9yl6fSii07DeeYRHBuBKM=;
        b=0jCf7MzVYnvw5UZ9TH1oi1AlkyT6nLey2OJS+zVp2uUqRQ81Gq6qbWL4erNWX7Q9Df
         Jyy1Jfi6U2ZQOI7Cqg135qK0SBkbH2Dj13UsGhuoTfwvuWOryea0KK49eDwyl/CO8pMH
         pJhqWt7aY9AO3W0LrlYM1LkCrk7Wi8EMeK0GyWngzYcoR66kmzhWD4SYQlQkzZ+uY0um
         CK6CXsCRbEk1JCkwk7cR5kxA+cmuRFq3Wst/n1Zpn4+YmP9CdiqkohvV93X5fTlFgQIL
         nSk9eknIw1VhgTF5RZM/AKJFOZOMowF0ELblaKr8iKvJYOTm01YDkfUj2PcaONL/vDCW
         yQwQ==
X-Gm-Message-State: ANoB5pmNv/BiMliYjnOkudy57HJ/qvLXlbByFjfJLSRQufxAx13DoFDm
        ZMy5xr3NK4XD1G3hZbVrs2QXgMYmvmI=
X-Google-Smtp-Source: AA0mqf6+uMeW5QMdcGRKxwjPKFFYoUZ9wxLKFY1AqBoi5c64KnitblUO2RHgpGoy0AjxQqSPb6ha/Q==
X-Received: by 2002:a05:6870:e88:b0:142:9422:84e4 with SMTP id mm8-20020a0568700e8800b00142942284e4mr21032215oab.57.1669661537513;
        Mon, 28 Nov 2022 10:52:17 -0800 (PST)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
        by smtp.gmail.com with ESMTPSA id s191-20020acaa9c8000000b003546fada8f6sm4615340oie.12.2022.11.28.10.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 10:52:16 -0800 (PST)
From:   =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
To:     w_armin@gmx.de
Cc:     hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux@roeck-us.net,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        pobrn@protonmail.com,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
Subject: [PATCH] hwmon: (oxp-sensors) Bugfix pwm reading
Date:   Mon, 28 Nov 2022 15:52:06 -0300
Message-Id: <20221128185206.212022-1-samsagax@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PWM reading is only 1 register long.

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
 drivers/hwmon/oxp-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index c04277676b72..f84ec8f8eda9 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -158,7 +158,7 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_input:
-			ret = read_from_ec(OXP_SENSOR_PWM_REG, 2, val);
+			ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
 			if (ret)
 				return ret;
 			if (board == oxp_mini_amd)

base-commit: 9494c53e1389b120ba461899207ac8a3aab2632c
-- 
2.38.1

