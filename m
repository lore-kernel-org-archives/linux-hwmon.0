Return-Path: <SRS0=nJvH=AY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F541C433E7
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69FF52068F
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoELVcSh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGMTcp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgGMTco (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jul 2020 15:32:44 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4D2C061794;
        Mon, 13 Jul 2020 12:32:43 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a1so18664591ejg.12;
        Mon, 13 Jul 2020 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z6RHtTGRdWekOvdSskgDjb9X7X8XfHLbprspfwQKryY=;
        b=MoELVcShHIiDmYlGQ4JqvCPL0dHE/laURMDOi3kZ6nD1gjMkuTkvbu/4cNHcIfQpxD
         o/lTKz2exGkcxSP/9eVxuLbVpGkpr0a+3Bw9WR8i4ujxBXeiQM5jp+8KQA2oSWrxRKGr
         4QuL5mZZXNs8c0jobpmlAmUmrcyK8RNWSEjJEEgsiglbOJ2T6jULZvNpBZEQIpghcqtU
         nR+9LlzhA26+dEkAB6y05aUgXwmQ/HuPv2Kshq4ZRltOJVugAMoJtSEBr6yDJkDdb/+a
         Gzr6KHuycfwmH40p+JNKMu375G17cKVV8veF0iu4BPZkyCGW2kp3UvWaaocb4w/dwLbz
         BV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z6RHtTGRdWekOvdSskgDjb9X7X8XfHLbprspfwQKryY=;
        b=Djrg1G9fCIhk086F2O4UoALU6DVuWJxaGl5EynBx6yFQx/yl3OgH/SDqmAKUGe6MTR
         5dRt+oBSnWjw5nCSum9q5KUGcrQcYJ8dNudCN6r+uQdTXlkRRApenIX3xY51NAwNDutK
         ZS7zFYmU1Pr2K5mOJ0sZ/VZmUs427aCadtjpj1mTfDE08CPHwyQS3JfkVK0UeLqsecSp
         ZumgbBKs0z9NqI8AceKvnmO5AfDl88snfeJ+fatU7wlBU2CKJJJhfjyBdDEZh2F8DURu
         vy7/ITqH6L50vRwc6CDTMRZdviosajTYtxurQGvToVbMZcOb4Hx85Qvxdg5w/kDRXL4b
         ylxA==
X-Gm-Message-State: AOAM532X+YPSU3Hy0lLVOTOwoT6Luf3lhujMZhO9gvrqYo0iY+PV6f5c
        tkgQH2cjtd1f8o4lDcNibKA=
X-Google-Smtp-Source: ABdhPJzoV6r6D1vcMT2+2AvKCXE/UHM66TqCrlczyBfsnlZOzSVFR4x2hPieziuEmN0AoQm+8Y7C/Q==
X-Received: by 2002:a17:906:b2c8:: with SMTP id cf8mr1292309ejb.132.1594668762337;
        Mon, 13 Jul 2020 12:32:42 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id x10sm10454003ejc.46.2020.07.13.12.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:32:41 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jaap Aarts <jaap.aarts1@example.com>
Subject: [PATCH 3/6] rpm support for asetek gen 6 driver
Date:   Mon, 13 Jul 2020 21:32:24 +0200
Message-Id: <20200713193227.189751-3-jaap.aarts1@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713193227.189751-1-jaap.aarts1@gmail.com>
References: <20200713193227.189751-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: Jaap Aarts <jaap.aarts1@example.com>
---
 drivers/hwmon/asetek_gen6.c | 190 ++++++++++++++++++++++++++++++++++--
 1 file changed, 182 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
index b82a678717ab..5c3bd456f881 100644
--- a/drivers/hwmon/asetek_gen6.c
+++ b/drivers/hwmon/asetek_gen6.c
@@ -108,6 +108,50 @@ static bool check_succes(char command, char ret[SUCCES_LENGTH])
 	return strncmp(ret, success, SUCCES_LENGTH) == 0;
 }
 
+int set_fan_rpm_curve(struct driver *cdev, struct fan_hwmon_data *fan_data,
+		      struct curve_point point[7])
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	char *send_buf = cdev->bulk_out_buffer;
+	char *recv_buf = cdev->bulk_in_buffer;
+	memcpy(fan_data->curve, point, sizeof(fan_data->curve));
+
+	send_buf[0] = 0x40;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = point[0].temp;
+	send_buf[3] = point[1].temp;
+	send_buf[4] = point[2].temp;
+	send_buf[5] = point[3].temp;
+	send_buf[6] = point[4].temp;
+	send_buf[7] = point[5].temp;
+	send_buf[8] = point[6].temp;
+	send_buf[9] = point[0].pwm;
+	send_buf[10] = point[1].pwm;
+	send_buf[11] = point[2].pwm;
+	send_buf[12] = point[3].pwm;
+	send_buf[13] = point[4].pwm;
+	send_buf[14] = point[5].pwm;
+	send_buf[15] = point[6].pwm;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 16, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 4, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	if (!check_succes(
+		    send_buf[0],
+		    recv_buf) /* || recv_buf[3] != fan_data->fan_channel */)
+		printk(KERN_INFO "[*] Failled setting fan curve %d,%d,%d/%d\n",
+		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+	return 0;
+}
 int set_fan_target_rpm(struct driver *cdev, struct fan_hwmon_data *fan_data,
 		       long val)
 {
@@ -177,6 +221,40 @@ int get_fan_current_rpm(struct driver *cdev, struct fan_hwmon_data *fan_data,
 	return 0;
 }
 
+int set_fan_target_pwm(struct driver *cdev, struct fan_hwmon_data *fan_data,
+		       long val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	unsigned char *send_buf = cdev->bulk_out_buffer;
+	unsigned char *recv_buf = cdev->bulk_in_buffer;
+
+	fan_data->fan_pwm_target = val;
+	fan_data->fan_target = 0;
+
+	send_buf[0] = 0x42;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[3] = fan_data->fan_pwm_target;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
+	if (retval != 0)
+		return retval;
+
+	//no error
+	if (!check_succes(send_buf[0], recv_buf) ||
+	    recv_buf[3] != fan_data->fan_channel)
+		printk(KERN_INFO "[*] Failled setting fan pwm %d,%d,%d/%d\n",
+		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+	return 0;
+}
+
 umode_t is_visible_func(const void *d, enum hwmon_sensor_types type, u32 attr,
 			int channel)
 {
@@ -196,6 +274,19 @@ umode_t is_visible_func(const void *d, enum hwmon_sensor_types type, u32 attr,
 			break;
 		}
 		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0200;
+			break;
+		case hwmon_pwm_mode:
+			return 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+
 	default:
 		break;
 	}
@@ -214,7 +305,11 @@ static int write_func(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_fan:;
 		switch (attr) {
 		case hwmon_fan_target:
+
 			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1) {
+				return -EINVAL;
+			}
 
 			retval = usb_autopm_get_interface(cdev->interface);
 			if (retval)
@@ -229,11 +324,70 @@ static int write_func(struct device *dev, enum hwmon_sensor_types type,
 			if (retval)
 				goto cleanup;
 
-			break;
+			goto exit;
 		default:
 			return -EINVAL;
 		}
-		break;
+		goto exit;
+	case hwmon_pwm:;
+
+		switch (attr) {
+		case hwmon_pwm_input:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1) {
+				return -EINVAL;
+			}
+
+			retval = usb_autopm_get_interface(cdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&cdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = set_fan_target_pwm(cdev, fan_data, val);
+			if (retval)
+				return retval;
+
+			goto cleanup;
+		case hwmon_pwm_mode:
+			fan_data = data->channel_data[channel];
+
+			retval = usb_autopm_get_interface(cdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&cdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+			fan_data->mode = val;
+
+			if (val == 0) {
+				set_fan_rpm_curve(cdev, fan_data,
+						  default_curve);
+			} else if (val == 1) {
+				if (fan_data->fan_target != 0) {
+					retval = set_fan_target_rpm(
+						cdev, fan_data,
+						fan_data->fan_target);
+					if (retval)
+						goto cleanup;
+				} else if (fan_data->fan_pwm_target != 0) {
+					retval = set_fan_target_pwm(
+						cdev, fan_data,
+						fan_data->fan_pwm_target);
+					if (retval)
+						goto cleanup;
+				}
+			}
+			goto cleanup;
+		default:
+			return -EINVAL;
+		}
+		goto exit;
 	default:
 		return -EINVAL;
 	}
@@ -274,19 +428,36 @@ int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (retval)
 				goto cleanup;
 
-			break;
+			goto cleanup;
 		case hwmon_fan_target:
 			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1) {
+				*val = 0;
+				goto exit;
+			}
 
 			get_fan_target_rpm(fan_data, val);
-			break;
+			goto exit;
 		case hwmon_fan_min:
 			*val = 200;
-			break;
+			goto exit;
+
 		default:
 			return -EINVAL;
 		}
-		break;
+		goto exit;
+
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_mode:
+			fan_data = data->channel_data[channel];
+			*val = fan_data->mode;
+			goto exit;
+		default:
+			return -EINVAL;
+		}
+		goto exit;
+
 	default:
 		return -EINVAL;
 	}
@@ -299,8 +470,11 @@ int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	return retval;
 }
 static const struct hwmon_channel_info *dual_fan[] = {
-	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET,
-			   HWMON_F_INPUT | HWMON_F_TARGET),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_MODE,
+			   HWMON_PWM_INPUT | HWMON_PWM_MODE),
+
 	NULL
 };
 
-- 
2.27.0

