Return-Path: <SRS0=tBYM=VD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B431DC0650E
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 Jul 2019 13:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88DE92082F
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 Jul 2019 13:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhuOlBxs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfGFNYJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 6 Jul 2019 09:24:09 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37409 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfGFNYJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 Jul 2019 09:24:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so2584979plr.4
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Jul 2019 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F3d3xFeiLpZWaQIAtJewHB1fHuvN2t08jYk6gE0CBL4=;
        b=UhuOlBxsWLdOr1BvSJHBqHqiWbMpd3nEKFt3zbXRawAayK6Kl7NVcIWrlVudU9Hyx0
         /ON0HnMwQn5S/B0uDTywiu0HI5xEIxBVTgSJj5bTd1CDT823+IpayfKUIsp7xho1Jt/e
         +YOBUv0BMszp4HEL8q2yqwdenWnrSuUNUJSYG7Z9FbMLzLjyefqAr8kRcriaw/pYdiw+
         pdwvr+6nFcAUq3QIOEnPCPN8LxQ/QLdISuj3fCmz9oFlYrEhNzSvWdnz8v7Sx7wPnLYu
         OPnBPO/tBTkWWLoxOgwKmTu8K3C0dLqxPCGpDAq2eQgjT7JX8RclsZACGXWTSmXy1tYm
         aHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F3d3xFeiLpZWaQIAtJewHB1fHuvN2t08jYk6gE0CBL4=;
        b=IU66RES1QChRbTHdwkA3q5ouBT0VOwsxnsoLcAgYMAXcwNcx6/klyPhhkF1UMRUGOO
         10B2Xy+/xTN3cp0v6kBpP6ti99IIk1dHR8bWY6GRcuZcHafJE8AhVCuH/Mx1APH3LxlN
         iFjydyuKJWmSBKWAclySPJfrF89HjO+zy8mJGkKqnAbjJF6KhH1mq6kCfLpqGRuMZ26f
         4md6585V8fNTYckg0ZS/VtNk9W0nThfEz/lAobXaO0fHywJE5xdtE5Skiqa7Yslk9cxO
         xHH4btsktudZA/N5TC85gi9IfZn6aSiFnZsxIVTgv3/OpfjLQUtna2KTDK9WjIMqezTG
         4UBA==
X-Gm-Message-State: APjAAAXwNFqHeML84emW43/Lt2Z62Pgu2lwWXa550h7pEOvXSKCBbwyx
        C1OBQTfdMTP7x543yX/psIg=
X-Google-Smtp-Source: APXvYqxb1mhdpw5gHnr23y+vh7WUp4Zr4azylRjVKyrc9C3hTCTUaghfrmRuyO2bnUAEj402QJcKgQ==
X-Received: by 2002:a17:902:7894:: with SMTP id q20mr11067953pll.339.1562419448377;
        Sat, 06 Jul 2019 06:24:08 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id b6sm11084993pgd.5.2019.07.06.06.24.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 06:24:07 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        eibach@gdsys.de
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] hwmon: ads1015.c: Add of_node_put() before return
Date:   Sat,  6 Jul 2019 18:53:57 +0530
Message-Id: <20190706132357.3185-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return in two places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/hwmon/ads1015.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/ads1015.c b/drivers/hwmon/ads1015.c
index 3727a3762eb8..a0d62f6fa4b6 100644
--- a/drivers/hwmon/ads1015.c
+++ b/drivers/hwmon/ads1015.c
@@ -195,6 +195,7 @@ static int ads1015_get_channels_config_of(struct i2c_client *client)
 			if (pga > 6) {
 				dev_err(&client->dev, "invalid gain on %pOF\n",
 					node);
+				of_node_put(node);
 				return -EINVAL;
 			}
 		}
@@ -204,6 +205,7 @@ static int ads1015_get_channels_config_of(struct i2c_client *client)
 			if (data_rate > 7) {
 				dev_err(&client->dev,
 					"invalid data_rate on %pOF\n", node);
+				of_node_put(node);
 				return -EINVAL;
 			}
 		}
-- 
2.19.1

