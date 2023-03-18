Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE04C7618B
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Mar 2023 08:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjCRIGJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Mar 2023 04:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjCRIGI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Mar 2023 04:06:08 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC6251205A
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Mar 2023 01:06:01 -0700 (PDT)
IronPort-SDR: 641570e7_jwGErRtF6cb0z0sHmLt1g3sWkCa+l1VJh9bPOOd8LjDVj3p
 dSaRAdR40MAsA+H6DE7iX3xmFDH6Hg3Dbw+EQWg==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AJAwB4bxVkjPQc8jxagRKBRoIugk+zWIF+DwEPAQFEB?=
 =?us-ascii?q?AEBhQWFNyY2Bw4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBAQFAR?=
 =?us-ascii?q?YVoDYZYNgENAQE3ASiBFQGDEIJdthSBAYIIAQEGgmKaaIFeCYFAi26BFoM2g?=
 =?us-ascii?q?Tw/gU6ED26EN4ZMmRcKgTR2gSAOSnOBBAIJAhFrgRIIa4F9QQINZQsOdoFMA?=
 =?us-ascii?q?oISAwkDBwVJQAMLGA0WOhMsNRQhXmwtEhIFAwsVKkcECDkGUBECCA8SDyxDD?=
 =?us-ascii?q?kI3NBMGXAEpCw4RA09CGWwEggkKByYknRABexOBRMUMhASBWZ8TTIFGgiSlV?=
 =?us-ascii?q?ZdqIKMlhCwCCgcWgWkLggNNHxmDIk8DGQ+OOYITkVNhOwIHCwEBAwmLQwEB?=
IronPort-PHdr: A9a23:F/L8tBGyZmMFzLEtD8FQHZ1GfhYY04WdBeZdwpAml6kIeb6q4JrlJ
 kCZ6PBwyl7FG4zGuLpNkeGDtafmVCQb5IqZ9moPdZtQWloEkZAYkwB6UpGMAEGpIKK1P35jT
 pZJXgY9rXqwaRc9JQ==
IronPort-Data: A9a23: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
 LnyIJEr0sSZmfmFndou28E=
IronPort-HdrOrdr: A9a23:GSqhLqjl9DW/CQhBCUD2tsqvgnBQXvQji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhP03J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUQiTXeVfBPXZsl/d8kTFn4Y36U
 4KSchD4bPLY2STAqvBkW+F+q4bsby6GbiT9J3jJmlWPHpXgn5bnn5E4tfyKDwPeDV7
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 18 Mar 2023 18:35:58 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32I85iJY2991191
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 18 Mar 2023 19:05:53 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32I85iJY2991191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1679126754; bh=MngVRPHWosju6NtEcWXzusuH++xdHoG0Zx0xNr1HOqE=;
        h=From:To:Cc:Subject:Date:From;
        b=Un/wtAhRqh0FMJ02HGFnCaj1WNDiaczrQrnh0/BCRhrXI04NIDyBYDSbQKL/+Fv65
         npRhkWIqq85eMOkv/vh6uj3edpAn3VZ8Sqh5FTB9BarLArt41R0hIC8mEg77VRV2Do
         h6QY7aw7n/xSxAnSvMNN0yd/zHvL4avieFofr/61npSneXmzbFCVHgUmOvBwQdbr7G
         1NhoXM3elLX24M98IAS9t4XZO+9+kRLISIAurZQy+a6WEf9Jm4X/JrB1+QJgiRtLLk
         Oi9kNPeAXjJ9zLyXy9wEgbnkGNEi/cvvMivkoWztELrwf+nI7pFoJwLg87KBdv1hFU
         44sUarpshnkag==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 0/2] hwmon (it87): Add scaling macro for recent ADC voltages
Date:   Sat, 18 Mar 2023 19:05:41 +1100
Message-Id: <20230318080543.1226700-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 18 Mar 2023 19:05:54 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Generalise scaling to include all recent ADC values and match the labels
for internal voltage sensors.

This includes correction of an existing error for voltage scaling for
chips that have 10.9mV ADCs, where scaling was not performed.

---

Changes since v1:
 * Split the original patch into two separate patches, one logical
   change per patch.

Frank Crawford (2):
  hwmon: (it87) Add scaling macro for recent ADC voltages
  hwmon: (it87) Generalise matching labels

 drivers/hwmon/it87.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.39.2

