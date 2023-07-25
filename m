Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E75DC001DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 12:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbjGYMua (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 08:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbjGYMuA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 08:50:00 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DA3DB
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 05:49:59 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992e22c09edso802066766b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690289398; x=1690894198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xD2BSNpw0ozN3thb1dtWBEB8CA/Y2iCKwoB9ihfmKUM=;
        b=CyA3oOnxu6kKFadEHW0nl87UpGvrgxftxDTDoXqbGMsHE4Cg/jm0vshSVPLmZg+Zed
         ukEjtajE/L52c49bGBEIAY3AsizeBwaSoGR8qtTAsPBFfcyG2XjT5xl+l8DNURtesPd8
         V4D/GiatML/j4CGnL2xwc/VZoPaJRz8MCd2pR8EhgcZKmv6XCnCfQRhRH4XOB33Gzz77
         skKwgd7MtV57ot/CuiLGPhuD7SVLTrNUOLWwQmKmzDscrYb2qSHFePgeRlzItlF7HO+h
         fNXALOL+jVQ2mNzqFcQNFVB58Lz8h6AQv9IJUC9OX3sM18xuNiF+XFh6Y2yYRAp+BL7b
         ojaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690289398; x=1690894198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xD2BSNpw0ozN3thb1dtWBEB8CA/Y2iCKwoB9ihfmKUM=;
        b=A4UJkCmpwlzeDNsLNLKLwjgVQHJIFg/Zx+JCNMrlfvqNi1A8EJXSINCj9anof6lrZb
         2X7qpnD9guvmM1gIAYARZd1eZHW3LWNLIXkgPXyO5CKZUOqqbybZb9yuWVv4xm1fdneu
         HPmVh9Qg50CTQwXkqac1kcVxaOC+efwIHPfjda+sgetuNQ3xgdB3dwa1KtKnYEws2mxg
         d480ewBBATp51cKd67I2TuWQmp21FkNOT5/euuPQGpTnhdNqxakl/CxaUjOHHkXn7BrE
         z07V6Y1vTfkMeX3Vr8cyguSxrV6caj+I8H3Aiy0aYgPDA7GzwiQr5sw9kU9W+hJSechU
         8VIg==
X-Gm-Message-State: ABy/qLadqlplgzTeOM3pcsBp5spJGQGTp6i8Imlg0Yk1SwZ/WTIWamc2
        LPdGkYz1P5AcammSe1/3AoZNsw==
X-Google-Smtp-Source: APBJJlH/tXsXGJIg2N12sB8I8FJLfQp1OsrtZ/qwRqpCJrIY7lSBsnsEl7zMMes9pll+6uW+9uX9kQ==
X-Received: by 2002:a17:906:76d0:b0:991:d05c:f065 with SMTP id q16-20020a17090676d000b00991d05cf065mr13329973ejn.52.1690289398013;
        Tue, 25 Jul 2023 05:49:58 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id pk15-20020a170906d7af00b00997e8b6eaa1sm8133283ejb.41.2023.07.25.05.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 05:49:57 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pmbus_core: Fix NULL pointer dereference
Date:   Tue, 25 Jul 2023 14:49:51 +0200
Message-ID: <20230725124954.3824954-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725124954.3824954-1-Naresh.Solanki@9elements.com>
References: <20230725124954.3824954-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Pass i2c_client to _pmbus_is_enabled to drop the assumption
that a regulator device is passed in.

This will fix the issue of a NULL pointer dereference when called from
_pmbus_get_flags.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 42fb7286805b..1f7df36c48a8 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2745,9 +2745,8 @@ static const struct pmbus_status_category __maybe_unused pmbus_status_flag_map[]
 	},
 };
 
-static int _pmbus_is_enabled(struct device *dev, u8 page)
+static int _pmbus_is_enabled(struct i2c_client *client, u8 page)
 {
-	struct i2c_client *client = to_i2c_client(dev->parent);
 	int ret;
 
 	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
@@ -2758,14 +2757,13 @@ static int _pmbus_is_enabled(struct device *dev, u8 page)
 	return !!(ret & PB_OPERATION_CONTROL_ON);
 }
 
-static int __maybe_unused pmbus_is_enabled(struct device *dev, u8 page)
+static int __maybe_unused pmbus_is_enabled(struct i2c_client *client, u8 page)
 {
-	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int ret;
 
 	mutex_lock(&data->update_lock);
-	ret = _pmbus_is_enabled(dev, page);
+	ret = _pmbus_is_enabled(client, page);
 	mutex_unlock(&data->update_lock);
 
 	return ret;
@@ -2844,7 +2842,7 @@ static int _pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flag
 	if (status < 0)
 		return status;
 
-	if (_pmbus_is_enabled(dev, page)) {
+	if (_pmbus_is_enabled(client, page)) {
 		if (status & PB_STATUS_OFF) {
 			*flags |= REGULATOR_ERROR_FAIL;
 			*event |= REGULATOR_EVENT_FAIL;
-- 
2.41.0

