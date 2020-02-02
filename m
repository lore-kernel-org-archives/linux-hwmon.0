Return-Path: <SRS0=4YUc=3W=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E391CC35249
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Feb 2020 23:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B797A20661
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Feb 2020 23:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgBBXcD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Feb 2020 18:32:03 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35164 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgBBXcD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Feb 2020 18:32:03 -0500
Received: by mail-ed1-f66.google.com with SMTP id f8so14173955edv.2
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Feb 2020 15:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K2M3tzNGCmQeqbznVwSQxwgubsrN+5iXRUD6VqhdA1I=;
        b=BPx6ahKJeVwGZyA1pi+hddlgudhK45BSda3MFC3pPk6iVJ2hD4X2X3u/arvaHkN6AD
         XVI9z+Ko5cEGO9PlGCfRLdpPLiRm2k3azReDzGrhPf2L+rZt1U7G/J/3ZmxpJ+MGFL+X
         EYiv9p/zox+0tK8XlW5ORur/Q3yM1Zz2CjYxC663gXdetX/8yrsOBdWHqPwviXxlUrW+
         QAha6k67w3qgndbkN0lha6JX8e3jzewLfwUUsLaWWrT/Pq2iodx+tMURb3GpYpFwtinD
         IYYdTbiJ60KKPatYZa01Kq/RYaRxOWAXwct87oAkZDS8dut5uYOkr5jJqyvUOXbB/9h1
         1gwg==
X-Gm-Message-State: APjAAAXLcm0JByVNKE/4a6SYVMopS2VLDsxj/JqfHje/kIUCet+ClIgQ
        EW3zaEFeMywY/algYLjG1iKp092cqxs=
X-Google-Smtp-Source: APXvYqzQqoyqYmxVDZQAvxeDvHT9txP7UPz1oEq7aNEbJAzlFGIFtEBmBmDKTKSSbz375Sr+ZDinLg==
X-Received: by 2002:a17:906:76cc:: with SMTP id q12mr18717048ejn.379.1580686321296;
        Sun, 02 Feb 2020 15:32:01 -0800 (PST)
Received: from localhost ([2001:470:1f15:8d0:4c8c:bac4:eefe:456b])
        by smtp.gmail.com with ESMTPSA id w18sm961881eja.57.2020.02.02.15.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2020 15:32:00 -0800 (PST)
From:   Haochen Tong <i@hexchain.org>
To:     pali.rohar@gmail.com, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Haochen Tong <i@hexchain.org>
Subject: [PATCH v2 1/2] dell-smm-hwmon: add XPS 13 9360 to supported devices list
Date:   Mon,  3 Feb 2020 00:31:50 +0100
Message-Id: <20200202233151.1840067-2-i@hexchain.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200202233151.1840067-1-i@hexchain.org>
References: <20200202233151.1840067-1-i@hexchain.org>
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
index 17583bf8c2dc..c8f2182ba969 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1118,6 +1118,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9570"),
 		},
 	},
+	{
+		.ident = "Dell XPS 13 9360",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9360"),
+		},
+	},
 	{ }
 };
 
-- 
2.25.0

