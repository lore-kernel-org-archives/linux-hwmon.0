Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4A2C433B4
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Apr 2021 04:48:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF1B5613A9
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Apr 2021 04:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhD0EtV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Apr 2021 00:49:21 -0400
Received: from mail-m121145.qiye.163.com ([115.236.121.145]:23932 "EHLO
        mail-m121145.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhD0EtV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Apr 2021 00:49:21 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Apr 2021 00:49:20 EDT
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 99AA58001ED;
        Tue, 27 Apr 2021 12:42:31 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] hwmon: Remove unneeded semicolons
Date:   Tue, 27 Apr 2021 12:42:19 +0800
Message-Id: <20210427044219.7799-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQxhMSlZCHh4YQx0dGEkdTElVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQg6URw4KT8XKFZDDD8LKj0e
        OhdPCU9VSlVKTUpCT0JDTk5JSk5CVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKQ0lINwY+
X-HM-Tid: 0a7911a2c9e1b03akuuu99aa58001ed
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix the following coccicheck warning:

./drivers/hwmon/corsair-psu.c:379:2-3: Unneeded semicolon

Remove unneeded semicolons.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/hwmon/corsair-psu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 3a5807e4a2ef..02298b86b57b 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -355,7 +355,7 @@ static umode_t corsairpsu_hwmon_power_is_visible(const struct corsairpsu_data *p
 		return 0444;
 	default:
 		return 0;
-	};
+	}
 }
 
 static umode_t corsairpsu_hwmon_in_is_visible(const struct corsairpsu_data *priv, u32 attr,
@@ -376,7 +376,7 @@ static umode_t corsairpsu_hwmon_in_is_visible(const struct corsairpsu_data *priv
 		break;
 	default:
 		break;
-	};
+	}
 
 	return res;
 }
-- 
2.25.1

