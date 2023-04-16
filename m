Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82161C77B61
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 04:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjDPEZj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 00:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDPEZi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 00:25:38 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AFD07271C
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Apr 2023 21:25:34 -0700 (PDT)
IronPort-SDR: 643b78b9_El9YGF+KMEXTXR0PvMJ0uz7o/Qcf/1TTffC6iTb0S/5Glqf
 eB2voDecIKy2LrjUXrMJzHJ0hB4HLZNjOZl5sbA==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BEAwCkdztkjPQc8jxaHgEBCxIMSYE7C4Iugk+WAp9dD?=
 =?us-ascii?q?wEPAQFEBAEBhQaFPiY3Bg4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEF?=
 =?us-ascii?q?AEBAQFARYVoDYYGNgENAQE3ASiBFQGDEIJdrzeBAYIIAQEGgmKaaoFeCYFBA?=
 =?us-ascii?q?Yt0gRaDNoE8P4FOhH6LBolrkGuBNHaBIA5KcoEEAgkCEWuBEAhqgXlAAg1kC?=
 =?us-ascii?q?w5vgUmDKgQCFEQOVAMJAwcFSUADCxgNFjoTLDUUIFxsLRISBQMLFSpHBAg4B?=
 =?us-ascii?q?k8RAggPEg8sRAxCNzMTBlwBKQsOEQNOQhlsBIIKByYknyBZIhOBcTgHOTrDR?=
 =?us-ascii?q?YQIgVmfFE2BRqd8l3cgohKBGIQsAgoHFoF5gX9NHxmDIk8DGQ+BG40FGYITk?=
 =?us-ascii?q?VFjPQIHCwEBAwmLRQEB?=
IronPort-PHdr: A9a23:24n2cxBXSPEstCA1WJ0jUyQVWBdPi9zP1kY94Js7kPRFaK288ZP4M
 ArS4OgrjVOPVJiIo/tegL/QtKbtEXcF/Y7Hqn0Hd4BBEh4d3Msak1ZyX8eMBR/3cKG6PXVoT
 s9IDQc39HrjbiBo
IronPort-Data: A9a23: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
 z3FFqHYZXBdGq1UeNs=
IronPort-HdrOrdr: A9a23:mrOmXqAtLlz5JjHlHemC55DYdb4zR+YMi2TDt3oadfWaSK2lfq
 eV7ZMmPX2dslsssRQb9exoV5PwIk80maQb3WBzB8bHYOCZghrLEGgK1+KLqAEIcBefygcy78
 ldmycSMqyXMbEDt7ee3OChKadb/DCYytHSuQ4A9QYVcem6A5sQlztENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AjKeCFGquvORwbbTz8ItX+gnmUdB4U2T4yVT/H0/?=
 =?us-ascii?q?7LTtGbLyUDg+R/4oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AF1cy4A9zOhGXHuCfaxN+LY2Qf9lz2rmzB00Hqoo?=
 =?us-ascii?q?L4euuJXRyMW2NvCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 16 Apr 2023 13:55:30 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33G4PCj13415316
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 16 Apr 2023 14:25:20 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33G4PCj13415316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681619121; bh=STkZTpRgXk4Bt9+1yrFHhQyLiEj+20CETjs0KGzkvCk=;
        h=From:To:Cc:Subject:Date:From;
        b=EzQjC7CxTChvpvOcJm7ng04+4MIMoQF15n7z5380xFU5ubE3yRRHKBNcFoe2kJtqG
         /r+fDpbme7Im6IGWpsFautfqkLDmeEH23HxP3XOCL/m4O0TebKs2oa46j607J2PcNl
         z457FeVYaKqQbFWfy3pBmEJxHcMB4JCorZD8KJKmeS/a1C5ys5Odt+aaAxSrz2BZTA
         RozG8RBLjBh7bl9+lrxvGPMgutwF2yeu264m9EB0za0YrGfoPOLriWwU1ulK7vlwj6
         q10CMflTm4cJYA1d6miDKyVZoA2dQXg8h87jc3QKkFgZdxp699GAZJsjRg/bUNrV7Y
         9wV0rGc5FED6g==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 0/4] hwmon: (it87) Add access control for SMBus
Date:   Sun, 16 Apr 2023 14:25:06 +1000
Message-Id: <20230416042510.1929077-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 16 Apr 2023 14:25:21 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some chips support Environmental Controller access through SMBus.
On those chips, it is possible that an Embedded Controller accesses
Environmental Controller chip registers at any time. There is no real
means for synchronization. On banked chips, this can and will result in
access errors with unpredictable result.

Disable SMBus access while reading or writing environmental controller
registers to work around the problem.

---

Changes since v1:
 * Reorder patches within patchset.
 * Remove spaces before tab.

Frank Crawford (4):
  Some chips support Environmental Controller access through SMBus.
    Disable SMBus access while reading or writing environmental
    controller registers.
  Test for error in call to it87_update_device and return error.
  Add calls to smbus_enable/smbus_disable as required.
  Disable/enable SMBus access for IT8622E chipset.

 drivers/hwmon/it87.c | 288 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 240 insertions(+), 48 deletions(-)

-- 
2.39.2

