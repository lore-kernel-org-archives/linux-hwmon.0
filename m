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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3A3C2B9F9
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 18:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2198261425
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 18:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242485AbhELSTH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 14:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345980AbhELRMh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 13:12:37 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B8FC061763
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 10:04:22 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id s5-20020aa78d450000b02902ace63a7e93so9786282pfe.8
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=PXODettiudEJAl3QLXIii2j1h/vSRPebc7EbOxNgBmo=;
        b=YsUrcbRSvGP7r8wr3p/YTr3sfiwR84Eox1a+e0b5ch6zT3CcgpN/wjeGFZeldTL/bi
         +bCoaARQIkB9fZT+J64BTwaHFc1Np71pq8JAAiGUrlSYagaTVvrfB5gNAHVTXsuaXnTC
         PO/xFB1UtKTgKFdviw+GjHk0msMWM4xN5yBzxcn6/S3JcmoRsr5z/Wqk/vt7RBTNiK0/
         gy+pGQ6FCCUv6YTY+Qc/jMMYj87U8Zjf777GFjB+N4pNWbyypbbyYEU1hZj0EwRdAhUT
         8HhP52aUDhteTTlNwltF62nDPN/ZAVYas8CZO0BAWhe9NUE6Mtr1+U7x39lEs+l3z/01
         576g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=PXODettiudEJAl3QLXIii2j1h/vSRPebc7EbOxNgBmo=;
        b=aSbuTEu+cgWRUK53HUyq5JTh/C+Gitsr8/PVoL1zNzo+k5GqxAI6plzzjKw6uHAQ14
         7joHIkEjyrIXHEE2byS7NvAdsr9lbxP9W/qMRvPz9/QhnwIcw1iz0HnW5UgpHta7woAt
         GETDaKzRksPOAYwLQuAAr3RzyiZCr0RYuFMA0vC5cUnyP6dCVhfBj9qDurR6ny/QvbgN
         dZ3S9wtL7dc33Bdcjb0HLeHIp1XkhTVvR0fLtX5SgXKrZDmKoCdmtr4f4RpacdF+U4ho
         gRYPN04GeFKhrkVee/A+6pMYVRF0ivTW26lb54sZSoDQbA9fSS1UhvVrbVW81txqLhSj
         ntSg==
X-Gm-Message-State: AOAM533G9w9qWOLFGjT6tIv/cdyJuRQ4mDXj5dxL+6lI1Dru4/DtYGb5
        BtQ8AjkipGmo2fGUKxVtsQ+bqsmDVqrl7uG4
X-Google-Smtp-Source: ABdhPJwd0j4UsVE4TWxtvGAi4TakorUQiD2yBaCnagcZHFVavQmOMgNg+dV7Ss/lE3+683S0aUvoFL7wet6IEeAw
X-Received: from chu-dev-docker.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:80f])
 (user=linchuyuan job=sendgmr) by 2002:a17:90a:db93:: with SMTP id
 h19mr20948pjv.0.1620839061422; Wed, 12 May 2021 10:04:21 -0700 (PDT)
Date:   Wed, 12 May 2021 17:04:18 +0000
Message-Id: <20210512170418.2432278-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
Subject: [PATCH] Enable adm1272 temperature reporting
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

