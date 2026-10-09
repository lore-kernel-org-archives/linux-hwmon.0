Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1138FBA45;
	Fri,  9 Oct 2026 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547035; cv=none; b=ab0sOJjSZ2aOpB67fnnHurLMre3GktZmmnZLS3vXd1hvpXg58OivUu89JW1BUwDneO3cG+zufzZl46bFCvHbDxxY0x9MlSqUO35gqUvtHmaAOw6S5S1AxWRcqmQY5GYegjBSMb6Ty+QUbzY5QDSKc8e9ovZPLAcLfYaf4DOxbkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547035; c=relaxed/simple;
	bh=NM1WdLmsHsD6dsD2wHxs/bcrG5+MByru8jiHoQ2dbqs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZnWygQ0/rOJioqAawNjc27CzxwKuturya4XIF/IZM653aI1ceS7cQYXPBMhiugQ2c1Q91cLqUlLqv6woqJBsFUL7l8mglmQ06STFpcTeLtsRcdegBU5KR2kvG0pSeaOYods7oInwS6+FopiidqVclAvyV4tpyfT/LqqtCsNeNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=O/DLUh7q; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Xj1bemJs; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="O/DLUh7q";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Xj1bemJs"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699BMuoc906208;
	Fri, 9 Oct 2026 07:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=ZoC86GJFXHBzzuQ/7+tW90kw/hyLexlEs3UkF5+giTo=; b=O/DLUh7
	qFmjixVwK5/4HwOTs4+z41TlDAL1uVtTQ5cjTFgtbrvbG8FfwU47R/pJXtoSM/g8
	0b6WJGtBs2dMGKBwCuXI5Fq0TaRSZhOWzyYOp4dsss0mOVP1Q8vKLK0uAb5f1lCm
	oUTIZ6Dy+0jK+7ivE8ol3hH14Y8SGNyMTuW1wwBVJ1XiAk4JyHXkgCA9f6g3/aQ0
	yckPHHiRgj3tswPGv3NRwAJU0nGV+v8PLU/h5HmPg5AJOSmsNXBdvooUePhe29tj
	d9sji6h9skHWmfAyb/ErngZ+iyZDCNxNA7XUDAfgY+3V+bge+vVbL+bgqXqP+Q4V
	pQM/ClItn3rUcGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZoC86
	GJFXHBzzuQ/7+tW90kw/hyLexlEs3UkF5+giTo=; b=Xj1bemJsIb4urTTWX4DaL
	26OBgCTYVCF/eY0ybNJelYj4oktyKO64d49oEpjmVDa/YtAku5DDAHg5M3iM2nj7
	jeCn/8vnwSRF2G5eNZF8qWdp/lUfASxNfbY/VmHkvn6LLOdgq4J8FWlV6yyUJGXa
	/UePqG4ONAen5Fw+vkbjIdPd/dk2Dqk6JVJnHjtzDwsqQSH9LV6HNmm2EKc8sNve
	IDx5Kmt4Hu8J1wBDDCkEZ0D9SGsWp3j9CrNEU8sml5RnK1F7rbfohkGSZPdlSdag
	4fSE2qrOrzYnNCEdU/+PDhD9aC00iC5QW7HvFahX/RymabzVdKei3flOK6ENcXHH
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h5xerjudq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 07:56:49 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 699BumYU041961
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Oct 2026 07:56:48 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 9 Oct 2026 07:56:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 9 Oct 2026 07:56:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 9 Oct 2026 07:56:47 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 699BuPt9014045;
	Fri, 9 Oct 2026 07:56:42 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <linux@roeck-us.net>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <skhan@linuxfoundation.org>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v3 2/3] hwmon: (lm75) add MAX31875 documentation
Date: Fri, 9 Oct 2026 19:56:16 +0800
Message-ID: <20261009115617.1976-3-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
References: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=SJTXx+vH c=1 sm=1 tr=0 ts=6ac8d681 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=XYAwZIGsAAAA:8 a=gAnH3GRIAAAA:8
 a=sACn_r3pBwMRQ58zdiQA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX6nLsuDZT0tQ7
 Z+blQctTnwPquCnqpa4nzxX08VoxBc9L2qiNgxNkicPLiILXDiIVIAasYrt0kXow1YK8DTzINxh
 caezUNpBpHzXc6KAUTV0OUSBGx3GuLViZYIskK8F5mlWgmso2vUmHElfG/G8OYkLCEIkDZZn/vH
 NgU8u/2kmqjtTsNeHvLZNWdZQxZDvxm91E4lbL1Y+bSJnSWOLC3nSncgF1uRdBo61Zcg7jdqgAq
 lqpAErBP7/Q/zcDFwIaTWaON2MTYMkf+tWAh/9HKzOmOe1UEMJdQ+hxu38MyE9r1xMrbJwUdJg/
 TAVRmX5cZJFlHHxZs+EkyTgtMgO77S+dsx+VGC162ioNrhWrfOuDb6VlpzDZloXUHHC0tHo40Jf
 v860uLOb07X5XV3ECOsnnvwunhc9WRCWlIKQww8ajXtiUokejUlTGN/0w7oDSMcVYrUp+gjrpgE
 5Eg5Ji7eqtEM91QIOIA==
X-Proofpoint-ORIG-GUID: PYBbmUs1aDD9n0hMVizSiehQcad-PsY6
X-Proofpoint-GUID: PYBbmUs1aDD9n0hMVizSiehQcad-PsY6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX/EbErxB4Dq6C
 s/Kwq0gKf34rEXXkBlYj5fA7iwE3FeoWe6lx9lGQ3XY1Ma1q2o25kOvrwi7yG+HhmOlrBT90E0+
 lHUxZWbqXxiupi5SXVHuOGHhdEe/Rex83ZgjKze9s+/XKskM8fR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090047

Document the Maxim MAX31875 I2C temperature sensor as a supported
chip in the lm75 driver documentation.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 Documentation/hwmon/lm75.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index ca46754e028b3..54a6a75e8a71b 100644
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

