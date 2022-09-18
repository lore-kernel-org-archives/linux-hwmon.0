Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6DAC32771
	for <linux-hwmon@archiver.kernel.org>; Sun, 18 Sep 2022 11:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiIRLzT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 18 Sep 2022 07:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIRLzS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Sep 2022 07:55:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAFF12745
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Sep 2022 04:55:17 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a14so28662795ljj.8
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Sep 2022 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kiMP+nQp8XJUntt356P1KDJG5ukoq4WjqLjEmvBBXug=;
        b=bDujlrljeNVCn7mwFaJgxxNptKnM18KICCziK0utIXqm+iczESpN1SJjUUv//RNm8T
         Pu8Zi5N62tHhMvJafzWBiIviP4KWAjcMmLqTPZjMNGHvWiM/1AyHWlepZGc9Kmdw0fWr
         yADqW1xr/kC1yUc7XqlKyrDSa7PjwHPplunTAcmIkfGGNnWEe6f+vk9Ic0LqTiXWBNe3
         d52yX0RRiTcZuItvoo8vpbBthkEIMO1mf69R5mkWPdx2Yh1axHhu1hk6KXGGToEbMIg1
         burZaUGSZwiynjbnSDy2jNLaPzbhmUU3SsSpJpt85Bu1nR9EUKUHtLK9to7HetQp4Pp3
         7RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kiMP+nQp8XJUntt356P1KDJG5ukoq4WjqLjEmvBBXug=;
        b=qo6EhApxhpZkCtHjoRBVzmmYNY8PRv62/qsIsBTsqXl4o1432okPPZhkI14/OC7iAW
         9M+/0CztlmgxZbpZj/Nln2eu5u21HIRgRHe5GVg4J3EGfOVZ5pdfszQEl0zJOD5xmoy7
         TTBZktK7EfExgs0OfKaKOBfucbqUlgj+VnH9SqBguNxdfwUVz9mPamaHNIVIfZ7xuhBJ
         +k5HKkstRMr7/nSzHnxRFd2N5orcqSIwj1MkJMvB8FEZNVHKXRPndWt6MTu2EHZlk1Wu
         050Q5maj/RC741uGacIgMBeTvvftnvdvYNRo4UJ4FoYbREaXiSvZ/rWk87f1Dm0O2Jcy
         2b0Q==
X-Gm-Message-State: ACrzQf1+KyLvQyuHLdbvhXzps8CKihNWhiMIW+yFHqHltXfoyZFhBQRr
        Yf8bcnlpifj0hwKYZqT2wzQNEgSYxYLr3A==
X-Google-Smtp-Source: AMsMyM6n0JaNFkqMlV07Ln1iTtOcW9c3B78McB/y5kP0mYjfJeDc0i80K90qdKUD8qDB1Z9pPc2ifA==
X-Received: by 2002:a2e:82c6:0:b0:26c:4239:595d with SMTP id n6-20020a2e82c6000000b0026c4239595dmr1869411ljh.424.1663502115206;
        Sun, 18 Sep 2022 04:55:15 -0700 (PDT)
Received: from trx40.home.arpa ([91.109.27.160])
        by smtp.gmail.com with ESMTPSA id o23-20020ac25e37000000b0048afbe8a6a1sm4639287lfg.241.2022.09.18.04.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 04:55:14 -0700 (PDT)
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Aleksandr Mezin <mezin.alexander@gmail.com>
Subject: [PATCH] hwmon: (nzxt-smart2) add another USB ID
Date:   Sun, 18 Sep 2022 17:55:06 +0600
Message-Id: <20220918115506.61870-1-mezin.alexander@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

No known differences from already supported devices.

Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
---
 drivers/hwmon/nzxt-smart2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index dd892ff5a3e8..533f38b0b4e9 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -787,6 +787,7 @@ static void nzxt_smart2_hid_remove(struct hid_device *hdev)
 static const struct hid_device_id nzxt_smart2_hid_id_table[] = {
 	{ HID_USB_DEVICE(0x1e71, 0x2006) }, /* NZXT Smart Device V2 */
 	{ HID_USB_DEVICE(0x1e71, 0x200d) }, /* NZXT Smart Device V2 */
+	{ HID_USB_DEVICE(0x1e71, 0x200f) }, /* NZXT Smart Device V2 */
 	{ HID_USB_DEVICE(0x1e71, 0x2009) }, /* NZXT RGB & Fan Controller */
 	{ HID_USB_DEVICE(0x1e71, 0x200e) }, /* NZXT RGB & Fan Controller */
 	{ HID_USB_DEVICE(0x1e71, 0x2010) }, /* NZXT RGB & Fan Controller */
-- 
2.37.3

