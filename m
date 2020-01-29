Return-Path: <SRS0=52eC=3S=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701C0C2D0DB
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Jan 2020 15:08:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47E0E2071E
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Jan 2020 15:08:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgA2PIs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 29 Jan 2020 10:08:48 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40679 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgA2PIr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Jan 2020 10:08:47 -0500
Received: by mail-ed1-f65.google.com with SMTP id p3so61315edx.7
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jan 2020 07:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n0NuRehYKMq23yiw/hoaETJ0FpQexqrvzz5MXwe966M=;
        b=TKYqIZpYz+lm2zakWr1gTt5ovtRlVbuotmxrmjJJljEbIutjUZ3SXhfVUKXdCHQBAU
         XlMuaNdsucqqLGi88KRXprM5JTUByZwzPZMoeosCZhLKbEZnN4MWH402Bf/bptq1jdIc
         XMtpO9rRYzY2cfBHyOTXX1XVmh/ynoEq5YalK9LVVsd8FGk3lRwlKRv49Zu8KPoVdhvH
         NA1kLcO4DvjEoG313W8CtWw7KsAGjfEPhauYKF1OD3OoJ4zQDFqhFV6nb9WfjViXRYvs
         QjNEjzk46KmcGQLo+PwJ69oxJXTWt/Iqe1vpB4++hcidkZzqMygjutBA8L5BMN0eZxvy
         sIog==
X-Gm-Message-State: APjAAAWJB9ZAI9VFJ5MMtxfHPZ0ZlzSkLBj7YOBqr5oHTzyiVVGdvcGL
        SbRwhvT0IRGiy7AOF7jhSSc=
X-Google-Smtp-Source: APXvYqwYq2diaNjD3+r4LRppLBQJR4mUZ1us4Vxzh34eR6R3N5jrtYX5Mpc1KnLTHn14vGvGI/xYCw==
X-Received: by 2002:a17:907:4300:: with SMTP id oa24mr7889212ejb.61.1580310526151;
        Wed, 29 Jan 2020 07:08:46 -0800 (PST)
Received: from localhost ([2001:470:1f15:8d0:a512:349:7724:8528])
        by smtp.gmail.com with ESMTPSA id t1sm368592ejg.32.2020.01.29.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 07:08:45 -0800 (PST)
From:   Haochen Tong <i@hexchain.org>
To:     pali.rohar@gmail.com, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Haochen Tong <i@hexchain.org>
Subject: [PATCH 1/2] dell-smm-hwmon: add XPS 13 9360 to supported devices list
Date:   Wed, 29 Jan 2020 16:08:38 +0100
Message-Id: <20200129150839.122689-2-i@hexchain.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129150839.122689-1-i@hexchain.org>
References: <20200129150839.122689-1-i@hexchain.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Tests have shown that this module works fine on XPS 13 9360: it can
successfully detect and report fan status.

Signed-off-by: Haochen Tong <i@hexchain.org>
---
 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 17583bf8c2dc..d9f6394c08d6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1104,6 +1104,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_config_data[DELL_XPS],
 	},
+	{
+		.ident = "Dell XPS 13 9360",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9360"),
+		},
+	},
 	{
 		.ident = "Dell XPS 15 9560",
 		.matches = {
-- 
2.25.0

