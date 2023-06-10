Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31695C7EE37
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Jun 2023 15:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbjFJP14 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Jun 2023 11:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235101AbjFJP1y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Jun 2023 11:27:54 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91BA1993
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Jun 2023 08:27:16 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b3b56dcf1bso1783155ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Jun 2023 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686410836; x=1689002836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xe9XR6J9vmxjX2jyXwwHARkMH7q4u8p5SGQDnJ0SzlQ=;
        b=KRL4tpyDKVfCZ+8YLAmIWUEyo/tyS2v1hq+Rpkn13Ook6RJlMSX86vxyRf8g09Lhdp
         MO7T7CYccsbAW9LKrn37TqLyu/3rRmkOdCLoKvRy2BdWrog4Y73IUwoxCEM43zrP4HM/
         D2U2olgm8qvXJeFIn8CAR2rrIbEe1QnO3ZfK3vt44CnV24rzzV8ofgnQmF8xkg2IeSdI
         GaT+HMwWAsHS645y3CYnERs/UEIsI8c3BEkCyyTK5np6LiZqc/Ar2aDx/eFBLSif1mFs
         Rf1dERzRfVmzQIvkFjeqEuEhqQe7HptFjKwOTphEW/Z14S5UirrMz4mBhy7qBpMSsBmG
         p9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686410836; x=1689002836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe9XR6J9vmxjX2jyXwwHARkMH7q4u8p5SGQDnJ0SzlQ=;
        b=mAHvetg1aaHCIjPRTUXtrcABi13O9MBcvvvh5+gotbcV6JfKPun02FSUyg60yc/rQs
         CFYx8mKbBpW03zIAYxj64l6kKYeh0E6Xd6VC7BQzJLx1rEcR+WsOfihipQQ+iwijdXdP
         4cOPIlY8KGIrndRBFbXxwUgczRQcAtRwKCALSeIJaAqF74rf4PDjPy2eIxn2nbaO3wra
         e9ACsiT4Dh661VCNIkmH36Ilc81uRq6nXf074xYThPHR3f1zbMh9Y+V/oNYLHQG+ODYD
         oEMCzxlfIFC+uExBUl7EaEbdoGBE1zRQcBxe63R2/EVeNgG9aZvwdwFzY1+B6y0U1cs1
         j8Xw==
X-Gm-Message-State: AC+VfDyvyMXi3tmaeYUv1WRUZPsuGFdAjOgPnc+1hJrXu8WHugouE0/O
        NMmo5j25pyFUiT1cAdLjuL6lNoWmyAM=
X-Google-Smtp-Source: ACHHUZ5cDxPrgBuRlywTQE6iHqKIIvLFxOIYbxx+3VbWnreoBldw81HlIMDrwhTabZJ/tjD5XVM1sQ==
X-Received: by 2002:a17:902:c944:b0:1b0:5d15:3132 with SMTP id i4-20020a170902c94400b001b05d153132mr2535185pla.58.1686410835919;
        Sat, 10 Jun 2023 08:27:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902dacd00b001b2404c7d53sm5127198plx.175.2023.06.10.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 08:27:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [RFC PATCH] Documentation/hwmon: Add trailing paranthesis() to function names
Date:   Sat, 10 Jun 2023 08:27:09 -0700
Message-Id: <20230610152709.2730159-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

With trailing paranthesis(), the docs build will automatically generate
cross-links to the documentation.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Jonathan:
	Did I misunderstand something ? "make htmldocs" did not result
	in any additional hyperlinks.

 Documentation/hwmon/hwmon-kernel-api.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index 6cacf7daf25c..9edc8521d310 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -44,29 +44,29 @@ register/unregister functions::
 
   char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
 
-hwmon_device_register_with_info registers a hardware monitoring device.
+hwmon_device_register_with_info() registers a hardware monitoring device.
 It creates the standard sysfs attributes in the hardware monitoring core,
 letting the driver focus on reading from and writing to the chip instead
 of having to bother with sysfs attributes. The parent device parameter
 as well as the chip parameter must not be NULL. Its parameters are described
 in more detail below.
 
-devm_hwmon_device_register_with_info is similar to
-hwmon_device_register_with_info. However, it is device managed, meaning the
+devm_hwmon_device_register_with_info() is similar to
+hwmon_device_register_with_info(). However, it is device managed, meaning the
 hwmon device does not have to be removed explicitly by the removal function.
 
 All other hardware monitoring device registration functions are deprecated
 and must not be used in new drivers.
 
-hwmon_device_unregister deregisters a registered hardware monitoring device.
+hwmon_device_unregister() deregisters a registered hardware monitoring device.
 The parameter of this function is the pointer to the registered hardware
 monitoring device structure. This function must be called from the driver
 remove function if the hardware monitoring device was registered with
-hwmon_device_register_with_info.
+hwmon_device_register_with_info().
 
-devm_hwmon_device_unregister does not normally have to be called. It is only
+devm_hwmon_device_unregister() does not normally have to be called. It is only
 needed for error handling, and only needed if the driver probe fails after
-the call to devm_hwmon_device_register_with_info and if the automatic (device
+the call to devm_hwmon_device_register_with_info() and if the automatic (device
 managed) removal would be too late.
 
 All supported hwmon device registration functions only accept valid device
@@ -75,14 +75,14 @@ will be rejected. The 'name' parameter is mandatory.
 
 If the driver doesn't use a static device name (for example it uses
 dev_name()), and therefore cannot make sure the name only contains valid
-characters, hwmon_sanitize_name can be used. This convenience function
+characters, hwmon_sanitize_name() can be used. This convenience function
 will duplicate the string and replace any invalid characters with an
 underscore. It will allocate memory for the new string and it is the
 responsibility of the caller to release the memory when the device is
 removed.
 
-devm_hwmon_sanitize_name is the resource managed version of
-hwmon_sanitize_name; the memory will be freed automatically on device
+devm_hwmon_sanitize_name() is the resource managed version of
+hwmon_sanitize_name(); the memory will be freed automatically on device
 removal.
 
 Using devm_hwmon_device_register_with_info()
@@ -357,7 +357,7 @@ variable. This structure has the following fields::
 		int index;
 	};
 
-You can use to_sensor_dev_attr to get the pointer to this structure from the
+You can use to_sensor_dev_attr() to get the pointer to this structure from the
 attribute read or write function. Its parameter is the device to which the
 attribute is attached.
 
@@ -370,5 +370,5 @@ variable, which is defined as follows::
 		u8 nr;
 	};
 
-Use to_sensor_dev_attr_2 to get the pointer to this structure. Its parameter
+Use to_sensor_dev_attr_2() to get the pointer to this structure. Its parameter
 is the device to which the attribute is attached.
-- 
2.39.2

