Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13388394784
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615011; cv=none; b=RjulC8coLOffcvRoJCQr62vUFUtevAinm7SRC0ir9TpPgdsTtTDwRZ45DSe5phfgz8qbp/xdto0V2GTy3d2DI5qI0uIcBi6zxG1WfHmLEVg6DPePtaSHvYgIW95alIlq63v1DuEPOjNzUWYLdTT31Kdq2ukYdl0Nr5WGcrWykiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615011; c=relaxed/simple;
	bh=BZ0gBX6ApkbfQGAvIdrTK0HNC5TATefci/BtaAEAScU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyjNcQ9izjNv1qMfZIZdh+o/q4ggdh2Dujtuvdv5PbjGSCwlDQCk1+mIILLtvGEHrMTIUpzGAui5f1f1O36g41jZOt5qGdXqKblpgQlg1Xy/x7TK37WjoC2SRP7+ZfywHu0ZT+JNZFgTzc2gs2xkks8YXj3zhKgNm1iVEIfOtwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8DhNi6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D99vRzAs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8DhNi6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D99vRzAs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SiRA1072686
	for <linux-hwmon@vger.kernel.org>; Wed, 4 Mar 2026 09:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=; b=O8DhNi6iiQ0wr6Qm
	XLgu0rlhFSuVWEQJkPbXZmZ9JD0AwZqTH8m46nANsRAK5ZixwpLI4VIEw8Za8BCw
	d4WiUqgPneaIhP+Ubju+TIK3gQ2rtr/xMZVAsMGU44w6cZ+kxjd4e/FlWaQiPO1H
	BR2NcuGvK08bm6aCDi8fbg9vt4ty/wRRgG3R3lMHBoVhwBQLmvzkLaw1B5gLozE9
	l58MB+oJBlSMflR1Uzzsa7vjJiRM7ipJrU/Bd9Wa0PWEfNFOuppvZiDZQZ43xps8
	qIS/mrDUT0yrBclJLPfzLA3bR++4OOCwfWGHZ+RjwPOufd0zashYK1qlwHOJ3UqD
	3ux1Vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfh0m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 09:03:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so828639485a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 01:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615008; x=1773219808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
        b=D99vRzAs4NLH4y70bMmcoZIkK75BYKAn+h3wmrHGAxCGUkfbiN04qqzjsHpONdz71m
         dAxMp8DbbcwvZ7ukJvWRjpeQk9F92b5CvrrDF8+82SKW7mMDOd+v5gXPdkWhJFp90Xv6
         uaY8PTEMo629T19RSw8aeCnXE3JOtLZCjRpD1rfCvlcUpmNkZn85vNAAN7YtubRTusiI
         GWiVCxpEeQRGL0GPobsvCkHYhxzQmhu780DYwDEgb/6Y13emWHrpuhaaO+1bfVgfBI4I
         x++zE98pWjXfXICPNgOTyubYaFuwMi41f0HOiXqj27SjWImhZaNnQjo+VpTQfKF6El82
         /LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615008; x=1773219808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
        b=jaMxPfhiIQN418TyQfzp1QRDoXus26YIdcUwis0v13f5EEgeOOBJtCANW5FA8jaarN
         c9stsFHjMwFHqtdnOWuizVCDarakP8qfFY4lzgRHCKDxzj7H/nr8IoGCLMQ4clofH0C3
         vCKuhJzqgXeLtgvRCFV7ZfjCJoMeNhfhT+ngwMcczNQGUP/3L/RVZseo7WMPZNsaI1hl
         MWN9h4vuQS3GJu+wnt2ZJsBIhOzNSvrq6rzkfJHvdBSgJa9ExH44Yn03mvvXTHUmhhin
         zqG3kG2N3J5AGH4T+9uljiMvqKOaFkO9xD/xNCTLqETspGDSDAX7y69k/gviz7iBFXg5
         8Pmg==
X-Forwarded-Encrypted: i=1; AJvYcCXA7zvBRtUzapvyL4SzcDuaScI0WN2RS0Fvo86tKQ84FMsQHjJeSibQIz72v+gvngYPJFjL6AL9IkVNYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlfs2SBBaqQJuiTVXcW5xHUx4xbc6/defvpZ1ewOkf+JGltp5J
	BNFVAFEMeG/aQsbNBelyDgviFrvxf4FTgrgWNizoAkJq679l95djSSdOlOnUR5cKaIwGmWynEFp
	fxPWFaj/Ns9ZVLRaA9CKNTD2N7RqHftEDKcwIk04uokZ9X/3tqup4qnWl/sbuuJHu8w==
X-Gm-Gg: ATEYQzyHq8KpieyYTFNdE/k8seXF9hfFaUQGxtiSgvjXpNNGCdBWAnHcYAAxa4P1a+A
	0zkok0DzomdgfGpQ4rOXzDL9B9EoH3+cCoRnpaCMsU9L+aUStoxrdgyxVS2EJhTrPOWzItNSbC6
	ZwbtM/6KE70FXiH36lZC4VnS/q6ACTGAXXB/b5j34KKQg+dAGzRqqUhku4n/S2eWm8hQXhbT6pE
	bPz3p0CTOqYdRz+4a8Ub5ph+fYN31EM/H21E6MVfMoXqYN2DxHBn7AkJBtQrks2nVbwOvYBk0Sq
	TpRibeFICIRDr2xBIjru3fX81Xupm/ssNP34XAAm63apVyITAzWqCXFI2bxDPqEHfAvrodIIykK
	PbXGEyuoBt7tNv1NS742FBQGf780BjpbzM9/M40rv/rLnfl42ioNW
X-Received: by 2002:a05:620a:1714:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd5af843f8mr148861585a.38.1772615008112;
        Wed, 04 Mar 2026 01:03:28 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd5af843f8mr148858285a.38.1772615007620;
        Wed, 04 Mar 2026 01:03:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:30 +0100
Subject: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BZ0gBX6ApkbfQGAvIdrTK0HNC5TATefci/BtaAEAScU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Uz6yqxw+9I2xsnrbiXWkb1Q6qa6KwlYI8TK
 d9JejBIMTWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MwAKCRAFnS7L/zaE
 w/3aEACwVZCfqTwZVPWkHYhO8Qy3o0ruCZnb285a+Ylf7yiCsvgYQn0a+sJ2Arc7KxxU/aPIXGv
 0aCZMBstfCGSxehuCnwhBer6o8ip4bb7kyIIkx0dm62T4QqKQ5L5QA5G4ciTBJ8EuvjtnSMeGuJ
 95epXjl8sR026uh4KZEYZYxbOgIWvV2Ug4vquTWPnO7T7/frpn7ujJB7EUgTMG+EHBSM2FIE+0v
 HWjaX7Q/qKobdkdnrFIva7tNsWe8WCAiSmYSvQGlWmDU15f/4yihAn90zQLK14jwUIIvbqKCRxW
 bhf7+1haXr3TsZRioTZ5+sP9XAFSH7Urm6a1oEoHKB06fJnOPAEawTfp9MNx1DfqPO3gvgmONrV
 yrSwl3IpJ3ld2yUQuOFT9i2nmkedupRNvQtalNFEPOpJtbP0bakZqh+KnXuyhvNKScPwT4MVgHu
 Lr4cvrNkmt//CI9a0nV0Wx85nantYCCTBfgiWEr5WrWOVDtQIL0JTuP/KYxN6KWjgf2fXehFdib
 dWGeFHTIp/lY4HrTk+4tQ6oetpUDkdppOiusjNeG9zYX5WjnV48wsSXaXvsw9gkjpeLyJAf1lNV
 3dZw5ihRTGrkMUJYU/0S567LpMEIQZfQetG+3NuIzQOs4p3djYvv1xGRysT8SVHkZVcA3vjwKfu
 YphKNug3FwuWLkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Ejg6q8ftyAybjMyB3HjUgMchdAV9nZk8
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7f561 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=DLk2I_icXWleI3Wn6BIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX6MEYVVNaMxVJ
 h0gaMSEx7UFoJ5Ckimm2a/NFlVKou9eAEDnuL09NSyzzpjd/TtdNtdoMwlT0l+qU/CwGkKbWaHV
 7szAU19bMz0ZfjU+Z0IC0tV65/YhgjkuYu/3yKW8Dw4X010ixzQWRjxVkpP0fyEtaxgzviDmP2z
 oG5DVCGfCqeRO9ol8e48xMzvUCxXkccyFZLLVzVk6kitSCHIMBACgV0R542Du535IMwR+CKq5aW
 DmcDObeDgkPDK5/KTFLmGYm5Jb7hzexXOza7VGX9Cl2qaNu8PJIbB/ZQAUaWnHRsSkMd9k7LuFc
 /qw/wLSx7VTJzLyPloOS1kn//euN/CVjMTIs68/UvoEdcQJQsPFnqReeaQ1isnPF3AJv9b7mV9S
 NvpKMa+oIPLONLe2+r9MmYZIdSDWwndLAb/ahJFm7ySkmmfn2VGBc/S5Y9dirmj+wKMRh++N3VL
 LD53aq5IpgIOLP+KFIA==
X-Proofpoint-GUID: Ejg6q8ftyAybjMyB3HjUgMchdAV9nZk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/hwmon/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8f7ce66ae3a258ebd439ed97441bb087dc01c76c..fb77baeeba27b9ec51142040beccc953df0a1e3e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -775,7 +775,6 @@ config SENSORS_G762
 
 config SENSORS_GPIO_FAN
 	tristate "GPIO fan"
-	depends on OF_GPIO
 	depends on GPIOLIB || COMPILE_TEST
 	depends on THERMAL || THERMAL=n
 	help

-- 
2.47.3

