Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386408;
	b=ZsVpOUqNAgUBZfgkcxyYLf4GzyMcFemrQBfTxPjG2/BVcuju91EWXBLotLdsXVtc0RtQ
	 jIewsxbq8ztVqpMPxj9Z3buNvKXfNtF8z9dd+k1+66c6tG+iAmpodCVBcRIIpLikpif44
	 hdHzijrIsMRC6o+/8Kqq4zTJsR2CixOK2HALLPcwsGKLfQxYMCrAewlpElOWYAtxLiEb2
	 YY5ZSiWa7j9x08GpWoYRguiLcG/LyGKp3pL6upLDu/r+xAQyrbm0onQySMxvB3DcptKiC
	 EfWx+aPcMsHc5CaZ4WUxXIk/cOg/PlYc7BnVdoiEAN9zlfGisDSPvC5rZqKVQI0AV7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386408;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=rDac4+DrMD87o76YcIHYm2+tfROu0y3up8ue9EHb3Ds=;
	b=MQ2L+aWTfbSaaqr+3JgOPCx4SLDr4+46s8mTRtp7ZlrDQWvE1Xedf7S92Jf3YJaf0X0H
	 /XiMVn7qDmUrecH6zJYoflYPcdNTHMKh3OUkmvFfe3RyzuGIcVFzoTa0k9/X21PyYlHBO
	 vZuJU1W1FzMV33cpBALj9VGPUdXs1dEAzpi1nAcEXuNPqkmb8yy/QG8pUZMjJ23zkgGY0
	 Eu+X5KQvW0mc6UmkNDq5fEecPbg1yIUQyJXn0YX9H9XA5B/lQvWPK/78EeZgts1RCfFS9
	 EZDA+uyU9FPRZTQx1kuB8dwMbOGuBb3pyP4vVO2L1KuP1MoqRygM+xUUkYvYL5RWN5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ijh2C9HR;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E38606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E38606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ijh2C9HR
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id Magdx36NfaC0UMrj8xCvsI; Fri, 30 Oct 2026 18:53:22 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Mrj8xukI5NSXiMrj8xSjEf; Fri, 30 Oct 2026 18:53:22 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae4e7a2
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=-25jO8nRFeh6d--6hIYA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=rDac4+DrMD87o76YcIHYm2+tfROu0y3up8ue9EHb3Ds=; b=ijh2C9HRtHWy
	ukAgddL9xaE5WjVCtVxyJprrakr+jdJOniuJxYDuXJGL15+RRz6+j4hbsrSHJ6Ui39bDGw54Jc0mi
	tKx3Rg3vaBZXuVWMCWXKv0ED3TPWFwKvSfYFrwnW80NSdulzaH+07yzhAjtleIrnMw0Fcx21vVR8y
	JD1sk+60+Bm3II+GoCxTU9MLUnbqT2LmZzR8IpOrS9bptqKHWQQXZuqm6a/Ts7x+WnyVRpkCjExmz
	Cjkb+EDeeCldH+hvnGZEwz4CwWUUtly+7eyWqE+Cz9CCoWEkYuVHvFhV8ujk87EOZpm+3sF55l605
	o0k62StUYRyQCo3gyvGJcA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43082 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMrj7-00000003RRg-3IX8;
	Sat, 31 Oct 2026 00:23:21 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/11] hwmon: (nct6683) Fix incorrect struct cast in show_pwm() and store_pwm()
Date: Fri, 30 Oct 2026 11:52:51 -0700
Message-ID: <20261030185256.976255-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261030185256.976255-1-linux@roeck-us.net>
References: <20261030185256.976255-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMrj7-00000003RRg-3IX8
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43082
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 22
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOPbP6HcHYrb/XHlP7DAvYbbq+/laR97enKfd0lDy4XvFxuFM3iVvtL/emev6YUrJcmLjzMM0eA4Va+fvQyUYwh89mRLAL0Ia51fNASzdHEQhgxFXIAV
 QRt1k/Q4W1t/fItKfxLq5V8VX/akeelX2BBLYEZ7Or3LnJXfVNBPA9Kc9LuBqszRuEHQgGwcZb/viOOx6sKD5K4eArHzUXpFlQyN1RiPtuhT6tmW1uxkXB2o

On big-endian architectures, reading or writing the pwm[1-8] sysfs
attributes in the nct6683 hardware monitoring driver always redirects to
channel 0 due to an incorrect struct downcast in show_pwm() and
store_pwm().
The driver defines the PWM sysfs attributes using SENSOR_TEMPLATE(),
which initializes them as struct sensor_device_attribute (where the index
is a 32-bit int). However, the sysfs callbacks show_pwm() and store_pwm()
incorrectly downcast the attribute to a struct sensor_device_attribute_2
(where the index is an 8-bit u8). Because both structs start with struct
device_attribute, container_of() resolves to the same base address. On
big-endian architectures, reading the 8-bit index field from the memory
layout of a 32-bit int fetches the most significant byte (which is 0),
rather than the intended channel number.
This type mismatch causes all PWM reads to return data for channel 0, and
any writes intended to configure other channels will silently overwrite the
duty cycle of PWM channel 0 instead.

Fix the type casts in show_pwm() and store_pwm() to solve the problem.

Fixes: 41082d66bfd6 ("hwmon: Driver for NCT6683D")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6683.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index e1c36c95affb..f34cb62305be 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -920,7 +920,7 @@ static ssize_t
 show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct nct6683_data *data = nct6683_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int index = sattr->index;
 
 	return sprintf(buf, "%d\n", data->pwm[index]);
@@ -930,7 +930,7 @@ static ssize_t
 store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 	  size_t count)
 {
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	struct nct6683_data *data = dev_get_drvdata(dev);
 	int index = sattr->index;
 	unsigned long val;
-- 
2.45.2

