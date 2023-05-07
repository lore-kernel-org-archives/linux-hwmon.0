Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FD0C77B75
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 May 2023 10:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjEGKla (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 May 2023 06:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjEGKl3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 May 2023 06:41:29 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 338BB100DC
        for <linux-hwmon@vger.kernel.org>; Sun,  7 May 2023 03:41:24 -0700 (PDT)
IronPort-SDR: 64578051_fMbwL8KRD/NNMi8e47sE+JF7/lA+YPK37m9ZRRb9CuwKOTY
 ZNXAbqpIDNbfCdw4VdRKcQqAj0fd+goke2bC6YA==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AEAwBgf1dkjPQc8jxaHQEBAQEJARIBBQUBSYFGgi6CT?=
 =?us-ascii?q?7VnDwEPAQFEBAEBhQaFSCY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gQUAQEBAUBFhWgNhgc2AQ0BATcBKIEVAYMQgl2sRIEBgggBAQaCZJpqgV4Jg?=
 =?us-ascii?q?UGMDoEWgzeBPD+BToR+iwaZGIEwdIEnP22BBAIJAhFpgRAIaIF0QAINZAsLb?=
 =?us-ascii?q?IFAgwsEAhFCDBRdAmsaCBIBEwMHBwIBgRgQOgcEPjIHCR9oAwkDBwVJQAMLG?=
 =?us-ascii?q?A0WNxEsNRQfLSCBCRhjBIIFByUkmwlaNIJpknmxJ4QJgVqfF02BRoIkpV8ul?=
 =?us-ascii?q?1QgozSELQIKBxaBeoF+TR8ZgyJPAxkPjiAZghORUWM9AgcLAQEDCYtFAQE?=
IronPort-PHdr: A9a23:jv9QcBE9YESH6GScqh1W/J1GfhYY04WdBeZdwpAml6kIeb6q4JrlJ
 kCZ6PBwyl7FG4zGuLpNkeGDtafmVCQb5IqZ9moPdZtQWloEkZAYkwB6UpGMAEGpIKK1P35jT
 pZJXgY9rXqwaRc9JQ==
IronPort-Data: A9a23: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
 j3C0iaY0sCN/6xU
IronPort-HdrOrdr: A9a23:HTKVBqDw48DN9A3lHemC55DYdb4zR+YMi2TDt3oadfWaSK2lfq
 eV7ZMmPX2dslsssRQb9exoV5PwIk80maQb3WBzB8bHYOCZghrLEGgK1+KLqAEIcBefygcy78
 ldmycSMqyXMbEDt7ee3OChKadb/DCYytHSuQ4A9QYVcem6A5sQlztENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AxUql3WlLOipzAaDX1egGJt2vZwvXOSPC3TDTDha?=
 =?us-ascii?q?gMEkqFeaodHyqofh+iMU7zg=3D=3D?=
X-Talos-MUID: 9a23:YIhSKQSHvKAeBUZvRXSz3TZIbJp5wZ2oFUAiuo82ppCDBDFvbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 07 May 2023 20:11:22 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 347Af9h33600390
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 7 May 2023 20:41:17 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 347Af9h33600390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1683456078; bh=oryrz/nI9m/XVNaGCg4kH28I4eS8qUeg3r4l21XZgsQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Z0OQPih2PKbnsuAYqjaDki420SSVFr6A4FIx+cxWRAXcmbolRfzHJtdBTCi4HUZI6
         SMvat3HLuH8WEunV5IneRbylulIaqmecgaGNa6CukkgqMafjoZgLKnZXFD81MtqYRr
         lv+O7/QS5KENnxEcKuGIbBtF7vU7zeMRiWgZu71sVnmoz/HV4KwnNOioEldXG5QPd4
         4de3R+oi4mI9mdh5ydEtfKggASH9MeBYTgUX+e9n+6H/YYTuJVdheffwYU2ifWXs0r
         iZgwle2MxjAC4pGDhcldOCt+RDD/IIB/Afmv8kSIuXAMWkrQ3EJ/z0wzj5QlJA1UfU
         fBXg6tXtABxQQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 0/2] hwmon: (it87) Generalise FAN_CTL ON/OFF Support
Date:   Sun,  7 May 2023 20:41:04 +1000
Message-Id: <20230507104106.1808726-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 07 May 2023 20:41:18 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Support for FAN_CTL ON/OFF is currently disabled only for IT8603E but
there are severl chips that don't support the configuration bits to turn
off fan control entirely.  Generalise this support for any chip.

---
Frank Crawford (2):
  Generalise support for FAN_CTL ON/OFF
  Add FAN_CTL feature for relevant chipsets

 drivers/hwmon/it87.c | 63 ++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 26 deletions(-)

-- 
2.40.0

