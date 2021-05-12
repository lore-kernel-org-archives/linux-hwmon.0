Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3869BC2BCC3
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 18:19:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E1F461469
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 18:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbhELSUL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 14:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346492AbhELRNg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 13:13:36 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B58C0612F2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 10:10:46 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id v1-20020a05620a1221b02902ea88445e01so14648316qkj.9
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 10:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=PXODettiudEJAl3QLXIii2j1h/vSRPebc7EbOxNgBmo=;
        b=f98rcg/95teB9HFcgpwBS7gGtFdesugKlc5az7RUWdj441yY/U8zMdfxVK8Zkpo7rd
         Oxn6Sntph6Hmg1Cpn2M5Y5UAjvi6ieUKIkZPJx2cCbZAq4pPyUBhbHY79YZH3TMtpSnA
         GU5H2LNalltyeVYhNgn4sRgmtu5RLyA3dXhtX8NmJDQW0RYjrwNPSZJW9nl6ecU6ZabY
         pQ6UdtyVzvnAqklH0DiCHOwtx69aNkTR9CldOgjvv5vJcbDtqK7hwnbWSUjQcYIc/veY
         oEz15GJN7DVPXzI1ajyCrYnFcGHObtuc58dn0q7hz4tb34Y42Czd5K/XNvWShCf1gv3u
         WPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=PXODettiudEJAl3QLXIii2j1h/vSRPebc7EbOxNgBmo=;
        b=IuM6YVAJuYWiKam4awqDDJxPwNg1WE2QNR8XKgMEPg3QBXjTOKBYLsbqECBHVj3KV9
         bqjTKhDXWyVIPXGNeOYcg7AacZpQEa+0xBSZybwyTmVRajLsdFE6m+owPkerQwgXvYKJ
         A032YhBDgSTiuU+djFkQiFoTE+Iqukkw+FRR6LaMbDhnF7DZK0QNvXs/l56NdWc4jg+C
         w9FhNcaVE1saJWBBfgnpEKfsswNjQScb8fSEeVC7BSxV2YnfCcSq8ZoMHB4GvIiIMWCp
         wtHwU0w1OBqQmL5GlkPvRqdCkbdUJUmT61Ucam9zp+aj7T/b1m+aM/QqTXIrkJ5L92n7
         dJgQ==
X-Gm-Message-State: AOAM530KOmMCH1q6bXHBKcqK72HvQJd3XxRE0MarqSVsy6brS0DpplrL
        H67ThQd0Dy1klvvaUWYdrhIQf7PaS7P8ZNlb
X-Google-Smtp-Source: ABdhPJzomWSMXPl3e1djwKEST9tCuVHZ8Yg+H7hpq6SMi1Z1tZy8PzyAYUndQbpCcuEuhm3wdxQGHNVN7MYj72pF
X-Received: from chu-dev-docker.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:80f])
 (user=linchuyuan job=sendgmr) by 2002:a05:6214:30a:: with SMTP id
 i10mr9734120qvu.42.1620839446135; Wed, 12 May 2021 10:10:46 -0700 (PDT)
Date:   Wed, 12 May 2021 17:10:43 +0000
Message-Id: <20210512171043.2433694-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
Subject: [PATCH] hwmon: adm1272: enable adm1272 temperature reporting
From:   Chu Lin <linchuyuan@google.com>
To:     linchuyuan@gmail.com, jasonling@google.com, zhongqil@google.com,
        linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Chu Lin <linchuyuan@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

adm1272 supports temperature reporting but it is disabled by default.

Tested:
ls temp1_*
temp1_crit           temp1_highest        temp1_max
temp1_crit_alarm     temp1_input          temp1_max_alarm

cat temp1_input
26642

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 drivers/hwmon/pmbus/adm1275.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index e7997f37b266..0be1b5777d2f 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -611,11 +611,13 @@ static int adm1275_probe(struct i2c_client *client)
 		tindex = 8;
 
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
-			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 
-		/* Enable VOUT if not enabled (it is disabled by default) */
-		if (!(config & ADM1278_VOUT_EN)) {
-			config |= ADM1278_VOUT_EN;
+		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
+		if ((config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) !=
+		    (ADM1278_VOUT_EN | ADM1278_TEMP1_EN)) {
+			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
 			ret = i2c_smbus_write_byte_data(client,
 							ADM1275_PMON_CONFIG,
 							config);
@@ -625,10 +627,6 @@ static int adm1275_probe(struct i2c_client *client)
 				return -ENODEV;
 			}
 		}
-
-		if (config & ADM1278_TEMP1_EN)
-			info->func[0] |=
-				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |= PMBUS_HAVE_VIN;
 		break;
-- 
2.31.1.607.g51e8a6a459-goog

