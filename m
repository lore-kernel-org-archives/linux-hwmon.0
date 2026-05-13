Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245374D9902
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690676; cv=none; b=YIyfEM7j2IJbyxYz230kWtV//Px6bF5N9ioxbeTq41WYw7dbK3Jp2U3WL3TVmq2ixnRrxUyw3AWzb9uuGJqi/ngwOcemmSCROn89grmY2UyDa8bDdspwLJBscIAh30Ll9NftDfMXyYiRb/fcdWkIwD1Gruw/64N/yTaldCXnnp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690676; c=relaxed/simple;
	bh=kkkJUN2duKjg2tEPhVJygQCN5sNnHuJItWMYlqkT/wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2j7HPCxvIgqDiQsb+Zcdqy0dWbZHu/DMbzD13za1VHFcsoVwJJyDnxf1f6Ic9NMhS8At8St2eEOUpvHAd2BYBqcJdZLH0TTTx0YBceXVgMtogW3z0nsDoWppJY8FjYnC/ElJI1yo0pZRXooe2xR7u0hsut4PXaf4emZ+xmh1sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt1bVYRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZplFx2H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt1bVYRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZplFx2H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG3us63007701
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=; b=Lt1bVYRowP5qG43u
	feMZAugbkgbmaoauVWkYsoFwKUZc1ImdfR4eUSXuqzHTyyu/EfSO07EM+TgdnuNq
	eh//W5u9d9zIpGlcl89COws7rP5oCQIOpMvfV9W7xZ40al8bZE+4CHHqbWci1mJ4
	vvOgXrsNeI3wdPxsly0eDGDa5BAk5m3rgwJwQ56q3/3RZDeZSFnG6K1Ek7Hhth1O
	WfPURlDIy9MwSQNijroZCoQQsIn6o8fD5mHkRI5imwNG6nVclDfeH7uMGHE7PIfq
	P14RBWkDbTz8v86ehMAl0ecGaB8VtqZCD0lY4w6Mmu76EG6yMy7yQeZlVjghSVJz
	TenaQQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hm0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:32 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1329791f18fso10247120c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690672; x=1779295472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=;
        b=cZplFx2HtgMVOWhPPae2oTW1f/JW/YUEDXnp2u4TG5GzbZx6srhVLtP8m85FGvPVq+
         jD8QOBkueL+LcluJ3Wy6AgzsJVhasA70MOd84IPNepcMyVbZRK9Pr541LnPNrpvzr9ZS
         MRFQtQ11G/q/MaYAxyrqlCAOXREp8cih9yHXQoqA1Rt8ZwE+dnlTTxlz/D3n4+D3TZKM
         f0ja668rxbPp3MCWmkVr+vjUcxUzfwjst5o9vHcNjXDMCCRnUicXd05w1El1CFndXU6e
         LPsAsc1fuTNJXUYCf79ERFoF+GY6StJ+hiHyYS93jhMycbAhScJuVn9vy4XYCdG2TV1F
         yYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690672; x=1779295472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=;
        b=ln8oPWjYWSjSvN3AAYXdNYmGjqgAsdZ2NrB3RD5Cs9e3unTx1tDYfIGG4lYhaZdtW4
         VR/crDlNbmwVCEFN7vh8RDLjPLbPoYSKtPmNCJiKiVwuZ+Gq6JN3xjwTxDUmemgE55rU
         RP/dfjEeGcyxPvbt3t3VYX/BlL5A5PH6fA9yH0aSLcAOabOHAt3WHK5lSl0aSrOBTL34
         VHi1C6N/BXjHQ+cCQUmgMRrNovfLPZyEPSkIlyU2edjITVmgzhGNe48gEdukkzQNWqy3
         2GIkdnc/YfTzzNEmw4uPfgZI/Z1PJVItGnJLhjVmvIUTDF/KksIfDWy2ukyEUejchCrT
         5T1w==
X-Forwarded-Encrypted: i=1; AFNElJ/3iWjTi2aDPqKpejF9HF6B3iGv8SDMT6XkJM0KtKDNT6yRxmN3PUlChGkPWTizwN1+AIdiBsbPUL+lfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTccIGLF2KB+9oYOh4Ji5I8O1NvNkVO6sCTND27oL8UDD6sFtB
	rMz5A+r3XcoIhO8/1IO4teepyFe3vExvBase4HSbtOsv+R6JamUb+WOXwMsr+d9v54nHefCly6n
	sh8qZuPp+/I9MMKMTzNLY9GuPJC5sLzB4hfNb/haI7CwuQIbwcvLlPPjqg0Bjyz7uMw==
X-Gm-Gg: Acq92OGiWNSXEYFmfadnUVR6huiecfoDzgDMLu//XEBlfowwDFXByjyFLlA8b99nYD/
	zteQ6sOaB7EnxqMETD/99lkO9ou+WpmTd6FLRcgqDd4j1iOzyzS6W77E4EJNbQDe+YodtEHgcwa
	/kCJJWdca6b3dAujue+IcWd2+79ojfeAr4dpBgY8YmLuFZiBJY9wNMfeQDqSyaq1Hk/f9QVIDxD
	x7t4r6h3Xk8l5BZCoXowBCsGNYyR/K49gWR9+ezaVGBkDLcCRPSzob6QHxtyzkp/wSlfSkk2ajj
	Dt6mqnHTsUY58I/yhMJXmQLRLc7ocs4kPjBTpqnBvbkSAyqSLaIICsUKKtBNb1NLfUonMyRyXaN
	kH649Fr/j4RUuvnIavEzOwk3Yy6zpYpCxS8F/dQLcj0bs59G521Q7rV1lhCDR6kqJeuaqVLA=
X-Received: by 2002:a05:7022:ec88:b0:132:956b:3c6 with SMTP id a92af1059eb24-1349ad870cemr2111967c88.33.1778690671483;
        Wed, 13 May 2026 09:44:31 -0700 (PDT)
X-Received: by 2002:a05:7022:ec88:b0:132:956b:3c6 with SMTP id a92af1059eb24-1349ad870cemr2111944c88.33.1778690670855;
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:22 -0700
Subject: [PATCH 4/5] reset: reset-scmi: Log number of reset domains
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-4-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690666; l=1391;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=kkkJUN2duKjg2tEPhVJygQCN5sNnHuJItWMYlqkT/wc=;
 b=+zDDnh3MxrImSIBbNC9dHdn17TxKkBrO3UxSfoKVDiRqAoPHX67PJnTILBR8G6xc1OVPmBa9v
 QzLeLBss5/3DRkX2f8GlrLsX4oJLNM+GlL2wId5D0DyBXYzzWOZZr6I
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX6qQxIwvDVLSb
 IPJHBd0OcM1BqLzgJllkdEQDFjwQ6AYB+H3Mz1Cz/8gb7/cfWOk3asMzZ61QYtla6ogbm7NptgG
 YTkFHGnxmfMKjvk1q+FPQheY6rsRi71tnqpBndCiP4EhvEt3bO6Vc3GZC1R/1SJKC7Z/3PtJSXH
 OByM2fi08J6nLZb/PzDC4LwDjbnc6631UTkqC9Cs57XfXzdhYRvzlMlrIen5IgobMOOEmWEkaYD
 KQW93aqKge3b44Xm1t2rvsv3GRGiKxkbDVVqMKL3OMPFOLXQggXDsK70OMNpFOK2f21okKn9k1i
 YGufF90C3YavuQxmRJQLY7vjwMGZtWARjhwmTSbGAgIN8aClggz7gy0Im228FWFvwSH8GZpyJy7
 ThDErJoR9ZH+f7NQCLeVPHWsOkQzl31CMYVQLAmGdbv2ds1BF8FKAxvkIBjFkab/PiuBp0iw5VN
 hZ0qJ++tcuhtscEqY9w==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04aa70 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wud5Z5ZUIjVBoUaN5zEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 7iSZijazZbKOQXMz6ItYeI3tEe7HRlvX
X-Proofpoint-GUID: 7iSZijazZbKOQXMz6ItYeI3tEe7HRlvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169

The SCMI reset driver does not currently report how many reset domains
were discovered from firmware during probe. This makes it harder to
confirm the firmware reset resources during debugging.

Log the reset domain count after a successful probe, aligning the driver
with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/reset/reset-scmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 4335811e0cfa..f26fad0dc726 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -93,6 +93,7 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	struct device_node *np = dev->of_node;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
+	int ret;
 
 	if (!handle)
 		return -ENODEV;
@@ -111,7 +112,12 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	data->rcdev.nr_resets = reset_ops->num_domains_get(ph);
 	data->ph = ph;
 
-	return devm_reset_controller_register(dev, &data->rcdev);
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "Initialized %d reset domains\n", data->rcdev.nr_resets);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0

