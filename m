Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996ED2DA76C
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186733; cv=none; b=tSsePBzbDPJE49aTLD3nkTUl+7QZsmvGTFYK5ynxHoKpS2/dlo/pB4vYiNf0DOSyfVo5Mnlk02eSEXCmjUswIp/L/9I44w/ZmekfCNA/RcF4XkeD2wZSzHoZrcoPgZ4BM5eQwETyuzINvagpU8vOhpnfJVuuzfyZC0ZkGKOd6T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186733; c=relaxed/simple;
	bh=Fw6gQFY3Gd6QiUmAnZ5DyWfDoT8MRmsSY0h3Ikqq92E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jouUZQ5BzAqarLiWNhd1KA8FxDAfckvyJ95eDo5CSMeVhW4Au4eRt0npVcKE4dsfzSj9pbnffoQC/k+uduUn2xk5R0cq14XJm5YSeeNHfR7GT4IzmShClR68fFpw+uTksDZkMczkkkb9gT7i5g/avt3B6BPIej/horS6ln6rWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEhsvkhw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giULm2VD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEhsvkhw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="giULm2VD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCT1uq628207
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MLEQXryaifs1QKuY0lfBGF
	UrdbxoYxdxNfya3F5CJGw=; b=dEhsvkhw1U4iu8cqnXSRHKZTBzgsEEAYn2VrZE
	UrSVO3cLd39/DUacluu5SnpnJaaG+gJqL5RciDMb/OnY5ifk/LulLDxFvwMB40zk
	GPwkk4aIlZShbgGLgu+nH9u67BekipsJdAR+ZS8bS9WhUT5+sapxJ2wEyc9PEHCC
	E/yHlK/tCOJ+XRF2BnkfW/iAYXl2Vjv9u0D5KyIR/yEmlDC6EPBPDPEOv/gAaF+5
	4BrBNJr/8TszATRrTUmD0wjHC79SyreAyNfYqeS2lkRVf7Lk9w+PH/yB5WZ/xIXG
	AnP+ZySoIPSUrW1+RFtCnw7D5qN7SDFSpJRYjuAyNRgms7xw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe703qt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36db995d083so5758292a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186730; x=1781791530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLEQXryaifs1QKuY0lfBGFUrdbxoYxdxNfya3F5CJGw=;
        b=giULm2VD5vQjF4dYEbquXK1nlWwmFkkCLP3pooPosug4tYQNTTXx8ekHHBLKO3lhYF
         cVqyphZ8JlysUpBceqCpobLpZBWahDL9pefJA2ZbWY0QTCgBgFYed9TbPVpHWIT6sz3J
         c4SnAZzYnuvQG8f4hk94w/atFi6lPhKscr1hhtdQKFnpNWDu0dNNEWJXVQ86f2cI4pEr
         u80ZSAflGPqCVlgXDhvAHZqe40QBGsJl3SGathyHpMbXsKOE4bvfHT0P0TVGaawzjOrU
         8kCryiuMblk87cQfsRqZv8bJ4xSwTQ3IY+3E+Mzs5zHxR3zErAiLjjT6q4BGXdcAgTR0
         bNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186730; x=1781791530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLEQXryaifs1QKuY0lfBGFUrdbxoYxdxNfya3F5CJGw=;
        b=Xh9kkXfxM58svay5J3dlZfMUN8QeK20x4KB30tiywAhC9ZbJ/PfffLidqQ3MQU/rN+
         643jxdfcpxqKLmi2w6hr1EJFHiti3bGO7+DJNQjCCGdv3w1B9pEbJDPAihkD5jKBVzQ0
         XsZFF5P/7GJaZuCgkSvlkgMluFUCoAcqAYnBjycPedI41CenbT2ixNGrUsOqHMHgnKon
         spIWNQbCpU6IjXp4hYX6TPEEIHlQYvZjVuVsZdDIVuU4X5e2IS457Qf+HcfwdnJckLOS
         izVVZ2bRaMp2aunMD4qoOAfb2kYNHLMal4hhX7eHLivcRY20E0F5dagbfE04Vy28t/ha
         gI5g==
X-Forwarded-Encrypted: i=1; AFNElJ9Ozlj87FQHtwj51ILuByU6gXwd6dwGDwUawB/uzroFmlaJo7tdQkCXKMLi6g8D48tQ1I+x+cMr/4H9Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVMuD1fBJl+yorxybjNojzItboe8TVmu31hb41cSQ7NWXYpeG
	SqxSegLhvjg4bVtlbh8kzvYICeA9lo2IsgFoo4/wKLIwtyI5AB/B93Jd/rEomvxexdk/mJpbfD9
	9F3O1sAZL8JY1+uUu+VRPbt1jNXJQIkHURLn/s6qEzUGOL1we95b8oL/n+hGrV5wd4A==
X-Gm-Gg: Acq92OFi0PWmD+sZHW4YcfN8qAZTiqGlp+jaCYMwnrY0u7H06YUQoat4aR3LSn+3Jzy
	QhsvG/UqGhPsQmQQ1tQsuCm4Y+rz8CmoIpz/Y/RT+/MesqeVqyqARoxTfir9H7t47t2ZLS5vnnc
	DwbtYoCXvUH8Ehpow21f1yY+pLekKJUaudifXuHTVeVsEbzm6GVRmPidB+CB1ybgR6c/rLSRQhP
	4NyTNKBH7a/UYkEmZUThEybOhUOKTsSpiMpiT/zMmqzPBEQQgPhoDbkH+75zqP1ZqTdHMsrS6wM
	OmA2uLoHg29ZWSdW2qq88BqkmbtxpMkol1REm0vsjILD1YJO3DuA59r3KnIeuqy1EtnehIV0F3j
	xCqhzbKup32jvZaU8UbGiPdAedwToqGOO2fYb8b6CHBzhOec0zVyvQX58SXluxtL4oTlfoiQP+I
	e3IMmTJGcPbw+mDR8pUFH/TSJ8w8Ynz/pPUnwlCv6iLLvaROT43VjgzyAwL/wr7CQYPSrnVwwR9
	neD4hbf3vaH
X-Received: by 2002:a17:90b:4a4b:b0:36b:d2d9:a584 with SMTP id 98e67ed59e1d1-3779f83d834mr3307647a91.9.1781186730236;
        Thu, 11 Jun 2026 07:05:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4b:b0:36b:d2d9:a584 with SMTP id 98e67ed59e1d1-3779f83d834mr3307600a91.9.1781186729772;
        Thu, 11 Jun 2026 07:05:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add INA232 power monitor support for Arduino
 VENTUNO Q
Date: Thu, 11 Jun 2026 16:05:23 +0200
Message-Id: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKPAKmoC/3WMQQ6CMBBFr0JmbUlnjEVceQ/DotBRJpFWW21Uw
 t2t7N385P3kvRkSR+EEh2qGyFmSBF+ANhUMo/UXVuIKA2ky2qBWU/Afq8Rb2pJyjHvNxrRuQCj
 KLfJZXmvu1BUeJT1CfK/1jL/3Tyij0qqlXa8dUtNgfwwp1fenvQ5hmuoy0C3L8gWLVPByrwAAA
 A==
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
X-Proofpoint-GUID: 2xGoHLZMbyuecm4MEWVldPD32mX7_Lg4
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2ac0ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Nm-2SeViG6Lg8r77o8wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX7NIKCYmTkaU/
 6RHXEzuAsvE1RFV+JgQhYrCpY3RYj1slzzWlhDYJHHkwQN47CgV1mQ7R8hyIdy8bEkjQzRyqz7i
 vHd2/biSuabOl/YMI2p8M0S1geKWhMlHhIWQOpp0UjWU1B3anHuGOLQP//AFuvpNIE4xHZpXaFa
 bLWwU2j/vPMk+wEz1J5ul7VKyr8ix5cfnieQ+BW+2JXt53alTR5Zt80CmWIIUmMr5fGY4B14yba
 2Jx+Eb9AjGPIuUh+8oUPHXW7okVRadqCR9K7IPeGp2/yyf+WjqW9HQUra5khcH3ck/b2mdlmmx7
 UeNaPf2+heWxUL5I4ye4V6VmeICBzfaoxMV/dwdgv19wswTGOOKZW26QhnTTXlG7YVx+K2vP85d
 K7gth4yZHjg306gLLdud5ft4x/6kon1UBsF0j+gCM5qWRYkaA5Ua0fcKc6f5PdZynOBFN6Il/Ut
 QxPZmqKU6V4D/77sGvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX7NjeV+eCyxtj
 ffVqZ2GbHQqGFfL1mZnUWygtb3IkSmOVVyNRLzjWA+YZyIPHRZR3Rcfcdxuq4GZVsHqtw9HI3QW
 P+vAc6RJFRd4Ntxkz9SWmNMe9i4LqyY=
X-Proofpoint-ORIG-GUID: 2xGoHLZMbyuecm4MEWVldPD32mX7_Lg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110141

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
Changes in v2:
- has_update_interval was missing and should be set to true/supported
  (sashiko/Guenter)
- ti,ina232 added to two allOf conditional exclusion blocks. (sashiko)
- Fix commit message, it incorrectly mentioned 2Mohm instead of
  milli-ohm. (sahiko, Konrad).

- Link to v1: https://lore.kernel.org/r/20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com

---
Loic Poulain (1):
      arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

Martino Facchin (2):
      dt-bindings: hwmon: ina2xx: add ina232 compatible
      hwmon: ina2xx: support ina232

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml         |  3 +++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts    |  6 ++++++
 drivers/hwmon/ina2xx.c                               | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+)
---
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260610-monza-ina232-de180e669dc1

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

