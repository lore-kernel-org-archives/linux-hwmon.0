Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185839;
	b=qjPCiYORGid8f3f+d0Wj9WMntvsCg8f4/4o/+E7mXTbZbGch8CQH2FwKQJXGhDNPUMty
	 2PG/+yaP39f0K0wf1ksrPvwWSrHpx8h8sHN2hhqbWqoNm+0S0E3/zXEZ7chpIXHP2mgk/
	 FYYu4swVUoLYJ7MAc+/XsmcR3lvAApwzNROWFm9gTN50diuyNXCNtThyKRhD3pDCOisbf
	 cO3JYGyq+7rHzpkUq3AZZuaI0pwmWNVttXLCSPKo1FnA8+7VLThUIhRIkRt6cv5LZFG8/
	 uJK29TUAsjGSHBXfiDZ+4h4+xElmiDAAq6kpyrmaHuMc8xE4J4O69PJlIRvfs5wasKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185839;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DscZNCxPv0fPHpx3Aes+D+fGFEMnFYIv+3Bwh2H5Cuk=;
	b=hen5ohSmajGP2VQ7xYUVMOYRpPfZqGpRRjlSD5yOy5knzs6MX1R7pt6Ubz9dg6nqJBB2
	 oilCVg7bbuL1PmO8B3UkH0YUNnt+Kpt6RhLJBWrJ38RHfv+70sRemawOp0ui/AJ9NoPLp
	 Xz1DJOUeWwKA40C0zh7v/0RSDwfC0JkcF6+4Q5++4OGD4Y7tMlfaxcwAAWES7+HZ13OmQ
	 OxpCqVeGPfilws6wqG2+lqG8qaeB9bjBDzJHz4QdZS58SHYHouEN95Q07ILohNbzsNre+
	 Vk8vBgSqInZacbmQy32R5bEv/RRo5eLPFrHR3WS84uwRUAViBPoggFDcuGsMQyCFIIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=s+N+K6Bb;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=ChWg9Jo8;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF075606A320;
	Mon,  9 Nov 2026 00:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF075606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=s+N+K6Bb;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=ChWg9Jo8
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90GXXq3370632;
	Sun, 8 Nov 2026 19:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=DscZNCxPv0fPHpx3Aes+D+fGFEMnFYIv+3Bwh2H5Cuk=; b=s+N+K6B
	bremXRYl/SUMzyMhUk9HomDeNSP/o6N4esXche9ymIdx9PEohn4T8HqnGqzGpFtM
	lNYYbH5YaZ8lptTu08t4Ke68qoRf2OvXHgYDlioiqAUMzMKtn0A8QOc7iNygYjXV
	hbnIW0AClhG5UaxLiMggMifhMLIXN9ZprXGFBPZUP3ozeXb1d/Nv1bPgPMedDxKE
	vrqbFledrfXwpdYjrldoCy/asRSaN+pEDJm00FqzFL/TPxVTO8aCGk+psLcMy1gQ
	2UP56YAQ54A1a9b6u4ICr6FDSnP0W2cMSAPGkbzMS9HaMw5h0zItNnq2sjI9MDR5
	xdHE/6ayq7Ez2Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=DscZN
	CxPv0fPHpx3Aes+D+fGFEMnFYIv+3Bwh2H5Cuk=; b=ChWg9Jo8onNnPSWeyWlO6
	/tgayE2dTqSstk9vmLON4/sL/odp32+KAnZfCv4Xqu0qqr5djen1Qzm1mv59dnHd
	CPorGkuCeKBvX2hc5NyGUAx/LoboC8ihRgHizU82KYcdMK/NRMIaiuW9IO1Y8YYu
	ge4zqZvGRrOaO6i0HJZindngRXdhYYiOv1eC+XUvFpUO5OIAGjAPBbCUszEBaKbj
	76XU6ZlV0jqcwW3/X4856cyt3kMFQovhSEk0L04E2u2qk6e7n9SoY4eez4eOsf3f
	OAuW7J15ue0EX9T3V18les5n7PYxXXQJX0s8Zn503TO3/zxQ2HSDRul9Zi2PORzA
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4htp6kkhmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Nov 2026 19:57:01 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6A90v00I004245
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 19:57:00 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 8 Nov
 2026 19:56:59 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Nov 2026 19:56:59 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A90uNDp028853;
	Sun, 8 Nov 2026 19:56:50 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 9 Nov 2026 08:56:19 +0800
Subject: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4284
 Swap Controller
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
Message-ID: <20261109-staging-ltc4284-v2-3-14a270a38f7b@analog.com>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
In-Reply-To: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794185784; l=1152;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=RQ67mCYjLvFz/VxLW60cP5pPxrbw6x/+ompPyj6fcvo=;
 b=rZtPOTd/47IC9J31d23ZGYESfUOoZ74woLr9fCUpeutFBGRi6a7902uccYI8zQwAeMIkX6LIy
 3oUBkk4QvvUANBqtGEhnjvIoa8znWTw8Kt69MFhSS1xPG21hg5ZsLa0
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMyBTYWx0ZWRfXyPF5FALmotXO
 hmovxHzV3G/VnLMxr7fbDg0u+dM+23dYkGrJLaKsHd0kqIS10bZgUp3GT9oykCYODULLFZCtvoH
 hVL1qh8IzC+Jvkj198DmIK4LEumKErtIKzYtoF7mmnaO6q5xf3mU
X-Authority-Analysis: v=2.4 cv=C9l8WgP+ c=1 sm=1 tr=0 ts=6af11a5d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=iYeKZkTQcfneQMIFD6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 19ADfTsWs0zSo_ZjCOPNtyOjRscbiITC
X-Proofpoint-GUID: 19ADfTsWs0zSo_ZjCOPNtyOjRscbiITC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMyBTYWx0ZWRfX4/egSEObAjPe
 SFAuygOSUgAruk5dE8KplShQTyUDULNtW61niW4mhC28sNQowKcSdLO64Uls8lzVnAnYUtyOMpD
 HyFhvdCDUL9EfaFHtIZOwsn+Q7rgkpPA1l89LF7cxVk99e3hzAbqmkjq+FMbei0CFCtYENURFva
 KpXqxSjbBT+FdmryNhIFdvIPF5T7YMh2SHq5U8foj447n/lDb/VWIsDgHwkW+OdXkyKXUIFEoyX
 4y8Fp6RKrFjzdBl8l3/nDWX8dUh0AwQjgSTAcU4gn1Gx808tZsFvrw1UBE/4NRzj2yRz4Ej/UAm
 Ld/BlDcmPadI0aGdO5S6euWxOPW9CRqNERtYnAiQSjO1PD6fWnppr2f7I+63KnwD+t2coDA6k14
 O5hKZtyzslHeeIfYqg6yDKsbdsvwV9FpWtUHrCiHhkoAfQa/+MyBkJR0/V6xLjhR5TZjd6kuZK6
 JJkcyjTiMCvRt1kI7TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090003

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

