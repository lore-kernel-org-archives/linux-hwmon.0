Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698F7C10F16
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A8D82082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+GiJX+p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfDDP6y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44260 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbfDDP6m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:42 -0400
Received: by mail-pg1-f194.google.com with SMTP id i2so1441426pgj.11
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t5FOu/MvYaRoLQUXsFKiRC1YYalRTUyoCzyY2TSPZlI=;
        b=b+GiJX+pEwQkMY3qldn52uMws6HDcV9U8+RvIWXlTJ3hI5MtwzwurgmiMm/84KC2j2
         MrsYfW5f0O+n4qj+lIjGB44rR+YQyctxEKn5u99BxjTl6LEvKrgedXuoM6OzDj+Iq3xu
         I9rFGkf9JHKdVjEG8qGs3/cM9p6uZAcOdautveJ1GIJMgmGuOVgiwPLXwgvFykshJld3
         XiLf63rNUCO/gj5Jd5k9b+8M3CV5Gi71hI/dLnGzCY/heH1GAxxd0sdGdq2op75ymk54
         bKJ8b6KTRTt9LSLjcmbD5HDAU/KxJFFQ6GWqlteA+pZ0uTJwgE+69jTmXEAfZz3JyOvT
         ZpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=t5FOu/MvYaRoLQUXsFKiRC1YYalRTUyoCzyY2TSPZlI=;
        b=QZLYANbHOKOpvcIQxv+C0FTU0ivqgc1iojjdfxx0kzVJtTVrecdsAcn820O2Hp2UCP
         /27IFE8bJz750eUWtu1ci2WYjPgUIcnL8oQ0qqWIj8KZ9oa5muZDf6+gRNzWXw2K9Rnz
         Fi/ALUWAdNJ4ujwlP3GCOaFYKpx6Iaa4zyefg+e0Y64XJSoRVzBgH8rrKEgr8a0E+gdi
         360VZnbxt67p4tvrjuoldQuaKcRlEWaHp5mxAypI+NACAO3Cm3qUHZQaHbhRVMaZCW4G
         UTdIStJybd5IeoXtbPlsTxFEqeEtbJNQCbKl4EDZceWV67FFmiviOdfnFCNMBMYFLP2w
         2atA==
X-Gm-Message-State: APjAAAXQiDGzL9BNUlgaEBKVSgoM95eg83O14zCwO0w5Yiy+Ok4pt3ZF
        81CzEpSwOmxHUalCIMybwIWrO7n8
X-Google-Smtp-Source: APXvYqwLBRYuL5baznFVeDQE3dBo//nS5yPqg7gkjjWXjnOmyQPFsB/mbe1bkx0UPvonFvii+uxfGA==
X-Received: by 2002:a62:4558:: with SMTP id s85mr6693050pfa.171.1554393521300;
        Thu, 04 Apr 2019 08:58:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m7sm31145051pgg.62.2019.04.04.08.58.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:40 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/24] hwmon: (pmbus/tps53679) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:13 -0700
Message-Id: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If CONFIG_OF is not enabled, the following build warning is observed.

drivers/hwmon/pmbus/tps53679.c:100:34: warning:
	‘tps53679_of_match’ defined but not used

Marking tps53679_of_match as __maybe_unused fixes the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/tps53679.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 2bc352c5357f..3fd5105ee9ae 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -97,7 +97,7 @@ static const struct i2c_device_id tps53679_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, tps53679_id);
 
-static const struct of_device_id tps53679_of_match[] = {
+static const struct of_device_id __maybe_unused tps53679_of_match[] = {
 	{.compatible = "ti,tps53679"},
 	{}
 };
-- 
2.7.4

