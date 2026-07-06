Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0152937C10C;
	Mon,  6 Jul 2026 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303781; cv=none; b=lyUUHgcf5B7RwQZfO1H4sLLX3xF783q2MYiaBXUTO0INOcEhDloVBEFLu+tggwNtiW+TdqJtVear0khLV7y4YBjFdjZNg6/2Bon6wLE+RahEK734pc0+HLzYouTM61zNFFEItn8BisKan41TmxCNPdAAaQNUrYwXM32MsT3twpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303781; c=relaxed/simple;
	bh=FY6DhRBSCbuAv1mX2WJkkFl/GQ8VI6luzmeqLlgxJ3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CZ/yHTIMndvb24w6G70spWf+WdwUB9yIGovs8/i76mEaA+w59EgxECYwnzjHC+KOgTKO35f0r2Xxi5T26NoC/ci6jq6rrw0M0oGi4Lo2vnObx1OGkyuVWds2uPVBVFSEdawv2wue32XUVng++cMX2Z9rjzdwnnMP+AqIuOBfjLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=JE8PK7jN; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="JE8PK7jN"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665M3wtb3185218;
	Sun, 5 Jul 2026 22:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=5fI38
	oEgtXr9lSDXisyQvKjX+vK7hxI81Krkxrk187w=; b=JE8PK7jNo3LWNogs0N02W
	rXxzMLTQxWfaJvuyK+ewebBqNQSgHFH3/iSAHz9eKbmSKIj1DfTj8CHl6Wp737XX
	YFr8Gy1Skb5K7kKLoWiPsDtoHYGEXyrh+YUSjrctVg4HwgIih6u22ewZHGvG6Aba
	g09ytiYIWnrKDUdoekZaXr4Ns2kQt0FwJCIAGJ3VWYK7uvZTtgM4udrXQ67trIIc
	YZYkmLjoDWVdJsDWeXBdHt7llp8hyvTVUNjzM52HGoOODMbvyUA5NwGMBd9Q2QTe
	9/NZjRt91nRg3COGH14H48KuRtofPDMFBu7jbEUslx1Pesflle1zI3iFL92mWUgh
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f6y31byww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Jul 2026 22:09:24 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66629NZK045196
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 5 Jul 2026 22:09:23 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 5 Jul
 2026 22:09:22 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 5 Jul 2026 22:09:22 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66628o7T015791;
	Sun, 5 Jul 2026 22:09:15 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 6 Jul 2026 10:08:44 +0800
Subject: [PATCH v2 4/5] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260706-dev-max20830c-v2-4-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
In-Reply-To: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783303730; l=1084;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=FY6DhRBSCbuAv1mX2WJkkFl/GQ8VI6luzmeqLlgxJ3A=;
 b=yWg8SNkNr436ZduJyQN/3ugIwv95xfqWDXGuzh0WdGNU0kn0q7JK04NDIZXs4EoG9E0+xBedu
 +4QQhdErJECASkridNgVZ1JpiyEq1r0Rl8+AxEWLnBjazu0crpg3bH0
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: SdCcNq5PsYvAMmefu8fFjBdp0hD9Lm9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX8OaoXg5WvtFD
 938TXdwLlmvNUigEyLdw0RXq8KZ3wWznZ/3Y2vkzo1zCZCTo+Gib4B4Q9rTZ7O2jK2sP/Pexejz
 /2a16LoSlCeOGbKPh81yp8DAZn8Mr1CUsZx2kaQ/c6mC2R2jNCWDgHkP7+cRf3QngY4+v6YvyTG
 99T6zU4pTXlH4bci3D39s8/ciFSLFl7GRZl4C/ncYlfYKkVaR00fNnGKrfaEmgyhoKSfT1QNSf6
 Y4bHBz2y3yPU6re9+r77kzg/tgt0Bn5mSvT1jQwWNhvnOpfVmXNWZUoSogjCqQJ5s4y1VgxhhE1
 rmuo/2z+mXtiAdOtnYWOgZn0PdMMKvU6idRmNxvWcEM7X6WqQn9imDvPTXswrrHJ+2x++LiH4i2
 buhlwhr2gfTXtUmtybssf2VVsm9oKQvcPfp2DG7F4H9twxMvaZPPEEPFDa5H4Eu4QblAJugbFxg
 U1iU746TgJsrinqNJ5g==
X-Authority-Analysis: v=2.4 cv=AYWB2XXG c=1 sm=1 tr=0 ts=6a4b0e54 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=wmL6Cgq2dR32m5AAhy0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfXy6ZYGLU1qhGC
 ncZEb7ZPFGzV0llCQNF6Do9oyK6eBBKFXCjWzZpOaDfyPxlH6vncMLcFwMY37KJIBU5pil/KZ2+
 G90Vp/hnjnld+fmqe89ec2ZhcsFRcGd986WjZDgRrqL2cdGJYvnP
X-Proofpoint-GUID: SdCcNq5PsYvAMmefu8fFjBdp0hD9Lm9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060019

Add compatible strings for variants of MAX20830 which are MAX20830C
and MAX20840C. These devices have the same register functionality with
MAX20830 but with a longer IC_DEVICE_ID.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index 3d62c03abdc30c8aada303bad263e972219b33a4..826be4d818908becc1e185e640a3b684c6df004c 100644
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

