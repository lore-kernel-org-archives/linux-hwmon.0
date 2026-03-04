Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A08139B94D
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615022; cv=none; b=GRScSR0p5J2i6d+4upIQ0Czu7FN21T/8lmk1GiGutuyiDM+ZwzbGQtj0jrSYK01VIpE6PtMdN4iQUtsSFzFjPt8kduXpD/xsU/c/iKtsdWX/BKyM5438Qv9uimrVeADeYSABcq6MSkVu2+aPxtXO4u2F19ZR2s05zlVcLE8hQfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615022; c=relaxed/simple;
	bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8oAr8b61rqatQImFKXsCD3RmcR3SIp26qIh8No8CzjTmn8D+q/XB+afYQyuc4Xv2tZOmj5pW1zQibqMqFSh0+DamDu/UyC2ooG8t+vv7e9cVD7y3Ggc/Ie8irFVYgAAi0MntGxhNgQo7ZFVDqjPPgj8t2+YV+5AmxVPvTf3hfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUvkTtYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkJPOMFl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUvkTtYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZkJPOMFl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SXxr1072475
	for <linux-hwmon@vger.kernel.org>; Wed, 4 Mar 2026 09:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=; b=HUvkTtYIGHCF46cT
	vzFc6J6pDnXt8HmS67vhxuF7vL53WUanXgs0NbH+VI5EVRDnySVd8Y7UZWIL+2+X
	6esk1LCKZeg8BlKjca74TYxulLvKMKzwRHuf0pTLbqexTMJQjJb2tyrkS3HJkYa1
	OZagmawkFeI4w93zRbxy0aCpFx+H0vJhb+sqvrcP3K/oymnAd1Ce/IZ9qU+XxKgC
	0HknP2Oz/5e6O9DS9aizV3ROR4E1dvMIN2m/MqCqdGgBqiDPHCRy0j72cYIlQvkc
	NWZF3vdPFc2nAHBFbiJV/d6bP48ch+3E/q8AkJYdRYjJzqWtXUd5yQcEKq6u7sVU
	yGBMZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfh0nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 09:03:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so3981622785a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615020; x=1773219820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=ZkJPOMFlKJ8NG+AP4dskzwGg94kZgQ/AaCSZ/q33mjLhbpYFCRmH9M7RHBHepwmPHv
         I8FMw7ZBVVa3cY5eqzGO3cpG8dN1v6hu/No4OaRdWGp8UoyigvMOFb1LxhWYYdE332E3
         MlYuXUat4uo1Gs0EbPp6uXLbX59vlrR5dg58L3XWeSHXvqfR0kr80dKlzSzFc9Ly/5Ge
         ywCYAYdBPjAMf4q9OCO0ZxIB2Pc04Xhf5MtssTWhIkInnoyqB8cxOFIUQgELZyApUAKA
         +9lZg43KAhM889HiE88QZ6YkK8XxOtP0X7zrAco9eRiwXzHr0BgyONI+TeTrF9RraiAE
         /p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615020; x=1773219820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=tifMONqciQQdviYXfifinWnKnqvv7C3nQIQctuT3hrWYJSjudPmScmONDB9MW9P8D9
         XdEySaWJJe21id3QuZhC9McSxdN2eqkH8vhwFIit+ff6xLVuih1JmsprDnSOX6T1ojLb
         OSOb8yMoIJ/KHfZNmnqO2Dy6bAAsAkRc/WuhUttfmL+BYYOctlKCVwkdU3qSkbObh5Dc
         SIHVDXKl0jtY4aFLP00BmJDErhIDpr2qnyXZiDiGW+2qFG5GciHoqIyXMkopkIl+TFK9
         AwHIgNm48J56wNGv8btS58+IXRQgw7Zik0kQAYCoVzBdd/4wLUCK4FTqu4GYnNpdEA8y
         MOwA==
X-Forwarded-Encrypted: i=1; AJvYcCVW2FSIeR+aejpYNvColBqhxfMFSgx3Mp2V+JIhyKVfAHe6t1mb+D8NtwTH6fRY+5Iz0AED96B70t6uEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5IiSt+2jMtzUcT9tT7gioIwwFY1NQEZVKwZtY4k3dqAameDq5
	42p0YnN96l2KBDDpeKVqfitZL6mHHnENyThQ86CS+Sr2pMA5LYuNFV4U22i5AaKz/IGUohCCWHt
	P/nO+wevBomk3kmEeePhzepm1Rb3FVUECR/DDeF0AKDikh1IS5ZTMwQs92r9K0mJnRQ==
X-Gm-Gg: ATEYQzx+ULFDlRqr/7Fs52Vc3lGlzMsfR7h9OyAc1CpubkLVEgZflC5pE2tTREvCid6
	JL2LURsw1k7+m3CtjdfciJvcOjkAf6aZA9Sn7wC0zxM7kVXVeNZd1oGCkdD6ZYKQmDfOt/+mjSj
	IYqE+65s2RLp6/wqM3u4R7/aJ0fRsbFY7pw77RNLL9WcyrPtCQiTH+3rebX17bdppmmORznkXVK
	sbhMSVSGBTU1X8pwnZ54TKlbRI6b3QDOy4OwFF6zefAvYk0/I7AwcCyDDQp35CkXcHlxfSmppEO
	QiqnwIn8tAr6x6LQznNcnEirjRpt0XLIExYKySt9PTRa5VpHYJyiHLAQ63VHAKJ0wLxAH7GRmuv
	ZpEOlYsnGB9uaBbRLTZTH268r3xtqTJDIe88FNuI8F3JZCR9210L/
X-Received: by 2002:a05:620a:3949:b0:8ca:3854:8110 with SMTP id af79cd13be357-8cd5afc0c38mr159221485a.72.1772615019787;
        Wed, 04 Mar 2026 01:03:39 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8ca:3854:8110 with SMTP id af79cd13be357-8cd5afc0c38mr159216885a.72.1772615019300;
        Wed, 04 Mar 2026 01:03:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:33 +0100
Subject: [PATCH 12/14] staging: media: max96712: drop unneeded dependency
 on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-12-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U0YPpmr6EkC/Xcj5u6S5E3hZ52MCZJ0xQCq
 e6KcvDJUhqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NAAKCRAFnS7L/zaE
 w6ghEACtFFABHdrYTiZk0+F+HrOgj/2q9yn3zJKW2IUhc5ip11gsNxaZvRGYVoD1y9TrvFt77ji
 PFlWiBoM2qd2vxnADhudDyeyhkhNYjJeDPoyAS5BMkPEjo34LXOvRTt2jdNLcS0Yggitruyx3rl
 tEMtfMKolvomXC1gG17ZNj7PMDSOq+VsU9spkQ5TnrTJBHuLzzCCb20Glo7TFGAKZmQ9F/s0b19
 CUq+HEdABlAp8r2rt5877/AjCvFT2Y5YZvCPq8kKs3IF/vYAOnCW5j2f5VAzI9q7Ryf3HLlcbK5
 UJCVo6O1bKbH/P8T/DiGfR6yISzdNn12TXv6iYwwd0f8GUzMVVWU4l/VSepOfpcMY0K3ztQqHyH
 OJbQaN9cutXu/UrO0GsSwbu1XiTOcjKwXvZUgFMQyIs9mLHmwogfAqtgtlcKK0dfWKBTFtMk0R5
 Ya4MZuCMDiHuGEpWbZafXSaoIsowZpMZLWWMyck9cGXExUWFEtZza+r21drHqGw0M2nsB+Rdfuu
 JCtHW3W8cUNbtFfx/qtGTP4U1lvK2greeMzLTCgxtApLXz2h0CYhpOv1ETFzQr5gf0Ef9O6klZ1
 ifje4A7FNyS1+Sgh1NX897ZJ1aNIEh1ABIBtSAc4rvOd/HV+rMhsfL+4AhwtauXWv2W4fdZB9GW
 TlHYCNXye0s/o2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: jYrzgUf9ZmhNJZG7qXWz1EEOdXutP_yW
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7f56c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lbdJfbWXG8Zdtkr9XfcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX/0DIE9ILwA19
 ALyLC4NHJ9YclNDgIItiVJ2Hk/y+rsl9YqRiwvHduUSqmnib25VCbYjjVylY34y0cNESxu6tub2
 Od2C3lbU18c2epwcSspNywGzo40KCpKGNsn0WtmSanSYUvg5ZyZQP7syUs+eQoIMiMeMkiQEU6l
 hC5oWufaEcApWsNIU3QJKxXYIkaUV/J6G7x5tHF3gaZSmJI6BMItgmcxbEafJWIMOquygqRAJ23
 5q5jhhajK7FqXuPL9vZII6Lt/y3ZJ3jAOxbC3xRYoniVFJX3tFtbK/FXLctrO7V+qhrJdxlloXG
 UiGRPO4gAfVdXpTZ9GljQJzKlEIv/1PEl/BczWfQEdUc3VBAyzCPmml7E4LgjVReAgzuPgsKHEw
 TJvUvk7zhMcLzu6jF9rDu53jMyb4GQoafctbBYXRmpMEmLrOk2yLpz4ks4NH3LtLf/K/CxEGSS2
 P7K68kGVEKaWsApomHw==
X-Proofpoint-GUID: jYrzgUf9ZmhNJZG7qXWz1EEOdXutP_yW
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
 drivers/staging/media/max96712/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 117fadf81bd086cc3e5e95210503000d9e4d8738..93a2d583e90ddb2b797c5167a6d3373836e88126 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -2,7 +2,6 @@
 config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
-	depends on OF_GPIO
 	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

-- 
2.47.3

