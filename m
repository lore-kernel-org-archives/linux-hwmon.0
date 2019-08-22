Return-Path: <SRS0=KTnz=WS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FA0C3A5A1
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Aug 2019 14:22:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8D4C233FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Aug 2019 14:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="gWLIlzbA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbfHVOWb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Aug 2019 10:22:31 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41224 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728125AbfHVOWb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Aug 2019 10:22:31 -0400
Received: by mail-wr1-f68.google.com with SMTP id j16so5615387wrr.8
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Aug 2019 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=+mwmP9tg3D4dT7KFGOvdOxw6YjGLDOz5cAx1Z+/l1vQ=;
        b=gWLIlzbAoSxhpFC72cJ5WgbnT/VqHZwIpIsg827wY5wOD1XzKbXiCvjMIHEm87pf8w
         vdfYS9S64pSR1HqoND/qIy3rlt7ELQgoEJ6M4S6v4za91ZZ/pQ2Y4I17NNjL0zXNWDj9
         GB8vsdRhvAVkHOBG8WWM5NtJ7yf6ESf6PTvTmAsr43kdo0Y5nTa42Ad927hn09299Ni7
         R3XYXrc+71C4zT6GxXnZ499whGMgQLqAXe+LXTfh1oSKJqSj7e+GbTsMvVd7HvfnFlyl
         QWAsFQESwvw+dy+wgY/loF+qTtKt5WfIFOk22hhHtTt0830AFTOa8VL933wM2nWPXReV
         ZGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=+mwmP9tg3D4dT7KFGOvdOxw6YjGLDOz5cAx1Z+/l1vQ=;
        b=GW91nXT3y7NyQCOn145P+RhLDUNiKTkYhS/HUZbnGHHhs337kkhQB+iOeshNPn3Y1N
         y0o0YlIB3rDRAN97uWqjKBnSdnsvFhKUmDYwZVfFdA0dCKdFQNmYMuj0TWCUWOfERPkf
         aEdA73fJfAynNFrs8jZNlOAB3uvwJcL/fsp/oMzertKaMODxKfm/pycdzQrzthu2Sy0A
         h/HxrN/nPR1caxENf9oydrch2GC0FgGGlS5grxtLxZ7/KclH4mDn1r6ilviCmNWeQg86
         qY98pg/IftjjLq9Miic/CVCCeizCQwnPtgeNl/D+13vb3LNf19WsIOAZhuWr9dLVYRCo
         +M1A==
X-Gm-Message-State: APjAAAW22DLwSQmX1EH7GL294maMOHyBmpKWWauvkMIzYf3Dvp4Ouimy
        dRaCs7i1TyuNiCyrJEMSWoubheZZaBZqHQ==
X-Google-Smtp-Source: APXvYqyMqaFQZOwo/SknAfaMLjB4jOG0PQF2oNl88JSyz1bpSqFDxXhKOaA22n1opcTTkyL+leJ54g==
X-Received: by 2002:a5d:634c:: with SMTP id b12mr46085446wrw.127.1566483749234;
        Thu, 22 Aug 2019 07:22:29 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id r123sm6660731wme.7.2019.08.22.07.22.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 07:22:28 -0700 (PDT)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v1] hwmon: (iio_hwmon) Enable power exporting from IIO
Date:   Thu, 22 Aug 2019 16:22:24 +0200
Message-Id: <db71f5ae87e4521a2856a1be5544de0b6cede575.1566483741.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is no reason why power channel shouldn't be exported as is done for
voltage, current, temperature and humidity.

Power channel is available on iio ina226 driver.

Sysfs IIO documentation for power attribute added by commit 7c6d5c7ee883
("iio: Documentation: Add missing documentation for power attribute")
is declaring that value is in mili-Watts but hwmon interface is expecting
value in micro-Watts that's why there is a need for mili-Watts to
micro-Watts conversion.

Tested on Xilinx ZCU102 board.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v1:
- from RFC - fix power conversion mili-Watts to micro-Watts

 drivers/hwmon/iio_hwmon.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
index f1c2d5faedf0..b85a125dd86f 100644
--- a/drivers/hwmon/iio_hwmon.c
+++ b/drivers/hwmon/iio_hwmon.c
@@ -44,12 +44,20 @@ static ssize_t iio_hwmon_read_val(struct device *dev,
 	int ret;
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	struct iio_hwmon_state *state = dev_get_drvdata(dev);
+	struct iio_channel *chan = &state->channels[sattr->index];
+	enum iio_chan_type type;
+
+	ret = iio_read_channel_processed(chan, &result);
+	if (ret < 0)
+		return ret;
 
-	ret = iio_read_channel_processed(&state->channels[sattr->index],
-					&result);
+	ret = iio_get_channel_type(chan, &type);
 	if (ret < 0)
 		return ret;
 
+	if (type == IIO_POWER)
+		result *= 1000; /* mili-Watts to micro-Watts conversion */
+
 	return sprintf(buf, "%d\n", result);
 }
 
@@ -59,7 +67,7 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 	struct iio_hwmon_state *st;
 	struct sensor_device_attribute *a;
 	int ret, i;
-	int in_i = 1, temp_i = 1, curr_i = 1, humidity_i = 1;
+	int in_i = 1, temp_i = 1, curr_i = 1, humidity_i = 1, power_i = 1;
 	enum iio_chan_type type;
 	struct iio_channel *channels;
 	struct device *hwmon_dev;
@@ -114,6 +122,10 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 			n = curr_i++;
 			prefix = "curr";
 			break;
+		case IIO_POWER:
+			n = power_i++;
+			prefix = "power";
+			break;
 		case IIO_HUMIDITYRELATIVE:
 			n = humidity_i++;
 			prefix = "humidity";
-- 
2.17.1

