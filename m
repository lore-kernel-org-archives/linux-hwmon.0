Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250ACC433FE
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Oct 2022 17:45:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJBRpq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Oct 2022 13:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiJBRpp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Oct 2022 13:45:45 -0400
Received: from p3nlsmtpcp01-02.prod.phx3.secureserver.net (p3nlsmtpcp01-02.prod.phx3.secureserver.net [184.168.200.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D2233E38
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 10:45:43 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id f318oqEPWsM8ef318oCiJk; Sun, 02 Oct 2022 10:44:42 -0700
X-CMAE-Analysis: v=2.4 cv=L73Y/8f8 c=1 sm=1 tr=0 ts=6339ce0a
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10 a=sCYMkZJ_nKMA:10
 a=iihcBN-LAAAA:8 a=LrueqtzP3pJQ6XUnl4wA:9 a=ZXOyfd87I8AR-G90gsrY:22
 a=HcALgBdeMRM4wejQDfUI:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=51840 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1of318-004aiB-1p; Sun, 02 Oct 2022 10:44:42 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH v2 2/2] it87: check device is valid before using force_id
Date:   Sun,  2 Oct 2022 18:43:02 +0100
Message-Id: <20221002174259.14609-3-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221002174259.14609-1-ahmad@khalifa.ws>
References: <20221002174259.14609-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl1062.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - khalifa.ws
X-Get-Message-Sender-Via: p3plcpnl1062.prod.phx3.secureserver.net: authenticated_id: ahmad@khalifa.ws
X-Authenticated-Sender: p3plcpnl1062.prod.phx3.secureserver.net: ahmad@khalifa.ws
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4xfJRXOsVcYwvxmWmYHa+E/3t/dLiq0wSv/zt96nLX//m6KqxMmGuAcFSX/2Xh8NPuF3UspmNlOoGxtowls/A6Q8VPaCZk7xLJG2ptw+skZuZgPuF/en11
 ojQxhvVsUQiMfAx2MTM0XsonS11MEQABFrOva8fh2ynzOWu8UjtxuLXBijgMd+X65Kvy5eOiAlNxrhOEXRcdPj/kH5MfrMvsp9hnQhC5yk1DM4kw/FiKl+eG
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Check if there is a valid device before using force_id parameter value
in order to avoid registering two devices.

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 drivers/hwmon/it87.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index ce579f5aebcf..6d71f6c481c8 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2401,7 +2401,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		return err;
 
 	err = -ENODEV;
-	chip_type = force_id ? force_id : superio_inw(sioaddr, DEVID);
+	chip_type = superio_inw(sioaddr, DEVID);
+	/* check first so force_id doesn't register a second empty device */
+	if (chip_type == 0xffff)
+		goto exit;
+
+	if (force_id)
+		chip_type = force_id;
 
 	switch (chip_type) {
 	case IT8705F_DEVID:
-- 
2.30.2

