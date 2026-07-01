Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAA5423164
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jul 2026 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902245; cv=none; b=mnedeS0s1/HWkeK88OWyniSEn89Qhg4JuSKG04k5Dm/qt6aZuWYpOT6K8z4qM/RU6beg3jRUwdaoP7Lo5VIXTyhNrnpcLK4k1xcq22EzwoQPYkIH5KZmRAno9vvwLsov6dnelRPzwcPHhO71YbRJSqsVqYHLJsc+6AyE+pqP2Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902245; c=relaxed/simple;
	bh=3eTtRbYeYc2Ucl4oM9OL99IuKEACdQbDk9OneYUz3hM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e7M5iNHwP87Y+ojaJX57oAqRpN791EMtZO0eSJwuUtQA6IPXxdqEMOGfdbvIe6bFrkgcwWNyn0WDE4uaR98tkopjn6Vaeq5w//4547YwUrWBz6Vs79BzsIA/qGtgXrI2BBhYQGjH0Hg4zxRjyn9jsce3An7yxVmg6YdRqz/X6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzAmDLpl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cX5ugZ+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzAmDLpl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cX5ugZ+5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8UH5643984
	for <linux-hwmon@vger.kernel.org>; Wed, 1 Jul 2026 10:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HBLQidyajdO9oG1GsqnmdD
	1EP+Zn0eFu7AAq13az6os=; b=AzAmDLplePkHG2aHzBiQkXwaXpsA4fHSoEcQyt
	Xcp8NdJew09OhYrjHM1Fk1dtn23RKC7B1e9ZHerhq6+Qcm0wtfceEGHnN8Fel8ec
	tILh15t2g1n+vMBrtNyQtrbzyubyS9UvY2zW2/3I72Z3pwPls227p3sd8qt/62zz
	XQtzjnK2PgREh3+o8e5PNj/0F01wt0sjIuEUB0YK1w7jSu4kbx47fqbI+Mkl+AwW
	KxDEErpIDDCQI7qucaBRX+FaUSBthQUHjs8022Scpo/vKXceN5AK85otNYR/C7eL
	CkBz0MiPDUVhrIo/UQfoTtxUXgI/5sdvzmB9Sh/Hy8RyAf1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4b6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 01 Jul 2026 10:37:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso250076485a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902238; x=1783507038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBLQidyajdO9oG1GsqnmdD1EP+Zn0eFu7AAq13az6os=;
        b=cX5ugZ+5ZqJBZzADFzlO415Snhe44xSZvtLNYweoDDQjrQxbP6GmuWvijZ2n48d8nD
         MIBAyByyo+g3ppLhiVm9HxRstDF80FfL8G0sIFpXm41nBmYUa50kQPkelYvZ/MLxXZMn
         uy49e4RSOJqAYpmYzYy5x1/3ZuLEfVrbviiU0KR/UfDqhf8axFCHVZAGq1Y8wCZf7M/s
         uzb+0m4FQOG938dXgHBsuhDtv3nWGCO4HXTKsc+htDvDkGSO4VGFNgcHAogowflTIzxC
         3JV0wfPmsEpHSRL2fJ0if/glvDaqlLVnVpolyli5BxHiyi+OafcDX5/GQW5CF8zEyXkk
         nZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902238; x=1783507038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBLQidyajdO9oG1GsqnmdD1EP+Zn0eFu7AAq13az6os=;
        b=Bmylh7k0gTVb/CbGsHNS75BzZb+I62MppENxUJ1toAsh0qqb9gjzPhttB/sV7K6Y8g
         PrtoTRVSUvg5mXYmLGpsIqWOIV+nfCg3lE8lNvvhHpVNLe0l1a7tvnYGhd7AeW7aY6vq
         dH/rqHr4WM90hcZzpyHeFUEYOWdQm4pT7o0uJhT8QgYHEJpFu22whvgvY9MTc8gPu+Qr
         hDRmVpMSfSoQ9sazoIxcV9WCxLBo5YhYwh1Qn0KgO5+wXfxsBcscVVogx89nDHXRhsvw
         bvzBaj8cpUFNfnGIPvwY0dpob9XrGqdGGlOlf2rkSmLUrkZmrTTzct564AOXY3OtTPIH
         tFlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9T3dnfzBjYfNcJJkDwa54YztuKW8EHFk4nnTSkhA553hTsFb0ISaDO2IClLl1PVSwGOTZqJDr7qcd8IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdS1naIz/UAFcihhH5wofSYeIuYJGBAsGA/8LRUpnTP+ammIep
	WOmf33OSHBA0eccRwUKQ8eIBVTie1jk19HdGIxyoVwjX+BteNZ+EW0amqEpv4hNet7pJK436SD3
	vhAVwCJTugvxbFwM1M45D/UteIeK6SDz7d9yA9x675+BVwLoeHsAu9f67y0MD08A6LA==
X-Gm-Gg: AfdE7cnj0uKCBfJ4EtAI1tTyCrA7ATpISzZ+6m17ns+mTJT0D79CoBZbnSYQgwEcmtI
	q63xslpA3+rH7uKaX25Ens+qWIqSQwfNSVcFOuFnSL5JHDl3uZIYNAVxh12juoP0ANTDRn017Ci
	5B+Kb5RiM+LyokD/xS4pexinVMg3W5LlH8bQJ8ZkLrPYtdVnngGhdTCq86NIOUJoaUdSAOU1Q9U
	fmqoRNBmTilUvJOEbIc4xRi2eDUZPtkeTJ0/VOdh7ZT2FgTAjVcZL9nn1o2G0Q7O6fs6qXkTGT+
	unhT2rTuEKu0YWaFZVA88ulxasFi4dQqtQIH9H//XnxscWu+yD3vMJLOwUblNjpKH+VGgGpFpB/
	h0Ggfmo/yaKjRx8mGAG+0YKKakll2pGUkPBIm7ghI+T8=
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr787223985a.16.1782902237886;
        Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr787221185a.16.1782902237505;
        Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:16 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Wed,  1 Jul 2026 12:37:09 +0200
Message-ID: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX6bwD209shal4
 JeFeWMiyoiAm9GBHIXC+m3tNsDZB2Kgca98+tcgeaksfxoz/zojNxGZ47KuvQk2T+UVdteyHtR2
 N/iuSPQyX2KY5yGTX2GijqhL+B5i+mI=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44edde cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: DAfc8TtIn_VU6X6rd0lgc06QeYur6-V1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXwttYhzRx2l05
 g/Q8XS71WUrT7hPgVXI9pj2p3GSKlr+sdt4BcNw8b5x+fipG3X0najM6/tIvc2T6FLD+ZSKbMLx
 z0ZX1JdGR2GAe7gjgLyHUj0kUqyslkUeElbgYD7LiQSqXM7O1dOrxD8ZMZzBxRosJPnRBn5BfQI
 FhSMIOhtnUnEBovQcL9coO70qL14bXWkH90q2L5E40iV+bRABSQmxR3DOVUXSopcb6XLKStRrQP
 gdBQzY7P7UYOmUheChVB1mLOLvVPOQN56qXhtk1d/gT/D6TN5LQZJ9V+FFfpMx0ohta9F5bwl0z
 3mS8eXTxbAitODIJe7fs2C+oIMfpK/K/ZAevwoAofVv8DvkjRVjFe5RgbVlXF5sJ6lfZQLGeG7/
 GDz4WmtJcKC6b7owNu1agagrzOcqTi/czghXHyGP93Bg2Q+1YExtwz7v5EnX3JLV5KBUIiX4hDB
 A1Ae6ahtcohMpuMeTkw==
X-Proofpoint-GUID: DAfc8TtIn_VU6X6rd0lgc06QeYur6-V1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010110

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

Thanks,

Daniel

---
 Changelog:
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

Daniel Lezcano (2):
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
 2 files changed, 197 insertions(+), 1 deletion(-)

-- 
2.53.0

