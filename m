Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496793;
	b=NJq+4+9OT3TxesVHLglj+uj4isIAHJBjS1GiXi1odFCEMdCHKYoEqkTSJFsPyoC8jyMD
	 9NSiXbBq/3d6RhG8IOhzLY7p5dj+CWW9+JE96xwGpbpcgIEt7icghbfux91G//IB8pg5E
	 LRwBJYoJ2RoZqwCQ4t/UNXSnelD90r+ziIbR+m2hUHvhIW9esp3PCaAuBBvfMnN7YUGPt
	 A/mTd/a6Ko/KrtZjeonya4++GP1UtFJbP55tQXK7a1qzJA5KrCM7vyPV/X9uOsR6J7jJZ
	 gJAibQ7tMlvPhhxOsBWF2AJoFyCevp0YTbcfEharTpcQ1E7XRrWQqjgQ45vUoLpooKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496793;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0fGxgS5WLwiHPd/dWgW7OIuYkTSUUl1Dt+vcyfN+cZU=;
	b=zlmeD/uwXIGAFLbxnfTDZ+mTn+AW/8heeqFZOilV3pqt3qbhshpdu/wiMn5YesN9hkPE
	 BTaD9fYMzwMOtUdj48AzmgqBvsPHoO99//S8abRt05sgxDBaIhsdCXXp2ZWzbW8U3MKNL
	 fbVEMEPLfhmK+ad4VGLXpXCk19pobTLOQAy63I1bsNE2LPtW3os84oJVWl1PDifj/kEwx
	 JKS9CHsnbUV+athOHDiPQ9pSSwc6CBMRBir/13OwCRvffvWD+DMiN1I+yJfT4GTBFrkEO
	 r9tnyO9RpTOU3d0pG2vw3YzlrOZT3udXx7KnYSkdNs0V0T/YDZh58Qrob6Z2+F9wHYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="uTu/pTJU";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=ICjcBHMj;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221B3606A31B;
	Tue, 20 Oct 2026 11:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 221B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=uTu/pTJU;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=ICjcBHMj
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAB5Om2992921;
	Tue, 20 Oct 2026 07:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=0fGxgS5WLwiHPd/dWgW7OIuYkTSUUl1Dt+vcyfN+cZU=; b=uTu/pTJ
	U1hXnLxKhZl2tNXRH5YI004HnhBf7LQJ05FF7V90p0HRvd0gXmliXVNLdpxIvLen
	7eeKKrGgeOw5Yfma1n3qaCQJ5KEHCm9k+0fTQ60LP0RtdNyFRmb1uM4vmCEbK/5n
	78u4d8khofseq7UjKylFbKSwFuGk8CSw3uaM/WpovYxM7BWwbBZdsDdLw0TmQMxZ
	3RgtF2ZRZRpA+onkjrom+uHHY6PwZ0luUpolU0A+bZVkbOf9hkWdMevbVujWG9yU
	7Oz+2j73XAl6BkfMKyRnCxOuJWpq7gorqdhhrf1uj5KZWLb3UQTwmq3d3f+bKF7o
	NzbRMhT+xk+yGsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=0fGxg
	S5WLwiHPd/dWgW7OIuYkTSUUl1Dt+vcyfN+cZU=; b=ICjcBHMjZPdpaa40GvWMh
	O9ERCEh0OGVB2KWNEOYzEY99Urh35P+juImLR8AyOQd2KEVU3RQEx/6Sphu8QvN/
	pzZ64ImJbBC/AGeA9XgXVGPNvClxyNp3Qd3dOfV8SIP8NU2vwAe9/eIMZd3clKwT
	hYOfWR+rpXmGzWqyfNhEKNSaw+9TzLCFfhbnhQmvbD9GlbBH6ov2L2QTsJH2QfMN
	N2jv6mbSIdOJxrJTcUdfR/e32ZfJOAUDI78JG1xZWc490kUY8FFF2cwTvq0ALq18
	OsZRefj0pueivsLl1FD7NApPp/GQ+MT4fJzsrmcc0RKZxDKCV5vtVJJC1ZmF0Ran
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hdw69u7ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 07:46:01 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 69KBk0AT027434
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2026 07:46:00 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 20 Oct
 2026 07:46:00 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 20 Oct 2026 07:46:00 -0400
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.216])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69KBjZVj012172;
	Tue, 20 Oct 2026 07:45:54 -0400
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Tue, 20 Oct 2026 19:45:32 +0800
Subject: [PATCH 1/3] dt-bindings: hwmon: ltc2978: Add support for LT7175
 and LT7176P
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
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-upstream-lt7175-lt7176p-v1-1-86b9b728b95d@analog.com>
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
In-Reply-To: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Christopher de
 Guzman <christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792496735; l=1345;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=4LZwthkM5BE+X7ipPo23i+IUr4MpgfotiG6+UuoxvIE=;
 b=7Yeasx3D/kP7Xw6zkQmWmPS58pL87dX4+CqBgHT+3SR4H3nfAoP9O55WfcgDwD+muh9C87kKc
 Hx9gNtL+c9rB1X3trCukn6+t/eRxHxlREgAFDyOEOB3pFIQY+Z+Vx7p
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 33EO4NIipM2R5FFzuBQ7y-rtG6PUx_VA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX5pIjE99fz1wX
 Ek/Vvhbqme/PHFj0qUIZnCabOfEBi9wvO+NVn47Ej/80IEjRf5/AxNmWempOr5fhEJ/sne0pNwI
 /JNlXhxNxZvU4igyc/4DIicNKYu+rAeXZsRYvGy0s4vL/v9P22oO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX9l6xxkocwjoe
 aEvJifMg1SDnKPmbapRK+Y7u46+wa4tWBaAvGyv0XdBzTBi2lI0ATnnIxhT1kpwoyuyMiPqx4HT
 d1f5zcm3TCfHoqr99T5CUvxrFHQiUpLFe7+5UHU7cEKhy/WD4HwV5rAKt1npQH39M4Ojbx7AZW6
 j/7zSpO9Dqou1ELfffJpLyAb9DRzTp+dknYoclodWt34gtI3NVpR+QgslcjZndCGgk+2tNtwjAZ
 Joa3RUCy3Ywfp18lQDYELwv4xDj9VYwTAuqSVi3O4qqkjn2YzRWVntGFMapwWehRHGf0n1XAYk6
 VzPBXAlBherCTf55jvNCRc8BGjWdWPRwwoEWVCtcOC02psOTmUNIUm6eQZJQ8MvK0q14IDjZj+e
 gbuZgxIr9Db+FgoMfJPILIcpOl3e09axV9O3/lYh7e6ZL9EZq0+JM8+gkatmfBnya3/cynT1mPR
 wdKKE24MJw5+SVrwD8w==
X-Authority-Analysis: v=2.4 cv=cdpHPXDM c=1 sm=1 tr=0 ts=6ad7547a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=-ZOyYidC_C2AdzT2P28A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 33EO4NIipM2R5FFzuBQ7y-rtG6PUx_VA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046

Document the compatible strings for the LT7175/LT7175-1 and
LT7176P/LT7176P-1 PMBus buck regulators newly supported by the
ltc2978 driver.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
index ea8b1553a3e9..467c6ab4a29f 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
@@ -14,6 +14,10 @@ properties:
     enum:
       - lltc,lt7170
       - lltc,lt7171
+      - lltc,lt7175
+      - lltc,lt7175-1
+      - lltc,lt7176p
+      - lltc,lt7176p-1
       - lltc,ltc2972
       - lltc,ltc2974
       - lltc,ltc2975
@@ -50,7 +54,7 @@ properties:
     description: |
       list of regulators provided by this controller.
       Valid names of regulators depend on number of supplies supported per device:
-      * lt7170, lt7171 : vout0
+      * lt7170, lt7171, lt7175, lt7175-1, lt7176p, lt7176p-1 : vout0
       * ltc2972 vout0 - vout1
       * ltc2974, ltc2975 : vout0 - vout3
       * ltc2977, ltc2979, ltc2980, ltm2987 : vout0 - vout7

-- 
2.43.0

