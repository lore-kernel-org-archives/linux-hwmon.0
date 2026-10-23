Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747003;
	b=BGg0JX4vnjMHINSa1Bz6oyA3ukiSm3NgFP8Ogl7fBrMsRN3YPliqrszVZKd5OzOadRno
	 kc3FJMgkQ3CEI3EvGknbSK0JwBnAze9GW3y1Q3FkAtfIIVb4Wrs8QXiBYCktMJpQ8HIL5
	 GIis/XFBEwhLQ3q/xPvMSOGOhxtWkKQccnsTJl90C+ZkEGhQ7Kxpug4QF3tFPiJxnX2CN
	 evtxmpsH7JWEtzTUI/aNYz6bOwYpmmiPYEHuWmVo9uPYdqD1pGeTJFzhzPknqFE0+E9My
	 rGyuG51aB8S+kDX+u8hz5ja1bn9CFzcHUIqfVPA1aUuhZjGl+sIOy2Nsgu1R6EgbyZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747003;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SfWCF7jui+xukUwppPnuOKg0zag5vcg2lj3moO9F6cU=;
	b=tilDK6AtElCS4xdD2A5KE35yz5R0alhBi9tMMbddmZjrBPJmBWjV792gU3B9WgXGQXQa
	 CQRl/IYA7brBhY9/u2B17QfITli/DwQW2Tlv1CSZK2B2o7vqBdJ0V4xwUxiWiBXXP+COP
	 F+iVgcmB+MP+wwaIRxnXrslouDyLc0hq4iZqTEdVH6JD7XWEMyzX21Kg61uzDH3Adr0Ym
	 UgLY/7j/+a3kNTBZdmE8/zknmwtPkRk60NckumS5LBCIbTbSGMZjnT6fEl06km98KNia2
	 vxpUMJ92XlfQhXSHhcBU5NBxKfA+pyF1Il119ecAw+cdetVNrAAKM9Aa0cAVjqKzRPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=DxhZKEtI;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="OpTYx/cP";
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF4860A2614;
	Fri, 23 Oct 2026 09:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF4860A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=DxhZKEtI;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=OpTYx/cP
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7NASd1231570;
	Fri, 23 Oct 2026 05:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=SfWCF7jui+xukUwppPnuOKg0zag5vcg2lj3moO9F6cU=; b=DxhZKEt
	I0hF02fEZiDrc9IicUcYMr/LPKQDPdbPspTby+jvJextGLRObG2JdHl7HguWcxTo
	Pz73AigdDHYoi4ezekvZN4T53KCdNAyQhBTXiqdSIHs1cH2LCMPTMta88cnCaXNU
	bht6x6U3EYeQl+BK14EDkdMDTCx9uN91FvTqqHxNbtV0cMq7uGG8iZicrqFBtUvB
	K2j6Do7++Ock0PW5J6PldLIYRr/q6MXAiGU3kU66servyemduC4sMOO928tNqZlP
	rdjq8gf0I/AIz9lmUhyKnSdDFM13KEVDdQqERlori7JvOFgMdE2uorOblY5zbppj
	QvYhXUvB0hp+PHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SfWCF
	7jui+xukUwppPnuOKg0zag5vcg2lj3moO9F6cU=; b=OpTYx/cPMVYq9pWpuXsE+
	cI0sSdpzSZjojC+4Hy9kjt64kQ8p+hpwyKLdpt5eVf7d+0G0Rj0qB9Rwg13GKIu1
	t6Obxele/BEUSabHC2ZeOEbgz+Rwz/30axJPgRkpPhOyp7mW4VIe2E1yOmD4w19P
	A1KvsBHjKWUKyVbE85/mPxsNJD4hy0zz4Fn9F7Z+FrdLg1iyLyuOBoUZ49Z8xbjK
	RoS/6dkyHYiLubKcTx3qnBBZAUY+p+pVYt1bK+CDx5py+IApN1p/PNiUouDLLCeO
	VlJ5dzdL8g5te6OT/s/rtvS4mvEmlikkUqhIqrFbNle8UC81ofHq4yHqLdkg3YSt
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hg3570gus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 05:16:28 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 69N9GRL1049080
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Oct 2026 05:16:27 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 23 Oct 2026 05:16:27 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 23 Oct 2026 05:16:26 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 23 Oct 2026 05:16:27 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69N9FwZF023047;
	Fri, 23 Oct 2026 05:16:21 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <linux@roeck-us.net>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <skhan@linuxfoundation.org>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v4 3/3] hwmon: (lm75) add MAX31875 support
Date: Fri, 23 Oct 2026 17:15:50 +0800
Message-ID: <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
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
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 4an-aqxSkzXwmQ7HufUrir_xThU6dYZ9
X-Proofpoint-GUID: 4an-aqxSkzXwmQ7HufUrir_xThU6dYZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX/KMVl102fTkr
 fjkJCKJYOdDMjwh5BWI9ouv4yd/zEgjPvw3ghxZUbpnW8Gv6P/J1YiHVFafrjL62ona97+T40mM
 3Epkhau4y+dxstTNWK94tIYIzcT8IlcRW185rSUqpYuFI/etpYNPeKtX2i7S+VWjSffUUTo/ANM
 NnHAzsiaD1BW0YIxX01pTHyTNjp6zQe/0QvvQikAPDkdlUBoWD8C5ifva8AAkaeJO7gxfzsEnrD
 rZ1cyouCrWNSsoCTtbGFnWoP2eoXfMTHFCPLJPdw4kRxjUU9TbQiYczs9KQgZOG6I7Any6fcjCy
 ur2+fskaG+eIgM+vmGZ9O07ccZytKKU3Rg3TanotgVIaJXJEJcyD8ssYWvFrEf6IT8ErdSs8zWw
 iJnjzoNY6UuQbl1geo++WURo5lZoywoeJD7/7WDSLMM629Yy9jvnpX5w1NY1PoQZscK2uT0RauT
 DbYFvRtiLEU+EvzYBEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX7djMv5nQDCbp
 HafZ6LrWuOYKN7ae0bw/ZqFDV30W2Md0zgQLMVZZm8L3GPeu7rhHpthLI/ah42rJ63JNE12smBW
 uZPINNBCes7aM3ckgIdjhZoiW7orKvu/4C5cJltFhzYgDclOx0n4
X-Authority-Analysis: v=2.4 cv=V5PoQuni c=1 sm=1 tr=0 ts=6adb25ec cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=_jlGtV7tAAAA:8 a=gAnH3GRIAAAA:8
 a=QaSggq9muv9vvWMzKZIA:9 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230036

Add support for the Maxim MAX31875 I2C temperature sensor by
extending the lm75 driver. The MAX31875 features a 16-bit
configuration register, configurable resolution (8, 9, 10, or
12 bits), and selectable conversion rates (125ms, 250ms, 1s, 4s).

The MAX31875 has no alert polarity bit, and the bit the driver would
use for 16-bit chips is part of its conversion rate field, so skip
the polarity configuration for it. Also set the default resolution
and conversion rate at probe so the driver state matches the chip.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 drivers/hwmon/Kconfig |  2 +-
 drivers/hwmon/lm75.c  | 30 +++++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a..3123f1282 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1597,7 +1597,7 @@ config SENSORS_LM75
 	  If you say yes here you get support for one common type of
 	  temperature sensor chip, with models including:
 
-		- Analog Devices ADT75
+		- Analog Devices ADT75, MAX31875
 		- Atmel (now Microchip) AT30TS74
 		- Dallas Semiconductor DS75, DS1775 and DS7505
 		- Global Mixed-mode Technology (GMT) G751
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2d2d752ae..349648fd0 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -38,6 +38,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6625,
 	max6626,
 	max31725,
+	max31875,
 	mcp980x,
 	p3t1750,
 	p3t1755,
@@ -222,6 +223,16 @@ static const struct lm75_params device_params[] = {
 		.default_resolution = 16,
 		.default_sample_time = MSEC_PER_SEC / 20,
 	},
+	[max31875] = {
+		.config_reg_16bits = true,
+		.set_mask = 2 << 13,	/* 10-bit resolution */
+		.clr_mask = 3 << 13 | 3 << 9,	/* resolution, 4 s conversion rate */
+		.default_resolution = 10,
+		.default_sample_time = 4000,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
+		.alarm = true,
+	},
 	[tcn75] = {
 		.default_resolution = 9,
 		.default_sample_time = MSEC_PER_SEC / 18,
@@ -420,6 +431,9 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 			case tmp112:
 				*val = !!(regval & BIT(13)) == !!(regval & BIT(2));
 				break;
+			case max31875:
+				*val = !!(regval & BIT(7));
+				break;
 			default:
 				return -EINVAL;
 			}
@@ -494,6 +508,13 @@ static int lm75_update_interval(struct device *dev, long val)
 			return err;
 		data->sample_time = data->params->sample_times[index];
 		break;
+	case max31875:
+		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
+					 0x0600, (3 - index) << 9);
+		if (err < 0)
+			return err;
+		data->sample_time = data->params->sample_times[index];
+		break;
 	case pct2075:
 		err = regmap_write(data->regmap, PCT2075_REG_IDLE, index + 1);
 		if (err)
@@ -770,7 +791,9 @@ static int lm75_generic_probe(struct device *dev, const char *name,
 	data->orig_conf = status;
 
 	/* Enforce polarity active-low (default) or active-high (devicetree) */
-	if (!data->params->config_reg_16bits)
+	if (data->kind == max31875)
+		pol_mask = 0;	/* no alert polarity bit */
+	else if (!data->params->config_reg_16bits)
 		pol_mask = LM75_ALERT_POLARITY_HIGH_8_BIT;
 	else
 		pol_mask = LM75_ALERT_POLARITY_HIGH_16_BIT;
@@ -847,6 +870,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ .name = "max6626", .driver_data = max6626 },
 	{ .name = "max31725", .driver_data = max31725 },
 	{ .name = "max31726", .driver_data = max31725 },
+	{ .name = "max31875", .driver_data = max31875 },
 	{ .name = "mcp980x", .driver_data = mcp980x },
 	{ .name = "p3t1750", .driver_data = p3t1750 },
 	{ .name = "p3t1755", .driver_data = p3t1755 },
@@ -904,6 +928,10 @@ static const struct of_device_id lm75_of_match[] = {
 		.compatible = "adi,adt75",
 		.data = (void *)adt75
 	},
+	{
+		.compatible = "adi,max31875",
+		.data = (void *)max31875
+	},
 	{
 		.compatible = "ams,as6200",
 		.data = (void *)as6200
-- 
2.34.1

