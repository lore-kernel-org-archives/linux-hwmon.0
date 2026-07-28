Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C8C348C61;
	Tue, 28 Jul 2026 03:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209629; cv=none; b=aLsu10FIU+gIXnNzTwKtftFCmObDP1qO+Of5A/fYgg1cSjCmKj7p2oG2fRXIzpFNZ4R2IWtBsXRlHb3Gjw8YvWJBBS7FGqSo6GNubXQrxEhJxDaNeFxQZxZyJa5vdVmvAqh7EpiveamCDsXv9pSWEe9qMjuAA5WKKQEfLpqrVJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209629; c=relaxed/simple;
	bh=HVFi7ncZPh9GJPQQueaHNgsGtDev+yIfSkg/tBJdxg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=B1oGfFRKMWArXFgSnkdTz96Zha92K4Bn2boQ6Bu1+nUaHqUdiimEvhlX80QePZML14MdGyf0nEoSyyz1fpVweuXFlOjHB6hx0OXcyDQEkcYHd9Og3nktWndh2Zpnl7NQ/uWCh8k3GNuQlg++9ECAmckS+f69DvpauH6bO0HRYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=WsAjSA6H; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="WsAjSA6H"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0m5R61774397;
	Mon, 27 Jul 2026 23:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=fzXx1
	2DxGL7ax5qlncbERdY4/g94BHtcvdscIacHAjI=; b=WsAjSA6HDIVoCF2FPBFGE
	6Ra/i9tCiy4VCvpZp/ut23Y1IWu80Y9IHSXMrdUhC4apN6dlloWZYxEDPA+YfRSK
	PQUWYw5jPOmmQgXE4F8qFeJUUmcRS+xeLumZ56R/+gbgWkhZGihBd30xv5UYQs4z
	gRn6wsU6RVZNjI+6jLU4BPW7UWKvgxawoqMHQ2yPvnUbcpUU8qAsZPxuJmnNdeoD
	5nkEhOtxEqsqAajE2LjlBU4p/ptO1kgAlBcpBRGCWRWzx7JvL+SWIEgCThz7wpVn
	Wi3qdBFt6SR7PqcnpggAeAp8CHBiyNliZo1McnVARKrJNGcuL9eOr93L83BdWOzk
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fmt21tmss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 23:33:32 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66S3XV4g057043
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jul 2026 23:33:31 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 27 Jul 2026 23:33:31 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 27 Jul 2026 23:33:31 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 27 Jul 2026 23:33:31 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66S3X41Q029413;
	Mon, 27 Jul 2026 23:33:25 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 28 Jul 2026 11:32:56 +0800
Subject: [PATCH v4 2/4] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260728-dev-max20830c-v4-2-cec034298535@analog.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
In-Reply-To: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785209584; l=4061;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=HVFi7ncZPh9GJPQQueaHNgsGtDev+yIfSkg/tBJdxg0=;
 b=TlF9mv6IPSR1daV3etw4JryOvUb+Kq5LDMIh65FPDABA9wg6gJA4HaKp1+nxXc0ci62B4Zo48
 G+FGJ7Q2oBRC1Y+WMykCkBh6wtT8WtDokAKxBX6DOoXqLM5IYbdlTFE
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a68230c cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=_8IsL081WaPWLXqRiQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yvlfUID7fvzJsziLIc5dcJDtAca1qOpA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX+sMy3jDcUzJ7
 nhEVHXBNhMuWDqxuagtjnRMc0o4A0eVBM1PUjNUOMJhxUu+AqzZikwLruV9DhGMZsojp2Y3e0Om
 iJBZmHFDsrYgEq65YD3tpNODaTqsUesWMgo/2g92BT2FeLpBD2A9
X-Proofpoint-ORIG-GUID: yvlfUID7fvzJsziLIc5dcJDtAca1qOpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX3yS33UBX53CQ
 xEgeAgjMZPz+seJ/O8ImrKfvIWX4cGvzz2rcI/2MjHTUmnNmbYFuWVMZ45kMrHz4strIseh3PQJ
 hZILGAhEjbLktYb7VFWl+l4/aJN4BAVU3iWzlxWYfxL2MAJLGBEGddZX5PK6GctwP7zJ4IWZH7i
 1bTRZB0LxxYBxYdBW4kwpNUqSb7+D9BI13sb/qgqZlb7zfbRjo1aM3+V0+xtuOHOOw4Rpg2dkvT
 fznFDEYqlo8PU9PYymfqr3YllEgGv9zgv6Os3aP51yBPRNA0QhzDFOGIzEVeHW33BV92YY5Zr9W
 JMonB1W480Gd38dVp8XSqQOrvcadEIjNiPqcc2XWc5P4GhjzqKMBYSpmATy7etcBipPPqphowMd
 KKxap2MkIEZR6XUllnHdLj1dUZUvzt9lxDQ68UlZ/47JfKzv3Oki/03cN2+HCjtpztli4fupHBu
 UvKY2hrrqHxiqPWWvKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280030

Implement support for external voltage divider scaling using the
adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.

When the desired output voltage exceeds VREF, a resistor divider
(RFB1 and RFB2) is used to scale down the feedback voltage. The
driver reads these resistor values from device tree and applies
the scaling formula: VOUT_actual = VOUT_measured × (1 + RFB1/RFB2)

The properties are optional. If not specified, the driver assumes
no voltage divider is present and reports the raw VOUT reading.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/hwmon/pmbus/max20830.c | 60 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index cb2c23672166d641852199ca07eb716924f4f286..7c1e94c43ac4e5d1b4f69dc77b02e424a674e908 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -7,6 +7,7 @@
 
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/string.h>
@@ -14,6 +15,51 @@
 
 #define MAX20830_IC_DEVICE_ID_LENGTH	9
 
+struct max20830_data {
+	struct pmbus_driver_info info;
+	u32 vout_rfb1;
+	u32 vout_rfb2;
+};
+
+/*
+ * MAX20830 only supports READ_VOUT for VOUT monitoring.
+ *
+ * MAX20830 uses an external resistor divider for voltage sensing:
+ * - VOUT_COMMAND and VOUT_MAX set the reference voltage at the feedback pin
+ * - READ_VOUT reports the feedback voltage, which needs to be scaled for actual
+ *   output voltage
+ *
+ * Scaling formula: vout_actual = vout_fb × (1 + RFB1 / RFB2)
+ *
+ * If regulator support is added in the future, some adjustments are needed to
+ * ensure correct feedback voltages are set.
+ */
+static int max20830_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct max20830_data *data = container_of(info, struct max20830_data, info);
+	int ret;
+	u64 temp;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		/* Apply voltage divider scaling if resistors are non-zero */
+		if (data->vout_rfb1 && data->vout_rfb2) {
+			temp = (u64)data->vout_rfb1 + (u64)data->vout_rfb2;
+			temp = DIV_ROUND_CLOSEST_ULL((u64)ret * temp, data->vout_rfb2);
+			ret = clamp_val(temp, 0, 0xFFFF);
+		}
+		return ret;
+	default:
+		return -ENODATA;
+	}
+}
+
 static struct pmbus_driver_info max20830_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -24,13 +70,25 @@ static struct pmbus_driver_info max20830_info = {
 		PMBUS_HAVE_TEMP |
 		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.read_word_data = max20830_read_word_data,
 };
 
 static int max20830_probe(struct i2c_client *client)
 {
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
+	struct max20830_data *data;
 	int ret;
 
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->info = max20830_info;
+
+	/* Read optional voltage divider resistor values */
+	device_property_read_u32(&client->dev, "adi,vout-rfb1-ohms", &data->vout_rfb1);
+	device_property_read_u32(&client->dev, "adi,vout-rfb2-ohms", &data->vout_rfb2);
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA) &&
 	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_BLOCK))
 		return -ENODEV;
@@ -78,7 +136,7 @@ static int max20830_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Unsupported device: '%s'\n", buf);
 
-	return pmbus_do_probe(client, &max20830_info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max20830_id[] = {

-- 
2.34.1

