Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CCE385D60
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692627; cv=none; b=Pv9AnG9fmECJHWy6pLj+PHwJyB3eeu6INsMOfxccvfiE0UUkpYVbsUiF1Jq+cxsVck4mcc48yyjwIbtHst7tVEymWuF46hNS7nGZWqY2BqWoaAECRBYo8og2VVFEd3Scw+qocSyrDnz/Zlk+mX/a+ruU7QfNQs0K5T1PO35IKsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692627; c=relaxed/simple;
	bh=fzd/vjb1u/hgb97IIYa6s1ipXIoqKNbwIvaC6OZFVtQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fEc+m/TQT/QUwoEDmFY4CpJRL/sf8tzDNk3ublCCt3EOqSdUUSWvNLTThUotY914YE2va5vDDcLJHL3EzCPMlEQH/SGIR9nn9xe0M3vOopwiBN5zfzRpVpiUmaOWbBbNSggWINYkzPJiKwTVTewBdB+LMMOxRJ1nQFNaInuewek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=doj8WYW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwTg53Ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="doj8WYW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwTg53Ax"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF32bb2887841
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jx1/70KZBMxN87YCAFelMj
	Lwd8H5nC5QRAC82Z/a19E=; b=doj8WYW9nQl1bm4XpaUDKLOxmiewaY7ayXEBEm
	Jmq4WomSg8Bxiawk7NqxRfS3kn3RE4sRIZ70aXSwif/98faBGT313er3vFJu8hVJ
	w875fu7uf6xEKWx/2gqMl0m/CGHaMXM315yVicnMAUUyEmSWrz+nBcscg78yxZ9O
	6DU16hlzV1gDW7KLvRuGNlfX7/caykeble/2hvlgfYWOH2IiwQtaxeSo48ZJbc7K
	2VRpbY6XYjXssA1K7vpNTZw9vM/M5L/BCTx6LNcpqg7ANVRzxp7obSbB2cyGlXfU
	zi6Hf7ky5E43F2EhOWkmkPdi21hQFHDq7ORNEfvuvJmQcxTA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gj1n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so6107861eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692621; x=1779297421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=;
        b=VwTg53AxrwR+Vs4qdgj0ANcI0PDFnwI60Te+TWNSR3YCPjFACnKET0T7fHXca9Q3Zv
         pT276dGKRje86tDNGlVF3YuQxY+t9B54iUrWr3lFWplhh9h610rhv5SO3g3X9E3a870S
         4Pj1URXj5VVTzH+/dFzPqOMxzUzIAGSqtkQmhTMWuEj4C2KV4aEkTTG0vK5ayhq/cTKQ
         3s00F7i6Ynm9bAAvbbZ8zrycfhE13UoYuy0+Zc6aBOVxgS6moql2ejXH0fjmAiCFirN8
         lNHS1hBxtHl8d5E/0KqkkAl7ATbbdUMUubl6oXKvkGk+AryOp305jIJyJG7Jd6mXNLGR
         hMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692621; x=1779297421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=;
        b=ebfucUuynejKTxjHQrmKIykOubKbgz194wiHK+alNrUkFH780XAUQUFtzChG49Rn6D
         6H9xQWU3h61/5zzWel25L9LM0FFkT83k1CCXUPWszGCTTMUAFEU8cEoxGVSDzR+ZOIeH
         ZJ9YIS8pekv2wm9tiYeHrXiHe0u05OAZqU/8e4l/Zov0rFN3+3Dj0PXbnFpoiJ258ESZ
         RsHGwlPRft8zoxb1jvGmLMOhl8lbvy9bun2A6lBNBWRmXN/DlfEpxGtTmsDvoKKjEcFI
         54030pxKSepXW2CDlXAZ7JZeIdvBeJJC3DU0Pz8MWObwLBSLPndhRANhQ3rEu0oUasaV
         QBgg==
X-Forwarded-Encrypted: i=1; AFNElJ+BtMl1YHzEPCJvfnLNfxeYJFGuvWs9NFpe56RGEwAIuxH6GXF9MfABN8ROpXwBE7OQim8RHMmwfuuMzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaHZCreV+uKzWMjmFndvaCpcAAgVhmARwI2CLG2WF3UDOwNf8A
	H1/NTUCC3YLVZGREx2jmJLGFpERbyn13Kkpotai0BNRYwqoclKZxcsDV+XVinLXvMiGENK//j0B
	RZ/MgcImuXlfceSBDYNQLpqjF0hrd/E3y9FZzlVMT9/9lMIXqcs5Wj2ni1x4YnJjXwg==
X-Gm-Gg: Acq92OFOFmSr4vAhCPLwiJ6Saefe7VrR9szbWsRAr3N6yD//tKBnNF6GBKw3AH1xFc2
	uWxUmeY7O6/6+3hhDr5oV7eBwaj3ofzNJo94OqhDVcUgOm7GFmlZ33d6nd2Lui1WDDRVwsU/xp4
	l47SR3HX/QCq2aiqPFhOwn2thbyDIZsj5bQXlvxP8cioWtGv3Sfi1pXftBrixct9eQxndGxQlKp
	LA3+6yGBQPC2v665FqS2GxjGtCukEV66JkJFE9wPzL3qJ1uQDloWlG1SdXWgybR3CXsx2D/Gh1z
	x9QcVYuovy0zVoi2HYhumcWncFCaKDT4FJMOx9EHjhflQeN5a8WefqWgIitSaj0LgVQ/ec1JT+1
	Dl1ug85+lX47Cj3af9uwljRHmuOo5D1twveogi/74STojOPA3haGjQVXCupkITc6esjJS+QM=
X-Received: by 2002:a05:7300:ec08:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-301181a676emr2698571eec.10.1778692620943;
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
X-Received: by 2002:a05:7300:ec08:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-301181a676emr2698523eec.10.1778692620213;
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:16:59 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Date: Wed, 13 May 2026 10:16:53 -0700
Message-Id: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAayBGoC/3WNwQ6CMBBEf4X07JJtsSCe/A/DgZYFNgGKLRIN4
 d+txKuXSd4k82YTgTxTENdkE55WDuymCOqUCNvXU0fATWShUOWosYRgRwY7ME0LzN4ZgsF1IIv
 MthfdaJ1nIm5nTy2/Du+9itxzWJx/Hzer/LY/o8z+GFcJCIjmXBhpCLG8uRDSx7MerBvHNIao9
 n3/AH0Dg9vBAAAA
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692618; l=1518;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=fzd/vjb1u/hgb97IIYa6s1ipXIoqKNbwIvaC6OZFVtQ=;
 b=8l/21SLzmvsSoWLwwEfvmbO5Eh+2Zd3kiPyE2vcX82D5ElADwxGzPYS6H11r/GbzbkoITVhZZ
 vXKXed0fUU2Dshw//daOmL2IuIk3EdWjopaoUP7UBGfpOzKvblX1sea
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: FtpdtNIQ39ZQsZsxJMCzu_w2X4bzK3f5
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04b20d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0wi9YMwNQcJCIsSnl6QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: FtpdtNIQ39ZQsZsxJMCzu_w2X4bzK3f5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX+0vnvpj6MQNU
 YMxmbyQq8bc7yJP0a5Egkgq7l1/USGdnJb1D7ZhBC7p/n+KGP29KlraSQkIfbse335V3x/WyKzO
 AP7bHJjCYOQYK+EWxX18erVvoBpMsDAvm7H6QIJ9V8w8yEOm/ih7gFETxjgTOPVbieYqv1K197R
 pS3GQKmRILMYvy/XzpgcvKRAaMCZ8eiFwtbdXN0QzqOs+daHtz05I3GHKitSUoPohpgBQexdUp/
 R9jRKy1shpjHUivpnylVrP/MtHk4xJH5/Albm5I0oKln6kWeoc+GE0cFwjJhWnLJOv4PVCl9Fv1
 hb1rAbffD7QW15U5h0rzn11t9AoepCPbx1/vz3k2TVlNDU5u6BgqwIEgPjDuQCZdym4KnLVCqlF
 NMGU/y0jVmkOq/gAeied7bXB0hVJ6buQvd8VcX0/c8NLe/0voA8+Pt57mJASx86PyeRGeA0THCH
 XeKZTFUFl2p05ER+cEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174

SCMI client drivers do not consistently log the number of supported
entities discovered from firmware. This information is useful during
debugging because it shows which domains or resources were exposed by
firmware during probe.

Add logging of the number of supported entities to the SCMI cpufreq,
pinctrl, reset, hwmon, and powercap client drivers after a successful
probe. This aligns these drivers with the existing logging in the SCMI
power and performance domain drivers.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Changes in v2:
- Use dev_dbg instead of dev_info log level
- Link to v1: https://lore.kernel.org/r/20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com

---
Alex Tran (5):
      powercap: arm_scmi_powercap: Log number of powercap domains
      cpufreq: scmi-cpufreq: Log number of perf domains
      hwmon: scmi-hwmon: Log number of sensors
      reset: reset-scmi: Log number of reset domains
      pinctrl: pinctrl-scmi: Log number of pins, groups, functions

 drivers/cpufreq/scmi-cpufreq.c       |  5 ++++-
 drivers/hwmon/scmi-hwmon.c           |  1 +
 drivers/pinctrl/pinctrl-scmi.c       | 11 ++++++++++-
 drivers/powercap/arm_scmi_powercap.c |  1 +
 drivers/reset/reset-scmi.c           |  8 +++++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260509-scmi-client-probe-log-173cf85d5563

Best regards,
-- 
Alex Tran <alex.tran@oss.qualcomm.com>

