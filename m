Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463CDC77B7C
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Apr 2023 11:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjD2Lwh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Apr 2023 07:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjD2Lwg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Apr 2023 07:52:36 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 17D571BF0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 04:52:32 -0700 (PDT)
IronPort-SDR: 644d04fc_lF4nEymyrTus2Npl5y8xH3DbV4n+mRg8qZjLBek82RWUoAc
 B9xwuXYvlcNbIuI2dcvPu3aiUFU/XcNrmD/tw7A==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AEAwBQBE1kjPQc8jxaHQEBAQEJARIBBQUBSYFGgi6CT?=
 =?us-ascii?q?7VlDwEPAQFEBAEBhQaFQiY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gQUAQEBAUBFhWgNhgY2AQ0BATcBKIEVAYMQgl2xa4EBgggBAQaCZJpqgV4Jg?=
 =?us-ascii?q?UGMDoEWgzeBPD+BToQPb4sGlzSBM3SBJz9vgQQCCQIRa4EQCGiBc0ACDWQLC?=
 =?us-ascii?q?22BRIMUBAIUQgwUXQJrGwYIFQEYAwcHAgFpAwkDBwVJQAMLGA0WOhEsNRQfS?=
 =?us-ascii?q?4ELGGMEggIHJSSZLIEOgmmSd7EVhAiBWZ8TTYFGgiQTpUaXeyCCLqB+hC0CC?=
 =?us-ascii?q?gcWgXqBfk0fGYMiTwMZD44gGYITkVFjPQIHCwEBAwmLRQEB?=
IronPort-PHdr: A9a23:4iu0GxEM2XaugHm1C4O6BJ1GfhYY04WdBeZdwpAml6kIeb6q4JrlJ
 kCZ6PBwyl7FG4zGuLpNkeGDtafmVCQb5IqZ9moPdZtQWloEkZAYkwB6UpGMAEGpIKK1P35jT
 pZJXgY9rXqwaRc9JQ==
IronPort-Data: A9a23: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
 c0FsGjFVvRrLkqFmc5IjhBjvdpa+w==
IronPort-HdrOrdr: A9a23:NUY+paxEK3k27LaSuqEsKrPwAr1zdoMgy1knxilNoHxuGPBwWf
 rOoB19726StN5yMEtMpTnkAsW9qBznhP1ICOUqUotKPzOW3FdAUrsSj7cKqgeIc0bDH4VmtZ
 uIHZIRNDV+YGIK6/oSmDPIdurI2OP3ipxAm92utEuFkjsaEp2JPm9Ce36mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AbR6ekGr93eJeCUQwvIzpxfzmUe8rLVjRylWAGB6?=
 =?us-ascii?q?TSmZGaIywGWao8bwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AdF+UdA4ORf/uLCqEIq8jd3hCxoxCzo2xKl4vzal?=
 =?us-ascii?q?ZuumjbB53JBfNrhCoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 29 Apr 2023 21:22:29 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33TBq71F3093879
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 29 Apr 2023 21:52:16 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33TBq71F3093879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1682769137; bh=5FFZoKUre/EUvg7tA4dUaXwAqRY6GKLtpUVES2SQaRk=;
        h=From:To:Cc:Subject:Date:From;
        b=DNVcATMsFn7QwxDz0+sVOtvdlBy1gngrC0XUG3Ly41K64BHd0pLJP3/ktrVQIsbA1
         2ThbDMkEeFPEcpG42L/0mmeG+zmUJxi/dDT9sd+OcJwD5wyEq7X29GZkIecw1CmRJs
         M+m3s2oFGV7H0T9sTnhIvFITTD0wm6BnLkDabDETWHVAIv4hbHlqMn74xB728n4Ds0
         u5RdTu7DIL+pi/+oIGDI4gRoO33Yl57FVQkLP8Q0dFIVLC12Xm/Oxqf5t9tAXQ4kzD
         GIaUh1S9rYuRq88szPqCWQqW2GAl/aKFVjH6djMyFF2IK/2pDf5Xr+Ztpkc3FunvE1
         GtqTSkx3kvJFw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 0/3] hwmon: (it87) Add support for 4 fans chips
Date:   Sat, 29 Apr 2023 21:52:02 +1000
Message-Id: <20230429115205.1547251-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 29 Apr 2023 21:52:17 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Chips with only 4 fans defined are currently treated as having 5 fans,
so add definitions for control and measurement of the 4th fan.

Enable these definitions for chip IT8732E.

---
Frank Crawford (3):
  Add controls for chips with only 4 fans
  Add controls for chips with only 4 PWMs
  Update IT8732F chip for 4 fans and PWMs

 drivers/hwmon/it87.c | 67 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 15 deletions(-)

-- 
2.40.0

