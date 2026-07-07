Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD192D47E9
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452150; cv=none; b=mnMIBuNCOZqgJnwXmClEAh+oS/RW/CYSAqxMmZ3hMnwDoMpVFEMztKXURGhTet9angGuohQ/0rJC59HEXgHkZXLv8qQdNOqmim2gZWxIk+1gOO9Iid+bKxq2HwW3uVka3GpCvotJnFWwdJjWDnf8nExaTEVcGA1TY88x6thbvdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452150; c=relaxed/simple;
	bh=+Rcs9tqTLxY6uz2CPrBVs8k8aFNAm68QFL8TI+SEKms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dntqQqg6+ezv8GGH2tdWper7BSxXMeEJh5dTwkYNbMdUUvwvag4AvBx1/t9CZYyBN/uNre0La0XCs5S7upTkqDm00EjvmhKQ/NZLnLClJ7CGAL4Ad/gdS5JJG9es4RocDxBYzggTrNhbL6s27FIhg/NW1nGkUwaR1Pi8D8txt1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hipbacNZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cglQcD/p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hipbacNZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cglQcD/p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Qqh490909
	for <linux-hwmon@vger.kernel.org>; Tue, 7 Jul 2026 19:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mt/L0C8c6aeHx2BoFJgmqf
	geH7twNz10xR7G3mGjzkM=; b=hipbacNZIKnbOIiuL7Ija/REMd/Qsr8oDEC4x9
	Sma7nBVS6fC+E/CwoO+vJ8KyblEMZK9nY0q4c60G/n7KruCB06+qG8RlC/RgvV5c
	Qdk+3ZW6G4xSh/zsW7o7kd13nQx6+jqqEn5E8Aov+R+jHCDA5A+5Wr8azUO8Age6
	j7V7WM4CgvIWbyH3c40usP7tp3cygG911zSAV7szQ8c6clkhDOdyS199Sw6c5NK7
	WaNH0iB/YXJnSuivIdV1j2EWjMohbIkAemdcqmcLl0Eprp7ghTDPpRbMF9m+rjZZ
	7lHufJaDnW9odRFKCxInYBnyAm1MJZhwCOdI1QBE2jwHdemQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9abb55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 19:22:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso46916931cf.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452147; x=1784056947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=cglQcD/pM9ficX3Tfn6FoPO0eSQ19IK/yqfvD+A79vI5hpte6hp1YHU8XtZEr6hX/j
         kEXT73h2zqCHrqq0evBqaRkm28gxO97HJYCBh5prt7PqOuynMpZSd34NylTdHKmfLV/m
         2wnCTjY6f3qH8PQbqDJrgS+Y8JfXmp0u/B9/c/zLfLmEuzON4MKA933DObQYWqV8RdI8
         ZyTJgPaIjXC9ys8/bIOX145AS9rDNbWBTv8c8W0gtcSBOjEclZX30dDJyd0Mlne+9Xxu
         oVd6oDVFk+JWdgbp3OP9YT5JhLghYhodYLZkl/RJ0E+4oiDEZoff7RLm18HhcM8FvN8t
         x+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452147; x=1784056947;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=CdhHeGMmauf5KTFUrft9pDJpHsWQh8r0rCWTAnJJzoIovLinWDMdS7ERuTXeERqWbT
         TH4jr17OkLFlcAh2LprOTuhjK9KIluLg31d4zfm345nO2HILz/W7tGcPISPpWKuLQPGn
         9As5pf7QTuzS2PefXmr6qdW5TLJiLyZK1ZWdtOg9XSV2eQ/GFLuFFym/mE4zrY/9AMxd
         i/A+p9EHB0WhuTq51emqt9aiM/AEKJzJIIhVqE+F2Ev2CS8IA2owulaYgoMjIKPla7W4
         8DYXkXEQiKfwC2PLhmMG+4i4cQhZ2f5zLvu1V/BkhnE87407O8SQwBTUJr4FVfVnMjjn
         fMOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7cEqClg7EwrRXC+9FIKt+75Ez/3Ur/5bpVQt0HVk1EVN10Y5yin+7lD6X8VAwPZy5746WxZBBg/3FEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye7N5VsmDbO2cZzTPoxLUARbtCzI/4PrIEiL/ul/arY/ACqI+6
	GbfymMT4g7EQzV9fcVGZVfNRhEf8hIoPjxAUutgj7hRDsG07KOqb6ZX03bZH01B0hURlD2dWiCB
	5U7gzBuoJCTi8ZTwntX+pp3ID0clrJVl1x0+eA6UKO8OeEkrWP29xSi3LfNzwVQXwTg==
X-Gm-Gg: AfdE7cmUpAxWDjlfo4MRg193D3wSqEd7TCa61tGy9VBS8+V+RUz3hM7yrfxP0AMFX1X
	ScOkS1nyZskQEzjZRSar4hW4pfhr872jhzqE5eq5ZPP5jCCFLIUpX0pVlxFlZRp9tMta/BUhIIg
	YdtYH9OAxm7o3jbaL9Onz/hWC2M9h9Iwse5XjrKlzhx5uuAsivy841auwM7Mg7VhRLt9N4Vo0u/
	RQ3aEBalf2EybZtSHnWyKdDRqMRjyA382P5/2VQRFosyWCZUs9w5Hg8dy6ZCEM7hjIMoNqncAl6
	VwjEF+gGucHnAVEM7jzmendo5Q0kTD/d4wSm95Yi0IfL787SQDeJKQmGIJ9ZMHoTX7pD8Svb2JO
	wCJh0BaBqF90HCId3cle6KvGj/OF6uuHP9IXFFh6uDI0=
X-Received: by 2002:a05:622a:53c6:b0:51c:1e69:bcc8 with SMTP id d75a77b69052e-51c7479f5ecmr70651291cf.10.1783452144744;
        Tue, 07 Jul 2026 12:22:24 -0700 (PDT)
X-Received: by 2002:a05:622a:53c6:b0:51c:1e69:bcc8 with SMTP id d75a77b69052e-51c7479f5ecmr70650781cf.10.1783452144006;
        Tue, 07 Jul 2026 12:22:24 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae4fsm37218836f8f.18.2026.07.07.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:23 -0700 (PDT)
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
Date: Tue,  7 Jul 2026 21:22:16 +0200
Message-ID: <20260707192219.14605-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UZjlGsiDBQw2RCGS6bIFakTHnBb82r9o
X-Proofpoint-ORIG-GUID: UZjlGsiDBQw2RCGS6bIFakTHnBb82r9o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXz87tiS8BnoAb
 jQcW4jUOYT2EJ01NcV6aSmNJpWWwHvCkitJZkhltwi9FCRwQdc4C2uDZLQlb3sN2SEsrXK997YP
 OlUSzQd2ExHdrIJ/5d2QP7rMZE4TCDQ=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d51f4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX84OeVM66fk9q
 fWfYaHbg7NKK9d0YT4uE67YkfngQMrUsCKAyzchkVzGa9oZ1KLVV2aYsXcsoMwY4tvrgAMo4UR7
 z05i4fqifOKjEMaWGLrsuJsYz4mmY8U2tzo2WZmEyPTtS0Bi+LIq1R6O0fhjD+HFFTGtc1SVGsx
 hbEHoChIMvWv8jq1RgVQwjccKrIqg8kIPqwhgYnG4jc6X5ggYoGp0Wb1HaCGTMRcdRGKRFr5Cu2
 jx3PfLC4BiIvFQRedFF3fqdTswBsfbLTD+1pM1juhC6Az3iSToWcIp/Mnl1u9U0EE3Ier1Mkwdu
 8Fb5sEWoMMcMQKIJg/xGczODosWZLlX+/T8b92LPXf0wxeULdSyPy7vpQkeZBuk6wo8e0PTvktQ
 TWtjy+Kk4PR18hSOohg5RAbGpKko07IykOiU5qraD9SxxBX8Ev9dTGc5jKDWUnA7RypyaZRQiy7
 Lr/lj0EYoHQ8tcAk7zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
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

