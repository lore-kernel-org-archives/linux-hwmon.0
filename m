Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6FD394789
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614995; cv=none; b=By90TOBcJQZUopg8Vzp5eV0ivKEev+QS8Yqou6WjVkNbyp0wgxY/9dokCT/7dxfmuEXIocXdFhpITeFj1L4JCNtTihe5rPNK+UkrHB38Rl8stBRoxtxTU+Rb8lxrLrmg1B8p+IY7HR4w3a/GwWXTkrkuN2DSQIF+wflCBuSy7P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614995; c=relaxed/simple;
	bh=HYhh5175MjWDCW3hz6XHSycHBy64wcX8wW09sbGX2gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5AitYto1gUCOhige2ZzPFnPb+4qAY4EiBeG/tm7TS0nslaVJwL16gV6t4oEuztsNovZdRmwgt+zoIsUjA3+QaiLV4kL17EMSt77fH/h3tQ7rOgDhhCq04d5DbA6WphPKnFyzRnTQtHnpfZsytAY8S0wnAo0K9csTzaj36RWhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmgN3vXa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMQZF//T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmgN3vXa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMQZF//T"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SOhR631858
	for <linux-hwmon@vger.kernel.org>; Wed, 4 Mar 2026 09:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=; b=CmgN3vXaekSaNadh
	ZT7wjE5zhtUjH9dVHbJ/+23pBDJMMktK3ugLgmdPUjhKl5R7NQNX5eB8GvZihjmW
	SG8Z8+qtv68sx2172d7+3YzCi+PmbIlW7tAIEwpkwhecp3TlrV6hz2CdV23d1s6R
	og0TtdZpDSuXvxKVpODc7/TaWjzGKlj2QJxLmTT5BTKHqnZgz532HTNjzzKewK5S
	82hJ1D07JKQ290NCCjiaC0iObNREoolAm8kCj6bb9KnjDVxQK4bp0IXZGZwzcxwF
	to7XSDq6cGPz1PsdMqbCXjO+3O98PpPwE5Q6bWvEaG9UI3y6LChwykzE4InKTHca
	thwXYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtuccex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 09:03:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso4799392085a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 01:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614987; x=1773219787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=MMQZF//TlVx1tqe02PpHtMy64/BR2XBa9mVKCF5+uDDbnnhskGzOrU1w6jh+puoF92
         rpXkX4AKykNXm0Hslw1NF4e6Wez9NAM16H+ItcUJfZ+BfoShtL/AwsnWRtRd2O0wJxWx
         i9Ldmuyq1BU0+4M27re9Vwm6YTr3A5mzCf3Y+ZViqB1xO5rSybK7bOOEg2LOpirUGaNp
         +zaTFc7E2Mv717288PSkpYxsaYwZPTmKfTqU9DBe/QLU82PUArGNzeYDFdslC3n0Za9c
         7GQWCzbabnEphGrf7R50A9hmlCvxrVYkxo1vZQQEQXfj/4AKHPk8InMI51fZPcGJ5Uxg
         twRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614987; x=1773219787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=RtooXv/SMjsCBuMS5KuNlI88oah69CY0ufnzoARN9pd81Uj2mxqS51jIQ9/w6+kgfx
         a+0ES+x8HfFPmVv/eN4z1W/02FOkAU/vamD9o13X55hDeqhZ6Pt2Kbx56sx8Mjz2kp/O
         fhUb3n4SBbdETkolVYLg9gfh2VYzrbQdcIN2d8k7Va2Qg8pn9HbPBsTuHfERxRFMeRYo
         cd9222PH4WzaMJ8zW1ywDdUx1A9TPFxMFPI/TpqWPh45mqwLdfdeuKUBTTUsG7d5yqum
         9+S4LufwzvVIbYF7lCLH3UhS7ZvqhWwJUSNQh1k59a5pcLA4j5N+b52HveFK8qmwSuYD
         QAbg==
X-Forwarded-Encrypted: i=1; AJvYcCXRoNke9VYC0oTjbEdzo5UOrHuJRS3bagGZg4tCkjFT/DfJpYphv/zPUp9kbU4mcLZR35GvaWEvnjaEng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM8FgSirrsRqyXnwlFg5FS4hO0i57uZhuRIkBwV1vlEMXEALuJ
	it+lC53Uz6TZYi19xUwF1A50mAQ0wo11TgdjY9FgD7k4CXWEYW14GR7RS2CUUGtGqIHy23hdKFV
	j8hQs8mUnh1rQOtyhjg+hWAwGEyVG/1WIaFDAGLXMPfdvklr5eXoKtskyGzG3Oqfv5Q==
X-Gm-Gg: ATEYQzwwNZt6hHPWekaCcKLt5nKBdyE+kkq+PLbipUcJe12JzluQufzKvI7K6ZLduIr
	xEqEUkvdQsMfIr0SVa/n6zufQZf+Fzttw1JjOMzLLwyYHjlgSS35YcpypBuOXNhy1nV7PSjy21o
	9hgtmc6d/KYm4R/QSk2G8/CAPFNX4pIRMbdNQo73uQy0rsnNn/FTShSptPlLsPotpO9ASkoF0UA
	YYn1rGmZI6iSNngxHXlSdnGLVPpYQ01/hwTGz1Z4qCfwI3C6mUQ7u/8PmMhoiY4AtTkCMNwWrff
	zKuah/LW47BnK7FA4lZyFC8C8AIXqnsYur1qxOaz9MM3siZfJt/Typhqr2n5nYUlRbyWBfd8Yy6
	oBbbVBwe7M4pgcq1k9oEYx6jrPyv/PttakfZLUz9hyvroi7eMgeJG
X-Received: by 2002:a05:620a:1928:b0:8cb:395e:2b3b with SMTP id af79cd13be357-8cd5af13613mr171207185a.35.1772614986762;
        Wed, 04 Mar 2026 01:03:06 -0800 (PST)
X-Received: by 2002:a05:620a:1928:b0:8cb:395e:2b3b with SMTP id af79cd13be357-8cd5af13613mr171201185a.35.1772614986228;
        Wed, 04 Mar 2026 01:03:06 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:25 +0100
Subject: [PATCH 04/14] net: mdio: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-4-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HYhh5175MjWDCW3hz6XHSycHBy64wcX8wW09sbGX2gk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UtHU+xio9zdO/39jyV4sjCCRssE3sSle1F9
 oGNe0udP32JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LQAKCRAFnS7L/zaE
 w9XhEACRbGUQlbl1BceBLfGv1qLoKBaiUTxgwkTWKHN/9SH7vkusJhdtf7kodxfePqY4X6DdocO
 Y8J3BLBxYwWhhbSpRUBiTN5hm0e3LQ659eYtRyYQXZc0EwxeF/SW7J0W6aoPCnbRotyVLi8AELW
 3eTait+WSivwEw4Cu2IITjlJh9a308KeWw3vyvggIuIp//7I+AsB5x6XjLXlLZQFpErC+LVUjVk
 t9PA3piMLGXAym/P4tFgSYhAus6gdj4FFhtvf54JN5RA8fX7MhNlkqmDxWxU/jwWHMFZfNQ2xsk
 McgwcMZMLc44FZWKYQxwGYA7sYj6q7jVSjuhCDqu/lO99advfd2avAlB1rUTxkxLplVzyazwH/e
 ZaFppHMLvMnWGGToCN/Pp6f2hZ97FOOfHnRfGU4TXiTVbAGIn9BYhVqaRcxFr7yaHKAi0XY5X7e
 ad94XLXh5XYEv2uKCm7cU4JI2NvD7Mh+EK3wxA184srvnT7tRET6BeGKZUX5C5S5SNV81VbKjzE
 ced5x9ixEkDibW1GixB57MKH3kDaAVs36QuGY2w6Ghpy9p6VtzEb6kTuAnPoJI7M1zKyVL6Kz/p
 xFdxte9/mEi1MhtXrNVI86b8HLFK0uaR8FjVbOWzeBGSA0J6Z3vcPbQ0AdmRGnvPBElOAJayp7t
 XmJyi+/sS06aLHA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vGw-Obb7hN4jbqTnbextmBPdVRn4_TLh
X-Proofpoint-ORIG-GUID: vGw-Obb7hN4jbqTnbextmBPdVRn4_TLh
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7f54b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wUbH2sL_sFSbtn_y6v8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXyELKPw+ntEgh
 Nf9pk1REqKXtJ2ZW9XJKQV/jHClGBtBKBYD6JE68XmXy6l0iwemp9PM64jTuvs5KQmRb2zjVkGl
 uCu33OwG5iRGZKnaf6BhRD/h+WvKzxeW4+MvOizTtTKYzSMu4rG9eN6A1AnFBKl88KUUSOo+J5X
 lP4cvTPRb/HJ4XgpOqy7OCWXauY2/hZ7/tG/AiueeXQEkKw1QaIQgXE1EPQgffXsUHayJ+Rm8mT
 jujFcjy/IynuuNjUkIpCUxQCZu4+c4JjHJHgccJr+isXEl+nh+OT2OXywvYyu6k9wru6mILpnqF
 10t7PFjdZAZwwCZnQaOiROIQMjTYO33NO74+GXV1HR0G+skG5lh5c9BcTPEmcwUh/53NSF8/Xd+
 yNQLqWrxnhuG5pMZcQAxKSgcbxFpjuJRCX+tQ3IKIEgpySly6wAGUGzMccBdxvriCHgv7L0Tgon
 C0LEnbxrx5gnmnA5cvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/mdio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 44380378911b7d72e7289951fca90282d731913d..d7ca7fce7a3b86a435fac035534260146f114bc7 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -247,7 +247,7 @@ config MDIO_BUS_MUX_BCM_IPROC
 
 config MDIO_BUS_MUX_GPIO
 	tristate "GPIO controlled MDIO bus multiplexers"
-	depends on OF_GPIO && OF_MDIO
+	depends on OF_MDIO
 	select MDIO_BUS_MUX
 	help
 	  This module provides a driver for MDIO bus multiplexers that

-- 
2.47.3

