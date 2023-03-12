Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D34EC6FA99
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 04:37:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjCLEhQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Mar 2023 23:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCLEhP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Mar 2023 23:37:15 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3A755A6D8
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Mar 2023 20:37:13 -0800 (PST)
IronPort-SDR: 640d55cb_a3pd9P025ssBjao0qlzSdqeOX5BAovuzVjWxGpkH+JrayMe
 kLp/4gLnNH/JLXOsbSZkcTQtD7Ve3iJ8ZrzwrEQ==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BTAgAwVA1kjPQc8jxaHgEBCxIMSYE7C4Iugk+zUIF+D?=
 =?us-ascii?q?wEPAQFEBAEBhQUChTMmNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGB?=
 =?us-ascii?q?BQBAQEBQEWFaA2GVgIBAycLAQ0BATcBDxk4VwYBEoJ+gl2wRjOBAYIIAQEGg?=
 =?us-ascii?q?mKaaIFeCYFAi22BFoM2ekI/gU6EfYQLhniYPgqBNHWBIA5Kc4EGAgkCEWuBE?=
 =?us-ascii?q?ghogX5BAg1lCw50gWACgQkDCQMHBUlAAwsYDRY6Eyw1FCFebC4SEgUDCxUqR?=
 =?us-ascii?q?wQIOQYbNBECCA8SDyxEDkI3NBMGXAEpCw4RA09CGWwEgg4GASgkm0dygQ7GR?=
 =?us-ascii?q?oQEgVefE0yBRqd5l2YgoyOEKwIKBxaBYoIVTR8ZgyJPAxkPjiAZghORU2E7A?=
 =?us-ascii?q?gcLAQEDCYhqglkBAQ?=
IronPort-PHdr: A9a23:VvPV9BAmqGsVtCczGiglUyQVWBdPi9zP1kY94Js7kPRFaK288ZP4M
 ArS4OgrjVOPVJiIo/tegL/QtKbtEXcF/Y7Hqn0Hd4BBEh4d3Msak1ZyX8eMBR/3cKG6PXVoT
 s9IDQc39HrjbiBo
IronPort-Data: A9a23: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
 z3FFqHYZXBdGq1UeNs=
IronPort-HdrOrdr: A9a23:++qfP6PO7oc/rcBcThujsMiBIKoaSvp037BK7SpMoNJuE/Bw8P
 re5cjyt3fP5Qr5PUtNpTnuAtjifZqxz/FICMwqTNOftWrdyQ2Vxf9ZnOnfKlTbckWUygce79
 YGT0EUMr3N5DZB4/oTb2SDYq4dKaG8gcWVbP/lvgtQpB9RGtxdBthCe32m+pwffng9OaYE
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 12 Mar 2023 15:02:11 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32C4VeSL3479492
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 12 Mar 2023 15:32:01 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32C4VeSL3479492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1678595521; bh=tGiY6EjJyqdn5h84EWG/fnSzuttx241dxR8mvw527V8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p4xZyfisECsOwwy9OtGjOQexXmS1bHDKpQ9LGRwlt1xnyubJk6EphOqAOZlKa5K8v
         N8Z9FIir3NGkGE/iObQHaJhEDoFAzr5PWOGnYvs+mXiMfsffnbcPRsNb1sTom/hTT4
         aWPmYWu99m9J+hqFuAzaPJYYRAtnB05V3mqLfbod7N7ca24oeMrUY9r9kdMKIbxB7j
         ECvJzAq28nIoCm4Ol89Q/UaJBjbjr/28qqPafGTy4i4mALfhFTB5UZCTxgEtj22Ast
         hhX+W35uGb9O/QDZSfFlZT3NUw8Rj38+g35RRcRpEgY7KrnYLQhuaoX7DXwmVcbASF
         mVySvge+GacYQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 3/3] hwmon (it87): Minor optimisation of return value
Date:   Sun, 12 Mar 2023 15:31:37 +1100
Message-Id: <20230312043137.1744885-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312043137.1744885-1-frank@crawford.emu.id.au>
References: <20230312043137.1744885-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 12 Mar 2023 15:32:01 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Optimisation of return value from previously applied patch sets.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index ca4b79839d98..7780a5cfd352 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2865,7 +2865,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		sio_data->skip_pwm |= dmi_data->skip_pwm;
 
 exit:
-	superio_exit(sioaddr, config ? has_conf_noexit(config) : false);
+	superio_exit(sioaddr, config && has_conf_noexit(config));
 	return err;
 }
 
-- 
2.39.2

