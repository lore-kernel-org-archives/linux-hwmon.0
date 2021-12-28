Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2EBC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Dec 2021 00:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbhL1AOL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 27 Dec 2021 19:14:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhL1AOK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Dec 2021 19:14:10 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53797C06173E
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Dec 2021 16:14:10 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bu9so37862946lfb.7
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Dec 2021 16:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pe6fQ5cy5UEy2zDpjvXx3eKA2KJ8tm5S17dOdRvCIOo=;
        b=A0Rels6fnWJe2aZLgQvvA7gbInVyZ+/NVfGlho5Qp8QojgcLtJYIHF4q7lQxN5W6iA
         GKuWP9wz2ug1V8NIqlP26Lq5Tnu51j6w0JWU0eBxw3xNG8EEtvSQPVOKWUHrFq7Byy1v
         u3LC5cbGtUR8cUKyYpJ1na/7fjfYaqQI4mvzBggbpJ8TMQuOfP46KYHw0aVlOju9/CwX
         Pt2CAVz2XA6WHd7a5ix8ZMxbbvsHOyzBTfiBps71tmvcJCLCZhaMxcTr3zXoZmpmnwhL
         LkaV8kgMcq5++ueH2z1tq6T507QsLjrbK4MzRc5lHdPPVjKVX1bUq5Z++JC2dMa64jXT
         7Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pe6fQ5cy5UEy2zDpjvXx3eKA2KJ8tm5S17dOdRvCIOo=;
        b=KYHzVZ10Fhh+sAX1GWoZyAbdHFUQl1xGFqQ5vLyhFHGL+GTJyEZ3J9DR4FjQoFdh+v
         46GlqJ32LT+TsTlkLg+oVLssSID4GbmgneVG0dmQSJvtvPK7PKr1y0a65il44zYMdU5X
         4VNkTjht0clOqIe+IX+w4deZPvbXb1qWOW2IFvW34N/NBKvQOpPKCtex6LkLFZ5hGiA1
         hgTAtAtWz/JaG+vVumPV/voT8oNVUs+MteEmlBZ2H7SUdgKKQE5A951ZiwEO+o1E5Atp
         /Dncj9OV/r4m3DqJHezq3+xndDCCmfRRHJ3Wv1c4M+1rYDOT/4PhedMG/4Gnb43yFBOe
         bM5Q==
X-Gm-Message-State: AOAM531LngP1tyBc4Ed7e4dW+hBPX1Kfgn8xJIPIkT22MNjg5ShEx34r
        tf3EI1dc+N7nh/kuHsOA1vppS5FwVeW6Kg==
X-Google-Smtp-Source: ABdhPJxY6N8E7DsdLn+EeFrzw7/r8FrAgpR+hYgkMr6c27pOaXUUHzl7A6eJbpObdsIS9qBG0wU15Q==
X-Received: by 2002:a19:504c:: with SMTP id z12mr18057207lfj.234.1640650447846;
        Mon, 27 Dec 2021 16:14:07 -0800 (PST)
Received: from trx40.home.arpa ([2a03:1ac0:5cff:b78d:39e7:5dcb:5b3a:ff32])
        by smtp.gmail.com with ESMTPSA id q17sm1241646lfu.53.2021.12.27.16.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 16:14:07 -0800 (PST)
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Aleksandr Mezin <mezin.alexander@gmail.com>
Subject: [PATCH] hwmon: (nzxt-smart2) Fix "unused function" warning
Date:   Tue, 28 Dec 2021 06:13:30 +0600
Message-Id: <20211228001330.816929-1-mezin.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix warning when building with CONFIG_PM=n (and CONFIG_WERROR=y):

drivers/hwmon/nzxt-smart2.c:707:12: error: ‘nzxt_smart2_hid_reset_resume’
defined but not used [-Werror=unused-function]
  707 | static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
---
 drivers/hwmon/nzxt-smart2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index 534d39b8908e..6033249bf06d 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -704,6 +704,8 @@ static int nzxt_smart2_hid_raw_event(struct hid_device *hdev,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+
 static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
 {
 	struct drvdata *drvdata = hid_get_drvdata(hdev);
@@ -721,6 +723,8 @@ static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
 	return init_device(drvdata, drvdata->update_interval);
 }
 
+#endif
+
 static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 				 const struct hid_device_id *id)
 {
-- 
2.34.1

