Return-Path: <SRS0=ZG3s=PP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F630C43387
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 18:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4E1D2087F
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jan 2019 18:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbfAGS5e (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Jan 2019 13:57:34 -0500
Received: from gateway24.websitewelcome.com ([192.185.51.172]:42761 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726821AbfAGS5e (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Jan 2019 13:57:34 -0500
X-Greylist: delayed 1307 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Jan 2019 13:57:33 EST
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id F388A13BA649
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Jan 2019 12:35:45 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id gZkXg8hciYTGMgZkXguKyJ; Mon, 07 Jan 2019 12:35:45 -0600
X-Authority-Reason: nr=8
Received: from [189.250.130.205] (port=32884 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1ggZjL-002z6J-MD; Mon, 07 Jan 2019 12:35:45 -0600
Date:   Mon, 7 Jan 2019 12:34:31 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Eddie James <eajames@linux.vnet.ibm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] hwmon (occ): Fix potential integer overflow
Message-ID: <20190107183431.GA12428@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.130.205
X-Source-L: No
X-Exim-ID: 1ggZjL-002z6J-MD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.130.205]:32884
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Cast get_unaligned_be32(...) to u64 in order to give the compiler
complete information about the proper arithmetic to use and avoid
a potential integer overflow.

Notice that such function call is used in contexts that expect
expressions of type u64 (64 bits, unsigned); and the following
expressions are currently being evaluated using 32-bit
arithmetic:

val = get_unaligned_be32(&power->update_tag) *
                        occ->powr_sample_time_us;

val = get_unaligned_be32(&power->vdn.update_tag) *
                        occ->powr_sample_time_us;

Addresses-Coverity-ID: 1442357 ("Unintentional integer overflow")
Addresses-Coverity-ID: 1442476 ("Unintentional integer overflow")
Addresses-Coverity-ID: 1442508 ("Unintentional integer overflow")
Fixes: ff692d80b2e2 ("hwmon (occ): Add sensor types and versions")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/hwmon/occ/common.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 423903f87955..391118c8aae8 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -380,8 +380,8 @@ static ssize_t occ_show_power_1(struct device *dev,
 		val *= 1000000ULL;
 		break;
 	case 2:
-		val = get_unaligned_be32(&power->update_tag) *
-			occ->powr_sample_time_us;
+		val = (u64)get_unaligned_be32(&power->update_tag) *
+			   occ->powr_sample_time_us;
 		break;
 	case 3:
 		val = get_unaligned_be16(&power->value) * 1000000ULL;
@@ -425,8 +425,8 @@ static ssize_t occ_show_power_2(struct device *dev,
 				       &power->update_tag);
 		break;
 	case 2:
-		val = get_unaligned_be32(&power->update_tag) *
-			occ->powr_sample_time_us;
+		val = (u64)get_unaligned_be32(&power->update_tag) *
+			   occ->powr_sample_time_us;
 		break;
 	case 3:
 		val = get_unaligned_be16(&power->value) * 1000000ULL;
@@ -463,8 +463,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 				       &power->system.update_tag);
 		break;
 	case 2:
-		val = get_unaligned_be32(&power->system.update_tag) *
-			occ->powr_sample_time_us;
+		val = (u64)get_unaligned_be32(&power->system.update_tag) *
+			   occ->powr_sample_time_us;
 		break;
 	case 3:
 		val = get_unaligned_be16(&power->system.value) * 1000000ULL;
@@ -477,8 +477,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 				       &power->proc.update_tag);
 		break;
 	case 6:
-		val = get_unaligned_be32(&power->proc.update_tag) *
-			occ->powr_sample_time_us;
+		val = (u64)get_unaligned_be32(&power->proc.update_tag) *
+			   occ->powr_sample_time_us;
 		break;
 	case 7:
 		val = get_unaligned_be16(&power->proc.value) * 1000000ULL;
@@ -491,8 +491,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 				       &power->vdd.update_tag);
 		break;
 	case 10:
-		val = get_unaligned_be32(&power->vdd.update_tag) *
-			occ->powr_sample_time_us;
+		val = (u64)get_unaligned_be32(&power->vdd.update_tag) *
+			   occ->powr_sample_time_us;
 		break;
 	case 11:
 		val = get_unaligned_be16(&power->vdd.value) * 1000000ULL;
@@ -505,8 +505,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 				       &power->vdn.update_tag);
 		break;
 	case 14:
-		val = get_unaligned_be32(&power->vdn.update_tag) *
-			occ->powr_sample_time_us;
+		val = (u64)get_unaligned_be32(&power->vdn.update_tag) *
+			   occ->powr_sample_time_us;
 		break;
 	case 15:
 		val = get_unaligned_be16(&power->vdn.value) * 1000000ULL;
-- 
2.20.1

