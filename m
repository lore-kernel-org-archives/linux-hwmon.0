Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245B7C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 07:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348760AbiAKHxK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 02:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236041AbiAKHxI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 02:53:08 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48F8C061756
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Jan 2022 23:53:08 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id z3so15906639plg.8
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Jan 2022 23:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXZQa7D4sZdrjy19e3bGGVbURX6xJ2eAXjQ6Ay2LDZk=;
        b=fetcySDbOiw/kbnkPrkIa6v2jlqpeC7NdK1ShCR43dq/EHwGqrLcvk+VZFuLx+Gk8R
         r7HAx0RHwDlf0SP9TInMDEWqlm8jRaBLY/ur25uYYenYdQT5OXu2g3NhIxew19MVoElf
         yNOVNlpfFfil871FWrQ+pugt8YtlC/yf8Kl7jdcwx60i8YVfkYE/H79Huq60+ooNQriu
         JNzg/0NCXzt9i8t2xp3rBlm7m+0FP6wMIpQtsUIGbJ7y/AzoUuY4ymettxT/SH+x5/yL
         BBbABX01OIOG1+ZIhcMjfVneYlUhZcDbOQ5239CFBc5QrTRLb7IdZzAbGfNDfUEn21Hb
         6wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXZQa7D4sZdrjy19e3bGGVbURX6xJ2eAXjQ6Ay2LDZk=;
        b=WlE9dsFhfdxSSMU7Hedv2b7EJTdLRBU0iGZkJGz7rjeQehT9ZRotG43NsGKUbZKFVz
         ywFzI3NC20FsmH5KV1iBiPzz75bnukRCJUthR6wSasHIaxCezmsVa6t+hlFROBaRC3rF
         Ze6dUmnnofyB/ATmthjQVX+PxsyKi4SQ6F9rdcgPekWbcpDCngxzOoLxOgxqMog7YDLd
         h5ip7t/oafo8erUynFKXsUFuJPrbR6zzsF4fa1vsqF2oS2qq12huuQCU2nuVJOJa6Dgg
         7i+GJtI5zgb2uNqrda3fF2tPSn/0IHoIW3fcpGYzv0OQ4va6ixg/YDrO+Ud86tPYq3HG
         tTng==
X-Gm-Message-State: AOAM533A6aNkd1CAqrIlJMFgTGdkraDZPdmnX+pti45JH3UrKTv/N3ZU
        k0roKjTiYoFN65Uo4YIYTVyNu2kE2OuySQ==
X-Google-Smtp-Source: ABdhPJwn2SaNzOiNHf+xWRpeLm/LXJX9LZDzi4pjwYO+hkItLmRh0QsKxEs2UVwwzgR5lEP89aNpEw==
X-Received: by 2002:a63:2056:: with SMTP id r22mr2962192pgm.460.1641887588122;
        Mon, 10 Jan 2022 23:53:08 -0800 (PST)
Received: from hal.local ([174.127.229.57])
        by smtp.googlemail.com with ESMTPSA id s5sm8803294pfe.117.2022.01.10.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 23:53:07 -0800 (PST)
From:   Anthony DeRossi <ajderossi@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, pauk.denis@gmail.com,
        eugene.shalygin@gmail.com
Subject: [PATCH] hwmon: (asus_wmi_ec_sensors) Support T_Sensor on Prime X570-Pro
Date:   Mon, 10 Jan 2022 21:18:42 -0800
Message-Id: <20220111051842.25634-1-ajderossi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Asus Prime X570-Pro motherboards have a T_Sensor header that can be
connected to an optional temperature probe.

Signed-off-by: Anthony DeRossi <ajderossi@gmail.com>
---
 drivers/hwmon/asus_wmi_ec_sensors.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus_wmi_ec_sensors.c b/drivers/hwmon/asus_wmi_ec_sensors.c
index 22a1459305a7..a3a2f014dec0 100644
--- a/drivers/hwmon/asus_wmi_ec_sensors.c
+++ b/drivers/hwmon/asus_wmi_ec_sensors.c
@@ -112,7 +112,8 @@ struct asus_wmi_data {
 /* boards with EC support */
 static struct asus_wmi_data sensors_board_PW_X570_P = {
 	.known_board_sensors = {
-		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB, SENSOR_TEMP_VRM,
+		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
+		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
 		SENSOR_FAN_CHIPSET,
 		SENSOR_MAX
 	},
-- 
2.34.1

