Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6283A2E12
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692635; cv=none; b=SsuNC4F+/pl0xmxQWh3MZP6UWveTyY/wupmfsSYPFlev708gUb3YVeqUeNmEI9PMqVPgp/Q9AN8T6jgEPs+2ZcLUZMFr5G2o7HDgvihnyiQ566kaFeI0IKxFWmr4dC6HGRWrEx6q11iIA08j3iPBRlsy26SBjAuoG0yfA8Huf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692635; c=relaxed/simple;
	bh=Kj3iXhctlrnoi195JSqc+ZVTxrEJIVDVilbcH2wOlpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYm3/iyFXwLB3uVkP0r1RzqWErQvIfGQiw08E7Xsz+kg4DqAPjQn+cEVKwMTuL4LCx2gSzhxOQJSK5NfuaF+iHD6Bq9Sk65r/dvqZBR9gP1Au0cv0UKKbPNowL3mRpKciNg5VtH7zeNjFFNWxA+pV4rdNh2YSwvi3RmZkZNd7/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kryTxQA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCjxlbY3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kryTxQA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCjxlbY3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC4gr13324691
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=; b=kryTxQA6RM485eQX
	dx42ibBOB75xs/MJw/7b3DKZEiDJoe6dqOpjyvUAVS/XrFHKfS7lTZhkbJMgzocU
	m8TngOGjPaWwym33crrprlVCa/LhJP7R2/qHPUFnxVCLowrI1BDsElkK7//ZEtWt
	1Oyuw+KaiRd3xVbzKPDHVxIxS9tJga80y+guWSPjrExWnzHAgkPbLmRbKKIODbjf
	harIdC9nNhxRhduZLHu2336MAwCDgWEQkn1tN7iFieVDpCdTzbDg61a91GhkyNjw
	pNQq9AZFNeEJEwZHfZN/qLVPM2HdlXKI711JqpJ6sWkMQki6Uq7Fw0ye6KznP0Ue
	OCw5LA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdamkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdd327d970so3970553eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692626; x=1779297426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=;
        b=BCjxlbY3jZcFIHe8YTMbEOoh4nr9Rt8veOvWDiLvlnV0U+Kwy8O2zUr1hYIkAuoGPa
         6YJoUPghFitnuGro3hhGppBsX6Vwm2a1OLkij8P1Xpv4iFQvAcUZfJG7TA9dQoqJp07p
         mut20yOvGfXt58G04drxekh9TpVRuY/kHShEWcU0qsPaznaM5TWZoIYSHiZK+Cgx2BZl
         8d3OjUlexApnS0rlojIzwzLy0x1aVCeJ+BZwitNXpFGBcCdUkgwfVz39zf+B3/eX0RqS
         WdGnEDx7fvPRmQKCtV/fIZimjLSGdIDXzF1byI9eZG1+aqSq4DFBj1iBMLk/AP59OJlh
         yEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692626; x=1779297426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=;
        b=gwYkiyC0jkbqt+79CYzSbYU5bVvFz81kAcsCH65tSABBMsXJzFq4M0jMv96688x7pL
         V6pSr/s8rjixawpBvUl72G2vmVOUwFZJjFjsPq8Af5FDpjjoiqzYUwCB+Wh0WekUb26L
         J0IqBbOMTNwzwlbkVYrlYdKwfuBnzIXCXn/lT+Gg85z9+o8i/3Xoep4vKZZcs5+nbofa
         yltAKkEbl8TvHMo4M2xwaVWR7RRfZHGJKCfPL1pOrqNkRW84Jx+VS+mxASZ+uUWzi0ks
         2jz1XHt+dVlFsuVj+5qFLeuPW8TCgENfCbpqesYh3/6Q8AOF9VDqD1IC8ISAUqLeo++8
         zSBw==
X-Forwarded-Encrypted: i=1; AFNElJ+lJKAhQkxWBquyaDGCiJ9O6U5PlJUbd9zPjz4WA9fiqQNh1QytUNbT0MUc/tgm6SDnt7Mj8Y2oZYMhvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHScrnimAvRJrIjKJBZlION7KBfz1uqnP04u5nlISiRAmAfTM
	Q4v29cqmF84veuvd4AbS+bheZZl/I/fS5+kDGInjDckBo56UksgrOR5uF5W7WnkbgBTrtgkUNFi
	4terGzp9fiKP+TNKIUiCZxr1So8BMVRhEjWOOzKcOH6NGj2cOwB/IOoZ+59hQ+oDk8w==
X-Gm-Gg: Acq92OFG/6sjVZvj6XF75ejaKajFb5P7WDnvH9xHu7Bzc0HuqZDcUm0XJOG3iP+DX1d
	u29BE/DE7OpebPu1lJ+MJIiT45vEx6sL/OKZcSG7nQfL0UeZoTt84eKB8o8vVfDGkyD+Asd9ugJ
	Zj8Qs2xjUMMx+hxtQ2ZypXXFn0mR9yiwMZ2JK+mjCnrNP7eRqTtOjzd46cMOr7hv3qLneNioMdt
	AdC/vHHiNJ/4lxofu5HN0ZlutlOO+ZaD5VVWM5Vo73HZJStwavoIj915+FGu3YlGKzJzn5D2Evt
	hrmVCsZgrm3FlRgQOS8U2u/pVZoF9Wn8eRhUsJCSqEB06Q6uppoLLtZfuIG0BJmr2cqO93NvOHU
	gKAYB63vrUYzYtl1uEUpF8IOMF1hjJhYGRAH007NNb9UAtbtjSw6FQ4IgSZg7q2NNI3aSMfk=
X-Received: by 2002:a05:7300:d505:b0:2f1:1fe8:cf5c with SMTP id 5a478bee46e88-3025fd4ce24mr270846eec.11.1778692625728;
        Wed, 13 May 2026 10:17:05 -0700 (PDT)
X-Received: by 2002:a05:7300:d505:b0:2f1:1fe8:cf5c with SMTP id 5a478bee46e88-3025fd4ce24mr270809eec.11.1778692625112;
        Wed, 13 May 2026 10:17:05 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:58 -0700
Subject: [PATCH v2 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups,
 functions
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1456;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kj3iXhctlrnoi195JSqc+ZVTxrEJIVDVilbcH2wOlpY=;
 b=8IZtV5wzteupSXqIq+Bsxez1uHO07ft4wROITW/YKp+/ETuq3ZDtrIO4dorhEbPjGInJMDVlv
 mm2SVl1RvGNAtCxpfXCiux0cQSUOEKk7z9zzmj5dpwtHLyyAvkQN8yW
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: YgXWAoEbACiG9xAwFTM2zluBfN_DtZTb
X-Proofpoint-ORIG-GUID: YgXWAoEbACiG9xAwFTM2zluBfN_DtZTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX/X1X/KLQaR2b
 NigSJhpe6cRPMfrLiLPqIszrqKFgoFzoge7xSNhdiuyjCm8Ejy45Y20uHj7WTrTrLelqPQRfFWA
 gg3f3MLi2GKVEqGaoeeVtcBQiwRd3Ith5leOEHRYzyk4sO3z+LKQEw+xwn5zxb3Aw0kl8wZfoXG
 s6UrEaSlMCNACRuFAUVVpv5zDnaxxu2EhMb0QdGd9MkntTAmuwlNBlKnVJV1+ov83Yu4FwHuhxq
 KbpwC305JoziTITmIESM0t+/a7N7lS7Z5AHD9ixz6nz5zCkgXT3QCCXkR6QfF8FVfDLCK+YNxOk
 gn8bw4bUOOcrO+xzri1LAPJzClrZs3FILU/PnsUFumVWfcXSLbxcII1g2VFBWkMCO0+bdwbea3n
 Sn/JquRiaDY0A+36N7fAO3OL7NO9OSYAEu4pi9wkUbqp1TOWbAoXPQpm8JeEiHEK/tA17n5CKJy
 QS5VDGMPmBsAyY2smcw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04b213 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HhDMDxCfm6Xc3nGqG0sA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174

The SCMI pinctrl driver does not currently log the number of pins,
groups, and functions discovered from firmware. This information is
useful for confirming the firmware exposed pinctrl resources during
debugging.

Log these counts after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f22be6b7b82a..999c2061ddc3 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,6 +40,7 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 	struct pinfunction *functions;
 	unsigned int nr_functions;
+	unsigned int nr_groups;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -578,7 +579,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!pmx->functions)
 		return -ENOMEM;
 
-	return pinctrl_enable(pmx->pctldev);
+	pmx->nr_groups = pinctrl_scmi_get_groups_count(pmx->pctldev);
+
+	ret = pinctrl_enable(pmx->pctldev);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "Initialized %d pins, %d groups, %d functions\n",
+		 pmx->pctl_desc.npins, pmx->nr_groups, pmx->nr_functions);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0

