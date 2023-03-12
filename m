Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2172EC6FD19
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 04:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjCLEhK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Mar 2023 23:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCLEhJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Mar 2023 23:37:09 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D5D4C5940C
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Mar 2023 20:37:07 -0800 (PST)
IronPort-SDR: 640d55be_EhRyBme+0a7icCz7p8OwCp82LWXL+iQ6ykckJ6Rk+bxjGLj
 q/bBAzGATlFcvcdh5yMUED0ZO079bet0v1knFhQ==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BPAgAwVA1kjPQc8jxagRKBRoIugk+zUIF+DwEPAQFEB?=
 =?us-ascii?q?AEBhQWFNSY0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEFAEBAQFAR?=
 =?us-ascii?q?YVoDYZYNgENAQE3ASiBFQGDEIJdsHmBAYIIAQEGgmKaaIFeCYFAi22BFoM2g?=
 =?us-ascii?q?Tw/gU6EfYQ3hkyYPgqBNHWBIA5Kc4EGAgkCEWuBEghogX5BAg1lCw50gWACg?=
 =?us-ascii?q?QkDCQMHBUlAAwsYDRY6Eyw1FCFebC4SEgUDCxUqRwQIOQZPEQIIDxIPLEQOQ?=
 =?us-ascii?q?jc0EwZcASkLDhEDT0IZbASCDgcoJJw5gQ6CacNdhASBV58TTIFGgiQBpVSXZ?=
 =?us-ascii?q?iCjI4QrAgoHFoFighVNHxmDIk8DGQ+OOYITkVNhOwIHCwEBAwmLQwEB?=
IronPort-PHdr: A9a23:tfS0JRwngZoW8RjXCzPpngc9DxPP853+PxIOrJE9gq1Adb6vuZnnI
 Qre6bNkkQyBVJ/QvvRDjeeeqKX8QSoa7JOGrH1HcYQZWRMJ05dJlgUsUsLZVh2pday4ZCZjR
 JZJXwc6l0w=
IronPort-Data: A9a23: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
 OR2Fqcc5fRt6soBqT4v28GG
IronPort-HdrOrdr: A9a23:hxKoFq87byru69OrfMZuk+D2I+orL9Y04lQ7vn2ZKSY+TiVXra
 GTdZMgpHjJYFR4YhwdcLW7VJVoLkmslqKdjbN/AV7AZniDhILXFvAB0WKK+VSJcBEWndQ86U
 4PScZD4FKcNykdsS+D2njcLz85+qj8zEm3v5ak856zd3ASV0mwhz0JcjqmLg==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 12 Mar 2023 15:01:58 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 32C4VeSI3479492
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 12 Mar 2023 15:31:49 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 32C4VeSI3479492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1678595511; bh=ae9Zszh+M1I0LZZtGn0CD/iCpY2Xxw0dZN4boJLB4xU=;
        h=From:To:Cc:Subject:Date:From;
        b=Lh5/w3ZuveF0tBKaNO/CawHU1mpsbpim/sviDtew2K00KfVIg1eJZW+c7gcCrPc5j
         WZPknEZr8qtfIlVV9Cqv0t74W5+ZwprFAEz1ioFUbWa53B3daA2MZyP7Zz30OYKx7C
         LK3hJ56mmi1H6PqLZRkNsgIChTggqz7MHS/Q3uw1B9sSxcCesnpHO45byEHzEClYwX
         S5+uaUtxCAM0Rg0HAS2spLuMJO4rSLdgFq9Cn9bSsAQXV4mkuh6G/XUvaiqBjGSIR8
         zgnDZHb1u/GoZIsdJdEWfeBrnYjNQsbFKfxLf0MML/O/O9U9XtZVxs6XX04lqVZTAM
         StlPXnMKefadA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 0/3] hwmon (it87): Support all know ADC values
Date:   Sun, 12 Mar 2023 15:31:34 +1100
Message-Id: <20230312043137.1744885-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 12 Mar 2023 15:31:51 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support of all know ADC values currently identified for it87 chips.

Generalise definitions for handling of scaled internal voltages and
voltage labels.

Apply some other minor optimistations.

---

Frank Crawford (3):
  Added support for 11mV ADC
  Add scaling macro for recent ADC voltages
  Minor optimisation of return value

 drivers/hwmon/it87.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.39.2

