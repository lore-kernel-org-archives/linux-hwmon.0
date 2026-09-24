Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A13643C7D3;
	Thu, 24 Sep 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239328; cv=none; b=a7TnTo+s4OR7JAKCj6NqgLBmp17jJWxa08haN3+QSHHZJIfiOegD179jGN8QhMdkyJtn7evQTyMzdRTt5q/aZGlyvsVUNpkFabepZLycsIODhACDnhHVWSAiWDTZGYPEAzECmTRWeTUSatFsi4Jsag++oMXxfrnjiwQVSVQ9MqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239328; c=relaxed/simple;
	bh=wL1f1jrY6mmhR9ppj1+a8MhZWaDoWOTvBGdm1EO9o3I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EgD3wzvVJ1VeXWOzj8Q1mcx2wbKwA8vqov1leK5yW60rtR69rg+3SW5zPFaXWnl2LVHqtLJOppunHR4hy49qFI4lM/ObNP2P2/vdkt1ZDGI2Y9L9Cmn+y7hEDye9uasJH9Y2B77MuK3xy06kdttmX6B3EXAG2ayPUZOnaeZWEvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Zn5G/CYx; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Zn5G/CYx"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5c39L3206633;
	Thu, 24 Sep 2026 04:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZgP+x
	gjBZOkHRKa97sYe5+CXwFdTCf83s6Uka9ZodWw=; b=Zn5G/CYx3EPgK2JMS8ckU
	SQLu9jp1Tldy+L5VDwixaLHRFYL5Rv92HMjaEk+at4ke7RuN7Mgqu1CR8gBibzeg
	fCTr9KvSvKXkh5tNW5ked+F/11z7sOVOKgOfiCCE0zENiCKb4KnM/PaSXFFu3p1I
	cFNK1e28P3YmLwUYAfUIRaRba0EOUh6JPzX8m31m9B9LBNDMZEoJ3NeebRymiVzX
	8bYmYfEE/jd1TdoXoc0YcomwToOjQQDhixQvByjBnLuXqENgb7HOFNLkbVMYl8lZ
	Mg5/nnY0vBMBYc1p0+86Eu1Y0I1F4tMUkz71SgGH+KLRdNOlUR+KkLd0Q8Pz45bS
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gvv5719y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:41:51 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 68O8foc0016352
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Sep 2026 04:41:50 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 24 Sep
 2026 04:41:50 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 24 Sep 2026 04:41:50 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68O8fTpL015604;
	Thu, 24 Sep 2026 04:41:43 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: hwmon: lm75: add MAX31875
Date: Thu, 24 Sep 2026 16:41:19 +0800
Message-ID: <20260924084121.82-2-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
References: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: jZXnI8vdPsZAUjWzxc9t8TKZQhs2v5ZD
X-Proofpoint-ORIG-GUID: jZXnI8vdPsZAUjWzxc9t8TKZQhs2v5ZD
X-Authority-Analysis: v=2.4 cv=bsXZl0ai c=1 sm=1 tr=0 ts=6ab4e24f cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8 a=7hXW9hI_BR_B06nm1DoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfXx1qlmalAbxcb
 prlAhRbor50R0Uvd6dqio6cZzzduGS8vRxEp5G4C6ImVzmoWtJhF13oTS3WUegzA+Jsv8EPlhBt
 gCCIvdjZpN8IySFdWh3vmDeTt0iPy/eUUSmqaL3SYw+Zt8MVxAEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX9cVXB8cffUlm
 Ok8zvtcBX2F69cmEuNtcs6xrbQ26QKe7uFR9Joi27nb2VlFkFOYdiB7tfnzDmIRfazr/TE9otsu
 oHVQL9UntGB5cmQA0iTW5okabEGmJsjF5khSK7rNFV5ajTor4yFlndx89qvXAmiCx7ilcroiFZz
 WQzwvW44Kpvwkc1JC7oe8l1KNpw9Fqgh0MKd1O38mK+qWjPB9B8lxuLqSEPFM6zjx4S5BNRuB51
 QEbh3cHg4ipLFn2BgJYbHp/Ay83FkgGTcwDSfbxqkqVekg7ejYfDB/XRr8LGOFAnb0sdVlpI5S/
 qCqVjJPnYdNuT12OhBhUG/jOMUipnSDSE8r7+UpH7g24IojdNqhyMv3h3V5T9vNGbvjAuZum6wa
 +qKCUnz5VCdJYZr2zl8dhgDBNQ0YuMTc7RfdDjAEJwys5RD4eHtqq9rQntvKHyvg9fzFaNKskfk
 gChZms5HnVi9cvHeBMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240036

Add MAX31875 compatible string to lm75 dt-bindings.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index b48bf3fd721fe..d56f3ec299105 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - adi,adt75
+      - adi,max31875
       - ams,as6200
       - atmel,at30ts74
       - dallas,ds1775
-- 
2.34.1

