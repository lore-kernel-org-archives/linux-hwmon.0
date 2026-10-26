Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991015;
	b=OsLeI/qkPTFQNHEzrxuMTnnuIHGxHziB/TAzto9zzfVRk8zuGB7C+Q8WjkYuKA3B6bUU
	 uW3MdPkSuQ8dU/A/diTrGOUtbw3vMP5zdRjoEz32zDwNK6EMhatEBlwwsFnNDY/bXwUaZ
	 XTcNzdznqQRpuL6dspg0y4l1Bb5VCpt9qP2XIWRWHi2I4GubqGqTfO5bnrgONI3fa0LcA
	 zdUnT/kQWOYlt2BCACDjkatjDIrKv3Fs0p0+5lbxCjId9VZwrYPLeq2UjPD/517psSoTA
	 CijXhD3xzQlCMfIqfLLy2yKK8gjCgqYaXOO4d3UmExvpxdNaW0getrtFhK5nOdM5fHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991015;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vT0+zXTmG/EmzhQW9D3zRNY20EvRt94/oKoyM4sLpWI=;
	b=E+f7bcIi8pS7jjHszBkbCls7mkLsuOZUHbHyzCPOwScHmjpA0c/7EQDNR1lZrFyyXg0B
	 3C0MWzVmr9O4ZQNlUvUUYj+tbdcCVY2Q5EmkkKKabkI9xhJ2AXR1ggqlZnhDmvbchhndG
	 gCjD2Ph2vzA3maq7Z27baN1DqdMaGfISkVjqgASEMQCqQ3GzcNtby3Ci1WtQae2VQ/hyK
	 Gywwfl9KTwwW8f909xr5KPYaQdldrO2vkIDa0KXctUrRCMKXLpmwyXrdyEIAQIBd+Cbyh
	 6wyo0DlitrLLHbt7tTiQmGaPQa0RV/MkTc034hojBhGO+xphKju7BzPIL1tS3Ntf7Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cl0C8Iu5;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=wmILc5c1;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC409606A31B;
	Mon, 26 Oct 2026 05:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC409606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cl0C8Iu5;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=wmILc5c1
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4t2mS4132700;
	Mon, 26 Oct 2026 01:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=vT0+zXTmG/EmzhQW9D3zRNY20EvRt94/oKoyM4sLpWI=; b=cl0C8Iu
	5K1vRp3gC9CMhkDOcinT1J5117EZhGCcVKYxrp6Ps9idUQh71AjCCvf2QfPNglIl
	ttWFmEqywLA8V5hY4fy/0iy6L+745QGEPivY69vrmpRgNzQmA5VEDVArA7zX4E5j
	YyFnddWyKkSDlFmOZInY5C/625ipkdwfEEdbvwTfoUTQoNHr10TXeBvIf9vfhq4z
	15KfFAvtFDsDOGCnbLS+syBz95HKzn5QQOfXug8Hd+GKvS4TrAvLKM31lNCl5KAn
	cdV5HBHJLNJaoeGkLcF0dOml5lyv4UdCN5NuXEYfPV7MqDP8P6RWPnshGbArrCti
	9O9VdKoAqgD0HXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=vT0+z
	XTmG/EmzhQW9D3zRNY20EvRt94/oKoyM4sLpWI=; b=wmILc5c1IosF0M04ZJHZ8
	r7FDZHEn8HwvsLMNZtAwKzW4xHRwhk2at+RUq1+AGF3jctfZouqYDIsq+883M7tN
	ifgrV2vOZg3vhNc3jb3KRgvlXSCR0VlCXKHaN1GW61i8gqMBdYdEtz+WQw3JZi1N
	mk6WGoWbnE8MC8iXxGGMIKnECxpsA0TC6kyl2q26xitsq/3yvMQpTW19ersqcrNf
	bD6DK96a+LNRLL6aUI1s9zE0B8J0SgAb4XQCg/TbXaEuRPc4Lvsz4mbVjAI8rvyL
	kcDzX6DXVWk4V4QTgO8M7dgJoo3l/K7UeJU+uJD3sP5bng61v8XwHC46bo8LBPn2
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hj08m81mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 01:03:09 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 69Q538mc000987
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Oct 2026 01:03:08 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 26 Oct 2026 01:03:08 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 26 Oct 2026 01:03:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 26 Oct 2026 01:03:07 -0400
Received: from CJONES7-T01.ad.analog.com (CJONES7-T01.ad.analog.com [10.117.222.42])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69Q52g3o018821;
	Mon, 26 Oct 2026 01:02:59 -0400
From: Carlos Jones Jr <carlosjr.jones@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: hwmon: max20830: Add MAX20810, MAX20815, LTM4739, LTM4740
Date: Mon, 26 Oct 2026 13:02:40 +0800
Message-ID: <20261026050241.100428-2-carlosjr.jones@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026050241.100428-1-carlosjr.jones@analog.com>
References: <20261026050241.100428-1-carlosjr.jones@analog.com>
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
X-Proofpoint-GUID: grFJvO88psFi7ukgE0xDpLVNqbz-b3kV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxOSBTYWx0ZWRfX1VPyziGSJ+m3
 f3Mc8S7uXUlIqjNDuPK8yEfaYxl6uKCPVnTueC4Xv9UMDhQgYNrIqC/k3YG01gRU7ofEqqit0lp
 QTQcKyrPRZhExV4OuTDYbBF1rCKZco9XUgHPsFj97N6912hdfkLJ52UMe5SFLOnFg89Mj+O2yoX
 RNJTwONblHGOk7fodQH1h/ar865bFJe/eiZFkWe7o5UYmoX+RNkoYO4Cqvc/D89gWPkSgF/73XY
 CTpHt+3gl8N3gpJUUyqIJ2qn8k+G5fjrSb4D1eEyEw8inODyj1SUC409RW43v4ZAcleObdPUgeg
 W0Eef9XalPNUBwcz+yXyDHLX4a430E/3C03BIJkQ/h8JbIaauxrHZKJfzMuxEOGbLFQglFtEnr7
 3bcDwuv/YK1S/hMPrTTEn7U8T3vPha11xhz9WbrxKHWJD6qKJJ7Mu2+OeDLP03vmtvZ2KOhJhjb
 6YeTrxSboZ0OfLlW6cQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxOSBTYWx0ZWRfX0ZUYb7sh7eK2
 62q2zPhDx1eU8FFsIbY8i4MGYXhqlw+U/E8phpdRQ4H1HNZHOBGtc3IBMHWGtd29sFmWl68cEPU
 3SVlQ81kFo/kLayZHvQvrA4/7m+M91jrcPAp0+n38OGH4hYVzJJK
X-Authority-Analysis: v=2.4 cv=LJ3z05W9 c=1 sm=1 tr=0 ts=6adedf0d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8 a=LkTFOP2xGKwYGyyeCikA:9
X-Proofpoint-ORIG-GUID: grFJvO88psFi7ukgE0xDpLVNqbz-b3kV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260019

The MAX20810 (10A) and MAX20815 (15A) are members of the same device
family as the MAX20830, sharing an identical PMBus command set and
telemetry (VIN, VOUT, IOUT, TEMP). The LTM4739 and LTM4740 are the
LTM-series module equivalents of the MAX20810 and MAX20815 respectively.

All variants use the existing adi,max20830 fallback compatible.

Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
---
 .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index cc50a4ee44a2..8194108d61e3 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -26,6 +26,10 @@ properties:
       - const: adi,max20830
       - items:
           - enum:
+              - adi,ltm4739
+              - adi,ltm4740
+              - adi,max20810
+              - adi,max20815
               - adi,max20830c
               - adi,max20840c
           - const: adi,max20830
-- 
2.43.0

