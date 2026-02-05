Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46897326955
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326097; cv=none; b=NQfN8naCjen4H+CsWuRu/EHrOJgnPT6vsTgxLQ7WZvr0E1yYkXJjRrdd7mYxWDrZ3QA9+MAFJDrxVTljzEwrhsjWKnoNExDFo+NySUMk8f6D8xHeVqG+ryXGp9WGihACOYRLXYoOylaHn00up8tultobZqU6nqeGUsP56ZQgys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326097; c=relaxed/simple;
	bh=R28ctyRfWvYF1AcAyUM3MdJI+xYN+EibX6fe5/NpQSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bBj4FUHzaBWKaLZfVgqK844aNlGWDwmJJLCUvlF+qLA/+85ilHOkAFiZQJcXXYaApdmBFOckYMdgXTYXEigZK0cWtMeWjO/mO98LWxqBR7DaiG6oD19JrAxLkrbDegNBEQbMkMxSUjRbJsSZF9u2tOuUanI063lLy84dnVvEDXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cpm6O+cd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqkKt7Q8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cpm6O+cd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqkKt7Q8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Frhx4872443
	for <linux-hwmon@vger.kernel.org>; Thu, 5 Feb 2026 21:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zMAmK55w1caUuW1KuyJwzi
	CE6kDjy5Wma1Xxymy+Hw0=; b=Cpm6O+cdn1zqXu2MWl8YKiSCH3iunm/5Ljd17A
	ZLrJ6aFdfEmjabM9E5GX7kodBf0FUHQiy4d9laJwviULV+kKnFJcSAJGCpnUga8m
	Pq+qQluzgu0aIlgN2P8d6KtjSEq5AwPuDaI1jbOaOhSCwn+3Z0e2vSEBA0Yl+jAe
	hOyQ2VnybvmubNg6Ej/zgLlFhMxJU9FokMVdg4fhSXFMNqjSlFRK2wRRMqvVny9s
	lhtMTkWkzkZVNXygJNA8e1EIiu7PaZMRTMIGyzv8Ewb66vbh5nbquaGPga2tOBfx
	LiU8qgauKA+SIGkUEs9i8dhowGcG/HOyg3KIADuSRA3mnZhQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bh124-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 21:14:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3547cd89bcfso3266941a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 13:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770326096; x=1770930896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMAmK55w1caUuW1KuyJwziCE6kDjy5Wma1Xxymy+Hw0=;
        b=gqkKt7Q8jWk9keHG7HOa2jdfXPMyZV2pr9gOdJsiT23qW5/DsPLLXObF4ViYXkOmDa
         WLdIHUT/PfPlRCWpfxOQUmEHO17skQk/PdeXtdXRfA9js15mCkcJM/zrsMnM7QPuMiDZ
         pces/tGSRoJAQak6AHQRiOR5jC5tqBpNtXZO+dJPAraUI+Do2BjXJ3AByWdEDzhCtEaB
         DefcVSrSkI1Jh90aqwV+fyDWSS45OMyl2EgPFMA2hhWGEJabVxEln6mR3sATcGk2QLPH
         4UC7Zdbok2nIwSsnYnYL0iB+aC4s0nuTABv69QB7jcxkuKe7JysygapnJ7HhluSWc6f7
         iE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326096; x=1770930896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMAmK55w1caUuW1KuyJwziCE6kDjy5Wma1Xxymy+Hw0=;
        b=lAxPfJQ60WZTKmJPHY4+GMO9rh7Z+yYzPia5VF85Mffr54ZX2CS78ZivqgB52zyXaQ
         ISt8S2XNifQjVxjhAKvC21lnmInT8pm98BsEYKW8CwJ+DoK1MNBLys8bwLbrwRHiYlii
         xvvGXRu2cx8Reqhbm18mr7qcGi1iHeA8YZwXcNGcRF+apgKWSxqxhxxvIaM6wE8c5Xjv
         k4bLIWsYq1b68YdCxIf2SvVmS9nEp/kgxmsXGki/Ig4pbtMnBYDuYgfGwq6h2ucEiJTD
         fs/dl8aduKXToJT93vT7+sg5NwzEsbnhAavFrA2n1vV62QKwVmlfT6w9jaLJ0Ydl6+D0
         o62w==
X-Gm-Message-State: AOJu0Yy9v03LjKk0XHbu9HIkTb5PWhtcVArmNXnJvzHDRURI/kUAGBc6
	vPWC4Frvvk0bjDkHsUBkwIHNeb4vy+ob9zvCdETeJpgEBpzSUIf21xA7XOiTuJP78slCUsM4x3n
	781S3A9VKM0MYxMzT9KZmX6podIHJOTbiNx6WBSHh792+1hFvED5WEpnjZagcR++UCQ==
X-Gm-Gg: AZuq6aKfxnC25tZTaqOKrYezdTpikd+kXDlN7EC0A50eXD0SlAp32GbMj6zeyB6+7LA
	b3gn+C4tqPazt2fHTxtaO+9M9MtdlnFQtTVnZWndN13XGUOGNcanvokL3Ye7exk9z5wBzQAu12W
	fkY/YlIABkSPuvAkrHDVKE5DBL2Gch3UP3bx5gXWMI81uRDwtU2kvLXGtegRuYkbqohYu3Nx5fI
	FucqvYsPvPTzl5KdViZMoahRTK4hQ0gR7vNdfLtpWs7PIaoYUGSr0cN3zGSZMdSFc8YaQAiu4zm
	pxpvCCkcAw5GYelZspm7ct3YMAlmW5hTh3G5E2GF5h4ya0T+lDwqDhEKPO2z/wwQxbfh9sBbcp2
	YKTD9ueiJXsKv7Ycgq4qCXqKgBgUPmnPK1rew5ortRhUa
X-Received: by 2002:a17:90a:f947:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-354b3e264e3mr277531a91.20.1770326095640;
        Thu, 05 Feb 2026 13:14:55 -0800 (PST)
X-Received: by 2002:a17:90a:f947:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-354b3e264e3mr277499a91.20.1770326095076;
        Thu, 05 Feb 2026 13:14:55 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4575897sm74536a91.3.2026.02.05.13.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:14:54 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH 0/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
Date: Fri, 06 Feb 2026 02:44:04 +0530
Message-Id: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwIhWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwMz3cLk/FzdpOQc3Yzy3Pw8XUMTy+RUc+MUSxMTAyWgpoKi1LTMCrC
 B0bG1tQCCmTWQYAAAAA==
X-Change-ID: 20260206-qcom-bcl-hwmon-149ce73d9440
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770326090; l=2419;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=R28ctyRfWvYF1AcAyUM3MdJI+xYN+EibX6fe5/NpQSY=;
 b=LomUW48sd/c8DDC9GA+Hgmzh6Mc1dSngB0j0DKcFtgZddiNhJxqAcA2XPOx/b2TejvDLs8+L8
 sIxJEkhSkSHBzpmDVsbIfjUX327WIdVqmYQhLf9DXgbMTvtRzeLoDIQ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=69850850 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NRMeOcx5ysTwsLa4DNsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: RzgGMhnRtdgpK1D9Tsw9cpeNBcTwvMst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE2MSBTYWx0ZWRfX48Qc8BP3nwS1
 QbZYmS1LP+WhIbhRrimfQwl2q2jYdMMYG88rkTWWZth5GQIsX5A2D2dmKbyXoInXbFMLBftrHgE
 sDPU7mflAe9dwPwpfErbKMTMrAMjLeKbinTs0robSOWMEFoZ1BXJxjjTmUcHHv8xiNI07D8PtW6
 PARPbYtCEFcOkNUa0+NfEHw8kn2bOd9Hn0jP2yj2XyUNydNEclKbQjgYK/oFmMkCnYys5gxvU/F
 GJaRwlsVE+TFXBMguLTeSexTusMc7To8EgZe0qmE0v6SEeOnTUXr026k573AJOVuE2ififWGm56
 ge0KsibUf9vaQvWhJOV2xj9X5EO+AiX7r818GT7cRuJOp8LgwjN2o5OfnfhbhG7FbPkWYMByldg
 gwmdL5021heuIRrEjQIf60LZ2RqxE0VJXT5t8BmWUPZv0fKi/8ka6lqFsbKHxFnTN5Kh2FmRSYu
 b/wWV7QgYtcSuDRb9wA==
X-Proofpoint-GUID: RzgGMhnRtdgpK1D9Tsw9cpeNBcTwvMst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050161

Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
monitor driver. The BCL peripheral is present in Qualcomm PMICs and
provides real-time monitoring battery overcurrent and under voltage
conditions.

Hardware Overview:
The BCL hardware monitors battery voltage and current through dedicated
channels with configurable thresholds. It supports different alarm
levels with independent interrupt lines:
- Level 0 (LVL0): Maximum/Minimum threshold - mapped to hwmon min/max
- Level 1 (LVL1): Critical threshold - mapped to hwmon lcrit/crit

There are 3 modes of BCL hardware
- BMX -  Both under voltage and over current monitor support
- CORE - Only under voltage monitor support
- WB -   Both under voltage and over current monitor support. It also
         supports current comparator for current monitor

The hardware uses different threshold representation schemes:
- Raw ADC values for Level 0 voltage thresholds
- Indexed values for Level 1 voltage thresholds
- Raw ADC values with variant-specific scaling for current thresholds
- Indexed value for current threshold for BCL WB modes.

Voltage and current monitoring can be independently enabled/disabled
by firmware, and the driver automatically detects the enabled features
at probe time.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Manaf Meethalavalappu Pallikunhi (4):
      dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
      hwmon: Add Qualcomm PMIC BCL hardware monitor driver
      arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
      arm64: dts: qcom: pm8350c: Enable Qualcomm BCL device

 .../devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml  | 128 +++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |  10 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   9 +
 drivers/hwmon/Kconfig                              |   9 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/qcom-bcl-hwmon.c                     | 982 +++++++++++++++++++++
 drivers/hwmon/qcom-bcl-hwmon.h                     | 311 +++++++
 8 files changed, 1459 insertions(+)
---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20260206-qcom-bcl-hwmon-149ce73d9440

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

