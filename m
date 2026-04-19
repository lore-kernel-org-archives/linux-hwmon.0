Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1682EC54C
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622971; cv=none; b=fAvRRDF1sD7vHr/2JSNOAEdm//ZmSRwxtImfoJdl1ILgj5lLyz9tA+cTO538nNXwl/LrGUJlYvd9LLMe2fbAVIN0vaim1bej/+zgIzsTt/GumeWZ8UZzBUM3+d4cNM5t8jX48i2A+NgfNBIFGoIZKRxzlmz49BJkAkW07f7xdVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622971; c=relaxed/simple;
	bh=+x9c9NXuRa5b02u2PWhWcGBzOOAZ9xf2sJMC+EoLd2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NL1ut/1sYepk78FRk3dqtprBIn7+JZf5ReSjEufNT22tfZOsEhHKcGC6TI8ae/K3Vgp17+0tWFrnrN9z4ewIERwrb+Xlt7K5U15ZzN7CvO0x5j0OnETXsxogv+in51XPkcX6rROPZfIZpUOB8Rqh5CbUr+4Fn0pZS2u4LSL5Dr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwD1Tyb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbrSbzZh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwD1Tyb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbrSbzZh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JIKW4m383014
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lO8B9/Q2g6C
	ekw4Z+jMGvtIbLlF84pmBrYJu05mJ+9E=; b=JwD1Tyb+BwQ7FAk2LDV+ceBz1T9
	TZOX0HAjW2onU8WkhUmGt1mGJ6JapPn0U+qkaJMqXst5n6cfnRe3wgdVhXztrTJM
	ZJZ/KVOlx+h9UYpRO9BRwpn7tdomK0bQkS3Gfj88x2WkPtSodImNo4/OLPM6YHG9
	tfrRkya4KGJvZLl1qAsR+/HaK3j0+S1fnPJf9pqFdd32biMAVi3i3LIrYzSY5hN1
	vKEEzJ8xiRLLSlUOHFyKGqf3vm1k2B1aCFp19eSPecAfMl/ATfGUVj4CZYq/uUqR
	uy6+13eYyRzTkOW+tE50BRAsuAP9ELSehUgogTzpwXad2CJC2fAWykONcdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx31w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5aa81907so49782441cf.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622968; x=1777227768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO8B9/Q2g6Cekw4Z+jMGvtIbLlF84pmBrYJu05mJ+9E=;
        b=WbrSbzZhuIXppn3v7XzYXGzPgcJ9YcxQItTPI5RYqy6cAY2Ez6bkm9WyUAWnh9KyCJ
         uK99kNRWPMXLVD4gmDIUKG6K4YwwOaLKO5+1Ik2sCJ7TkkjDMVp+VArlFMgYqTsi64Vs
         zocUc3g57mgrHRQnZsaKHGLC3rzSYXoMLwiVxPPEOUrUo9z+983UeNDrLGKXOwzuxAQO
         H5Ev45xVhTnZR9LhflFKHNzHXdW3umiKx/r7s9AGAzoPs/Wr+A4e1Ydn10ujkEVUgTbS
         W/f643EY7bNuHsS8NcRctcsWt5JqoPRtIQCRWz6WS/Z0fVYcjvF30XBQBns8LDFv4mMb
         ddkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622968; x=1777227768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lO8B9/Q2g6Cekw4Z+jMGvtIbLlF84pmBrYJu05mJ+9E=;
        b=KidAlBKXATBnPHvcH/nQlfHJgk0bxe+U/Oy8K0FH6eiCRqH3xTjSRkI7CcriWxLogy
         u7cryv2J1LAuc3yaFtbdMHWkXWsOTdY29My9TerNL/M2W6naUyg5J+USenHoJpEmzZWP
         RCiWUrLQJyiPd98HNw4YQKa5tUhHAJzVEzLtqCXNWMJ1NH5NG3Ozhe9vJUo1ZGDbDwDo
         D/pbn9KrrNxydv0SEtMTVunvh7+DyN82QzMd5KYx1JSO5EZKjO3ZmE2PVf0po4R4eK7a
         8pxYhp3WoC9Y78KYd9i61za1lqz0m3DqQPrRWIm0vqPNlZH1rritl9taJQCV9n5n7qoj
         PnKA==
X-Forwarded-Encrypted: i=1; AFNElJ952tvYsDsJ9oNtEmLYOuY5FCY1e90VYKJx0cd6nQwjsyiqvz7UsTKgRDYzX7HnO1DZ0Y4NzfRF3PT0tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Tb6iLpJ/etTGw2LGHWQW/UkgnxjFXsPyS2bejXnBaaRoba8T
	Xqddag7r57dJGVWRLFARtPQ73NHInlOgPN/bOWX1NFqCx73Y7bNQJXR7H1ODwCDRb/0aQ1Q5E3N
	ZI+ZiSm1GlmJVSnxxzkMF8oW6c6GPQ9glJJ/+DeuGc03jbxZg0n6MwFiu2urmxwkGfQ==
X-Gm-Gg: AeBDietf6KHFdP/lmzt/oJG2FsDghpQ3/jGs599WPNscQMTQIRAD3xH8ZMIQn9akd9T
	yGeSDVNt0/5A6FA21RwAzkaYvStsxrb2xjO6zHJxGRLMSN20mdPq6I2GLpe2mAOxo4HXxHA9GbH
	I4RDDlFt4NUkwAdHJp6OjmQb4RmJz1jdE/qh/ShOV9wmJBYFc4L3RwxLOv5VQRn86KuRr4PeMne
	e9E4RelOyD76bPy9iG/6DfH4gvKM02dZqWArBJGpKDkpEedxLBYdkSw3FtUWBovSFe/wKlu+jNM
	AT16ZIXrveoqC07213Ri5JhkFNu8UYmKBeqgCalTW8iSt5MVwVCFHysT49e3q3/MD9UKZfyZ9wl
	fahGNio44EtFuW+zBq2+enE51aCzAd/BreHiUgEP+WuJPtY78DtkGC5h9Opju
X-Received: by 2002:a05:622a:4cc4:b0:50d:8389:c3f4 with SMTP id d75a77b69052e-50e36c78259mr168043801cf.55.1776622968479;
        Sun, 19 Apr 2026 11:22:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc4:b0:50d:8389:c3f4 with SMTP id d75a77b69052e-50e36c78259mr168043551cf.55.1776622968086;
        Sun, 19 Apr 2026 11:22:48 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:47 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: [PATCH v1 09/14] thermal/core: Put of_node field cooling device structure under Kconfig option
Date: Sun, 19 Apr 2026 20:21:53 +0200
Message-ID: <20260419182203.4083985-10-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: av_wIf2j7vFHuZ1U9Vn_9dDAViWEUdtN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX4SQly7aA8Q47
 lwCqzQXubgEie1tQCkc/K/MMTwe2G+ywZE6WmwLP4sG0RtY458Tt/dTCKyDdFY/TVoXcMk5bvBT
 HmVoZLb0EhhtsGLUpQIlT484KjltwxvTxdkSAWbqgFjjagfUog1+jpiHYeU5GnC2bKN1HUZzCa+
 w449qnszsRmJ/wJwQv92dUPqkQuSf/BmemlAioxxin+vS519ooKEguguOh/pSw1F0ZL6kzUvui7
 GpPIW/LUU8QXngGISSMciBtW7+d9XCOPoiHv5yi8BMtWYJUm74yjcx7llMC2nTYTMpfcJhEfUwr
 Mx6WzegtE/neI/LjUqu5J+Kmc+CRbgwvWx9vf5kVAV86xBIrtk/6y9zvHqmCZ+lfPXQPuNIdEaL
 BKNYPpCCAyLGXW4HfD925BqmddwJMwxIoBSwhIPAEjN7d81ya9+KC903tjvkg76CBQPsutGODeg
 ULPucZWm5ePN95Jr94g==
X-Proofpoint-GUID: av_wIf2j7vFHuZ1U9Vn_9dDAViWEUdtN
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e51d79 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=5aU8Z_IAf-MFAndoPNkA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604190197

The device node pointer in the cooling device structure is only needed
by the thermal OF in order to bind a thermal zone with a cooling
device. Now only the OF based drivers are using the thermal OF
functions and do not call the function with a NULL device_node
parameter as before. We can put this field under the CONFIG_THERMAL_OF
condition and make it go away if the device tree is not used.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/thermal.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index f7b8651c1ed0..a8e870ca2e27 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -125,7 +125,6 @@ struct thermal_cooling_device {
 	const char *type;
 	unsigned long max_state;
 	struct device device;
-	struct device_node *np;
 	void *devdata;
 	void *stats;
 	const struct thermal_cooling_device_ops *ops;
@@ -133,6 +132,9 @@ struct thermal_cooling_device {
 	struct mutex lock; /* protect thermal_instances list */
 	struct list_head thermal_instances;
 	struct list_head node;
+#ifdef CONFIG_THERMAL_OF
+	struct device_node *np;
+#endif
 #ifdef CONFIG_THERMAL_DEBUGFS
 	struct thermal_debugfs *debugfs;
 #endif
-- 
2.43.0

