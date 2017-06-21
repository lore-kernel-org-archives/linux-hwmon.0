Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ewout01.mycci.net ([66.60.130.50]:44596 "EHLO ewout01.mycci.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752068AbdFUVwA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Jun 2017 17:52:00 -0400
Received: from mail.cpinternet.com ([209.240.224.81])
          by ewout01.mycci.net ({dfaaa318-551d-4a0a-8038-7c31cf31c4f6})
          via TCP (outbound) with ESMTP id 20170621211559951_0000
          for <linux-hwmon@vger.kernel.org>;
          Wed, 21 Jun 2017 14:15:59 -0700
Received: from [10.4.0.103] (unverified [73.164.78.214])
        by cpinternet.com (SurgeMail 3.8t) with ESMTP id 2421718-1881964
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Jun 2017 16:15:56 -0500 CDT
Subject: [PATCH] w83627hf.c removed deprecated
References: <f7bf84dc-5645-17f2-a3f0-7283373229ff@isd.net>
To: linux-hwmon@vger.kernel.org
From: Chris Sorenson <csoren@isd.net>
Message-ID: <fd80e0df-cf35-fcfc-4d9d-fd6351f79b69@isd.net>
Date: Wed, 21 Jun 2017 16:08:03 -0500
MIME-Version: 1.0
In-Reply-To: <f7bf84dc-5645-17f2-a3f0-7283373229ff@isd.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Replaces a call to deprecated function hwmon_device_register() -----

Signed-off-by: Chris Sorenson <csoren@isd.net>

Changed to call hwmon_device_register_with_info() instead of
hwmon_device_register(), which is deprecated.

modified:   drivers/hwmon/w83627hf.c

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index 8ac89d0..fbc5d18 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -1569,7 +1569,8 @@ static int w83627hf_probe(struct platform_device
*pdev)
                         goto error;
         }

-       data->hwmon_dev = hwmon_device_register(dev);
+       data->hwmon_dev =
+               hwmon_device_register_with_info(dev, NULL, NULL, NULL,
NULL);
         if (IS_ERR(data->hwmon_dev)) {
                 err = PTR_ERR(data->hwmon_dev);
                 goto error;


