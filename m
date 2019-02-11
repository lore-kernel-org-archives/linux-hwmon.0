Return-Path: <SRS0=q7Hd=QS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4092AC169C4
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Feb 2019 22:29:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 161BA2080F
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Feb 2019 22:29:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbfBKW3P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Feb 2019 17:29:15 -0500
Received: from gateway20.websitewelcome.com ([192.185.62.46]:33476 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726751AbfBKW3P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Feb 2019 17:29:15 -0500
X-Greylist: delayed 1296 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Feb 2019 17:29:15 EST
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 7FCD9400FB48B
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Feb 2019 16:07:39 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id tJjngRG0K2PzOtJjngwFMt; Mon, 11 Feb 2019 16:07:39 -0600
X-Authority-Reason: nr=8
Received: from [189.250.119.20] (port=59790 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1gtJjm-0043n4-Qg; Mon, 11 Feb 2019 16:07:38 -0600
Date:   Mon, 11 Feb 2019 16:07:38 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] hwmon: (f71882fg) Mark expected switch fall-through
Message-ID: <20190211220738.GA5955@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.119.20
X-Source-L: No
X-Exim-ID: 1gtJjm-0043n4-Qg
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.119.20]:59790
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch
cases where we are expecting to fall through.

This patch fixes the following warnings:

drivers/hwmon/f71882fg.c: In function ‘f71882fg_probe’:
drivers/hwmon/f71882fg.c:2457:33: warning: this statement may fall through [-Wimplicit-fallthrough=]
    data->auto_point_temp_signed = 1;
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
drivers/hwmon/f71882fg.c:2459:3: note: here
   case f71889fg:
   ^~~~

Warning level 3 was used: -Wimplicit-fallthrough=3

Notice that, in this particular case, the code comment is modified
in accordance with what GCC is expecting to find.

This patch is part of the ongoing efforts to enable
-Wimplicit-fallthrough.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/hwmon/f71882fg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index ca54ce5c8e10..83023798e489 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -2455,7 +2455,7 @@ static int f71882fg_probe(struct platform_device *pdev)
 		case f71869a:
 			/* These always have signed auto point temps */
 			data->auto_point_temp_signed = 1;
-			/* Fall through to select correct fan/pwm reg bank! */
+			/* Fall through - to select correct fan/pwm reg bank! */
 		case f71889fg:
 		case f71889ed:
 		case f71889a:
-- 
2.20.1

