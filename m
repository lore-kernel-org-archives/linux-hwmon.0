Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3724356761;
	Thu, 30 Jul 2026 01:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373473; cv=none; b=T36G1LVOL67ypqNg9xWlcT+JHbOugHXDOWu9l1/BqSWSqcLri+gTihkAn/BVw9FEq9udpL2T5BtZTkTigqrnJR9A/QrgpT6IrgymDqG1JxxIFrCYq7+8xl7mKRV2KK/UT7XgAoeRZxGoAAsEUoRwFbvmAtpbQCmMihYUX32Eai0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373473; c=relaxed/simple;
	bh=uBoOusOgoeEiY+WZNTK80C+pQoR8I6rYq5AP98LAeZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VaZFGD5oHaqQIJ7vuLVIcc6NBg05Uj7lzXvfeJqw+MTtqyadOiLYPzcdDCOIss994uJyY3u9dfaUx5Ewy1QDuyaV+NXt+KmkBbWcrDOLtNV+fK+mJFVMdrvFLA4Y7UykkvPzcgFvfeDGxZHB0GF0tsoo/A8q9lY4LmR/FqI/H/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xYiCxYBQ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xYiCxYBQ"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0m1SH3369311;
	Wed, 29 Jul 2026 21:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Rx0Qu
	c3yiXoCJGhu3CSU+JcPEs06c1+dxCHhBQzMDUg=; b=xYiCxYBQ8gqx+7dQyTCRS
	y1Payn6E/1EtvAwWJeoAICzcOYn3N/82eUShhcwNl/LxoVACd4lI5J6I6GQ7vcqL
	hx+C/oaeTdWc8iFZFhT/cCT4eyQwMJUcHffPAGHYES7opnEjUDgu60NMPQEBQddd
	hCnvC+KPgcjbB51GUhZfxzzAgUCnT3rBBuSu0bF5gO59uN5xCD6FZFjaU58DIWUR
	s0sZwz9MsGu5h/7XBY4BxpzjDqQKxwGxo5g1u08KwC9X4MBc0Qpop0H8IcO/hRWD
	k3E2rqV+gb/lDmhSU0y9VJn4SeAyGhoQnF+IIhNmz3Xzy+uZwUGBwi+DtbYFtBPu
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fqag4ck44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 21:04:17 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66U14GeK036913
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 21:04:16 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 29 Jul
 2026 21:04:15 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 29 Jul 2026 21:04:15 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66U13i47020304;
	Wed, 29 Jul 2026 21:04:10 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 30 Jul 2026 09:03:36 +0800
Subject: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
In-Reply-To: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785373424; l=5625;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=uBoOusOgoeEiY+WZNTK80C+pQoR8I6rYq5AP98LAeZc=;
 b=4loEH4ZvXQDpOzPUoeeEVD0FftGEoIalTe9mrTB563zot5r6Pw9M8ErDmbazHFHgJaDPuOoXe
 yw5G4/l/iuVCeO2wC2MtE3dIWVORJ1WB+sPSltII7vdHuyjq7/QwDmL
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=V/tNF+ni c=1 sm=1 tr=0 ts=6a6aa311 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=NZMIpbVum53aGe_WtNUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZEYS5x0FuGkDlxL8U8i7MlJLVjZLsF9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX8ekx0XAj8tZY
 35HCcun1HD7D66ICtPxpdrYHb5GB/KYHSzbVclpeqPv1TYorAifb5CY2wGr4Ljai0QlSSV9snEb
 cVeAg4n4MZeZ6twu5aYiQHWfwRMclJi6S/zvQ83Qpn57kJHikQ65Nt4zpUU713H01OWMzOA2z2u
 j4+CPo9TQZhrTiSSZ9BDZqr9uDy3BZf3JAX8PEOl/6HRoQJuKJfFi/4yieRXbCIJgMWzyuYSIch
 PXd+9+OUdmcd+DO33Tom/XLSk34aBhnCk4tMot2C4JzuVKE8AxzQRSc/W6GRYEmH7J8HFaoxemE
 h2qPMHZ95Cm/qgTviDKCbDXzkwaqiBL2oasqAzlx/qs2AX4o/xIb5nA4Vk5NnpKhnVgiGnWmy8j
 K3/Ijjz6fizcPcALDBkVld+G10bjb+LtAQ1uPOey8fwKGgre2seY9dEAmfOu0l3PkQVovQZxcqj
 s7Io9sqpMNdHOV9dLUQ==
X-Proofpoint-ORIG-GUID: ZEYS5x0FuGkDlxL8U8i7MlJLVjZLsF9b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX1ebGzNwqpHbc
 y9WNYUJ2Dyc2JYy9iehhZZUsV1MlrYJ/Wecir8zkyT6lw8DxV9zfVZf2RgeK+uG1SUr8bki7Pxz
 iopWXm7y3ME6kxfHA5gqDAq3sjpSHuDTRcn+Q0hOgiu4Gq7pCUlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300004

Add support for MAX20830C and MAX20840 step-down DC-DC switching
regulator with PMBus interface. MAX20830C is a different packaging
for MAX20830, and MAX20840C supports 40A regulation compared to
MAX20830 that is only 30A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/max20830.rst | 27 ++++++++++++++++++++++-----
 drivers/hwmon/pmbus/Kconfig      |  4 ++--
 drivers/hwmon/pmbus/max20830.c   | 36 +++++++++++++++++++++++-------------
 3 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/Documentation/hwmon/max20830.rst b/Documentation/hwmon/max20830.rst
index 936e409dcc5c0898dde27d782308d4a7e1357e73..b850f3b6e40d1f1d0cec944be40af02265aced59 100644
--- a/Documentation/hwmon/max20830.rst
+++ b/Documentation/hwmon/max20830.rst
@@ -13,6 +13,22 @@ Supported chips:
 
     Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20830.pdf
 
+  * Analog Devices MAX20830C
+
+    Prefix: 'max20830c'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+  * Analog Devices MAX20840C
+
+    Prefix: 'max20840c'
+
+    Addresses scanned: -
+
+    Datasheet:
+
 Author:
 
   - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
@@ -21,12 +37,13 @@ Author:
 Description
 -----------
 
-This driver supports hardware monitoring for Analog Devices MAX20830
-Step-Down Switching Regulator with PMBus Interface.
+This driver supports hardware monitoring for Analog Devices MAX20830, MAX20830C
+and MAX20840C. These are Step-Down Switching Regulator with PMBus Interface.
 
-The MAX20830 is a 2.7V to 16V, 30A fully integrated step-down DC-DC switching
-regulator. Through the PMBus interface, the device can monitor input/output
-voltages, output current and temperature.
+MAX20830, and MAX20830C are 2.7V to 16V, 30A fully integrated step-down DC-DC
+switching regulators. MAX20840C is similar but can reach 40A. Through the PMBus
+interface, these devices can monitor input/output voltages, output current and
+temperature.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ae003a6eac30a7b0a022c5f7f467d8f81736c3f7..5d435e81fc808c42576e5d1733f8a3e1ef32c023 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -394,10 +394,10 @@ config SENSORS_MAX20751
 	  be called max20751.
 
 config SENSORS_MAX20830
-	tristate "Analog Devices MAX20830"
+	tristate "Analog Devices MAX20830 and compatibles"
 	help
 	  If you say yes here you get hardware monitoring support for Analog
-	  Devices MAX20830.
+	  Devices MAX20830, MAX20830C, and MAX20840C.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max20830.
diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index ddead72a8db5d6f8491cbfbf356db0f8de64da03..94433deda0113aa7bf0fc2b3f7807553f3014320 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -21,6 +21,12 @@ struct max20830_data {
 	u32 vout_rfb2;
 };
 
+static const char * const supported_chip_ids[] = {
+	"MAX20830",
+	"MAX20830C",
+	"MAX20840C",
+};
+
 /*
  * MAX20830 only supports READ_VOUT for VOUT monitoring.
  *
@@ -82,7 +88,7 @@ static int max20830_probe(struct i2c_client *client)
 {
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
 	struct max20830_data *data;
-	int ret;
+	int i, ret;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -104,13 +110,12 @@ static int max20830_probe(struct i2c_client *client)
 	 * which do not support SMBus block reads.
 	 */
 	if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
-		/* Reads 9 Data bytes from MAX20830 */
 		ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
 		if (ret < 0)
 			return dev_err_probe(&client->dev, ret,
 					     "Failed to read IC_DEVICE_ID\n");
 	} else {
-		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
+		/* Reads 1 length byte + data bytes */
 		ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
 						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
 						    buf);
@@ -126,20 +131,25 @@ static int max20830_probe(struct i2c_client *client)
 		ret = ret - 1;
 	}
 
-	/*
-	 * MAX20830 IC_DEVICE_ID sends string data "MAX20830\0".
-	 * Return value should at least be 9 bytes of data.
-	 */
+	/* Verify we read the expected number of bytes */
 	if (ret < MAX20830_IC_DEVICE_ID_LENGTH)
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "IC_DEVICE_ID too short: expected at least 9 bytes, got %d\n",
-				     ret);
+				     "IC_DEVICE_ID too short: expected %d bytes, got %d\n",
+				     MAX20830_IC_DEVICE_ID_LENGTH, ret);
+
+	/* Null-terminate the string */
+	buf[ret] = '\0';
+
+	/* Verify the device ID matches what we expect */
+	for (i = 0; i < ARRAY_SIZE(supported_chip_ids); i++) {
+		if (!strcmp(buf, supported_chip_ids[i]))
+			break;
+	}
 
-	/* 9 bytes of data, buf[0]-buf[7] = "MAX20830", buf[8] = '\0' */
-	buf[MAX20830_IC_DEVICE_ID_LENGTH - 1] = '\0';
-	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
+	/* No match found - unsupported device */
+	if (i == ARRAY_SIZE(supported_chip_ids))
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "Unsupported device: '%s'\n", buf);
+				     "Unsupported device: '%*pE'\n", ret, buf);
 
 	return pmbus_do_probe(client, &data->info);
 }

-- 
2.34.1

