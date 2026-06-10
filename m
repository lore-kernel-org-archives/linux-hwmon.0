Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F90399358
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080339; cv=none; b=JGKS9nZtXc7QAISpL1K3nNfVBuMqCp5FMsucFXmCTPYuDMqII0hER3/9atIsPsEo+ouPSVClr7q2qy2B/yaclvttG4By0Cm6WvnIpvr2dOSKiWOXi54rvqUlsTeX0LAZxAa24ZBRxbY8lyoPXP2Fps/+r1PaBM23RiLalzdFObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080339; c=relaxed/simple;
	bh=1ETZ+Y6OK4t4qfWHx3ab49qeY0Lk7h63hvOHITkpQ6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hnqly11mr+s31xSQvR1bAwFU3SHSgsZgyZKC3yoBmzDpWf2GjRH7b82RQO4CsDjtknbgkPasrhM34c9F3r+3Dj6RvnD/kJ7lKC8WnkeOfJ5efobvZBsOVEkgG28QzDVqAHIZzgGiU49IFp1px9/OpOucs4vsaDEbgTfUApwMtRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9J/MLJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZKRcxI+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9J/MLJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZKRcxI+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnLb530859
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SDTwp8m/1LdhvShPb3TDn8
	+XR4LX0zkaHO0N1ZtReR4=; b=k9J/MLJ28s25hZfXL0splr2jVynZdGMaQM9tuL
	2whMp4clLPHUr4rIorwLIXTSZBT/e9hGe3u6I6qZa6Nva/iLfxIvlwkPz6sluYkW
	jj565G9mXYZheWLJuFjLn430ZHXqB4jbOB4KHWXlwNYNR3IdfbvqAmzuVSjYrFVw
	HIJgoUwUm+VhOkNBgYhpaa9fsWfEfxk2FM27OQ8r/mwhOo+ilStXFmDqLi7EA3mH
	6oM9yOYTipS6DowAsYlP5HDDjl8F6lQJKT+8o/nBY4Y962+ulNntSi+qaiaUk2p9
	KjYwASdA7w2CimT6DqmimaO8fqL1jCGqhO8q8e60se1y5JCw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1hy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cce4f4634fso12088446d6.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080337; x=1781685137; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDTwp8m/1LdhvShPb3TDn8+XR4LX0zkaHO0N1ZtReR4=;
        b=DZKRcxI+L9VYXWNF4EO0lyyXcnoAuD82pry55q/SFcDDCnmXB68jfSdNbkRF4xp/dC
         oi4PXzhjqHv6qKpbJV6D9ixmJlxos/KN+2wMeAePIqs8XkKh4+c26bWk2VAs/qNXGTOt
         Dnsn/IQcQ8EZyVoVvYKYaknsI7I+wWTobd08zbFhr3h6BEFFveL/tqwfMvy7m3/NWqs0
         Bw5GrKOyTHYUoi8WCfldzZg8oJV7te9hkJccMG3R/cWFE1/rQqN8O2AjL4MWsRREXxjM
         MrKtWyvst6QQxZTPzpbgCGT3yJAHUUEHMxI+rpTO8OZMFnz0NcXrFcxJenaJFm2Jsret
         wo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080337; x=1781685137;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDTwp8m/1LdhvShPb3TDn8+XR4LX0zkaHO0N1ZtReR4=;
        b=d4vn+FOwGE57xEaNFVc0Uh8KTgroa9kVWtHG3TwgGcTupBMErB8GqHwOF7BOxvXOI6
         oTtdQCz3XHWqdkn7EpTcLM6RXGdl363EcOkQNCMTo4EqjZDQCToDrbTjnmw8UKDm0q5J
         vDhh5Ps5GPSWxlkf+NjFL9kh5A8v7HTcJT1+zoF7tsepaAppafSSABCdoegHzr/84VBB
         Q5fJMvQ7Waxa7qSlbKSPjvb5m5SRhxm6cc9RJFI0IbnDgrO+5NXjR9vd3AodfWTrCvtG
         uQgva38RWvwdjfdS155Cgjd0OefxzjJxj6Qo9f+B0fO+z1Piuxn+OkZIzzelItcHBrvC
         YIcw==
X-Forwarded-Encrypted: i=1; AFNElJ+hPeptypMjPurJVdgAs9d+AqQy0boYCAXkjXagUPQw5OHbnqYzgluXmJ8w/gyMjZjPUV9oAS/9vCaL4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuiDObJ+V+gFQIgUbm5b/ZtOKL0qN6jqGHfJt61IqByrDChYAr
	6QBCoWRlv3p10Noh4wmQX1k/ldP4NYLqx+J+5S4QqhjpJcSr8FzmcsPf0MeQ2DYriRJ1+4TDSGY
	GRpDz9mLZ7BGTVQQTazwjnpOuHXfFQseOpDwG+MxxYHFCg5ksG5aDiLg7a8tDX2xhjA==
X-Gm-Gg: Acq92OF51oBms3lrGSTnsCsckRKMECWkClNYv/AKwFtz7iwIFgnJ+8jAEijdgKb1WrO
	DUtWXLsURYKVo0DM2tt1RJbnyz+Hrm6YFxoRA/YictE6E4gYRbHJDpuyaZ4CZhsHg1hdA33Zixg
	ZeCHcOTBHaAhxNKgb3Za4FZlNp3nBGJPijPflJ5frmb2pPvAN51kIGwRua4klp4xsKVTZQhHNsj
	aig0YHq9ADz8AMOLjxDawp2CXdNjwf61LUcggdeTVtWUSQuQQVlbr1UFyZ3hRpfGgIFF6P6JkJm
	IWH3S5Cuo5AajPGjWJIiKMwr+VsAoJQIHUvQbYYjD+F396IShVbheBue43NLcChPyTCLaCiW2FA
	LnHR25EdBs63sEjd9v2SM+aHZQXIkX8BXQqF1eqDtqq8o24ptIZTNKDo0/i6lofSBpvdNyq7WwE
	joD+Esx8EszlBjW8LAQivDeXNjkb29SiIyaL41cOD0savxMTRid2L2ZzVcBjnfQ8dWFBLPl6irV
	Yrn4MXHb7b5
X-Received: by 2002:a05:622a:2cd:b0:517:6b57:8164 with SMTP id d75a77b69052e-51795cda6f0mr359455011cf.55.1781080337107;
        Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2cd:b0:517:6b57:8164 with SMTP id d75a77b69052e-51795cda6f0mr359454761cf.55.1781080336736;
        Wed, 10 Jun 2026 01:32:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] Add INA232 power monitor support for Arduino VENTUNO Q
Date: Wed, 10 Jun 2026 10:32:12 +0200
Message-Id: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAwhKWoC/x3MQQqAIBBA0avIrBNmDKS6SrQQnWoWaShEJN09a
 fkW/1conIULTKpC5kuKpNhAnQK/u7ixltAMBo1FS6iPFB+nJTrTGx2YBmRrx+AJWnJmXuX+d/P
 yvh/xJWDDXgAAAA==
X-Change-ID: 20260610-monza-ina232-de180e669dc1
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX3gszYoXrFv5U
 ytcu/WqFXmRLQoTgDbiB0bMGM8VUp8pZ6VNQJrI1agIrsP5L5S4uHqlfgMvOEBYafw5LPpwGDh/
 j13K18oDfpfPVUx3zxJqVgvW4Ifr0TzkqQBagMDelDZ5rZ4It/DBmE+wEiOE31s4VD/Tbhrt/Xl
 bgzlNJB8fSbb53ShHo4bwHmU5RqPL7vLzMe0RbBpDWz2oRzztB8jMn6iVzj/IMKlEKNwkAP95BL
 O/xx9IP72NpQwpak+cgjkZ8GicDfVDQO8vi3ySb1vJB0OwI2zw/j0pNVt/R8sevGva6EZj7ncqC
 JHoAyugpa3YCMgkAh3oov97gyWjBKgv/5I6U9c0yp1g68slVaiKYE9ehGoWLcsU6yAokD4Dc72Z
 Vu/a1BBcsHv9D+7d8xMWRVbmppurp60sNM0+0Ii4iYSgay1fTMmB9Zc4lfSsgnUC/MiT/8hJP4L
 7DmpwlNnAmjAPHZmeIg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a292112 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MAzMz8joEOkdVeTcSskA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: jKW3OSGHLYFKjzO5gQ9ADdUMqbT5H_0B
X-Proofpoint-GUID: jKW3OSGHLYFKjzO5gQ9ADdUMqbT5H_0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078

Add support for the TI INA232 current/power monitor to the ina2xx
hwmon driver, and enable it on the Arduino Monza board.

The INA232 is a bidirectional current/power monitor that shares the
same I2C register layout as the INA226, but has different electrical
characteristics.

On the Arduino Monza/Ventuno-Q board, the INA232 is connected on
I2C12 at address 0x40 with a 2 mΩ shunt resistor, and is used to
monitor the board supply current.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (1):
      arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

Martino Facchin (2):
      dt-bindings: hwmon: ina2xx: add ina232 compatible
      hwmon: ina2xx: support ina232

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml |  1 +
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts      |  6 ++++++
 drivers/hwmon/ina2xx.c                                 | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260610-monza-ina232-de180e669dc1

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

