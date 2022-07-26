Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54306C43334
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jul 2022 12:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239024AbiGZMCx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jul 2022 08:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239048AbiGZMCq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jul 2022 08:02:46 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8375B33A0E;
        Tue, 26 Jul 2022 05:02:45 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c12so10074836ede.3;
        Tue, 26 Jul 2022 05:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9ycyCy2OtDECwvtyNM0Q2aJyjdiy1SHMSEc5DyB84c=;
        b=WTBZUz/ViKMVPS5cn1PdBcYeCFLNxCzR6yg31ejFL5iJ6UhucecnhBjSWbmmUR+xw5
         TvOzIXgEEXfBmVlGam0AqXAqSNkrAlnXowYlXVQyyBqoGyczvccAQmR4KEe3YIcgLhQr
         I64QlWc9yUz+VC2rV7JuBCVGJvwr/HF8FnT9BukrYaJvCrVzzWA/mG+ZULHi7aPbRBeC
         jh9MRVVt08V+1UtTRlEqRBFGaLB8Oqu2BgoJ0PbGnnnKD43uqD+J9iwncYSNks9LEWc1
         nV5jCbsiYvep5fGGVYzDfFHJ80TYNUVYrv8eJHpn5oPoylrJMvUjYrRGXHEHGZmMZ8U1
         teJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9ycyCy2OtDECwvtyNM0Q2aJyjdiy1SHMSEc5DyB84c=;
        b=Q9T3hFrfq19L1dpdghXKWKgw/aZUSzamsp1qOWDezK+j2tqgDVWjs/F1DoRr9ezwl2
         ykBcO+RwQ+cLcA+/8wqnGYQprsLhYUX1zbHj5xXeFK8SIHQI/G6m2mR6njkMmbzFdk8D
         qCYj++pNf+ndFgBg3LpxjEtMrIVW9zc8L4yn6O/APsSE40SjNNg+F8rRrIRJm9EN9Gw3
         h7gtnTnMJYgyBRxRm+27pgSh1lnt7ZheRtRmqoLOpZmMfmtXSSczeD9XlSvbLTQ/6aJI
         le/l+qq906xTRLvV75XA57lok4R6R65OibqEIrkQ4a1nUrEeUxc7NGjlCmlhfc3Y0rxE
         NsqA==
X-Gm-Message-State: AJIora/ape+8wMwdh6of63eXrS3fh8CADhBY5JJ2DY9N3DjSMiLv71cO
        D2yqxq3pRinE//kaM2o2ppJFUV8lSt4=
X-Google-Smtp-Source: AGRyM1t/dYZvVeHfjupCVGc1LZSoEYBvD3s21A8iMuZSr6LiNBHHbDZ4d0f1Ys3DczJKlINNXxLOGQ==
X-Received: by 2002:a05:6402:34c1:b0:43c:e6a:397d with SMTP id w1-20020a05640234c100b0043c0e6a397dmr8170382edc.160.1658836963539;
        Tue, 26 Jul 2022 05:02:43 -0700 (PDT)
Received: from DESKTOP-A98GP49.. (cable-178-148-254-8.dynamic.sbb.rs. [178.148.254.8])
        by smtp.gmail.com with ESMTPSA id cn23-20020a0564020cb700b0043ba0cf5dbasm8505922edb.2.2022.07.26.05.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:02:43 -0700 (PDT)
From:   Aleksa Savic <savicaleksa83@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (aquacomputer_d5next) Add support for reading the +12V voltage sensor on D5 Next
Date:   Tue, 26 Jul 2022 14:02:03 +0200
Message-Id: <20220726120203.33773-1-savicaleksa83@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for reading the +12V voltage that the D5 Next pump receives.

Signed-off-by: Aleksa Savic <savicaleksa83@gmail.com>
---
 drivers/hwmon/aquacomputer_d5next.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 997d72ea6182..738a1df8eae6 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -71,6 +71,7 @@ static u8 secondary_ctrl_report[] = {
 #define D5NEXT_PUMP_OFFSET		0x6c
 #define D5NEXT_FAN_OFFSET		0x5f
 #define D5NEXT_5V_VOLTAGE		0x39
+#define D5NEXT_12V_VOLTAGE		0x37
 #define D5NEXT_CTRL_REPORT_SIZE		0x329
 static u8 d5next_sensor_fan_offsets[] = { D5NEXT_PUMP_OFFSET, D5NEXT_FAN_OFFSET };
 
@@ -114,7 +115,8 @@ static const char *const label_d5next_power[] = {
 static const char *const label_d5next_voltages[] = {
 	"Pump voltage",
 	"Fan voltage",
-	"+5V voltage"
+	"+5V voltage",
+	"+12V voltage"
 };
 
 static const char *const label_d5next_current[] = {
@@ -340,8 +342,8 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
 	case hwmon_in:
 		switch (priv->kind) {
 		case d5next:
-			/* Special case to support voltage sensor */
-			if (channel < priv->num_fans + 1)
+			/* Special case to support +5V and +12V voltage sensors */
+			if (channel < priv->num_fans + 2)
 				return 0444;
 			break;
 		default:
@@ -574,6 +576,7 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	switch (priv->kind) {
 	case d5next:
 		priv->voltage_input[2] = get_unaligned_be16(data + D5NEXT_5V_VOLTAGE) * 10;
+		priv->voltage_input[3] = get_unaligned_be16(data + D5NEXT_12V_VOLTAGE) * 10;
 		break;
 	default:
 		break;
-- 
2.37.1

