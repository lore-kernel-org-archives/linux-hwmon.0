Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3743A2E28
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692633; cv=none; b=Hsn28DdBr7k97pOohLDoUEZkSfh62QOkHTdGZETnGOmRF6xgmVVT2axi18f67li+BtmpWRb69STn30sKXoJaMqBACjK6u5XASoO+CIRMtsa0jR+8snDFE2pxwPUmQY5iqlYMfsdrDoitt1MAmehJq5iOGsz9oLfpivdrtvOM4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692633; c=relaxed/simple;
	bh=0S9j7FnuPmvobUdGBBFR9mVHs/17xvy4ykl0MOW3i40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8BpCR0kMK4YTHfdbmVxIDjf1oASVAbIyZ0TdagRMgv98blqqDXyxwPh7heDNlAqcvbHWQNm0ua71zccI73foNBDVXZ7zz/V+BT8RU+9T2l8mAqUSSG8miX+tCrqsIv7IQQQMZpR68QHmz/Xc9nouWjtoiAi8jGpjeYQeQaNSlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMOkt2T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj/pDm3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMOkt2T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj/pDm3H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DHA6xZ3430122
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=; b=VMOkt2T9AWzpX/2Y
	F/0z2gwP2iT2SjyvYZZnopLNFEkatb0HUTS0i2TJ3SS/XVVm8ylYwyikwvNWmdtR
	pBtKt1XUQX78PU8nqKLx2hlQRLjlGMqisFwMluN+w1PwEQ2J9VIajCTEuo8fGb8R
	6t688mBRG2gx5CEmb3Flxe/HpLxerOA7kXdFzaT2hSaq0CYPPkgKKBY5FZ8lT/Y/
	xN2BS22YiuFHSZxmRvTIzWiQHB6wgCizbMc2ERJWAYtg/tlMc/Dk4NqickDgHngF
	sWDoPAuEXN/ATNjDb0RC+6To/zH+0DhTSIyyCgEXTyEnOIT/e4wEgBMxjfh+0+2D
	ghaocA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmchkxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f485961555so18611270eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692623; x=1779297423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=;
        b=Lj/pDm3HXgd8cyU98UvswQq8ieq2X5x1dAZnZabhaiLhdL0zsY3GiAhKK3X4hIFTQE
         UpiL3ujIY3Lku9vFXtL2qts2dODBIn4S/dOkWwI90etjAVTus/Ky7Ohb4kPD16E8R7PO
         Gf1JzyfnaWuIxxHBIuxShyRISP4FTGoOWbMQFTRgJYX8EzOUQ90RuhDV55ohzqpf1BDi
         XGQkbndhasGLyYopfBOdn6ZOHfiJPfgObeJIRFvO6U/9oCBSly5deDNLpSEc7rY2sNKT
         WyG+Gv5UpPzr1vefRlqnFfXS/62MuxS2E19YE9SQIhxUn/u5qulLjvIbawRGxfCdt4fi
         RUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692623; x=1779297423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=;
        b=DRLUOAaIkGsECgZVTFeMr2sgOtliM4AqtpThLIpCl2o+WhV/sp1pGLa5Cv4FKT2B0s
         aCLEdJBG4YuJxz1Muw7Wy9OkqA1PwIvkNUr+ZQ5kJoFPqLBugJoHQb/5Tcc63Xs6EXSf
         ApBrDIfZkoC5KjVkI7iDVFnP5YT7FHVAUXfTvD0w9Yxs3WIvA7nRETNyOAeOSF4R/HIL
         cg1G5vVObmxC9t9tsG3eYE58s54pF2XwuNvo8PMX94uMJDWckDlgImRgKdHjiPmTgMp8
         gdCSbr9uMkV4PbSUko2FI+wrBjjHvg5R9+InzHA6Pm2oXhHn4YHSz7w7GmT5UUPqHd1K
         Dtfw==
X-Forwarded-Encrypted: i=1; AFNElJ85fRtY4C4M2BOpudyiIjp43mlNSI2UlLwv9vOD/Dz/SuoseWyrf+j7WTyh1VRBb9IbNjkBpGd2WbKNlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Izot5KdvWS3UJ8KCSpqclmQKTsNMO+wPo9JobvlfhAQCrm6o
	nElQMjzNNVAaBoKn62WBphlkxivubQ+0WLwuRQg5TL+dM/vCtgnp2cqfkxrMXUzKNIsHFTCUgfp
	j07hEjM0SQrLjNXqhUWlKYwxZelIRyvy6U9ocAUZAp4JnL3ELz5Fz/s6YKWrj831V/Q==
X-Gm-Gg: Acq92OGQ/37OEo01sOY2IHUx1whMd1X2cpatFsPPDpaRW0zdayXKZhAoTNWxnL3kZHi
	CWxZZjcpJnv/0JCwYQjUManhoAkzXDurK+l5g96rm7BJXfXEn3Z5jyfDIiL52RM++OpIDErsPVY
	l+1FPZfG0YuY4Ddfu6L64ys10nD3RTVjBXgPJ7Z0zeEeYGh79ciUAVJobDNITpY8kpuP02vBSP0
	QArVFXoLaMul/fztf5Xf7NmU86ErpMPDaaYE7VMM6Ls5RGlQuGNErVxwkmKt8W1OOCuqHc8SJK9
	H+DZ73uoVMZlgO5dN3ViVPuMdmzR9gTWzToZ+R8KQA0Ru+9B71MKVN4a7Ah5zxXKepyAIylDye9
	+jOVNVOvMjMlEY04R3iWGd57me7ctNAlC4g6h95y1MHkn68Ow6QxZ82p1bPw08L4ioY1BGW0=
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr2658717eec.3.1778692622831;
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr2658689eec.3.1778692622307;
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:55 -0700
Subject: [PATCH v2 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-2-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1077;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=0S9j7FnuPmvobUdGBBFR9mVHs/17xvy4ykl0MOW3i40=;
 b=6Vkg+4M4BEnG6+g6RMd6yk54y+a4e0RE4C47kciBZY24QjJKcU53CSueAMfPjK/6gchvjoe7K
 ef6MGhi5WiFCrvQ6v3lz3OSYvxZkL0evl1cDqxLdE15iihLXDW/VqpK
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: m50JXB_NQAbueyu1gAVX0JBddLSCgpyM
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04b20f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xQYt0fwn8ryh7dGzGRYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfXwg7NOz75nSrc
 ihjhzDRAhX5jNJ985Wq9Fp9Xb3Q+flNOEBKorUkWK36jyK+H5Asi3h7/yKywnJWjA7RFLMkjdZt
 23rUIfB2wN/J9oV8mb4MaMXzxPZBcdX/7SscW8pjnKnDasrmYtOzNopEDBI9bC62tfLV0bPM6Bs
 KavCSMDz3outSM4mboS7EnbKjV015rbio4wuQPlX15MUmWlrCFqXy/fKfEeFPuJp0IkaMxB41r6
 sz2/B9AjQUqTH1thn1NE5rt9LERFzdQNsvEfcKYEVkClgORvSgjTfqcMmxdcezS7sBdw/iVC5Ug
 rn9TIXL6Le1H48+SBymRdOOI7QSYvv2YidsBkmuVejjKoM6Auyo+Bla5Hf7EK6r78RxueqyQqBh
 znAtF7mvicNnu35KKjdyWwx0AucUhVtnUUV2Qxtd0KegOpAH4NjVWPlllp/+FPYJtLAJDQDqhqS
 9Lv4eghfxTGPXz9Rg9Q==
X-Proofpoint-ORIG-GUID: m50JXB_NQAbueyu1gAVX0JBddLSCgpyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174

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
index 4edb4f7a8aa9..f4cf59d862c6 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (ret) {
 		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	dev_dbg(dev, "Initialized %d performance domains\n",
+		 perf_ops->num_domains_get(ph));
+	return 0;
 }
 
 static void scmi_cpufreq_remove(struct scmi_device *sdev)

-- 
2.43.0

