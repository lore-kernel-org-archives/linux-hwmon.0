Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C43DB314;
	Tue, 30 Jun 2026 02:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787688; cv=none; b=Q0dbqnZiLtj/LKAIt969ckTdzFDRJWA2f4x8/x9GnlNkQrm8lGZ3rr/+/dK+DlnYyhimxBdxUkKHbjVB30AhukM26gZu5PT/4u9RoTIhAfOvho1IQ/Hkhu60XGCNOdzsfOz9kZn58hpjQQ6DtwmAnhYVH3rSLpDTLCaAjeGVa74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787688; c=relaxed/simple;
	bh=q/2RXkN4sgny+0WBS9fDs7LP6f4Fil4E2aNtWSk+ba0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BD+fAbFHk0ln5yTsHVP11Ea7t043hR5hwOfP2N/5lC4DqfnBpYkbilPIzfm/nts1r37t0HG7DNo/2148w8PFjjAgDs9QXPxTtTHrb3bTdrq3ZP7s/KW+fLIiLOQj4ng5fvrlvJtvYORT/Lcd6gC73oNQmobV82YuE2hMr3VtJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=cEV4SdVp; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="cEV4SdVp"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1GJu53578895;
	Mon, 29 Jun 2026 22:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=vsd8R
	lUz8RhRMmxJA+sheAUqRE6BgZd3j/bFq9enUbU=; b=cEV4SdVpo08bVTSr5YcRX
	kw4YqEzU0N2UX32P8ePrNfFYgNPmuvSGVpshGcEIciFhzx45E3asJ2fpQ/e62a+T
	CB9cr4VLe9++ZR+EdUStoYrVNHvMZh4L6GQI/u4ZKbSPw0nCeTToF3deHHB07hiv
	ZRPSJmDFuU0oeABRR4NtrR/bs7bZmzEFXMcm5Hy9NYigKF/6Wwk4vyiUjqRr75iX
	78SLmWAVpR0pVy8R55zar4F1R7V/SlTXzSzWrWPpkT9itKR9RX/t/W/4mYtBrDlm
	4/+BZB2tauAgW42etyLL3T/z2Oxjv8kQI5evIqUr4wL29F/VnRGo9ViqhDydw86N
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f3sav3191-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 22:47:49 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65U2lWej033022
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 22:47:32 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 29 Jun
 2026 22:47:32 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 29 Jun 2026 22:47:32 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65U2kqhj019448;
	Mon, 29 Jun 2026 22:47:22 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 30 Jun 2026 10:46:48 +0800
Subject: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c and
 max20840c
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
In-Reply-To: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782787612; l=6554;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=q/2RXkN4sgny+0WBS9fDs7LP6f4Fil4E2aNtWSk+ba0=;
 b=SCdIIAerPspnuinrehmyCGOvqJwCiwt36bVLGfCEf40403F0AKSo/G6kjSyPP2WC9d0ed481H
 IWaeHnkZw9bBhZr0vB8k874ZNs8kp+NbGT4FuCwDrC6+ZRxg2ftnVqn
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=avWCzyZV c=1 sm=1 tr=0 ts=6a432e55 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=JjAQHO9wZUgTJTSyjjUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: uEoljmUdJpRC3lZftHC7klNdomm8i0wu
X-Proofpoint-GUID: uEoljmUdJpRC3lZftHC7klNdomm8i0wu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX+DWVLo3u3Qdh
 nl0pJL3TLg7BKcwXetbQZfzYXg5bPK4z0U8CWfVh2ueekJLuNUsiLHGH3VdyeGMZJaHJqeVA9/v
 MFMbU3EsPXPDxZ/r1LffeCovYcRzpZxLW5sriuNaoJgidQeG3zOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfXxFQ8e49k+6LX
 YRZMz851i5Egb0caE7B1BAZZcLN4uBj5iDt9pWjUJ8sqrK6e6QCEtMGDbAP2SzNSG7U5J0vxAX6
 zLKidzWLFYAdsP7xzYCQJB7AGskEgAA9Eii/0dfFnhCs7XkOFyC5TwW2DbehuSccQSipbg1P7/w
 lDvze6Q1Sf4yONb0b0w5lgeorD7952f7Z8L3dBrEJEnDreomNuLQnX+V1sCVMGh9h+0Qj6H1vrA
 OUpaTOQBCtPs56qdZHWlAwhcF6qOYBO8mJF5vJvwu5aojwOy1w3cQuxREY0OWBrbLVRbt9V2h/Y
 60w0nskDQzGRrOwXKU56v9Cj/NhUuBCDxG29zOk7xS/DlhtzsGROj5V+13A+BQmQ/FDcOFh4mhl
 PGR+6gkFf5HfzsaypxCm/MFcs52IFDLKtTarcVTL0h6oZej53XMbZBx61FSjB61dmT4BBF1Y/zr
 B6j2xvoZkEZeh2Vn5AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300024

Add support for MAX20830C and MAX20840 step-down DC-DC switching
regulator with PMBus interface. MAX20830C is a different packaging
for MAX20830, and MAX20840C supports 40A regulation compared to
MAX20830 that is only 30A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/max20830.rst | 27 +++++++++++++---
 drivers/hwmon/pmbus/max20830.c   | 68 ++++++++++++++++++++++++++++------------
 2 files changed, 70 insertions(+), 25 deletions(-)

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
diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index a3abd24437e8e7560264aad55fc4f456d30ae235..252c77beb243c5a2d90fcf96941605ff31439383 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -14,7 +14,30 @@
 #include <linux/string.h>
 #include "pmbus.h"
 
-#define MAX20830_IC_DEVICE_ID_LENGTH	9
+struct max20830_chip_info {
+	const char *id_str;
+	u8 id_length;
+};
+
+static const struct max20830_chip_info max20830_chip = {
+	/*
+	 * MAX20830 IC_DEVICE_ID has a byte length of 9 despite being an 8
+	 * character string, as it includes a null terminator. The other
+	 * devices do not include null.
+	 */
+	.id_str = "MAX20830\0",
+	.id_length = 9,
+};
+
+static const struct max20830_chip_info max20830c_chip = {
+	.id_str = "MAX20830C",
+	.id_length = 9,
+};
+
+static const struct max20830_chip_info max20840c_chip = {
+	.id_str = "MAX20840C",
+	.id_length = 9,
+};
 
 struct max20830_data {
 	struct pmbus_driver_info info;
@@ -60,11 +83,14 @@ static struct pmbus_driver_info max20830_info = {
 
 static int max20830_probe(struct i2c_client *client)
 {
+	const struct max20830_chip_info *chip;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
 	struct max20830_data *data;
 	struct gpio_desc *enable_gpio;
 	int ret;
 
+	chip = i2c_get_match_data(client);
+
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -90,16 +116,14 @@ static int max20830_probe(struct i2c_client *client)
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
-						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
-						    buf);
+						    chip->id_length + 1, buf);
 		if (ret < 0)
 			return dev_err_probe(&client->dev, ret,
 					     "Failed to read IC_DEVICE_ID\n");
@@ -108,36 +132,40 @@ static int max20830_probe(struct i2c_client *client)
 		 * match the format of i2c_smbus_read_block_data().
 		 * Also adjust return value to reflect length byte removal.
 		 */
-		memmove(buf, buf + 1, MAX20830_IC_DEVICE_ID_LENGTH);
+		memmove(buf, buf + 1, chip->id_length);
 		ret = ret - 1;
 	}
 
-	/*
-	 * MAX20830 IC_DEVICE_ID sends string data "MAX20830\0".
-	 * Return value should at least be 9 bytes of data.
-	 */
-	if (ret < MAX20830_IC_DEVICE_ID_LENGTH)
+	/* Verify we read the expected number of bytes */
+	if (ret < chip->id_length)
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "IC_DEVICE_ID too short: expected at least 9 bytes, got %d\n",
-				     ret);
+				     "IC_DEVICE_ID too short: expected %d bytes, got %d\n",
+				     chip->id_length, ret);
+
+	/* Null-terminate the string */
+	buf[chip->id_length] = '\0';
 
-	/* 9 bytes of data, buf[0]-buf[7] = "MAX20830", buf[8] = '\0' */
-	buf[MAX20830_IC_DEVICE_ID_LENGTH - 1] = '\0';
-	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
+	/* Verify the device ID matches what we expect */
+	if (strncmp(buf, chip->id_str, chip->id_length))
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "Unsupported device: '%s'\n", buf);
+				     "Device mismatch: expected '%s', got '%s'\n",
+				     chip->id_str, buf);
 
-	return pmbus_do_probe(client, &max20830_info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max20830_id[] = {
-	{"max20830"},
+	{ "max20830", (kernel_ulong_t)&max20830_chip },
+	{ "max20830c", (kernel_ulong_t)&max20830c_chip },
+	{ "max20840c", (kernel_ulong_t)&max20840c_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max20830_id);
 
 static const struct of_device_id max20830_of_match[] = {
-	{ .compatible = "adi,max20830" },
+	{ .compatible = "adi,max20830", .data = &max20830_chip },
+	{ .compatible = "adi,max20830c", .data = &max20830c_chip },
+	{ .compatible = "adi,max20840c", .data = &max20840c_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max20830_of_match);

-- 
2.34.1

