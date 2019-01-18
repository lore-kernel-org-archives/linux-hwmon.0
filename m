Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB954C5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9452720850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuX3+plS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbfARRP3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:29 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38905 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbfARRP3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:29 -0500
Received: by mail-pf1-f195.google.com with SMTP id q1so6901353pfi.5
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OMDG0kzHkvzo9dnOB4AIe70otW2vwxj+1E00sBk5kJw=;
        b=WuX3+plS/9J4H29pL6Y/qZGuiA0epirNZBdILiYKpDEGPsP+8AmqFpGV2chQAH9jli
         07wPBcxC4iepsFImirh0Dp/NxCPaJELoCdHrBeJJ645mtj+JA+Z5/srlzx3+gLLQ9h4X
         SY0QJolZk6lIFs/ct7+Fina2VNUStXdF0lEYDXgV5WNRkA8RyfF5tsvGdX+So3RSs2z4
         RabJuwVfPywRH0yWAzAtmmeo/bD1WuwajTPMmPgpkkD0tmIEy6IOXwiLVJOjEKYmwjy6
         S1WDkavKcmKHIv7x3uWHsbKxIqa2mh93QSaoJjqzwTjglJdOBCJCOUxwjHdWdT9OTGAs
         2UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=OMDG0kzHkvzo9dnOB4AIe70otW2vwxj+1E00sBk5kJw=;
        b=kj8phEHsjsjDr80APW2spck4jid5TjWI9JK9WsLM1Oy8wOjwpPWcxLvHlwYyhnfcL0
         XR/AD4hAMVWYEe9mASNR9l6f/BRbXNYyN2ERiWQWwCZ1hncq733LYHU28PnHdEVB7gdG
         IrAKPDERW0K4OZXhmEYrpTm6G5vMVHb7Ay3oyB8isrM5F6Gz7qk5gYag3dw3a+0UOfxv
         S34Nb8MzGDb6ISILKIZjr3lutmakHa+Fp1j9NzBWNcq7NN7TXPzP2pXpqATTyRYoh4oG
         9LDUrGESv6TctyqZvKVS/4ioKTVi+PNcGkFwtfh9nZZjY0dsKr6zJA8+Pr143eOO8JWo
         fD7w==
X-Gm-Message-State: AJcUukdDJaE2rqzMXNCIoyYqRdXqPF43Rpta8TTKqXKkRy5bYYwXmez1
        hQ53H9YcXoqruCpOSB0K4PWSMSK8
X-Google-Smtp-Source: ALg8bN6SgCH20IN93yeVmZeTVeGhlsabRALOb05MBc7y8283Z1PdnoRIM33gAnz8fShGQppDLL94Zg==
X-Received: by 2002:a63:cb4a:: with SMTP id m10mr17891484pgi.105.1547831727932;
        Fri, 18 Jan 2019 09:15:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u137sm10692145pfc.140.2019.01.18.09.15.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:27 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/30] hwmon: (powr1220) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:44 -0800
Message-Id: <1547831700-15865-15-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/powr1220.c | 144 +++++++++++++++++------------------------------
 1 file changed, 52 insertions(+), 92 deletions(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 3014e4ac741e..16c1c98e0e18 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -177,8 +177,9 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 }
 
 /* Shows the voltage associated with the specified ADC channel */
-static ssize_t powr1220_show_voltage(struct device *dev,
-	struct device_attribute *dev_attr, char *buf)
+static ssize_t powr1220_voltage_show(struct device *dev,
+				     struct device_attribute *dev_attr,
+				     char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
 	int adc_val = powr1220_read_adc(dev, attr->index);
@@ -190,8 +191,8 @@ static ssize_t powr1220_show_voltage(struct device *dev,
 }
 
 /* Shows the maximum setting associated with the specified ADC channel */
-static ssize_t powr1220_show_max(struct device *dev,
-	struct device_attribute *dev_attr, char *buf)
+static ssize_t powr1220_max_show(struct device *dev,
+				 struct device_attribute *dev_attr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
 	struct powr1220_data *data = dev_get_drvdata(dev);
@@ -200,100 +201,59 @@ static ssize_t powr1220_show_max(struct device *dev,
 }
 
 /* Shows the label associated with the specified ADC channel */
-static ssize_t powr1220_show_label(struct device *dev,
-	struct device_attribute *dev_attr, char *buf)
+static ssize_t powr1220_label_show(struct device *dev,
+				   struct device_attribute *dev_attr,
+				   char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
 
 	return sprintf(buf, "%s\n", input_names[attr->index]);
 }
 
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON1);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON2);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON3);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON4);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON5);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON6);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON7);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON8);
-static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON9);
-static SENSOR_DEVICE_ATTR(in9_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON10);
-static SENSOR_DEVICE_ATTR(in10_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON11);
-static SENSOR_DEVICE_ATTR(in11_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VMON12);
-static SENSOR_DEVICE_ATTR(in12_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VCCA);
-static SENSOR_DEVICE_ATTR(in13_input, S_IRUGO, powr1220_show_voltage, NULL,
-	VCCINP);
-
-static SENSOR_DEVICE_ATTR(in0_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON1);
-static SENSOR_DEVICE_ATTR(in1_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON2);
-static SENSOR_DEVICE_ATTR(in2_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON3);
-static SENSOR_DEVICE_ATTR(in3_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON4);
-static SENSOR_DEVICE_ATTR(in4_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON5);
-static SENSOR_DEVICE_ATTR(in5_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON6);
-static SENSOR_DEVICE_ATTR(in6_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON7);
-static SENSOR_DEVICE_ATTR(in7_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON8);
-static SENSOR_DEVICE_ATTR(in8_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON9);
-static SENSOR_DEVICE_ATTR(in9_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON10);
-static SENSOR_DEVICE_ATTR(in10_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON11);
-static SENSOR_DEVICE_ATTR(in11_highest, S_IRUGO, powr1220_show_max, NULL,
-	VMON12);
-static SENSOR_DEVICE_ATTR(in12_highest, S_IRUGO, powr1220_show_max, NULL,
-	VCCA);
-static SENSOR_DEVICE_ATTR(in13_highest, S_IRUGO, powr1220_show_max, NULL,
-	VCCINP);
-
-static SENSOR_DEVICE_ATTR(in0_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON1);
-static SENSOR_DEVICE_ATTR(in1_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON2);
-static SENSOR_DEVICE_ATTR(in2_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON3);
-static SENSOR_DEVICE_ATTR(in3_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON4);
-static SENSOR_DEVICE_ATTR(in4_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON5);
-static SENSOR_DEVICE_ATTR(in5_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON6);
-static SENSOR_DEVICE_ATTR(in6_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON7);
-static SENSOR_DEVICE_ATTR(in7_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON8);
-static SENSOR_DEVICE_ATTR(in8_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON9);
-static SENSOR_DEVICE_ATTR(in9_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON10);
-static SENSOR_DEVICE_ATTR(in10_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON11);
-static SENSOR_DEVICE_ATTR(in11_label, S_IRUGO, powr1220_show_label, NULL,
-	VMON12);
-static SENSOR_DEVICE_ATTR(in12_label, S_IRUGO, powr1220_show_label, NULL,
-	VCCA);
-static SENSOR_DEVICE_ATTR(in13_label, S_IRUGO, powr1220_show_label, NULL,
-	VCCINP);
+static SENSOR_DEVICE_ATTR_RO(in0_input, powr1220_voltage, VMON1);
+static SENSOR_DEVICE_ATTR_RO(in1_input, powr1220_voltage, VMON2);
+static SENSOR_DEVICE_ATTR_RO(in2_input, powr1220_voltage, VMON3);
+static SENSOR_DEVICE_ATTR_RO(in3_input, powr1220_voltage, VMON4);
+static SENSOR_DEVICE_ATTR_RO(in4_input, powr1220_voltage, VMON5);
+static SENSOR_DEVICE_ATTR_RO(in5_input, powr1220_voltage, VMON6);
+static SENSOR_DEVICE_ATTR_RO(in6_input, powr1220_voltage, VMON7);
+static SENSOR_DEVICE_ATTR_RO(in7_input, powr1220_voltage, VMON8);
+static SENSOR_DEVICE_ATTR_RO(in8_input, powr1220_voltage, VMON9);
+static SENSOR_DEVICE_ATTR_RO(in9_input, powr1220_voltage, VMON10);
+static SENSOR_DEVICE_ATTR_RO(in10_input, powr1220_voltage, VMON11);
+static SENSOR_DEVICE_ATTR_RO(in11_input, powr1220_voltage, VMON12);
+static SENSOR_DEVICE_ATTR_RO(in12_input, powr1220_voltage, VCCA);
+static SENSOR_DEVICE_ATTR_RO(in13_input, powr1220_voltage, VCCINP);
+
+static SENSOR_DEVICE_ATTR_RO(in0_highest, powr1220_max, VMON1);
+static SENSOR_DEVICE_ATTR_RO(in1_highest, powr1220_max, VMON2);
+static SENSOR_DEVICE_ATTR_RO(in2_highest, powr1220_max, VMON3);
+static SENSOR_DEVICE_ATTR_RO(in3_highest, powr1220_max, VMON4);
+static SENSOR_DEVICE_ATTR_RO(in4_highest, powr1220_max, VMON5);
+static SENSOR_DEVICE_ATTR_RO(in5_highest, powr1220_max, VMON6);
+static SENSOR_DEVICE_ATTR_RO(in6_highest, powr1220_max, VMON7);
+static SENSOR_DEVICE_ATTR_RO(in7_highest, powr1220_max, VMON8);
+static SENSOR_DEVICE_ATTR_RO(in8_highest, powr1220_max, VMON9);
+static SENSOR_DEVICE_ATTR_RO(in9_highest, powr1220_max, VMON10);
+static SENSOR_DEVICE_ATTR_RO(in10_highest, powr1220_max, VMON11);
+static SENSOR_DEVICE_ATTR_RO(in11_highest, powr1220_max, VMON12);
+static SENSOR_DEVICE_ATTR_RO(in12_highest, powr1220_max, VCCA);
+static SENSOR_DEVICE_ATTR_RO(in13_highest, powr1220_max, VCCINP);
+
+static SENSOR_DEVICE_ATTR_RO(in0_label, powr1220_label, VMON1);
+static SENSOR_DEVICE_ATTR_RO(in1_label, powr1220_label, VMON2);
+static SENSOR_DEVICE_ATTR_RO(in2_label, powr1220_label, VMON3);
+static SENSOR_DEVICE_ATTR_RO(in3_label, powr1220_label, VMON4);
+static SENSOR_DEVICE_ATTR_RO(in4_label, powr1220_label, VMON5);
+static SENSOR_DEVICE_ATTR_RO(in5_label, powr1220_label, VMON6);
+static SENSOR_DEVICE_ATTR_RO(in6_label, powr1220_label, VMON7);
+static SENSOR_DEVICE_ATTR_RO(in7_label, powr1220_label, VMON8);
+static SENSOR_DEVICE_ATTR_RO(in8_label, powr1220_label, VMON9);
+static SENSOR_DEVICE_ATTR_RO(in9_label, powr1220_label, VMON10);
+static SENSOR_DEVICE_ATTR_RO(in10_label, powr1220_label, VMON11);
+static SENSOR_DEVICE_ATTR_RO(in11_label, powr1220_label, VMON12);
+static SENSOR_DEVICE_ATTR_RO(in12_label, powr1220_label, VCCA);
+static SENSOR_DEVICE_ATTR_RO(in13_label, powr1220_label, VCCINP);
 
 static struct attribute *powr1220_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4

