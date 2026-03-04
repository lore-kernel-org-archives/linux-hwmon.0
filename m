Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD9E394482
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614985; cv=none; b=ENs2e28ZUymd99CmL+44K52Nrykc8uJC8sHyLWr7aHWXLzPOj/0jGjt76jLZhquZu7ftJgodjVi90cqP2LulZePyB9zAV2ZWBmxO6K1Ht3QrS8Qv05m6D2GTAU1raJU1XKLy+WDQKmVAdmfWOJz6jBfUG69whvoPR0hZd9PMjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614985; c=relaxed/simple;
	bh=25/jbEOYGOkc8yufidh5ln2EbH1f7N7ePyjlT7NMpnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWbIj3Blm8OgU/Y47/ZLcIKsVktzCcQWPwpkF5+MzR/qGYd4s1xjVqA3CvIxsuqgIaQacEKNcck5pRmAggm420g+8v6n4OJEq/a2Wvav0XpCKWhzxcfV6Mlc9iuE28u7tRI6J16Qypv6r4tVRhxJneYl/A6y1bmJBFcKg84dwBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUxvvGa6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKbydxEP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUxvvGa6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKbydxEP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SbWC1072553
	for <linux-hwmon@vger.kernel.org>; Wed, 4 Mar 2026 09:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=; b=iUxvvGa6AHVsf1CE
	cIAp40KFRSxzaMK6tRo/Ot89r0FLdjshWY1bHp4UoR+oLQgLfgevmBmFzcrZzI+S
	MAYwCgG+1Kw6HklcYcmTPb9wnio6Mmmu+KNfOxWWI68ssxjEMOiht3K6oHazTm7d
	k59m+ycliFGezRAiNrZa5IQD9eNfQm1ux5umtdteTjH4P1BmPua270CY7X2LVHSz
	ducmX6SqIi+BprB0v5a7ITYi8Y+CLpwkBXlolQnD8pkrTK7mL8+KtWu1BOV5TSZh
	hxYUisIwzg/oCq9VRTY5RUf7H0eHiPu9dmGYvMaD78EeNmc+IFNqqelijKxcWMdf
	yxzJWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfh0hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 09:03:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb390a0c4eso4283054785a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 01:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614982; x=1773219782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=;
        b=SKbydxEP8lK1kJIBgwwgvYgEb1Dm/d8x09sLUH6T4Y1LQmE6pXFl9txcGGHH4Jo9+8
         X1twcCJGcAXJ3l86Z7dxqlWxOkh6+pdRE+VwA8ypDzTO45diRomiakUp3aBWZWXHwFcV
         eB5OUT9bd0aSBT3eS152g0g9WWf9Vxd7sJQB2fjY0HUQdl24q4U65tjFF9ZU1xJu54ZA
         eJrDWWcaNpVDUPQSh9Bc3KfQoGZLdXVDjUR6cKm4Tm5jb7uYulBoTB7DARqKKCRqFDL6
         3FATrM2xF7VskD+6gD82vZnIQK4G9BQ674Z+NQ7JOHQSZdy4rbA/Jm/tztFL8kGEg+De
         nPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614982; x=1773219782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=;
        b=hqFy86JKiLrr8fEp5ZfcdXIxbDVTtmfrKl4NSebLfXd2F6ETmQcAmsKutTv+Kq75Pl
         i7eD6aTOQ4TfT8ql+6MBfEex4B9EPF4xNdpLjirnpyyths+B5qIXjYq9BPhjIMDNDD4p
         9Sq04FfqW1XGv5OP41NR7rU8Wbh9mnMx3O5zmYdpOIOtUcx40SuPShQ+BoadBs0qTqvZ
         eNnJnTrpHUQUl/IlIpdunDMFRNsD2SD/JsnpPo/bf3uimH89vv1pPcyzw46RFoA3cD88
         DIYd5GQteyBBOuqBw6zpOv3LvGtRfTu7mvYdgTo7pAGNzhvv8ryLUbfNlq01r5UK/1oF
         hR7w==
X-Forwarded-Encrypted: i=1; AJvYcCXIalPi1fnkj0osodFChkOHnGfZ4WqxSYUjhGoUnDcUAHM6eqQRYAxcrlgEpM2OcaTFy0BS/seBs1xQDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdF0loqhbxlG8t+8V8Klaj7he9LKEQJcmtN11fFrGTPwXuoNa
	hRBLIpYxI1dTDDZ/YCA4tlCC5aw5TMWfvWmjm1rILXCak9cI5+T/yGTxFDbnjiv/P29SsqI0MiM
	TfLUsPCcOR1FeKXk3zzR0g37Se+Us9vG+hRtodvD/kMWjNVqyZryj5xOsbXxbHZGDCw==
X-Gm-Gg: ATEYQzyAbY+AUXx7Z5elqRUnHTzzKOohdEkQ4pyPc7wpEpMLIq4j02fXL7FhKe53bGe
	NQB7eC8UxkL90YrnMvpbUeImGovy6OwbFK5a2mvw+JA/aQXIPkSFkeieKV4J28xnstFQC1MD3XT
	lMKIKHz+anlkOFxwCqivv54un75AkOYfDGDeaqInzCDSfofWBxblmERKeAD3vB4oDCYJ4tlQaMj
	IC8/2fV879EfZTrM2AWeUZpa2uhepeyvZSZjQrWhjWK1QzCO4oaOI+JOgHc9dzq30qDXLlbAHq3
	mOYsAc/chm0IhN2kImWGwk+3hykvTm4/Zb4uO8ymsuvvB/HRGuXCr55Zry/w6chUmwX06MUl193
	J0WaTUFCuPbP+26kYTlxYRyh4d/rqdkk0E0DQUfKyT0XiRn4jpNbA
X-Received: by 2002:a05:620a:199c:b0:8c9:fac8:c256 with SMTP id af79cd13be357-8cd5afcc900mr147421685a.77.1772614982484;
        Wed, 04 Mar 2026 01:03:02 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c9:fac8:c256 with SMTP id af79cd13be357-8cd5afcc900mr147419085a.77.1772614982041;
        Wed, 04 Mar 2026 01:03:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:24 +0100
Subject: [PATCH 03/14] powerpc: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-3-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=25/jbEOYGOkc8yufidh5ln2EbH1f7N7ePyjlT7NMpnI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UsS6j20gNdLUQ+uz+/FXiej3C67iz8F70QU
 ojaj9vQK0mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LAAKCRAFnS7L/zaE
 ww6REACusP6I8XHqjA+3Yae7NeDqnzXpc6CQ+RTZzkcMq6aAfUEFS6xnlAen19ugyDgZQXHMarL
 2otsWD2rzmrQb2HB224/i2HmhrzTdbDRtBcATi1drYJWZXJq8Tc0tiILUbI8u+PUscTUJo6hOqo
 LLNyADlnO6/+12tJR0Kqga/FIARCLH72kRa+lJ1ioUe6rOG9rJjhYXcRbw6pZs5hNB9ccVw1gJg
 ok+/f5EYeeaHxbcGOMdXBmfgCELp6K4Z4GXyJ7+kWaJsxpvsG68R8kFZf/sUqZ6bysAp9KoUwES
 vstNFoLcRpgQGqBTPhi1BiKUEIAyfSWeh1Sts9nhRiXhe8GMSiRexRJ7xdDe+5eNhsNZ9iiBB+y
 9A3PzpJxACN6XNe3ieW4gmP9KV9xqdeOkCJOI41SgiYsrsjVvwXpx/RIzZTINJ3VOp6NYNRhqZZ
 5i/EvVw6gA7ozjKWgwOJeoa7c4FA6O5eGpg16Of9PXIHsU+p22FJhpa1uJxjQPCRoNW407R+LlN
 BwA/WM+f6L/iejzY7jy6mKzM0GzafixchYkMgywGkJzyPW4BXrvxclKdjdkMWqydECbBSpDUGdh
 7kP659V3emuNeEifz+/sDkqbSwB5RFmpXCadYNNP/SCDu5RVP6K2Z4UIdcTMXSlT6UB4HYSuush
 EJBC5HRypdQ+c/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: eIzHVvirzIsjuHRDOVrdH8nXmRe2gLmz
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7f547 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=CZix5RWMGGMvBx25UzsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX8dXBb+5fwkYU
 f/Gf2g8utLdmVO/KKfKfa3MKn/LjP3FUnlSxN1vjFZgr189w7TqvBhv/RhHHGBGqZ2lrqEGYlT9
 Ar7zYdgy0S//FhAqwwWnEpm38hklA7In31UGg5HA3Fh4xs0JGfrAphwRTvziHn9AmIZmQImr+UU
 eOe0P3Dgrts/zDoWe9/fZzKOoGP9LuUEg+4fS0IF1z8XGC2UUtJSCSVXufQyKa2tuh4K/YwhRM2
 CAOkUnj6ahLVUaYd6VdOG4Fnnxxb0Z286K5Tjgwrxh2vWzZkOKqS6LiVpmpU7WSBwBkDnvoHBcv
 pw1oqPO923sCFLYSCVhiLdvWA2gNhhwH8DXaSSMa9vSI+Q9PrccUIUmt1yoWxJOq8apiW4uac0k
 Mm6wscCQZzLZ51iHxWEesFNCh9nFO75IOWuhf0NmZDmSl04UGi4rESA6s6T1yBMroHhEvFJ2qKC
 gbd23Yo0tuTei4k/Myw==
X-Proofpoint-GUID: eIzHVvirzIsjuHRDOVrdH8nXmRe2gLmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is automatically enabled on all OF systems. There's no need to
select it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/85xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index 604c1b4b6d45c11dc3149ee8b9adabe593882c8e..6805c19ac8a915dae1bd24b13010a56cf1948ad4 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -217,7 +217,6 @@ config GE_IMP3A
 config SGY_CTS1000
 	tristate "Servergy CTS-1000 support"
 	select GPIOLIB
-	select OF_GPIO
 	depends on CORENET_GENERIC
 	help
 	  Enable this to support functionality in Servergy's CTS-1000 systems.

-- 
2.47.3

