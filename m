Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304899;
	b=13nCT+HH+V/WP3H2QX/7y3xNHi92Iplp06+SX8vGLbjvNpCqPurTd6C+AAdUYrH+ajAb
	 x7X1VTkhW/5mixLM57D/6Gt43sZr+FNjzJHKj9bI/5fvLa9h//DmXaSu6XQs7gS2jhq2q
	 vA+6tbqIF0KwVeyby8InhCs0F9XN6waWK7A3LL4LHPM7XRn4aSZPvsh/aLAu8ow+u2tIv
	 Uo5SMPxRWz3EhRP/77X4XnVaYXUPwqstASzeR03Vpde/lGL4DM2d6KHu/GBqSjNR2CmsT
	 0oR4d6X0X21jHI4rt5j7UfAfEqe19hCgaZ8rQqo5X6R+Ih9aAdIMnPm8Z439mEjxMqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304899;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IhWxdLwS/1doFkEPZHoXJynng4wK+DwJdxkmRRTcVUk=;
	b=4cz9LgFJfAGdDAkgmQSQu1oIQEAT9SC6mjudaxII8zDy5nDC89T422pGHzL+XIk65MEW
	 12joL5muwkrDmHQoBkuJWbdt4/t2tbHoGJvgLv0irpUHUThR2hXfqXwp1vn+DbrEfRiTx
	 I/69hmDFtLyy/HE7LkI3j/xWTH99yExaR1gwjdS1QP2ASg5dNIqT2N9gaoQ9JOfoDuRH5
	 IsuVkq5aoaUfFNxmuj7tmjpXeCzMeRHpuo2na/Q3Sy9Tzy/ZQGG2oLWjh0EHsJYhRU0ms
	 PGfXvfXMQlIsN57TQq26WHdaBFrblS2YLQupOER7dSlHwr8FnRTvgvhIyWMcE+sYfkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Wcu8N5KM;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xLJUOKQk;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9309060A6F63;
	Tue, 10 Nov 2026 10:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9309060A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Wcu8N5KM;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xLJUOKQk
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kdpp2247763;
	Tue, 10 Nov 2026 05:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=IhWxdLwS/1doFkEPZHoXJynng4wK+DwJdxkmRRTcVUk=; b=Wcu8N5K
	MSXqG423ogTt3bRSykDFJTow/u2bfaCi8hc+Q63WENyJDIy48kXoEhmCY1V6RYj0
	XQlq1yd+N6AWIzvk8FeXsFwaux8FW/HHhdnY4vFMsyErU2pVx5KeUh5Nyb+8YTRH
	j4F6zWkogf1uckR3EDtymrMgl780/STxsjvPEigu5Ra3IWefUidkjb6wPsvTZHSF
	+7zAz3YKRfRz636CBZwxC919fr2ro4FK4G0IFLqIYPB6KpY0QtTQvj5Lx9tHR4OS
	DaR1a6J2f5FrgwYVJpnuAI+pAC1o5RN9pgvK4eAdcfFCShtUX1koKruNV3xqX6RU
	2RpBes3bBWneXjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=IhWxd
	LwS/1doFkEPZHoXJynng4wK+DwJdxkmRRTcVUk=; b=xLJUOKQkrQXFspSc8p03f
	uymA3Z7I7T3vdjD9GxSK9xFuE8uzj8FCa8j1VhzfzW/8/B81fZjfu3qZpzc8/aNJ
	YsN9G3YFSqsHhT6SXFx7wkBHKx1/ll7dWOKQH08TqVMlIFQT7kXCM32pB8uxZ7O3
	/rJM5Jg8A7/dwWQN1drcanVIFIMbmxTuAatU4L7P/hdYtgrm3eSogmRjd8sKDzii
	2WCSfcv9qPseMhYY1lnth0i/jvJvQTZ7FbVBO+GYZyt0/rHrzQwIABYaDTzH516/
	VM6928Tn1dKUMRJSWiOyeUTPwLgTgPOAzVZjrTkFDwU83vA10ESVXcVP4h4INDtm
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4huwpuh9f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:01:07 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AAA161N021167
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 05:01:06 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 10 Nov 2026 05:01:06 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 10 Nov 2026 05:01:06 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 10 Nov 2026 05:01:06 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AAA0euc008466;
	Tue, 10 Nov 2026 05:00:59 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Tue, 10 Nov 2026 18:00:41 +0800
Subject: [PATCH v2 2/4] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Christopher de
 Guzman" <christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304841; l=4271;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=3fUA3WaTFg1D/VfwVBQIFZgokC1PWVyClcO3fnJZzc4=;
 b=lHzwgCvejLSezlN7O+LjwKNin2uLR6YWfhkC/UPJYrBYxBZ0Lzglu90hwlJjYEtRgAZw/O7mQ
 7iAwjq41rpSC9sbhGdisTz48xebQsTtdSVv1ljged1VizaM0TXXZ4OZ
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXzureX+KxSaea
 x9KtFCs1GnlebK9DTdzsrtc4pxXJedWB1y48g4IUZsAKzMPNZdJ6YhZXEuwzDi6itCS8jVHtA6s
 Wo51xs0MbP129y4/fb7bln4KcTT2tT5fhpODUpjWTADzpejqA13+Q7Mw/IaIE1bbVUO78UEFJu/
 qCDKwfBzdGhRlzZk/0E4CSf85aB/bS8Bg/oZzqG9mVL77tF6xeHaMyO/BnHqiUarUAULu7y2T37
 2zMv6SvgzC3mo08BOQnlcgQ7GKtfRLW4NRLWbFYnhQLZsy3eAfUZ/FJKLhZADDbzIPN6e5xtgY8
 bMP8gIbmEzeYuzUdlt+wfL5Auq9bTpdBgnKXMezAhD+k4YKVAJxxqNxJQ9HjDkzuzSBFmRTihlD
 Spf66b1H2bsvtsQK5BZMOBpx8/xC9vscKrpO/aM0+36xd9Ps002XfzB8ui2nTVO/7jy674M6EiX
 64b0ZSyjJyw26NjlrEg==
X-Proofpoint-ORIG-GUID: aaIloLyfk_f185BGKD_KipmX3mcxXe3t
X-Authority-Analysis: v=2.4 cv=OtjaWC/t c=1 sm=1 tr=0 ts=6af2eb63 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=mCLcJBGFyXiWd4D62foA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aaIloLyfk_f185BGKD_KipmX3mcxXe3t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXw7zIbScY2JCx
 8Wd3bnm7u9a9I4hlbzbepBYokCN6+IPe0GPl/Qo7sS2ReuAfFEjo1AfNKqlEAAD+dLJzdlujuKZ
 n7JJhoUQSnR5Yu63MT876DKV+LQ5RR7fGIF+o48IPFlcM0WqyrhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

Add support for the LT7175 and LT7176P PMBus buck regulators. Both
share the LT7170 family MFR_SPECIAL_ID (0x1C1D, masked to 0x1C10) and
use the same register layout and configuration as LT7170/LT7171.

Chips in this family are distinguished by their PMBUS_IC_DEVICE_ID
string. Instead of adding another strncmp() per chip, match the
returned string against ltc2978_id[], as is already done for the
PMBUS_MFR_MODEL fallback. Only entries whose name fits within the
returned data are compared, so the buffer is never read past the
returned length. Suffixed variants such as LT7175-1 match their base
entry.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 drivers/hwmon/pmbus/Kconfig   |  6 +++---
 drivers/hwmon/pmbus/ltc2978.c | 23 ++++++++++++++---------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fd6641316454..63fb4d5dd87d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -306,9 +306,9 @@ config SENSORS_LTC2978_REGULATOR
 	depends on SENSORS_LTC2978 && REGULATOR
 	help
 	  If you say yes here you get regulator support for Linear Technology
-	  LT7170, LT7171, LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889,
-	  LTC7841, LTC7880, LTM4644, LTM4673, LTM4675, LTM4676, LTM4677,
-	  LTM4678, LTM4680, LTM4686, and LTM4700.
+	  LT7170, LT7171, LT7175, LT7176P, LTC3880, LTC3883, LTC3884, LTC3886,
+	  LTC3887, LTC3889, LTC7841, LTC7880, LTM4644, LTM4673, LTM4675, LTM4676,
+	  LTM4677, LTM4678, LTM4680, LTM4686, and LTM4700.
 
 config SENSORS_LTC3815
 	tristate "Linear Technologies LTC3815"
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index aea7b6c93e74..888db3213a01 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -23,8 +23,8 @@ enum chips {
 	/* Managers */
 	ltc2972, ltc2974, ltc2975, ltc2977, ltc2978, ltc2979, ltc2980,
 	/* Controllers */
-	lt7170, lt7171, ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887,
-	ltc3889, ltc7132, ltc7841, ltc7880,
+	lt7170, lt7171, lt7175, lt7176p, ltc3880, ltc3882, ltc3883, ltc3884,
+	ltc3886, ltc3887, ltc3889, ltc7132, ltc7841, ltc7880,
 	/* Modules */
 	ltm2987, ltm4664, ltm4673, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680,
 	ltm4686, ltm4700,
@@ -540,6 +540,8 @@ static int ltc2978_write_word_data(struct i2c_client *client, int page,
 static const struct i2c_device_id ltc2978_id[] = {
 	{ .name = "lt7170", .driver_data = lt7170 },
 	{ .name = "lt7171", .driver_data = lt7171 },
+	{ .name = "lt7175", .driver_data = lt7175 },
+	{ .name = "lt7176p", .driver_data = lt7176p },
 	{ .name = "ltc2972", .driver_data = ltc2972 },
 	{ .name = "ltc2974", .driver_data = ltc2974 },
 	{ .name = "ltc2975", .driver_data = ltc2975 },
@@ -630,6 +632,7 @@ static int ltc2978_get_id(struct i2c_client *client)
 	chip_id &= LTC2978_ID_MASK;
 
 	if (chip_id == LT7170_ID) {
+		const struct i2c_device_id *id;
 		u8 buf[I2C_SMBUS_BLOCK_MAX];
 		int ret;
 
@@ -638,13 +641,11 @@ static int ltc2978_get_id(struct i2c_client *client)
 		if (ret < 0)
 			return ret;
 
-		if (ret < 6)
-			return -ENODEV;
-
-		if (!strncmp(buf, "LT7170", 6))
-			return lt7170;
-		if (!strncmp(buf, "LT7171", 6))
-			return lt7171;
+		for (id = &ltc2978_id[0]; strlen(id->name); id++) {
+			if (ret >= strlen(id->name) &&
+			    !strncasecmp(id->name, buf, strlen(id->name)))
+				return (int)id->driver_data;
+		}
 
 		return -ENODEV;
 	}
@@ -762,6 +763,8 @@ static int ltc2978_probe(struct i2c_client *client)
 	switch (data->id) {
 	case lt7170:
 	case lt7171:
+	case lt7175:
+	case lt7176p:
 		data->features |= FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
 		info->read_word_data = ltc3883_read_word_data;
 		info->pages = LTC3883_NUM_PAGES;
@@ -962,6 +965,8 @@ static int ltc2978_probe(struct i2c_client *client)
 static const struct of_device_id ltc2978_of_match[] = {
 	{ .compatible = "lltc,lt7170" },
 	{ .compatible = "lltc,lt7171" },
+	{ .compatible = "lltc,lt7175" },
+	{ .compatible = "lltc,lt7176p" },
 	{ .compatible = "lltc,ltc2972" },
 	{ .compatible = "lltc,ltc2974" },
 	{ .compatible = "lltc,ltc2975" },

-- 
2.43.0

