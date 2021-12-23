Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083B8C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Dec 2021 20:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350236AbhLWUwZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Dec 2021 15:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245049AbhLWUwY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Dec 2021 15:52:24 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72206C061401
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:24 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id x10so5733358oix.6
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dRL7IlqS52QCCnY7S10VYxg3YDSF7DugavQlo/TMViE=;
        b=o214Q1blvvkxMEDQUjFZq1pFEPwwIFUmyPNbge86M5y7BNu5dKjf7JCmSmvRoEbDsB
         Z72wVFqEjgzxz98/tk+lGmV6g+OpfI/Sn9M6xyRAGzV8UYCtA/fYbQsPh0IrZwxJO0/a
         P91sw8mtABBv5IMgEFupVwWrrBxHWlg9NnDERhlEMOgzcwVb9/H2Zy1kHLP0gYZCdJPH
         LqNgl2QK3nn0K/a1pASeBJfLnEcxgiVZLloH6+ZLIYppzm9UyMMNJ7/TtpAe+3zLdi1P
         75C45SSY2P7XWuOFVme0uY3lvhSSigaKKmb3qhMIGX3YgB3S3AAl1hqlDXVHCAgSrXey
         vBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=dRL7IlqS52QCCnY7S10VYxg3YDSF7DugavQlo/TMViE=;
        b=GyTQEREk8hA7B0I1T8t3BJI+fTha+Sh9Cr4nmgOrgol3ceacV8XxpaBKsUDG69qxPt
         ouhTyUwyssozUveKXBaw/C+GcLWkZIaeb9Mp6L9aJlg2QerncstO6E04jR4ttLuXqQJP
         DqY0/DJX7hE6jqQ8ZY4+kf9z+DDoNwOdV6V+Ucp697bGRM+JPK/bzQAXCobNf1+qOcIa
         m2lGMqPAriT5FH4ubSdjqec1Uwq5+Kj3kwEPw51HPDSm0AMjhLDGtB9yD8neE4v6WLaA
         Z1NP1OTugaFbcA6e7nt6AmVJXOQn1bAEP8+9T62CsAjZHRFEC7uhTNJCRZxzOwnEqwPn
         tvAw==
X-Gm-Message-State: AOAM5322hRN8SKgDJuKSTFEDmvlMDOaHjzjK7r7xwNoEJk5WDQKn9wOh
        SmLz8OeuF/yw/QVvh70VWf5+kC/Evlw=
X-Google-Smtp-Source: ABdhPJw9NZwyv6jyCwzIzH/akknmqSplS+oHcQK5MqNeG05zLE8HRsxhScc0AszxqLnjrmC1qzKGcg==
X-Received: by 2002:aca:1a04:: with SMTP id a4mr2787047oia.153.1640292742628;
        Thu, 23 Dec 2021 12:52:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q14sm1043023ood.28.2021.12.23.12.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 12:52:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Cosmin Tanislav <demonsingur@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 1/6] hwmon: adt7x10: Refactor to use with_info API
Date:   Thu, 23 Dec 2021 12:52:13 -0800
Message-Id: <20211223205219.2184104-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

V1 -> V2:
 * add device managed action for restoring config
 * merge multiple small related patches into a single patch
   that converts the driver to use devm_hwmon_device_register_with_info
 * switch to devm_request_threaded_irq after switching to
   devm_hwmon_device_register_with_info to make sure that it is impossible
   for the interrupt handler to access the freed hwmon device
 * drop core driver remove callback

V2 -> V3:
 * merge patch that passes name from i2c driver into the
   devm_hwmon_device_register_with_info patch

v3 -> v4:
 * Use regmap to hide chip specifics and to cache register values
 * Various minor changes and fixes
   * With the use of regmap, the bus device (bus_dev) is no longer needed,
     and the patch introducing it was dropped
   * Hysteresis value calculations depend on two values: The associated
     register value and the hysteresis itself. All calculations must be
     protected to ensure that one value isn't changed during calculations.
     Add the missing locks to both the hysteresis read and write functions.
   * Restoring the original configuration is only necessary if it was
     actually changed. Only call devm_add_action_or_reset() if that is the
     case. This also lets us drop the associated check in the action
     function.
   * Use enum to index ADT7X10_REG_TEMP[]
   * Check all attributes in is_visible function explicitly.
     While this is strictly speaking not necessary (the mode for
     unsupported attributes should not be requested), I find the explicit
     checks easier to understand and less error prone.
   * Drop linux/hwmon-sysfs.h include and add missing linux/device.h include
   * Squash patches 6/7 (pass hwinfo dev to irq handler) and patch 7/7
     (use hwmon_notify_event) into a single patch; otherwise bus_dev would
     still be needed temporarily.

 Note: This version of the series was module tested for ADT7410, but not
       on real hardware, and not for ADT7310/7320/7420.
