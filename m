Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9448F346FAE;
	Tue, 28 Jul 2026 03:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209638; cv=none; b=TipOnvqwzNRy1iRWWOx64kEVvVoVhiTPd02N3aiWMe3tj8fX7T7W5BU0Hr478FNh++H/qaVbPQnVULk96ZsSEtEFILousYRd19svvhMxRRRYoAqSqlJ9kZnOwGawqKXrIJXMInvPIUO5jlTiNRikDQ5l71qcfjYsN51yXhxeM1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209638; c=relaxed/simple;
	bh=De/ouEk+YK4hT8X+mmMtA02Qru7JMnNp9SjAfp1epnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L2gb9hGyEQaBInvOu3veJlVVUgAzFB5tqwB4cJZCg43Aoqg6NiyuXQfGooj7GDNf/aaKWn7CihdTU1AmygCGTTY8gUFvBosc8V0jfHW/082U+IesgQ+04A/yAnWsXHT/gYP+zl9cdmZgynAroQnAWVxXoz+xFNiu9Gin89nKns0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=XCvwJ6vw; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="XCvwJ6vw"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0lv0m1942006;
	Mon, 27 Jul 2026 23:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=eiM1/
	aW05333YfHRytwhCx92NE9pkRaIKT2NT34kurg=; b=XCvwJ6vwzdqM37i1tdKXZ
	w4ni2zhFfjXkoaA6TF1/FsPAuYCS9M4B4PuKBt544ybzFfKRjl29QbEGOi/CWxF3
	OVuVaaWwTcLP0ug7bN0YLP/Hmz6tAhsMDHcBIRZrMML4CVGVP+YJMxLSE/1WOHCK
	TMRxKmb+qGw7BPUzcGHJxWmA5ihv1lzrRgFFhHsBuYOZ71FXThOGzqckQOUXKxKj
	KEhbudCH6x3tjl+V33uhYOguKpyRtzeEQwd27Z5Lqgh31RHD/DdPrG4EhBOT9Hm1
	r1Bc2u5TCQzLw5kJ9/7kaHFt4xh7hBhuEGu1fdRryvUgiW0tfqs7YHMeWtSxLPuw
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fnefgg89h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 23:33:41 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66S3XeJM057058
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jul 2026 23:33:40 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 27 Jul 2026 23:33:40 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 27 Jul 2026 23:33:40 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 27 Jul 2026 23:33:40 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66S3X41S029413;
	Mon, 27 Jul 2026 23:33:33 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 28 Jul 2026 11:32:58 +0800
Subject: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785209584; l=4454;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=De/ouEk+YK4hT8X+mmMtA02Qru7JMnNp9SjAfp1epnw=;
 b=3AuSuE8SgBbK0NVOsGCqgiPPb6UaFjCk0ffs3jtRi6Hc3iBc6gS2h5M1mqhsQA/JRo5gC2k0s
 m+sQUAMEz8YAQHBF35P+wKlTWGI0no8Vrav0iZJ0wsBiNN1iKxVk1Ec
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: vMT6-_XzcTjwB3LutQmT9Yrsvdkwnmws
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX6vd1AjMbU2Lm
 wR3pdsNe423KxfrnkjvoiGqgSBuPT2ckM6zYVy0v6Qj0VkDgTtj8TqOWhzc2Oqd/BQSNxx3RRwW
 HpqtqtoV7LgoOEMUDOiWVbznFTROa2id3hM4iVULeTz9K2U0cKUQ
X-Proofpoint-ORIG-GUID: vMT6-_XzcTjwB3LutQmT9Yrsvdkwnmws
X-Authority-Analysis: v=2.4 cv=Q8fiJY2a c=1 sm=1 tr=0 ts=6a682316 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=v52DSUhV1VzBc46Xrp8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX0IkxoUteVKf4
 qERvWVsjNbuSGNfzFUSwrCIAdYSfp7P4M4doDTlPijZmGU7tkgJjU25niFr2E8GoLehoPkjqTuR
 WN9yCsYULbwHJvPOy1YHsW+J67708AlcEuXqPSWrh4NMyapVzV5RDdYpDMy1fJwqwVTuBHbyT7Z
 tquRNwojqZaa+VSgLnlO2qU21Z0JnFJPfX+KrzSIYRWz945EN78YNaaZpKUozxpstcKCZo+/Ken
 bLoAERtH+NkMwnyhq3433bDHqCrOrLytrczTpkfjCo/quT7oxcJA3eSDmVyD2dQZONQGKB1SLhX
 jBRpoSt7bsQ5z8JaiNLeAAX4K/S/WWYhLexWkVH7A0lqs+vs9xcPWtHWrXDa0vjFnDv80AxaqEg
 HHp1UDQvc0/RJk1WxTaHYKveEg9JKtzzhtM8rPqoVNI8lvN/s1GQs6kmnarorYPHVaBRO8GargN
 MAgXDk4NuXCFIr475rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280030

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
index 7c1e94c43ac4e5d1b4f69dc77b02e424a674e908..029733a377123ae6a861841db4a40dd540f1149e 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -99,13 +99,12 @@ static int max20830_probe(struct i2c_client *client)
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
@@ -121,26 +120,28 @@ static int max20830_probe(struct i2c_client *client)
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

