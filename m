Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A289C05027
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Feb 2023 11:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjBSLA3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 19 Feb 2023 06:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjBSLA2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Feb 2023 06:00:28 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B101C113D2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Feb 2023 03:00:25 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id k5so2436024edo.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Feb 2023 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04773HxK6w/j5oagaAhwhgZqIaxMVK/fJO7N0+YWAos=;
        b=nXrxzHw3dPvuYeveP2PJQIfnnMPfXpEQ0vOTIYEoZnkzYViIS6YESSA8w6BK2BYtzv
         1btbBKI0T4zlv6r7iitTM0NwuiqbLNL7Rg+IRTpYoaWP6DJkVILQyF62axeaTSx97RgK
         QBotKM5+/V/vEnfmd8WnNaVX79WuhAJcJtuLLn2BiC5Jrw4XuXRWykPMeAc5p3sBKlZC
         f+MdSqpXlkEkDBnoG4lQ8AeduvABPkO2pZsg4eKgScjh7r5oIH/ZO5nDKXq5mF9XpvgT
         B/n/+Sbe2AuVSl2QTWeTK8uGEBjMe9oTocMAFC5R4FSGQEsA5UnPXnsV5LvkEiAr965F
         xvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04773HxK6w/j5oagaAhwhgZqIaxMVK/fJO7N0+YWAos=;
        b=1wh1flB5CctZV221Yua9OaeFHgh+C9n3Axf30qaJD/VfjrnYbvQV1AvDHlql2MOuz6
         yTGWgWfFeZ0xap+ZC1LisYEDN1EqQJRoj2PeeKzxQevxRHrhmRMg+D6uMQ2sF1wkv9Pb
         D/URVYnOe/egt3G9tyjlGXotCysoqHOLBC77Pz28RO+fzJHTH+E2NVYeIgZxXKd5og1g
         xSx52wf0u68f22KMnadOuwflGPXOFG2n3uZDqkgEadpvmC1O5Qky7BraId7uEiWjCff9
         7ObeILDZLKmu/6zjHRh17NmCN7TEGh25hccCCQIfW1aSaWY/Wi6u39miibLrjfp35dT/
         TqLw==
X-Gm-Message-State: AO0yUKVRmRTIK5mtGlUfChwIgWfJQR+ndja3Zz2dWTtT7vhSdzhnZDxm
        acITGW/zAvtNOgad6hvUH6yfuijOKJSuXg==
X-Google-Smtp-Source: AK7set+sWYjj3EdJBgxCvqD1GvcIBIEJUs5zyN+HYJP1LnNANTyZ70VDNzonsW/98T08ADbA6jh9sw==
X-Received: by 2002:a17:906:530b:b0:878:5946:c0ac with SMTP id h11-20020a170906530b00b008785946c0acmr6101841ejo.3.1676804423805;
        Sun, 19 Feb 2023 03:00:23 -0800 (PST)
Received: from amezin-laptop.home.arpa ([2a01:5a8:205:5bd7:aaa8:d1c0:c3d2:5983])
        by smtp.gmail.com with ESMTPSA id u27-20020a170906409b00b008b14b4b88f2sm4416908ejj.142.2023.02.19.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 03:00:23 -0800 (PST)
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Herman Fries <baracoder@googlemail.com>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nzxt-smart2) add another USB ID
Date:   Sun, 19 Feb 2023 12:59:19 +0200
Message-Id: <20230219105924.333007-1-mezin.alexander@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This seems to be a new revision of the device. RGB controls have changed,
but this driver doesn't touch them anyway.

Fan speed control reported to be working with existing userspace (hidraw)
software, so I assume it's compatible. Fan channel count is the same.

Recently added (0x1e71, 0x2019) seems to be the same device.

Discovered in liquidctl project:

https://github.com/liquidctl/liquidctl/issues/541

Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
---
 drivers/hwmon/nzxt-smart2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index 2b93ba89610a..a8e72d8fd060 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -791,7 +791,8 @@ static const struct hid_device_id nzxt_smart2_hid_id_table[] = {
 	{ HID_USB_DEVICE(0x1e71, 0x2009) }, /* NZXT RGB & Fan Controller */
 	{ HID_USB_DEVICE(0x1e71, 0x200e) }, /* NZXT RGB & Fan Controller */
 	{ HID_USB_DEVICE(0x1e71, 0x2010) }, /* NZXT RGB & Fan Controller */
-	{ HID_USB_DEVICE(0x1e71, 0x2019) }, /* NZXT RGB & Fan Controller */
+	{ HID_USB_DEVICE(0x1e71, 0x2011) }, /* NZXT RGB & Fan Controller (6 RGB) */
+	{ HID_USB_DEVICE(0x1e71, 0x2019) }, /* NZXT RGB & Fan Controller (6 RGB) */
 	{},
 };
 
-- 
2.39.2

