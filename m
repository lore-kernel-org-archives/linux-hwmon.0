Return-Path: <SRS0=pbQB=PS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41E3C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Jan 2019 16:45:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EF56206B7
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Jan 2019 16:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbfAJQpl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Jan 2019 11:45:41 -0500
Received: from gateway31.websitewelcome.com ([192.185.144.96]:48423 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728180AbfAJQpk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Jan 2019 11:45:40 -0500
X-Greylist: delayed 1269 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Jan 2019 11:45:40 EST
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id 26438B191D
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Jan 2019 10:24:31 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id hd8AgqdEp4FKphd8BgHmc1; Thu, 10 Jan 2019 10:24:31 -0600
X-Authority-Reason: nr=8
Received: from [189.250.130.205] (port=50704 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1ghd8A-000D11-96; Thu, 10 Jan 2019 10:24:30 -0600
Date:   Thu, 10 Jan 2019 10:24:29 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] hwmon: (adt7462) Mark expected switch fall-throughs
Message-ID: <20190110162429.GA15908@embeddedor>
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
X-Exim-ID: 1ghd8A-000D11-96
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.130.205]:50704
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Warning level 3 was used: -Wimplicit-fallthrough=3

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/hwmon/adt7462.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index b0211f731251..030f5d49c061 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -448,6 +448,7 @@ static const char *voltage_label(struct adt7462_data *data, int which)
 		case 3:
 			return "+1.5V";
 		}
+		/* fall through */
 	case 2:
 		if (!(data->pin_cfg[1] & ADT7462_PIN22_INPUT))
 			return "+12V3";
@@ -505,6 +506,7 @@ static const char *voltage_label(struct adt7462_data *data, int which)
 		case 3:
 			return "+1.5";
 		}
+		/* fall through */
 	case 11:
 		if (data->pin_cfg[3] >> ADT7462_PIN28_SHIFT ==
 					ADT7462_PIN28_VOLT &&
@@ -542,6 +544,7 @@ static int voltage_multiplier(struct adt7462_data *data, int which)
 		case 3:
 			return 7800;
 		}
+		/* fall through */
 	case 2:
 		if (!(data->pin_cfg[1] & ADT7462_PIN22_INPUT))
 			return 62500;
@@ -599,6 +602,7 @@ static int voltage_multiplier(struct adt7462_data *data, int which)
 		case 3:
 			return 7800;
 		}
+		/* fall through */
 	case 11:
 	case 12:
 		if (data->pin_cfg[3] >> ADT7462_PIN28_SHIFT ==
-- 
2.20.1

