Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96B7471423
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658663; cv=none; b=UpRC5XjU0jU77dq9mNC+yuPtS+y2aOdtdAlhS7v4Aqosmat2nTatAQSTQOXlPAqzAfdgsnS7CKxttMS8L0uzScYOZPAzvZGXZoIhv8RYyvJRjDpvfPPxy2Tnpp5ZizMxT85C6jpZ7IaiadF5lpLTo20vzr0cPzP/puAtRIydY7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658663; c=relaxed/simple;
	bh=OS3nTF5uZPVKUD9c+8gRRWe/CCVuPxrxct2FrXKjb9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIgPqKQsZUEcNMP6D2grEo3oHcwBaKozUrlVQ5a0jC8Kkmlw6kZzY4O4m/aCuW1Lgh4rIUmtje4gW03V4cY6NWZmK3FNEFXS5uSefQXpGeErCi5y6MlhRGcYVtUM7JFR1yRTQU5anB7iwwJdXSmYtARzI2lC4v8yH46hZGs4aXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ5o0lDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UySsZ7ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ5o0lDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UySsZ7ew"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHPFOH2114782
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=; b=DZ5o0lDAvSWuNUkh
	PNCUO1RO94zIyy611KI7rOr06WRghGJxZ+R3VsU6W5X5qQ3olj+lNGn+++dkkVpn
	PNJkCarywted9j7EdzYURCYH08KVsow/saidjFgit47zV2CoTW1163TbCj+8uNAW
	ekDQ5goCN3TzyD4FU3Z1ZSC7Dmtc/hFJjktTKRa4bGUDQV2JNKOarLQ3G/B0TvwB
	sPHHk9Wa7ds9pIobB8NkNR6bqwTClIbw11oNidtP/CHzKtXKG+uffv8LWVBuJ65F
	CMlxhfTgLwRF5jr1iB9fmF92oyJzP6J0YdU38aM5ogNAXNKYkRsPLVQwJjYBzdLa
	/YWFHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e0a6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:31:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso13967412a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658660; x=1785263460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=;
        b=UySsZ7ewE2EO0ahhb8bg6KCz8T6vB/JgVPFSNBo2pkctyVJx2A3ALH5eSzij94P+BH
         aVw7mb0NiPbL+/tTJSMjERED9MwOHmFBSNUWRd7QjOF6Qt/YBS7vZPP8vefEbL1YSfIg
         DCxWesA9hanZVwxU493NekGR4BW+D5q4oNAHi1TH9kNe8P544DVU5lqQs0lXaXOAkN6w
         qn/Ql7vlLsy8rgmjXXamPkae4he9JUs3NiUVf3U3s8TAjxp5g7UBxeNJEiU2etfINvRx
         oaZx4fhR15gAcJdGFr2PaieNCNChmZOvEK3y+T0sywD7oyfluS+eCMxQhK1C7glTtsLx
         rj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658660; x=1785263460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=;
        b=qvODIzCxhmTGOZIbVCun9UcwPD6d+GEHmHgQNoZfqrYVURR4A45t2HgO9Nnv+SS4fb
         GuWTCwr0WIVhsicaiIHUuMEWm8mD2cmKK58HtwFqAhjix2/gLJ6yRhIPY0H0S2+Tqx9y
         7HAAykXbJgXkXD2QXT4GUJsj9rJEO8fZsvFAstS+68c8dvO7ERhl0gMw1HDa+n9nhpAm
         WcMeoDZVej7kEMLfEHQULbrfTe4SdvtG5pZoT3hy9waafsnOkwOm11n64JCY4Q2foJhB
         bB7/VLmw6OWpfHUVw0/efjiVMLQoGf3BgUJ+HpFCQfnAuB7sEumfyCRHRwpDIWTO/u2c
         wmCg==
X-Gm-Message-State: AOJu0YxrsTitBEZt9COOzx70yiL3PRaLqWgj0QIKVhP8bA9CCWaKc0Jl
	3EXkzAB4K7iNU7gNdh8oa77rZwm9jWPYhmNsNC+fCROt5FhcHhKQeXVCAAtBIitYlak/uyQv24w
	KpxqzwN6fsrvPBI/NuIBSYU6/ppk1/sC/pzza+1AjvhnPCjPd0IRK2rvxqeUfI4wPrw==
X-Gm-Gg: AR+sD13R83BeaZaicGszT4wfKckRakgVdziXcvbOip+S3ruPm0KedEScz55xYOtfndo
	pz10QFkjOrycYnG0kNqqWYj1GY49o5SIU0D/7rDPShgtwn4KyQbGeOXWQKyI/KFTaTuzS+TbS3G
	C6lxAe3OYSQeX0621g3nHGpS1M5hADL4hcc7Q71hEEmFcnbf3GwXRl+vLXGrXTxnbHa06To4tdC
	kU4yKZQe4ccMo6OQ6dW8J3U59Jli5jP2JggbJqHNwPrA+PuWIR9WES2+KSMXPyEeBq4+TJ0WtmA
	imrrwGXd+B9ei9QCP2LLCcTQbyWMFNRJTZB0qM481w/JGUcJfnHS/QJPHskDP78sBvcp9VFhlFy
	J25jSYlFo4sJvCIoUpvTNslqE/OXAOh6fFiY=
X-Received: by 2002:a05:6a20:c70b:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c3ad600b4dmr20941793637.10.1784658660264;
        Tue, 21 Jul 2026 11:31:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:c70b:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c3ad600b4dmr20941746637.10.1784658659751;
        Tue, 21 Jul 2026 11:30:59 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:59 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:13 +0530
Subject: [PATCH v2 08/10] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-8-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1138;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=OS3nTF5uZPVKUD9c+8gRRWe/CCVuPxrxct2FrXKjb9g=;
 b=fxSUs7sskz28RP5L7ovnF1zUOcd5APy+e4zGoyJcuIWsZqb4bRibuaRo31EJ7gt0YoCzYusAw
 7VtTFeMuA1kCuDp3Or9fRBCcp2Q7duZI6wIaZz0EOIiXm4QFjmXZnr5
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: Pl1UIWiIND_yaMWGtABAvLME6KRGWxQt
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fbae5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Pl1UIWiIND_yaMWGtABAvLME6KRGWxQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX9WttQNkLvAGI
 Kv5w3d0QFzj0yrOHfwswsQIY85sX/LpMElRjplWeteABvOem31G/8PczFTMyVPpxdEI/j6JVMZ2
 ICyVgFggU5M4ZeXy1sBz+lU7m1CqG5F3OhXWydZVpUKNZsnKqJtJFIJz7WY/qoFKe8hkMc6wa9x
 fGwoe2HL8R2FFHIl/YFr35ZeCnKUF3lXseEFeXpZK+M08a0Kk0cTZw5zmWI3N0vMQcs+7cA2/PS
 75LTgl/hVTfAwFlK0DacrmaEKWwnYn6kzvL7/K9G84XVEV0OdOv3LUaKKRfQX/H/pfm9KMXZ1fp
 XzrTAp/vEjPRgsBIf8rZT3at+kBlXMv5vi4T9id+HDtYYRj4Qn//lrYUfV3wRfVZLKp1q64QsYi
 Xz06WDTiPBiBd4ku3UxkbR5HM59sbY/GRnqgcgnLo2WZW0KS8txncist1WGJhO5kyNE7GfCwK98
 QuV5ynqiKxweiSOMiew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX7hbvxE2jUOEs
 ymBOHgB9te02ePH/6j2+OE5JBEyL6SAtdzp4h7WsH7yF3HGbE18EY1KOzwmPMNxG2LISkp3xMyK
 WW3H9nMDaTP0jhw3mNkzAptiHgiHxxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..67b77272b0cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,15 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

