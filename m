Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07D04D2EC5
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690673; cv=none; b=CrCb9xOsGPqQCkAjUn6msAbygm1BdCMeQA0Q2MD6Q1V0wYIit4Yym7tX3BFHJOkKRgo/qzcL6Viw5PIkarwkTDqL7l7vw564sa86rqG3WB0CGoE8Zz0+P7S6KD6Ag5wSYtz6XZIUCiWR0o/sdeK017r2zgttUiiy3ChAPSFIccM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690673; c=relaxed/simple;
	bh=hWTJ66ICrMMYPDEetoAigezffDe9LGu5ZAq3+pTYj0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W94xeqqZbjcsv4OQT5QVzxHRJ6k5hxSHsr65H2p8e7hENt+4hkVX6qZstNn0VnBWB+JH04aqDfhqrSoZwV5xnM1PV00ThvTMqM93qdi5TKSUduemBCoPPdglmnfGvEYRlqlKo1eQK78dl6xABJRax7F7aFq3NbzGrNuDFNoomyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYPu6k/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUatXrph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYPu6k/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUatXrph"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAOQ662338776
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=; b=WYPu6k/BQJNW8oOg
	bK051FHeGpoAigfOiAPGIvuNhcPXe0hQAIseeH7jeNpVOEiS1Mml8cee/9nyGzWs
	IKxTuDNZS45J/rydoe71x+OslrZTel6RCOzG+ENEc7AOAGV2yNPlvAb/4Jzd12Ed
	tDVLRDZ4ij38l1AoPgCyFlxdyfm/m+EVnwapvj1bRiuPue1ErB2uxk/M2HijhONY
	qTfN3altQ+N1146Lx9M02p+EIUIDqJRoFGAVxpRLQ9SCcoBsVFbNtPt8hNSOvQY4
	l+AbNFMikchb7/che9f+lgUe15nslDqkUbTYsD3iEvchcDlvy/sOBRqjQYiJ5htH
	FPyydQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxcfyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so3950162eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690669; x=1779295469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=;
        b=HUatXrphAgZ09xx3SWqt2FdCZbB77aQR2mJSyS5P6vdOhQOBHY9v6d+nGboSj2a2BX
         3XtLsGNg7lVdrMV9FrGvZowkcrhXREGaL5MR8PpNYC4Kebw/DU/PV8Wc74we0ub26C7t
         SWxWZR0283t7n8WcxSaHDL/EMS0gb8ogfn9ds1P88IIv8XgbO0/bnflll3lpF44rOp8N
         JUylNPEi0VKo5sytf4DXO1llLfqgRMxtz3EMT7pimr6+6GIP5R2gQEFahL23NylJFgqB
         9ciKR3u7qNQeUCR7IJ6PD5p6xvE75aSMBWxCLlwLHlePukcAYugipluWzsreIBgAbquo
         tVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690669; x=1779295469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=;
        b=nI+acTrBAwysyMUWstHLHOhfO0Toa1HvBkixPKq21S9EdmQgYjHYMWFtP6i/Sx5Z4g
         Q/NEELBmihWm8raLObbUJ85b1Lu9G9dhqyrqZq+BYFiHwf+9k7UJNbUI4dwN6IklnxQv
         jLgy68pssoDv0cnfDT6MvOEFNMrJye9nFuRup8PgSaPNyawZim4fsatAfIglg9+k6chk
         Q8gsiqM22d9AKixUP8wAw5dthJtEE62/WuJzFPngJtfbPqm0EUDyTuJkFTB6H9RsbZ+/
         GO1kGX+2tYSjRRKyRZlUwa6vCOCpVQej/G2NKwuRBThAHPOc/Df9mq9bZA8kbs/BxiQG
         Dfag==
X-Forwarded-Encrypted: i=1; AFNElJ/KnQAGIJ+8Msf3nNTet8YzYSCMqQtTALuvKeL+4o1c1XksHSnTnx5P5+RjSycESbO7Nu4EIlHy5a1hFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMftrZO+QKaXcIYecQq+joAmxRvJVTkvuaLMMJvkrGkNhMeanm
	5CZkl5EvSJgczddc0EmrQBiRaayRIvoYzAkdTWpzNVtLKmRCpRZAISXk3GDu+RK83V5fkyv3+ca
	8wnrUT+5+vT6piAeS7xsCHKXnfmg4Tl1al9GGrz9ABQygARWfYubCQEeMqd0uGSoNRw==
X-Gm-Gg: Acq92OEGC7BcWBrCTpD+4vcm7arpBUwb07q1eZntw8AQC86hNwxZC5KmPlCnzE16ulw
	9uEkX5OfDquwTajdyr1VjAMU9vS+wHm6wW4ZzlbKn6U72qSg50qj4joGtoVSeVN75dpBW9fFyVa
	CTCMYijLafo6dRHQ6YOhvdBuSV+cD4UcjHIldRnotFA2HPySd98IYhzzUBOSq3cbOGNtSzrH+4I
	S/9xZlwYqWJeUgmfg2kXbz8Kf/swoM3TY5yLZ2m3/9EvIzqIF9jQDlgkRxQcwN/EO7lK4B+9hOX
	APUtdZlIOBo0iupojiJlFEj0Ec8NJH/bD3hdDN9nLPwtETOl0kqugEhBVxb2IJfQsguoc9SrZTP
	bVw3S9D6+DO2tuCtJhn5US9zbd8vg8yR+kmN+Q8NMm03tKIFof9UKhGnd2dWdgOTpumhsv8Q=
X-Received: by 2002:a05:7301:1294:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-3025fc493admr144419eec.10.1778690669464;
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1294:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-3025fc493admr144398eec.10.1778690668884;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:20 -0700
Subject: [PATCH 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-2-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=1078;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWTJ66ICrMMYPDEetoAigezffDe9LGu5ZAq3+pTYj0U=;
 b=dKt2ltOsglRwirWV/VFgytLio3t+0trY/M1zjyG4lzrU8COWFCdYDtyNysYCuSfhoFQEYkG72
 wGdFMM1kbfEAUr+QPv0OImnPdu41r/pDiZbC4NCgA6VLy0lrdZgwyx2
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-ORIG-GUID: cHBFAi_HF97V1VE3Khkq0zjjL75uYjoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX3iubL51JsDtv
 jN8TYRIvd9yoiZwGPkt2HvBy4ALM1xjjRr4bPzydWocHZjONupfx8+voDnBts5h9mnLJtCxVfOD
 sdYD1Sv6cQhQKIYUxcSMh8x7wai4ghIcy+qKhZFbT8XvfiRp+9Z9QEEeoPoG7sbAGvtU1EJzIcT
 XLKgoPxA7APikxrTo0l1UkZbRCjtZaBcfNcoV0qWFKB6z54IO23bJAh491VSe1/gza0/PuPo78M
 C0FIk242qXbkAn6UnV6IKE70/gec49i3gY1YkBNQT2eUZ9lqdu5ffUQG6Njtv/1geRyEWZJai5P
 i/Rluzb7Rv2zqziFatkmtrCOiXCenbZALCzTQ50s0Yw8n/SqZ10sQNdzZuA/HoFIHqY5OS1ogqn
 B+pGVRZtBepsNPzxjSboD7gIEZz1aHoE58AXwA7Ocsb3WWo9zQ1oBbGzWXmOztztNG5koge6sQN
 srEMUUqcIef7Exq+YTA==
X-Proofpoint-GUID: cHBFAi_HF97V1VE3Khkq0zjjL75uYjoS
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a04aa6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xQYt0fwn8ryh7dGzGRYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169

The SCMI cpufreq driver does not currently log the number of performance
domains discovered from firmware. This information is useful for
confirming the firmware exposed performance domains during debugging.

Log the domain count after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8aa9..d5c33eea2477 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (ret) {
 		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	dev_info(dev, "Initialized %d performance domains\n",
+		 perf_ops->num_domains_get(ph));
+	return 0;
 }
 
 static void scmi_cpufreq_remove(struct scmi_device *sdev)

-- 
2.43.0

