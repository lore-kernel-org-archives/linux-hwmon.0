Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695463;
	b=hG17Jk0BJtfW7Pjgvk2zHFfRUHrhsBQH2p5D+7bTVHbH2aqSaV2qnMtXv98UxjEavA9R
	 HqHabChlbEbWClDmfDiybSZAuC1lgl3/xj46MkWr6X1KpWTMIEWAe/Lu5umPFA+0t2dCH
	 qUid4JoR7MXrUJaKiz4G7gq533Hc63rwBdajnZ9TbDxJr08lPvv6sZNl5ynRYnFtRtxmq
	 OSWlhWe9tAojYoj+FyJD2AblqNjPfApnFZGIeAJtXt52CSyanqql2RiLX+Glp1CYTwOhi
	 NH1Z+ugre6U/33agLgzmMscZZSw5uyZvYSgOl+2PjV5wlHIIXA1Za42LFjSUZchzWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695463;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6WWZYnhhueBjATXg58ovdwh2HBYg1uGLStgT0HVuLNk=;
	b=KGjpJ+Ctd8T0XDOZhX4hB0PepfkeygEKwdao0DDhlkKCGW3cNe834i0jE6f20llsC/y+
	 uie4hhVjzWB0mBp3bU4KIa7JL17MV7WXLnEcrOoBDVOnrrlPYk5BMdb3f0xc+VLJd6SDm
	 T4kdpxfFQ8Lo7tm/OsZayXue7iFb1dG7S6rEvKOHm5AOh/z2QSLltjMyE83+s5hskkBgn
	 tCWQ1XwqlmZwQtOGl8xuDuuuHNbrtTRD8vAhGGJo/k/GnKJd7IPm74YAk5rVp/sK7Jtyd
	 RglpftwAF6UM66zab27wD2mmiwnVz5f9fv0LgbfDA8jTEEIcveztHX0xlnIkUamauyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=B1u8sNm6;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=aaHXLQXW;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E19606A94C;
	Tue,  3 Nov 2026 08:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E19606A94C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=B1u8sNm6;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=aaHXLQXW
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37dsMd3328555;
	Tue, 3 Nov 2026 03:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=6WWZYnhhueBjATXg58ovdwh2HBYg1uGLStgT0HVuLNk=; b=B1u8sNm
	6LkxIPIjN1KABMRFIUx69g+Ct2O4k8LlOWgd8MV+/ljQjja+tvoZayic7fZjf3SB
	l+Q+fB6lSjhZwx0MGlolY0eYa+b3MuTF0JWwHW0xrxC5olQJHh6QhjCNvMwDmSn7
	5Uaa1SbxmSXxwED9qgNTLy5txE/85/bM1dhuBrhwCF8RPX+7b5F6t8xezvfBpHdY
	cUuxWpR6VbeVD6IhM3xVR/BiavbpNnnrckL0KCKk9u6T+FEYCiEz7ugq9V4fuc3F
	gKL1OLjuFyuvsxbaDUtGl4WFwbH6FTY5yvQvPgoPyCq0r2qbqxakc9zJ9Akf5UV8
	AEpI0XSFYjm9Wrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=6WWZY
	nhhueBjATXg58ovdwh2HBYg1uGLStgT0HVuLNk=; b=aaHXLQXWYTI/sbW+r4hxc
	rlfTPMniujgf//KCNcetKBTYoRTsVNB8dwS2LYBx6VkV7kBwY/GtXd9KD7KQuilH
	NIavLSB0qe9D3Z/U5PVWkPWdTPkGF52Pd72I0QEgn1zt+P2EVf/7gkl77BktSnI0
	B3QOLYgBRBrIs0QUUzdRd7SD3LBVS5X7/4NlrQs9UY3rRKx4DFEpqhF5F36bMrLY
	djptyHAyPtcJ8TS9FFjfP1eGRQ0RexVZKnnpA5476/HXX1GL3P5dw3l8YIMolOKy
	Av/pas6Iv/+vexr7ttpmmpQrlieUOSh8XfiQQfZ+3vrNR7+xVCJ3v5qZ8LHvYOmD
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hq0nektu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 03:43:57 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6A38huGX005061
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2026 03:43:56 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 3 Nov 2026 03:43:56 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 3 Nov 2026 03:43:55 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 3 Nov 2026 03:43:55 -0500
Received: from CJONES7-T01.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A38hdTZ027828;
	Tue, 3 Nov 2026 03:43:47 -0500
From: Carlos Jones <carlosjr.jones@analog.com>
To: <linux@roeck-us.net>
CC: <alexisczezar.torreno@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Carlos Jones Jr
	<carlosjr.jones@analog.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: max20830: Add MAX20810, MAX20815, LTM4739, LTM4740
Date: Tue, 3 Nov 2026 16:43:30 +0800
Message-ID: <20261103084331.449-2-carlosjr.jones@analog.com>
X-Mailer: git-send-email 2.51.0.windows.2
In-Reply-To: <20261103084331.449-1-carlosjr.jones@analog.com>
References: <20261103084331.449-1-carlosjr.jones@analog.com>
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
X-Authority-Analysis: v=2.4 cv=C+d8WgP+ c=1 sm=1 tr=0 ts=6ae99ecd cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8
 a=MyDsyiNJ8zDsQQL9eecA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: KtKx2_anlq_yELxeF5heis9aDL48weDw
X-Proofpoint-ORIG-GUID: KtKx2_anlq_yELxeF5heis9aDL48weDw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfX36KtdYYUqvAL
 n7kZyYNn45N19DC4ncO3gKCnFG5YBF0jOFiXsxf/G6rHg7ZemMbfgt/dLO2yDc0e/IpjCL+TeuA
 YFoaai9tJE61GitH6mMvw/94SHeANVBM35g6CIJlr/VSLJAYchmW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfX+bZUDd5FV95e
 r/rKEwR+iaGOp427PUUB588IzD3S8kvnMUKpbrRbxu/6t7KxuHTKh12APSODIIuvgptM/IPxJuM
 FiAZzHSkOMrf7URkgTBybtJO4vy1Q5qSvKAj416R68TdnMjWoTTsj8i5yHV/YQANAzrk96aKsy3
 NVkUCZhBUxh8PjNCmp4a3IYoCdYmBdn4tTvRmV2IlXYgYevKwOw8eq43irMpvEb6kqqyIuBa/WB
 utsme9A7VB64WXE2dB9+8gPzT1jTL42yNWouGsWUqXpFPkIJueFtvnaAtmzl/xsjj2MT2CS7nUk
 agRnp/Gs5ZwrcQBixKZvAc9/+3crxa+xPXa5e+hQ9sZfs4EhQ0WVNbACmdOW817JGqg+zVZ4TPT
 2t3jifQFalhKU6/c7ht/ilC24Hot6ugp1ae5dRoWcQskG8HZPn5n0ztSD6RmWCqbQsM4ekDjmTr
 5N9TjQYxK8rxZVTZ00A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030034

From: Carlos Jones Jr <carlosjr.jones@analog.com>

The MAX20810 (10A) and MAX20815 (15A) are members of the same device
family as the MAX20830, sharing an identical PMBus command set and
telemetry (VIN, VOUT, IOUT, TEMP). The LTM4739 and LTM4740 are the
LTM-series module equivalents of the MAX20810 and MAX20815 respectively.

All variants use the existing adi,max20830 fallback compatible.

Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

