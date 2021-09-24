Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D02C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 16:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEB8361107
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 16:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245016AbhIXQse (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 12:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244885AbhIXQse (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 12:48:34 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BE6C061613
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Sep 2021 09:47:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u8so41897143lff.9
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Sep 2021 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1LAFg9M6uAMZeoujQ1jnGXzcNs1IsGlEHiARal+gy88=;
        b=zyMfc6SalycpiXBUP16WblX0n0xkfb9/raUzu66BUucj9skaySnVkYUSE+u9F8tlve
         YVY8+4D6xrnlHKDRkgP5IgHYWxBXgDBKoFyOmH19YWZSUjWUpuUkJlizTgCASUrq/IDR
         DT3ECrARMWWdaOaSvjkAlkf7Sco2KBa8Jd9hRLEioQHyszXg5j/sezdF70/DeL4yAu6b
         19SFcJfmEcEu3Sr7rEPcfs+03j11mYrUIwt8qOSx8O4Nx6/2UL/PDlQjPTvh5sXVOa7X
         hPSIM2D5dL347h2Mf0nxxflViB0qJhp7VDOs8W1kj4zq2ynk7C9JukB7VuDbd2pTzH1k
         3bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1LAFg9M6uAMZeoujQ1jnGXzcNs1IsGlEHiARal+gy88=;
        b=tWSYEcUf0BQJAjX+TR7b/imx0mt+f8VVWqwU9jW3kqJH9QQmV20lJyfBY55m3fiP9k
         CmigTaFlJqdiBI3mABH283QgDnh41F+nkFmme48NCWTuCRLM7Q1MeUFLIWoc4zvnnff2
         kBSvs6lpAcxd6ORYZT9HKudTnq5tBWPqN+IpbX7oOZ9+PhGjVq7hbdx6PORTWgAUUCrO
         uuHLEGEazBWU3pU8dxw/aNiMUyRiXfDqzz53XQNFmVHZgziZXXuv+niRE0ad0YEK1mma
         ri5awvSQKvNJc8TQVatdQkxd9KuTdTW+/yH/77kd1lAXW21RI6FOtFNMq5HxRqSiPrRZ
         Dubw==
X-Gm-Message-State: AOAM530ClWJJqjjji9zHTk5InD9EFJK0jtfXhPJKvWZEeE5hNOlSlSjQ
        jqdr+a4JDC0c+clLcd1R/TCRqw==
X-Google-Smtp-Source: ABdhPJwzjHobTLwPEOns0WYTL589ZN1cNEEYDE8en1WPZ5902o1WPcsZr8sruhubbn+8FTnESsPRvw==
X-Received: by 2002:ac2:4e0f:: with SMTP id e15mr10019887lfr.308.1632502018951;
        Fri, 24 Sep 2021 09:46:58 -0700 (PDT)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id z2sm802266lfr.194.2021.09.24.09.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 09:46:58 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com, jdelvare@suse.com,
        linux@roeck-us.net
Cc:     avri.altman@wdc.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] scsi: ufs: Kconfig: SCSI_UFS_HWMON depens on HWMON=y
Date:   Fri, 24 Sep 2021 18:45:30 +0200
Message-Id: <20210924164530.1754128-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When building an allmodconfig kernel, the following build error shows
up:

aarch64-linux-gnu-ld: drivers/scsi/ufs/ufs-hwmon.o: in function `ufs_hwmon_probe':
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:177: undefined reference to `hwmon_device_register_with_info'
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:177:(.text+0x510): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `hwmon_device_register_with_info'
aarch64-linux-gnu-ld: drivers/scsi/ufs/ufs-hwmon.o: in function `ufs_hwmon_remove':
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:195: undefined reference to `hwmon_device_unregister'
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:195:(.text+0x5c8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `hwmon_device_unregister'
aarch64-linux-gnu-ld: drivers/scsi/ufs/ufs-hwmon.o: in function `ufs_hwmon_notify_event':
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:206: undefined reference to `hwmon_notify_event'
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:206:(.text+0x64c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `hwmon_notify_event'
aarch64-linux-gnu-ld: /home/anders/src/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:209: undefined reference to `hwmon_notify_event'
/kernel/next/drivers/scsi/ufs/ufs-hwmon.c:209:(.text+0x66c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `hwmon_notify_event'

Since fragment 'SCSI_UFS_HWMON' can't be build as a module,
'SCSI_UFS_HWMON' has to depend on 'HWMON=y'.

Fixes: e88e2d32200a ("scsi: ufs: core: Probe for temperature notification support")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/scsi/ufs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index 565e8aa6319d..30c6edb53be9 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -202,7 +202,7 @@ config SCSI_UFS_FAULT_INJECTION
 
 config SCSI_UFS_HWMON
 	bool "UFS  Temperature Notification"
-	depends on SCSI_UFSHCD && HWMON
+	depends on SCSI_UFSHCD && HWMON=y
 	help
 	  This provides support for UFS hardware monitoring. If enabled,
 	  a hardware monitoring device will be created for the UFS device.
-- 
2.33.0

