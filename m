Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BF8470115
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658653; cv=none; b=QGPtV10r0lQUeDsKccbnZWu57bypKd+hzZ22FhoO9dgStshBRV1e56tjq8XHvLp29A0JmHJJAVBBoKTe5oPCAtuRZg0V+6TPVOZO4RsOqc/qKD3z/xreS8nlUDOVb70WqPbeW4FZORPM2Jyop1PdvIfO3yABoTQv7gCiq1xqipI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658653; c=relaxed/simple;
	bh=H94/inAPZ8P/ZuuhEqEPGYgD3pDZYRADPr5JsO3iDc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oADr6UOW1QvtMs/AvndvsFt6RaxA1HRh2ykE+COKfLzoVSgSIvxPiWJuznCE6EnTNuraWsUXuWOeLSQqwpzE6eYjsKjkokgN0BD2sstKSvn9oQUBpct7VkCOCTlzsD6Uhi0pc0hn7OuAIiMH5rWxtE6gUofpVzOsWxmqYx+0th0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJSB+iAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P27kqNDn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJSB+iAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P27kqNDn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRZdQ1926813
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZug5Wj4+u0tw4RxYDnOPHsHnRbpbC3OCpWe5rywdLQ=; b=VJSB+iAGHSkG9vmK
	1imimK6WdHsWX7LF/+clW1LUaLjWK1t+p93ei1eNiGT9S4RH6J+aJ8VjQD5ETg7f
	93n+XGT7kIGNeDeXX7t0Un0M1z2oAZruuuksZB6JkvA9sArDRbAaPfmbpph2/iFt
	xqTU+rTrH9gzfVAYt3rxSHMxtHPkfxjPFEZXrxoGdf0+9EJDMO/ciWg2Hg6uSMEf
	U7gg19xC0cBJ20UyiFoh7n/9oQ1s7pMKCNWJ+XlciUJf9S3/iARAOBeIUMgAmvxJ
	upiu4Dh/AYPG54azbGLnSorgo804X+5+FYm+x2R9KRSGFAeeNRJwzrr+zXjiJcf6
	Zxm4Aw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fra5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so227202195ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658650; x=1785263450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZug5Wj4+u0tw4RxYDnOPHsHnRbpbC3OCpWe5rywdLQ=;
        b=P27kqNDncTxs3CwZmCManSKllOiViChs03ZQPWq4uXp6B80uFwO4FP0ncSK4PxoWZx
         iEHQoVM4Txi5NRMwMHOYOYghFyGIa38VDkeFSIOJukLzrulCcWIiUmZaCUSV6y/7WuMM
         yNn7i+avR7Q/kPzrArjJqGVTzVV7NHXURwotY2OWdFM/blXbFKbQXel2+or6Lub6dQjX
         0RaxRHNwgcxTeonmrSjWWts+R/94clb4TBnRlAthSPtGUAe4TVhCEuRsEy4rPJZGwPpk
         WpJQlxZ4Bak7U+yu3nnjg6JY4e49C1ak4dHkR15FiIiFQn78vBEOpbMzXBq8Dzt2qB/n
         2U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658650; x=1785263450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZug5Wj4+u0tw4RxYDnOPHsHnRbpbC3OCpWe5rywdLQ=;
        b=PTHfo7Pn7Yj3qOs54uIteetzcm6R1wW/ZmHqsL+oO0KseMVUZCmWJ4ESTeSvqBijFH
         hU5NCs9fFlca9vXXUGiMjwIIkbyj3YPMlaGMR3r4CmRuOc7oggX9UBEmy1Hcqzc4NehH
         lDoGrRAsjfw++yEKrAZtBF36vsiVspj8q0DPfUG1iSGy+1ppGlnuG+OzZq3z6A1X+MBH
         zEvlSTpY7ezlMxcgaQvzdyMcnSdrgHnuQgvnvq6w6wqPX1lj1G9r+HZQ7Caw2xQWn7bA
         Dy6AhmkuOkSfdP6i3d5S4I+z64moPKxUbFVtgOpYKK8m7tS+wipEZX1BFtzo5lVxgDMe
         p2qg==
X-Gm-Message-State: AOJu0YxVn3Lqw7mVkvDCClihwF4z4Fct3sPVNoIAE9znUfLllWYsVpX4
	3FRHd5n+NeCF5uy/rgGcXJXl+CFpQQEpr2JgzMUmDwZobqV2KcwXHEe1G/Zl9h2pCXOr6DK0GH2
	vPZCu8BLa4fZxfRxbAgkdtE4NFD4lIoRojKoGi+3/AZBDqiRWC2zOfOzuBYgYgPOT4g==
X-Gm-Gg: AR+sD12ZjrSHi1lm4D2Y3mUQdwyfnl8/NYC5HBTXu0bgu9+eJCihHlxIVAVqnRbvi6Z
	FfgTKucZBAuTZKhDrEXYAOEkZP3CXkOEPrmUdFjVwR7MKiTWbmSi30+2YrMFEHCst+16ul3EBUB
	T7NAam7NSt69PwuvEf6SdAiLBRaaLSkA0o/m9vYYebcB0N7S0l0QTg+44XsDzVE6Vice3VRilv9
	0cq9ltzgHJrtRZnzwIKQoG+Q3Cw4j2a4WZ5lxipoQCe9TkPcdTMesPLL6+QVzw7LkfM64F5Sob1
	o5DXEVM34s/SRm2QLzBfB5gV4LNbhhgr4rC+s6pnOwABHpqWbdz7pEOGlYVMCi1mn2h3iV3ae9v
	qA9LDU0xQgJrtK39PLd7sMHcmI2dueZDNQkk=
X-Received: by 2002:a17:903:1252:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cf34868711mr212180115ad.18.1784658650323;
        Tue, 21 Jul 2026 11:30:50 -0700 (PDT)
X-Received: by 2002:a17:903:1252:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cf34868711mr212179415ad.18.1784658649640;
        Tue, 21 Jul 2026 11:30:49 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:49 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:11 +0530
Subject: [PATCH v2 06/10] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-6-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1072;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=H94/inAPZ8P/ZuuhEqEPGYgD3pDZYRADPr5JsO3iDc4=;
 b=6CRUu+qU6LL/Z1uOzr8L6TbO2BvoSl0Le4V4+HtUCc58Yg5RGVKZgCiTfqsH4+bnrJ5Zqpfca
 KzoMwVPsr41D9RA+lzp9Wmjl6eD1bGDGpj65GNJJmX900eIsxtD8PYo
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: UUOGMdPTMz0p70pLScmIP5CIi_bhqBCA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX1UvgqfL5c+4z
 sMLn4ljHVjrz+wbwxQI+2ICWr8GxhUSj0It7/AZ13GxweJ2CL1IABAgewarsRcALBq61tOAvpWO
 fjMyL8IGqgTvk52CiCdaGt02kFWamKRc3iFusYKEbyoF/iduv4eg5sU3zfNaWsjQ1WfwQrvFpis
 C/mf/BSebCNFUJckTKiYDNe25YJyX+Iums2Tiv29shvxcMzDPS2AVuAHZixPXQhUDW5PVAuY2bb
 t4H2vZK4ky0JbllzW9WWYP5ftUX71Jm19ko4hUbqpjsxqpxfOeoqvO/B5sCfMYjrXgwyhR9tth0
 IyIuxxNJYCFJcu7oPj0PGK9MJezs0bKDNwtx2hFe2rrTy3Ei5VzulvjHoPtbve62r2IcRdBx5Y6
 7xCCRvnuNKCs8mVXxXJZtsplP6yD71afi3riLsbthugj1+x27ow8BLPoKRR4zspZQOjhCECIDjR
 uoKzVQQH2QuoaLRnjhA==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5fbadb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UUOGMdPTMz0p70pLScmIP5CIi_bhqBCA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXwsZoSFe/rtyn
 jo6LwCG33ul9kVdq09Abh3stcIVDsjzWUo5Oi9noeGEdHEkwbOLxVzjD3DEV3mXm9CHSiAENmFl
 d8Fot/++WzNdLpgi9hVufIt+FPnAUJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..fd632b592d2e 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,15 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

