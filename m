Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88C4C761A6
	for <linux-hwmon@archiver.kernel.org>; Sun,  9 Apr 2023 03:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjDIDrt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 Apr 2023 23:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIDrs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Apr 2023 23:47:48 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 647005BB8
        for <linux-hwmon@vger.kernel.org>; Sat,  8 Apr 2023 20:47:46 -0700 (PDT)
IronPort-SDR: 64323561_YG/CPjCBqe0x04Hw0lwO0m1sqlbaNEePkeHwxTqaEBGK8S6
 H+jDKCFezoFM+KY9Yj66aG8Zj55w2dYXaE+lbrQ==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2CwAABgNDJkjPQc8jxaGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUmBRoIugk+uBodXDwEPAQFEBAEBhQYChT0mOBMBAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAwEBBgEBAQEBAQYEFAEBAQFARYVoDYYEAgEDJwsBDQEBNwEPGThXBgESg?=
 =?us-ascii?q?n6CXaxzM4EBgggBAQaCYppqgV4JgUGLdIEWgzZ6Qj+BToEVgTyCLIEPiXeaL?=
 =?us-ascii?q?wqBNHaBIA5Kc4EEAgkCEWuBEAhnfntAAg1kCw5vgUqDKgQCFGQDCQMHBUlAA?=
 =?us-ascii?q?wsYDRY6Eyw1FCBebC0SEgUDCxUqRwQIOAYcNBECCA8SDyxEDkI3MxMGXAEpC?=
 =?us-ascii?q?AMOEQNOQRlsBIIHCgYBJiSeWQd7E5VVA7EIhAeBWZ8UTYFGp3wul0UgohKBG?=
 =?us-ascii?q?IQsAgoHFoF6gX5NHxmDIk8DGQ+OIAwNCYIKkVFjPQIHCwEBAwmLRQEB?=
IronPort-PHdr: A9a23:eqMgTBboEPkWc1z2rxM6FTb/LTAZhN3EVzX9orItiq5VNK+59ovsO
 1bTo/hokRnIUcPS9qEMgvDd5qbnX2FI+pOdqDYYfZlLSxJAiN1DkQAsWpzaAET3fvK2MHxoR
 ZYQX1U8pyOwOhAKcPs=
IronPort-Data: A9a23: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
 QryJlWrVvRp/qxUeA==
IronPort-HdrOrdr: A9a23:F2kt9KC3srRmCf3lHel255DYdb4zR+YMi2TDt3oadfWaSK2lfq
 eV7Y0mPX2dslsssRQb9exoV5PwIk80maQb3WBVB8bHYOCEghrPEGgd1/qB/9SIIUSXndK1l5
 0QFJSWY+eRMbEVt6jHCIbUKadZ/DD+ytHMuQ7H9QYQceh1UdAc0+6nMHfhLqWmLDM2f6YEKA
 ==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 09 Apr 2023 13:17:46 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3393lL5E3520033
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 9 Apr 2023 13:47:41 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3393lL5E3520033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681012061; bh=6ymyYWsJqJXMKFuGmj08JyIGI8QXgYfJqfklYu+kGQA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tQ+0RzaJ5U4cdUZYqPogomgvi+3uXAGTC2hayAyaLjrU76yO6ObzZV4XlfueUeUbr
         JFP3Pl6j5wiSfQ60Ehtf4vOLr2RkH9GGgCaNJQ8Y8CTzxwjd5GIFA8WPEMVm9+1/eD
         6lrcmLmE/kIf77foka3Xu+mRMZopXPF1FSot7rs9bYQkM4GwF+ydSh3Kqcvj9wiB4M
         IekeeM7INay2hhHW0ddOcJ/HBvRXvW+d05ssBrddgFONAFP/BVP3wWW7XzDSB/EBi5
         /NwWhVN6FSKm4zknI/Rg8LqZRyWqumKY4Egj40e+8raf86h7AX1uXEhGAJ2nXgYnY9
         lCP6wYb0/MpPA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 3/4] hwmon: (it87) Test for error in it87_update_device
Date:   Sun,  9 Apr 2023 13:47:17 +1000
Message-Id: <20230409034718.1938695-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230409034718.1938695-1-frank@crawford.emu.id.au>
References: <20230409034718.1938695-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 09 Apr 2023 13:47:41 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Handle errors from it87_update_device(), which currently only occurs if
SMBus access locking fails.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 1ca3247efb9e..a3d26ef2cd31 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -968,6 +968,9 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
 	int index = sattr->index;
 	int nr = sattr->nr;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", in_from_reg(data, nr, data->in[nr][index]));
 }
 
@@ -1060,6 +1063,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	int index = sattr->index;
 	struct it87_data *data = it87_update_device(dev);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr][index]));
 }
 
@@ -1140,6 +1146,9 @@ static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
 	u8 reg = data->sensor;	    /* In case value is updated while used */
 	u8 extra = data->extra;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if ((has_temp_peci(data, nr) && (reg >> 6 == nr + 1)) ||
 	    (has_temp_old_peci(data, nr) && (extra & 0x80)))
 		return sprintf(buf, "6\n");  /* Intel PECI */
@@ -1237,6 +1246,9 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
 	int speed;
 	struct it87_data *data = it87_update_device(dev);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	speed = has_16bit_fans(data) ?
 		FAN16_FROM_REG(data->fan[nr][index]) :
 		FAN_FROM_REG(data->fan[nr][index],
@@ -1251,6 +1263,9 @@ static ssize_t show_fan_div(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%lu\n", DIV_FROM_REG(data->fan_div[nr]));
 }
 
@@ -1261,6 +1276,9 @@ static ssize_t show_pwm_enable(struct device *dev,
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", pwm_mode(data, nr));
 }
 
@@ -1271,6 +1289,9 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       pwm_from_reg(data, data->pwm_duty[nr]));
 }
@@ -1284,6 +1305,9 @@ static ssize_t show_pwm_freq(struct device *dev, struct device_attribute *attr,
 	unsigned int freq;
 	int index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (has_pwm_freq2(data) && nr == 1)
 		index = (data->extra >> 4) & 0x07;
 	else
@@ -1589,6 +1613,9 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	int nr = sensor_attr->index;
 	int map;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	map = data->pwm_temp_map[nr];
 	if (map >= 3)
 		map = 0;	/* Should never happen */
@@ -1657,6 +1684,9 @@ static ssize_t show_auto_pwm(struct device *dev, struct device_attribute *attr,
 	int nr = sensor_attr->nr;
 	int point = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       pwm_from_reg(data, data->auto_pwm[nr][point]));
 }
@@ -1697,6 +1727,9 @@ static ssize_t show_auto_pwm_slope(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->auto_pwm[nr][1] & 0x7f);
 }
 
@@ -1734,6 +1767,9 @@ static ssize_t show_auto_temp(struct device *dev, struct device_attribute *attr,
 	int point = sensor_attr->index;
 	int reg;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (has_old_autopwm(data) || point)
 		reg = data->auto_temp[nr][point];
 	else
@@ -1958,6 +1994,9 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 {
 	struct it87_data *data = it87_update_device(dev);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", data->alarms);
 }
 static DEVICE_ATTR_RO(alarms);
@@ -1968,6 +2007,9 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = it87_update_device(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
 
@@ -2025,6 +2067,9 @@ static ssize_t show_beep(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = it87_update_device(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", (data->beeps >> bitnr) & 1);
 }
 
@@ -2102,6 +2147,9 @@ static ssize_t cpu0_vid_show(struct device *dev,
 {
 	struct it87_data *data = it87_update_device(dev);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%ld\n", (long)vid_from_reg(data->vid, data->vrm));
 }
 static DEVICE_ATTR_RO(cpu0_vid);
-- 
2.39.2

