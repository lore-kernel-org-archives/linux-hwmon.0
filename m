Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFC5C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 28 Nov 2021 05:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbhK1FFw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 28 Nov 2021 00:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbhK1FDw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Nov 2021 00:03:52 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A3FC061746
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Nov 2021 21:00:36 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id t23so27510880oiw.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Nov 2021 21:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d5xXGIiOLSVi/N8klvpsgDvCPRmC4QIS6LIzg5qRz8E=;
        b=T5iCUBrHONueN8RJIjaJBibLdG6C8+UtHdARS7F9ifBgboMjU2/hSWJybZCvRGF+OA
         r04RfN+OSsH1xeklRtbiWqfBHLHmrMLtqt8PEDw29YTiPUNkGDgWxGc5JRLZeWpfmUjT
         CV0khjnV/4WzVHgLxj+2lEsCcltzcPVPy7NzafxkZF1VVaqlUjfWnv3nzSSATUTPp0zX
         EHh6J0En8lXC0TE/hbXmPs6WqZ2zWe1i3TavJXzCU8i56FweuhYhzaA3QH38unPQAW38
         7SDUqGc+ZBfDbl6590fGEIvHuSk27eqsxrVicj53T79n+j2iIXRlJ95G1pzYxhNOBx6X
         qDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=d5xXGIiOLSVi/N8klvpsgDvCPRmC4QIS6LIzg5qRz8E=;
        b=o6vrd79DBOeJRty2AbjA9CFPO85hD7sGeJLE92SyuOheIfwDSRaWPShgLXI5vCoU5m
         yj/AruWozSXB5XKVqampJx5DOrvjhez2BJHgf14WrDZeT/EpyZXZxX+42ocuExjIV+Wo
         4IPk8eoW8mN0lDsW/x+M3FEXTlk+oeSBJpe8wOF+d8Uqlk7GBneP4/rq3bVqK589OFtB
         SpVPWOQhw1Siot3w+i3P+VeM9kjdARwD+k+NL1SNncX1AETt6/shGQH7n4hnFP1UHe+X
         UplzjD3HPHj51V+7A9Ch8gMmxy4/K3hudM0Xx1PvMO37Quzy64Q67QzkKNkS+JrPUa2L
         K6mA==
X-Gm-Message-State: AOAM531zSRSO1NzqRS+WRGGhVHpjkBEqjKYr1DqNoqsad5rl52Cb7TOY
        9cBU1hGZ5gwjXeoBT/7nnvQ86zcHuYw=
X-Google-Smtp-Source: ABdhPJwCmexyxBxki7wrMY2P42SbQr9qN8YhMVf8TUsxSO0dY4mQpnKrQaBgBYnL2Fr13Prwj8Wzrg==
X-Received: by 2002:aca:ac8a:: with SMTP id v132mr34428120oie.44.1638075635627;
        Sat, 27 Nov 2021 21:00:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q9sm1937322oti.32.2021.11.27.21.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 21:00:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (jc42) Add support for ONSEMI N34TS04
Date:   Sat, 27 Nov 2021 21:00:31 -0800
Message-Id: <20211128050031.88443-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

N34TS04 is a JC42.4 compatible temperature sensor from ONSEMI.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jc42.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 4a03d010ec5a..cb347a6bd8d9 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -137,6 +137,9 @@ static const unsigned short normal_i2c[] = {
 #define CAT34TS04_DEVID		0x2200
 #define CAT34TS04_DEVID_MASK	0xfff0
 
+#define N34TS04_DEVID		0x2230
+#define N34TS04_DEVID_MASK	0xfff0
+
 /* ST Microelectronics */
 #define STTS424_DEVID		0x0101
 #define STTS424_DEVID_MASK	0xffff
@@ -181,6 +184,7 @@ static struct jc42_chips jc42_chips[] = {
 	{ ONS_MANID, CAT6095_DEVID, CAT6095_DEVID_MASK },
 	{ ONS_MANID, CAT34TS02C_DEVID, CAT34TS02C_DEVID_MASK },
 	{ ONS_MANID, CAT34TS04_DEVID, CAT34TS04_DEVID_MASK },
+	{ ONS_MANID, N34TS04_DEVID, N34TS04_DEVID_MASK },
 	{ NXP_MANID, SE98_DEVID, SE98_DEVID_MASK },
 	{ STM_MANID, STTS424_DEVID, STTS424_DEVID_MASK },
 	{ STM_MANID, STTS424E_DEVID, STTS424E_DEVID_MASK },
-- 
2.33.0

