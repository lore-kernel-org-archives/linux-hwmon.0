Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E846EC79
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658673; cv=none; b=Hi9rMKCf5e1GVzlnzE1dZ3Vw8fGsQtpTadK4j83tFzmUHHWGTdcqpbeWDb4/UAGp8uZW/woLmMV7UbMmYNJEq+SSoyR6/JRFJ27CaBo77qEJoANp/ieH0hG/6FdbzxhbTFXS+goZHglioP117WsA80Q7X59D4Ubw/ExfpXts5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658673; c=relaxed/simple;
	bh=ZsiXIxN7mjxCBmh7+NWUbiw/Zk1ew4C2lTBAf0t8BcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdIeR4gQ6z5haaLiYdF+G/u8lXgyakJFnTQsXgj8oEzShagbvMCPzkV06jPYyvyvboDq1if3H6UNuENTf8TyAcB+ZKyX3+zVfgtbU2Xi1AleP7Z4TlfQbGLHvlVS4Deb1OlY3sR/TaI3EqNgs79fAp04ISwipZywcU4uFsN4iYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTmTiWZl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSA37Sfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTmTiWZl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSA37Sfs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRem21927755
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=; b=YTmTiWZlK/HRO09j
	89a3vhb+J4ERVDfwANPfB+aQxmkQKpcWFj6kRChBmiHI08XBWq3ni2r//+YAuHJ8
	fHfqPuJe7jNjRRDJtA6vL/+Sl9nSoZFStcctTL9k6I5Sk92HoWkPdYys6nU9mhEy
	9X1Cyz1fc4dh5r7cFIa4CrRlmYiJ41IGKY2nPGOn6/CTHz6NdAcok96QdgM3tnfi
	H2yS1NNqEkBvx13UZuX0uKoJLkPULWTKuCsNpu2xq2W7EeF8ODej0edlwVX2C/ux
	3y50Wt8l6nHo1EuNvr2eOdi/1aPTVPC/V3dxoQEHIxucrWcP8EieJ2Nzt46CyTTe
	bn8Yjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fra7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:31:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so158471285ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658670; x=1785263470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=;
        b=PSA37SfsnVjd9f7p7W3KEjZYBALxQq5mnfXvF9gG1l6hR9etwdZSTB+4J6HBGZN8jn
         ODDt3bT4piZ0e8l63heOZo1eTgpo3zeoKqXHjOxcU/ZKhoCPQT0m07ylAZ61WdXQexJO
         nd0JHIdm0OsnXoU993xrIZe81jTvdZTaEU3nhClrKYst7uH0uN9I+KniP8GpuDW07TiB
         c5Z7KyiqfJ/CHA5Rqxhgh6kHr1hrvVZvVhcv+2s5SahF2yTSH6TyQCeV/TxD0ZlPf2ai
         zdMwG9Y5j4kChgk3RNYe8M2gaPjBVMCv5Qn1pfiThTbbr0HOArrpVA+0BS5lyMI+FSQF
         DeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658670; x=1785263470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=;
        b=GhTDJC4LhcDs/w+zrsMmKfhjAO7pZsuhXM6M9+NJIdA5sRXHdR0IjNc8x7uMkmhZ2E
         uM7BORwIScDGNUv4jAvmdZ9ppWW9ipubOENNE9BI50cWYI8lTabuKfwHgxpifR9w1WlR
         Q3YKxKLV2AKPtf5urRJEluoj15cMXKI/LwWBD9N93V4Je9gn6Jo2NTSuQYobvbrM/PXZ
         VPN8hVsL3d3/SR1OldD/BvqaQUCExjcB3cHM1ZVDrjiGooZlgsDNDJ2GtKAZ4JpofKGl
         FEBHW+tftraKorMCtFtAnASagFP1cqHfFxtBh+RKBY9VXA29i/B5DzAD4LJSpH2lMZe+
         DKSg==
X-Gm-Message-State: AOJu0YyWjevKQ8sON4fFBVK6gU9Zb0eWrFBeEF9bPcvDamw8G8ssbowm
	46EJ1oLED3vGiLSvzP7GGSmqB0UA86L+TQEcmy0VfyJYnz2Rh5zZLkBey8UcC0hEaSCYl4cOPPU
	h7Yc9xJh7Z7QpOrIig8UCtj7+r1axOOztyjs9moq/9zwuCr6w6hQw83oguA5es7HuGw==
X-Gm-Gg: AR+sD12UC8vbp6jJxkJ6OtPflKg8Du1lvTHuC+bqCUYu1ymPeOFYEDnak9C+OaR3uLy
	buvUG7sXAL5EanmEts3Isu+ZjCkY0x8YEHF+4+VehSJ8XXcDMoP7+q/7aU1iGUNPpzotmZ5A8IR
	QQt4qCT6pg/CYbqljVPULzA7ZCneJEi1rAnuXmUZ7MZIpal5iKJVTA61/OHC+71oe4H3ZH4zRnQ
	/uU/LhGcSGqXpPb7UcuPIwHSRoyMSkXLqzokTWtl6ywD9dbJBx3IUK1LvTuB4uYejzujKus8Pyj
	MhZB70hZkdXAZqUPI30Z36F/CJf+2FQPyKgujUUGQwDq0OGIid1FltI2srBaM8icT28+IodFnay
	GI28E/7iHm90zpXo4X2hiEAo28x69WWH77ew=
X-Received: by 2002:a17:902:fc44:b0:2c9:b8e5:5741 with SMTP id d9443c01a7336-2cf349d12d2mr217270785ad.35.1784658670536;
        Tue, 21 Jul 2026 11:31:10 -0700 (PDT)
X-Received: by 2002:a17:902:fc44:b0:2c9:b8e5:5741 with SMTP id d9443c01a7336-2cf349d12d2mr217270375ad.35.1784658669987;
        Tue, 21 Jul 2026 11:31:09 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:31:09 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:15 +0530
Subject: [PATCH v2 10/10] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-10-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1071;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZsiXIxN7mjxCBmh7+NWUbiw/Zk1ew4C2lTBAf0t8BcE=;
 b=i/SwsAu0fw0RBj27WyxOLBSYkU126RamCKU8adjzYpU57TO4M6xjUiJFN7L29aLLl5gZekBur
 PHM8RZmw001CKh+nwAg7xc/8rthCduiWl6YqLBkRRUmFkQKXkcyBffY
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: MDGUdJMLbgfNPq05vU8Cs_Aq8G68WRQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX989y4sF7qR/0
 1G4KXwmkZOhOx4zw4+IwoYs/OuiCxUFl7T1IzSxe1jd33uIDBR/GoKuvhuZ5jcWCTPizROedgQo
 0dP1Mdon0tIEcZ6QwCnef5axI9FWkoigeNHWPK1ZJP2XA9V1ELVB1VDyHuBcnwdJDl7McVa1tDo
 xcOQDjZvbhJz7/Azh1oOaw4eZKxgYPyhg2IBZyIubuWygpcUXBluZYMEq/9aoYlLdtdEvo+cL3+
 BiLs8BX7pG8t7LjxKl9b9uVTg9OX0wpcggUJ5/I7L7KzyqQgrS1SeOCUwLXpl2ymbV2mXdPiaF/
 8iAakVdlqesuNtSTEcf69wFy1uFtqrRoRdRsH/0z/cenAAQqclz2UJVU2K0byoCmPPu+Hz8cDSk
 3xor/OApCd0gTdKqQBBv/oA9oLRK3nLmHlsVoLluMAu3ruVF/ve9eKSosZ15m/qfbSHO0XSX8ac
 h46jsbdMbKm3/N0oylw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5fbaef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: MDGUdJMLbgfNPq05vU8Cs_Aq8G68WRQQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX6CvFgX4l6xey
 d96bik48kuSs2PdyeYNZN130r87/YX0SRo6Yv94+F8CiT2f9KskSXYDgP5Jm/o1eABsOAmN8cKf
 2CQS1i2VbTHyOAlqieX/cuID1MHX+V4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 80f3fdae5705..79b013fa2c11 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,15 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

