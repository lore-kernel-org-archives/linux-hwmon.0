Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D193DEFF1;
	Thu, 16 Jul 2026 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190506; cv=none; b=rkNQJjHy6vyxPifCYi+PTAq3r0cdw8gZnNVsqoohFmb1p0UWZGNx+4fiZ+t77mMzYr9wAj9Q05QOjXqI8VdaGTbfbFo4Zlg46t/lReShCsa+wZmPj0zC/wqQZAH89+KigFbVO/xcJGHVTUjWacGMFKDsFoFZ6LR+ljxY56WsosI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190506; c=relaxed/simple;
	bh=4nruIZwYh4bpN/rStgkU3qsHtFyA0JjRVR4WY9FJHQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TkNMOzPLCu8UF3hJt+az8vB+8bfzJBnHhNaR+9GZmFb0bcdIkkj8oOWki75/qG1iZ2rMcAtp0giHqApig5iHPVEVid1Rf03cEYkEweI2PcmdtaPYeh9YufhXE9TTuMpx+SKTNCcrK52Gydy+88j0P7tfLndrY8HLXoG0RO5yilI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=zkWNHUhw; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="zkWNHUhw"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7IaPf3064499;
	Thu, 16 Jul 2026 04:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uLhWH
	rUFr68H3ThgYNlHEy0Hg9qTi5XRHgy8mwDVuzM=; b=zkWNHUhwdQmEz03WPrNcu
	5e2SThhK7h1dwgRUNDS7PgAns2eYUqYjQCAhy81HjD6ytfKneAQD58Qj7jicWN4f
	1UDMtAydlW4zFFpYcgncl5UPnXExzlZ3jwX2HMDn0MVCKRu0Ku3+H7LNFbAZ5rfe
	LBL/nPD+X78oXzYArwNu0HXmQYadtoud4KUF9K0xWZY1Pap3uEWqYg+wbGqokFP1
	YCxWzxpzDxOuXoQTCMedIDoF/RMBg82myW+Ie4ICeWa/S2r4JqxuSUAsHkX+v82c
	dHBPvHu4zSB9Vlr/IPBSZ7lepEyEHU1OyBgVPkLkg9TXgZwGU92uD47GPjkud24k
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fe85wva6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 04:28:11 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66G8SACb061540
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 04:28:10 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Jul 2026 04:28:10 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Jul 2026 04:28:10 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 16 Jul 2026 04:28:10 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66G8PdUT014492;
	Thu, 16 Jul 2026 04:25:52 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 16 Jul 2026 16:25:12 +0800
Subject: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer version
 of max34451
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
In-Reply-To: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Kun Yi <kunyi@google.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784190339; l=1932;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=4nruIZwYh4bpN/rStgkU3qsHtFyA0JjRVR4WY9FJHQk=;
 b=8Zz5FVRIheJBQezzmTAh7EXYO6HDdGvZICTYo3im3emCZpYpW3toEQj9rb5djtikgjfjTDs6y
 aYTIO9IZ6mcB4Dj8xQXifYCdc9YWmMlxfKox+BstXPQhcYQSkkno+Nf
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=aLnAb79m c=1 sm=1 tr=0 ts=6a58961b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=KyYa-aBjXRLsE6yk1RUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4NiBTYWx0ZWRfX2TQ8GWPwIWeS
 SepCImbhaoFpmdJ43tzdqGp+PSG/QjUD9WuVS+RguehA92bsnqom+OTKavf73sWF7yVk9cVu+EP
 FgkmH/MaPZGATiaIkaXR+nTKhlw6DB/6sU+iQh2OX77pKNCn37be1tmBO+C2STP6xcG1E0Z1Xqb
 c1zaQor8YmVQrn8p3blDDJY05QWvA+HeV8xVWmoLshgsAK4H7eS0zmHG9nwenQW7iM44ZPtWsUF
 3b+LLTtNRLhKvUF0a8H0luIKJ4Y8nABESjeEcPGP0Dcz+o7TBJGhFhYvXnUoJmYbQsSKtgZI4FD
 Z7tLMBl7RWaUafXJlqyKZfMmTwxeU4NHgsPbarLCl1YzmZHXeetqmJ6G+fmF6O6j0jxYLiIz1+S
 a47dOCiy2RGGsGF9ZcNolx45zRdwRlT7ae9Vqu14nxZNnCDHlG/wzVJLQBs1kPbdICm+WBEnDLZ
 qZBjc53IEBqaT06Fo4g==
X-Proofpoint-GUID: pW4nLFIvMsXarSRu_LCjFSSUximYrMx8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4NiBTYWx0ZWRfX+9lgY0QwduGK
 Qhoda0I8cYyJt8XUrh0jZImeyEr5jhW9gPWC/h8adEbMjXbC39airofuVa1qlyT5YkeyseDdsIJ
 ntkI5lggfIe0kij9f9JbMBfDnfwW4bG4lsYmK7cCxuakii7S/LMQ
X-Proofpoint-ORIG-GUID: pW4nLFIvMsXarSRu_LCjFSSUximYrMx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160086

The MAX34451 released a newer version called max34451etna8+.
This simply changes the direct format coefficients

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/hwmon/pmbus/max34440.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index e56057e9273c1639bddbaf4e665ea159f1d7c3ed..024109df26db568a4c230c9dbc45d69ba531dd8d 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -59,6 +59,7 @@ enum chips {
 #define MAX34440_IOUT_OC_FAULT_LIMIT	0x4A
 
 #define MAX34451ETNA6_MFR_REV		0x0012
+#define MAX34451ETNA8_MFR_REV		0x0014
 
 #define MAX34451_MFR_CHANNEL_CONFIG	0xe4
 #define MAX34451_MFR_CHANNEL_CONFIG_SEL_MASK	0x3f
@@ -343,12 +344,24 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 		max34451_na6 = true;
 		data->info.format[PSC_VOLTAGE_IN] = direct;
 		data->info.format[PSC_CURRENT_IN] = direct;
-		data->info.m[PSC_VOLTAGE_IN] = 1;
+
 		data->info.b[PSC_VOLTAGE_IN] = 0;
-		data->info.R[PSC_VOLTAGE_IN] = 3;
-		data->info.m[PSC_CURRENT_IN] = 1;
 		data->info.b[PSC_CURRENT_IN] = 0;
-		data->info.R[PSC_CURRENT_IN] = 2;
+		if (rv == MAX34451ETNA8_MFR_REV) {
+			data->info.m[PSC_VOLTAGE_IN] = 125;
+			data->info.R[PSC_VOLTAGE_IN] = 0;
+			data->info.m[PSC_VOLTAGE_OUT] = 125;
+			data->info.R[PSC_VOLTAGE_OUT] = 0;
+			data->info.m[PSC_CURRENT_IN] = 250;
+			data->info.R[PSC_CURRENT_IN] = -1;
+			data->info.m[PSC_CURRENT_OUT] = 250;
+			data->info.R[PSC_CURRENT_OUT] = -1;
+		} else {
+			data->info.m[PSC_VOLTAGE_IN] = 1;
+			data->info.R[PSC_VOLTAGE_IN] = 3;
+			data->info.m[PSC_CURRENT_IN] = 1;
+			data->info.R[PSC_CURRENT_IN] = 2;
+		}
 		data->iout_oc_fault_limit = PMBUS_IOUT_OC_FAULT_LIMIT;
 		data->iout_oc_warn_limit = PMBUS_IOUT_OC_WARN_LIMIT;
 	}

-- 
2.34.1

