Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0215134D38B;
	Wed, 22 Jul 2026 01:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784683821; cv=none; b=YnT3Uw/f5mEnmhyXRUA2dpuV4nz6wNqz7GE+WagHN9/n1wwxQZBX9z6LZzrjFHiG57Snh+EUzDdUp58LaqKWLWJfAb0dUsudfMDXGV04XkM3p6dlrfk3uFzUj9XetYBtO1ebG3XtbOrjf2VkK9hDBCUsx+6/ey1CPHwJ2m2En7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784683821; c=relaxed/simple;
	bh=ZDz7OToRC0x+fXC+unHHL5ESwVdV4m5xPFhhcUr3XjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=l2n6iM6B/ED52WGfq86csaxQ+JvSNCQwsmoHapM1afYamPIhZq4mKTPYr+uluxcfeuimMZt5ZKBpcLW2VOBBt/cNs809T9D14CQGsk0PKLJjb6fg42CyVepTGIhdaMgOkZPtORSSJTCeoh5F1nRuLDNFyG17ld5umRfRkad+HPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=FE3C7UoY; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="FE3C7UoY"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1DEj61981695;
	Tue, 21 Jul 2026 21:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ahver
	y36VAvV9n/xSR4QgUjOb2HtAm9nbRjZErPrdkI=; b=FE3C7UoYiX3tSzchLc9nM
	dsAMAjIyTPcsQMqHTWS5MPc39OwSDH7cn994ECck/MBFfF50XaUNOawxHHHcFP10
	G/6XHm8uFRB98j7+jzdv1bTEn/NTzVLdF4Ybw5TnykvTFj6rSjGxEC87nbiUKcjQ
	tciP6fykL65Ia0N8/oZGGF6MSZlOsz6SSr+vlUu3zs7Cy7rh5G9t8wxGFVRe04lf
	3a3pMnVehSoWydm9LX6BnAgHkRP8x2Hg6OiJonMZaozhcGyLlG5jCb+mxktQb8SG
	oECmP/n9iq33OS9qsceOQ56mKeqtcJpkfkZmMAbmVzch9xf8EfAtF3Av0WsynSiN
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fjgp0gr0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:30:06 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66M1U5rb003334
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jul 2026 21:30:05 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 21 Jul
 2026 21:30:04 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 21 Jul 2026 21:30:04 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66M1Tc8D017211;
	Tue, 21 Jul 2026 21:29:55 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Wed, 22 Jul 2026 09:29:30 +0800
Subject: [PATCH v2 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260722-max34451_fixes-v2-2-bbddb18ec1d6@analog.com>
References: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
In-Reply-To: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784683778; l=1932;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=ZDz7OToRC0x+fXC+unHHL5ESwVdV4m5xPFhhcUr3XjI=;
 b=pZhavWrQW01oK5vprdD83wCftWLYO/obgLGJzuKQUkb26XlPpZcUKlrp7l5obAWlh/ZkRg+Hu
 P5lejmxHWTRAjucQ0Rd505B8y6Uh3InJgl/7zbn1ueps59ijAkjRQ38
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxMSBTYWx0ZWRfX3CpzEK1+apmq
 Zp+uEo1QtmhhzvSCGHup6ll2j7jg0iRDyGzZDdx2R0UPXVWXZiwt0KeFvYs9jEkcG49mk+0lYEf
 I53oHHzSJM8FvGL3TzBcaUrGsWBnsPujU1elGILiCbgKcQug4YE7
X-Proofpoint-GUID: 6F8F3K7iTmfspcIkP3nAV2eXmAyyIrDx
X-Proofpoint-ORIG-GUID: 6F8F3K7iTmfspcIkP3nAV2eXmAyyIrDx
X-Authority-Analysis: v=2.4 cv=cPXQdFeN c=1 sm=1 tr=0 ts=6a601d1e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=KyYa-aBjXRLsE6yk1RUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxMSBTYWx0ZWRfX4zoGRzWWqXd+
 F5rQO1YKD5ubU6BrCtrEnO2SrzZRQfrfpa8m7I3jC017K5764HlMuQ48WC4pgnTQ5LE3K/kq7vx
 3q5vIRqPDz6SCx/aV2IVDi8jlYPouFUMlLHnhAyUEkF++X/tQpwneTeq2mBE78hB0rDWHSQEWhf
 hDM2haSdrnd548a9xRW/3xGl5whf1uCYFXptfRBxQchssQacdXxLwC0jLun/vwXOZ1PsiWq9Dya
 dUjZK6xbE2vtbs/M+r+6fuktrDSaWjyBcn0T5uhH9epWCCKPNR4UCMw+oO57gpR+uLbe6J8P8z3
 IUabqlclMeNNlq7z+efmT7ox61aPdERKwf4Cek/aWUxbyJLbMQnkPCyKOwa6fDlLv+WsJyfCm8m
 HYczoWpYSu1cSuT75bs5f7Vh91Fta6MvpVMimS0YwthPxtq7IQ1cj0FGj1ZWomTxLu9XIzmIx4a
 VHJkfVyl+HqSM2UGmTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220011

The MAX34451 released a newer version called max34451etna8+.
This simply changes the direct format coefficients

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/hwmon/pmbus/max34440.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index e56057e9273c1639bddbaf4e665ea159f1d7c3ed..81514727565f29c7251fe93f049cdd6b0f214f81 100644
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
+		if (rv >= MAX34451ETNA8_MFR_REV) {
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

