Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0F3C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Nov 2022 17:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiK3RDX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 12:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbiK3RCo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 12:02:44 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBE2900FD
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 08:59:09 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bs21so28097947wrb.4
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 08:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WyB3ufPbqxDphL9azoYblwx5btpnokUgFLuY6XL+Nc=;
        b=Qw8vJln92qZi9+bWm/VwPlkXpqE5kbwSfK1vxtLp7CiiLYJGCnFsYMF9iIqjee5wts
         oEg9AJ5neOsdRnh7D/6OEy423m7+pl1CF+RSlkgB4v4fmTnvRcsBJRzbXqLvI5hjErHC
         QIQTTeqg3hjRX4gpFye81jXkqrUXz3hchQ4554l8j8w4ssnjC8jTDGIHGfBysn2V3v3g
         KjuOmpGKZTW56uLzTb0fic0oZh3IejPINgzLT6fh/p+mVsbixwBM6vJVlfPmjkmxmPh1
         z4pPgROgv1EUjqHs/+zInYqbozJ3PtwlGAWGnFv9eBoklyIsZm4n/9b2X9c1dQWb2adT
         jtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WyB3ufPbqxDphL9azoYblwx5btpnokUgFLuY6XL+Nc=;
        b=7k8eHDhdbyftje+6pip12aYMGlRj0K1r+5RBzVs0/vg0VJGBQxugu+2sXb5w3m+A0j
         JFkT5Ag9aL7cKzwm76oefjOvX4T0wBj6BjMAQjXsSy3PhIaJC+hz0+NeU5HLDTd73gTr
         VbREUt29Y30ypG4DuUwzCIdKI0vMyf8wcBo9p0eoaPOr5pdHG/Ov0YFOnyJ1/vTRhj4b
         LWmB5jkTl22/tBjbPzrFbuRpgXjOt6YZ4XHn1BpL8yyRi6gWXExjtzdcAjRiot2OgSbz
         0TkSMNvwQGymJv9LQUNFzjFWqwQoXliNXUEHgPYvuOkGEhO+nXit9LNrTSePhSLY4DNa
         PIug==
X-Gm-Message-State: ANoB5plmCE8apEvrSmK8ghPnTMF+6V/Wy7Bvn8EvLm5wu5y0ldDmW0tf
        nNwjpQ3RDWStA+Ardu/htomseA==
X-Google-Smtp-Source: AA0mqf4NiWlsIW8ZJF44oc20R+Q1yt9vhWAzRpzkMmQDj+R/2wnJ8xj6lHDYa3uJICsH/jDqHe0qIw==
X-Received: by 2002:a5d:49c5:0:b0:242:2fe2:ffa1 with SMTP id t5-20020a5d49c5000000b002422fe2ffa1mr1851739wrs.96.1669827544793;
        Wed, 30 Nov 2022 08:59:04 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id t67-20020a1c4646000000b003cfa622a18asm6066895wma.3.2022.11.30.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:59:04 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v3 1/4] hwmon: (pmbus/core): Update regulator flag map
Date:   Wed, 30 Nov 2022 17:58:29 +0100
Message-Id: <20221130165833.3478555-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221130165833.3478555-1-Naresh.Solanki@9elements.com>
References: <20221130165833.3478555-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add regulator flag map for PMBUS status byte & status input.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 95e95783972a..f5caceaaef2a 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2752,6 +2752,15 @@ struct pmbus_regulator_status_category {
 
 static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] = {
 	{
+		.func = -1,
+		.reg = PMBUS_STATUS_BYTE,
+		.bits = (const struct pmbus_regulator_status_assoc[]) {
+			{ PB_STATUS_IOUT_OC,   REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_STATUS_VOUT_OV,   REGULATOR_ERROR_REGULATION_OUT },
+			{ PB_STATUS_VIN_UV,    REGULATOR_ERROR_UNDER_VOLTAGE },
+			{ },
+		},
+	}, {
 		.func = PMBUS_HAVE_STATUS_VOUT,
 		.reg = PMBUS_STATUS_VOUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
@@ -2768,6 +2777,7 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 			{ PB_IOUT_OC_WARNING,    REGULATOR_ERROR_OVER_CURRENT_WARN },
 			{ PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
 			{ PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_POUT_OP_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
 			{ },
 		},
 	}, {
@@ -2778,6 +2788,18 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 			{ PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP },
 			{ },
 		},
+	}, {
+		.func = PMBUS_HAVE_STATUS_INPUT,
+		.reg = PMBUS_STATUS_INPUT,
+		.bits = (const struct pmbus_regulator_status_assoc[]) {
+			{ PB_IIN_OC_FAULT,       REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_IIN_OC_WARNING,     REGULATOR_ERROR_OVER_CURRENT_WARN },
+			{ PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
+			{ PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_OVER_VOLTAGE_WARN },
+			{ },
+		},
 	},
 };
 
@@ -2834,14 +2856,6 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 		if (status & PB_STATUS_POWER_GOOD_N)
 			*flags |= REGULATOR_ERROR_REGULATION_OUT;
 	}
-	/*
-	 * Unlike most other status bits, PB_STATUS_{IOUT_OC,VOUT_OV} are
-	 * defined strictly as fault indicators (not warnings).
-	 */
-	if (status & PB_STATUS_IOUT_OC)
-		*flags |= REGULATOR_ERROR_OVER_CURRENT;
-	if (status & PB_STATUS_VOUT_OV)
-		*flags |= REGULATOR_ERROR_REGULATION_OUT;
 
 	/*
 	 * If we haven't discovered any thermal faults or warnings via

base-commit: 9494c53e1389b120ba461899207ac8a3aab2632c
-- 
2.37.3

