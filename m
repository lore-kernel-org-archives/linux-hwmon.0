Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECB8C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Dec 2021 01:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhL1BtH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 27 Dec 2021 20:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhL1BtH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Dec 2021 20:49:07 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDB1C06173E
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Dec 2021 17:49:06 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bu9so38218169lfb.7
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Dec 2021 17:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IA1S8WhCnv6XXwdP7S0rQgr61umt+tbq/VcbdQJNAAo=;
        b=LwUysz9Lx6pEWfacLdPTJKjTGpqBGxT1XT6SeqpTjvRzrpCmRLpSy00VYBHvlmtuBS
         c5G9+KTs2ie+PhzwUUKJkZOZc98/jb9jh5Z1/YZiJhflmkdT72pwwaCV90ChtJBt7H/L
         dh4Mi8U7t5YgLdzjCg/QSKZyDI+64S7EOvfYL+RU5f/rTnWT1sgUwCAKk8K6vh6qai6A
         m5dU3B4Mh4gXBJ+VhLoDVaz5Wr+b9QWnsyds6cEz1uhqBLsyoCYr82OWbTHigoUe8XLH
         xUkcanU0HQgxfCokqS8Ba6qA2ulpFxy6e91baKa74HMcvXtJDbQVZ5nesG+l6pysEzDX
         u4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IA1S8WhCnv6XXwdP7S0rQgr61umt+tbq/VcbdQJNAAo=;
        b=y6Nq2t3tQLYIw0ewyHBnOr6UnxCE7g3ehoB327UhQnTpfqMDr5qS2o1Yg0cs/PgZHx
         16IU64gVEmZIiSG4ErDw7l/J9n72/YUtkPjGPSXkntgrtbbzzoG3MdgdSSwsAfnaGeg0
         IyNW4hwLwgh3TA+AzyVrT2p5HRPgfVhxhhfldYiEjLtoC48Y/li/jeXX5pZQmkVOsE1j
         TAVfnGkytK6HdcPBpBj+vzr7r7fhq0pPAwLyhPgs7yGNdCISQx1QA6AZ1I/48oGu7tNQ
         1xxsuPVMUeXBOBWMfY4moCKwzDc7muVzghyXAwW3qKwoBAwM7qfv0z0gMMnlk36llRGs
         YZsA==
X-Gm-Message-State: AOAM530ta3e1DBu6lSWq3NMUEI1+KT88Yuox40WcZNOXeQR3TUBdIvsD
        SvdtNySmM8/BVrKFhS3KcR+liIRCIW7bgg==
X-Google-Smtp-Source: ABdhPJyR+uaQwe2dmMgb6uX8XjJS3CEJ2a3kyTMxlrpOhwhPo0ZRK/lmZsdVGdZ3GOnfjxDTZJJIRA==
X-Received: by 2002:a05:6512:39cf:: with SMTP id k15mr14377111lfu.664.1640656144672;
        Mon, 27 Dec 2021 17:49:04 -0800 (PST)
Received: from trx40.home.arpa ([2a03:1ac0:5cff:b78d:39e7:5dcb:5b3a:ff32])
        by smtp.gmail.com with ESMTPSA id s29sm1785710lfc.227.2021.12.27.17.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 17:49:04 -0800 (PST)
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Aleksandr Mezin <mezin.alexander@gmail.com>
Subject: [PATCH v2] hwmon: (nzxt-smart2) Fix "unused function" warning
Date:   Tue, 28 Dec 2021 07:48:13 +0600
Message-Id: <20211228014813.832491-1-mezin.alexander@gmail.com>
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
v2: __maybe_unused instead of #ifdef

 drivers/hwmon/nzxt-smart2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index 534d39b8908e..6e67da766969 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -704,7 +704,7 @@ static int nzxt_smart2_hid_raw_event(struct hid_device *hdev,
 	return 0;
 }
 
-static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
+static int __maybe_unused nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
 {
 	struct drvdata *drvdata = hid_get_drvdata(hdev);
 
-- 
2.34.1

