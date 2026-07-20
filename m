Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB938C42A;
	Mon, 20 Jul 2026 03:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517336; cv=none; b=p5SJKzZwi0P2Qsgxn1e2sUWsFdBc9cf2fS5BMLT4OFcOSVFili6bUuzjH6rTN63kR1n+mEVddU46cW4KOqOcwh3z0xmzxO2g+vhwoF65e6A+Dz87R4pjdIkyyuIpe9qcSwI6Qo7wwlVISRoVBJAgPGxZFSXcpz2JEeCCFfuhOoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517336; c=relaxed/simple;
	bh=5g8Dnxx69PBSR1rQuA/7t1j7VQIS8+yxojE8MWhyzps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M2V2i+7RJiijK8rizZIrt61qehkvYN/ZMjzLkNJxpomOdBqXF7WUdQct3kPfgXvnvPIHBpdWSnVzZxXSnv3diSgkWHNGQ0HLPTdST+rIg/2x+8rE5iLiG7yIJo0nXBMaf7h8bAzuNPkkO3tVWFwQa6FfiGWnoHfLqy1MsriksAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=M+oXT8At; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="M+oXT8At"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNuXt0585674;
	Sun, 19 Jul 2026 23:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=TIFDp
	/uhWBZi5IipxdwlpT25q6I49VFqfZ7u1ol+RTA=; b=M+oXT8At8cFh+ZPaeBeKW
	lNpho9oukBwOH4jt9LWzS4bClGr9vEEGwJZWdjrA+gd4b9TG0k3hsO33UkBhZuro
	gb6v9rWasvj8FDd1Zgu2Z0gy+iC/l1+PEptiM0Ne8UQ11z6OZKHLACbW0xh2JT/L
	refwNW73VIrgW9ba3BsEwSWiH+cqJ6jp0eEdI4MX9mvkU52x7Nqoypad+kslakGO
	dHIaMbDt6MOZ+S1Si4A5hFzoOgRKCuuQ7ZJEdUeJFLba3+UAiLMrMmNvUu7CRxhi
	CXp9o5auO+gB9IYGvOQl2efp7SYpr3eGTrP+z3j5Jc8MrYNPVoB0qvrHA4ZIEcB0
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fg3axw2jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 23:15:19 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66K3FINq054378
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 Jul 2026 23:15:18 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 19 Jul 2026 23:15:18 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 19 Jul 2026 23:15:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 19 Jul 2026 23:15:17 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66K3EoFV021622;
	Sun, 19 Jul 2026 23:15:11 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 20 Jul 2026 11:14:44 +0800
Subject: [PATCH v3 3/4] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260720-dev-max20830c-v3-3-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
In-Reply-To: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784517290; l=1157;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=5g8Dnxx69PBSR1rQuA/7t1j7VQIS8+yxojE8MWhyzps=;
 b=636bHH46kKk5FSvEa4j5arAL/8o34/yeW5cDE5LACMXo5hHgyiCaw310P8SsbuCK8P5BITlYi
 ZI6ch5kiD3zCSo28CyE4GGW5OxcsHtWHbixX514ZU1rGFphx5v7fHOx
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfXyNStOfSlGNs/
 WI4YpNOZyyDcDQjWiQ+h3kPrxxJChdTyvyaHpgnX6yV6pnZUsN0Z+C89URqqggkyzdBmJcnDPMT
 9GGHmhMWaW9VG/CkEqIoMMBTA5g8W7yCmxgDFiBFM4kywmMihbGquDw4KSf71Wwt4eNPhmzK9cg
 ZWTA4389TCYHLDU+1OsGWsflbCIQmtoigx8YS4V7JdEk+w1OdCZlhdXJKp4vpO3BNg6ArDM7mVB
 CtC52nJX6YWfvAun0rvlrT5cD84oy/TS0eRg/ayKcD9598k+zI/3LnF8peYEfWCZbfElh/+EwgQ
 mR0zZZ1YDEmBBhNpHGmuRY5K+PoD8hidCJ8AK8Gf7kNt47EL3MRrZ5mlmsxLbitmh2GwmkR+Ftu
 zyc89oGptwBzxu8lcZK6m/2Wmc8Q5hReUHAwZTL2dV9DROxiFq0arD+q9ohumHyEdzKEwakeVVh
 lamNY/qAQUxUlhDDfKw==
X-Authority-Analysis: v=2.4 cv=evjvCIpX c=1 sm=1 tr=0 ts=6a5d92c7 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=EUspDBNiAAAA:8
 a=gAnH3GRIAAAA:8 a=wmL6Cgq2dR32m5AAhy0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: jUcHJZIXOSKKRo5UqlXo_GH1Svs2mM0P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfXy92LBoFR8trs
 rUiWdjFd+YxP9FIUAx86ozFgbc+q00j57OE9JHZKYWbPfpHzImZ2lVRs+O6LSTKBgGMhgyYz9LE
 vliCh4m1C3f8xDj0OCthJfNZ4ICuzwTTo4RCqNYTfPa3/EbQzVja
X-Proofpoint-ORIG-GUID: jUcHJZIXOSKKRo5UqlXo_GH1Svs2mM0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200033

Add compatible strings for variants of MAX20830 which are MAX20830C
and MAX20840C. These devices have the same register functionality with
MAX20830 but with a longer IC_DEVICE_ID.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index 214adf1a3b9e9efdeca7db3bd7679c70656e9a7e..b7d3b6152b58273a4c35581bbd66ec293fb2e925 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -22,7 +22,13 @@ allOf:
 
 properties:
   compatible:
-    const: adi,max20830
+    oneOf:
+      - const: adi,max20830
+      - items:
+          - enum:
+              - adi,max20830c
+              - adi,max20840c
+          - const: adi,max20830
 
   reg:
     maxItems: 1

-- 
2.34.1

