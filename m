Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C181C6FA8E
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Sep 2022 15:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbiIHPZ0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Sep 2022 11:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiIHPZW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Sep 2022 11:25:22 -0400
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D3597ECF;
        Thu,  8 Sep 2022 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1662650721; x=1694186721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zOITErJLZY7CoP1PfHFB2ESZrh86xuTow8leSA4ngmU=;
  b=pv8+bLyOEjs1wiHrGjyFxA4llpfpaeGOmKqiGOtyqOkBrkbBd3OGYpaj
   icTLyDt3MxzcZM7v/7UE9iAfuJ3wTMnkZQSIsj0EUngDejwZcQt0/n+4L
   Y50sJKXzVkgyZyOJiqtuAfR1nerAe53gZ0DxEIAWdmvfuB7C4E1qCPyLZ
   4=;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1d-1c3c2014.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 15:25:11 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1d-1c3c2014.us-east-1.amazon.com (Postfix) with ESMTPS id 69E1A3C0011;
        Thu,  8 Sep 2022 15:25:09 +0000 (UTC)
Received: from EX19D013UWA002.ant.amazon.com (10.13.138.210) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Thu, 8 Sep 2022 15:24:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX19D013UWA002.ant.amazon.com (10.13.138.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Thu, 8 Sep 2022 15:24:52 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Thu, 8 Sep 2022 15:24:51 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id 7B3B54D7F; Thu,  8 Sep 2022 15:24:49 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <rtanwar@maxlinear.com>,
        <andriy.shevchenko@intel.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <hhhawa@amazon.com>, <jonnyc@amazon.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 19/21] hwmon: (mr75203) parse temperature coefficients from device-tree
Date:   Thu, 8 Sep 2022 15:24:47 +0000
Message-ID: <20220908152449.35457-20-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220908152449.35457-1-farbere@amazon.com>
References: <20220908152449.35457-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use thermal coefficients from the device tree if they exist.
Otherwise, use default values according to the series (5 or 6).
All coefficients can be used or only part of them.

The coefficients shall be used for fine tuning the default values since
coefficients can vary between product and product.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
V4 -> V3:
- Replace of_property_read_u32() with device_property_read_u32().
- Fix "Code shouldn't be a YAML validator".
- Read directly to ts_coeff-> parameter to avoid conditional if.

 drivers/hwmon/mr75203.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index bbb59dd7e7cb..07668545c3ae 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -719,6 +719,15 @@ static int pvt_set_temp_coeff(struct device *dev, struct pvt_device *pvt)
 
 	dev_dbg(dev, "temperature sensor series = %u\n", series);
 
+	/* Override ts-coeff-h/g/j/cal5 if they are defined. */
+	device_property_read_u32(dev, "moortec,ts-coeff-h", &ts_coeff->h);
+	device_property_read_u32(dev, "moortec,ts-coeff-g", &ts_coeff->g);
+	device_property_read_u32(dev, "moortec,ts-coeff-j", &ts_coeff->j);
+	device_property_read_u32(dev, "moortec,ts-coeff-cal5", &ts_coeff->cal5);
+
+	dev_dbg(dev, "ts-coeff: h = %u, g = %u, j = %d, cal5 = %u\n",
+		ts_coeff->h, ts_coeff->g, ts_coeff->j, ts_coeff->cal5);
+
 	return 0;
 }
 
-- 
2.37.1

