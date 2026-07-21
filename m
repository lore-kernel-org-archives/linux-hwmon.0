Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF3C46F490
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658649; cv=none; b=tsOWFT7vzwGXxIrt+AztYo+OhKsfLVOuPj2XqDLlESq2akgASB+pvWnabP2t5P3IjR68JS1aPu70uF/B2zaOBLszLK2x1izHavLrlH7z2PV4SIS67upO7a0zUV1BLOYATCUV1O8ayNf6rKRQ+aFPiDo5RaxGj/XcwVnZ93Rqh+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658649; c=relaxed/simple;
	bh=Hr+SJqfxYiBo+4JP3W6WnCEE5QZe+CfV+dvLiJL3zSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=renhg7Lfeh2ScaFVZEBp0jKu6lPi+c/Z5dg67BL8mBCUaK0DOhAb2lfY8N3tEA9L0IM40KLYLJIlrP3dKTHWY9dJsg0wZm7w9UjmfKitdFDIZqeG/CQe8HKgAnggq9KgNuX12SM4bcM5GUgWWz93aSicWZoJTndJH3Z4YjVYaCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwmDa3oV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYJnrw8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwmDa3oV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYJnrw8J"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2hmc2449240
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Snoz8SGsLM2BwCRYmvB4dnEmxUX3sQ/GRpsZci9q7C8=; b=CwmDa3oVOennUA9G
	lA0R2EHCRtrb8yctiit5g1KC6KfPGsoe6KsaIp2cOeJUvBvd+Eh7hWn9QHwAaJoD
	YdJB4AQIeGjdJ8yIwuiR+ajWOARuHbJMrHP+oKILS+arYe1NFGQ6dkFTzXic84y2
	+HBlstVtK5SHmrEtiq2UPanLTTpnmPKN0acigVJY/EnfTmKf0MAyUVFLFGSM3hkK
	9qPMAyXclIqgWmeq+jpbRIJpX6nfD9BoA/QUJnGpkJDuR3Zj/PeJ3pyo+yIm1muK
	ipdZ8eqnWL7T8CY/iHz68rwZGgZIzxC394OxF0xUEEbqqLvsKqafCVmLb+k02Vu1
	tkbLBg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6862hmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so16846048a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658645; x=1785263445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Snoz8SGsLM2BwCRYmvB4dnEmxUX3sQ/GRpsZci9q7C8=;
        b=FYJnrw8JLMzJazhERVsbcwpLcYMCvjLFH4+RR0FyB9G3ZQgxYAKAeO/ibZpBVXuZnK
         NkywVzKOLmhGfjgJP761C/DjRytRBFIKg2EVCURygXbcETS2GwvEUtNc5ldMQS4kInjx
         Pmvm9/32SuGgErzdmYM/dlpq32ei7k3gG+ZaMfbhDiRNT+47RATvxfjPciZRwsNAUnCj
         gojTDIKatrnLWHtLiiQFDJx1wgwRzJ5mfXr19ROLHrpzKhcAIHcTMl0hO3fbLl1gqM4Z
         h/qhaIORE6TS9+G+WF54Avmz5GbY3Bhb6SY2F5ld3YgKERIlPKsnD1Eu8RKVG5QjHFzf
         BL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658645; x=1785263445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Snoz8SGsLM2BwCRYmvB4dnEmxUX3sQ/GRpsZci9q7C8=;
        b=kG1toBMeHO6lbOvEaRBfhJWSuIWaDksns9gRcd6OxrXshZpMOpk07okeu9jrcUaKWk
         gcc8uUXOG2TQHvvAyVQSYQonfHqIKqVS9atKgYMyH6aPdY5vUJqg3aXe2PfLYS2vC5J5
         io+M2Up+u6ROVjySDx1rS/yQfJUJfqdFGD4+ERwnff3iHAA0Fg71D6FEy1CcE33IAdCn
         Gnv5Mifohz8pEmuyNyjfH9ph9TRh3rkCsaTnfwTAE33bOOtsQ4435htn/tFgbix/RDo+
         mzkYIDSokivpYTOz9Ol4Ga65hYWM0TppayQoFAj4CIdaDupm5BT8jimk5jGirQBS7wJf
         gU4Q==
X-Gm-Message-State: AOJu0YxRRGIw8MWFTxxHB8bp76Hcww3KcB+kUqUfkAZStPToZ6KRmVWz
	lRRKD0v8KMEs7M2cegvdoznuoZwnvIOfhFCNmtvcP2A2EInOxpQkbnlvMIOCMRjUHl6kejXFxm7
	IdCVeEm6qX3BcOK+hPIMwYtbAi/9AXxM565+pMCdOuileL/dj26PPdlqRVkR2uPttA9EakoZbIg
	==
X-Gm-Gg: AR+sD11nh3RpvDX7uLfGVDfnvElRbX5CchhCtKnl72Hn2vyOGDOmAoFX4arpS7/wLiT
	Qnezu7wLZKVntNfF7mi6aQTZtdsgW4C1X4hyatwd5df4O5gnZjHnr8zBUl33d2OE24rN7Vr5Twa
	Jfg8RCcpCA4dV1m9uO9iJPgkt9r4tnh4HrwpEogVJufwiBnL+vYn8NABnDLQnDlz3Zu5+EvwNn0
	ZW6uEPm/GcpZXFCH88sFFx3jMjhOOXUm5cvpyNQspJrq5VRpvRa0w1YUNMnJ+stoAQ3PMcQVdMl
	tovgT9G+hsDBB10GmgHd4RKI+X0B1vYtDyB3YxYC7mOkEwgIHA4T8CZjTHrR7N/FFAaKzfdjlrh
	oGuNPmwbhWUeQ0iwXPx1xZ5AC/B32a8xaQf0=
X-Received: by 2002:a05:6a21:700c:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c3ada1eb59mr21745559637.73.1784658645114;
        Tue, 21 Jul 2026 11:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:700c:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c3ada1eb59mr21745522637.73.1784658644623;
        Tue, 21 Jul 2026 11:30:44 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:10 +0530
Subject: [PATCH v2 05/10] arm64: dts: qcom: pm8350c: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-5-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1186;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Hr+SJqfxYiBo+4JP3W6WnCEE5QZe+CfV+dvLiJL3zSQ=;
 b=j7hDHuTczY/d3Cv1yzA37g1zkh3y/Zo393yYi39mhi5xbkEu3bATGdK0FmRJQwWj26VzHkGxk
 UWXEICiqpg0Cf8uqg6yOTh9mdfgYb/Uaw+9zN8Jx7mhH7INYqlODRug
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX3+y/vVgayCMa
 8SyK3xCgENbhkqtEEa5AHveSDQdRVrRKFuEy0Oi/fuNLIx0vU+zV32LLAz5nxBCbe3CxxiFO6vm
 Q7IIYC1ne4uoCIPZfn/jXOkt9NEtKBY=
X-Proofpoint-ORIG-GUID: p-p_pTbZ33Alik9yDtF7TkG0XflCfkXr
X-Proofpoint-GUID: p-p_pTbZ33Alik9yDtF7TkG0XflCfkXr
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fbad6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXwlsOxWDnx0Di
 HCCyzxOTSZuwqCLxiSBHOMHGC3HLf+R+3KSH69H0VL708NS7W38hbPzKoq0wrmrJicV14IXhZqQ
 AkNWD7xq6APNc4wwCT83ZiL/SrrvIRd3pXA5Yiv1yJDKgk/Ks6P+AwPY7Yu6TIW2n9icdyaYBs2
 ICYFlIJT3UdGk7im5etBHXPUuGMQOfe8mmzWycGO+obq5Kq7bbu7zEiPp4UdmOhgTFXwMeFOsxX
 zy2OPGUV3u/b6IbNZo5AEANYO0TYpjOcpnBGAjqwTVamLqrFXUsM7xUcZqsPf8IBAaLxbuPVIvP
 LhNPyy/1genJv75vZGdDqcYdKH+XWP5SMNUmO5GIL8YuAyzZXCHlZy2KVlkUQYRrATQNyv0Dr1u
 /Xr6OTZGqxsNwr4B7s8SZodNF/V860hli/fWKjQ9N4IKwK8KAAt3lPmrNnxJGL6GrDzey7khmKE
 DR3UObZa8ZYISwZv5rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..8815868f9ad6 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,15 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -41,6 +50,7 @@ pm8350c_pwm: pwm {
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
+
 	};
 };
 

-- 
2.43.0

