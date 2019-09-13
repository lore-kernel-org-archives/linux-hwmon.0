Return-Path: <SRS0=xywD=XI=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0612BC49ED7
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Sep 2019 12:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CEA8F2084F
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Sep 2019 12:08:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImZ5q+T9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbfIMMIa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Sep 2019 08:08:30 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44801 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfIMMIa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Sep 2019 08:08:30 -0400
Received: by mail-pl1-f194.google.com with SMTP id k1so13155318pls.11
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Sep 2019 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=YFIy46Lg+HFJBaouFo2suTn2vsDPejj5D5enA3xwWew=;
        b=ImZ5q+T9FguqmNe+HOvfuZ5U3/Gjb0CPsBhf8N393e4Pvl6CNCvrgCZLNUOqEENT/H
         VmmBpOVQFgBLCtPyxnwI2M7pvaa7R+P70hGfEUWQItWfMDmohqKqizEipSvTGpVuaYgO
         bP1tzaPsqJEqNEwWajHWnH3fIVMrgcxfh1gtLrDDjaj5Xzcma3fVOB8be2Ce0aKvZ6qM
         DEcAK2fjcloP3dIucVmipXpHjSfmFTRwNRQFjl8UoaKZa/qLq2WRsT2e8ZsEXHN+F4WR
         CNM9/0oPIK6rQ0nZCvYYsEtcwvzXUp2dU+xrxIpTatjKyBalr+oLRyYWvdWT0bFI+6vd
         at1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=YFIy46Lg+HFJBaouFo2suTn2vsDPejj5D5enA3xwWew=;
        b=SW6wG+poae75WnLipAAaMvdXEn0XGYdF4bB2S7YlYvS6EX7h05aT5Q8HvJC/ggekdq
         XxzlQZ0yd3q7m2N049twc0Ilvo3SzwC43+lzSRqeHO1K7SL6wvv5r4gbVNr9m1kCWHgG
         6mXSB4Q7sMPtBZTn8S8FuHpbv8CmK4ujsxlfvNVHAoQgcp3LfZVfQIZydTuI8Lgmvv94
         r/weF2ALA37vNGmC6AziB9QD/dh1NKWxG0PMQqYAVIFE/y8XAizfhvkVXz3NoQJ43XXS
         iRDxH0nPberyJ7KJBINA11H1zeS8Qr/GWhT1M8y9yEzVCAZYdetQnknjVvtwQ1SlGgOg
         d0kg==
X-Gm-Message-State: APjAAAWBRSZa+5HPvY8INtIsjh0PSG66/92z+o6CiWtz+doZBjwF2Kr8
        YnnKDLt7HPvmO5pxHLJU5Ldx+2Az
X-Google-Smtp-Source: APXvYqy23RKiWr/r3uF1cgSx96mwQM6YIGegRs5248d6f8R4G+Rs51ou0x00bEQDPn9z+2RAuNGLaQ==
X-Received: by 2002:a17:902:ba93:: with SMTP id k19mr32927949pls.156.1568376509673;
        Fri, 13 Sep 2019 05:08:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u10sm16387056pfm.71.2019.09.13.05.08.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2019 05:08:28 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: submitting-patches: Point to with_info API
Date:   Fri, 13 Sep 2019 05:08:26 -0700
Message-Id: <1568376506-18045-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

New driver should use devm_hwmon_device_register_with_info() or
hwmon_device_register_with_info() to register with the hwmon subsystem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/submitting-patches.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/submitting-patches.rst b/Documentation/hwmon/submitting-patches.rst
index 452fc28d8e0b..6b73dba32b89 100644
--- a/Documentation/hwmon/submitting-patches.rst
+++ b/Documentation/hwmon/submitting-patches.rst
@@ -120,8 +120,8 @@ increase the chances of your change being accepted.
   completely initialize your chip and your driver first, then register with
   the hwmon subsystem.
 
-* Use devm_hwmon_device_register_with_groups() or, if your driver needs a remove
-  function, hwmon_device_register_with_groups() to register your driver with the
+* Use devm_hwmon_device_register_with_info() or, if your driver needs a remove
+  function, hwmon_device_register_with_info() to register your driver with the
   hwmon subsystem. Try using devm_add_action() instead of a remove function if
   possible. Do not use hwmon_device_register().
 
-- 
2.7.4

