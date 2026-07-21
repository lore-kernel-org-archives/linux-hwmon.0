Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759E46EF9C
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658658; cv=none; b=G7OvehxYHM4IguizvTcVo1GUB3FXSnVIJmzC0iOZ9rJ/wxcZKRSmaJfFkCME0iLFBOR/feY6Q/KkWEwkX6XPh7arnn1YqBu+xA7IPD93kPBzWAmn06nM9n+7+WnR9pAe53bpZkc9DMlNoQuj8406z1ibceWvDGv21yDObkfCoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658658; c=relaxed/simple;
	bh=7mS7lsEAHqFL7+IZtJeoFPHZbb0Bx/qkjaqa79ydQ1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYSusmh2XZWfxuWIr3gl4IXIfqmP9dAb8TisATvFJ76tjRe+l1TNE8BPo4fOMdxUGAinR/No/709ODTJX8YQ3dlaLfIwvn9Vi57K3TvKl7F9LUqJunaen8jI2b1Wdwj+Ptge9SEycsld9zvOuueJqQyEkR8Ax4mND14hpGCR3k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XibZ5Ilf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWKsLdU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XibZ5Ilf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWKsLdU+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2TTT3439745
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=; b=XibZ5Ilf7EbsLcok
	0RLsYgWFwopUkXEGVi1uPEEiqPJSDsLkAUwH3NT5miq+y6KWOZj64Znwp5bsmWuY
	0D32ZSsarCq/9m+VxMoyGbsfGI7dmoedbbZ6AA/8689vBNLkJoBx+atc2Eaqa7sM
	lg38S1Ma9ledBrlJv0YsZEKTo9FsWvB5vqBM17oBzHnfLg64YtJ1m0ClF60jcSzc
	0kWOjBhX+UtHZpI1TeVqtZ4tGjr45GteqV+CduEslEbWF0vtKczRSsz1Ip4EPa55
	S80yZaNIlELpvBHrEFDeHRiVf8gVXryYgHkPVy3t3fyb5Q/JrRzeAmX/D4s9/vVG
	iJzFnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nstf16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c892143db7fso7192167a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658655; x=1785263455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=;
        b=MWKsLdU+K/SWDCCrQIUynu+6RHKZUDRzNvgxZddH2X5jVaPt6zH4BuGJ7sV35MfsKX
         Lwr9Jif2fZrg01XTTb5Bc53bQyqerRuoEuKu+4K7df6Sk9ysX3I2erMv5eohnVEihFAZ
         HrjvHmheuZY3U9DuMkc9+9EyAVq8MnuQ5FxJ6QW0QMr1+rzEGgmJO5BODvDsdyVPsYxd
         31k5U314T5fYyTUcDRtgk50cPrbGvKyXfuSqtSFs8XiGgs/9l4amUCyHAojA1yy7OjXL
         e1CEzgVeWXUmdgEMJ7zo1kfLsHuLxq8zYE2/NDRKmSG3EYy9K5l1tuePmSE/XEOWJiZA
         7OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658655; x=1785263455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=;
        b=XBJZH/TKt2+7bH+GK9a/U8peIJcILvESkdfwMXjeqSNhTrOBzl1cTx/+NQBQe4yJq/
         VigePlOY2P10u5myrUjonhapUPadrJ7kq7Rwa9xveprov/b5IXIT66gM8bcyQ+PKraQF
         lv943fST0m4KkNsIIADdUEVb5/DqNxFaqScyL/d4Xbbu0PXHZCAikEXX8FiOuFurImtr
         83u8ganunWjQpwTwkzX0Aaq3Ji4RlFHMa6Z/bPH936ddYfGB5+EF8+Rmrn/DK5hHRngw
         t37i7oip5NZ+BdrLqnmwY+8XQXUfgMNuSQJkUcnnIOVML3MiZgnlHvV5AA5p7yzCdBuS
         +3Tw==
X-Gm-Message-State: AOJu0Yw3JKonbx+Qwhqat9xtMz6P1dQQC3O+67NNtjijTprne0NezZco
	fmkTi4go6YP+Cmse/J+kg15szuxDwZyZ63kKYj6T+Xb3x0hZCOmSlq1TbdxL/GgToj6hLgM2so0
	U4P95I8k1ILpEWWD4bw5Zf8bluKulYFWv3Pr1C6UP1XZWXa35h3e2lf5q/UPOU0fJVw==
X-Gm-Gg: AR+sD13ujblUFXxlp/jOTeqvAu9xM9sHDf7ghc59LGx4z8w421tDuW99cCUl0NaW9NT
	Se8bF6oH1jZWB/xc9qvO1TRlAvRBLDSsuxjsjJ16ZT2gYxHdsDk84MD49eMMfccnu4L/QvdUbnx
	w3CQLexdrrbjCXxT0DvYY/W7JEXrpx6Fr95mlt2LYZ3rZH3mdKavGHebmTybSig4UxOEpZPb2A0
	eC7s1bwvC5pb6XUGBWVVwvpV6tPmXShM8aqzQ+RYCzbP4INQ54fD7ZJTqBk9I3dR0YkNtDO5Tth
	AL2i+U7mcXv0JLB+eNkfRZEJLB9BTgEtGya3eMnqoxjA7atfBiDxoi3AOFLyR5l+tr+Z9JBlb19
	+vCrShoiemQwXAe4z7UZ5uVVFpgIrtY8t9M8=
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr21842242637.53.1784658655187;
        Tue, 21 Jul 2026 11:30:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr21842196637.53.1784658654677;
        Tue, 21 Jul 2026 11:30:54 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:54 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:12 +0530
Subject: [PATCH v2 07/10] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-7-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1062;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=7mS7lsEAHqFL7+IZtJeoFPHZbb0Bx/qkjaqa79ydQ1o=;
 b=dMndhaEFYas0/kwSaCAKkN09WtXxauLKLYvg+8oE/BPW1hbU2rRwetEt5qn0UWLN844wlk0YB
 nf+QTtBzMtODxTlIzv4T6He1xQuynZ3RtiPiWnQE9NeJHC6v54gDFZS
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: gYA-wNg0K4wtRlYZc3UergqhBFC0E31E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX16TGt12J4CPt
 JSV/Dl7JrOfGty851sYKI6EErbrFryOA3mhL6DRalz6fFDcN2zwDXgVMJr3THBaAGmh0oUwyKJQ
 OgFbIEoelHtdEynYh5ElcIxw4Vmm2f8=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fbae0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: gYA-wNg0K4wtRlYZc3UergqhBFC0E31E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX6ZtlwKqweQrr
 S5NSvFBM4w/mMnA19UIIxOP7XSCQ/e2a4uVIKnJhfBYY2yukYGO7EOsCoL7EMK8XgZ39+9Xepwt
 cThH6hb2dFewAqIgrLR5APRIOdQ6/UmWeEXjFRi/SynIKILNdH46HzsQSUnjfJQx8K3HVAvOwh8
 Um8wqQWhnEZ5/sHcgiZ0GpjSHyutSX+gYG4XEFcDPYzPCj5sjkLvncYlAoKbjI13GEfQ83a0Wb0
 srQW/hBDj4GF1U6LDBPceqFTgGv55sZiSP29qnqkz87yUycY1re7Z4PJOfq77CRfzUESO1R/3uM
 kCdACq0yP4DAd3Ba2VfFH9ffZSjHBSt/suuKEcs8TZWzfoY9rkxjpxpldDGfbrkY7QzBAxT+jdI
 wmXuu/pTGobQsh0K12D4ziLgmBt93Lr64Rs6/ayuH1VIJ8jmxt6eY6JrJ0VTPHuUfsgmbz2szS7
 akfw37t2FqI1bXw3lUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..fde76da37bac 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,15 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

