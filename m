Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904092;
	b=VcKsvsJ+O5lDUrif2ER19KZz8Un/pM+u0t3GgDL7Aw+zg6svv221OfQw5poeA242R80S
	 Cf5Q0j2FVQuszKm3Eo0SvY0wyC4zBZj/VG2/8OM20mX+yoJ8vmLBwx3yLO+K7+yLzplMq
	 nrwsgscWziLdxgMUA539YAySaTl05WVHGWyG5AGYoQBy0zTIHLVt78U2OPFeQYqzOjTAP
	 +OryR5B3r6CkVca7ZdQmneq2O+sQ+CF+HdAk0oxw2dA/ihyHCoPb1P1KvNMLKO1Pa/8wf
	 6nthbgctRKLrAiYFDI9C6fCyrrgxvNkLQE13ZgVRB5N7/c4Qxu/nrwpuwTmFvLfalTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904092;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DscZNCxPv0fPHpx3Aes+D+fGFEMnFYIv+3Bwh2H5Cuk=;
	b=aK0Oqw3cN4qZZHnU+gz4iNHGfvYRGhKpNqHUrS3nJ8GkKXzAIT+VMcgnJLHrRAEdsQGX
	 HtFltO7swKnSpUOOgBIntuvkvXwsInL1o06XkEm7t5929qqXJRhcGjXI3q1eX3Q3SeVQE
	 lR55UmR7OnzsxiTDu9YBZ4REqcs7kUqYz04tBteOPSj6oPXee0NDXielHUdhpp+ds4rh+
	 OF775KigN7pTriRN9NOFmnmLete7733frwGpD348ZMFZ52/ZfpRJXiWt/b+HdfRpKo2mc
	 qa3L//mtwXgaWCuOOquEemHL2NrhF417pVmT/8zwccNY5yTae6QsdUiuNugmRgjOBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=jIfHmrDH;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=UiHpTvv1;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C7606A33B;
	Tue, 17 Nov 2026 08:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65C7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=jIfHmrDH;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=UiHpTvv1
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8B1bQ1698711;
	Tue, 17 Nov 2026 03:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=DscZNCxPv0fPHpx3Aes+D+fGFEMnFYIv+3Bwh2H5Cuk=; b=jIfHmrD
	HFTmw5i4iV2vsxVA3FNJmlS6xTi1hPsKD6ONuIaA+NmnRKODW+k1rqqAYRlVPBJf
	xb6hCq5bepamC+JhcYBb5eqhu2tmzVzdhKaKLF0ROB2j3bEjVTsUgPPB2BKkiLCv
	N4D5fO2S/c/R3NZwM7LsWxHIa3D23AXoyXs25pCxX0/NisiidYs/T44yTPzglQj6
	St7mRKjx4vCgkXp0TricO/EDc400Co5EhG6irBD7/iL2oop10EmJXAHx62OuMHAW
	fxsVwfdiPM/1mVnu5HWpn8R6KWPdEGeGtzzyZTwWcVhFeuhchMRKBJcAZYg5TlDE
	Y/3HRmyTvpoTnzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=DscZN
	CxPv0fPHpx3Aes+D+fGFEMnFYIv+3Bwh2H5Cuk=; b=UiHpTvv19AHrDBaDYb29u
	8BUyMFHxEO6u6gx2q4jGnZIcyeTf6M4W8P/VVmN4TjAxDxXw9EtB9/nWO6Wze7z1
	OQkhnx0j+y13YPaRAKSZE8/tathxpPyGAQ6iWNibVlmIty1jZr7naAq6iAananDY
	0OIsrC8XxvnB0rKZQJqWYG5+3dFlWED1HGVrnBzqvN9Aq5vYlP4yutJh6Q3HTf4p
	Xg3Mq1zpYFGg+eaUmNCXUSDjBd03g1aXR/HdBOH4xMbu39+zosM7PgkwQxP3WiWd
	H/m/xe63A+fqr9pfKKcK83AVETCLdrwGDaRDZT/O5S2oxJ7z1H5W5/bOtrLZbiS8
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j0k6mr3aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 03:27:53 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AH8Rq2W046893
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 03:27:52 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 03:27:52 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 03:27:51 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AH8RFcn007690;
	Tue, 17 Nov 2026 03:27:40 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 17 Nov 2026 16:26:50 +0800
Subject: [PATCH v3 3/3] gpio: gpio-ltc4283: update Kconfig description to
 include LTC4284
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20261117-staging-ltc4284-v3-3-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
In-Reply-To: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz
 Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794904036; l=1152;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=RQ67mCYjLvFz/VxLW60cP5pPxrbw6x/+ompPyj6fcvo=;
 b=RQpLmnQOg0INPQm8cQqJ19YE2CMeSQSCEqVkkpW9h71aRxh7Pc6n0VNGeQ+HMfbORDSNI/PAQ
 q9byCRsy9CAB/JmD8Hirwd6FWhTJsFUfm/G5vaqOevNYfjrFjFhO0jv
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX38LBtWNR9MnH
 o97q+obXYr01C2tSG7wZGGjqKdgo5tfLCyfJdVjjAaxrqJFHwA+j/C33nDpxO1W46FK6Awir9EI
 IsAxW1ZPI+uTiXtyMYqxmTiuyZb+Ri0FA8HIFSl6qZgwePXKdSSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX2B3ZJ6wxbX6i
 9s7Znw4VE9Bp02B7XG+Q3svpX+8S3xnKcPQhg4tax+ZXUqEwQFD7IJJh6wi9kTH8uuBIIUjLR6n
 IGVTiy2jmkuwNB4QlEVNlQKOwkLk67debj/lCp1UAx8nrZbZ+W8mIb6wqpLD+Q+ubDzEdCIa1ew
 8fldKVI2t9VC42CVks/YHO6rTrv64M+oN6yhIJeRa8t1HyumFA/I1HMxbR3ewNvedX+aCcjrgBl
 WThNsDC3N4fdqKwvzVnMAtXPkaW2RffKbRR5WjMgW9ZZY6nwP7cZ/JwWkQuGXLNClOCzxUT2Yb0
 i/Gcdo+vmtPX/SmdWutRxtAD/y+19T9uGfgb+Dgef4n73hCJo3tUvKmCrBYB8skIMWolXiCYre4
 uU+DmhICbl6Qw0+2Qmg8Wl+SFqulOnKNFeYvdFCztriTat/CEmyngNNpIXinekvSGelQjhoRxhg
 cq7zci4pKOWbnlmbRCA==
X-Authority-Analysis: v=2.4 cv=O7OsLx9W c=1 sm=1 tr=0 ts=6afc1009 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=iYeKZkTQcfneQMIFD6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1K5nZtQ-4iJwo6Zwpu6cEwdMvKJ08nc_
X-Proofpoint-ORIG-GUID: 1K5nZtQ-4iJwo6Zwpu6cEwdMvKJ08nc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170033

LTC4284 shares the same GPIO hardware as LTC4283 — same pin count, names,
and registers. It is already handled by the existing gpio-ltc4283 driver.
Updates Kconfig description to reflect this.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e4280029d86e7701d9a043c89537f60bb70c6e..de9226619ef2f77fdded123657a14c15cbba07b1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1864,11 +1864,11 @@ config GPIO_AD7768
 	  called gpio-ad7768.
 
 config GPIO_LTC4283
-	tristate "Analog Devices LTC4283 GPIO support"
+	tristate "Analog Devices LTC4283 and similar devices GPIO support"
 	depends on SENSORS_LTC4283
 	help
 	  If you say yes here you want the GPIO function available in Analog
-	  Devices LTC4283 Negative Voltage Hot Swap Controller.
+	  Devices LTC4283 and similar devices Negative Voltage Hot Swap Controller.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called gpio-ltc4283.

-- 
2.34.1

