Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E235375F67
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452155; cv=none; b=C0P4tSxiAVD024eHGgU4KlKnMD0t9CGqvFdYo8qBy2/lmYr+FgZfbDY3xF63OTNJVKsnRhY/iUZKOphErPooGOPx72TEhchJapo9pTSkoTHXbmyN6YLRSuPED8px2NFTaIrSGAJWTDEi6YczY9vx50fkkOMYeOUdzFkSNkXNmEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452155; c=relaxed/simple;
	bh=+Rcs9tqTLxY6uz2CPrBVs8k8aFNAm68QFL8TI+SEKms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JA42sAD5xIQVjO46ondwXyp8z6OvvnTxZUTTm13rGrwa7ckSe6KfBXSnnizhqDRQOqDmy0uqfkK5TS98zfD7f0gMnoDjO2qVTU5H1lPylfoYugcWvcGwjoA5tY8Uoy80kDSo6NXuWOdIfZuUndMuGGRsrfmv8/T14nLnFLu8U6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8o96PGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvgoOik2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8o96PGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvgoOik2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5SvC370235
	for <linux-hwmon@vger.kernel.org>; Tue, 7 Jul 2026 19:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mt/L0C8c6aeHx2BoFJgmqf
	geH7twNz10xR7G3mGjzkM=; b=V8o96PGjmOHMv/kdEpPU+p0n2EmDXPCOhZT8fJ
	r3g65l8/TlVmyoGX4eNfiflPXPAZEN+z2s+Yk3MgFk1DdJiM7EKbHPbonchNS+nH
	/FWDfoKmOAEMzEgyLdrmEJvHTK6o2+L4YdlWA6Wrd3iDCgKUUIeCYE9XgISN4Nvt
	3bU91WWaV2NzoYr/JfNPRr2hJaDpza7RgS/f2VUdzPNRKl0YBBdvBcnr467vd7Bu
	ffxBxQi04aP8xD9P0BWHVlq9D5MSnKRhypTVw5q0rovIlDhPE/PmoaNJEX9JHAHl
	BJErLrzHHsKBq+s/Ad3kWTDl9EKMMEZSqHs8/Wp6MZ8tPiBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun3310-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 19:22:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso47764331cf.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452152; x=1784056952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=GvgoOik2hYpK4jE8zfnE2vF1XDOvAJc03NhPEX7VW5nzfDwpp2ZXb0fbnoisuruSKE
         455bSESEqRX8jzQI/1iYCzSyzg32iy31yi/UqVeYYIbMCFhABtbDIko4Vv/3sfZ3PxKk
         pPgOfOG9+r1sYw1YOGHLhd24+AmjVxV6JRg+rarzNBn+8u5rsGkSOueD8Xu4yGnOLMCw
         2p6Y+Y7hyd55wWHQBFXKJ0d5F34gLR6o6lDU03wl3ebovlskSmQJZ2/5Ynws7Rcvn0Pz
         gIcSrLXjTXeUTHzF9QW65bZFDOHxTK0gm6sv4j48h54oqE3oodt7AgBlQcnz897w64VJ
         jD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452152; x=1784056952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=KJaChRNzbaolqMG8G8iZqK/5vlBVupFgK8Cj2Eo1nyaHPae7Mgm2HS6ssK1TZeZYpc
         ssNwJ3R68zISUH9fn2QDzokPoUfCBn333AbQCwnXXHgceOs4jjti0Ej2eiYwl2AROJfP
         zRndYGDmi8ZOkdrUVyNkkdpRqsFJETIClVV6U2GDVnyzdmn8GLYTjNHrv9RvpEsSoith
         Ir4ylyM2JqKJfTTqNwSfFomCQy11/ru2IZWtpZrKhGYyeyyaNtT/CiBjuFQ8mUoxbZKs
         xtcjk8f5F/Dwdi4fvFHXsHnkCYzMF5vBBsEa40a1vtBJKdbnLgek13ylz6Bsl9KLaTNe
         k1zg==
X-Forwarded-Encrypted: i=1; AHgh+Rob53sDoWOcErF9wB0B7bMBOamlcqpkQRdsDq6JJurcBwRaAAgS335xwOCkWVbVIDGTtAgKYuwVJBlXbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcIi0R8hzzbKkaKXh3Oow23/BbO9SjeUsJQF3LBs7mh9FJM6mr
	phNDMcpJL6VpOt7wJ+8pE84YQ7mKKAdVIr3Vjf8g59mVKLltEPZcmM8MafeWsi6+EqKwSoZK/wp
	1uON+wejfcgUI6P3yMT7QI49tLiALb1DRYT2572apRMzNss4NUh2yiOMEz85p2bVPow==
X-Gm-Gg: AfdE7clh9navEgIUwMT7q82QH8FcSjhJd33vbemGevXpJaNS8BZ10JZxShyu5e8HTzh
	dzAXXMXAxC4cjGaa8YwzOfa/xZYowLRtoCDTSrK44zVXjkeEqvw+eyR7a05z8vn9x2hJpBKhXOu
	uYcdX9F8MHjAa1N5eQEeJ5bQ11Tv9jXYD58x03f6jmUeZEsVLXDOte0jgh7OFPPNr59CmCmjtWy
	FV+CzRlsgs206qTyu7uPP6PgdfxjtXP0K3qLtW6eN8rouZzTCVdlSyM4FedHV5B7BRk8DmqgaS2
	MCXDQ7P/patoRh9RI2J4oIn8gaJud3+cfxSfDuAbWa5Tw4I0XseqTyTLNv5slj0AoICREMjQKaA
	lunlfOgPwDVMNMR47cfUILkDBzQnpaSH28MkIepadLew=
X-Received: by 2002:a05:622a:60c:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c74800786mr68202801cf.16.1783452152104;
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c74800786mr68202241cf.16.1783452151242;
        Tue, 07 Jul 2026 12:22:31 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:30 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Tue,  7 Jul 2026 21:22:25 +0200
Message-ID: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX2Il2vBFVpzzT
 goabiTdiXPMNztua4gFYyQtc5rZg5dQIQX/VWKsRILREU/7Z7QURlIQra7ZjguVYo5qosSQ9ShO
 R/2lHLQ2pTDLvUZPXBopDId0ajxygwI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX4VvFQA+BIrXT
 QWrQOqNc7Dxu8mNnsU8Qz4L5Pwdv2fyu6kDwaJbgVwryqbAo4yRWngtOI3UKYRIFLu34XcFedmS
 b6/XM/rW6iiWfjduCtG9MttHdZyteMJzQqgH3WyuzJLfdhwWg24Cmw+XLsRszJfRaGVcRFO/9om
 jvhhJ5U+o1c3GU+VLLgXlaTNJ0GcPNTLsjT4iknUUkAgDUBBnd32lHJPlGCPKZBRicML7Bi4kbv
 /d3fpoyMyOq3D7PbJYd06eb5BKqunvS254xH4j/438HMdveofjsZSMrDxThUAQbrIJLcfEhK91J
 cRTU3yBZFylrY4u3PBWqYUZF/sFtvJEn1EwRvnYGoFxrI1o3DTU+qHbygFsQkwq/Htgxn6a7REr
 Gq8mm+GRzEsGz4Nw5OvSa8xFVFMpE4To2N0eZAxplzGiQnksK9wefyCgH0a/Hmjy3xBzULLur8W
 zbc13MJbpXIKJ12sGcQ==
X-Proofpoint-GUID: VGUYm5w3skx0nAeUAlk6L-n9gcUQNI0B
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d51f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VGUYm5w3skx0nAeUAlk6L-n9gcUQNI0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors
covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
module and SSD. These sensors are currently used by the firmware for
thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors.

The second patch exposes the EC as a thermal sensor provider in the
device tree and defines thermal zones for the keyboard skin
temperature and the charging circuitry temperature. This allows the
generic thermal framework to react to EC-reported temperatures and
apply standard Linux thermal mitigation policies.

As the EC protocol is not fully decoded, the passive trip points
get/set actions are missing, so it is not possible to program a
threshold and receive an interrupt when crossed the way up or
down. Consequently, the thermal zone related to the charging circuitry
is polled every two seconds until we can set the trip points in the
EC.

This series fixes critical thermal issues happening on this platform
where a kernel compilation, or heavy workloads, lead to a system
reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Please make sure scmi-cpufreq.ko is loaded before testing

Thanks,

Daniel

---
 Changelog:
	v6:
	 - Added Reviewed-by tag (Dmitry Baryshkov)
	 - Removed required property for #thermal-sensor-cells (Krzysztof Kozlowski)
	v5:
	 - Added Reviewed-by tag (Ilpo Järvinen)
	 - Added the '#thermal-sensor-cells' property DT binding (Sashiko)
	v4:
 	 - Added the missing HWMON_C_REGISTER_TZ attribute (Sashiko)
	 - Fixed dependency with HWMON (Sashiko)
	 - Added Tested-by tag (Neil Armstrong)
	v3:
	 - Removed event based because trip point are not yet well supported
	 - Added an empty line after variable declaration (Ilpo Järvinen)
	 - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
	 - Made switch consistent (Ilpo Järvinen)
	v2:
	 - Fixed patch 1 subject prefix
	 - Removed the fan information part
	 - Added HWMON_T_ALARM
	 - Fixed DT change description to reflect what it does really

Daniel Lezcano (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal
    sensor provider support
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../lenovo,thinkpad-t14s-ec.yaml              |   4 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  67 ++++++++-
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 4 files changed, 202 insertions(+), 1 deletion(-)

-- 
2.53.0

