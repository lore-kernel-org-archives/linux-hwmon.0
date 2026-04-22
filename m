Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4253438D017
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879795; cv=none; b=XbB/7SRmSGjprlzPu0fPZ+f8SN+3bpZXVrQRgZU7P7tBaoDBkXOOPlIpaRxdz48767uFj+JoU9GIZmIMeuKTjCQvwLmvFHOz1ZCIfUBjc9gdZgbLsYBytTMOORfVi2CNynna8dM+WLn/rl190iNtoQmVCIKTtIrcI5eqHVgbnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879795; c=relaxed/simple;
	bh=fmoffHM+Zt78tdZqoOXrfsHvXfin/D2GANtxAmKg6M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fXZJ16EH9z4p3lViDm3qGYfiYXe+gN1m45RgjpNePdNA6pyoff9H1o+uhuzihwycrYAv1RKFSwbpO7AiJaVyxOdR2KeVdy/NljYUDrM3Vs1ndHEbuJAra+0lZyXEmJdelxfP6VVDhAzY8yfF1+VQSZMk8zZk5AJLHN6FSww38ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lo9bwpOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/peU2im; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lo9bwpOk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/peU2im"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGqtmM1219338
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSxry06mgRtTB9usFH1TJE
	T2uiaA4GCa0fS38Y58FdY=; b=Lo9bwpOkZk6EXFs3xSPJA30FjguNKHd9azXu5a
	sD1H1h/9H8B0s9bKvvV6k6DuCwZnJ1iW+9IQRtW2+smoNrmLkTKIzt8YqNqUiWuD
	IXfJw6ogavvM7iEmuJSTgHFEXINtMrbrFCUE1YIJav8VsoeNcDF2rWw+QTV9cL+K
	4BblGZCLTQC+ngFNtaBwj0qNxDNIZc4SDw1Q21FZceWPzttZ+9IRVv/kCU/Dhm8F
	DZJ9Y2ST/i61FoXee09r9d6gJAtbUkyUXLifVq2Rwd8jyVhNv0Dg713zAMVZtFrK
	D1Cd3ov2Xu6Ljf6pn+JD9bc9uV0t+cDbh66F4m018KtkWHMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282r5qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso105947601cf.3
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879792; x=1777484592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSxry06mgRtTB9usFH1TJET2uiaA4GCa0fS38Y58FdY=;
        b=E/peU2imnygD5INetT+vlm6pT5M1g1Nbbc2gjoHtLjLHPHOkPX7he73LPkpr3gBe/H
         2CfyCY8Q2HZIAZh06RS9rw7/qhYLQ8VERBuAsoN42Vjq1rJddobAQpT3zj1hyN1WNiFJ
         MbjugiA9QpvWCrDgZ3PA5KSF0Wk2Iem+G4Uxk/i7SEAmNEaCYPMv2JMAZKY+bfg9/mDD
         AqGJO/7Dg9dXACzhkcuNVkx1TbHeLC7d6JctiRl8fCawDzg1v6KuF+fpyUfwjsOFdctN
         4F4wMq8TKFxKm4qXId2kNyza9QaWRfsN8uvWXkHTL9nCWDbmeZGE6sPQM6oS1ZeC8+8V
         8h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879792; x=1777484592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSxry06mgRtTB9usFH1TJET2uiaA4GCa0fS38Y58FdY=;
        b=lRA5e1612w2ewnbIYcl114UooNj3mXKBg+0xbMtRJ2p6GmYpUT8WvGzL0FV92NhYG0
         UK1CM7x2F6CX4LOisofL2A5O7sglLlpc95f/TmQfM02MKwu0VJs5/+OxZe/2sIbvNlH7
         gfXuOtycK9eXWymxIlhXl6ENbxHqflSYSVrCXSbIPsWjnRmsgeocJfnSUK31ALMhgOXd
         QSpv7C6IAKIJMZ/ALwTB8k2gDozIaH/Jbct427QARUFZAIyDcp5iSuUIm66Rw/lBAuwx
         elJGG8xhUToBKPBKtpKUsZBeMk+Klg5WgZJ9lj8HBpizPqBZ12uiiLAaGQi9KOmwySjI
         ftlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r9mYDO8Ci4b6BsSErT0snOrKbHM8sfcO/hlgWiiWoivXrIOSMK6UaiSNc5btbA0k3ov2MljNOJnMaKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzu1qU/sqWp6E1EdeEJwsHcc4f8YgmFtGTnN3nfZmknugox2wE
	mCX74bHULVJJf+pk8Inlo6LF2JPKnhwTQJw6G15B63y/r4MKc9jdKjUV3PflEohl+e7B3XGsij2
	M4oZGOHGCdkZTM763QH4k1FYJOLQ2C26terRXwiYRQrndMb99CU07bHP77+JubNDqkQ==
X-Gm-Gg: AeBDietTsKVpxmn/n14xcA+HTrs/1lZfuf2XdnCDjfGEcDz8XTz2BHtds4erDy5T6ov
	9kblItgDcAPHneaFVTYQGslI/uRWxt7oSRDgFmrSohhRP+fpyHIFQuvHNsSTTdqrgCVvfIIP/LU
	SaBxQmRVffj7TxQ7nPbnUcWZ6Ni25Vtp2hDOmOPCMTIk+Ar/UiXwHXlmo17ZG4+KTAXMnWiKuHn
	VCFQT+1ENyxvJJ2BAgYP74NTdllSXJu1qPdDEv3/jYoq65tIirCX28ABKmzxfwa4MZewlzXg1JY
	i+9XphCpW4m86q/j/c6WXnGlDMhz9ApN3WokrHCB822gv2V/jsLCIDpZOZuHnoqLsVVHbEN7jTW
	UbqcS/uo/qPYDW0XWO89EqWdc7IQggT1N1yspijuRXA6wG+mLIoyfocMAabLX
X-Received: by 2002:ac8:7dc5:0:b0:50e:6054:ba with SMTP id d75a77b69052e-50e60540c69mr173154181cf.9.1776879792050;
        Wed, 22 Apr 2026 10:43:12 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:50e:6054:ba with SMTP id d75a77b69052e-50e60540c69mr173153341cf.9.1776879791142;
        Wed, 22 Apr 2026 10:43:11 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a051dsm142511965e9.18.2026.04.22.10.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:43:10 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 00/12] Support cooling device with ID in the OF
Date: Wed, 22 Apr 2026 19:42:49 +0200
Message-ID: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MSBTYWx0ZWRfXzpMLsQAxhCAJ
 LJ0Pbljkw4eXzquU4ISI0gKlvccmWfWnpyFiShHqdZeooXiLLHO780Wxy7nmwz9/L3weaELxnAP
 XGPWly4qKU46dQ4ka0PctDDqlX0Le65GCHbJbQxJbB6oXBOcSzpOORmFMWCJH3+EwytLlGNAie0
 qlHeCCFEb5OBOGn3lX94SEwxHM+52cfwONn43TXTVqyDIT+dXT8WHLSCXa6JEAE9UkY3yKliTzm
 679vEXQ6cxOcENHfLSF11J8+TeTXjLug3P8XC+ZWSJ2ORRA9WC+bp8tPLH/uCLIAOwW+/CxEyCi
 SOp+32Zgg55f04JTsEM8+leIyL7ibY2/kelMd2qpl0z7ZK+oPdR/Cr89LAoq985X58Vu/YVA1oz
 es3A7FCaLBPbcRg93Zc+lWHszUGfMXmr4FM7b5VmAmSvxPJ7FO2KqEIE33rf2LvokkimmByx+Yg
 uWDoq4vYsxALLTUnWpw==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e908b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dQoLWzlZYRxCxHJU1UwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HbIGnGqfuH4xryiC6-OMSaOC7xp_WWwE
X-Proofpoint-ORIG-GUID: HbIGnGqfuH4xryiC6-OMSaOC7xp_WWwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220171

A cooling device can be a single cooling device or a cooling device
controller with multiple cooling devices attached to it.

The thermal framework builds a connection between a cooling device and
a thermal zone when there is a trip point to be mitigated by the
cooling device. In the Linux kernel thermal semantic, the action of
connecting the cooling device and the thermal zone is called a
binding.

The description of the aforementioned connection depends on the
firmware definition and in our case it is through the device tree. The
cooling map describes this connection.

How is it done ?

For a single cooling device, the DT describes:

 * A cooling device:

	mycooling_device {
		...
	};

 * A cooling map in a thermal zone

	mythermal_zone {
	...
      		cooling-maps {
			map0 {
				...
				cooling-device = <&mycooling_device min max>;
				...
		   	};
      		}
      	...
   	};

For a cooling device controller with multiple cooling devices
attached, the DT describes:

 * A cooling device controller:

	mycooling_device_ctrl {
		mycooling_device1 {
			...
		};

		mycooling_device2 {
			...
		};

		...

		mycooling_deviceN {
			...
		};
   };

 * A cooling map in a thermal zone

	mythermal_zone {
	...
      		cooling-maps {
			map0 {
				...
				cooling-device = <&mycooling_device1 min max>;
				...
		   	};
      		}
      	...
   	};

When the cooling device "mycooling_device" is registered, then the
binding function will browse all the cooling maps and matches the node
device pointer to do the association (the pĥandle in the cooling map
vs the cooling device node).

That is how the connection between the cooling device and the thermal
zone is done.

DT maintainers consider the above description with child nodes is
incorrect if a child node doesn't have its own bindings as explained
in the documentation [1].

Gaurav Kohli posted a series to support the QMI TMD (Qualcomm
Messaging Interface based Thermal Mitigation Devices) [2]. This device
is a dedicated, centralized cooling device controller managing a set
of cooling devices.

Because of the above restrictions with child nodes there is no DT
bindings allowing to do the connection between the cooling device
inside the cooling device controller and a thermal zone.

A QMI TMD is not a standalone cooling device neither a multiple
cooling devices with their own DT description.

For this reason, the proposed changes with child nodes has been
rejected [3].

As a solution, it has been proposed to fold all these child nodes into
an array and add an id in the cooling maps to identify the cooling
device entry in the controller node [4].

Given the thermal zone has the same mechanism [5], that is a phandle
to a sensor node and an sensor specifier. The proposed approach makes
sense as it is consistent with the thermal zone description.

This series provides a cleanup around the usage of the OF code which
is interleaved with non-OF code. The OF and the non-OF code are
separated and remain self-encapsulated.

Then the function to register a cooling device is renamed to reflect
the legacy usage and a new function is introduced with the id
parameter.

Finally, the DT bindings is updated with the new format and the
thermal OF is changed to handle the new DT bindings.

Given the trivial changes impacting the files outside of the thermal
framework, this series is designed to have all changes going through
the thermal tree.

Thanks!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/writing-bindings.rst
[2] https://lore.kernel.org/all/20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com/
[3] https://lore.kernel.org/all/546faeda-d896-403c-a449-5c9b0cd7159e@kernel.org/
[4] https://lore.kernel.org/all/74f59ef0-ead7-483f-a80e-a3da2f6ebcdb@oss.qualcomm.com/
[5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/thermal/thermal-zones.yaml#n99

---
Changelog:
 - V2
   - Added stubs for OF functions in order to prevent to break the git
     bisectability compilation
   - Added missing call to thermal_cooling_device_init_complete() in
     devm_thermal_of_cooling_device_register()
   - Fixed assymetry in devm_ calls for the tegra/soctherm() driver
   - Fixed kernel documentation for API changes
   - Added missing static inline for a API stub
   - Hardened the test with two or three arguments in the cooling spec
   - Narrowed const: 2 strict in pwm-fan
---

Daniel Lezcano (11):
  thermal/driver/tegra/soctherm: Use devm_ variant when registering a
    cooling device
  thermal/of: Move OF code where it belongs to
  thermal/core: Make thermal_cooling_device_init_complete() non static
  thermal/core: Remove node pointer parameter when registering a tz
  thermal/of: Move the node pointer assignation in the OF code file
  hwmon:: Use non-OF thermal cooling device register function
  thermal/core: Put of_node field cooling device structure under Kconfig
    option
  thermal/of: Rename the devm_thermal_of_cooling_device_register()
    function
  thermal/of: Introduce cooling device of_index
  thermal/of: Pass the of_index and add a function to register with an
    index
  thermal/of: Process cooling device index in cooling-spec

Gaurav Kohli (1):
  dt-bindings: thermal: cooling-devices: Update support for 3 cells
    cooling device

 .../devicetree/bindings/hwmon/pwm-fan.yaml    |   3 +-
 .../thermal/thermal-cooling-devices.yaml      |   8 +-
 .../bindings/thermal/thermal-zones.yaml       |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |   5 +-
 drivers/hwmon/amc6821.c                       |   2 +-
 drivers/hwmon/aspeed-pwm-tacho.c              |   5 +-
 drivers/hwmon/cros_ec_hwmon.c                 |   4 +-
 drivers/hwmon/dell-smm-hwmon.c                |   4 +-
 drivers/hwmon/emc2305.c                       |   6 +-
 drivers/hwmon/gpio-fan.c                      |   6 +-
 drivers/hwmon/max6650.c                       |   6 +-
 drivers/hwmon/mlxreg-fan.c                    |   4 +-
 drivers/hwmon/npcm750-pwm-fan.c               |   6 +-
 drivers/hwmon/pwm-fan.c                       |   5 +-
 drivers/hwmon/qnap-mcu-hwmon.c                |   6 +-
 drivers/hwmon/tc654.c                         |   5 +-
 drivers/memory/tegra/tegra210-emc-core.c      |   4 +-
 drivers/soc/qcom/qcom_aoss.c                  |   2 +-
 drivers/thermal/cpufreq_cooling.c             |   2 +-
 drivers/thermal/cpuidle_cooling.c             |   2 +-
 drivers/thermal/devfreq_cooling.c             |   2 +-
 drivers/thermal/khadas_mcu_fan.c              |   7 +-
 drivers/thermal/tegra/soctherm.c              |  29 ++--
 drivers/thermal/thermal_core.c                |  62 ++------
 drivers/thermal/thermal_core.h                |   6 +
 drivers/thermal/thermal_of.c                  | 146 +++++++++++++++++-
 include/linux/thermal.h                       |  69 +++++++--
 27 files changed, 281 insertions(+), 128 deletions(-)

-- 
2.43.0

