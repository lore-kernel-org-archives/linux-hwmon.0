Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003C37BE71
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687389; cv=none; b=bcbrAd3eq34ADBINT0ZkNEbgtLojLnLSLqYK5WZlayKP0dlPX+0c4zGLPfHgwUZbEgnFqymtQQfuVytRYhF7MQBK5jrL+D5xGzE8AIjei0EGENJwfneekPzXq7xr4XjuZDfPJju7Uv8upYjgIc56hR7/z8CXryTwNeTMIuKL7kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687389; c=relaxed/simple;
	bh=vB3F+GrFSsJFsCj1zdfhKmxnlVYkLjmMEKrzHcTKtQ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B9hwmKPxdyzuWhpq6mOLgr38B16+NQuEeNwheEOFL5hUzOsvVbSnBDuJcHUV53wqPHwCNAeBe4+7oPBtQjf1ozZCKvlajMJlwQIi9A2u7Jldnive2XppMI5P4MXxww4dUvf2b21TQ5HpUpDT79Zbx3BFg9qIgl497s959nB81Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKgeRBI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aes8+ETi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKgeRBI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aes8+ETi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqZaG3936567
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P5/6VkAAW56MNBgPb8smRt
	9B2s8Z/+Z0hyZq9f3fgtM=; b=kKgeRBI8Fkflt7HtrG2FRFt+vLzM2wTUqg0op4
	Gxq6cxpN7AkxJfUSd1HueO87jgiimiqucUl3vU02Ri4vvxoo61n9Vwlv0v+ILMPs
	ePeZVAjyElBMDVr13KlEIpYEYIC+NkAd03iPGv2DED9ews1p8UOOVgKJgnGq6uHg
	kUvEMNaJMRwKGcJhHWz9B8cGbSgjvY+7Dx7SNxyw8D7CkbZeOA+jm6J2axhTJsZ4
	T9eqlEg1ln3mOEeeNQoeO6mcJl5hKjqtraEH1+B8pKVSHFNwajo5GiE9UnfveNp5
	egD+bTQSGOCnHEsGKjUxt5hOwOBUM2tQEf10G/crcPm/j4LQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gmft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:09:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91785bd637bso22094266d6.1
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687386; x=1791292186; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P5/6VkAAW56MNBgPb8smRt9B2s8Z/+Z0hyZq9f3fgtM=;
        b=aes8+ETihn2P7EHFb6v2/9RJETgUCV0aeUEmlPMeihtNyh4+t+5nALGm4SozsE/VsV
         4WReSWaW/aUB5sQ2WibD2jqtXaRquFT6znCl0dsQrSsdez8YT5j3M+cNqWMojjr+zevC
         xLOVOZ4/9oHFuwZNhxFxBCaufhSu+d3EKwSaNjGb30jPnjtpnywaNj9go6P3BL9yIzto
         PLmYaZ1Ce09PHUorbbaOTQeYER1HgNV6z+BFd3K226nxmjQN5XH2Bg5BZ3y+QfiSAqun
         npaQmTIe4q34tQ0vJ6cKLBI8/YgJnOrHmkS05iWzNiy/AyfO7GgpKzeGYZXaJysBLIFd
         nJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687386; x=1791292186;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P5/6VkAAW56MNBgPb8smRt9B2s8Z/+Z0hyZq9f3fgtM=;
        b=cVEgA0XL0fK2qZ6mwY1puO2ANe2Pxx5fMoB158jwsx86sBZ9kMZl2jqMcwqBdpPWGi
         C+vU7RjA4La9fxVqJQGmgSw44txnxwtPf9455SDHTZph52+7mMCDq4p4LnOKnk2xaTb6
         vhYCkbfjTLOscZuREttkyXfqQA9u0fzRzyJ5bXcMI8KLupvnVTr/6UmBE7lJTfoweom4
         jgtyubx6d2GBWetwJcLmMhw1pfERb/ZbqVUx/9RTXK5wI9o+mtWonThdHnSwVGSyuR2E
         +vmIEZq56LRmSGNStgj0uKankTQGutPgpB2EKKEOh/9G1rFz6wIo256uexD0HgW/7u4x
         bF5g==
X-Gm-Message-State: AFq9FYJjiZe1OEJ4CWbk2VvP3r5g9AJZrteiHxH7n65/x1NFNY04E2IY
	L5OetKbA/1ToiR63eS7KsSTe0VK++CR3IjX+Rksaqhsa66OnuFkGcB67KEQX2LIghnULMf7Lixy
	hi5+wJiFkw2m1V/t/jHJDQPD2PHdLxexzvWDeeWVFGAji4llhP7PszVM93r7Hcf+atA==
X-Gm-Gg: AYBFou0Xk/Mw1J3606XHgbQZ771mphw1Bjhpo0gAVIlFIMCf2nC5NS77kdz9E1KRocg
	M1sDuXGxTMXqYK7sz01+gl7/R4ZVSPGPFPy2YS2MK0/9q0Mv9IRGmT+ryxdWjEyZNnRPef64CH9
	ySmZDm2yL1be7RlbARqdWgTQG+Fw7CCbT9dsLLyuog93q8iEvwS7hY01e57E9ka+qdzSWF4tuq4
	n8DCcKg3IlRvIu/6xWeHcmRlede/M4NqsKtX/FmhYacXxPqnemRJjhkPjUgQ94sivdclITM6TCA
	LzDT9tYgFhMFui8l8sOqrShYrFWX1xi3RK9Q7W1kUBNcuFLrCGb5kPzN41JQSXBgTKlrXpP3eb3
	9P3D6sCf/jp+BszdWmng4rL0JDlqKpmRhgdY=
X-Received: by 2002:a05:6214:501a:b0:914:4cfc:38a4 with SMTP id 6a1803df08f44-9144cfc3ee4mr179848156d6.25.1790687385583;
        Tue, 29 Sep 2026 06:09:45 -0700 (PDT)
X-Received: by 2002:a05:6214:501a:b0:914:4cfc:38a4 with SMTP id 6a1803df08f44-9144cfc3ee4mr179846776d6.25.1790687384439;
        Tue, 29 Sep 2026 06:09:44 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:09:43 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v3 00/12] hwmon: Add Qualcomm SPMI BCL driver
Date: Tue, 29 Sep 2026 18:39:32 +0530
Message-Id: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIy4u2oC/23PTWrDMBAF4KsYraswmtiSmlXvUbrQz7gWxFYsO
 W5CyN07iReFtpuBN0gf826iUklUxaG5iUJrqilPHPYvjQiDmz5JpshZIKAGgyDnkEfpw1EOX2O
 epI4aMKjXjpwX/OlUqE+XJ/j+wXlIdcnl+vRX9dhuFIL+Ta1KgjS+Rd2DN8apt1zrbj67I78bd
 zzEQ1zxRzGIfxRkpSdPaKEjZfw/yn07tNB85sLLdq04uSUMXPfQqOj3SNoET8FGqywRRWi5qwX
 EVrWIJmLsWLp/A+J1YRtCAQAA
X-Change-ID: 20260720-qcom-bcl-hwmon-6d602c195eab
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=5889;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vB3F+GrFSsJFsCj1zdfhKmxnlVYkLjmMEKrzHcTKtQ8=;
 b=jNIo1xD7PbwnTZjn+7rWYsDmjDaDLyiyi8f7zs9mlePmKf7tgZHbEP9aufZ5PkpXZRzY6VvYp
 uBgn4BiyQBVA1D53U+ZPlufQ1eN5otXJhYe0OwMYWWi1WLsM8HaFcU0
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXx7uumdubSwIW
 fTtiK+almDP4E9SNvd8zUSmcr96/bFHRwO7l27mvuR+tXS/re/8q7mB1qR04KeaGpLW5xWyMzBn
 Ka3o//sx6gvRraz8uyXwkLOjfxRYfbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3NGs2J0PQj/b
 fjrDqJc7AKqltG9JyhwlAB1mAHhbcJax/DyVMFqt8DuJAJXO0NDBOlEN6HUM5ccK2hHjrExf7Ts
 K6BOMQHQnInS1KYeLQOZgAk7VS98mGMVG+od3h4ASoEsAid6qRAoAS7NSzew4sseja51w95YbkY
 s34z1pDIzuNCRQLHXhNCpLah+ll1teJaekk9HliieBON9C6dMcz3gLU9+oCxbi0Oeqwabwf10gA
 OCSVT4Cv0mmjkeWHsK3zDSFzec+na3HzVgi1BWOJ9fvTpQEkYNymIRT+k4NeglVA5lqOpQ2XY6M
 FEo7xuO5atT6DzxBqGWuY+aSEXhzW6MOzaOzlseiIR2sDnFp4jeXx7U8iVU3SiQg41Xk9o7dqHZ
 jCyaz5sxFOJH6VrMPrQLXoFRcah8JByoO0QQcapPlM5yE9l+HrH5tAErzjmuscHbEibi/NRi9hz
 FJGSrb8X0Fr9cy5TQZA==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbb89a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8 a=S1ockVxmnWB0F84MHPgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: F7LHf-Du1D5K4Xe3cTmuOx4Gh50liPzk
X-Proofpoint-GUID: F7LHf-Du1D5K4Xe3cTmuOx4Gh50liPzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

This series introduces support for the Qualcomm SPMI PMIC Battery Current
Limiting (BCL) hardware monitor present in various Qualcomm PMICs.

The BCL hardware ensures robust battery protection by monitoring battery
conditions in real time and triggering interrupts when predefined
thresholds are crossed. These alerts allow the system to respond
proactively, preventing battery degradation and preserving system
reliability under adverse power conditions.

The driver integrates with the standard hwmon subsystem, exposing battery
measurements and configurable alarm thresholds. This design enables
seamless integration with existing system monitoring tools and thermal
management frameworks.

Key features:
- Battery/system under voltage and over current monitoring support
- Real-time voltage and current readings support
- Configurable threshold-based alarms (warning, critical and emergency)
- Interrupt-driven notifications for threshold violations
- Automatic threshold management with polling-based recovery
- Hardware-specific scaling factors and threshold representations

Voltage and current monitoring can be independently enabled/disabled
by firmware, and the driver automatically detects the enabled features
at probe time.

Dependencies:
- This series depends on the following patch, which is currently present
  in linux-next but is not yet in the mainline tree:
  https://lore.kernel.org/all/20260813211433.879638-1-linux@roeck-us.net/

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Changes in v3:
- Rebased series and added 3rd alarm (emergency limit alarm) support for all PMICs
- Used static hwmon info building instead of dynamic info (Guenter)
- Removed unnecessary generic labels sysfs (Guenter)
- Renamed struct bcl_channel_cfg fields with _mu suffix for clarity
- Removed linux/mod_devicetable.h include (Uwe)
- Fixed uninitialized cache timestamps (sashiko ai)
- Fixed Integer truncation in threshold writes(sashiko ai)
- Fixed Missing data_field_bits_size in pmh0101_data (sashiko ai)
- Fixed DIV_ROUND_CLOSEST 32-bit architecture issue (sashiko ai)
- Fixed CHANNEL_CURR max_mu values using correct formula
- Fixed critical teardown race conditions
- Added device tree nodes for PM7550 and PM7550BA on Eliza platform
- Link to v2: https://lore.kernel.org/r/20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com

Changes in v2:
- Reworked the binding from the generic qcom,bcl-hwmon.yaml schema to a
  PMIC-specific qcom,pm7250b-bcl.yaml schema using exact compatible strings.(Krzysztof)
- Dropped the DT-configured overcurrent-thresholds-milliamp property.(Konrad)
- Renamed interrupt names from "bcl-max-min"/"bcl-critical" to
  "max-min"/"critical".(Krzysztof)
- Limited the binding and driver match table to the supported PMICs:
  PM7250B, PM8350C, PM8550, PMH0101, PMIH0108, SMB2360 and SMB2370.(Daniel)
- Folded qcom-bcl-hwmon.h into qcom-bcl-hwmon.c and removed the
  macro-generated alarm mapping helpers.(Krzysztof/Bjorn/Daniel)
- Reworked the driver around per-PMIC register descriptors instead of
  generic BCL generation/mode descriptors.(Krzysztof/Bjorn)
- Added support for 16-bit voltage/current input registers and
  SMB2360/SMB2370 2S/3S battery configuration based scaling.
- Build hwmon channel information dynamically from hardware enable state
  instead of registering static voltage/current channel sets.(Daniel)
- Improved alarm IRQ handling with per-alarm locking, wake state tracking,
  shutdown guards, and explicit delayed-work cleanup.
- Switched probe/error paths to dev_err_probe() and tightened BCL enable,
  regmap-field, and hwmon registration handling.
- Link to v1: https://lore.kernel.org/r/20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com

---
Manaf Meethalavalappu Pallikunhi (12):
      dt-bindings: hwmon: Describe Qualcomm BCL hardware
      hwmon: Add Qualcomm PMIC BCL driver
      arm64: dts: qcom: hamoa-pmic: Enable BCL sensor node
      arm64: dts: qcom: pm7250b: Enable BCL sensor node
      arm64: dts: qcom: pm7550-eliza: Enable BCL sensor node
      arm64: dts: qcom: pm7550ba-eliza: Enable BCL sensor node
      arm64: dts: qcom: pm8350c: Enable BCL sensor node
      arm64: dts: qcom: pm8550: Enable BCL sensor node
      arm64: dts: qcom: pmh0101: Enable BCL sensor node
      arm64: dts: qcom: pmih0108-kaanapali: Enable BCL sensor node
      arm64: dts: qcom: pmih0108: Enable BCL sensor node
      arm64: dts: qcom: smb2370: Enable BCL sensor node

 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           |   69 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |   22 +
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   11 +
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi       |   11 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   12 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |   11 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |   11 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |   11 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |   11 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/qcom-bcl-hwmon.c                     | 1440 ++++++++++++++++++++
 16 files changed, 1655 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260720-qcom-bcl-hwmon-6d602c195eab
prerequisite-patch-id: 1db32e67cbec8d818eeed046d68022414227d2d5

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

