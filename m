Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6119CE7B09
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Sep 2023 07:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjI1HxE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Sep 2023 03:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjI1HxD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Sep 2023 03:53:03 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540ACD6;
        Thu, 28 Sep 2023 00:53:01 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 469977F98;
        Thu, 28 Sep 2023 15:52:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Sep
 2023 15:52:51 +0800
Received: from ubuntu.localdomain (113.72.144.128) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Sep
 2023 15:52:50 +0800
From:   Hal Feng <hal.feng@starfivetech.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Conor Dooley <conor@kernel.org>,
        "Emil Renner Berthing" <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>
CC:     <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] MAINTAINERS: Add Hal as one of the maintainers of SFCTEMP HWMON DRIVER
Date:   Thu, 28 Sep 2023 15:52:49 +0800
Message-ID: <20230928075249.109459-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.128]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

As he is the submitter of this driver, add his mail so he can
maintain the driver and easily reply in the mailing list.

Acked-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---

History:
v1: https://lore.kernel.org/all/20230718034937.92999-4-hal.feng@starfivetech.com/

---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b19995690904..2376272bbe20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19402,6 +19402,7 @@ F:	drivers/net/ethernet/sfc/
 
 SFCTEMP HWMON DRIVER
 M:	Emil Renner Berthing <kernel@esmil.dk>
+M:	Hal Feng <hal.feng@starfivetech.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml

base-commit: 6465e260f48790807eef06b583b38ca9789b6072
-- 
2.38.1

