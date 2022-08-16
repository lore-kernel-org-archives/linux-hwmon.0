Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146CEC2BB41
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Aug 2022 09:41:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbiHPJlO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Aug 2022 05:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbiHPJj7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Aug 2022 05:39:59 -0400
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5551367D7;
        Tue, 16 Aug 2022 01:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1660638494; x=1692174494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9K9d4IjBMmcloaT+QG5eIvNYUR3xOoTYrU9248uTcL8=;
  b=RL1BBWbhtBKQW143Cw1JhTGrLvoKQipy+ui9/EbVUs3CNtXKlTPd0E5v
   amz9Yp646NL4g0tO9thkRTTRu6yj+Y5cOoeDH0VQAsCDk7TUobJwJXQ5W
   9vXsKGe/ynp8s55DIybFpjF8MOyOdxTQCXTTSMDvYMlQmq9R0MLbT6Yl1
   8=;
X-IronPort-AV: E=Sophos;i="5.93,240,1654560000"; 
   d="scan'208";a="233486519"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-31df91b1.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 08:28:00 +0000
Received: from EX13MTAUEE002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-31df91b1.us-west-2.amazon.com (Postfix) with ESMTPS id 14069450A1;
        Tue, 16 Aug 2022 08:28:00 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 16 Aug 2022 08:27:59 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 16 Aug 2022 08:27:59 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Tue, 16 Aug 2022 08:27:59
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id 5F4D64C55; Tue, 16 Aug 2022 08:27:57 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <talel@amazon.com>, <hhhawa@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <ronenk@amazon.com>,
        <itamark@amazon.com>, <shellykz@amazon.com>, <shorer@amazon.com>,
        <amitlavi@amazon.com>, <almogbs@amazon.com>, <dwmw@amazon.co.uk>,
        <rtanwar@maxlinear.com>
Subject: [PATCH 02/16] hwmon: (mr75203) update pvt->v_num to the actual number of used sensors
Date:   Tue, 16 Aug 2022 08:27:43 +0000
Message-ID: <20220816082757.11990-3-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816082757.11990-1-farbere@amazon.com>
References: <20220816082757.11990-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This issue is relevant when intel,vm-map is set, and defines a lower
number of VMs than actually supported.

This change is needed for all places that use pvt->v_num later on in the
code.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/hwmon/mr75203.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index 0e29877a1a9c..f89f7bb5d698 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -605,6 +605,7 @@ static int mr75203_probe(struct platform_device *pdev)
 					break;
 
 			vm_num = i;
+			pvt->v_num = i;
 		}
 
 		in_config = devm_kcalloc(dev, vm_num + 1,
-- 
2.37.1

