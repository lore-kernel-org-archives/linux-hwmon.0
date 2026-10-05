Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B3136E483
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203091; cv=none; b=YYreBrhXRrfHuAMDEQ/xtI1PSnS7B573PtPE0/qFvnZeoZlwWJiSyAbuYgd+hyZIhptieOZPG8wP3ZmSD2WDDSliuInkyGHHCTNIAR7Vg6zALZepXO8zolZe3HpNHQ0C+nI+M26fn8HJ4d6r8L9tallh8BVT20Cy4vyL8MdoCbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203091; c=relaxed/simple;
	bh=wvhfkC0+6kAkCd1sbkK0nFnlDkjbIPFQnrm6RfXrdrU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TC2lhQpCjC9K64veddA2awiRmtmINGfKAFO8157NP36Xa6mpYU8acuEQisfIrs7PO7zdlrQhwJGTJyfnTyNMYOhsHJLmct/MViGHWKCenuWyrG8Lo0rUhhHkv8e5fuVimBdc70bdgUyOh7c45Gr13wMdK4V8R5JUPJeoTECnFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8IsqklI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnvB9jas; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8IsqklI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnvB9jas"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFlCu1926097
	for <linux-hwmon@vger.kernel.org>; Mon, 5 Oct 2026 12:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xUAKTtMT+7kE3QPecKf9yI
	88Z79CjfRPoLwepPAndxM=; b=G8IsqklIXgWhPi7NVSGlM0jxztiCSs3QuExO+s
	3D22QXd7sJ+k7906fzEKOQJUME7LYv1zL7X5FUIzIZpqNSiztbDBUqTbgMP40Y3P
	996sBR2u7Ou7QOykqiWccengjE7UCdft3x0R6nSdW31A8t0DBkQ0hnYTOC2YBf3n
	5SPS7LuHCdX3bIp0fzrlcZRquVwMdV+lUsfK8H0Bmh49pqKV9OLACRSI6CCSlQfk
	iP7t21uXlbiKekqTeM+mXfo1iEMux7l6pjWgESS35vNB8wr32BkxmXbJx/fZKhUl
	FfH3bJoJjoXP0KFM8/g1V0kPasvpeM1eILyZg5eveM76+D4Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyt1wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 12:24:49 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6dccace8338so3750355eaf.3
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203088; x=1791807888; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xUAKTtMT+7kE3QPecKf9yI88Z79CjfRPoLwepPAndxM=;
        b=MnvB9jasYydLflA5E+RZFNq8RdSSvrzaDxTk6jHMBRIg9jtk1lDJBUWLYVJEmH55ey
         OL5+vs5XCIQKmEwBanLXSmakYwiBu7m3RymPpIuNmWAbAQKqdeTvWJAOXrGPLcBvcty/
         KRyLavuXCKt9bU7/H7xChnBahgt1Pcy7MHVV2Gjdx4fpGNolb/eKQxb0hdxw+Wiams7R
         tcjKFNp1mmdVkBdgZVtvu3g+tJH4qSqJ++/Y4h2is8rIqLGfS+zDA7lGm2QB+JR+47eY
         GhcIzBZbCH/Wp3/+7Ll3m4THxBrQFwe1wskmaNxVwN6gqHt4up2n8iG3ttQiO6zKru77
         49Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203088; x=1791807888;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xUAKTtMT+7kE3QPecKf9yI88Z79CjfRPoLwepPAndxM=;
        b=gKHEaIb587PDSfPeIPrAmfr3hScC/Oe9j62sjcBU+5KATBL3KpLMoECGiwbCfBNh5O
         YqSUv8p2ACiIoIxamz82uRkWj+zIicWrTOyBI7jo+/ZgMTo3WZ3veqFeEnRe6sfI9aQb
         Ya4Yg6UP1wdkx+MCVazHDrQwqSViQl/T8veIXeJ9kxC1Z6IEqgH1bAyQJBeDiFmqbfN9
         DuCm9EI1c+Y6ITL8mNfWfnHprCWBIKhvs4VOiU/SIv3coQplEXLc2adX/JTJTKzAkbCL
         v/J5OG/0w9Pybe00KNCDeECVoMAbZnpR1bYyYA0ZdCeWcL5cXARQ1lhkZLFhc47AMqcJ
         BBuA==
X-Gm-Message-State: AFuF++nrQs3fBDHy1aNe2Xes0IUMQvSUokJabXTAaZohMg9FOTDrE/9V
	/RiNI33isPfzMsicl1m72XZxewkQB9W/RTUum0nO+Sj1FQ3Hg5W7BzbzkmynYOc03EKf8qL4JO8
	nh/ZMEdD15f1f1AqpLaaKIDuJOdRFYJy2U5zYdZ0pK1ZUPZXJwJfL+dQzscIDmYJLpA==
X-Gm-Gg: AYBFou1pbYz92RqGFAE9qEAYQPwdbHsnz9eWuJvTM5COGrl9o1c/a5ECqdTrjL4QOMH
	i7rNvV4xtd+cPT78YKQJKHpqeD9oaxKp0E5/gDeJ6KDhQpORptFDNS6PsPitdDuYm5ZgCznQtrd
	roJO7Yq4SC+u6iWxiVRm0ZkiV01QV6s8qPYQGaGcqEehFxIMlPkqHdCb9lufIwBzTymu3ataJrA
	CkV01D02wzXPSy5pkpjXCgLHs/ZihZBtd2q4hjZBef2O4SrwwskXrUN9n9J+oWQ05hBNcgmlU9W
	U3WrA28CaX8PbxOdKbxZBEX16oPqR4C1fWXDRIzCEabYevXWzeHvfdJeEH+Wrc82ToPAECNLl4s
	hL43wGrsDtN4fOkV6TcIV6BTdr161Kkibgw==
X-Received: by 2002:a05:6820:184b:b0:6e0:1599:a52 with SMTP id 006d021491bc7-6e09d7af01fmr6385086eaf.19.1791203088174;
        Mon, 05 Oct 2026 05:24:48 -0700 (PDT)
X-Received: by 2002:a05:6820:184b:b0:6e0:1599:a52 with SMTP id 006d021491bc7-6e09d7af01fmr6385063eaf.19.1791203087623;
        Mon, 05 Oct 2026 05:24:47 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:24:47 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v4 00/12] hwmon: Add Qualcomm SPMI BCL driver
Date: Mon, 05 Oct 2026 17:54:01 +0530
Message-Id: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGWw2oC/3XQzQrCMAwH8FeRnq2kmWs3T76HeGhr5gpuda1OZ
 ezd7VQQ/LgE/iH5QTKwSMFRZKvZwAL1LjrfprCcz5itdbsn7nYpMwSUoBB4Z33DjT3w+tL4lsu
 dBLSizEkblpaOgSp3fYCbbcq1iycfbg+/F1P3SSHIT6oXHLgyS5QVGKW0WPsYF91ZH9Jcs0iFT
 WKPb0UhfimYlIoMYQE5CWX+KNlbKbH8UrJJya0GKIrSVuqHMj7PDdSd09tOr5vH8Q74Ht52VAE
 AAA==
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=6280;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=wvhfkC0+6kAkCd1sbkK0nFnlDkjbIPFQnrm6RfXrdrU=;
 b=uWQUfF2Tqe09J0IxmOvzSf/WrTPRHCT0TNBCRSIvD0CC1Y+cNHttoFWJ2SPI29IqhPKXCH1HB
 gasoyXdcFe7Aay4F370hfsePy2EF/cAzl+zj3c3LqOI4E7ZiXhbmQ4f
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: aoNO9CponEd6zH2nvLSixEoHAj-xMSfi
X-Proofpoint-ORIG-GUID: aoNO9CponEd6zH2nvLSixEoHAj-xMSfi
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac39711 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8 a=fYGD6PGVl6oGweeeR08A:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX0yJDNOc+oQL8
 n8MfI4qNjro+MKk04kXpX73LjHERgu/P54eyJxwpqn3PmLhzdsHrqDFDIctJF+Z5EYp+ueq1Vjt
 2E8g1hUR16TeaX4KgBdnGYmCPVWS5O1K6IEoTuDlwIDsztZaQrFiUGeFm03KHTMU4SV2EuB8Zdq
 eSbi0hd9xoBtAJZmyjGRFZO11QQeVMjU+BDIOfvHWHwAthxS74mTWDEF/LmMtyi/Qa7+MSoZMwR
 OoThzekWHuie+FNX8HeBOe9sN5dwvJnSdyQsgvV0RaMAD1a+AFDtDfViFFk0DY8+imZChBAzjOX
 HJAP1W3TCQwjz0z8aUI16UZm438IHtifKUGo4YqhglNhQbvFmeWIGSXUpfRJ7pJBPIoRYMQDys5
 /YMX8hMcbQSUX2IH1m30OJAQYvRR2tkhqQvPPcLd0yKqa2qfYgT+LhBvlKDCfWvYP6lrQLuRlHx
 lQveIXgx5uYdbo8rVCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/qEg9v16RJOt
 Rw+McLubpXKUqQABBuTmZKpgnDaYp7UbdBHefONFsYSrsiKhEfWvc8OGogiSP4clWPQ3orf42lG
 qjKUqd+Bi1ElOPc/eQXdMrBBhOqSPSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

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
Changes in v4:
- Dropped empty line from pm8350c devicetree change (Abel Vesa)
- Fixed use-after-free in delayed work in tear down path (Sashiko)
- Updated DIV_S64_ROUND_CLOSEST instead of the biased add-500000-then-truncate pattern (Sashiko)
- Updated regmap_bulk_read() for the 16-bit LSB/MSB pair (Sashiko)
- Removed dead code after above fixes
- Link to v3: https://lore.kernel.org/r/20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com

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
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |   11 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |   11 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |   11 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |   11 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/qcom-bcl-hwmon.c                     | 1448 ++++++++++++++++++++
 16 files changed, 1662 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260720-qcom-bcl-hwmon-6d602c195eab

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

