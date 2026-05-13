Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2A3EDE57
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692631; cv=none; b=tqW9LhPmVCdpPOZrwSUWwWC0PE9xnWL6QIzLHYLYvOLsk4mp0wRnfdmwaSK6YkmMi6skTMHRmM/IWo9IZagx23C7t/La/PQ24xEuwkYKkUiyns++11mz4BoAOrmBIXt38ehd62rHWHlZ2LX+QvkPWkIZNDt5Y2IjV0c51PsMv04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692631; c=relaxed/simple;
	bh=IWeomyOh1Ae5xTrTn3KT0pUIoKGaJ6fwTgGzVci0FIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/dL0L5/1rfvRQcA99Q7XPTRleyRntotyXX+K5R5UaNkZNQvLoper3hynUWhtmU0Uz5wHUxEWRaM7UHXNwjqawjj1LDyBtrBgIjO0xGO/JFNQr81cw9B8aiUVyZz8jL9rYRnOj990Wo/IhNmcTSMl9TD14mB01JYzJ/CZ0VbqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQxQq+og; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxSTIzqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQxQq+og";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxSTIzqY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEPg6C2887851
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=; b=fQxQq+ogkG0kthGh
	83i0eWPeE8JdizI4q8NsjOSv25cMCXMfjG9C8NIJem68Z34SEDrIgMZ+AGG6OSjl
	DgFFyOYmxWP1JJDx/TXLFlXQDc58BkOsHdeIMoNnhWGkrkNz/IAS8RzCsELMMq0J
	jGoKWs6nCVaamf6Aj4YKX0puFEnbGpLmeI8cbdg9meGFixdKckeOnBm4/YRpNGjW
	3XSyf98t4OIxbgi3D1B0/8psNXix6XDNN7w7Eo3nYiKwGu1ZM0GtNB00r/KYGYOg
	NW903jrcHRD95MEMQCcBK2GoA1BKk/xtzxDFVYp4GQFp7pxOgL0xZpHlkblMopRi
	jlIS1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gj1nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:17:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so1240585eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692622; x=1779297422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=;
        b=CxSTIzqYAker85rLxqf/ZJJtEBkCrNVKcu1A/mojRmrK5mGJ9wcW2DW1avTQzgni+t
         J7GOX/DNsPbO+i7Vggj9Z1BShTQqNLN/UQZXq+Tr5S4MSY1XtkieDOEj5qm0BUE5+jI1
         b7mqW9lcOWk9n8N4W+o7TUxvR/Y9vyswnxREYdc+UY2wsfALW55V3tYk4ADGeZWf2STY
         +3224PI+f7+viekHt8v2xJh8xbBPa+eYA0qk/CtGm4ANCu/0r2GY9jnf22gR/Bjd4D3g
         BDWlcYrsRl8mH8kG8bmCV80wLAr5wqUda0X2KwdcIkb7kdiaK2lPFDcQUEY2o2k3PMhx
         bH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692622; x=1779297422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=;
        b=AYgFRSvJevHhxLFxEGAZDRKWxlr2QrP+8+LnrsCvAHXTqsAhqiv7cS+qM/ynWKNTRq
         9i7bISzq6Jkbz7p9+5mxdt/67zMw+MAqOpn8+qKkFfnp/wDqBD2iLMX0oS7HAOFeHdjk
         uX0NX+HCafzanIofp+zGoE6ZDdvTrq6QW1verrIiOOmwxpEM5VubOSVM8hj5+APQ1aer
         oBU+zgidttnBZJI84fK2jf8z4Ld9IPowN3X16ZeNeQwsH1EsvZF4vnS8vNTPJyYe9+zV
         ZOs8rA7z7NC/sQmQJYJ3bqdI9+kyNO8ghshC8MVoivc+P2s/q2ohGTFs6ZvJEO1zqrFF
         6usA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZeR2RzNiJYMfLAKnv2pefcrXmyM/eNjdLdG+2xk/bBpVq1El8jGlMQDpJ8xUUnqmVOZbRWddvEe2Xvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyamurIiHhGBCyWdKBOKkushbKfeaH7akVuL11ImAyCU3ChsNzH
	3ORJwE6cscLvZGtlbnzoA+uIzz7QyCQ+TzQE2851x7/ENzzq9y8xe63yygw0e+buotUyo1j56qR
	Z9Ub9GQNQo6ZdWRD0an551O3FSd2+NE29ySznxelqGPyBjPI1/5Gczd4PjHx99f25FA==
X-Gm-Gg: Acq92OEhrPEaU7MMGpHzyzHHVAGrYCbKFhOJTH2gDCzWc4b0+S6BCWw9aIRaDJfvRIa
	Misb+vdhvIg9kN8+K90IJngjYH4I+l9Ky/t2upKEkmhjdIxxQ5V/6wM84BepJHuo8XD8GjKDTqa
	2Sb9nFKgkDLYhA4MjbARARScYSQrlQEVuAwK25s2QTs9oMZGykRSBGoi9WNUdtnRDaUQKpLtnxA
	m6twvIBwK8mhUQy+SPHCFked4heQyFRXhgsI1YrRCOsiutAbT8Zv8zfdro/MIbof8QZn381ckP9
	giVMZCPpYqjliwaZfJe3mxD8jMxw61KK6AQF0EoVHF+zz5r2tXJ51pF7WGXPnac5Fg0m+3pADXg
	JhvE4GLA8TjZnMljxSE3Kfpi6lVGshcop1jPOAiFRCgfgraVr4XRBpY/R586mXeJMs8r8c3M=
X-Received: by 2002:a05:7300:a146:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3011708531cmr2740283eec.3.1778692621908;
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
X-Received: by 2002:a05:7300:a146:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3011708531cmr2740240eec.3.1778692621289;
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:54 -0700
Subject: [PATCH v2 1/5] powercap: arm_scmi_powercap: Log number of powercap
 domains
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-1-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=941;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=IWeomyOh1Ae5xTrTn3KT0pUIoKGaJ6fwTgGzVci0FIE=;
 b=eYcVU7i936b/87IEJANq3Fe77/zHJ+AvzRNx5TeCA/mVoSm099367r2A/+6SswcY3A1YG+/rf
 uHQ/wReFD31CuchIdzYXXVih9AwybSWgz42qZ6LDlL0I/3GrPN1/A04
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: YZ5iVKHIah00EDFU3yXFe93LHbuJeLQ3
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04b20e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Bjf1dfg4zo7KOAcPRCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: YZ5iVKHIah00EDFU3yXFe93LHbuJeLQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX8WypH+iGO/tz
 VLhGSrBNvw4uR34Y3KX0tRubmsZZ4qV6WvLV2TjXFe7pZobAI/V7y6SI/h4NtMaEBn57mwwuENn
 HLY9JYCBr83LJILqt+joh0HkZa4WuQKvmilFAql2eFFcN/ZcSBCe4N66CgChWc+Muc1lxd/Zzg4
 0rRhGo3ERgL5RerS2JjqUhXC5JllyygBn73leUfFKe0YVuYfSgQR0pUehlMMGVtkliSrLE0tLI4
 cMRukslOSpnv1S/8AC9p+3cC5C3gP5UaJOCCeunbkmVDtlBfkFjV+16pM5MKnbf/vKovDuzXGHW
 cV6z5FuRhe+g/ZY2EQnoPG5k0MDFP/nwD3Rh9Evjv7wkFXUVBCu+E0PdPf2uRi722/Wn9VgXlOE
 d7geZ5nxvJDwVMBgrr4H9n0QD8lZ9l3WSkesXwwt8NdvWr7I5s2uEGt/xbJufKAVQlSy1lMaBmr
 pTMWdEGBAyBM3ap3fUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174

The SCMI powercap driver does not currently report how many powercap
domains were discovered from firmware during probe. This makes it harder
to confirm the firmware exposed powercap resources during debugging.

Log the powercap domain count after a successful probe, aligning the
driver with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..3efe3743cce0 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		return ret;
 
 	dev_set_drvdata(dev, pr);
+	dev_dbg(dev, "Initialized %d powercap domains\n", pr->num_zones);
 
 	return ret;
 }

-- 
2.43.0

