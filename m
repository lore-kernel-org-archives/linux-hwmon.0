Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DFBC47088
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 498DA613D2
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233822AbhEZPmO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 11:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234193AbhEZPmK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 11:42:10 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A057FC06175F
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:37 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so1432067oto.0
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q9EkXnYEQiICfs65xThtnkdPUbxcpwn3kdqK+p3e1YY=;
        b=KGo865HDyCs0SNFkwpp9+Su8vTBxDPvtOiiZjiZqxaWtnWgEUFXX5XFMkn6cQPGH9R
         ICLpGo4hVyXPKrenBjStdYzIqoTp9c7FWSN+4Fz6dxN7PY06H/6r8OcG4sWcjAoRjKrc
         JKUtrA04G/fLUGQNRd5u2tG2SwGaP8LTOcjJOXMzUJR4dPuVbXSiJGVyf5LMQpyn/bVQ
         XNVKi9WZLSOSUiA1MBddtcrE8jTGkaJPyeb1bWcRH+lDKoGzvzqnyK+HwcY8PxIEKfII
         t0Gzdn9nMOUUfQ9Ta7uNjtK1AzzhmLOfqgHnsDH1RLIf/1JLgNafbI5M0RJQ1fMj0CWc
         6oCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=q9EkXnYEQiICfs65xThtnkdPUbxcpwn3kdqK+p3e1YY=;
        b=sZl64Dq3MR4h6xElp86IVkZ5t1y/4AMZXc1l8WcdSpv2rxJ7lSDmoI2JX+G7tDcU8a
         RYdtbGaxtjYd9UVPcmbtRC9D5Gmqp3OvE3ARHu8k6VovyqG1VaSMfIWg9WXUnrOcDqp5
         XWaG18pWEiPsRwet6Xkc23vxGGQOveN/psGUG8j94q/zQFXu2aMO8rYVEc0KMZ8hUi58
         uZphpPgdhHdPNkAj3o+tpDaR3POytB9+tGKMsq7kfLND6jiUMuzXWvSUMwf2S84bpbZb
         wZUoDp2mKD/ek39d2puL0F8ZGstNzPEueehOs6Ux67FYKoJh0UdJco9wqluABf5ANh5J
         B1zQ==
X-Gm-Message-State: AOAM531ApYthFn32E6M5MrDVk5bHfHsCL/DDpwPnC1HXUWj3m2ajsGaw
        Ybkr55UZl5YRnePLJqwEJWz8cERP8JI=
X-Google-Smtp-Source: ABdhPJxC8jSkhE9B5z9QJ9BElGDlsLsnfzdbPVleYHXQC8knXt12WJWNTICbB7v5xBrUg0s8Frcoag==
X-Received: by 2002:a05:6830:1155:: with SMTP id x21mr2820773otq.303.1622043636704;
        Wed, 26 May 2021 08:40:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q14sm4210617ota.31.2021.05.26.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:40:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, jan.kundrat@cesnet.cz,
        kubernat@cesnet.cz, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/7] hwmon: (max31790) Clear fan fault after reporting it
Date:   Wed, 26 May 2021 08:40:20 -0700
Message-Id: <20210526154022.3223012-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526154022.3223012-1-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fault bits in MAX31790 are sticky and have to be cleared explicitly.
A write operation into either the 'Target Duty Cycle' register or the
'Target Count' register is necessary to clear a fault.

At the same time, we can never clear cached fault status values before
reading them because the companion fault status for any given fan is
cleared as well when clearing a fault.

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max31790.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 19651feb40fb..8e4fd9b7c889 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -80,7 +80,7 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 				MAX31790_REG_FAN_FAULT_STATUS1);
 		if (rv < 0)
 			goto abort;
-		data->fault_status = rv & 0x3F;
+		data->fault_status |= rv & 0x3F;
 
 		rv = i2c_smbus_read_byte_data(client,
 				MAX31790_REG_FAN_FAULT_STATUS2);
@@ -184,7 +184,21 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 		*val = rpm;
 		return 0;
 	case hwmon_fan_fault:
+		mutex_lock(&data->update_lock);
 		*val = !!(data->fault_status & (1 << channel));
+		data->fault_status &= ~(1 << channel);
+		/*
+		 * If a fault bit is set, we need to write into one of the fan
+		 * configuration registers to clear it. Note that this also
+		 * clears the fault for the companion channel if enabled.
+		 */
+		if (*val) {
+			int reg = MAX31790_REG_TARGET_COUNT(channel % NR_CHANNEL);
+
+			i2c_smbus_write_byte_data(data->client, reg,
+						  data->target_count[channel % NR_CHANNEL] >> 8);
+		}
+		mutex_unlock(&data->update_lock);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
-- 
2.25.1

