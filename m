Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9E4D7D37;
	Fri,  9 Oct 2026 11:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547041; cv=none; b=WF/On4FibuURArE4lEiZ8oml1AIOUHbS5Eua/DRx93OVSL591YKFvtiSAsMq2u6wEU1G6Jt71uvBzyyAKtPZTt8hGXy3w+DTddfKG5Bn8G3YBuBxTaV2z6+JFb6JtKi22Xk5SK467EYU2AvTDVk4+tyGbogxtFfC3GXMT+UIN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547041; c=relaxed/simple;
	bh=eclfVDa6IPV8dB67C8BVMFp6KVSbpB+jRDPxTYJ82fE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=re4GzdT97oLQMloXJrAmFJpBpoMLW6l+iKUs43H/Kog46EAMGS+UmSrWO78sl14hhgyQ2hrb95fd+Dx+rCJ0EgX5+kZUO5gbOQVhs+MqUEC8NyBgua8ZkAWeZI1VPfngXgceK6tPk2c9X8ehalEhKoy+5kzJDyF3lbND9znSyVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=WqsjDthk; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UM8MNdKZ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="WqsjDthk";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="UM8MNdKZ"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699BEd3B2960953;
	Fri, 9 Oct 2026 07:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=tFEDq8iCCPXnxOgOTLvmRW7NStYQWA56uDFL9AYSYFY=; b=WqsjDth
	kY4ik7bDOjZPbFhT0mnVrA/++KnLajwDfAJPvEI21P76+Gp0FDKDVYTNlYzvqMIa
	1BbT6U/RW5DvwwuR0v7ocjo+XAERKJZfPhkBuAjkkNdabjhwVtZve/IHUhqYWK35
	grwX65aHG0g6kxMdvri9bp1M0g3taJwjwQ8bVslF1OfDpNJiooti+EBo1VIMqSyC
	O/MGij3DU15MQZ6RB+BQk7BVCt3rTZ8CozwQ2NpHrRdhYlfGkAanFw4fHShd/dbj
	0RcjdArx8EpMJD0S6RW3tfRoNfZFwop2rRL3U6gQiY4t61teOw5PdvA7FHsZPZVy
	JzsmIBaCJfgaI0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=tFEDq
	8iCCPXnxOgOTLvmRW7NStYQWA56uDFL9AYSYFY=; b=UM8MNdKZ9GAk/4F7Qv7MJ
	jja/mA2jm1ar5NOhRm94XSID/sPqxa6vIS3KHDxRoHN5bIhOEL55D7mqLRCHXg8f
	Z7qyDRUuNsGqVJDhX1DiEnB9tIAlTEdccBe3ThVzbLpvtPSk4prx9D5k1lAkit8r
	EJYg1+hhMvigU2KUTspcB+zxTiEZXIjgfguDKqpkogc+0rsOAgftvn1/6vZf338/
	l+PO04t8mWqPpl/4sQIlq2QTnBNsXxB4rfiALJ1FuGiAaSp3L4Q/4OoAk6ms8Sx8
	3PVEOg3BRccIfLZPD0XxkIFIq5t4lR5dV66/7JRGEY+XVrrNnh2fivj046PjiG8v
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4h6y7p06qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 07:56:53 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 699Buq07041967
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Oct 2026 07:56:52 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 9 Oct 2026 07:56:52 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 9 Oct 2026 07:56:51 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 9 Oct 2026 07:56:51 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 699BuPtA014045;
	Fri, 9 Oct 2026 07:56:46 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <linux@roeck-us.net>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <skhan@linuxfoundation.org>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v3 3/3] hwmon: (lm75) add MAX31875 support
Date: Fri, 9 Oct 2026 19:56:17 +0800
Message-ID: <20261009115617.1976-4-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
References: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfXz3QDYEp1x6XX
 kbWmaF/VQKc+IRQ9seACsKFujE6S4JAoKj2lBxiwCP/To5/bJAX7gnQPCOdQQGPBrFvN0xmoHpT
 uVE+6ovNVxGB4SjhXWOKZFELINMMy/3zz44ORMrkotA9HZEfpuEY
X-Proofpoint-GUID: EuwlA0J88p3YCwy4G2dl9zCnPaPsherW
X-Authority-Analysis: v=2.4 cv=GtfXaU1C c=1 sm=1 tr=0 ts=6ac8d685 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=_jlGtV7tAAAA:8 a=gAnH3GRIAAAA:8
 a=RzcFdzuTgaMov-P2AyUA:9 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: EuwlA0J88p3YCwy4G2dl9zCnPaPsherW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX5qVaUwtWOeeH
 tV5S7li3xpATvdZOC5wMH23fEscX/MdPJXZBReJF6s4EPMKj4JpetVzcKOBH+uD6xMfMCbmYYx6
 RuhlmiJWqMvPgotXc/xFLhlHziV8YNZ9yV9T5xI/7I9H4XKRgAcqfPr0BYc5F9WEpYPVzgnWpWr
 7Y/kC+ANWe3OQkPGk/A2X6Hs33GOO950TQmS/gVkxwjoKNljHzeMRKgZN32ZvjX3hKjwcug4jVy
 WlfkFp0gQz54htBNymc59zGesayczdYRxTOEw0QoHNpfAj8fGFX6BJbr3R3+JIkWdLFS6jh6lnr
 pj+nVSzC4PoVf5pCM+M85zivkrbJv+iUS8mgNvrhqdvrtdFhn8tdgpJkDy78fCaBtsJMI5wbYEK
 LMY2LQi3h9L3zP8Wa8ociMMUefcFGuHx2SrcRKyv8pv0hpwtKegXngEL3EGnG1v+kd3GLfsq/Pa
 X4R11bfsKE9pKDabXxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090047

Add support for the Maxim MAX31875 I2C temperature sensor by
extending the lm75 driver. The MAX31875 features a 16-bit
configuration register, configurable resolution (8, 9, 10, or
12 bits), and selectable conversion rates (125ms, 250ms, 1s, 4s).

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 drivers/hwmon/Kconfig |  2 +-
 drivers/hwmon/lm75.c  | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

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
index 104149a03bad0..2fc5659a3d6bf 100644
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
@@ -223,6 +224,14 @@ static const struct lm75_params device_params[] = {
 		.default_resolution = 16,
 		.default_sample_time = MSEC_PER_SEC / 20,
 	},
+	[max31875] = {
+		.config_reg_16bits = true,
+		.default_resolution = 10,
+		.default_sample_time = 4000,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
+		.alarm = true,
+	},
 	[tcn75] = {
 		.default_resolution = 9,
 		.default_sample_time = MSEC_PER_SEC / 18,
@@ -421,6 +430,9 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 			case tmp112:
 				*val = !!(regval & BIT(13)) == !!(regval & BIT(2));
 				break;
+			case max31875:
+				*val = !!(regval & BIT(7));
+				break;
 			default:
 				return -EINVAL;
 			}
@@ -495,6 +507,13 @@ static int lm75_update_interval(struct device *dev, long val)
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
@@ -848,6 +867,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ .name = "max6626", .driver_data = max6626 },
 	{ .name = "max31725", .driver_data = max31725 },
 	{ .name = "max31726", .driver_data = max31725 },
+	{ .name = "max31875", .driver_data = max31875 },
 	{ .name = "mcp980x", .driver_data = mcp980x },
 	{ .name = "p3t1750", .driver_data = p3t1750 },
 	{ .name = "p3t1755", .driver_data = p3t1755 },
@@ -905,6 +925,10 @@ static const struct of_device_id lm75_of_match[] = {
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

