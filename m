Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E61138D016
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690671; cv=none; b=Ndc1OAfeou4Ir1WwA30C38W85zNL8sTHKsYfQV//BkWyoAvGTyBepObCvjlo74K9Kqd5vzbKsjYnTj8VmOZX0Eu4/Kl8I583soZxWmY0BjhIoszwiU73GreMMdsQ+gUwYRXL7+AMYvy8D0ZzAtILkBxLxZhTNwSXM4AAdFn5kLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690671; c=relaxed/simple;
	bh=owGm+6Ms1s9d1BVzLgyFp+un8WuAsYAf6l9Aw77jkfw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iY0NIbB8WdoGS5C8X+M53C0fZQR8DU4yX/VnZ/+LVpFjyf1i2hhFn6Epa4davUXqgqGo6S7aJ8PT+gKPO7wUIAvIrvxxojhsM7BJcsmURwVxWsTDKHuRIrh8S1lS2144axfvA9oNMaCH39Z21H2liR2RG0/efOn8y9XzoCIpL3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okBjSjsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaJ+tAFG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okBjSjsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaJ+tAFG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAvHx2524346
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GxOv3DEpeFsG7lGsUZy6wV
	j3hN4O8w4tkjgP0Pww0/o=; b=okBjSjsHw5BOpXgK5ziJusqTYibbI6kIQpYBmk
	giLoWevafMpybboM+vGfOD8xMjXNy+ZJYLOlAp/kUl+r5c7wWiR9KQdGYb79jycM
	lQNyyEXf7OmwbBPmAY1I+y2lvbbfywFHr1Ab7fVNKgfozyXdCbIIKiSVRydK6EG5
	kyGJsXRxg9Yu1MB4g/QOuLeykYBO6s+qq3CwguXGfoDFzRx3bp8kTSPei/ObVaQs
	WufDZauE0fbf9DThk9H+PV2/DPmFCYv0xumXye7sKq6P+EquzGF3rwkf45D7y87c
	G5VU4h/3Cz6JoKoVgS+WacJW5ycpsfgeF42ZX5KNZfV2JPwQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjg48m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fded513994so12306585eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690667; x=1779295467; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=;
        b=QaJ+tAFG4J/pTJsaDGEHOy6rpQ0+R+z6nDS0NTS/n+uBq6RmJ+19fNdttXAQ42bwEo
         yAV0wDsmq7vuIAlGmG/3hN7DOkq7bMkcjcmOQATUv9z8R7IzgfgYIA98n3fVfyfTvP30
         aBC6EZuQAfBUyClVTm+kq0VvmZ1AyFtILI30zYBgD+fO50QtXoTSbjs714J6lRve9JBX
         VKeAmAQSdsybKg1Xru5b7W8ClEswVSYkSjVYgyx8LOzkJOnE19kpjmar5/XLGBHfVGH3
         xoQsch484dlIqgU0ZyvOA6RdAOUj0HrN72WDAVYUNhc/vuUwFvSgKOeVozZjiUwep8hG
         Qrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690667; x=1779295467;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=;
        b=f/81TwvjdL/id0QhcLAIAYWYEI8ABXsZqUT0zjZef3h5t2rr5pEnApL0v3JL+p6hP4
         CivUNL6tC2E9XPmDWvsVU7tnZwEw44yzgAqHIlWX9vNxNCp10UqY50PSOfzj1XYD6eJi
         EYJDAq8pw7m9z37kPGBEcWujTOVkkta3m4sMN3y6GaCSSfKQ1arUHtL1SjfR8gLVDuG3
         N8JzRjUpv5RBk8QLky69kLSul8sCM7GAsWD3V1oFwtPE0JYaOFezUlEEQR0zevQDYQFg
         5vnnFZiyaD5A1sQ4MObNPIib5bOsNSORzNgXkS/4wj9CJGrr4pG58axIeWNwFlaCtykG
         3/kQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UEbsr/jOyBIK/NH/Ldl6+jxledMyxMyoZtimOvnEBTEEpC2BHKRvFyINoXZpMQ6e/aiz0osYXoI1S2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxHAdndlsgcNa+2i9U/tU0qE/a3xSg2tHt0vpr0R7EVCAHpjr2
	Lx1vQIV3AIIYeXFmdIC4GJvIXwM/S1XEdHzoU8v0b9YBNhG/sG5NpkNENDC8a7sLZUgEz8sLaRX
	L0c5qTGA0968G8tXC/Ot//lsdzTjA8isiZlOYT+V7MsY0U2O5duTacw0mv76BhH3UAg==
X-Gm-Gg: Acq92OG+3YnosDQ+Mrouva5j6sz12ll801HjP08t+3daTU+abs7EPfQPIG1x1p1h53D
	TFG68YByYE/K63f+f+M8CxOhUuqy6cUqPDFBYaeXqMwrZBU8FR3JdpeUgBcX/VUzRNK0SUldnO6
	riJgWWFdVsY9/iViSWH8XxtIucNcklcsR4fc8E4d/SXs3EcehO6I5sSlCbyJmje8rFnKntwpk7T
	NawnLkObZ5R1qcPisOCQgg6iyLz07kEdSLGt8MhWhY48pmOaztZflj/pCgcwPuGYBFxBFdHObpl
	bO7Y4qJ+ImlDzg4psPgugzFTpPdlClPFXwzrCyLdfd9c5wqELf4vSdiTT4AUwjKQqxglcUzfiMy
	QJph7ewJifydpvXtXnUakn69xBjGIIyKe2OBgB+wwg0vFJDBeDFydm9kJf7ghBWQK7A7ivPw=
X-Received: by 2002:a05:7300:a504:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-30155e304dbmr1975318eec.28.1778690667516;
        Wed, 13 May 2026 09:44:27 -0700 (PDT)
X-Received: by 2002:a05:7300:a504:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-30155e304dbmr1975276eec.28.1778690666940;
        Wed, 13 May 2026 09:44:26 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:26 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH 0/5] scmi: Log client subsystem entity counts
Date: Wed, 13 May 2026 09:44:18 -0700
Message-Id: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOqBGoC/x3MTQqAIBBA4avErBuwQvu5SrQoHWugNDQiCO+et
 PwW770QKTBFGIoXAt0c2buMqixAb7NbCdlkQy1qJaToMeqDUe9M7sIz+IVw9ytWbaNtJ42UqoH
 cnoEsP/93nFL6AFz84YxnAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=1343;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=owGm+6Ms1s9d1BVzLgyFp+un8WuAsYAf6l9Aw77jkfw=;
 b=W/Xp+gageC3TE/YpgFXFLe+pQ267y6ZmcjgpS00EQKpFmnevoEgeH6XSr277h756bxENsa6q3
 0CHZJDNRK41CRyitjcc/SiRtRARtb3XvVyWqFikd3hYiupPgngaWxsP
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: x93cusbFC9VRAFsDlmX4gyH1tG70vhHv
X-Proofpoint-ORIG-GUID: x93cusbFC9VRAFsDlmX4gyH1tG70vhHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX8K17/EFMslcH
 YFN3i8e2wnCXYLMEzViD9sbX+wxlpo3+UhryGHXnC+pE4dBiqfqEzKPixgaxI+FF2BrUzyfPVC2
 VIYDJJjiz3y0CV91JIl6wTmsLW11oWW0BzeOaeE1Ia5JhkD7tgmBLTSta/qtXS06xt7cBZxPWeg
 foTl7etxJmGZDaAVH0RcSUoFlvs906Zhw8T9/8Xrq5wiV4XAP/CcgboGP4lqOwgibN/57Pzes/A
 vc6k8+rOSSXuDDm7422ckCTEeqbmd5McJLj24tFfdjUT8ujecw56Dtcq3RWyevV343WEEndn9/i
 d5HMdWs3xDgMYrhu0pmsjEdua8s97laMrrQ4Rjn7F8xS0zgJO6YEz9wFLnS7tC0svqsKveedOBA
 5DYMxQMn7FVI0NIG9jTUI4btdNDIE44iMCtTIe82K3CWzJCaelPKrxL++TVOw/Qe252guTSKvKV
 GZ23XRT7Pn8cSfhV1sA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04aa6c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0wi9YMwNQcJCIsSnl6QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130169

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

