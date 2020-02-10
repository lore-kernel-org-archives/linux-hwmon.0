Return-Path: <SRS0=RJFc=36=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D089EC35254
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Feb 2020 17:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A94D72080C
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Feb 2020 17:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaRWKO3B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgBJRxT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Feb 2020 12:53:19 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43675 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgBJRxT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Feb 2020 12:53:19 -0500
Received: by mail-pf1-f193.google.com with SMTP id s1so4046935pfh.10
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2020 09:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=VysTmKPrB0aqop6ZxUaGM1sAaj8tjmbLT3VN6PP9BSw=;
        b=jaRWKO3Buodb6+fPH/4t49o2yNF6uaWuSh4ah5MQClx7pn6V+o1H9Uxp8SNEBqKhdr
         fNdJ//1TK1ZsD9e3EMjuKAUVOdBijIfFw3Xh2Ts5JlU1vaTF+FBib8PnMQxCPp2JSFTn
         OYsZN0cY270OYDRcSFM6NIRSdGHUoePsAEzmrsvJM7bVuOSQaRAquNy0jTvx2chzXt8X
         JoOBHRrTmINUJXmtNZMR3XtWDGOcMTuFPToWk2xyg++dG7CA7/g47x8Qc3J/QhwEEwSf
         EHISgdTxUcDqes1C9R59m7KMO+M0TbtMNkXdOeG5D/63F0S45Ql3SluPCnwdCLOYEb9y
         YOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=VysTmKPrB0aqop6ZxUaGM1sAaj8tjmbLT3VN6PP9BSw=;
        b=gts2l2nEJiJvyAI8wuatkGbgPV5GV57791oYp7+VA1p1+8Gfc9Q87ovyMFdiLc1xyk
         QYBA8NdwYKD/ZJuVxyhZUe4sWlp1ld/oJeOeFTnMszH56b6XAezNw/TT1FsXKh9XIgOb
         lFxIEwbr2Sg8S9k7BQdd2t7XX1x09OTUTn+NBl3GpC/39Jx5EGFS55KjqxcItwEEd9KN
         80tPxRFiW1aVGvjhzz0m88s0EDf8q8FOvxmLC2fOCPHN2n0L/wl5qPO6K7NrU5mjRVlD
         m1yL/8hG7nNBiA8l0Qqh8dsWVJG7B2dRwtKu8VB6A96ymTJYtLhsSOIFYaNZc38Ww4Di
         Rwhg==
X-Gm-Message-State: APjAAAXU03nQwajdWynGlO6giGhAVvMmnIW1cN+KCQNph/W8xU8mMOmb
        jWsIT+HozU8EXoBKEiXfyf28iXgG
X-Google-Smtp-Source: APXvYqyhAVwyAgrTVmpWSCEKldgsAIicOEVEyrB9GHaHfMIIC2q27ROmp1g0YS/orq1ZlL7KVnG1gQ==
X-Received: by 2002:a63:a1e:: with SMTP id 30mr2988607pgk.238.1581357198339;
        Mon, 10 Feb 2020 09:53:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x197sm1079352pfc.1.2020.02.10.09.53.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 09:53:17 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/3] hwmon: (k10temp) Swap Tdie and Tctl on Family 17h CPUs
Date:   Mon, 10 Feb 2020 09:53:12 -0800
Message-Id: <20200210175314.32643-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Traditionally, the temperature displayed by k10temp was Tctl.
On Family 17h CPUs, Tdie was displayed instead. To reduce confusion,
Tctl was added later as second temperature. This resulted in Tdie
being reported as temp1_input, and Tctl as temp2_input. This is
different to non-Ryzen CPUs, where Tctl is displayed as temp1_input.
Swap temp1_input and temp2_input on Family 17h CPUs, such that Tctl
is now reported as temp1_input and Tdie is reported as temp2_input,
to align with other CPUs, streamline the code, and make it less
confusing. Coincidentally, this also aligns the code with its
documentation, which states that Tdie is reported as temp2_input.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index e39354ffe973..b38547cd7ba3 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -180,8 +180,8 @@ static long get_raw_temp(struct k10temp_data *data)
 }
 
 const char *k10temp_temp_label[] = {
-	"Tdie",
 	"Tctl",
+	"Tdie",
 	"Tccd1",
 	"Tccd2",
 	"Tccd3",
@@ -269,13 +269,13 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
 	switch (attr) {
 	case hwmon_temp_input:
 		switch (channel) {
-		case 0:		/* Tdie */
-			*val = get_raw_temp(data) - data->temp_offset;
+		case 0:		/* Tctl */
+			*val = get_raw_temp(data);
 			if (*val < 0)
 				*val = 0;
 			break;
-		case 1:		/* Tctl */
-			*val = get_raw_temp(data);
+		case 1:		/* Tdie */
+			*val = get_raw_temp(data) - data->temp_offset;
 			if (*val < 0)
 				*val = 0;
 			break;
@@ -334,9 +334,9 @@ static umode_t k10temp_is_visible(const void *_data,
 		switch (attr) {
 		case hwmon_temp_input:
 			switch (channel) {
-			case 0:		/* Tdie, or Tctl if we don't show it */
+			case 0:		/* Tctl */
 				break;
-			case 1:		/* Tctl */
+			case 1:		/* Tdie */
 				if (!data->show_tdie)
 					return 0;
 				break;
@@ -372,8 +372,8 @@ static umode_t k10temp_is_visible(const void *_data,
 			if (!data->show_tdie)
 				return 0;
 			switch (channel) {
-			case 0:		/* Tdie */
-			case 1:		/* Tctl */
+			case 0:		/* Tctl */
+			case 1:		/* Tdie */
 				break;
 			case 2 ... 9:		/* Tccd{1-8} */
 				if (!(data->show_tccd & BIT(channel - 2)))
-- 
2.17.1

