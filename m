Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573EE3DB63D;
	Thu, 24 Sep 2026 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239398; cv=none; b=U5XwJtaIts1mCaqoEnwZYDb1U3aHufWaPLc2CeA9u1sWLcH4t5QJED5j/+aXxRlLNj7yXN3e2aGungbYEpVHSqb6cFyDUIoQesZzxLdGyF+VGr+QDqIdaNkmsuUgal598bNM4eSPZ1ZHpcblHTl4q5Y8lr8jizTizicNQN9jjGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239398; c=relaxed/simple;
	bh=8B5ourP/55V8Nui3leJMhemPmPWIj9o32L8r9wFelr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JA8it+zebEa+kASF8YG9m4VH/LVge8Cw2jnBNflTOWHk83QleMMdpIHd+UNFn8yFX4WAUcv62A/ZfQ4C4lbeATt5SnPvDO94Rts5bhSvJt2gncSGcLNvNLjsrKnjTM0qz+qyJ4WoHJrbtMw7iGZ5y752DEhL6O6hwB6j8RjqLkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=PtkCesow; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="PtkCesow"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5cMR2151887;
	Thu, 24 Sep 2026 04:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=n6pPo
	AVXn55qn6ilFWguyNsBOjlEo+fa6Iw5ce8IBew=; b=PtkCesownFb/wb1TS0mvQ
	U5zXlEo4GTpxzYPp9KAFs9PKXVi6kfgKEZEb3b9A8WVr7XHxXQKRzMx3qaxp0XM7
	bgOXyBEVbRDzVNVtACOy0k28gD/CZyOUntd+EslMnDujbwhmQlk2skoSHW6cIGSK
	rjdAotLD8aivzjY3WjtCc4XCosYdlJ7yT2f1Cc0f+NKhL0SNo8lbYvCEn6/cAZ8b
	OOWIGqO9Ued89G6a63dAZGkMBI93rL3zcYnJvL3dRlqDg5Oi5x4U7mNJX6VO917j
	nbTmU7TqJv7jhj5/IKiafdJoW2oRBQiratLC2EwyY9LYSZfqcdAb8Gbq/1k1v7ld
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gv5cx8q5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:43:00 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68O8gxQl006968
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Sep 2026 04:42:59 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 24 Sep
 2026 04:42:59 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 24 Sep 2026 04:42:58 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68O8fTpN015604;
	Thu, 24 Sep 2026 04:42:50 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: [PATCH v2 3/3] hwmon: (lm75) add MAX31875 support
Date: Thu, 24 Sep 2026 16:41:21 +0800
Message-ID: <20260924084121.82-4-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
References: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: QEafJ3t54_3bDv-ll6w9ftRTKg6dmdxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX1uL0wJ5EecG1
 l3DlWX0pnf2lciC0DgNNOS/pfspGgXbZyvV9mbC50YJ1cLoQB12pjqAEQVP7mDZqpSsfEqTUnuw
 04wDp2QRniJwralFtdYntHMC/jeuNkErMmOZuBAoCU0fVey9fvhVl6nw0zUY9FQvcmoxFr/LS95
 I407snrlO97QE6kFud2SPykAlYPHmHDgE0yA1nqZTo/vA0ZYQi7VY63MUI6rtBOHD4hVmE8otOR
 0hVGnB9AACqwn9XAySEr0WHzvx+ThYipaDY68QUND1hbEnmwZyI6oBGFRVKqjV5a1k/pU3otn25
 NgII+JgSPcVk0uos40vQPANk1bvlYHn8auJ4l/HhfXBW0NA+mbwpW+jGUnAcGhyJtmX50i1734+
 ZijSLgLyx9uFYEMTwDXWPqYm4TI5Nf8cX9Kn6IKEcYxfZL/Uq6zCPD0/EZG8HgHIL+lzhghavGp
 qYbEL7aIIrH7si51VeA==
X-Proofpoint-GUID: QEafJ3t54_3bDv-ll6w9ftRTKg6dmdxg
X-Authority-Analysis: v=2.4 cv=I8rw19gg c=1 sm=1 tr=0 ts=6ab4e294 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=_jlGtV7tAAAA:8 a=gAnH3GRIAAAA:8
 a=RzcFdzuTgaMov-P2AyUA:9 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX37micHau9Vqi
 1EgpNp26JP3fPFgRtN6UqAqyoQNyw/o0HKT5j3VCG1djCnrq53ER53toVrlM4+6YFHf4nJe5i53
 vOXZwUwVy07gAlGSsUuVlt5EQR2siPqVCH958RnsC7hob2WkoFZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240036

Add support for the Maxim MAX31875 I2C temperature sensor by
extending the lm75 driver. The MAX31875 features a 16-bit
configuration register, configurable resolution (8, 9, 10, or
12 bits), and selectable conversion rates (125ms, 250ms, 1s, 4s).

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 drivers/hwmon/Kconfig |  2 +-
 drivers/hwmon/lm75.c  | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e4c4f2b09732d..c68b6c3c2f866 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1525,7 +1525,7 @@ config SENSORS_LM75
 	  If you say yes here you get support for one common type of
 	  temperature sensor chip, with models including:
 
-		- Analog Devices ADT75
+		- Analog Devices ADT75, MAX31875
 		- Atmel (now Microchip) AT30TS74
 		- Dallas Semiconductor DS75, DS1775 and DS7505
 		- Global Mixed-mode Technology (GMT) G751
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 104149a03bad0..886f83c8b0420 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6625,
 	max6626,
 	max31725,
+	max31875,
 	mcp980x,
 	p3t1750,
 	p3t1755,
@@ -223,6 +224,15 @@ static const struct lm75_params device_params[] = {
 		.default_resolution = 16,
 		.default_sample_time = MSEC_PER_SEC / 20,
 	},
+	[max31875] = {
+		.config_reg_16bits = true,
+		.default_resolution = 10,
+		.resolutions = (u8 []) {8, 9, 10, 12 },
+		.default_sample_time = 4000,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
+		.alarm = true,
+	},
 	[tcn75] = {
 		.default_resolution = 9,
 		.default_sample_time = MSEC_PER_SEC / 18,
@@ -421,6 +431,9 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 			case tmp112:
 				*val = !!(regval & BIT(13)) == !!(regval & BIT(2));
 				break;
+			case max31875:
+				*val = (regval >> 7) & 0x1;
+				break;
 			default:
 				return -EINVAL;
 			}
@@ -495,6 +508,13 @@ static int lm75_update_interval(struct device *dev, long val)
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
@@ -848,6 +868,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ .name = "max6626", .driver_data = max6626 },
 	{ .name = "max31725", .driver_data = max31725 },
 	{ .name = "max31726", .driver_data = max31725 },
+	{ .name = "max31875", .driver_data = max31875 },
 	{ .name = "mcp980x", .driver_data = mcp980x },
 	{ .name = "p3t1750", .driver_data = p3t1750 },
 	{ .name = "p3t1755", .driver_data = p3t1755 },
@@ -905,6 +926,10 @@ static const struct of_device_id lm75_of_match[] = {
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

