Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56232C43217
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 05:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiLAFIP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 00:08:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiLAFIO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 00:08:14 -0500
X-Greylist: delayed 1268 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 30 Nov 2022 21:08:13 PST
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com [192.185.70.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC619791B
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 21:08:13 -0800 (PST)
Received: from atl1wswcm06.websitewelcome.com (unknown [50.6.129.167])
        by atl1wswob01.websitewelcome.com (Postfix) with ESMTP id 7FA32400F018D
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 04:47:05 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id 0bTSpcBlIPz0t0bTUpXm6z; Thu, 01 Dec 2022 04:47:05 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=lt9ssPxraP7AVqIsyBoSkJvYwNULAALvMmqCxZgrk6g=; b=ov+DaIALsAqMIdNaVmoS0uPcOc
        DG4aWsV83JDARy8Lw0RcquU8bPpQ3JcBQRe8UVVSAvvVLBX6i1fiLBAU9/+Csqmtfp6Vv5UA3HdZV
        ul3uovvv0zmQ75tax5A/K3HGs8xZqRyA7arQJN/78eohykOkRCb2hkC9dSzl8A327Unt1zTfuhNCV
        Kxi1y2Uj61S6wBQcJ9rUtbVB5cRI+fTB57lVllGb6kqQCJUWSr2g8JglcwxiXHidYxi70lOIAJacr
        TDrxA7+Pq0wVY+l5UmEv7cPSyGH3RnPj116qJe+G2BkzjcVf4nFJ6vZEwdQXJ0/7Gr9ePRq4R8NcA
        3lc2s2GQ==;
Received: from [223.187.112.123] (port=34121 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1p0bTR-003t5m-Jo;
        Thu, 01 Dec 2022 04:47:01 +0000
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, marten.lindahl@axis.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v2 4/4] MAINTAINERS: Update the entry for MPQ7932 PMIC driver
Date:   Thu,  1 Dec 2022 05:46:43 +0100
Message-Id: <20221201044643.1150870-5-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201044643.1150870-1-saravanan@linumiz.com>
References: <20221201044643.1150870-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 223.187.112.123
X-Source-L: No
X-Exim-ID: 1p0bTR-003t5m-Jo
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [223.187.112.123]:34121
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 40
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJxUl8ZsjdP9KW0LvsESd/bdB+iyJJ7R2Z94+H1i/v8RzAUkzfRABLIbjmN3+UjGC4TJkEy1JHJR8KUJHxCdcLHwsM7s93w8f6Kg1Sl/9pbYHQ7/LH2h
 0U67Jmac24Az9qeXSQFu5GBPmNQhwnFOwqFocR7LQj9z3KwpYKzs9plizi0E3GqtBIv04zVmvtzjVNqZ3Df80SoYw6pew+OAGi8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Update the MAINTAINERS file to include the path for the MPQ7932 and
MPQ7932 devicetree bindings documentation.

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 379945f82a64..8e0dbf4c6cf3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13924,8 +13924,10 @@ F:	scripts/module*
 MONOLITHIC POWER SYSTEM PMIC DRIVER
 M:	Saravanan Sekar <sravanhome@gmail.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
 F:	Documentation/devicetree/bindings/mfd/mps,mp2629.yaml
 F:	Documentation/devicetree/bindings/regulator/mps,mp*.yaml
+F:	drivers/hwmon/pmbus/mpq7932.c
 F:	drivers/iio/adc/mp2629_adc.c
 F:	drivers/mfd/mp2629.c
 F:	drivers/power/supply/mp2629_charger.c
-- 
2.34.1

