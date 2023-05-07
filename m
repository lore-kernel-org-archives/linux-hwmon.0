Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E074C77B7C
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 May 2023 15:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjEGPMi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 May 2023 11:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjEGPMg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 May 2023 11:12:36 -0400
Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231E5124A9
        for <linux-hwmon@vger.kernel.org>; Sun,  7 May 2023 08:12:34 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1683472353; x=1683479553; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=iEF9ELS6y2W+KeqiETl7W+iS9hegD/SWm2vaKhD9F68=;
 b=duUY3MfTS8g1jvqeei1CWG8l8Br3fOHgZEqCe41NdcPmV7p3+uOL0xStWdzOf04fzht8iY0mrLNxBLs44NtcuMVqhqiF8U3Bkal6UsXiQ9/ezZgo8CSLtZnPXjBY4NLV6jCLjjCEKst93D+JSUSpXxps/94+501M1dDfY36B8btdTlSiD4n9Bm9/WwNQyrIJrgeeA2Z87ww3tZL7nsyVcssUT9XOvzYp5/OZJI3HW3H3gxaPxCDnBXteyUTIDRF2h8pCWetp9oNiJixJebRRLgBZKdU4jHq8wEIP1LRCydObZ0pFbQ+zbyPCPXVlMRdkq+zSELjKyHmx+2aVIXRlPg==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by ffb17371f780 with SMTP id
 6457bfe1621871856c131dc4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 07 May 2023 15:12:33 GMT
Sender: james@equiv.tech
From:   James Seo <james@equiv.tech>
Cc:     James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (core) Finish renaming groups parameter in API to extra_groups
Date:   Sun,  7 May 2023 08:10:53 -0700
Message-Id: <20230507151051.1861929-1-james@equiv.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Commit 848ba0a2f20dc121a3ef5272a24641d2bd963d8b renames the
'groups' parameter of devm_hwmon_device_register_with_info()
to 'extra_groups' in hwmon-kernel-api.txt (later .rst) and
hwmon.h, but this change was not propagated to the function
code itself in hwmon.c. Finish the job.

Note that hwmon_device_register_with_info() has the same
parameter, and the name of that parameter was changed in all
three files. Harmonizing the name between these related
functions also removes a potential source of confusion.

Signed-off-by: James Seo <james@equiv.tech>
---

Changes from RFC:
* Rewrote commit message

History:
RFC: https://lore.kernel.org/linux-hwmon/20230504075752.1320967-3-james@equiv.tech/

---
 drivers/hwmon/hwmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 573b83b6c08c..5f205686065e 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -1029,7 +1029,7 @@ EXPORT_SYMBOL_GPL(devm_hwmon_device_register_with_groups);
  * @name:	hwmon name attribute
  * @drvdata:	driver data to attach to created device
  * @chip:	pointer to hwmon chip information
- * @groups:	pointer to list of driver specific attribute groups
+ * @extra_groups: pointer to list of driver specific attribute groups
  *
  * Returns the pointer to the new device. The new device is automatically
  * unregistered with the parent device.
@@ -1038,7 +1038,7 @@ struct device *
 devm_hwmon_device_register_with_info(struct device *dev, const char *name,
 				     void *drvdata,
 				     const struct hwmon_chip_info *chip,
-				     const struct attribute_group **groups)
+				     const struct attribute_group **extra_groups)
 {
 	struct device **ptr, *hwdev;
 
@@ -1050,7 +1050,7 @@ devm_hwmon_device_register_with_info(struct device *dev, const char *name,
 		return ERR_PTR(-ENOMEM);
 
 	hwdev = hwmon_device_register_with_info(dev, name, drvdata, chip,
-						groups);
+						extra_groups);
 	if (IS_ERR(hwdev))
 		goto error;
 
-- 
2.34.1

