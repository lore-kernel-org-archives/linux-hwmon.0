Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AD1C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Oct 2022 21:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiJDVDO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Oct 2022 17:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiJDVDN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2022 17:03:13 -0400
Received: from p3nlsmtpcp01-02.prod.phx3.secureserver.net (p3nlsmtpcp01-02.prod.phx3.secureserver.net [184.168.200.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA26465839
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Oct 2022 14:03:12 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.96])
        by : HOSTING RELAY : with ESMTP
        id fp3LoBjX9sM8efp3LoWEVE; Tue, 04 Oct 2022 14:02:11 -0700
X-CMAE-Analysis: v=2.4 cv=L73Y/8f8 c=1 sm=1 tr=0 ts=633c9f53
 a=2X41b4ieGfoJAKBLAMfEgQ==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10 a=sCYMkZJ_nKMA:10
 a=iihcBN-LAAAA:8 a=8S-GXJxo2x9UrRvwQHwA:9 a=ZXOyfd87I8AR-G90gsrY:22
 a=HcALgBdeMRM4wejQDfUI:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=39992 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1ofp3F-00Gpon-TQ; Tue, 04 Oct 2022 14:02:06 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH v3 1/2] hwmon: (it87) Add param to ignore ACPI resource conflicts
Date:   Tue,  4 Oct 2022 22:01:01 +0100
Message-Id: <20221004210100.540120-2-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004210100.540120-1-ahmad@khalifa.ws>
References: <20221004210100.540120-1-ahmad@khalifa.ws>
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
X-CMAE-Envelope: MS4xfJBBY7Yb4L0NJB/6bHod4GPy8sjKAOuIjqMIEC3sHuNg3/K3kFWOKppxhlpUV9q1n5TabTgYXjj79zIsVBZfnnOorYg3BbL/pp7wxcKebldr8lAC/oCL
 6eQeqvjJmlOeYEHFE6AlC+zYd2rudRbvAkREb44M7hCcJyrYmujSl75D4tgbloMCx3pruG9ymq7AxxjRoQKN9fFjhSu9WhkH3zjwRtsjgjN16926pGiIMpqy
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add parameter to ignore ACPI resource conflicts as an alternate to using
'acpi_enforce_resources=lax'.

Some BIOSes reserve resources and don't use them and the system wide
parameter may result in failures to certain drivers.

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 drivers/hwmon/it87.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 0e543dbe0a6b..c4f5500dcf3c 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -69,6 +69,10 @@ static unsigned short force_id;
 module_param(force_id, ushort, 0);
 MODULE_PARM_DESC(force_id, "Override the detected device ID");
 
+static bool ignore_resource_conflict;
+module_param(ignore_resource_conflict, bool, 0);
+MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
+
 static struct platform_device *it87_pdev[2];
 
 #define	REG_2E	0x2e	/* The register to read/write */
@@ -3261,8 +3265,10 @@ static int __init it87_device_add(int index, unsigned short address,
 	int err;
 
 	err = acpi_check_resource_conflict(&res);
-	if (err)
-		return err;
+	if (err) {
+		if (!ignore_resource_conflict)
+			return err;
+	}
 
 	pdev = platform_device_alloc(DRVNAME, address);
 	if (!pdev)
-- 
2.30.2

