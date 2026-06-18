Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9633A005
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jun 2026 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798210; cv=none; b=TL3IGMW1fjg9ae7Su+aP5EVpb5zemjubh/DKZtNF7mK+g11WvF5hs/7BAYGlDbt6CyUhy1nywJfVJMXvoLl50eOluXTeffNGhfxlLFsZBjEf55o6JjsY6KQ3pgNyyzmGVtlBdUBQrOgftqDLLuJ7ZsnKqRsbfdI8PL8DfhwlHAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798210; c=relaxed/simple;
	bh=ISo22YJnXNXqaVnPUdI2iwKWaaF1NM0ILyuyDS+MJCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDqEy//N0SA54UNVAwab+A4pCTbu1pA+DMLClex6fud/6jBGVBTpZFRpkg0QT+p3P/1Xr4yAr5OYayg3GRulN+d0kaIj9UlA4S1++CX8+gx5k0ZPuYqZz9XgGOw1+rFydxY6jBqOdA81tzjv0VSZnoGMFB31Fy+0JqFwH64V1RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMEMYtpU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sse376YP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMEMYtpU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sse376YP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFFuff1914263
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jun 2026 15:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=; b=HMEMYtpU19n4fkV1
	DQ37Sr1kDaOTWB/nWmvLonPglOnDbbEK8K+ZHjGmuf1oYnizmR4qzxhH8Um4/xTn
	GzAoy3tPV1X6X7wJjUDx0LRDgXSBr5IfcEf8QStMbGZM/2GQG+S+L1BOXvs5Ze65
	1P+yGX97azGWM6SHP4yR3BgzxcU3EDgXS3b6Q8hjSetrRP5vAmSpWJ3eyRKo0Rkv
	duA+cpOdN4Dqo0oKjtjK/rq2UVuGZHe+LGmfnyg2k4ieWpWxs1ss00sODjm+Sijf
	pHJQW2SiUinz1bpcstciCx3dnKPgWRP9mT453bdZVIreLV0nqJt76xOQ+fe/QjJ9
	AGL4yA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc3xng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jun 2026 15:56:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1382674ba2eso1919218c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jun 2026 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781798206; x=1782403006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=;
        b=Sse376YPExR+7s0Tz2BAlSM/FPPDm57lP3mbbSccTGGSKMwbYpJ8lJ3P906ymPWko3
         N0oKS1g48w1sRDw0FV3VXYbJqQ+HOJB45hcmS1tyn9pvASNwwMU/zkUUPCL49zTLRgVI
         v5RCiiNjEIreZAc2Y7/Tv6pYcG1SlNyLb+7SjR7IZSfADXYsuB0y9A3bc3BdCE1LLlsJ
         yljdDktIzXyceDIvgLggvs2/qxXQNxkn8kKNJAGSihBswfcTkwVrnY3RYwM9tPUrX4jb
         aXzakm1g9f16tpsjZsTUSxms5N/762MNHh9q6xe00uRKsoDQxkTXwOs5xrmz+tEL8CKi
         T+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798206; x=1782403006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=;
        b=B4xsoISZ5pcnUDhYSa67Sp03xTlDGxCRqDcO731jUlzyJZxW7LeBkUHvxL/pvXTcMM
         byKL4xyLb3lRTmfrVem+FEEc5fZpSzmI/DnPjm2HTo4FB4YGW/wcV7mTsm3Wp8lVvifH
         ZDZQW4U2mpOMpmaM953Xq5XU3E7Oz+2RUiEUEXnzzHTcZvoHU7Fs0ZGvxeXPFcqpJCMX
         ColhQ+wHpsZNtntdOybVy4pxBAA2gVUPiWcR7qIlUPKYCHL4lB+6ryIfVhrPt4qw++u0
         MxhFEJLhCvRQjaPT//CssWWf6hXg0K2kdYmt7y4/FjN6aVRsTIXVxxIbQ+ABMVgLKjZ7
         LMJg==
X-Forwarded-Encrypted: i=1; AFNElJ8VImh+kPysK444JsH2oQDGAF/l+IiqFYXW/PS7Uel0ldAnrsIVdKkpYm3xr4r+jclDiAyyxykHNmTLLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpwwE7+f+DCORAWSG9cFha0Rmb5lzjlvcrr+4ajXzLfiMO2I+f
	pnNhkJXag4tyXaJM/pLBztlaXh4qVu08brHfmbwG38qq9pa5JmwHpouKQBHPx4ZXKRXoj8J2T9S
	5+AuKFpzkk9wzBR+Dq6BFywiqR+0LQ9QfFOd5Fuif0CQLW6OrTNEne1a+B+R+DmBZuA==
X-Gm-Gg: AfdE7cnUeNKnkg4/4VPIm72b+szpWpDBHzgxR4VZKzsyOhheqg6QBIoM/XaDzZUHwKZ
	dOwlS7FXYNr8TkHPalzCnbvb9G+CcyTjIS3Goq3o9WpuMCeIuY3thOIVUErZ1wV0IoGT9i8xQDg
	JbNCUErhXT6zca7cdCy5tIuQaDVH4w42SgHwleKixdPFLlPQpIhjgtPTwt9gHDp32cvPpsVAjln
	lnW/zpSTfySVOd/moc7VzFXVYZ3IA7qp3aiMpaM9i6zoDp2RbDoR826JwB68uj9nngRUxXHBC3r
	ftSHFnDPyCeJ//TtYFKOSydDDOYfiCKZyNaxvO2niXw4snHrNLuL9aOntM0Ni5FPhynl7Wzsu0e
	1kBIsT4DUQRKuLY6J8a87eNEuTvhcpkapcvxhf12edjuUpQghBsdi
X-Received: by 2002:a05:7022:e0a:b0:137:8bc2:f501 with SMTP id a92af1059eb24-139a20b8f2fmr156798c88.7.1781798205870;
        Thu, 18 Jun 2026 08:56:45 -0700 (PDT)
X-Received: by 2002:a05:7022:e0a:b0:137:8bc2:f501 with SMTP id a92af1059eb24-139a20b8f2fmr156745c88.7.1781798205339;
        Thu, 18 Jun 2026 08:56:45 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm19671267c88.5.2026.06.18.08.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:56:35 +0000
Subject: [PATCH v2 2/2] firmware: arm_scmi: request modules for discovered
 protocols
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-scmi-modalias-v2-2-8c7547c1be21@oss.qualcomm.com>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
In-Reply-To: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781798198; l=3118;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=ISo22YJnXNXqaVnPUdI2iwKWaaF1NM0ILyuyDS+MJCk=;
 b=5f2jzig78+7i8GOi9XkZud3yAV6oYQt+ilyEeUyLhW2skjQn50HhCx+V7eK5vQ/uA0ZWG+L0c
 UxiYpJMAspCAqqob00Y6y3CAenu9vXBzFSvBJJIOzsu/L/kkrEbLYzL
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a34153f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SFLdN7fYUvWWIfk3OzkA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: Lt0f20WcRqTwXjc45C_Yjz5umvx8xpuP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX3rCh3dfeuRWF
 WiJ5eYDxPm/HNfCX6r8oZ+hMV0xw/ZgkILyWPZeGrHCuj+0owCJXN7kl0yz+QBHo4ZMoqof60WT
 F+9ewyGGJG72J+5fJmpOPjEQU2wAiBc=
X-Proofpoint-ORIG-GUID: Lt0f20WcRqTwXjc45C_Yjz5umvx8xpuP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX+tUyUH7yG9fE
 jxwLZOe66kLQ3TT9RgP9jPymYSanWDanllpJrMQm5up1MsgslJCjo7lyCL8eqEa8YgrM/iSUYYa
 Ai9mIjYGr3QA5Gp1GtmA3Srj53ZLdWjD3vcRsrUXGuIL+PZHzyRZKoHykUWgHq1q0R/E8hxjx9W
 xSHNSNP6j83KRBRXuYz21zAOlKpKHCbFXP9zE1jEP3llyHZVT7T+hVjwYDkw5V+WaIiCNljRvce
 y79+qSWBV/9WF0OnMsZ80ucrxxEPxduE6B8WyS2p2QdpZw9Ae/AERMbWv4ZDqABX4tbFr5tYkO/
 Y1LU5MDPRqj/t87ev0bgnoziDazmsNGD17jd3y+0O4Q0yMB7R5oriE2pTZ45yZTsK7oFt3PD/Od
 hQ9Y5zI4k80Lo0Pw5GLxuj9TJw/0M9SB9hLEJGTb5qK2+ZGf3s7YDL2Puiq5GOeN449FiS5sZEV
 199OADocbQlSZrZHebA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180147

SCMI client devices are created from SCMI driver id tables. If such a
driver is modular, the core does not know the driver's client name until
the module has already loaded, so normal device uevent based autoloading
cannot break the dependency cycle.

Emit a protocol-level alias for each SCMI device id table entry and
request that alias when the SCMI core discovers an implemented protocol.
This loads modules that have registered interest in the protocol; their
normal SCMI driver registration then requests the concrete client device
and the SCMI bus matches it by protocol and name.

This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
only the SCMI Performance protocol node, where the cpufreq client name
is Linux-internal and not available from firmware before loading the
module.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 ++
 include/linux/mod_devicetable.h    | 1 +
 scripts/mod/file2alias.c           | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 0fd6a947499e..7d33fab94e28 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -48,6 +48,7 @@
 #include <trace/events/scmi.h>
 
 #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
+#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
 
 static DEFINE_IDA(scmi_id);
 
@@ -3363,6 +3364,7 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		of_node_get(child);
+		request_module_nowait(SCMI_MODULE_ALIAS_FMT, prot_id);
 		scmi_create_protocol_devices(child, info, prot_id, NULL);
 	}
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 769382f2eadd..2cc7e78e35a3 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,6 +477,7 @@ struct rpmsg_device_id {
 
 #define SCMI_NAME_SIZE		32
 #define SCMI_MODULE_PREFIX	"scmi:"
+#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
 
 struct scmi_device_id {
 	__u8 protocol_id;
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a5283f4c8e6f..40a37b6bf1ad 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
-/* Looks like: scmi:NN:S */
+/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
 static void do_scmi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, scmi_device_id, protocol_id);
@@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
 
 	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
 			    protocol_id, *name);
+	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
+			    protocol_id);
 }
 
 /* Looks like: i2c:S */

-- 
2.53.0

