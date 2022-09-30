Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E53C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Sep 2022 14:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiI3O4R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Sep 2022 10:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiI3O4F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Sep 2022 10:56:05 -0400
Received: from p3nlsmtpcp01-01.prod.phx3.secureserver.net (p3nlsmtpcp01-01.prod.phx3.secureserver.net [184.168.200.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79CE5FCB
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Sep 2022 07:56:02 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id eHIXo766oYH5oeHIXobiWH; Fri, 30 Sep 2022 07:47:29 -0700
X-CMAE-Analysis: v=2.4 cv=aOc1FZxm c=1 sm=1 tr=0 ts=63370182
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=xOM3xZuef0cA:10 a=sCYMkZJ_nKMA:10
 a=iihcBN-LAAAA:8 a=oRDODTJsDcDNdN7j7c0A:9 a=ZXOyfd87I8AR-G90gsrY:22
 a=HcALgBdeMRM4wejQDfUI:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=56216 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1oeHIX-00BAyT-6n; Fri, 30 Sep 2022 07:47:29 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH 1/1] it87: Add param to ignore ACPI resource conflicts
Date:   Fri, 30 Sep 2022 15:46:37 +0100
Message-Id: <20220930144637.48904-2-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220930144637.48904-1-ahmad@khalifa.ws>
References: <20220930144637.48904-1-ahmad@khalifa.ws>
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
X-CMAE-Envelope: MS4xfPpwxC9HCeosZWzGt/f7QyPByrtvJHPsk5WVDYP40AiKTVSYsLnZ2+L2excBoRV8DEG4l47TPr3EjF1v/vcUma6A+NJXrZUSJnhyGvv0V8utner3BQih
 QzQbL3sXjHnl5Abb85y8J4gPQL3b1CX+PccqdGNGpIHiMX1rvPAQxONF70fhSD2n5BpXk2jkttmn4iavswrtzmVuUXpruQM7yJ7SWqQyfH7kLThH/gDOp14u
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 drivers/hwmon/it87.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 0e543dbe0a6b..6d71f6c481c8 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -69,6 +69,10 @@ static unsigned short force_id;
 module_param(force_id, ushort, 0);
 MODULE_PARM_DESC(force_id, "Override the detected device ID");
 
+static bool ignore_resource_conflict;
+module_param(ignore_resource_conflict, bool, false);
+MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
+
 static struct platform_device *it87_pdev[2];
 
 #define	REG_2E	0x2e	/* The register to read/write */
@@ -2397,7 +2401,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
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
@@ -3261,8 +3271,10 @@ static int __init it87_device_add(int index, unsigned short address,
 	int err;
 
 	err = acpi_check_resource_conflict(&res);
-	if (err)
-		return err;
+	if (err){
+		if (!ignore_resource_conflict)
+			return err;
+	}
 
 	pdev = platform_device_alloc(DRVNAME, address);
 	if (!pdev)
-- 
2.30.2

