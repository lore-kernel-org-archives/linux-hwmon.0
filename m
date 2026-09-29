Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592ED527581
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687432; cv=none; b=sIRHOdgAwCRzyPJ3X734KX7cMRJ7IzyB2Nu043tzN5SvmeakHe25+Xeb9SO2gKUiCNluIF0tJ1IMNSr8sPrZqjoLZN3x1w53wOamrqLxaxspPs4tDsg8KbZ8K7fRf4gt9d1nrj5HRSia6iKGNXvdkYPBM1qZrG8QmK9GDF9VD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687432; c=relaxed/simple;
	bh=mPGy83zCIZIUwpjE30P3ea5r0XwYdy+rZle+WQsh5b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGa22v3UzAVS2eYi3pcdFtjcCVqF1dCtxmSmWtICIdGbsUB+5ofaU2i3Pq0FbfTJjBq+qCXcsYOMVO9eFhEhl5uMPAagAmgQTdgsB3wqltI7gsjBlK5ctfhWdLLO/9GKy88kyiStaiK/vtdLQIc9M1UHxKy7zIDalkIWxrk2oM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epJy8ZcF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tv68dzqd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epJy8ZcF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tv68dzqd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiFh1477117
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxn0OOB1sRE2utqg39woPRTHt+IMHQbA8JUcm94TNvQ=; b=epJy8ZcFmuZ2lDYn
	oq92ENMFZrSq9ZVYHCeRjQGh+8rr94BXoALOoRt1a0gg1hcwYvO/vWuKaYw5Czw2
	nmac4KElhUWGC7IzYQVg0pYNKwT9/LsvKBMzrmwGPNpbGWRfxpOg4CS6sOwswfD9
	xBhmkWcQKJmwRPAWbuh/dUob6L2gCcN+uQ8f0cEvr2XrbiImioACfl9uERBh3Q4O
	e+VNgEFR39gPP5QaVW3PCs9iZ+kr/FH2tpFNOTh87Nb58q+bFB+11yMP1sbWmd7d
	Vb92ob83pYwAItR+MwlH1lbHxF4yL18lLlZw+zjldtKp7HoULLWnc16weMstTUho
	KkGLtw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m68h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-914355c5a51so76539786d6.1
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687429; x=1791292229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxn0OOB1sRE2utqg39woPRTHt+IMHQbA8JUcm94TNvQ=;
        b=Tv68dzqdYrqjWlnIM2jyyGcXTOXHI8gXvlyEKrg5cPmbHUFsjXNI2B/8CINBRc7Fdg
         AW7Gqfg9uYJqRBZEK2KP/VTNHGoz7UNYMjhbii7rPDm5bQjnIOkdG23WiBh4sjOuHofF
         3QXUZ9wUkamsJs8vjVSjpAHqBhfbNMkbnXHbmf3DpHF+81X2ejSz7296rxhLUiDoKWnK
         P3FbfA8URy6jIgd+fH0FH1cg/jewzClToFpZv8u1FfHrLpMbZihm6F/ap8t9cd09MSDQ
         OIS7wvbrMisEoSke4/TqcEuIMjfXO5XVn64RKIkSH6tDZdz8UsfUQrY785yPUMSofciM
         GCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687429; x=1791292229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxn0OOB1sRE2utqg39woPRTHt+IMHQbA8JUcm94TNvQ=;
        b=IRZGdX830jtoaEKSS3R48/0/FkCElGDO/vTGnhOY3Ww5H720ZdSXk3pyW7oDjA3PO2
         FuYAv35nXazx9Es8Mka1ay9gXSuJPnEvjd+++AUKK4xF9hDdrIfPk255z77nss/Pw2wk
         Dvn1ldxRTxUlPkyo9qLCVs2vGwoPiXxEAFwOArLYfE8FBAHZGrExM7p4Xrmn+a9KxrWV
         4I4JIFJgf6lc0URy711ZGw2A8qoYCJAuF9ZQqbeLrpgeqm9LzZltYij98nbxC3R4cLuD
         nx1Q2w9s9QTouSwVJ7ZlTCDgeLz3YgfXpO/R987nYTqR6980iAPWx5rdwk2oidejQDg9
         FCQw==
X-Gm-Message-State: AFuF++kyB0ZKMwvn3HmDWbxqYWSGfodC5UXVzr0xMQVVUK4T/d1yP8Cj
	q2DLBf2u9XUkc/ldgCsWX24hsW/+w6F2hy+Vv49zhGbbzr3OdLy+OZAQhUoQvv+fW+5lh5MvKSz
	0tkTz1UppKoILhbZvehl2/q5mfXF+VJaN1qqAme3y13kmg+jau2jdhFraeJQi9wUfSA==
X-Gm-Gg: AYBFou0fv7CKhmDHhDD2tHQXHPzPXWBNFAjhFf2zFs7UJ1RnQtDYEfvoctljombR9vA
	JCN3cDXu3SgQK4kQR041Nv/zvFzVHX/62GH7czAHGGlxqDEZXcsdswB5JuO3yQVpy+q9wiLJ0wD
	YfmeF1oYZ2D0wQFp3d2oMvwoc3rQWEjGuntFQwwbeLU3/Mv1h9B7FGFDsjOQXQaQZWhoeEWkqP7
	9B0ZAdelD818WDUsp6iW4NY+3k3/RoO3RgdTJznKh6ZdeZa5zMcHrjYilVZW926JGQ6HEjX5UUd
	H4ed8CsPZG8ouV58gHDMq09XOHTUTYxBfD7Bx/poen1Vw5RCSOI98Watdl9PzT+GX4y6PhZT0ix
	bYaRL0SS7lGh+CMAgGN37ijvwoz+d85pSDDM=
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11843726d6.3.1790687428365;
        Tue, 29 Sep 2026 06:10:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11842516d6.3.1790687427497;
        Tue, 29 Sep 2026 06:10:27 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:24 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:38 +0530
Subject: [PATCH v3 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1187;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=mPGy83zCIZIUwpjE30P3ea5r0XwYdy+rZle+WQsh5b8=;
 b=u4MO1IQw9Ihk61kLbucFLPF/d2RDFy+rHq3SsRATGzkMgdOmAfo6LUaCZpDyQt6vVXBvcU23a
 ulIb7QRcZzaAj834Dguk9ENMjChXGtyuuTYlP18ySUbvBBn8SLS9wN5
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3PSsPk3c2VOO
 G88+VkqPINYF03Xg4RRj07Lb3aAT6s9KtLUXoJqR9UUaxgmWRyMw/OkBP4YI1Xx4AeInNRHwrYr
 IoEM5bQ1pSLIaEQWLgGfS2V976baHF0=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbb8c5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwKIhOaPUbUdH
 a0csdaic5f92ADpAr2KLyF4A0jkC4xG+pGv3/2Eg3/5e0U5XOh6Mja3pmm8W0e9a9JJinCtQI4x
 qUqJTiHYe9k8hCgn4cVwHdP97ROtx1FO8dqvblNd1GV3t77ODvkOhwTrpgOw7SYlO2TgcBNb01G
 WbL1NjkA+6lpavqmxpDcfo2AArISMhwxeef2+1VrmaMh3uH7xkphn+tQzBuzlfQpLVCTV0b3Cc7
 JRYmBgUtcqkjyTlDCQxj2Fr6LLlqeA2kvIKpZ2T8z67oIDRpuGQ5RfRW3O7Dw257kFVnhq5zh8n
 IRFXMC/6HWfc9lK+chXfEd8Zi00Mj+Z29G56OMaVrqlAy7uWnRf+cDkwyaq33p/Bs//ZkcYaX+c
 av6FRkM2WqTrxNWLwgUxPuFZcDTEGgUF/efmhMpN5/4rh5zw9+yDcECSbmNHVURjy5sxkPZQsZd
 Ix4vgXpP4RUtAWTMJbQ==
X-Proofpoint-GUID: 1Ib3xIGBHoFjEKsvmZj-Qrip1-xko5gJ
X-Proofpoint-ORIG-GUID: 1Ib3xIGBHoFjEKsvmZj-Qrip1-xko5gJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
index 18692893ca41..f0c252a386ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550ba-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550ba_gpios: gpio@8800 {
 			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

