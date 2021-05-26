Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49800C47088
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AA12613D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbhEZPmR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 11:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233819AbhEZPmM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 11:42:12 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB5EC061756
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:39 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so1408861otg.2
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pPQLkKkMQ3uWimuyAs10pPH0N/fVipRIkvuWmS5PZNU=;
        b=vWm1J/OQzHg0y2KCs2geYQ+ZLnvjbuqWr1HXg0wGpH7l2eY4ro6VTluvYGdr2iBmQR
         QHTriiBejbfpHTuzFquuCuOPc6yQnmykc7DgjQ41/i+Z9+cptyp+aIeNu1B18yaJmnzd
         7FG0IoSovzTMo6SgkAd+XVPFs/NoveHPqL0cCoHTD1J2e2k2/S8EJ2hYlL8msFK8b0R8
         InBpsmSwulQNPUMCW+4W+03QUTKwr29ERvXonrnvFPhSxWYzJUHt2HB/00ZOEVZr0G9g
         8UCpmfR62WMMwE1G5njRssTeDxVxraMS6H0m1PLVg/4UTjqUo8FGn1KTMYwXlHyK9KOi
         zJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=pPQLkKkMQ3uWimuyAs10pPH0N/fVipRIkvuWmS5PZNU=;
        b=LllWcxBx5wbTUYPOWzWunEVB9Q+VJLQChHQ7w+AWFDscc0YjuuGRKGOyl9LLGiwqkn
         PbPIJz6V2IDsFBGqtauN99zR7BQ3lNmrhAD7uBksNDCR6WnLsFwO3uWktzc0OS/stB1v
         RsatMYRMiamcK4f+j6yCREY5TWOr7QA1Ksi0oiG/xjXfZpCnO2bV0siw75vQgHuBuRGb
         0vrlUM7Ag9h0I1Anw+4XafWyG2dqtI5S9rzs6XHSADTw6aHttjsX4aKaN4X/sBh22NVk
         g7fCl4cIPHioDlJhkcqVMvzKTLcB01dHIUoGd9/9jCEIZt9NZnxQYGJTJEuhIRMIOFPQ
         c8bg==
X-Gm-Message-State: AOAM533io4VOg1u7tgwu2XbxU/tJ6X4a1tiHS1swsseoiFVOZSEzcEDU
        jbzH8u+xZ3TdQNAG997JwT+idWCzU0s=
X-Google-Smtp-Source: ABdhPJwqYOpi7cR7vCz+gj7gSqbUvhmUojpu/TcXhg+Y8PgzPmXeLmX8vRvGfulRskDkq5DKW3Js6A==
X-Received: by 2002:a05:6830:4da:: with SMTP id s26mr2857587otd.77.1622043638533;
        Wed, 26 May 2021 08:40:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x11sm4488944otr.36.2021.05.26.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:40:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, jan.kundrat@cesnet.cz,
        kubernat@cesnet.cz, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/7] hwmon: (max31790) Detect and report zero fan speed
Date:   Wed, 26 May 2021 08:40:21 -0700
Message-Id: <20210526154022.3223012-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526154022.3223012-1-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If a fan is not running or not connected, of if fan monitoring is disabled,
the fan count register returns a fixed value of 0xffe0. So far this is then
translated to a RPM value larger than 0. Since this is misleading and does
not really make much sense, report a fan RPM of 0 in this situation.

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max31790.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 8e4fd9b7c889..91fe419b596c 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -40,6 +40,8 @@
 #define FAN_RPM_MIN			120
 #define FAN_RPM_MAX			7864320
 
+#define FAN_COUNT_REG_MAX		0xffe0
+
 #define RPM_FROM_REG(reg, sr)		(((reg) >> 4) ? \
 					 ((60 * (sr) * 8192) / ((reg) >> 4)) : \
 					 FAN_RPM_MAX)
@@ -175,7 +177,10 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 		return 0;
 	case hwmon_fan_input:
 		sr = get_tach_period(data->fan_dynamics[channel % NR_CHANNEL]);
-		rpm = RPM_FROM_REG(data->tach[channel], sr);
+		if (data->tach[channel] == FAN_COUNT_REG_MAX)
+			rpm = 0;
+		else
+			rpm = RPM_FROM_REG(data->tach[channel], sr);
 		*val = rpm;
 		return 0;
 	case hwmon_fan_target:
-- 
2.25.1

