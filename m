Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15C0EB64D9
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jul 2023 12:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbjGGMat (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jul 2023 08:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjGGMas (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jul 2023 08:30:48 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 724CA2110
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Jul 2023 05:30:46 -0700 (PDT)
IronPort-SDR: 64a80565_eSGktz7CQE9zToUTfECkm5nbvorF8qy2Ntdq42XxjiYVYuL
 KR+q2SqeXg+BIY08vD5wNaoSjqRVhSA/qGWecHw==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AYAgASBahkjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?UaCM4JRth8PAQ8BAUQEAQGFBgKGFSY4EwECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBgQUAQEBAUBFhWgNhgUCAQMnCwENAQE3AQ8ZOFcGARKCfoJdqWMzg?=
 =?us-ascii?q?QGCCQEBBoJlrjGBXwmBQowggRmDO3pCP4FOhH6LBo4ghV0FAjKNFIEnb4EeN?=
 =?us-ascii?q?2d6AgkCEWeBCAhfgW4+Ag1UCwtjgRyCTgICEToUU18ZHQMHA4EFEC8HBDImB?=
 =?us-ascii?q?gkYLyUGUQcXFiQJExVBBINYCoELPxUOEYJXIgIHNjwbTYJqCRdDU4EBEDEEF?=
 =?us-ascii?q?B5AAwkDBwVJQAMLGA1LESw1FBtJgQcXY4FuCiQkpgaBDoI/KsRkhBWBXZ8kT?=
 =?us-ascii?q?YFKqA+YJSCjRoQvAgoHFoF6gX5NHxmDIk8DGQ+OIBmCFZFRYzsCBwsBAQMJi?=
 =?us-ascii?q?0gBAQ?=
IronPort-PHdr: A9a23:t05DzBelUoFWfDY70JGT7wX+lGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23: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
 OR2Fqcc5fRt6soBqT4v28GG
IronPort-HdrOrdr: A9a23:B9/QNa3HsdDvE1IvbZtp/AqjBGgkLtp133Aq2lEZdPU0SKalfg
 6V/cjzsiWE8Qr4Ohkb9OxoXZPtfZqyz+8X3WB8B9iftUzdyQ+VxeJZnO3fKl/bak/DH4dmvM
 8KT0E9MqyWMbEQt6bHCWeDferJT7S8gdiVbJ/lvhJQpBlRGt1dBhlCe3um+5JNNXJ77UtQLu
 vn2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3ASOVwPWkM+y7P2tXrBloUPDePu4/XOSPZ41H9LRK?=
 =?us-ascii?q?6MFZSUbCsFUDM+rtAyfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A0CAIcg0MmqS8PfGgo1OOdWHGgzUj5IuyBlo3ko8?=
 =?us-ascii?q?/gdSebzVfH2adqAWqTdpy?=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 07 Jul 2023 22:00:29 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 367CU7bL2026771
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 7 Jul 2023 22:30:25 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 367CU7bL2026771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1688733025; bh=KaTcNhtT+ISNshmuM37/JCO1IUVbv9wjlBS2DrUHwH4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O6nwapHxfnyyDcH3r0nzTBVNpqPIuWtD/C/IFMBAcbZgmGkgelDJij5EZJRRngH4E
         g0NE52EkEBIpMQ3Mo4PdqAWhY7aiUkg6S8tE3ct/XOxyMmbgnrutEMd3mi6wzXcO0+
         ESj9w+MN7h1B/n1a07VEqAItEizG9rR/CnogCHmIU1mguUZxkVXpfS3qG5Nyl+h6BH
         2fSSUkSB/K/bjS7wxPeHbQYXA/F2DoEtqY4cG/+Jy0Ln3SAQndu8W/vTXFzAC7L78z
         jJZrW94lkqS+ys0BbDQ5CCOPe2aDZzV1yU3+11b0aJ7Ft3isF6QJB5gqIdStkhlImN
         TiAgBccp6yGGw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 2/3] hwmon: (it87) Improve temperature reporting support
Date:   Fri,  7 Jul 2023 22:29:51 +1000
Message-ID: <20230707123005.956415-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707123005.956415-1-frank@crawford.emu.id.au>
References: <20230707123005.956415-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 07 Jul 2023 22:30:25 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.1 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add test if thermistor sensor type attribute should be visible, i.e.
test if the attribute is defined.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Split single patch into multi-patch set following review.

---
 drivers/hwmon/it87.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 7a1224ddc8b1..fb62f2a7017a 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2330,6 +2330,14 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 	if (!(data->has_temp & BIT(i)))
 		return 0;
 
+	if (a == 3) {
+		int type = get_temp_type(data, i);
+
+		if (type == 0)
+			return 0;
+		return attr->mode;
+	}
+
 	if (a == 5 && !has_temp_offset(data))
 		return 0;
 
-- 
2.41.0

