Return-Path: <SRS0=UbWJ=AL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFF0C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Jun 2020 17:44:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93F6220842
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Jun 2020 17:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ciNqqkMh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732038AbgF3RoR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Jun 2020 13:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731094AbgF3RoP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Jun 2020 13:44:15 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16954C03E97E
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2020 10:44:15 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id u126so15376921pgc.23
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2020 10:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=7SURRzjjRGTOX0xlarMdKzVc2kBvlyxgGqiauUMeAgI=;
        b=ciNqqkMhKnSEhDrkiyicRV+B2fw/aWLtyBFS44cYqMU9/hk4YoHYAoOzmrmLeE1JTs
         hMI9APJYDNxFDlNQpcWYNUJRE7yfuHyn3fU33gxVS1g/sM656Z3VhRTA4Cgxvtl0XTgH
         bSLnAN6AEeH7ff/rAJRzU753rbcdrnIciPgVYaXAWO9HIBFZvlT+39JCkf9Pz1SSG8l4
         olMkZzDaxXJIfnYvOSReQzleJDzzFa0ep8CFo6+JjdehiVeHh5c7WoNrFW8GiPFrhFQA
         /tKo1DM+Ek1xkOvXKWduALkTHu1UGQ5Gb4ZqhbgXruX8S49IhfmJpkZh15ZuvTprZx6/
         yPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=7SURRzjjRGTOX0xlarMdKzVc2kBvlyxgGqiauUMeAgI=;
        b=Ax7A9MBuMIJ1en/52Z7/ZaZnAsTZkTVSkxECnH6GOFww3fUS1d63H4CU1bLB6bAqba
         zyOny5tOEcLiUoG4rN9DUFQh4DWT440h4R8ovjTyEhTAkWaqXRoHojQ7oOXZLIOQCP2A
         JS1xh6hiNdSsYMMEyrQuYQILncAEI0vT5QT+vUAmLUUp5WYjlXeyRTYQuK/RkPGnqv14
         LWTCCWnvcwIG0UNtvhhwvg8BiHW+S+pEIehYWs4FyNuLMsBJUUCimjViFFAqfgw0Ks2u
         Qhm++A9h8D/AJjxRyWf9vz1oVfiMXEH7Gm5d6nJlWI0IzGvx18+0X1o+3WyRSoCq31ru
         L4ZA==
X-Gm-Message-State: AOAM5302YV3iJsXCKa3t85U/eHOSwp2njbaQ2ve19FeYNQEbTEfFOLpi
        W5saDOv5b+ybWLod8ZEWMjb6lKEItNICgIQB
X-Google-Smtp-Source: ABdhPJwPGsUvzBGkF/3Z5B2RfmdKVtbm0PtCRn/ARFI6s5uasiK3vHNKYRUI6swXWVIB3MhtxgqwE0kg1LIWpgLm
X-Received: by 2002:a63:a352:: with SMTP id v18mr16922694pgn.453.1593539054539;
 Tue, 30 Jun 2020 10:44:14 -0700 (PDT)
Date:   Tue, 30 Jun 2020 17:43:50 +0000
In-Reply-To: <linchuyuan@google.com>
Message-Id: <20200630174350.2842555-1-linchuyuan@google.com>
Mime-Version: 1.0
References: <linchuyuan@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH] hwmon:max6697: Allow max6581 to set temperature read offset
From:   Chu Lin <linchuyuan@google.com>
To:     linux@roeck-us.net, jdelvare@suse.com, linchuyuan@google.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     jasonling@google.com, belgaied@google.com, zhongqil@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Per max6581, reg 4d and reg 4e is used for temperature read offset.
This patch will let the user specify the temperature read offset for
max6581. This patch is tested on max6581 and only applies to max6581.

Testing:
dts: temperature-read-offset = <0xde 0x0>;

verify: iotools smbus_read8 <vbus> 0x4d 0x4e
0x6F

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 drivers/hwmon/max6697.c               | 19 +++++++++++++++++--
 include/linux/platform_data/max6697.h |  4 ++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 743752a2467a..16c0f0995a12 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -493,8 +493,13 @@ static void max6697_get_config_of(struct device_node *node,
 	}
 	prop = of_get_property(node, "transistor-ideality", &len);
 	if (prop && len == 2 * sizeof(u32)) {
-			pdata->ideality_mask = be32_to_cpu(prop[0]);
-			pdata->ideality_value = be32_to_cpu(prop[1]);
+		pdata->ideality_mask = be32_to_cpu(prop[0]);
+		pdata->ideality_value = be32_to_cpu(prop[1]);
+	}
+	prop = of_get_property(node, "temperature-read-offset", &len);
+	if  (prop && len == 2 * sizeof(u32)) {
+		pdata->offset_mask = be32_to_cpu(prop[0]);
+		pdata->offset_value = be32_to_cpu(prop[1]);
 	}
 }
 
@@ -586,6 +591,16 @@ static int max6697_init_chip(struct max6697_data *data,
 						pdata->ideality_mask >> 1);
 		if (ret < 0)
 			return ret;
+		ret = i2c_smbus_write_byte_data(client,
+						MAX6581_REG_OFFSET,
+						pdata->offset_value);
+		if (ret < 0)
+			return ret;
+		ret = i2c_smbus_write_byte_data(client,
+						MAX6581_REG_OFFSET_SELECT,
+						pdata->offset_mask >> 1);
+		if (ret < 0)
+			return ret;
 	}
 done:
 	data->update_interval = factor * MAX6697_CONV_TIME;
diff --git a/include/linux/platform_data/max6697.h b/include/linux/platform_data/max6697.h
index 6fbb70005541..ff98adfe9d8d 100644
--- a/include/linux/platform_data/max6697.h
+++ b/include/linux/platform_data/max6697.h
@@ -28,6 +28,10 @@ struct max6697_platform_data {
 	u8 ideality_value;		/* transistor ideality as per
 					 * MAX6581 datasheet
 					 */
+	u8 offset_mask;			/* set bit to 0 to disable */
+	u8 offset_value;		/* temperature read offset as
+					 * MAX6581 datasheet
+					 */
 };
 
 #endif /* MAX6697_H */
-- 
2.27.0.212.ge8ba1cc988-goog

