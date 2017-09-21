Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f48.google.com ([74.125.83.48]:52706 "EHLO
        mail-pg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753045AbdIURUh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2017 13:20:37 -0400
Received: by mail-pg0-f48.google.com with SMTP id i195so3858509pgd.9
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2017 10:20:36 -0700 (PDT)
From: Hoan Tran <hotran@apm.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@riken.jp>, lho@apm.com,
        kdinh@apm.com, patches@apm.com, Hoan Tran <hotran@apm.com>
Subject: [PATCH 0/2] hwmon: xgene: Support hwmon v2
Date: Thu, 21 Sep 2017 10:17:08 -0700
Message-Id: <1506014230-13933-1-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch supports xgene-hwmon v2 which uses the non-cachable memory
as the PCC shared memory.

Hoan Tran (2):
  hwmon: xgene: Support hwmon v2
  hwmon: xgene: Support PCC shared memory in IO region

 drivers/hwmon/xgene-hwmon.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
1.9.1

