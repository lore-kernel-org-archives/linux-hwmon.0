Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746999;
	b=TqEwMG2tib5MfTDzOthwkOusqgO9ohCme/9UCVWDWXHn+klANA31QqX8FUGUYO/JbSLy
	 zaJkddHjT57/0qY0aGIRzk3RwDoRihKsQ76tsZb/8N3VHREJxT/yHsVmDkXc086cZ3XKX
	 aMLURR4iBUMlyXJ+mjIqN9lpUdGCI36rHe+xEpQyTLWejZosEDKSr+qTZt7WR0O8k6OKF
	 zK4MGEWtW5ZtueW8OD+hAKzhj24CWsum3NPUsA4UBtuH0IIxPp8Ao0t+ESGTBpy/xU1m2
	 1pNIzZZ6HN3A284EHhHmfO0yk2O438Je6HemXzYR9uQqYgIVppZytWfTOKmRACg9hMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746999;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AJHxC7HpXQNQp2agWYDiKBbOCWX6Q7GbX58XVlI6+mQ=;
	b=QMa4XNyesbkPwCq5j+3pqMh5MH24BoYxg9GrgkgwAUa0OL8s32abUU6SKu1jedN8Utlz
	 ULqacGXVrzxTbsAcVDYJWjWJZOxSd5skAZxZHH6N/U7hFusrwvB4RfqqcoVAK1GPkzQqW
	 /pH0cOsA7m/7xGhD0oVhR+i7s4pB4olasaSesySWm33AV4CqC2696PRbNoItQ2y2/+rLL
	 NT/ZxQKnLhUyJ3+rSKHzVARrudgnUfl6jGdC16BwMqjrmHQWYeOHHdLFD+V32be9ijcgU
	 P0Bvo1fNekUJKvNC84IgbNlo5baX8QmAe2N+bLdEZHFuOnOCVvokKYM4oqAeoKiskhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=sFhgoeuq;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=ZT9CU483;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6825F606A332;
	Fri, 23 Oct 2026 09:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6825F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=sFhgoeuq;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=ZT9CU483
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7GjO0820689;
	Fri, 23 Oct 2026 05:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=AJHxC7HpXQNQp2agWYDiKBbOCWX6Q7GbX58XVlI6+mQ=; b=sFhgoeu
	qCr2hDd63gaetgJ0YiL1e9V3zA3ZcO2fzfQL3zFDfUCh0bkENglrTWdKT7/+zOBh
	DHyHN68aDBNkqbo4Vt7vbf1bvEabf7wQsqHboJoO02FEjQdaONdBKzpFpRR8TQc/
	0XdBDWzcvPG2lGbtd4wGjEkj/MJ9Ez4aDAvaXUQGfnsWl4elZOmHuwoXXtxbFUS4
	ubhtuddcBCTYuBCplbDI9rQ63hI2tcdXTI1mXFTyAxQgWnxqGE0nAUemCv10u3bj
	tSw5iepgXl1xL8w41MqOyj/BUPu9lyLkcJR56pJj4+fE1UyH2n5lJXyDt/0A/BRl
	16F/9f7vovefmyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=AJHxC
	7HpXQNQp2agWYDiKBbOCWX6Q7GbX58XVlI6+mQ=; b=ZT9CU483ID6Ubm9x09hhx
	zRqKRFYTZUZeFlkBF3bFJIZ2k92DNTixC7BMZX3gsp0f/CDEMXkUsp4jfaWnW5bC
	EGLoURJhRHCwNnFzwuZcmeDl2IXEQFm0G1YDZNAjgDlGZohBNAYEM3XKYudZbCZi
	snDj0szUMIaJ55m4iTLFu3hqSaRvH4zIChKNCQxmjenIiPkbIDgAvy/XIgpkdqBJ
	tk7zutwolWmroLbP8FZivk28k88t/WL0fIzUdb6j2DH6Nos7i2i+1BslFSUBuOsF
	G/o3VFqQUf96EYPho/pEBjmkQl8rQjFozMj6G8hYXzFEfc+S5dFm3L4qeUfmE0Lv
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hfy3wsrt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 05:16:24 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 69N9GNZN049068
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Oct 2026 05:16:23 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 23 Oct
 2026 05:16:23 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 23 Oct 2026 05:16:23 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69N9FwZE023047;
	Fri, 23 Oct 2026 05:16:17 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <linux@roeck-us.net>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <skhan@linuxfoundation.org>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v4 2/3] hwmon: (lm75) add MAX31875 documentation
Date: Fri, 23 Oct 2026 17:15:49 +0800
Message-ID: <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX8jafJwd6saOT
 ubwvjiorRaaFjsH0JnQCjGWCBCEl2M5KgDKq9v4X1p7ufq5v6YVkIGb2LKh1imErjt9kXqXhvKO
 MItAz0GifnqZkBf9zFo2UkffA+x+ASXh86DBYsLpYi5GsB9/d3JX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX7ja30dJbXR0V
 2/44cb+qrVtMCLiaNXJ0i9G+xHOQfOGGExHFnG8YNKNPFc3713rk6PetzEAyj62v/EvHWmjEmHK
 nN47xgIfQMU+5ccfLUJFTupntm61e0RlUViNemBndi7+aG+Z99wy/UE9FITcocXGo6jYbk1anNo
 27s6WTWTLHRuMUHvAdiaBxf8/0JfUzw4MUSlUeDzp8dfk9V+ToJgJXxkL9wk5tWWv6ge4HglMGH
 yGDhDUowodDG5RVMYf/2C4L0psCcZ/GbAdJw0FdXJ3GySuuIvN9ko0+xOXj0NpPxBj9ngjwaCK5
 BqLM4st2XXqVGPweH3V/SUl/G39naVx5fczm8hfwDTYBnxz85e0VV6BNAFlEb81TeT2r50ZqK4Y
 S57oD5GxpQtZ1JueX8ynUPesc9ttrxP6aa4B9Epm0DtEPYCkMGoWYMMss6haRkXSw0k23hDAc41
 f4MNmjebfdKwrIdWjzg==
X-Authority-Analysis: v=2.4 cv=fJ+sTpae c=1 sm=1 tr=0 ts=6adb25e8 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=XYAwZIGsAAAA:8 a=gAnH3GRIAAAA:8
 a=sACn_r3pBwMRQ58zdiQA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: -RYl7HXxhXDUDZuOfPbmBWTOsdLGg7AU
X-Proofpoint-GUID: -RYl7HXxhXDUDZuOfPbmBWTOsdLGg7AU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230036

Document the Maxim MAX31875 I2C temperature sensor as a supported
chip in the lm75 driver documentation.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 Documentation/hwmon/lm75.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index ca46754e0..54a6a75e8 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -66,9 +66,9 @@ Supported chips:
 
 	       http://www.microchip.com/
 
-  * Analog Devices ADT75
+  * Analog Devices ADT75, MAX31875
 
-    Prefix: 'adt75'
+    Prefix: 'adt75', 'max31875'
 
     Addresses scanned: none
 
@@ -76,6 +76,8 @@ Supported chips:
 
 	       https://www.analog.com/adt75
 
+	       https://www.analog.com/max31875
+
   * ST Microelectronics STDS75
 
     Prefix: 'stds75'
-- 
2.34.1

