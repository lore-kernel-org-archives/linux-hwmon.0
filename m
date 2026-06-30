Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C23C4162;
	Tue, 30 Jun 2026 02:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787649; cv=none; b=OiWyJ6MZLaB5d/Hm5c/pCaQqohqpnTmJXC/jfXTe6y5dFA+DnEpXIgC475gVJCnLcIgFx4ATiaWJHElQQqfrlrS4UpMEAQlLMJjG5Sud6rHYHb3rDeg6EEFd0AEVGUNU6Yt45c7TTwc0dtGSkn7ssF1BeigbVUh2uNdbpQLH0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787649; c=relaxed/simple;
	bh=XZ2gLoijtXPZ6e3Glp4wWBTcOsrGtxAXCMT3FD6BAiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GLX1U9jdcHo5Bd+HKqUxmLOJV1Hp/ePnTi1F2atZUhrP3ruMSj7Kk85eTLSDi7ylf1NoW2lRcCaMdvoirGemUPSN5nwIWQvaGNxKQs6YQ92LcJ+INBKZzK7LVEv9hbajbi0jaGJldXZKPgb8Egxo0mDl8pkws7qlPDjsYVoBnq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=w5pAbLAd; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="w5pAbLAd"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1GQvP3610831;
	Mon, 29 Jun 2026 22:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=MnfiI
	GROYu4DjFpGiYMZWABH22WgZxd/HFJOQ+3+seY=; b=w5pAbLAd+7TVcMOwEjenl
	0mA5aJ6LGU9qR+ug2RfXqKmsizdnfrE8imYhJWargtSLA1DuudqMu3DgIoKEyUYP
	sELzsmdgN8KmL6duUsmVqDgRLBSKZd9t6aMdQZXeuUZ9vaJ3DfT/S0dJEDZJINV/
	rGLgXpsM+zAyb0RLXRVilACO0U2pH4gtT5dOHpKonHwjO2fLffDXVjWX3XpTKHiH
	P4ytPphK/Q5u80ZwMAi+NxOVwXZKmAnP3wQ9ilB2V7n6cQy1tw8fYjLeJWsd3dr/
	KIUSaeBdFwPQtxZ+sy9SssjBEdCjqoGJ6tvCj3ePlYvIZuOxs5yh69LVJYiq2mOD
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f3u1mte4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 22:47:14 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65U2lDHr032983
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 22:47:13 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 29 Jun
 2026 22:47:13 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 29 Jun 2026 22:47:13 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65U2kqhe019448;
	Mon, 29 Jun 2026 22:47:03 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 30 Jun 2026 10:46:43 +0800
Subject: [PATCH 1/6] dt-bindings: hwmon: (pmbus/max20830): add enable-gpios
 property
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260630-dev-max20830c-v1-1-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
In-Reply-To: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782787612; l=953;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=XZ2gLoijtXPZ6e3Glp4wWBTcOsrGtxAXCMT3FD6BAiQ=;
 b=WwY8fy6T9WFTmSbfmx8Sto6wU9pqqRAsZCxbv6roNidCut14vdeR5We6XdA4WBtQzJ4DHbiYn
 IFEcCBlbm25BnNQSuMfxeeXtSmlacaQrUDwz9yku+an/FFtXVNN2iPK
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: lvGgmD7Rn1YFwGFEAOblorXfVhSTjUFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfXwO7aWvL75SRz
 24UxATZ6d6PM9CJHyUY56vHF3pzIekr0PBO5MCfbAH5C9OsP1I0Bq8SSFIAE/eIzeiOM9W39A33
 C3FaaLWZj95+QDrMVgNTxawH/iw8hPTkt79ytv/RPj87WxU70/bYd4KnSpsWp4Y4ErlJDnGpJjx
 MqBxIZdjTow/92eXHcL6lBojFQ+qmplDU1VGtY4iDIWdSz81QsFZK7WTwbM/vowprQ6BCvx2R71
 Wx8DfsGMaDObH9WQVGLJxZY8T2qlca1bDJ0rgI8OHbUay1ha/7W4sReSRhaPNk7s0TzW2LtLjh8
 MWxeeXhzMTgy4Gop9T3mkSIRZOfnEeNcVtSwnHtpNJ4yogBvNHNtxUh2mcLerBL0ho6LWtxfjac
 th6bNTcZZGHX25OMBOu2wltj2Cm3FC7TsbghnOKUjESx2Wg+fZRxvh3dS/I1Bbv4Abb851PIwHC
 Zygc0uemhiY8TxhC2wA==
X-Proofpoint-GUID: lvGgmD7Rn1YFwGFEAOblorXfVhSTjUFk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX+jdimWP3FBzU
 kwmvLi2EF5tryONYRmmBWZb8btb0Gk5v/Vl3PwqK9b1P59RzK6+NUnNGLyJ5AERE5Gdak5aZXnW
 sWNSaklWra4q7KuakgFwcZxa7t5dBLlGRLOQPAXSTXl5GAZIGX8i
X-Authority-Analysis: v=2.4 cv=R8cz39RX c=1 sm=1 tr=0 ts=6a432e32 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=-miqoWLA3F2nhC9BCoMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300024

Adding a missing entry for the MAX20830 EN (enable) pin.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index 1625dd59417f1b3ca689a9c86ca266da913d1217..ab8f6324866f29de8c66c3c63300845b2e02207e 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -39,6 +39,11 @@ properties:
     description:
       Optional 2.5V to 5.5V LDO input supply.
 
+  enable-gpios:
+    description:
+      GPIO connected to the EN (enable) pin.
+    maxItems: 1
+
   pwr-good-gpios:
     description:
       GPIO connected to the power-good status output pin.

-- 
2.34.1

