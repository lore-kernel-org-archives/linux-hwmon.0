Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C431C77B60
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Apr 2023 11:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjD2Lwj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Apr 2023 07:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjD2Lwh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Apr 2023 07:52:37 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8ED991FC0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 04:52:36 -0700 (PDT)
IronPort-SDR: 644d04fe_tNoqGhUZiFDVF5hcL3wc0lbeUyHpwGQUl9NFgvVvl0GYmbJ
 Bgt3mW1Tq3dEMnkLnQz/nU68VjORH1iyn8Ald1A==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AYAgBQBE1kjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?UaCLoJPtWUPAQ8BAUQEAQGFBgKFQCY4EwECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBgQUAQEBAUBFhWgNhgQCAQMnCwENAQE3AQ8ZOFcGARKCfoJdsTgzg?=
 =?us-ascii?q?QGCCAEBBoJkmmqBXgmBQYwOgRaDN3pCP4FOhA9viwaXNIEzdIEnP2+BBAIJA?=
 =?us-ascii?q?hFrgRAIaIFzQAINZAsLbYFEgxQEAhRCDBRdAmsbBggVARgDBwcCAWkDCQMHB?=
 =?us-ascii?q?UlAAwsYDRY6ESw1FB9LgQsYYwSCAgYBJSSYOnKBDoJpxAyECIFZnxNNgUanf?=
 =?us-ascii?q?Zd7IKMshC0CCgcWgXqBfk0fGYMiTwMZD44gGYITkVFjPQIHCwEBAwmLRQEB?=
IronPort-PHdr: A9a23:ro9z/xU2olIbg40GwpmhhVARu3DV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23: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
 QryJlWrVvRp/qxUeA==
IronPort-HdrOrdr: A9a23:CzjfyaDyLM5DucvlHel255DYdb4zR+YMi2TDt3oadfWaSK2lfq
 eV7Y0mPX2dslsssRQb9exoV5PwIk80maQb3WBVB8bHYOCEghrPEGgd1/qB/9SIIUSXndK1l5
 0QFJSWY+eRMbEVt6jHCIbUKadZ/DD+ytHMuQ7H9QYQceh1UdAc0+6nMHfhLqWmLDM2f6YEKA
 ==
X-Talos-CUID: 9a23:Q+G0WmOl0ShBz+5DBAg592BTC58ZSlLmnUXaOXWyGUhWV+jA
X-Talos-MUID: 9a23:4iMZPAQnOg/I6USpRXTcliE7Bv1v2p2VJ1JOmooWkfinGAlJbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 29 Apr 2023 21:22:31 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33TBq71H3093879
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 29 Apr 2023 21:52:27 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33TBq71H3093879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1682769147; bh=bSojTUSDDl0fjBG1iY8i0/SwL7mKh3cuXl3AY8oloXQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EAMeuFKc1Gn/R1qVgkkjW4LLdG+0/RRx4SQaa2Cz+3Uz60aSv7wjj7RLeCyBmbFaC
         xJ4hZ4N/UDgX6uKIkiWkedx1ekQe8hCI8w+7a7UIXDwX3hByPe2iPp1YcfMiQq4mxd
         5xpemTtTIAK+T1mWipjE1ApdU/rDJCpKxEw2urp+NWZoEKlxKb94tpk4tn+8IXQgx9
         mgfcpVbt9rzy1rl+TSPJ5OfNexcKjUJsCA89ywXgPWqWXMJB2O0y+/GlDbo8D5LZcK
         KptYCc1L/tnsx8MI6SdQvRkOO5RJ4gGHO4RnbGqxsab6FDOFfBC4ptUh11lmHI4pAv
         xVM09wuRAbnrQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 2/3] hwmon: (it87) Add controls for chips with only 4 PWMs
Date:   Sat, 29 Apr 2023 21:52:04 +1000
Message-Id: <20230429115205.1547251-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429115205.1547251-1-frank@crawford.emu.id.au>
References: <20230429115205.1547251-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 29 Apr 2023 21:52:27 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add feature and support for chips with only 4 PWMs.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index bd9a24942e70..d5482c6ed18f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -318,6 +318,7 @@ struct it87_devices {
  */
 #define FEAT_CONF_NOEXIT	BIT(19)	/* Chip should not exit conf mode */
 #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
+#define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -518,8 +519,11 @@ static const struct it87_devices it87_devices[] = {
 #define has_vid(data)		((data)->features & FEAT_VID)
 #define has_in7_internal(data)	((data)->features & FEAT_IN7_INTERNAL)
 #define has_avcc3(data)		((data)->features & FEAT_AVCC3)
-#define has_five_pwm(data)	((data)->features & (FEAT_FIVE_PWM \
-						     | FEAT_SIX_PWM))
+#define has_four_pwm(data)	((data)->features & (FEAT_FOUR_PWM | \
+						     FEAT_FIVE_PWM | \
+						     FEAT_SIX_PWM))
+#define has_five_pwm(data)	((data)->features & (FEAT_FIVE_PWM | \
+						     FEAT_SIX_PWM))
 #define has_six_pwm(data)	((data)->features & FEAT_SIX_PWM)
 #define has_pwm_freq2(data)	((data)->features & FEAT_PWM_FREQ2)
 #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
@@ -2734,8 +2738,10 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	else
 		sio_data->skip_in |= BIT(9);
 
-	if (!has_five_pwm(config))
+	if (!has_four_pwm(config))
 		sio_data->skip_pwm |= BIT(3) | BIT(4) | BIT(5);
+	else if (!has_five_pwm(config))
+		sio_data->skip_pwm |= BIT(4) | BIT(5);
 	else if (!has_six_pwm(config))
 		sio_data->skip_pwm |= BIT(5);
 
-- 
2.40.0

