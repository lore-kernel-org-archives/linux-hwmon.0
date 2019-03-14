Return-Path: <SRS0=mQrJ=RR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5332C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 03:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8938120854
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 03:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2GcLQDY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfCNDSx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Mar 2019 23:18:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42690 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfCNDSx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Mar 2019 23:18:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id r15so78484pfn.9
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Mar 2019 20:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=VpJ/UL7bzXjgkal+0d/WDfvwUT66NP0M/MOK4xrXma4=;
        b=Y2GcLQDYDPvw0HhsSKcJnGxv6VUwVBR9W2nZafohlJPbN75wsmcGErp39dFARlto5Y
         lg8Fvnxle/OebpbTw6ZDj/LLk612KhR0WO4mRFikhkpmBueNDXzqTPpgXMjm9KObX/sF
         WnRu8k71xJc9jbUWkLrRr1s1tW8mMhMRBZ9utuLehlHHpD+hHnqkq9vtmKuKUDpSwczO
         NcW1Iz9dtujR4Z5HOH3tEg2VnRU4Hm4IWQaZ4rwJslBd5OrK17srZeP1MqenmZMCUWTc
         940T2kFYIG68P+X3a2M/UuH20Mk0F/58RxWVILe5yWbUr1KLxeju3yWuM+K0q52xZA2f
         YgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=VpJ/UL7bzXjgkal+0d/WDfvwUT66NP0M/MOK4xrXma4=;
        b=EmvutdktmBDldnsDwyP6rd+AtoP/evozWtr15kri+rUAkXg4T3r/W2CSGsHQRqRs2e
         yJMJAkVLqWdTWUANu4jOTPCYPZhoMYvL7iIcpgtXt4KsDsFw42fNrJVfDr3E0fvQdg7A
         quK8nbW7uu33ZRqgdOOt7jXXzQUlQgJxZupjuCnumKUjm1Lgea4V1Y7XQP/aTZmbVDxM
         Be7OYvZ1lJRLVHE3mHNol7GDiutKX8rEG3990rL0jDHVjsxzUof8AxAFWGVl0sOHQuMf
         0maFJQ/1dVB19aPYpQ0cQNCzn/g8aHqSgbYli0H8G2CM0mnw5UG1v8JJRlAdqIfQP3yh
         LPFw==
X-Gm-Message-State: APjAAAXOqyXZaBIa6DE3dkd8K85iiXx3U/CLfY4bz+3QLGhDBFg2vK32
        NUdZKwxE7llCkqZlkpO84e2+iXF8
X-Google-Smtp-Source: APXvYqwN2m6rx42y5lmr/ZPHX4RuwierPfifZCGOnlM7Z7OiUKKeFuP00jl05k1UdG8rvsJyan0nbg==
X-Received: by 2002:a63:6193:: with SMTP id v141mr14281314pgb.392.1552533531698;
        Wed, 13 Mar 2019 20:18:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f8sm15659440pgs.77.2019.03.13.20.18.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Mar 2019 20:18:50 -0700 (PDT)
Date:   Wed, 13 Mar 2019 20:18:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190314031849.GA19793@roeck-us.net>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
 <20190313163027.GB15451@roeck-us.net>
 <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Christian,

On Wed, Mar 13, 2019 at 05:35:38PM +0000, Grönke, Christian wrote:
[ ... ]
> > 
> > Our last e-mails overlapped; can you explore what it would take to add
> > support for ieee754 half precision floating point ?  We would need a new
> > set of conversion functions in the core (ie pmbus_reg2data_ieee754 and
> > pmbus_data2reg_ieee754), and your driver would have to implement the
> > linear11 <-> ieee754 conversion. That may be a bit more work, but it
> > would also be cleaner, and it should not affect precision.
> 
> I give it a look tomorrow. If this presents a proper and clean way, 
> to avoid adding the hack in the generic code it might be worth it.
> 

Please use the attached patch as starting point. Obviously I could not do much
testing, but unit testing returned reasonable results. Note that we don't have
to follow the pmbus spec to the letter - it is sufficient to declare the VOUT
values to be in ieee754 format for your driver.

Guenter

---
From 2f80cad52914c674afc5a80a84f4756e1b12d803 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 13 Mar 2019 14:36:28 -0700
Subject: [PATCH] hwmon: (pmbus) Add IEEE 754 half precision support to PMBus
 core

PMBus v1.3.1 adds IEEE 754 half precision as additional data format.
Add support for it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus.h      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 135 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 132 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 1d24397d36ec..6477eb433790 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -374,7 +374,7 @@ enum pmbus_sensor_classes {
 
 #define PMBUS_PAGE_VIRTUAL	BIT(31)
 
-enum pmbus_data_format { linear = 0, direct, vid };
+enum pmbus_data_format { linear = 0, ieee754, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13 };
 
 struct pmbus_driver_info {
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2e2b5851139c..e828160a1793 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -619,6 +619,66 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 }
 
 /*
+ * Convert ieee754 sensor values to milli- or micro-units
+ * depending on sensor type.
+ *
+ * ieee754 data format:
+ *	bit 15:		sign
+ *	bit 10..14:	exponent
+ *	bit 0..9:	mantissa
+ * exponent=0:
+ *	v=(−1)^signbit * 2^(−14) * 0.significantbits
+ * exponent=1..30:
+ *	v=(−1)^signbit * 2^(exponent - 15) * 1.significantbits
+ * exponent=31:
+ *	v=NaN
+ *
+ * Add the number mantissa bits into the calculations for simplicity.
+ * To do that, add '10' to the exponent. By doing that, we can just add
+ * 0x400 to normal values and get the expected result.
+ */
+static long pmbus_reg2data_ieee754(struct pmbus_data *data,
+				   struct pmbus_sensor *sensor)
+{
+	int exponent;
+	bool sign;
+	long val;
+
+	/* only support half precision for now */
+	sign = sensor->data & 0x8000;
+	exponent = (sensor->data >> 10) & 0x1f;
+	val = sensor->data & 0x3ff;
+
+	if (exponent == 0) {			/* subnormal */
+		exponent = -(14 + 10);
+	} else if (exponent ==  0x1f) {		/* NaN, convert to min/max */
+		exponent = 0;
+		val = 65504;
+	} else {
+		exponent -= (15 + 10);		/* normal */
+		val |= 0x400;
+	}
+
+	/* scale result to milli-units for all sensors except fans */
+	if (sensor->class != PSC_FAN)
+		val = val * 1000L;
+
+	/* scale result to micro-units for power sensors */
+	if (sensor->class == PSC_POWER)
+		val = val * 1000L;
+
+	if (exponent >= 0)
+		val <<= exponent;
+	else
+		val >>= -exponent;
+
+	if (sign)
+		val = -val;
+
+	return val;
+}
+
+/*
  * Convert linear sensor values to milli- or micro-units
  * depending on sensor type.
  */
@@ -740,6 +800,9 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 	case vid:
 		val = pmbus_reg2data_vid(data, sensor);
 		break;
+	case ieee754:
+		val = pmbus_reg2data_ieee754(data, sensor);
+		break;
 	case linear:
 	default:
 		val = pmbus_reg2data_linear(data, sensor);
@@ -748,8 +811,65 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 	return val;
 }
 
-#define MAX_MANTISSA	(1023 * 1000)
-#define MIN_MANTISSA	(511 * 1000)
+#define MAX_IEEE_MANTISSA	(0x7ff * 1000)
+#define MIN_IEEE_MANTISSA	(0x400 * 1000)
+
+static u16 pmbus_data2reg_ieee754(struct pmbus_data *data,
+				  struct pmbus_sensor *sensor, long val)
+{
+	u16 exponent = (15 + 10);
+	long mantissa;
+	u16 sign = 0;
+
+	/* simple case */
+	if (val == 0)
+		return 0;
+
+	if (val < 0) {
+		sign = 0x8000;
+		val = -val;
+	}
+
+	/* Power is in uW. Convert to mW before converting. */
+	if (sensor->class == PSC_POWER)
+		val = DIV_ROUND_CLOSEST(val, 1000L);
+
+	/*
+	 * For simplicity, convert fan data to milli-units
+	 * before calculating the exponent.
+	 */
+	if (sensor->class == PSC_FAN)
+		val = val * 1000;
+
+	/* Reduce large mantissa until it fits into 10 bit */
+	while (val > MAX_IEEE_MANTISSA && exponent < 30) {
+		exponent++;
+		val >>= 1;
+	}
+	/*
+	 * Increase small mantissa to generate valid 'normal'
+	 * number
+	 */
+	while (val < MIN_IEEE_MANTISSA && exponent > 1) {
+		exponent--;
+		val <<= 1;
+	}
+
+	/* Convert mantissa from milli-units to units */
+	mantissa = DIV_ROUND_CLOSEST(val, 1000);
+
+	/* Ensure that resulting number is within range */
+	if (mantissa > 0x7ff)
+		mantissa = 0x7ff;
+	else if (mantissa < 0x400)
+		mantissa = 0x400;
+
+	/* Convert to sign, 5 bit exponent, 10 bit mantissa */
+	return sign | (mantissa & 0x3ff) | ((exponent << 10) & 0x7c00);
+}
+
+#define MAX_LIN_MANTISSA	(1023 * 1000)
+#define MIN_LIN_MANTISSA	(511 * 1000)
 
 static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 				 struct pmbus_sensor *sensor, long val)
@@ -795,12 +915,12 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 		val = val * 1000;
 
 	/* Reduce large mantissa until it fits into 10 bit */
-	while (val >= MAX_MANTISSA && exponent < 15) {
+	while (val >= MAX_LIN_MANTISSA && exponent < 15) {
 		exponent++;
 		val >>= 1;
 	}
 	/* Increase small mantissa to improve precision */
-	while (val < MIN_MANTISSA && exponent > -15) {
+	while (val < MIN_LIN_MANTISSA && exponent > -15) {
 		exponent--;
 		val <<= 1;
 	}
@@ -878,6 +998,9 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 	case vid:
 		regval = pmbus_data2reg_vid(data, sensor, val);
 		break;
+	case ieee754:
+		regval = pmbus_data2reg_ieee754(data, sensor, val);
+		break;
 	case linear:
 	default:
 		regval = pmbus_data2reg_linear(data, sensor, val);
@@ -1967,6 +2090,10 @@ static int pmbus_identify_common(struct i2c_client *client,
 			if (data->info->format[PSC_VOLTAGE_OUT] != direct)
 				return -ENODEV;
 			break;
+		case 3:	/* ieee 754 half precision */
+			if (data->info->format[PSC_VOLTAGE_OUT] != ieee754)
+				return -ENODEV;
+			break;
 		default:
 			return -ENODEV;
 		}
-- 
2.7.4

