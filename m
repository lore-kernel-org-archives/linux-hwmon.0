Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C938B7D2;
	Mon, 20 Jul 2026 03:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517338; cv=none; b=qLPr963KAYO7XTp3wjSS2NLONmPpiXBJjcXzVTYFJgrvwwWu8OGnjJg9dnvRV4dJIowGNHxYcWB9jPVsD8MBJJGRNFsDI/FWm8zaLh0HYv+uL+KSP3aJ+WAOP9aGXbKUTEZ2NjNRQOeAV5UFmdNQGHmgBka5SvwbBOWhh2p1cf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517338; c=relaxed/simple;
	bh=kjaX/N0J4k0Qbohi7pWb4Cr7bmClXL3maWg6hpb687s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LZL+zpnZh/9WjGTsMqN5PuImWPF8ayYB2+9UXxCSE3YKii1eehtuUHRryyz8TVYZxt5lp4dJG3n8zeqv4dLbd8vBYiUcKyEWWQQpp+AtTulbKKiIsgMVUKEfumXrEIJG7k/3XfAVhnK/mq1ny+pL4fY8crtV+kVnYVjo8OJYEOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=CMGuRU9e; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="CMGuRU9e"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNuXt1585674;
	Sun, 19 Jul 2026 23:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=4O+b1
	VwYUV1PO6NJvto3kojMjTuzIsGRocbBXHVeaQU=; b=CMGuRU9eF13D2wszJIFa9
	6TQTdbPjL9/GFxJhp+Zg6UOhzIUuOeZ0lzE/7jJPSih0n83Yj4KhVPsHmDUYWyDN
	6tY3bj7QP7lNUDtB/VoOUxlAZIFiBD5IjBVvr1pkIhMHhkSrJcIT5D7h83x68Aqd
	kZ1xphnqkDbDWcc4y17zn6Mm912g7YBXydyrSWxMMWa6vik0apGaxy/XDwpAapd2
	B8SmVX9jeGaEupAYQlhOFiSaIhshm8XZTdPwnCaZYerj49xOBQv267inn93+rG8J
	tM5gLQetjMTx7ZOD6hB4oVNOzju9ATrozX7prMQgXxUZPma5W/frU1/y8IUOcZQz
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fg3axw2jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 23:15:23 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66K3FMDE054399
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 Jul 2026 23:15:22 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 19 Jul
 2026 23:15:21 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 19 Jul 2026 23:15:21 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66K3EoFW021622;
	Sun, 19 Jul 2026 23:15:15 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 20 Jul 2026 11:14:45 +0800
Subject: [PATCH v3 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260720-dev-max20830c-v3-4-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
In-Reply-To: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784517290; l=4454;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=kjaX/N0J4k0Qbohi7pWb4Cr7bmClXL3maWg6hpb687s=;
 b=O9fz88Q8aKFOA7jeYbYWr2pQd8cH86BnLZg0lQAJui5Q1m8CofY2DqzXhTxCfKEM3dlA01MEX
 n0kh38oOXfBC6fHFji5elpskY3lN7tgK1agTe9d+qqVrxVHJUmk3i3Q
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX1P6FbUcglEcg
 ve2/YzBw+UviMtJKqUy3gd3xLfabV7W4ql6utwxZGgCbyXlLURmGaUCwKztqssnDTeX3OOAy9oD
 LnogWisvPcNr0clFt6aVyazFT2Tm0K+iYNmgsMhpm0yxvWZrm40AT5eekW6TrUMsROhY/rH4uTT
 ubfeGm7UHGESoYww5Wqsxv9Gs0Lhkw1V5D0IJnDUyNpuE074bRFEdlEMLCTNv3F2o3tDzvK0br7
 vJ3N8niqAzEjCltwwoFoYzYwjlfGNCtDDhe8HfI962v2hOejVbwrvaOBvIB1p4vEwGadThgdVDS
 JXd8IQuc6a39Tkwh5QLvhZdhd5EgcC2nYYignNtD4SVzKR+UfuTCFqRyTefUdo4Xxe3bYWGDn7Y
 tfM7s8TmLV+jjozT0zF9sb3Z5ZfBYsoSmjd6D3pto5SeBzfoxD5ABXbFJ7kPrMZl5m5PZAadMyf
 VuvL6UTsOsFIDLBlRTQ==
X-Authority-Analysis: v=2.4 cv=evjvCIpX c=1 sm=1 tr=0 ts=6a5d92cb cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=v52DSUhV1VzBc46Xrp8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MJ3Azoo2mojZv7tJ_xVVBN1kWd9GsQUH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX35H8/J9DaN7h
 Hqx733w7ULYaTC7TtkDv+RA78ymYYdMVZLVNSCCXp8hzY/ZRLF0D+EdPC5w4Qu+mSiAZ9cccJae
 AMg51uFpE6j3hTcNfp/57NqAmlVZlHCNwyVBkXG91Ughoo2qZL8q
X-Proofpoint-ORIG-GUID: MJ3Azoo2mojZv7tJ_xVVBN1kWd9GsQUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200033

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
index 7a5e67bd33c0a8b84511d138ac5f5f48334a0a45..73fe59685cf157cc27c1011ad9cc045486bbeab0 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -98,13 +98,12 @@ static int max20830_probe(struct i2c_client *client)
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
@@ -120,26 +119,28 @@ static int max20830_probe(struct i2c_client *client)
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

