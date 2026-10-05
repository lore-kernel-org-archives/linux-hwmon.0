Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B68C480DEC
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203149; cv=none; b=DYGyKCV1RFuuMzj9tcEFF+AigOF33YuAB61v6Y6T0MfcID8AM1VfqfjGWCLB76u/whWd/8nMrH+6oRJ2lzMkzZ+0Xl0r6Q3TE5052bsF1EkijaL1xZRG/1gIDdPySISg7JWwStwiDKBqyd7drRz09IANc3IMTlwfoAPFsBXxKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203149; c=relaxed/simple;
	bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLPzQ+Mre16NM2KVUwx6VYnzXi3Rty1gdjgP5gDC4MhdFKJ+RNEV1jyhC4zYP5NUohJqZiHeCt8Qhf/r60dNe/VOc7tnu7qHEcd0vwihYh3c/4M2NyYwX9p1aYa9+GKWFbZN0M8VjCXzEOelpxzKD101kQKdROla4YeGmfIqhXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhbvQA7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2sUSCBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhbvQA7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2sUSCBh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFZSj1925992
	for <linux-hwmon@vger.kernel.org>; Mon, 5 Oct 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=; b=WhbvQA7k6MPbvR1H
	iTw0Z+Li9Y6zIe6AXh7cwGjYCQ2qej7Bg/ebIVGH8un+bcKP/qzq3sdF/hKWiEYa
	XTGunCpVZy651e/3Nmb2ML7FAGWtcIB+7IVPw4Sv3t9y1sRw4fYV9rXNDA2VNm6g
	YK+g1IZYP+XGvkhNCH2R8j+LOl7jC7+fWkGfjUs7vV32ZsM/vBt3AZLZLnmsJRNP
	j63DCr7zK12PmSYbn0IypozRW9pPOKFqTdngQQwOSWJs2GACr0yKhOWqlo75P1it
	itpWQO6HltJT+wkYENCIxnF0xeRYuNYmmBTAn6hWpM1PfV9yyEaUEx3jcza/8zvP
	IdPYYw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyt21h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 12:25:47 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80a4a17618dso3597659a34.0
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203147; x=1791807947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=a2sUSCBhHfGxZFnJekoCxhT3DFtIN2tUB320/sFTAzUPxw1tM43JmjYrusONnQ5+d9
         YAaI8rCK4U+arqMwa7bb6rQgoMFOYTnQp++ByLr6+mDJQDNg6JnaRoKEr0rzbfB/mkoR
         m5nW/TeGb+badmXxX+pML5xrX21USHhSz6JltCb3r3ZxEBIHjSeGFTb/p/YEQyI+Xuzy
         0AKu+IPSlzN+vuD1dzLPFx9TfSVNKqdG94ScPbVlEcrfdVyIrGFDjZ/bx8ukr16Z8NTm
         Sh0M8vvLQyAKNAkWIcUIaF9Nuy78cE9fvnh2Njzbod9phd1GvQKAQsUVqBFlpTA8HRlJ
         HYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203147; x=1791807947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=lTS8AOnWIioSi8OOqsEwFXjQaMg5WDmiHySRE3kI+b/urxMMMSrO/KDm07nAc9WrDK
         +oC9hIduwhGIn0BrRgQ3cVEKJde28OKx2p/MfZOGBJlbeFuVU0xs9c5SddczbFHJARDE
         K45hXiqfo1Dn5rR6j16jsV86W2iKU4c9gNx+j2aVNr1QfpfXo+RvNMvvtTipdS3tSp0c
         yePvTpcVaah37zTWrt9h4Numpqv8ox9yrHVpf6YnpuKHfKJ37+c9LNeIW43m/BavRbDQ
         rUJ+Hudm9ZpKU9gZybwjYjEMa+ComrLtOX+KyYlzBJFUjmbbpIQ1Ifn39hIEd2K2Go44
         OszA==
X-Gm-Message-State: AFuF++kN3Px1FzUIYUP5pzajBC3ox0c9boR5tcEcyQ7fhWtk+pECI3ws
	xk72Yx6OKlYRoPP7wG6HU7/GEFKCoHUgZ67pBAhDXwkFcJrPQXKhoqCFsYGd0LAh5KnJeCb9ED5
	AhKY0UolVo+qz2aOuT8s8Go2rKGvdRmB0qNRwgKBCN4HzXFZSHK8IvpsbGuSAnyEzBw==
X-Gm-Gg: AYBFou0lTwczrlOwh6wifIXhzG++9Ct7nfEiTJPOdzqSbPC/f/3eZxSLGsARoKPxLJq
	WGJY6BmsFUlC2gU4SjFpvpnaSTICl0E8NPjTO9j1OvY53JaaQA94rzSlCDB2zMSSGzyzt8sUneg
	vKgfCPp4+aJEEB6Tgu1wlLdDiCQrffCFgwECbgN2R/FxaGIOP+9bM0l55JEa4Z1p/WHMDMJDEjl
	UDq/nVo57gdGLiobx7vtax8sfeO/eHIfRrHNlHzQ+Xkzqodk+LEj3+PeqYQ6ptFPjNE2X2hxXDI
	J3O9wm5Tot6ev8s0Z1SrV7Se8ooUIwZ8hph9J9jRMFWaDCFqQ7Rc4NSVyzDWlQcBlr6hQjXLZ+E
	06VnidQjptkEGVcNkFnsbbamO9eGhad5OyA==
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685980a34.0.1791203146857;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685950a34.0.1791203146398;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:10 +0530
Subject: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1199;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
 b=2YmvEU04ZjJsOIe7WGR/kTsTv42jYKJlGrvC3JtJUxoGdnXBz8gCE1n1MBhRmG+M+ECTXHo/Z
 pMXGg9n45SEAI3uBuJ265mAcdNWfIkl0nL2D0C1+cy2LRvedZ734RQ/
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: tMc_HNn4qiamL9BJzrb5F6Zfz2CdCG-x
X-Proofpoint-ORIG-GUID: tMc_HNn4qiamL9BJzrb5F6Zfz2CdCG-x
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3974b cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX+3zHsuWxGoEy
 sslXyJ35//LsCX9y2U94df2Mv+fhN77tLF+TBwAMghKa9I3itgjPFF1bminZ5spJr7S2DeuStkT
 SenejlUsoiR8D0RjVQCAQ1n1TerTzDkW1JJiXCNvDLbWRxqWg0m0qHNBYwS4GgD/pxoKcRu0icB
 JDR5iJKflA5+tX2ryGyVQFAxvRh2HFZ4UIMaMcSfN9dWSTtkvl2diz/wgAhJkTq/rdOHuAVO0mx
 wSnYfA/sHVRsX/tR0H/0CDAAYlF+R34yRCpR6MOU37D3oBy6lcPwXTgoNx7Sj+bNO1o0D+RWUa3
 mmaIQQBnPsjHuX9Y7YIZYo0p3cq2p6BIxCf7PWhSBDX/XYo7Rw0LDQ5OdYBeS+asutOPYROlSU1
 s2n1gdotqxmlPjpu8o1S+lqg35eva3gwMh1fSLJ9g+3xHTYgMxupAdPChSFzIPtMZDrEqxkZsVm
 Z86xDgsjC/0iaHLIs9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX+Vt/XcFpkSsS
 vVJUiW8Hjvx9g3QEu837GgILkXEbQ5eO1Sq6IUw4ZmlT0FIxMirl6cVL2mKhsyxsTBXaLe70tFZ
 KnLRZwqyR+zW2T+/Atr1lFLG7EHIjAU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

