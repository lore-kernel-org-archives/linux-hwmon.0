Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0492E47F769
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203144; cv=none; b=ZxrRKOZZ/HgaoASnmz80YdTvgnT64l1DwZKr/mxWD2IErqqcJITW9nmOckCONPNKdsBcYvQbJuY5bOZnrTn4ljGWNBMspaizsfOAliUi4g+2ltRk3lEbfDxk/Tnm1Fkcnw0zE09p6TX3krFKItyH9oyFnNo5yfsL1xNjh26guTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203144; c=relaxed/simple;
	bh=WVv+nmg5vqdtT2D0t45asRyQhLWqhx+jIdJ9Lz55kMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgI3k/fHsnXK/uU66RuYRGd5L94Sh5Ug2xFaDZ/DfsFzRNvtjepid3dJZNL1aq/7IxCA8nhUIV/ErE3ZmgxMCekORedmBm8kX/TYwLf4b80TkhHoYQaRlc6fiRwrCvOJyESnj3EDBFDJuG7gIELZQpye4OVYHPhvXceOFiAnVCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIACho/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGkpa0cF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIACho/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGkpa0cF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFSNn1294976
	for <linux-hwmon@vger.kernel.org>; Mon, 5 Oct 2026 12:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=; b=bIACho/7NXdIu1PH
	1G4xPaMB08dTykt9/XT3oTfVXnk8Enyq+4I4aUeXrhc4CzbvXU1fxE5SGZtPcRsa
	yElcjvp7+CZSIw/N/lKRqi3y5zkBJBe5uJWPTgtEFxz9Q1b1EDj/FaYToMNUFgh+
	0COc9M8RvmzC8jZx2OxdSmBUQ5mCebYV6wcY8wR2ONNHAGsm0qV4HnIhG+LZ1Fvr
	YDRlr6pAhcBzeJcBSVsLeVBQ3HiFw+LmIaQDLgTtP6MlDpgGlkL8f924hTIz8ots
	6gsqxDR0BbFba8iMiikGyDIO2TvZJBytUgcE0+T/V7mBqFqMJPgzp5VS3hNNp6ib
	+XJFbw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn9r5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 12:25:42 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-823c86bb798so1422780a34.0
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203138; x=1791807938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=;
        b=JGkpa0cFLULCjtZnm1ooJyLuybqQyakC0cPVO2bjfttH8ABfIFWe7WdGWxpOIVcRp1
         djkPZsa+qBGwvvqJ62rb7O4Wo+u8IDKGPkOdllNZddGA8i6BytGkO3Ykcw8eWMV1c+Xq
         TH3lrjdVv7cAZvx7CUX9F/kVuy1ORPGJXuDxWboM4J5qKq6eqTGeksT9nmJFAGQRE0Dl
         37gnxXybl91v+y2dXnPJq4MvVTcl1VdFuxuNvwyGa3z/2NI2k6fsZT9N64tljc8HptvR
         J0PMEAaHmCiZ7RMQXuIyTlMxm+Tlk0T0eY4dBCwGTjbVMGYulpjuDn2tDwZkFlmsk3BS
         5MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203138; x=1791807938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=;
        b=YoLl5LUSKC85ZFwJ2TkKdyeazwsIv4rZAFkxdt5Y/aN3nYidIieZGmm7MMO4WZYvpr
         kcP9yzFX3cUHV9AtuvpdJtj1lUI1fVRhmEmwaTyIN7ceMtQNua/OHJPaqJQFtVAK4IbC
         8ifxN4yCsga7L/hruQX/UIKW0UTTjeAMgDD1K5bWz7XSyV3dWObxea51szaMUKj0g8wq
         WeRDog6GBmAtB270qCgdNm7tWvXPbpUPLwg+pISEqu1YZSlqmb32y3I0mu1A4TbSz90b
         mPJkJXxVOC6LB6IrBYwKDFvujmYZ7R3DwrVyWfg9ZdqXP1GbYSnEE9FpwzH7ryGHr3hk
         /mlg==
X-Gm-Message-State: AFuF++l6S3bpQWJcZugJdqvWxYjQ5KoRAFP3VZyZzDv2AeEShpkOYFOv
	DwB9qo19mTiky4FRn798mKMIBW/iqtYHjcZvtsmaarIlx/YV90CpVEWP3S0yIIzR+uMlegmXSZ3
	4lMi9UCfUoPxRqFBl+rebPDCN+m8491i+y4o2to6v24JGz8wGgzePbJSRTSTwXNxGVw==
X-Gm-Gg: AYBFou3YmqQ8BT1fZ+2VO+sJIi5laD4/gbOs4jqgt3OeDAyxQGcnqTv29ILHW2i7i2T
	reCqm851nYuEsrnwwTGvgLCfhFvvesvLd+cZVpDkZYAc5lnFtmp/LOO+NClXY92v4gomjPM42EG
	5xyAZI/YBSFZr57xa/XoJAPAfVGrEiOUHuw/RxJHRBapYVL1pUpKhLfm69FYgwTSVbnpnTfHv7S
	Wq/34EIsuoDDiGTNb7dFcfN9ZhLChOu3CEd2xKflFBrZkfPD+KcR6IF+iHj+iQfUJDRm1CJxIEa
	5rVxOsqUY+tj6k443wSQdK5jkMdUiijSTn2ZZzdgWZMoWoZ3oFIgix9VhykmBQevjrcLkBXWkAx
	he3Foc3mZdrl7yJ79UQ3GOLfMJs4bBts6TA==
X-Received: by 2002:a05:6830:81f1:b0:81f:acdd:bd05 with SMTP id 46e09a7af769-82285a5a05bmr10939105a34.21.1791203138510;
        Mon, 05 Oct 2026 05:25:38 -0700 (PDT)
X-Received: by 2002:a05:6830:81f1:b0:81f:acdd:bd05 with SMTP id 46e09a7af769-82285a5a05bmr10939077a34.21.1791203137992;
        Mon, 05 Oct 2026 05:25:37 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:37 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:09 +0530
Subject: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1189;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=WVv+nmg5vqdtT2D0t45asRyQhLWqhx+jIdJ9Lz55kMk=;
 b=e8l1k2detbM6njameVDRrH/P5djX3PqBAZVb8P3wS00EMPs9dUybaghEOX3sW6EI7fZ0bXx++
 CjMaS1zZQfbBDDLxQyq6T9+PD4Lx5cofzHLt8soCQgoiQY/lo77AtBV
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: qZa_oE5ZCMb5NiRVJ4WvdbM5V5upl5Bc
X-Proofpoint-GUID: qZa_oE5ZCMb5NiRVJ4WvdbM5V5upl5Bc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXxsNTeHvFSdGT
 HAOo8rKr8YxBIgsnZBjdZmJzVut9oI/a4RDZBIxikk3USbis+yH0/xUYhtj3RKAQp6CONM2ldiA
 Kc30325G7PveYfI2pIaBxIxHu+KQWh2O/k7yq/p96ztBcNekr844BGlH2Pdh2WIQP8Yyr+JluXx
 0jj6i4hEcOjZ1MPA/ROG4u14C+7UCHydtff11qCh0b50J9NVYFNtZa7fLfOErxf0wQBzabAcKJn
 sMRc9cmLEfMMIFb6MXGO2XG7UXl7ypy4kokO53wAhgksiu1K+cI/QjW/OkkfL/wxSKzmuKzghHK
 EFRIJdxlyVpIhX6hYKzo/B1GHBPzyZf+qd3VZqzkfS5xfu0lZ/mx9Gr2NQdVi/srBJqNGo9KQj5
 9cPYWOxPnx6ivALfoqr4diJT6Dl4p633MqPRIamjtezZATJaDpvmDR31rOJpdie2PmlQzuwvUfi
 JCLbxUmpPMitEXL3YAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX1kTcc+YIUiRA
 bsItg27nF0ezyBcg4JMjHIktkmIvmzJHaVTFq+kjGh1OOoe1SBzp8cxFimUV7wUbhl9XQRf/4UB
 4Dl5eT/Rxw1nTKKy9ucmcZDqzUKcbss=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac39746 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

