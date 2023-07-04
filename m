Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C37EB64DA
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Jul 2023 13:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjGDNS7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Jul 2023 09:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbjGDNSf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Jul 2023 09:18:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE55810C6;
        Tue,  4 Jul 2023 06:18:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F400161269;
        Tue,  4 Jul 2023 13:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13044C433C7;
        Tue,  4 Jul 2023 13:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688476672;
        bh=wO5FjuwmvYWrR+WFEVbVC4lIXFhi2kqR5IRQhH/0/A4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Iq5v1U/A2O9AQwBlFBY0H6kc1MaeDU1jBnb5sW5wIcnSiLMS5+933yYGj5huZrGah
         +3u2LubTVct81x6Xo1ywpXtfj4p4BRZ0kRPHJ/W8UjgqGuAPmiao1x3ukfRRxuMERj
         oQu6BtzBRLvsWyfcJzLUbfDbsSDgyribMb9Lmrvo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, samsagax@gmail.com,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 3/3] driver core: remove devm_device_add_groups()
Date:   Tue,  4 Jul 2023 14:17:19 +0100
Message-ID: <20230704131715.44454-8-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704131715.44454-5-gregkh@linuxfoundation.org>
References: <20230704131715.44454-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3089; i=gregkh@linuxfoundation.org; h=from:subject; bh=wO5FjuwmvYWrR+WFEVbVC4lIXFhi2kqR5IRQhH/0/A4=; b=owGbwMvMwCRo6H6F97bub03G02pJDClLpO8V1LnWrTv7s+nDzDtiF1xv/9k+5ThLvMDC2devL 3Lcp3aLryOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAm4rWTYa7Uy323bR8/572c Y71oxjpLie0//3gzzM+2j7T3s45Ja6mZtrexoKlvwfPFRwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is no more in-kernel users of this function, and no driver should
ever be using it, so remove it from the kernel.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/core.c    | 45 ------------------------------------------
 include/linux/device.h |  2 --
 2 files changed, 47 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3dff5037943e..94187c0b577d 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2748,15 +2748,6 @@ static void devm_attr_group_remove(struct device *dev, void *res)
 	sysfs_remove_group(&dev->kobj, group);
 }
 
-static void devm_attr_groups_remove(struct device *dev, void *res)
-{
-	union device_attr_group_devres *devres = res;
-	const struct attribute_group **groups = devres->groups;
-
-	dev_dbg(dev, "%s: removing groups %p\n", __func__, groups);
-	sysfs_remove_groups(&dev->kobj, groups);
-}
-
 /**
  * devm_device_add_group - given a device, create a managed attribute group
  * @dev:	The device to create the group for
@@ -2789,42 +2780,6 @@ int devm_device_add_group(struct device *dev, const struct attribute_group *grp)
 }
 EXPORT_SYMBOL_GPL(devm_device_add_group);
 
-/**
- * devm_device_add_groups - create a bunch of managed attribute groups
- * @dev:	The device to create the group for
- * @groups:	The attribute groups to create, NULL terminated
- *
- * This function creates a bunch of managed attribute groups.  If an error
- * occurs when creating a group, all previously created groups will be
- * removed, unwinding everything back to the original state when this
- * function was called.  It will explicitly warn and error if any of the
- * attribute files being created already exist.
- *
- * Returns 0 on success or error code from sysfs_create_group on failure.
- */
-int devm_device_add_groups(struct device *dev,
-			   const struct attribute_group **groups)
-{
-	union device_attr_group_devres *devres;
-	int error;
-
-	devres = devres_alloc(devm_attr_groups_remove,
-			      sizeof(*devres), GFP_KERNEL);
-	if (!devres)
-		return -ENOMEM;
-
-	error = sysfs_create_groups(&dev->kobj, groups);
-	if (error) {
-		devres_free(devres);
-		return error;
-	}
-
-	devres->groups = groups;
-	devres_add(dev, devres);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(devm_device_add_groups);
-
 static int device_add_attrs(struct device *dev)
 {
 	const struct class *class = dev->class;
diff --git a/include/linux/device.h b/include/linux/device.h
index 66c13965153d..6dd087e4223d 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1164,8 +1164,6 @@ static inline void device_remove_group(struct device *dev,
 	return device_remove_groups(dev, groups);
 }
 
-int __must_check devm_device_add_groups(struct device *dev,
-					const struct attribute_group **groups);
 int __must_check devm_device_add_group(struct device *dev,
 				       const struct attribute_group *grp);
 
-- 
2.41.0

