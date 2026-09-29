Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD602528423
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687449; cv=none; b=lBWdntxTzszlxb83OovNRfwRSGTXzMskpWdo4OsYRXcuoq0ALfRI2+Z1Zw/RbAEOc+zveTCNABTzOsupcffnZddJa2yFoapN5enDUgplCwlfrjo2KEz7e9OykKw3tg2AxJXIp7NKsJKinGWWMF45fQqfNxJe7nLwUuLZhkyBdWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687449; c=relaxed/simple;
	bh=rlQM2xDP6AVNaE3KnI4qJlUs4e7i+us9u/51Sh7/Pls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tilq+UtYLsTGBpmh90mCzjXlSdJCxofyIhqlFcpeK5AqDZV4gEEu1fhk/JlVB4inm2osPiGtEPill7iZfl14Vo/zcwzYZgVT2n4WYaa9P2Ev7K6G6rmfujRNu/QfvIiZ/FezCKBIfkXa2xzHTBneDkLLH3fEDgSpIL8urykC3qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej7eO5rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRHXPxvx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej7eO5rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRHXPxvx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeKG611416
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=; b=Ej7eO5rthK1xRofA
	5Je50gHyY7bpNpcacJ2DM4MSH0rel84o8N9vFcPXYIGe+WqC8hwQ4R4VOqpP4LAl
	3Xi+yyyEVJq3Iyu4Az4RN13+O/WEA8YWqXZFCw6G5kER7UqSy77prgfYJzZ3/j4A
	qeUFGvUsRl1b5XkkmOIYoHwF+HmZ5TloBkDG/6SQ+PxjyD1hjpDOs8NUT5znw8mb
	8euDFQ+6fBe3Gz97iOJJji90joN59ClINGIydwY7Uy+cvWWMzyA+NidxTRz38B/j
	SIAVft143cWzHOBERwwQWtOBKrnUQ9PzW6seS44xd35r7PifbMb4kPaKOfv9UBea
	O+4knw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u6sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91457ba4f48so21772566d6.1
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687446; x=1791292246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=;
        b=fRHXPxvx9QWDbjLMVH+Xl9x+Xo9KU6sHg5QNHrts2tGxfm1HUOTSZdJdVY1Ct9geu0
         GItPg583edfb9xDwXq0wBJ5lpa+UVzvseK3WPGTwlR4vcbKw+QDkcTrK0MWGozXar4lS
         sXGVXeX8/wF6F1OnERLleMGk8RXav7a+CHSh5QSPdmiq8yI3Iua9Lsife1vhOCrEHjKE
         Mzl24fw48RMYlLHuXLj0XNlJcWlMsxIUho7C48Q7URczGgh9tVZpbU6qjETyWtMsqx9I
         4ABIc5u6C14sotgvrRfLKqV7696EQXBOq5pKu3Zu07SQF6YFQzhy9TS5M+sULJVhXv3O
         KfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687446; x=1791292246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=;
        b=WC2082H1xUgzAFd4lrFZ3VSn5YqnWzpGRepI5RIkkMsxuwj3hYmYlMNQ7Ke7t38F0L
         kmMOrVTZBNG2GJWtG+9khAhsyasVQaY1gQXt8bu4r/qt7DBLKzuVvGstEern5EdDRlbb
         /lEWfi6ItxhIDDigL7sLXMQdiPstE1H0NhoSbF7I0iDaH9rafU9vgLJr91AMcOvfrnN7
         RotgV8VCdbUv9zIdbE8v/rSglu94rduoUxNKYs9siiF3dgAvV0Hcu7Rair9a2zsgx1tI
         /xaLel5IhlXSDaie5g7QfWRNPDdraFqQISDvN+SOro3B23suSYn87n48TNcQGPdrAC/c
         2wkQ==
X-Gm-Message-State: AFuF++lu9AEJJYyAaboLoqumnkqbi1mfMyepZ/EG1EMRAxMFOR7eXBq2
	zAgW2HOvT5LoseRoTl2n68yd1NvZPLCzQkiFYKGpuj6m+7f2i2xiArClE6SVH/es722VhvJiPcJ
	rO+u67YxnQJXd5durctO9vL3bBwjQrxtAZsQDatqiGGZnLjsNLPiW6dEt6ZRA9lyGFkhwr5JxnQ
	==
X-Gm-Gg: AYBFou3DqwKsPzRlKz51DDwhVJz8l9hl2Tw3ErrS1t7NztLz03GvQjOpT9oMUkCP+/u
	62/WnTUpPDxx5qC6T0dZgFuIjGnYmAJwbuM2NBYGyqayUsjDCBkUXYF7Th/ZLOdw6E1PtyYmhM7
	GaqWvV+D6haSwERdISTxRRUJUlAblxqVnSwFHZBOHiYJ4/YxiCInGP8qTpiaQwsL3YWecRZTh5d
	KDVzb6E9B2NjCc3PfeqleJ3AAoZJo9WHme1BMv/hdTX60o1H0B8BaUZBFSEkAKMLAkJQ3DXNXjW
	Qndn1lUYMlx05xOVc/DfsqJaebv5InTSAx2ClKbMg18p5OCS5Rh7+pk8dzU8w5FezI40KG2Uybs
	+gV4ZV+M19bl28ABAQjTSD0SHAZo8kRuRJlE=
X-Received: by 2002:a05:6214:250e:b0:912:16da:b387 with SMTP id 6a1803df08f44-917864940cfmr44608966d6.18.1790687445703;
        Tue, 29 Sep 2026 06:10:45 -0700 (PDT)
X-Received: by 2002:a05:6214:250e:b0:912:16da:b387 with SMTP id 6a1803df08f44-917864940cfmr44608336d6.18.1790687445128;
        Tue, 29 Sep 2026 06:10:45 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:40 +0530
Subject: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1136;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=rlQM2xDP6AVNaE3KnI4qJlUs4e7i+us9u/51Sh7/Pls=;
 b=Ij/auBEVeIbBbuG7Iw2UVKBhfAem37HjgrfVKieJ6/q+RgiiLD7FfUKtfdiI/wqiodchKqSNh
 JVj8QaKLRHZCW7XZzz1C4BCkqCyWhCwhZxiXw+uyGZZKYdY++bZduOA
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXydH7DJwvA2S0
 a16Y5yHM/iAv3K4pTE9DWt8GFGbLo6FVR90pvw+Vi588RwYluBAp1aFfOtVPZ1lmcIy60e4xbA0
 sDeJffVsCwW1bpw3cWr8z9a6G7yoRhE=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb8d6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXy5gXB9gJsEl6
 mnlP3DGLfWwenWKi+ZcnaWEaQSusQ/uM/TTBCvZfexbkQYaWN5aopMeI153XtFOpdcCCFCnqGHb
 5IJDQtjGs1Kkm87Gj1uNF7DIceqMF0pgFYRdSb0F+rNsCz4e4tv7WgREabFJJiqNEHzflPV74JV
 Plc38aZMExy1pTt10Zl20YY9IRhF9p6iFFGAKWAEeD3f86sPqow+2IUjXjC1BCWYXidEIf0u0wz
 K0/5WljiRMogAvg7plLLAGF6AqdZDKVyFR9r/lElE4927LQSQJY/uMPuoLzgYNwKnPm2N0/4bU6
 WLoQjggjPyw4P8ZDZA/rPg7Q63pPSnYe2ocZLXaO5p1tLO2TkjdDDlIlpG/sIXoXE5UWHzoD+rG
 XdPN0vrMvBfSCZ9XeL/ZKhlsaIFVvJLeuq7/NQpkFs2YHV8PpiqsY4xxNqvbOWFoHCnOOv+a6Z5
 B4i8chRxsFIESTHvE/g==
X-Proofpoint-GUID: Xmr9dLK0kws9ywgddiT5BCtNE1dAL0uD
X-Proofpoint-ORIG-GUID: Xmr9dLK0kws9ywgddiT5BCtNE1dAL0uD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

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

