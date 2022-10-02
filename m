Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39D2C433FE
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Oct 2022 17:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiJBRpg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Oct 2022 13:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiJBRpf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Oct 2022 13:45:35 -0400
Received: from p3nlsmtpcp01-02.prod.phx3.secureserver.net (p3nlsmtpcp01-02.prod.phx3.secureserver.net [184.168.200.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3D433841
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 10:45:34 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id f30yoqEMdsM8ef30yoCiHF; Sun, 02 Oct 2022 10:44:32 -0700
X-CMAE-Analysis: v=2.4 cv=L73Y/8f8 c=1 sm=1 tr=0 ts=6339ce01
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10 a=sCYMkZJ_nKMA:10
 a=iihcBN-LAAAA:8 a=3z5NreDLIubguZK1FgIA:9 a=ZXOyfd87I8AR-G90gsrY:22
 a=HcALgBdeMRM4wejQDfUI:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=51840 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1of30y-004aiB-9k; Sun, 02 Oct 2022 10:44:32 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH v2 1/2] it87: Add param to ignore ACPI resource conflicts
Date:   Sun,  2 Oct 2022 18:43:00 +0100
Message-Id: <20221002174259.14609-2-ahmad@khalifa.ws>
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
X-CMAE-Envelope: MS4xfEdGSlfUHNNAvjYIECMlNAawdbEyvgzqRpid8jrIEvph6APMEXVd+ZRDf3vAK1aaDtIMaH8yMQg9L3JqfehmldSUFd4pYeuqt27KEpE0Ssb079xct4mM
 YAkcuIg4GfyUtgkYxJiozcB1RrG1KlXYVms37dcTAEQOw2zr4tBMgHuOM2SsAjFNmgMGCkbqhAxLMyZ/L8byX2Mo8QkJP3uGmaGobHXfbm8IyMqkTlhvO45P
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add in the parameter to ignore ACPI resource conflicts so that modprobe
can use the force_id parameter when ACPI has the same address mapped.

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 drivers/hwmon/it87.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 0e543dbe0a6b..ce579f5aebcf 100644
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
@@ -3261,8 +3265,10 @@ static int __init it87_device_add(int index, unsigned short address,
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

