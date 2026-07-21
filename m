Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04046EF7E
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658643; cv=none; b=gvu/zuRpUo/fD0PSuBMd591ijWdzkyIl1qNooyXr06gas1p0qAKHMBmGLyh3xaImiGiqqIe/UaZmXIDzo+NbHYxOPUMvGmFUOTgeBSFSl9kSv257joYcN82Vq90w19HPIr13yhQ8t/KBCO1m7aD63neudEsjUA1ra/ylUpviQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658643; c=relaxed/simple;
	bh=v3vp24bsln6ohl0FxV+SSTC/bupGUPgiy+YetmR7ZuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbW0IN++g/rgiHtlcGBZJvJoBG3kovEejcaW/tVH5zX6LoO1dL9rkhtyVkcWAUhc7bEXxgiBEkmeA0cHR8DXvyKz0r6tsxLu4T2CBEdyuxSiPBwKKWbiEAil+zSHhPH0FKTS+k9exLwBMMP3w19QI6AM8N53L8UiV9xO3w3p0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phe8+BOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvzxCRI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phe8+BOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvzxCRI/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRA742376074
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=; b=Phe8+BOH2X3l7jOg
	TT6BmeUa9CbCSp7+oLM02ZHlpZPdA+H6OkVcafE7Rkuh3/pVjC1/bLFclMA0UX0Q
	zoJXRKqLsloVYy6SnUtqMMnOLGZ+zAa+a0sKWv2e0G/tPEo3DbeYduSvmWkG/OgJ
	n9UWOCujdm52fCp2RHxjsRtPj/EppthXr2o6KB8hWAsa0SQZdWQofR/yRQIE/4Ge
	67Qm9vd/lKGaPF3I+3ovY2JodRoLhzM+18LVap/iOAEjdvS33SLCI5alsPQxufBU
	nJ4vSWigYsiS6Mxkjd6G7/qyoiw1oVZ1+gVQUz8Egrh3YrMLiP2IDlsaH66cBxh6
	6JlWmg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a89w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 18:30:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so16845937a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658640; x=1785263440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=;
        b=hvzxCRI//jlvmyEULud5aIEJ1mEVj144Zyg1Lz5ilRIolAzvHyPNI3hUIf9P2P+RZX
         iRWPD2dBywSD4bBLniQJbwXgEL6Bwt/HphVWM943Viy2WHo1LggZ3jwMKBKu0bHToyyd
         nheucT8pkbidOdmq1F9S+HopaEBFluBv3Ah8lJoGwwnw5muvPwbg3+BqD5baMlYTRWrR
         QlyUBkV538ZnXVrEHp/UC85KViSN/ZVDcjyemAPSxslrK4xg+bkEwzP0HFqFDTAD0ztT
         a23yYB46wJWVEJs+sE/ZXKq5mFN5OfeIT8kOiOI09U5sWCsFWLYQBvr2/E/LJ4VIqxcB
         QHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658640; x=1785263440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=;
        b=C7C7oca9IibKxUTZFyITAPUgwhKnyhx7j32BhbN1YMrCPaPefo1F/gme4Zz9fBn84b
         uwLuLkzTfa1Rs2rfM0JPJeS5Zb9tCxCkf9ZnGMa3c5x65tmuT+3c2WDsLDmdg1Nvz990
         wF2/x4V5PbNqpiA7NUw/Srkx0kmoNIUmOfk1/33hLZXpkdggA4RiwSekmWYTNhjGvzR7
         blWy1e8pCkjC/kQWJT18Wu1p+/LRIZauCwpkRaMr6ffCC3XuBIwhNFCTyBixg+NGkIrM
         4aFYZwcs/cb3HegaPD7LJgCg8T+sCYUKUKXcIOVKChcQKlPkka+UQ6KyT5kSKe0rDLLp
         8X3A==
X-Gm-Message-State: AOJu0Yym5FjAzQxXm6r2JmtT7m1wqWPMKoT4HszUY7kopzD2NKcH4Npi
	SCS2nVXHIfhs1336U5+xUPGDgRl0+gyB/hfpD5aW1nXUoxP6HrAoSvvGnz/ejQLFCdjoNxnCXLI
	chQ/kAm7cNQ7aEG3r+FtcWroIQvQup0KXh4SYUpcJJKBS6YSG9F6HM5KcqMCh7fEdwQ==
X-Gm-Gg: AR+sD12Q3RoJoy3s/6Dfet2H4fCiUR/tIBPqXRZqBxDUs64p1mC8qrjIQm3bb6WOD7V
	CXN7+WNDxjElFMzJN7IdUFEHLyKHNsi2uK2waGh6f59w4oGB7UzyCIkVyGjXT0SLj4IhGRLZc1q
	KlBM2PEJM/f47RAZI6KiHtO3M2YwY2eaF8jUopXErkrD/VAHUxYqiaVlKHiUSe8eMke3FWt/vYS
	fIlFlToU3r7dPjc6KLQc74XI+h9GYPSq94qRSct2qR+Y0zIoFaF24YHKPIRXbah9PnpFFSYvPnm
	jrTqamTlBH06x6HhgpKgs38i8ZlBN2tDi/zt6uSZE3BVz0PHzzN3ncWPk9tFshKyW965vuLOYDd
	G/vTBqhfg7bgKhysOYgzaw20M+2W9tjYpcTk=
X-Received: by 2002:a05:6a20:9397:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c3ad8ecd61mr20837353637.35.1784658640058;
        Tue, 21 Jul 2026 11:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c3ad8ecd61mr20837323637.35.1784658639536;
        Tue, 21 Jul 2026 11:30:39 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:39 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:09 +0530
Subject: [PATCH v2 04/10] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-4-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1064;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=v3vp24bsln6ohl0FxV+SSTC/bupGUPgiy+YetmR7ZuU=;
 b=NrpsTYx1Q0WH+Ik9RJxlvn86/zmXcPWHNzIYKoYjFmKeIy6/0aZbPda37lvLmqpqR3w4t4cnn
 JaDqQP9nat+BWdIaMxanSP10o7Nh//w1pzk27Efl4mBNDu3dcLeApBZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX8WVO0uMsHl/b
 rfKfwA5xg9Wf2wqwl18EtBIUL+xdM0U/YM1bGs3p8XiEKT/GOfDJoDb5C2y3zluxMa72MUyHEHx
 VwRriL36iAd4suUvmma1uN509asQN6SLaCDJbwEStPOnz9e06PUKi1G6UOlCMpXeTLVDwy81Jou
 HIx7Naw6pEnO8VTJjsDE6EtPi9Q19W8DXBm9nY8MZyRCmtgMKkM0R+GuZBaiAnZVbbCFsnkpS9l
 a2VvtA+KlPRWkzjtXzNuFngj9MdKpNhYZH8INK91Mi2Y7bUoLmL5BfjMywHuk5og0WxuJYkSzqp
 NDwyQCspEqRZZsNIypITuqVvqtFw8XKk7kwypS0Qi1c2Y5ocZOTWCT9X8W3TYJdi1CnAPdv3Qgu
 MqdhpaUfFOO3wEdKFcEoEhhdq4Kct7IrdT70iR+qFqzdoJD7nNra9dHY9yX4SAyrLJLBkLW3wTB
 mU4mqVg2IHKfpI+BC7w==
X-Proofpoint-GUID: smh8onENfWbG95R8N9lmoc4_Fnwj0zfs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXxdD3nHTg7KRc
 58sadT+sHcFxDWoY7uRCgPl0JChd3p1gIEAqAp55pBWIkWdBBqvSoCta8YRGhELRAI4efd/j8zf
 olfIRMJ4jY8pyGdoqolkY1nEeIUgrpE=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5fbad1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: smh8onENfWbG95R8N9lmoc4_Fnwj0zfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be..dbc4257c64ce 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -515,6 +515,15 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

