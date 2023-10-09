Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DF4CD6112
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Oct 2023 16:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377366AbjJIQ5z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Oct 2023 12:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377332AbjJIQ5y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Oct 2023 12:57:54 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1573A3
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Oct 2023 09:57:52 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-406618d0991so44395375e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Oct 2023 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696870671; x=1697475471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZAV/Qw52sFDXsSaIlMwU7Snqmg7zw6UPrOsGwKv28I=;
        b=Xij2wRHZ5KF7wmkX7GQJ2dIPxBy1Epr8FAvrKi2bwiEVfKZHdCcVU/T8Lt75EygD2u
         oe5rYLMJ5PoMdo9nxW3OwXWw/fbH51WHlEoJcgrE6i8t3Y7Bfnthw2A4j56PJ5/9nmKU
         vDAwZeNWLZSVBWHFs+3Cowk1wjMQP9sLR7KSvag3y8H+OkkgsafHS6+F8J7Fbq01onng
         Qd2jI3AEfaH2F0zV6KnHeGHPRNkkuL4VRbNfz5CZYkrF4CogUPEKA6mG6EK6/WTwYelK
         SatIrPdYGt+kOHtTXAsSJfK4Jd9IkEUfg5AF7lwjhZJT5w5We8WtrtxddaJRpHApGGMT
         po7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870671; x=1697475471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZAV/Qw52sFDXsSaIlMwU7Snqmg7zw6UPrOsGwKv28I=;
        b=MmvNnAoBb8T0r14qPJrCxD5BlWn5Kj5noGOcidyHItZ31Y8cidexxZby1nTCGBMy6r
         f5d5lOsS5GRwOENx7uvfwMcPyk2JJ2R0KixAyN3HwJ6qma/GMLOwgMSEupZR92D2g/YX
         Vmgcoj/1wAcBM/kZc8xThmsdGXsbtdY2o3jKwWv+dTE59tzdSRaT9VgQjS1mDeAQEfW2
         PXBFpGPUC1zhcTMvm7hESveu5DDjUEQD4DFO8PYee6RfIFVIjIKhOl57kQ7+1qREZE/S
         cfIvTkP4dN2gA3qVd9BPAAs6Ao9ifwIA8MtJj0dTiJQN0xS4AsJ8ZlHtkaJLbnIS8rt6
         ReWg==
X-Gm-Message-State: AOJu0YzWzsUEe+bLFukpeWn+8xFG7UoDFPay5r0bNlnPewhdWuz8UdUx
        dCk82kYec7UZtr3nWRXLBBNsIw==
X-Google-Smtp-Source: AGHT+IFKiN8LZgoJJqAV/SBsHALUKRZz3iXQGXq4Q/GH22ADeRnPJ9yRW8dY3+nzYECP/w1BIWaPog==
X-Received: by 2002:a7b:cb8b:0:b0:402:8c7e:3fc4 with SMTP id m11-20020a7bcb8b000000b004028c7e3fc4mr14562722wmi.30.1696870671100;
        Mon, 09 Oct 2023 09:57:51 -0700 (PDT)
Received: from heron.intern.cm-ag (p200300dc6f49a600529a4cfffe3dd983.dip0.t-ipconnect.de. [2003:dc:6f49:a600:529a:4cff:fe3d:d983])
        by smtp.gmail.com with ESMTPSA id d9-20020adff2c9000000b00324887a13f7sm10199828wrp.0.2023.10.09.09.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:57:50 -0700 (PDT)
From:   Max Kellermann <max.kellermann@ionos.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Max Kellermann <max.kellermann@ionos.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] drivers/hwmon: add local variable for newly allocated attribute_group**
Date:   Mon,  9 Oct 2023 18:57:35 +0200
Message-Id: <20231009165741.746184-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009165741.746184-1-max.kellermann@ionos.com>
References: <20231009165741.746184-1-max.kellermann@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This allows the compiler to keep the pointer in a register and
prepares for making the struct field "const".

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 drivers/hwmon/hwmon.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index c7dd3f5b2bd5..e50ab229b27d 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -783,6 +783,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	hdev = &hwdev->dev;
 
 	if (chip) {
+		const struct attribute_group **new_groups;
 		struct attribute **attrs;
 		int ngroups = 2; /* terminating NULL plus &hwdev->groups */
 
@@ -790,8 +791,8 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 			for (i = 0; groups[i]; i++)
 				ngroups++;
 
-		hwdev->groups = kcalloc(ngroups, sizeof(*groups), GFP_KERNEL);
-		if (!hwdev->groups) {
+		hwdev->groups = new_groups = kcalloc(ngroups, sizeof(*new_groups), GFP_KERNEL);
+		if (!new_groups) {
 			err = -ENOMEM;
 			goto free_hwmon;
 		}
@@ -804,14 +805,14 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 
 		hwdev->group.attrs = attrs;
 		ngroups = 0;
-		hwdev->groups[ngroups++] = &hwdev->group;
+		new_groups[ngroups++] = &hwdev->group;
 
 		if (groups) {
 			for (i = 0; groups[i]; i++)
-				hwdev->groups[ngroups++] = groups[i];
+				new_groups[ngroups++] = groups[i];
 		}
 
-		hdev->groups = hwdev->groups;
+		hdev->groups = new_groups;
 	} else {
 		hdev->groups = groups;
 	}
-- 
2.39.2

