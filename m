Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D937C109;
	Mon,  6 Jul 2026 02:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303783; cv=none; b=CrT5J7IcwMskv4KZyzIiruG2cO+vvk4dCzwCpxzo2bWuL5Ag6+ancOgsJgnkJZg4d6lh5jhgJWSxf4PhNshfwhk8Vqu3TfS8wAIMEnnavtR6iRJIlz8lBFgI+Q0rWhqQ5YoEYG+ZFD0/Za98u6s4NEFIFR3bQu4I/mvaBKaUKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303783; c=relaxed/simple;
	bh=zZXRPOLanBG9xGhl0Bdk0xzGHSR0Jb/0GCj6E+Fek7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y0ybE1OVskL1UbRbNf6B/wZKZGLG/XC4CWYZL+gdEoT/aKjzqavfrjWK1bY1ixlpFAYSXkeuldm9Gb6N2iGdA6vXU5EqsQMhqEheEfcQK5Up3xzkEhQjY9+UH0AWwcxO2ozqvTJHo+l0IFuKhKBF9g3JOcb/g5zUSnuA3Nv8RRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=x5nuSzUF; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="x5nuSzUF"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665M34U03100652;
	Sun, 5 Jul 2026 22:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=P5swf
	zEg8mwmOtHZ8NB0BYRHSGzAO8Kw7yUhbzzqamk=; b=x5nuSzUF34O5dDa3dV/t6
	aJs08/FUSkoCqcMvmsqiISe/8rIRoPY0FMQJa+kBxEREzZZfUsn1WRaJ/PQB7yEb
	Nlh4AnpoXDkP8qYtiK476h6NxPbCctmSvLxwYFTQn8WQP/REQdIXZvmbXZCX6ApT
	8aEbrZYtRZrgH+otVLXVbUVd3oUpAGCcGthILUAbk0FD1Egk4NjmKtqW2JYsKQ5U
	MVKr7/x6eFm0jPYJpD4XamU2LpItEbzPXBnbyAwMJgfzTn707YuBIEPNQbn4LqQW
	hntikDBNzskHNsTslHnZn29s/plmVHbYRvA+sxyGvv98+MXedi8sSnQEhoimhfxJ
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f7ggbt5na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Jul 2026 22:09:25 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66629Orf045199
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 5 Jul 2026 22:09:24 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 5 Jul 2026 22:09:24 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 5 Jul 2026 22:09:24 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 5 Jul 2026 22:09:24 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66628o7U015791;
	Sun, 5 Jul 2026 22:09:18 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 6 Jul 2026 10:08:45 +0800
Subject: [PATCH v2 5/5] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260706-dev-max20830c-v2-5-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
In-Reply-To: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783303730; l=4454;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=zZXRPOLanBG9xGhl0Bdk0xzGHSR0Jb/0GCj6E+Fek7g=;
 b=rUC8yh6XCHPrFXQ74fRS6BvV4bl2aiim66ITc7qONzvNYvYasj4gQI89D1s+OeoC7aS0Zxjpu
 khK3qT2Ptg0D8UktLBa5lf9DUDqz8LyAj7FlVC2Y9zId5CuZJr3TDsx
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: _lAHBeDG1_-l5JKOtJFHD6lBm4I_GFzn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX/xPpJlXdcx62
 aoEsGWRY4CKqmU8chJrY1JhL4YwVggvBEU4Xw/CHuJ/C/kvdcVjSAQkP43gRi1oMLLP824o85mS
 cuiR/EfpzEEwmGpXtSGaertVQYpEjHPmwelSUpV8wk6bhVsb/kgU
X-Authority-Analysis: v=2.4 cv=TPx1jVla c=1 sm=1 tr=0 ts=6a4b0e55 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=v52DSUhV1VzBc46Xrp8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _lAHBeDG1_-l5JKOtJFHD6lBm4I_GFzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX0SXWBpvq7Vb4
 uu7Idvfv7qfehnRJDTpJZVDSn/kPaI7yw+LS6RpAniKfpEdtIdf5kMX/9Drbj6duExmr1k6L5WC
 mE7ulYEIjAAYypeVYzx0JdGHGyWfDt0ZgE1kUNSFPnoSVoFYOG3tNDjNjvLgd0kNNY28P7zcupT
 qMaOplwKBTZxV8hBTYl1QQB5WVeCvo4KRkF+TkunxIakvDjai4WjkcLL/TJRV/NUQMFMnku0QHu
 WzJ5prVvbH8Qcbb7rRnCE5jrFS+/cM1vcSCahA3tccac0NrXZoCEvjS+KtO+95bLufe6KJVW1Za
 gYwOFGz+NtsijJojHaMV6BZOSRb8zd/10HagqQOT2LrG+6iUqpgwjkWbythicAF+JeajO7RYHy5
 L/EXSvO3V4oUHBuaIqW4jIoz4cjdshp/AZdYcv6Iqv6MzBsLDysZ8gIaVleWyyYK3lXhNc7Pd+a
 45aKcg8rcR74iYH5DDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060019

Add support for MAX20830C and MAX20840 step-down DC-DC switching
regulator with PMBus interface. MAX20830C is a different packaging
for MAX20830, and MAX20840C supports 40A regulation compared to
MAX20830 that is only 30A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/max20830.rst | 27 ++++++++++++++++++++++-----
 drivers/hwmon/pmbus/max20830.c   | 27 ++++++++++++++-------------
 2 files changed, 36 insertions(+), 18 deletions(-)

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
index 5aad4448054fc55bb0a87920d89f96bc28fda072..88fc45447792b1fea7691dee9fb385238c5d82c1 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -93,13 +93,12 @@ static int max20830_probe(struct i2c_client *client)
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
@@ -115,26 +114,28 @@ static int max20830_probe(struct i2c_client *client)
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
 
-	/* 9 bytes of data, buf[0]-buf[7] = "MAX20830", buf[8] = '\0' */
-	buf[MAX20830_IC_DEVICE_ID_LENGTH - 1] = '\0';
-	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
+	/* Verify the device ID matches what we expect */
+	if ((strcmp(buf, "MAX20830") && strcmp(buf, "MAX20830C") &&
+	    strcmp(buf, "MAX20840C")))
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "Unsupported device: '%s'\n", buf);
+				     "Unsupported device: '%*pE'\n", ret, buf);
 
 	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max20830_id[] = {
-	{"max20830"},
+	{ "max20830" },
+	{ "max20830c" },
+	{ "max20840c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max20830_id);

-- 
2.34.1

