Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB12C47F766
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203110; cv=none; b=M5M05kCq1UZdkoJdEhFeB++2i7hVGyUF2tIoFjHukWSZBQACIMtkeScvgVEFa3hSAOIcxFbUUpNfuVxGmgSFOufU3LEg1hF8gb8xV2DGDUz/S9XPq/4BcQa3pwc+yTCyChmVBxEFX5XQSwUV8s5cO90nrv80p3xykLLMrr+DDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203110; c=relaxed/simple;
	bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WD4ncTxu2HUJ4MG313v0a6Qf6KNxH6ihGlObwrZRjBKH/ZvA9fZcYHhmWXL/cNbKa16SG0JjoTQylB6CATWSiSDOUZ5B1/6XdjfJ3YiFEVf8aC5knLVlfVHj1KJ3UUqd60kCS/YZFbJspV/W2bMU4wFgKZl4aOho5ZnoPItHOWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiRB14a3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpSbQNAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiRB14a3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpSbQNAw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFKDh2365888
	for <linux-hwmon@vger.kernel.org>; Mon, 5 Oct 2026 12:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=PiRB14a3PGf9JcOi
	9FPOldIvC9lLWKnNXd3SAeCQK+wpLAhVQGIyCn66gyOI+Pl+tnJ+fRorBfv66hE6
	/OTOHnNpS7chmGa7FjhslPYgH3L6m0Y6LICrREAxPFG8sktVrG/gYhfM2Gb3mM9Y
	AIAPkTnY9dpptulCnN98hDS/4nTkwzeh4PO83fT4+E2r/Z7tLMRxe1QGVrsI1/sv
	4UTICS3OUhuUMnx0+Xu3u7UBtvwxx9ClADfADA+tdeqfR4VkC7xhIFwSNsktx6uH
	B+TkB/mL+HhplIl6On5ZO7XFlR8Omx0ciCdvrop4SXZ9R+iofFmY3VkTFgIcqo9d
	PV74Rg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvrcwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 12:25:07 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6dd4b4b7d7cso2253100eaf.0
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203107; x=1791807907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=BpSbQNAwCFWROfygm14buzOZ371frLwwWC0UEZnSRRe41bAsYSFCRtQdOjQG3jTywi
         Xuzzo912BMCOFDrbhZCZ1y2b8HVs/qMsDCYSXzWg3Pe5a0FAlN61kKlt7sERgb0fEDFH
         sUOgiuLJCRXJ+sGQfxhpikpCNGXQxJ7Ook45lkf2sywK9FVjuQ0MxEpx0OrrwkAwXhdv
         kOtRFDTmhGA0fIE1m3+pFI1SjROIW3vYxvFYw4xyzBXxOK+6ALfWGE4QzR/Nb9vgzetM
         /TI6dO40S6s5Qtz3g84LdCBzGqeK8tELbyIvmuvRysEqvCMtfQeG0ssm7+mFrDnYQlmW
         b2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203107; x=1791807907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=I3gnf0Fw+zHs48eU578HiiRCMw88ZFgm8QY3qCA9H01K6W3GXIfaT9+PmXtX1KD7EB
         zo/371Uc3NrsLg1tRsKkjdDRFfwhSPZyOxCpf4eLxcMe+MujOhYWLBk/1vVdfxG3j5qe
         71+cCJHb4Lk6bu9471h5KMyV1NqtqVCGPdE6gNFEiedVrYEao7BvoyDbGqPIt9IhTqYK
         98z9jgUrWGsdE6t2JyfosYXVp3vOFQQOVHHLIfYUjw7iBRwrFwmIaek075Zo8BCobrg2
         aqMl2JkY8Op3mA3KHxhiOO0Ixn0Xt5eLfNCLjLklM5uAW2JezUMjmcXSLaqQbdoO0m/I
         TFYw==
X-Gm-Message-State: AFuF++l/DuTKzDL+sJWZnf1AxdfheXpr345EoF0rB41HG6KgAvpOojaV
	uOLJwdMyqIvXpftBGhEuUbcnHz1KlrIOmU+Dy7KJgjg6Y87Xaohj7+X4k0acfC4Qq/w7Uj92tDo
	mq3S+NwpKjyw7ncYJwQStLh/uk3uKrJFJxDBUxIH5VjHe/SVRdaVCoTgRCGj8KitlfA==
X-Gm-Gg: AYBFou1eqzh4YpG7jC/U5GrfEksUb0DNLHXoUbx7uaoEOz6+kIsjR/zH0DV/P7IfMV/
	2Drl4Foyw4c8thxd6hF6kLuDZpUpv/purI0qPnpz9+Pl2k4oC4AUa20DY6ZVWiUrlO4LbWgg6HQ
	ur6LfDxt1oRXwvkYWpqWAtQsESAkJOQ/cHIETXlgDSr3X0QBRwYP9u36toQyo2eBjPrOTFoYwrm
	Mf3nzH7Q8OXpTWuIo2YSRvDaPsJlyCv5qftC/uiIqw/fJtXQzz4hr72oUKvXaD7F9jyMu26w4Y2
	/fhyTRuNP9fJMW8cZpZwAL4ne/kxeVsyPeTh9CX5dlrr6mwIcNLSt4kh0FR5hF4b3nwDSBR7258
	mn/faSYECpC32NeuvYczvP/WbakJufOgGEg==
X-Received: by 2002:a05:6820:1904:b0:6be:4eb3:e1c7 with SMTP id 006d021491bc7-6e09d7af035mr6275810eaf.14.1791203106908;
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
X-Received: by 2002:a05:6820:1904:b0:6be:4eb3:e1c7 with SMTP id 006d021491bc7-6e09d7af035mr6275797eaf.14.1791203106433;
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:04 +0530
Subject: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=2P/b1Rzcshx2aT+h+pH72m9MAJi/41ALYT0f3yobAUvA5rTyfFGdJQeawAkimB2qNIH16umAi
 b6P8W2By7nhBUmEZ1zl3H3rKJi8yT51eg8YhfQEBqNhJng1+ooOPu7Y
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac39723 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: btpbljH0dmbqIXIWiQOUZ1PB75gYCQeD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/4x1MtAYC0vm
 rEUPylEp2NagiyysY9MU7tdKynwRQIJbrEb1HQ7n/MvnFAQZV/GiY9E1orBW6Y/S/VR2Q6wWBru
 taGaVp9FxGRrCGrTeuyotfLjyO7crPOW+KEB00yJH1+vtqIPu9iiEFZiUcRDirFVaOUkvHspT+X
 JI2KyslFFJGdzJZvTBSJJ568jTE3VpnSX1jkKASp9GMXPZZiGFml7DMmzzcHPDXstyBFOWedAmp
 D/F+7ex7U1iCS1pvdOFUyDjXGsNH5dKGCKzufIrm2KnByXdZEfGaw6kxCMEFIjI5MGU+V12FHkF
 9WrRzWfD+aM33ICBGRycbMx9GHjuA+yojKNnVar1MNVY6a6KfADc0gD2Wx6rj4uzndw51TGavGE
 OREscG3n+WxVbzFv4Iskp+YIDbweEoqcAK3fgCvFQAgYBY9dzIF4txIDV+vo6H9gMNM+z1EpvDV
 TFNxYuN3idjHxn+tyZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/JOWq4UaKHFs
 YnxEVzDOEruTtjpy4o8kB9g+0995fx20JIqQDDCfE+orIEtWxjXBKszHpo2e+8VjprFQmM6nxIN
 STLYJvMPh02TWK2rQ2Lm6pwxzpl31Vk=
X-Proofpoint-ORIG-GUID: btpbljH0dmbqIXIWiQOUZ1PB75gYCQeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
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
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

