Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96805C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Oct 2022 21:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiJDVDU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Oct 2022 17:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiJDVDT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2022 17:03:19 -0400
Received: from p3nlsmtpcp01-03.prod.phx3.secureserver.net (p3nlsmtpcp01-03.prod.phx3.secureserver.net [184.168.200.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4BB65270
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Oct 2022 14:03:19 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.96])
        by : HOSTING RELAY : with ESMTP
        id fp3SoOHjrKzAwfp3SooYSl; Tue, 04 Oct 2022 14:02:18 -0700
X-CMAE-Analysis: v=2.4 cv=Dv2TREz+ c=1 sm=1 tr=0 ts=633c9f5a
 a=2X41b4ieGfoJAKBLAMfEgQ==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10 a=sCYMkZJ_nKMA:10
 a=iihcBN-LAAAA:8 a=4rrRiGjTwGos7wEA4cAA:9 a=ZXOyfd87I8AR-G90gsrY:22
 a=HcALgBdeMRM4wejQDfUI:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=39992 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1ofp3S-00Gpon-2e; Tue, 04 Oct 2022 14:02:18 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH v3 2/2] hwmon: (it87) Check for a valid chip before using force_id
Date:   Tue,  4 Oct 2022 22:01:03 +0100
Message-Id: <20221004210100.540120-3-ahmad@khalifa.ws>
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
X-CMAE-Envelope: MS4xfHs5QbeohB6SMkna5uRb36EKrPE6X1whvJWXjn0VOI9S8vJC2hZUo2iBw4uaEUp76pstiWLxuNUNe9ALUGKkZomUwHRl+oYEfmHjW3lONJeXnb3NBKCK
 U9BnF4145T3AcvcMpSn/fxD4Vru5cp+erNF4jMGou4yMGUq8T9808a6LemhClzVT4SmPrHDBP433KLBapXWr/ZkEcujl68jdafkgAAFALuJFUYwG5WQLl5+s
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Check there is a chip before using force_id parameter as there
is no value in registering a non-existent chip

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 drivers/hwmon/it87.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index c4f5500dcf3c..bb9870c79ffe 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2401,7 +2401,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		return err;
 
 	err = -ENODEV;
-	chip_type = force_id ? force_id : superio_inw(sioaddr, DEVID);
+	chip_type = superio_inw(sioaddr, DEVID);
+	/* check first for a valid chip before forcing chip id */
+	if (chip_type == 0xffff)
+		goto exit;
+
+	if (force_id)
+		chip_type = force_id;
 
 	switch (chip_type) {
 	case IT8705F_DEVID:
-- 
2.30.2

