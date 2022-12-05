Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECCDC4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 17:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiLERhP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 12:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbiLERhF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 12:37:05 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBF5F0C
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 09:36:55 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id q1so11080162pgl.11
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 09:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvml5TfEFZ6yIjHyNiB3iUJzdFZm8xL+dv3z+pyuWT4=;
        b=TVbvWXymuzs4Hl8i3brQ9yoL+D909//wP5suAay596WwNgWHV/YFDGFh45fFhzhnIe
         8Kno2XHPCYOy2nhMoI4I9k43yS3MsjF3SohsN/Xyu1P9KS47XRqEojEnKvsiyL85TOxg
         vG7Cr2O0QQ3/WWTk8cthxlYhX+J0XWAG03uFbQQNH0MGS3s8Y+J7Fuqf7IglVLdzhXRq
         /psZYcl2WHE8jXlraqhVE7lzxFgLlnrepvgF4+Mwkv1ckfy9+o3dFVTew0e+ZCU1ukqV
         ViLE5FEfhaayTWDbsjCk7Ejz8hYImDcDTPDezV8X8NLHAUsFLgHQjhLUoNpzUNP/am4G
         W+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvml5TfEFZ6yIjHyNiB3iUJzdFZm8xL+dv3z+pyuWT4=;
        b=s9hIeFewDTkWeupo2e1tmELzmgEnAeI3Rzv8GRFslOchBD+Kt05QbeEt121AVSCpYB
         aZkp05Td5j7He6xGFSCuY5xn6HfaDcEEVMOC7dp3Voaw7TD7TONDaOafiPkT0fyFAU9+
         dEYoXdu93S3TXxUUZm/dkZNxzWL/pXT8k9xD3+OPY0iXvv6tLFyU8D3GntVDBZZIONQM
         VIQUwff4PLCZ4o5iBjZOJ8IQGWKry4gyWujN/YvhsDgykoa5BOm1tVlUziMcHZxmjtjN
         n/W77SYGpYCDSZgQAn8DorpyZA8bAC7k1NWSdPt8d09rjUNK83C6WuysL4RgvETWhVAz
         0/uA==
X-Gm-Message-State: ANoB5pnFC9/lD2uQhaAQUgLD21ZqAmEohFC1DzRDHKr20fcb9UBR4VK7
        SS2E23fiiafynnQ+Pnuo9k8=
X-Google-Smtp-Source: AA0mqf50HAGI7vR371xhWBt2ftSuXPkrN56MI0umxx03SVAwpWYb+3tjSYlqskprDf1L3UYlLIklQA==
X-Received: by 2002:a05:6a00:2342:b0:575:1df5:4207 with SMTP id j2-20020a056a00234200b005751df54207mr39809145pfj.4.1670261815385;
        Mon, 05 Dec 2022 09:36:55 -0800 (PST)
Received: from localhost.localdomain ([193.122.98.110])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001869f2120a4sm10851081pli.94.2022.12.05.09.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 09:36:55 -0800 (PST)
From:   Xingjiang Qiao <nanpuyue@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Michael Shych <michaelsh@nvidia.com>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (emc2305) fix pwm never being able to set lower
Date:   Tue,  6 Dec 2022 01:36:11 +0800
Message-Id: <20221205173611.145571-2-nanpuyue@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205173611.145571-1-nanpuyue@gmail.com>
References: <20221205173611.145571-1-nanpuyue@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There are fields 'last_hwmon_state' and 'last_thermal_state' in the
structure 'emc2305_cdev_data', which respectively store the cooling state
set by the 'hwmon' and 'thermal' subsystem, and the driver author hopes
that if the state set by 'hwmon' is lower than the value set by 'thermal',
the driver will just save it without actually setting the pwm. Currently,
the 'last_thermal_state' also be updated by 'hwmon', which will cause the
cooling state to never be set to a lower value. This patch fixes that.

Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>
---
 drivers/hwmon/emc2305.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 4df84065cbfb..f51760f8aa85 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -398,11 +398,9 @@ emc2305_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int ch
 				 * Update PWM only in case requested state is not less than the
 				 * last thermal state.
 				 */
-				if (data->cdev_data[cdev_idx].last_hwmon_state >=
+				if (data->cdev_data[cdev_idx].last_hwmon_state <
 				    data->cdev_data[cdev_idx].last_thermal_state)
-					return emc2305_set_cur_state(data->cdev_data[cdev_idx].cdev,
-							data->cdev_data[cdev_idx].last_hwmon_state);
-				return 0;
+					return 0;
 			}
 			return emc2305_set_pwm(dev, val, channel);
 		default:
-- 
2.38.1

