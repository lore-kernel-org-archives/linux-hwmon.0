Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538919;
	b=cHqR87/0eFDhAk5oDsFzdORoUTUUNqn9fy+Vo0BNTnvHS7Nv5rstObxNG4DVw/MqPyGF
	 /V3VKANQwLOe2hvB4mm5xbH0HT9nsHTjQaX3kSTCVp/RT4Lgb5dN4cuXoO3ecrPEbYuUP
	 n+yGimTfPFLtgun0N9XP/MOD4WgKYJxPYNluL0LeCJ5hFIa9jv7LxlOHoqiPz9YNn1uDy
	 B4w1ukvLt/YlQSyBJAwQ9ApZDTn9t6E7Y4rerv/qZct5TGMT4s+SDlhZaRSwu3pS8jedz
	 UV/ip0qCPOW3mqOV64K28LPYWitXUtOLFw28X/6msjCwVPRF01r4HtR4tzzJmI3Q5IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538919;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KMBlRNx70YK3qOx8IifcZC34KmwYVTBd4/vZbNsXQPQ=;
	b=xTrIuCKGpq/mmR/pPnjOmZVQ1rlZ+39HoBmNlleaikDWMKGtx9Ryj5GFfMOJhpUylcLo
	 o7uuwhzZN03mAV5gVoAansYzQ0TIvf7t+OEIpJBbFSQA2aDsJJksIjhUzDv9rS1p7XJk4
	 HqFqHIHW66Bjlzy62D+nRhswU/7zWfZyxBBgYcklE+L37/OQBi1oTb0qoRM6iXaAnp6OE
	 NThlhJyUIySEaYktMQKi2SrQANVprf0d43kjLpa/vP7c647/OLg/iL20qy4NChhLZs4qc
	 z4hWH8ZsFwUmzz+uIQdcO68TvJHhDsBZ2gaS7WJd3WuKq14sGASlhtZhbQ+7mHIJyJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=qmiydRUM;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Vj8CLYDH;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6998F60A2611;
	Tue, 24 Nov 2026 16:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6998F60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=qmiydRUM;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Vj8CLYDH
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKaxE1166214;
	Tue, 24 Nov 2026 11:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=KMBlRNx70YK3qOx8IifcZC34KmwYVTBd4/vZbNsXQPQ=; b=qmiydRU
	MkmUnLoogdkwF3+zTJ8GkrBGKvo3DidUEnGdu/Slo6HhqwmtILdLEJvjC/u7zGJb
	3W7nBzAZZxdUlmO2rg8lWLBTm38emvUvHCm44eiEMTmLqlw9fWY3h+tRGBEqEjBi
	b1rCWH0wjrBjnwX6J+CQZeDMf5cr95rdbWtRZhKNsi5JkPy+U6ygvzr+tlRdesJk
	OmmixBLKR4tE6Ab5CnhgLMD3yaPuHhc5QOj2LSNxvOYFOtOQIZT/mm5tWd+12GSY
	7YsIHKlMvN1u1YqxpMAWg+rcsYylUff9GL2M5xYNTrK/RNkcVitovzn0xax/h41J
	dsZhSAMsdUBcpDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=KMBlR
	Nx70YK3qOx8IifcZC34KmwYVTBd4/vZbNsXQPQ=; b=Vj8CLYDH+SWCiTZ/DFg0N
	/ymxT2hs2etZkuv6rq+Bv8q0fPcwXmXBywaXUlcPtZoPhKHDs6BSOSjhshVG91Cf
	GPfXjg+q67bpaLA9Q75fLOsaMxYWtJ82NQTAr1phsk/fhiPufDEYF1dzZd50jOoN
	vGYi92atNqFWVtBwuBl7zc2zNOIWSu0aVUhUrfZT2lE4k508qEKj5tCVJnWT8+7m
	L9o2VprDwg+nqN1y1jnHROcQvyEcZkWEHJf3xBWLeB4K465c5Ur22XEt8aAcwzqU
	ioy/Na6zJ4QOr33O7yBgPmcIfgN6goE8WCweqQGXylFh4HNaNzD9PODz3ZPy3K8a
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4j574h2sst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 11:48:10 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AOGm9O5035743
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 11:48:09 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 11:48:09 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 11:48:09 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AOGlfXf028468;
	Tue, 24 Nov 2026 11:48:00 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Wed, 25 Nov 2026 00:47:36 +0800
Subject: [PATCH 2/3] hwmon: (pmbus/ltc2978) Add support for LT7170L and
 LT7171L
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
Message-ID: <20261125-ltc2978-lt7170l-lt7171l-v1-2-7b8d0d5f4266@analog.com>
References: <20261125-ltc2978-lt7170l-lt7171l-v1-0-7b8d0d5f4266@analog.com>
In-Reply-To: <20261125-ltc2978-lt7170l-lt7171l-v1-0-7b8d0d5f4266@analog.com>
To: Guenter Roeck <linux@sinkhole.paloaltonetworks.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
	<rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Christopher de Guzman
	<christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795538862; l=2726;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=XLGrvrDjvmrPVgeUoJ/7zAxNHVAKEccUd65FOpNrIxo=;
 b=+bdahHzN+FLOnmMMgRQ0DIQyXGlJkitpklfvfOvCwgX0yvkJZOIbQwlfm2Vg05CKettowCuSh
 MxZXmQK2RqxA3mccqJI43oUSCrhDOt11KlLhuSicX/QxO0JQXWn1mwE
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX4zp5B1UfOiIj
 f/Vq3/WtAt8SVcG4EornKI9x2AxCd1hLjmRpDTbJo/LbWNjz7mmvvECXcVoqrZMLEapQBYrxekt
 7CHy3t7aSRbwt/qQ6Rj6yF34FvgGhgCPGmxCTa/XfEtaXSWqZxbEUwFKG85G+tBd7PF8yJZt2Z9
 0t8gIWqCQw+u2ecP47A3HCTS6hgSi9AZp//BTMgUzdN56GOpZj8ZTfGlcgjtkayQNms7C/qPff5
 WFcVbyFHOGWn+uPoZNc6XZbypNl2DiWep+BzQFE1VwkB1ligeIQultOCTKjK4QqVJ7m5beOLgdT
 ufauN9umPXgyfOp39BjwxAXH8+aCglB5Yi+cmDBz01ULV+ey9VzUig1g8B6hiVpKgxkAHjWhyo7
 POyNoDYR+WlrUQKw69Rl8Ql0SmADKySRoflO8kYh64gFjJi06LxOytHTJkd5Pl3EJv0D7nBaHfG
 Olbv24aKZLkHFBHLrcg==
X-Authority-Analysis: v=2.4 cv=Yt+a1IYX c=1 sm=1 tr=0 ts=6b05bfca cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=hwpzPOnUcVLIH58Zk84A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: UwAIdr_M72j8uvu5OfgUquld-1JjgDUE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX/i+QYIuHFVMZ
 OQHjV/aY490reyWcS7tvtyACDs95Fu8Sg7OFRpj+417g2/o4YvFMATf30XNDOYslQ/mzTko6mgi
 ZF8RIlb01CaDWmAqfuggVUWQ8Hm93tX4Ujeknkaj5zqVPet+r0OM
X-Proofpoint-ORIG-GUID: UwAIdr_M72j8uvu5OfgUquld-1JjgDUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

LT7170L and LT7171L are pin compatible with LT7170 and LT7171 and add
a pulse-skipping mode for improved light-load efficiency. The
pulse-skipping mode is a configuration setting only; telemetry is
identical.

The L parts report the same MFR_SPECIAL_ID (0x1C1D) and IC_DEVICE_ID
strings as LT7170 and LT7171. Add i2c device IDs and OF compatibles
for them, mapped to the lt7170 and lt7171 chip types.

The i2c device IDs are also needed for DT instantiation, because the
client name is derived from the first compatible string.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 drivers/hwmon/pmbus/Kconfig   | 7 ++++---
 drivers/hwmon/pmbus/ltc2978.c | 4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 391d49ecfe4e..5b033750c2d1 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -315,9 +315,10 @@ config SENSORS_LTC2978_REGULATOR
 	depends on SENSORS_LTC2978 && REGULATOR
 	help
 	  If you say yes here you get regulator support for Linear Technology
-	  LT7170, LT7171, LT7175, LT7176P, LTC3880, LTC3883, LTC3884, LTC3886,
-	  LTC3887, LTC3889, LTC7841, LTC7880, LTM4644, LTM4673, LTM4675, LTM4676,
-	  LTM4677, LTM4678, LTM4680, LTM4686, and LTM4700.
+	  LT7170, LT7170L, LT7171, LT7171L, LT7175, LT7176P, LTC3880, LTC3883,
+	  LTC3884, LTC3886, LTC3887, LTC3889, LTC7841, LTC7880, LTM4644,
+	  LTM4673, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680, LTM4686, and
+	  LTM4700.
 
 config SENSORS_LTC3815
 	tristate "Linear Technologies LTC3815"
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index ca94a3c17e9a..dd0ff2bf323d 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -565,7 +565,9 @@ static int ltc2978_write_word_data(struct i2c_client *client, int page,
 
 static const struct i2c_device_id ltc2978_id[] = {
 	{ .name = "lt7170", .driver_data = lt7170 },
+	{ .name = "lt7170l", .driver_data = lt7170 },
 	{ .name = "lt7171", .driver_data = lt7171 },
+	{ .name = "lt7171l", .driver_data = lt7171 },
 	{ .name = "lt7175", .driver_data = lt7175 },
 	{ .name = "lt7176p", .driver_data = lt7176p },
 	{ .name = "ltc2972", .driver_data = ltc2972 },
@@ -1001,7 +1003,9 @@ static int ltc2978_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id ltc2978_of_match[] = {
 	{ .compatible = "lltc,lt7170" },
+	{ .compatible = "lltc,lt7170l" },
 	{ .compatible = "lltc,lt7171" },
+	{ .compatible = "lltc,lt7171l" },
 	{ .compatible = "lltc,lt7175" },
 	{ .compatible = "lltc,lt7176p" },
 	{ .compatible = "lltc,ltc2972" },

-- 
2.43.0

