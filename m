Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41F3E1D05;
	Thu, 16 Jul 2026 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190439; cv=none; b=o8hTfH+TS8SrtmHNZZAD7nTSOF12+t9rE4HyJdHWOgw+CwAEcEWh50FWDdVtKrN+crL5Pbv1wLzpeiGyC0a9xKwWBV/YEGuOhVXjatonFYzjUnD1iy4KOSl0PLy4EGnhF8Je0crVzHuuy6HK0c/3kx/26U80HHFrhhlsh4uBgXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190439; c=relaxed/simple;
	bh=mT01OgT0DqCt//aLSTaNtrbUnlMYyUTksex4E9/QJdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eaByoAl9Y1IEhu5UnbDLfDQvHB/4lFTzoXaKV2ib89mld0ktdG39d7DtPHqgKd6iqf+i5ZdlN7TumwAU17Gjo6K1SrH6rmjW494OENqdhAu8sYaXrmKFe3pMdyFEPIozY2Ti9fTSUskZ+bEAvfRHKR2mR23GmdRSmtvLDmhzKhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=PPjQ0+IY; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="PPjQ0+IY"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7IF232977873;
	Thu, 16 Jul 2026 04:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=1MiSQ
	W+OG8eeJ3xCguBYiYNiGLft8Sjp2hCoiPOGqfU=; b=PPjQ0+IYnV0KSVdIXPyWj
	lab8PnclhyaaNi17KOSekvpxQVhkPsAJBcu2FB3/iTvL8gyDTiQXSDWZRkvAFMcU
	3t8y2ER3vCuDmGieyBwJiFrGBqaGFHL79CghWWFoH+Y95egBcVsW/qHWBw0plh1g
	tLrLtHoS/viDvQf80vlTNZ/L94h0TtaKuv97HYUgRndBnytCp6D/9EEHgUXrCqPY
	zGRdMl0L3bifnyrMskanNQ64NHHkXB1XzQGTnwFyDlmJkXa+W6nMceSlSp8JdULH
	9p9HljqzydSsAOjBcF2jbr2C8NP2U6Jc8YqjWSbyZiqd5r5K9FswvSMP2T27gNxo
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fe70e4me9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 04:27:05 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66G8R4kJ061341
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 04:27:04 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Jul 2026 04:27:03 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Jul 2026 04:27:03 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 16 Jul 2026 04:27:03 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66G8PdUS014492;
	Thu, 16 Jul 2026 04:25:49 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 16 Jul 2026 16:25:11 +0800
Subject: [PATCH 1/3] hwmon: (pmbus/max34440): block unsupported VIN and IIN
 limit registers
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260716-max34451_fixes-v1-1-a941b27eaecb@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784190339; l=5845;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=mT01OgT0DqCt//aLSTaNtrbUnlMYyUTksex4E9/QJdE=;
 b=pxx6iREfwr4U2vZ5H71ZTJnFx0xa2T6lfwPVFGdLVDdhMhNWCLNfbfz9sDBsWiyxKbjRgO7r2
 63nDRgMHEqTBshjP4hlBceR+0WqT/3l/VmPm6w/EcML3AqlOpR14lE6
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4NiBTYWx0ZWRfX4UgsSkk7XTGG
 5rxV+VgrgIIzRFSOBbpRp1nW9OgC3w++XFYody3ZjFn6PMwVFYxALHsuYhontxryYZePNYLBxft
 pudK3eMuN5dwhRmdM9+RgAwxeni7LRVGmL6ndVw6U0fba6IUyRx7d2vXsWXaJT4ojHEBlEe98Qt
 fPt7jKJdaNhbuSTmycvV7ypFp4p19hUP3YzAPrQmw8bVgh86m5xqDB1bJ+aUAPQFc+c7a7BHWLM
 rFzAxHDfjvspB92Kf50QbvSzTmEkEHuMKKc5IRRpnZna9fb24tpKweik3Tf9K3m1bb1uNkXU4/X
 3ntNYIG1QBuOLrj0dQqltc6MvNI5FGWB5aj81jm5h73r5QrCEtiz/fLPT1Zl+wlOR/q3gJ3fP7p
 N2zj8n2E53iSD8/eXzwIPsHIFSYnRn1dVHgFMJBxSA9fNDDJ8gfgcTU9jt6tA+ObcPN9BXoi9xK
 /rE4fFFs3KchNzZdDAw==
X-Proofpoint-ORIG-GUID: 5yNT_LPkgtr7ymcnQazoJ5sIF2EoR6-p
X-Authority-Analysis: v=2.4 cv=XsLK/1F9 c=1 sm=1 tr=0 ts=6a5895d9 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=0zjOGYTVecPynEjyQs4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4NiBTYWx0ZWRfX7lt3MxQUi138
 FEPlzyaQpprgNxmjspP73L14sT/wky13LfVg/QmDRHe+JlAa/SRXk/++Hu2vylXa7mDlNmCz+Yv
 GYZjPeZ8RdfoPTae+o64wVIeXECN1GYIiU1pmsI8R6A9Mn/Qd1Cd
X-Proofpoint-GUID: 5yNT_LPkgtr7ymcnQazoJ5sIF2EoR6-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160086

MAX34451 and ADPM chips do not support standard PMBus VIN/IIN limit
registers, manufacturer specific min/max registers, or undercurrent
or undertemperature fault limits. STATUS_BYTE and STATUS_OTHER are also
not available. Accessing these non-existent registers during driver
initialization triggers a CML error and asserts ALERT. Handled by
blocking these functions during read/write.

Fixes: 7a001dbab4ad ("hwmon: (pmbus/max34440) Add support for MAX34451.")
Fixes: 629cf8f6c23a ("hwmon: (pmbus/max34440) Add support for ADPM12160")
Fixes: 2e0b52f1ae88 ("hwmon: (pmbus/max34440): add support adpm12200")
Fixes: 479bfeba2eb6 ("hwmon: (pmbus/max34440): add support adpm12250")
Tested-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/hwmon/pmbus/max34440.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 74876d2207fbe4014b8b54a9fd9682370fc3bbed..e56057e9273c1639bddbaf4e665ea159f1d7c3ed 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -88,6 +88,33 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 		ret = pmbus_read_word_data(client, page, phase,
 					   data->iout_oc_warn_limit);
 		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_MFR_VIN_MIN:
+	case PMBUS_MFR_VIN_MAX:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+	case PMBUS_MFR_IIN_MAX:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_IOUT_UC_FAULT_LIMIT:
+	case PMBUS_MFR_IOUT_MAX:
+	case PMBUS_UT_WARN_LIMIT:
+	case PMBUS_UT_FAULT_LIMIT:
+	case PMBUS_MFR_MAX_TEMP_1:
+		/*
+		 * MAX34451/ADPM family do not support VIN/IIN limit registers,
+		 * manufacturer-specific min/max registers, or undercurrent/
+		 * undertemperature fault limits. Accessing these triggers CML
+		 * error and asserts ALERT.
+		 */
+		if (data->id == max34451 || data->id == adpm12160 ||
+		    data->id == adpm12200 || data->id == adpm12250)
+			return -ENXIO;
+		ret = -ENODATA;
+		break;
 	case PMBUS_VIRT_READ_VOUT_MIN:
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34440_MFR_VOUT_MIN);
@@ -244,6 +271,51 @@ static int max34440_read_byte_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
+static int max34451_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct max34440_data *data = to_max34440_data(info);
+
+	switch (reg) {
+	case PMBUS_STATUS_BYTE:
+	case PMBUS_STATUS_OTHER:
+		/*
+		 * MAX34451/ADPM family do not support STATUS_BYTE or
+		 * STATUS_OTHER registers. Accessing them triggers CML
+		 * error and asserts ALERT.
+		 */
+		if (data->id == max34451 || data->id == adpm12160 ||
+		    data->id == adpm12200 || data->id == adpm12250)
+			return -ENXIO;
+		return -ENODATA;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int max34451_write_byte_data(struct i2c_client *client, int page,
+				    int reg, u8 byte)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct max34440_data *data = to_max34440_data(info);
+
+	switch (reg) {
+	case PMBUS_STATUS_BYTE:
+	case PMBUS_STATUS_OTHER:
+		/*
+		 * MAX34451/ADPM family do not support STATUS_BYTE or
+		 * STATUS_OTHER registers. Writing to them triggers CML
+		 * error and asserts ALERT.
+		 */
+		if (data->id == max34451 || data->id == adpm12160 ||
+		    data->id == adpm12200 || data->id == adpm12250)
+			return -ENXIO;
+		return -ENODATA;
+	default:
+		return -ENODATA;
+	}
+}
+
 static int max34451_set_supported_funcs(struct i2c_client *client,
 					 struct max34440_data *data)
 {
@@ -363,7 +435,9 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[9] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT,
 		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
 		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 	},
 	[adpm12200] = {
@@ -399,7 +473,9 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
 		.func[14] = PMBUS_HAVE_IOUT,
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
 		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 	},
 	[adpm12250] = {
@@ -433,7 +509,9 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
 		.func[14] = PMBUS_HAVE_IOUT,
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
 		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 	},
 	[max34440] = {
@@ -581,7 +659,9 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_byte_data = max34451_read_byte_data,
 		.read_word_data = max34440_read_word_data,
+		.write_byte_data = max34451_write_byte_data,
 		.write_word_data = max34440_write_word_data,
 		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},

-- 
2.34.1

