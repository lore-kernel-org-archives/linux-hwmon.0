Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2034EC77B76
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 04:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjDPEZm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 00:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjDPEZk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 00:25:40 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 73D832D4C
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Apr 2023 21:25:38 -0700 (PDT)
IronPort-SDR: 643b78bc_346VmSdYT6N+7JQEOH1quHds0GXE6/TOou35kH2FZ4+rfAL
 WQglDyjH97FtK57y6FX0ReI3Pkeaudw4Cc8DL+w==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2CwAACkdztkjPQc8jxaGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUmBRoIugk+uCIdXDwEPAQFEBAEBhQYChTwmOBMBAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAwEBBgEBAQEBAQYEFAEBAQFARYVoDYYEAgEDJwsBDQEBNwEPGThXBgESg?=
 =?us-ascii?q?n6CXa8EM4EBgggBAQaCYppqgV4JgUGLdYEWgzZ6Qj+BToEVgTyCLYEPiXeaV?=
 =?us-ascii?q?oE0doEgDkpygQQCCQIRa4EQCGp+e0ACDWQLDm+BSYMqBAIURA5UAwkDBwVJQ?=
 =?us-ascii?q?AMLGA0WOhMsNRQgXGwtEhIFAwsVKkcECDgGGzQRAggPEg8sRAxCNzMTBlwBK?=
 =?us-ascii?q?QgDDhEDTkIZbASCCgYBJiSfGQd7E5VVA7EQhAiBWZ8UTYFGp3wul0kgohKBG?=
 =?us-ascii?q?IQsAgoHFoF6gX5NHxmDIk8DGQ+OIAwNCYIKkVFjPQIHCwEBAwmLRQEB?=
IronPort-PHdr: A9a23:dpOUbhF+7JKGZ+z47qaOTp1GfhYY04WdBeZdwpAml6kIeb6q4JrlJ
 kCZ6PBwyl7FG4zGuLpNkeGDtafmVCQb5IqZ9moPdZtQWloEkZAYkwB6UpGMAEGpIKK1P35jT
 pZJXgY9rXqwaRc9JQ==
IronPort-Data: A9a23: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
 psLzxUc5PRqLk1BHo7/PsCGvNo=
IronPort-HdrOrdr: A9a23:x3NlJatXpRn6UcqQI1lX3kM/7skDrNV00zEX/kB9WHVpm6yj/f
 xGUs576faSskdpZJlD8ersBEDkex/hHPFOkOos1NuZMzUO/VHYSL2KjrGSpQEIZReOlNK1vJ
 0IG8ND4Z/LfD9HZK3BgDVQfexP/DEJnZrY/ds2t00dKD2Cc5sQkzuRFDzrb3GemzM2fqbQxf
 Knl7B6mwY=
X-Talos-CUID: 9a23:5WWwS2/n/tYcd0Qh776Vv1c7Fcd1SFKH9lzzHGS4BmUzQeC6Y0DFrQ==
X-Talos-MUID: 9a23:tAAvdwk5PcSgWCxwzq3gdnpuHedSxvSoJXxOroUUuMeFKHJ/JG202WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 16 Apr 2023 13:55:33 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33G4PCj33415316
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 16 Apr 2023 14:25:28 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33G4PCj33415316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681619128; bh=JbYOTgMbk5IKKqjYsYlQvml8l3PzjdpEW1kEeeNYd3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pBXOJOYn84PmU0cSv3FzUQbN/GARSr6OUDecwDKFKY4b6i6MP0RwIthqCXswxsufc
         XSNk/6hUtxV0jJwWa+BmiWuEuO5PY0muOiRR6mWbRbELIzZstNVGveI6Q9bdsjIfg9
         kaXjkQNkYj7Ah1nkM57m/wWDebBupUz2egHjnKvAEca7XOY+ze5XxJ3Re2CspM5/3Y
         aJSZszFPBXREVEq75exmY96rl7g8XVn/0aUdqoX4Z4ryAOvIs9fUrEQq3huekjLr2p
         JAVHqCUAR1m3Xnm0UE6L6jaB5b1+tXHtkdhLmIvKG79XgJypkI3VLzZVH75PzDDRpm
         51Q+Ww5UeePSA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 2/4] hwmon: (it87) Test for error in it87_update_device
Date:   Sun, 16 Apr 2023 14:25:08 +1000
Message-Id: <20230416042510.1929077-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230416042510.1929077-1-frank@crawford.emu.id.au>
References: <20230416042510.1929077-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 16 Apr 2023 14:25:28 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Handle errors from it87_update_device(), which currently only occurs if
SMBus access locking fails.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Reorder patches within patchset.

---
 drivers/hwmon/it87.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index b74dd861f0fe..920fb9b6b2e2 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -942,6 +942,9 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
 	int index = sattr->index;
 	int nr = sattr->nr;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", in_from_reg(data, nr, data->in[nr][index]));
 }
 
@@ -1030,6 +1033,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	int index = sattr->index;
 	struct it87_data *data = it87_update_device(dev);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr][index]));
 }
 
@@ -1107,6 +1113,9 @@ static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
 	u8 reg = data->sensor;	    /* In case value is updated while used */
 	u8 extra = data->extra;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if ((has_temp_peci(data, nr) && (reg >> 6 == nr + 1)) ||
 	    (has_temp_old_peci(data, nr) && (extra & 0x80)))
 		return sprintf(buf, "6\n");  /* Intel PECI */
@@ -1197,6 +1206,9 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
 	int speed;
 	struct it87_data *data = it87_update_device(dev);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	speed = has_16bit_fans(data) ?
 		FAN16_FROM_REG(data->fan[nr][index]) :
 		FAN_FROM_REG(data->fan[nr][index],
@@ -1211,6 +1223,9 @@ static ssize_t show_fan_div(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%lu\n", DIV_FROM_REG(data->fan_div[nr]));
 }
 
@@ -1221,6 +1236,9 @@ static ssize_t show_pwm_enable(struct device *dev,
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", pwm_mode(data, nr));
 }
 
@@ -1231,6 +1249,9 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       pwm_from_reg(data, data->pwm_duty[nr]));
 }
@@ -1244,6 +1265,9 @@ static ssize_t show_pwm_freq(struct device *dev, struct device_attribute *attr,
 	unsigned int freq;
 	int index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (has_pwm_freq2(data) && nr == 1)
 		index = (data->extra >> 4) & 0x07;
 	else
@@ -1531,6 +1555,9 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	int nr = sensor_attr->index;
 	int map;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	map = data->pwm_temp_map[nr];
 	if (map >= 3)
 		map = 0;	/* Should never happen */
@@ -1595,6 +1622,9 @@ static ssize_t show_auto_pwm(struct device *dev, struct device_attribute *attr,
 	int nr = sensor_attr->nr;
 	int point = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       pwm_from_reg(data, data->auto_pwm[nr][point]));
 }
@@ -1631,6 +1661,9 @@ static ssize_t show_auto_pwm_slope(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->auto_pwm[nr][1] & 0x7f);
 }
 
@@ -1664,6 +1697,9 @@ static ssize_t show_auto_temp(struct device *dev, struct device_attribute *attr,
 	int point = sensor_attr->index;
 	int reg;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (has_old_autopwm(data) || point)
 		reg = data->auto_temp[nr][point];
 	else
@@ -1884,6 +1920,9 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 {
 	struct it87_data *data = it87_update_device(dev);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", data->alarms);
 }
 static DEVICE_ATTR_RO(alarms);
@@ -1894,6 +1933,9 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = it87_update_device(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
 
@@ -1949,6 +1991,9 @@ static ssize_t show_beep(struct device *dev, struct device_attribute *attr,
 	struct it87_data *data = it87_update_device(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", (data->beeps >> bitnr) & 1);
 }
 
@@ -2022,6 +2067,9 @@ static ssize_t cpu0_vid_show(struct device *dev,
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

