Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881495;
	b=wKKJ1cPkYWC7zR710JDOfPP7havCXZH8to5VSCKeTw0xPxl3XzdH2AtwJQ5yend5R/UL
	 I4C3azrURgU9eYe+VNg6JP8V1ZOMixSOx2MO3ec1F+Padp00r+9qTi366/piZGoRKMMJi
	 rkYpnUlctU84gGQiECIUhpdJUowhga78ae/HKZ7c2PuW6m6rIdzf0wE8MpaK61iNBlmBj
	 ZKeOWhaVDaLSTgGU+F+/6aafwENVBfMsk/PU6c9OZdlVX2tl5xaETXUgGtNkNhKuxnnYk
	 WWoWgFrNFTkKhlexWzB7UJNvFQM1hXEhZm13/GYwOP1KpwcxqreMpdM1dhh3vRfGdrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=;
	b=NvJfsbjm1Dy+N/3gUeIFcEB+G3G20d5naRpymONpxRaD1uj9scAOIq142LuybnojFp2n
	 ljqb0X+Aeuf6++TQvMwoNBhvdC+hbq3ZWtlLxiQCw9YBE+dxPKc+IxtY4u9/T7MzGdjCG
	 92LWYj7nJ11cl3f/DcPD9XH15Ue0bfhJ36+uq9cOdXt6DGfBo5GlzyvvZnWJJJZjLYLxu
	 xd6tP0Sq3KLvWR6WWbJDv8eCA4vcmI+ae3HCYjMAZKMJKfRm7cZ8qKtcG4a1ES/U71W47
	 LYJFfxlc/+jPBkfZWhmjrx1PtlQCKSCA864hQW+OuzkFGUH2J+mLTSd9aklCMkBztIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sj48FKi9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxUi+XdJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BF3606A32E
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 12:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00BF3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sj48FKi9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxUi+XdJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJPo082987
	for <linux-hwmon@vger.kernel.org>; Thu, 5 Nov 2026 12:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=; b=Sj48FKi9APQlwcOq
	GDAZNmLT3CXSYY9O+PaU3TtvVQysmkBy1nFGyuUMO4SfoWoJlZtUpXCJkjnuYpzY
	XhLBH0rApGtho+uA+IAj5i07YLstmB9uL4i1XBq2Fn4pAjyqtB4XhAj1DTYr86gX
	5h0QIcNnJeXfVZBVW2XVKnFiBhtzA0BEg55NXJZTELlnDMVuiU85I18Gm8uTrsjx
	Bm4Xmm9nnEkThsG1fvHwBfQqWaknlaKGAGhtveTyrF84F1glilfOAmggfSRVvvEd
	rbtpKEm24aw9iEU5HrfbsTHWAsez6HxgkStnDOX7IuVgh3p0wZQ2I3uPsLJI53R4
	TL6jqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0rkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 12:24:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so506060685a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 04:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793881492; x=1794486292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=;
        b=cxUi+XdJManixpnNswIk32rty6flc21gszVy7jJKUrdujPJk+nu6CEuzqJEnXYfvVc
         ByhlDpF2Fzh6igNnmqXMCdIRODVNWOav9NauRm9GZP9DhDxMDYcKDrJTej52hIUXIziA
         pp5B3MBCRihuRX8vqProgQe4RawDW2ud5zBlUOwVIy5AluL7VRN1zopajQAzoh7UHRe9
         /j+tSYsICDRJlz9JMMkWUxOKVjGVu7ULvNvWS7BkcTIfeRX+0Yr1KE+/ZuL9tD3KY7vf
         7MgZBTUt8kS3kmw6UQZYdV2kXe61TAIpLIDoW2QfIuAmyfJEqBChPXAPzBphOKvCfMZJ
         H+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881492; x=1794486292;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=;
        b=XCJy4jGJXl056gYhiCNs0gV75r+s1cjg8rqLFoll7cL32PO8CAqC3yBhs26R6fmaSH
         4ec4HBs3KKUfG+1tglWer3GHq0FFfX9uWp1yMMFfi1hsVh3T2cBBEfRwN9CcDnKule2V
         bxqv056yHuFwxv1ZtoDyhgNVVFM8JmP0BUYcL91/28+0v8zC4rbyw9nKrYvV1JGmUqmN
         JA1waRaqJyxyGns0ZpIOhC50nPpdhdfHjSnYN/fTxNxhRIFUBtAaTYxSq05y6Jbu+ago
         hPtAiz3rjBVDcK5Oxb4l0RnmK//pELCdjtOLBZAxj9eDG400CurOqVXX/uCMd+BWBFmo
         GsYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjWbPhx87cvUxthyax2z4HuTAJLk3pEDyovbXhUGsSN1GjGIJ50TKTW+MfyhRz57KJeGXQCM99M8/jcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ymyblfwab05gtXWouNI9Eatvw0uj/ZQaWXV0JTA1v4jijPuII
	p7wYCGx1womKCeJTDHvmvMYwrKFiQJ1ZOEnoWGIqjyKyw4rzz2ltLDn5Rdh6cm2M4qRhjLEftXZ
	m+oLfO4ykfTNGt+mwv1JGZ5T1Zi5x5lYQmmRcl3pGhUl4/yp3NE/3HBwY3bj/ZOg7QA==
X-Gm-Gg: AYBFou1vUGXO4oUpDhqY3N6lpL4+tbMGh/arKPkoaj0Otio+HeNZ7j+4veFJwncOoBh
	OZha94QwpISXPeand0zutSzweYtuOh64sO4OSP59+UIKbX2CnvodqN7LCo9KKknXeV81/VXJza6
	mhI0w85DQ7INVxcFeF7Dp7kaOMK7wrS6xHgNY1mu55OChFmAkZusdfj0wj56iCufWm4iWSgGn/q
	c/cZFU9/MFiKNsg4O4K5BqKU+XLybEC0RRAxDiEOB/9DIuGfI85xNJPaScA/t8qgG/5qqw1wugO
	LXraCcu1how9Pz0W7uSjIuX9F+H2zCsRweM8xVa3eVn6ZpJGXJsDdltS9WXnxuwBpsN+I2iYGAn
	qekH92tHtXRYsaccmJBQ3AG7TlfxRNjTtCuntx0Si51qW8KHU+l17rGyxQj7LTPElMUawhH3ogV
	T5
X-Received: by 2002:a05:620a:1a0e:b0:93f:2ab9:72a0 with SMTP id af79cd13be357-9442172e3a8mr3096711685a.70.1793881492124;
        Thu, 05 Nov 2026 04:24:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a0e:b0:93f:2ab9:72a0 with SMTP id af79cd13be357-9442172e3a8mr3096707785a.70.1793881491600;
        Thu, 05 Nov 2026 04:24:51 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm61320965e9.8.2026.11.05.04.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:24:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
        Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        linux-hwmon@vger.kernel.org,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev,
        Yinbo Zhu <zhuyinbo@loongson.cn>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, Michael Buesch <m@bues.ch>,
        William Breathitt Gray <wbg@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
Date: Thu,  5 Nov 2026 13:24:47 +0100
Message-ID: <179388146665.22103.2916811858448928630.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec7594 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=k4E0auTuH4aaYxdkK-0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfX6n6/MYQlCG7D
 8qOReyGfoYkyXNbayd9achA1Kc35a9rQ4k9qp0B1cjML7TJC5W3rKYJml4Ww3uZsNeZ8REptipj
 9P3zKviIwARFIkFlMvaB8qsI6TIhj68Nt4V97gGZY3met7c8LUbFIUuuh98OvrZgsP0NlnPjWJE
 4O40CZhzr9y/ZEAli9qkp0NjTxhr4FrT8UmvHghNkhjH0E+Nx7Sm3ParJ0SWuKBCge1qJN/V/8S
 ktQnxSz7C+m41TokHfvNtcskT7gAbi4+t0EQeu7C7Qc9RTmFfyMt+74XBnf+IkFJDq4X58f+REv
 5pYVK8F/D+v4g63zoJVgKX+xhRrVeiTF/rbTn4SWDwaUvI4/BLWLRZUFmi84wsXTTlmt+b9yiBu
 XbWqxqR0+9iSSlLsVdHE0JeVT5yyn6ubGfAZ9IRjNju4S53fK/fv92RnRFx9YPT0otkkxbpMhGx
 NhR/YBcMYWKCCNMK8kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfXy7c8xxnOICnY
 1zf0qeaYTFIlJNkiBHW5osIO0bNGwffRjKFzYWZw7S5mOhZE7Npv+62D1XGaxF9uqkBePGjIO8v
 KKp6YC0ktbh9GVIhMHAwcl+LzlOUbp8=
X-Proofpoint-ORIG-GUID: UjcwvIxG3VpeH9sFCNzvnYO6pYw_P7gb
X-Proofpoint-GUID: UjcwvIxG3VpeH9sFCNzvnYO6pYw_P7gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050049


On Tue, 27 Oct 2026 11:48:37 +0100, Uwe Kleine-König (The Capable Hub) wrote:
> the original motivation for this series are the patches that convert the
> arrays to use named initializers, see
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> for the idea behind it. Looking left and right a bit while implementing
> that, the series grew a bit.
> 
> Changes since v3 (available at
> https://lore.kernel.org/all/cover.1793030820.git.u.kleine-koenig@baylibre.com):
> 
> [...]

Applied, thanks!

[01/23] gpio: Remove __maybe_unused annotations from acpi_device_id arrays
        https://git.kernel.org/brgl/c/c563f9a7ebdb8de36042b685c89b29a56bb4a2d8
[02/23] gpio: fxl6408: Remove __maybe_unused annotations from of_device_id array
        https://git.kernel.org/brgl/c/9ae231ac040cbdd9e24dda8a76e5b0a52195fca3
[03/23] gpio: Drop unused assignment of acpi_device_id driver data
        https://git.kernel.org/brgl/c/7a2dac6de054da359a0f986dc9b8fe7a1c2a97e4
[04/23] gpio: max7301: Drop unused assignment of spi_device_id driver data
        https://git.kernel.org/brgl/c/9d6f21a8154ebcf777d9836f2c804f65c4173b02
[05/23] gpio: mmio: Drop unused assignment of platform_device_id driver data
        https://git.kernel.org/brgl/c/9d14e246391f0caafcffa7fe5211b32d246fb327
[06/23] gpio: ljca: Drop unused assignment of auxiliary_device_id driver data
        https://git.kernel.org/brgl/c/526fd5a299da4e954a66124464fc272b9d6ec529
[07/23] gpio: xgene: Add missing ACPI module annotation
        https://git.kernel.org/brgl/c/c7b4f8ea5725363bb7209be26cd57428e534eb4c
[08/23] gpio: sodaville: Add missing PCI module annotations
        https://git.kernel.org/brgl/c/77e387153e2a871d1bd84fa170d1e0c2ba2cf78d
[09/23] gpio: Add missing OF module annotations
        https://git.kernel.org/brgl/c/93ff9d3beb2a20c7cc5a5d60e81de8ba8e770338
[10/23] gpio: pxa: Add missing platform module annotations
        https://git.kernel.org/brgl/c/1a93b8060780bc50b9348d28224986a3552f5d87
[11/23] gpio: pl061: Use empty initializer for amba_id terminator
        https://git.kernel.org/brgl/c/501a0376a582abee825d25fba42ab6f9f80433be
[12/23] gpio: Use named initializers for acpi_device_id array
        https://git.kernel.org/brgl/c/91f7e7fb10592850a7d9075e16aee5fbe83f1e9a
[13/23] gpio: Use named initializers for auxiliary_device_id arrays
        https://git.kernel.org/brgl/c/b3ef6bfd0e14450debf728225894b70a3379f514
[14/23] gpio: pcf857x: Use named initializers for of_device_id array
        https://git.kernel.org/brgl/c/5b2dcd61c2105f5b17591c3c44b10630d68001f7
[15/23] gpio: bd73800: Use named initializers for platform_device_id array
        https://git.kernel.org/brgl/c/92aa1d97bd10195df229851f4e008914a0e8445f
[16/23] gpio: Use named initializers for spi_device_id array
        https://git.kernel.org/brgl/c/7b86d1e3c33b95a85a5a3e6f72afdcc2ff717e0d
[17/23] gpio: virtio: Use a named initializer for virtio_device_id array
        https://git.kernel.org/brgl/c/7c01eb6861833cfb9d00673fbf8aef0b3e330dbe
[18/23] gpio: Unify style of acpi_device_id arrays
        https://git.kernel.org/brgl/c/6588211f4fe51a881ca56648dcc5a8fa1479d4e2
[19/23] gpio: Unify style of of_device_id arrays
        https://git.kernel.org/brgl/c/aee4187b00011bb65ee1aef578b1fceafae76fba
[20/23] gpio: max77620: Unify style of platform_device_id array
        https://git.kernel.org/brgl/c/1b454163287b3839bdfd219e3520456ce251bbe5
[21/23] gpio: Unify style of spi_device_id arrays
        https://git.kernel.org/brgl/c/17d6308e7d5a4d4f317c7f92cbca330bffcfc391
[22/23] gpio: Unify style of pci_device_id arrays
        https://git.kernel.org/brgl/c/aff8eccdb976f43298117b52a7bae6d13ca62554
[23/23] gpio: Unify style of various *_device_id arrays
        https://git.kernel.org/brgl/c/0fa38ba784896f2fc32c9dacd33822f844b21906

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
