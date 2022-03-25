Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FFDC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Mar 2022 22:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbiCYWb3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Mar 2022 18:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbiCYWb2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Mar 2022 18:31:28 -0400
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com [192.185.49.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661B63AA5C
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Mar 2022 15:29:53 -0700 (PDT)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id D8C21D251
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Mar 2022 17:29:52 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id XsRMnevuwHnotXsRMndEta; Fri, 25 Mar 2022 17:29:52 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fCvrb3GbIQxiEJZcy7ieX/z0jBz36lRWMhxvpPgkza4=; b=suvyztmxVVhlsjtIx5BaVF7HF6
        sOHZWWC4gW5JuMltBR1sDhVcVBuLVQf2n9phjtxfpDLNB18jEKxiVC/O2l+JJIxc3Gaj3P6gR9iIw
        R/q1QNiq9GwhCMKwkgSKlRTF1oeSljX4tRYNbB6NiLGzHvBXgvQfL2DcNDnFzQ5qfmXBaVO7N2SoE
        9xHMY8krPlA6gI1pV4SSEhHfX/6Jn7TgO2BJLqHcSq3JyYZfyeBR9XBPvw72DbAs8sUB9ntcYQ773
        yP1M17rE2wRjS29WLQkekE1FBNz7QrDCEARz50pOFJzHg3AwX3tPRp6no+leRwO1PWeLPvzTqTnAN
        t5ksqJEw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57668 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nXsRM-0041nb-Cc; Fri, 25 Mar 2022 22:29:52 +0000
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        kernel test robot <lkp@intel.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>
Subject: [PATCH] hwmon: (xdpe12284) Fix build warning seen if CONFIG_SENSORS_XDPE122_REGULATOR is disabled
Date:   Fri, 25 Mar 2022 15:29:50 -0700
Message-Id: <20220325222950.1510612-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nXsRM-0041nb-Cc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57668
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

0-day reports:

drivers/hwmon/pmbus/xdpe12284.c:127:36: warning:
	unused variable 'xdpe122_reg_desc'

This is seen if CONFIG_SENSORS_XDPE122_REGULATOR is not enabled.
Mark xdpe122_reg_desc as __maybe_unused to fix the problem.

Fixes: f53bfe4d6984 ("hwmon: (xdpe12284) Add regulator support")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Marcello Sylvester Bauer <sylv@sylv.io>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/xdpe12284.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index 18fffc5d749b..32bc7736d609 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -124,7 +124,7 @@ static int xdpe122_identify(struct i2c_client *client,
 	return 0;
 }
 
-static const struct regulator_desc xdpe122_reg_desc[] = {
+static const struct regulator_desc __maybe_unused xdpe122_reg_desc[] = {
 	PMBUS_REGULATOR("vout", 0),
 	PMBUS_REGULATOR("vout", 1),
 };
-- 
2.35.1

