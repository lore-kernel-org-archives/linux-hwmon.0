Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C228C4321E
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Nov 2022 17:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiKZRl7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Nov 2022 12:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiKZRlz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Nov 2022 12:41:55 -0500
X-Greylist: delayed 1451 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Nov 2022 09:41:53 PST
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com [192.185.149.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDFEC3E
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 09:41:52 -0800 (PST)
Received: from atl1wswcm01.websitewelcome.com (unknown [50.6.129.162])
        by atl3wswob05.websitewelcome.com (Postfix) with ESMTP id AD3472739F
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 17:17:40 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id yyo5oBIgqR3ddyyo7oIS6T; Sat, 26 Nov 2022 17:17:40 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=8J3LM0tZI67HM9Rm8VJsP6yQKQiPbXceQxpjRIN0Q5E=; b=FlnIBduAkTowNq9ayeYr4198B1
        jcMa7+7FPU1bC5dDOIgiiAGaSkyJir62e7LItUrZiEl/EtxmD0HnYkAfHa+hx/jiitUSoMfC9cPrq
        nWMENIQUhfNSEu7BU0MEHXeJQvO8A7ceoY48fEwP23kO8qE4/Rbj50w9m2RTK+NahNsXCq++pD7mL
        BMo3N8AtQwTtwyH8TKv2a3p9L1Uch6MU/rX30KyZNM3IC8s5FB7nmK4H+3QWrNvZC4clqzjnwfk1C
        9pLfeG6lkUjdpm7OKyr3rrCkQz+oONvJsOLSuSZq+0Lsn4N+QXP3W0SCsn2wTavm+yBvxa89KGhv/
        RpAz7Xdw==;
Received: from [106.203.5.91] (port=35801 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1oyyo4-001nHp-Fn;
        Sat, 26 Nov 2022 17:17:36 +0000
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v1 3/3] MAINTAINERS: Add entry for mpq7932 PMIC driver
Date:   Sat, 26 Nov 2022 18:17:11 +0100
Message-Id: <20221126171711.1078309-3-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126171711.1078309-1-saravanan@linumiz.com>
References: <20221126171711.1078309-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 106.203.5.91
X-Source-L: No
X-Exim-ID: 1oyyo4-001nHp-Fn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [106.203.5.91]:35801
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 11
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJmY8nBp+slAVcwmb1DxonGQpV7hJVy86bOoC6CNnwJ87hKuDWIJAKtB8mO+VLzkUab+psiXJrUjxD6Ys5dLTu55xeZia7pMmvcGxCEogE9p9GVfPdCq
 jYVyWjofyhO8Mhbqi490FMIb0+Ni1Xe7lAFla4OX5jR1TdiUDJkxypYnkjAA4N8uu7595jnFe2i5YoR03+7awKn7ITV57Ncw5Ik=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add MAINTAINERS entry for Monolithic Power Systems mpq7932 PMIC driver.

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 379945f82a64..6727f1b55da8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13924,8 +13924,10 @@ F:	scripts/module*
 MONOLITHIC POWER SYSTEM PMIC DRIVER
 M:	Saravanan Sekar <sravanhome@gmail.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq.yaml
 F:	Documentation/devicetree/bindings/mfd/mps,mp2629.yaml
 F:	Documentation/devicetree/bindings/regulator/mps,mp*.yaml
+F:	drivers/hwmon/pmbus/mpq7932.c
 F:	drivers/iio/adc/mp2629_adc.c
 F:	drivers/mfd/mp2629.c
 F:	drivers/power/supply/mp2629_charger.c
-- 
2.34.1

