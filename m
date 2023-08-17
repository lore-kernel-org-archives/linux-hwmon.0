Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64E8C2FC14
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Aug 2023 09:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349520AbjHQJZy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Aug 2023 05:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349562AbjHQJZg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Aug 2023 05:25:36 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6694F2D4F
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Aug 2023 02:25:34 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so69344645e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Aug 2023 02:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692264333; x=1692869133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RbSvzpoYud8FXP7GYgLwCUqHVr8YxqyCeoFfLHTQpA=;
        b=EBKIaD6uHatu3ECpuenVk+PU5q41V6meiTHO+mgqbRsrnABNvtfGilKX888J7xu1Yr
         a0XBGgyMSJMfTTOhTqKMc/omc46wfDEVjJNi/YHpikEj98gkqAw8VVcFGVaYZbLYYR9U
         3GjH38q8/CRv2/sTerTCY7d8ljejaMbTrGxh1MemSSRnQSURQg049ZtXX9VeKaKghhlR
         GQZcn2NMFkjONuuFGJLnN4yQq5IaKPaX8+v4cbm3d2sytFNDOWsydXY+kM3l2B9GJrjV
         33rwXNyEwyT01R2kxiu2n29dKsiwIcX2ixRKj1lPNE3N9QbvWHBAlDId6eIG+MqOJL8Y
         x7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692264333; x=1692869133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RbSvzpoYud8FXP7GYgLwCUqHVr8YxqyCeoFfLHTQpA=;
        b=UAT6H3tU9NjtJZw18d+0c1Uo4mzmBlABMC24Gt1jtkAJQNoN0t5zmqbSAmso2mu135
         EFNYsGlvTC4G7KTBru1S34gKfFAyb6rbe+bqLMgLIBiM3Y/SZlieklsCm6VIEVC/zyIz
         H7zauzVuQ4nj60mssx8i8rp7PVrP26Vpnrq8ft+v/Ylsyd+xQllCy7iwTzD/7eup2gsK
         zXIRtVvN9GODw72JFiTWfkKXXSe1JuFE2g7eZjtRYqZEXxUzmgM5yaqjF5T64+DlRVHB
         lDa7e+jfy9K0fIyKkhxbTshe6kiy52PvZrl52EqVMpb4xP9W/YnsYIuJ4oh/IlME11uQ
         tZ0g==
X-Gm-Message-State: AOJu0YzCU/HKRF5iVUMW9FFcV5c2Kh617HdTQRiHfblsLtasOLIkAby9
        CSuKDQJDL1fDHUfKr0qyPyiP3X/pcHHBvxV6Upn9pA==
X-Google-Smtp-Source: AGHT+IGhyCxgx8JdXYe6FXcaqCt52k8fm6b5/iHkfpRZILf7HomCeA965oYnuSpKRjYR0eCUpoMv1Q==
X-Received: by 2002:a1c:6a14:0:b0:3fc:27:7e46 with SMTP id f20-20020a1c6a14000000b003fc00277e46mr4682206wmc.3.1692264333007;
        Thu, 17 Aug 2023 02:25:33 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id x10-20020a05600c2a4a00b003fc00892c13sm2227934wme.35.2023.08.17.02.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 02:25:32 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: pmbus: Drop unnecessary clear fault page
Date:   Thu, 17 Aug 2023 11:25:25 +0200
Message-ID: <20230817092527.808631-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817092527.808631-1-Naresh.Solanki@9elements.com>
References: <20230817092527.808631-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The pmbus_check_byte_register function already calls clear
fault page, so there's no need to do it again in
pmbus_identify_common.

TEST: Verified using an I2C bus analyser to confirm that only
      one clear fault page is being send instead of two in a row.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index cbfabdd69056..1363d9f89181 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2541,7 +2541,6 @@ static int pmbus_identify_common(struct i2c_client *client,
 		}
 	}
 
-	pmbus_clear_fault_page(client, page);
 	return 0;
 }
 
-- 
2.41.0

