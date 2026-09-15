Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86143AF647
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464547; cv=none; b=IKoV+XEdbirbt62e49LlvNTPCki6r+1qFVgzSJjObcSNJC9ytA+VnoVPmI1rh8/l8oTu2F/9spB/aWH2BijlMSBr9eXLeLq8eqjlz2F37b0Uslo+4HPMOIZUY96yb9do9uD4E2IxtlErGKuL81NH5Pxiv9Qh5rpPIfn8itq7yJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464547; c=relaxed/simple;
	bh=vWQtMyp87j9Ha9llCugJJq5zN1XmecNf27SupPSieNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X89x5W5zZNMAjyk9rDaFslaDy8YG84NdpKqnshonbiCEgpbyb7GZK88QByXF29ysWEp9BLR8s2MzzVP65h2JvM+M80kx4gR0TLHoH48VGyVRPEeYjrJm3VIABiJLozhUgXTc+56mHdvc25ETIEK8crshSHDxbA7lcOAqxthhyic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efn0Ba0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMPmCcAo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efn0Ba0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMPmCcAo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9GlqM3258396
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 09:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+kAMgubwvTeTdhpoS7fqfi1QF01vPTRr11UVCilXDU=; b=efn0Ba0kxOcA2NwR
	3VY9xp4DE4smGs4ZWe/ZJ/AUJU24BbNwa5KA9Hez06Y7Y9Pqg59Vc2kdWrfB+GwR
	SRIbVXDfyz8EkkEERpNR0bJX14lMrfKVwuYxSDHjBKyAgCQJKub0OGQAoI7eGPCr
	FTi52JXTU/Aa//DxDjgRJoE8RB38/9w1PNFhtZD+1J5TH5O9YZuv0tOJgApzIU0u
	L7thxy5aArP89g4M/HussbGDuJjyX0AeKvo3EyBgtpyBvzlargzVzvLGGcmLvVGH
	JfJ0Lblb7LOJOwYCB3CyzeHxXyKzgb7qGAT1BAj9MOgurRg0JQO0woAIbzhp87r5
	iJ2blQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e01kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 09:29:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e087a18deso698969a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464541; x=1790069341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+kAMgubwvTeTdhpoS7fqfi1QF01vPTRr11UVCilXDU=;
        b=NMPmCcAoSVrXKxorbJW6J9tyAY9Vu8zwcl+kwfG970BQDIvEF5NPyBGCcUL4NgDp2A
         z1vi0n8z5bN9iAD0bLJ6vlruGD8fwxGNoRndolOmXVPYCHRpbtUT0yHkMN/SsviyT6+f
         eQKF0GyXsdm4V8iq1wVLKImIoDcJSvOf1KoXfP/lRUzrerD7UNqAYeTTucxmbCKoOrZ2
         sUmXpbuaVBIJCt/R/ALt89c6P6WMXkkL/Urri60js7ZrNCnINgdDfBzeY1CP+dGocoZ5
         IRg0QlpY6w/NhcUzZxG9lc7gMVhtCCkrxpPj7+j330Evh/8AxJTge5TF37Eu4IQcBw63
         uztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464541; x=1790069341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+kAMgubwvTeTdhpoS7fqfi1QF01vPTRr11UVCilXDU=;
        b=DUs+a891FhBro1adcQDSC2zHRGo4t+UD7OtuTmmgubacup1obEfKWHbVY6/k5ko7+q
         0AHKc/eNsuQ6JYaabPDb3WIuury5gU3rq2W8kKOctmzWrbPduQPeYxCb+80/XUDDmccA
         Lh9BsUQ6bO8vsce83EjCRVLRxz/Q+8lQOE8QH9u5x8qWKTDlIsY/bH6c03CwJlXQXClr
         k7jWldn0jmKoWMyaVj7wWrBMgplUKWvC/kxPVPI6Yp3WVLqqUQXMeFACAL2IdEU7XFji
         zQR+0l6iWWaDVBxOv1ZH4DSXMQgNCy8OlB611MNAzqYmArd2oTIXPh7KtPlss636fxFM
         T+6g==
X-Forwarded-Encrypted: i=1; AKwUvBwrtCT+mZ28OkhMFFUOcg70p0CTXE/PASyxcnKNt+98ils8yfUB7FEILLCKf9h8xSmhLEVGJmBkyDRUsQ==@vger.kernel.org
X-Gm-Message-State: AFuF++neDDSz4HoY4giXKSu1BPx0I5h94rIgo1HqWXotW281bpHMUXlJ
	S3RFFQWqTIwobvHeSjZt3SzqivBiIrO8COaJ5nuqmXqO01kg0NAbVVYAQ/wYqAd6nj/bVGN5AtW
	s28TMy6FbqpfJyVpj6ip4BaAEXP3dI41hXIJIy3fgPhxp9rhknGqUcXqhpc+fktrb5FqyIbsCDQ
	==
X-Gm-Gg: AYBFou0civiL2rxe5X8m6uuHeF8TpQnYfNM3dloHXDCL0kF5Rm792C/ly3/3VPM6XHr
	C4N5RChbW1q9ROe54ddVwVLyJwm57si+Arwdzoo0CDUW4NFQpjX9f5eKkZP1GLvc4H9utpM9ak1
	BonyS7od5bthf6QvsJk4TRphVWssbzzshlu7VBr/BX69/GqsFuX3BkEt4neYXVTG0fQm1nLBUvv
	a8/KkObahAkcg+cC7by2kcp/kwPqppOcvy3d3lyAh3EXXgkaUCwF4reyChsTgEIlQxvGgNsLAOO
	qAHA/7V/yd7WFZn4dchRzQP2QbRYqXalfm9xTKd9RYqQrLHXOg9ySen9H+BI17+mYZel8zcT2sd
	D+DjFsK7zCLSojHorfQz29tE=
X-Received: by 2002:a17:90b:5865:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e04332517mr3852876a91.5.1789464540614;
        Tue, 15 Sep 2026 02:29:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e04332517mr3852771a91.5.1789464539348;
        Tue, 15 Sep 2026 02:28:59 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.86.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm32526381eec.14.2026.09.15.02.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:28:58 -0700 (PDT)
Message-ID: <7bfe0e0d-3fd4-4955-8b26-9feb1a8aef98@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:58:52 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim
 7x legacy sensors
To: Birk Skyum <birk.skyum@pm.me>, Sibi Sankar
 <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Daniel J Blueman <daniel@quora.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908135801.81436-1-birk.skyum@pm.me>
 <20260908135801.81436-2-birk.skyum@pm.me>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260908135801.81436-2-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eYEUlSHsJ1NVlPEpqfXSkplxQ11nuYg-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNiBTYWx0ZWRfXwV/WdfXR/3Vb
 mkzeTV5gGsmLtm2i8g4VPuQC4pvA+PbZAOgoNc6hyOSNFvXzKWZthFNrJTW4e4URiXVaJhqFF5Z
 IrmeNtH1aGgTw3wqdQ1lc5o1SaA9lcI=
X-Proofpoint-ORIG-GUID: eYEUlSHsJ1NVlPEpqfXSkplxQ11nuYg-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNiBTYWx0ZWRfXyD9DyZhSwiu/
 CEgKiXCNoBPvHwLn5aTxFVZIJiWtCFgKusEKv07Tamnip8tH7PhtgJBZ31vOUo6SBJiu1Njn9W3
 9N1jaEru5/O6lUx2D3SGK7gP0AKvMwsWt2wOhFQb53d59pkZha6kQlMcH9XkghLMJP5c/Gn0JUM
 UC3/TMhTk6ux4w+7kdfyf4uun/z/RXj8y9WBaZg3xPfynPqxXcFp1+HYHK48WbUZ3OouZJpN27j
 H9hbLAeXWl0sToPmRMXzx16I9BFj4fmhpWgCIjh9eiIeZ8fZ4VTuzVpUGvJWFNSRVMybqW7VNvc
 I1Q+1Pza02Mqz6/PtIFwNgeZXmla3+hlaYy2WVBNk3NyzY5E4UzxVnNsjWj7EFeOrbgVaeUc4YU
 ngVPsGUr9+G2YDDSsiqC4EHdec5N717oOMSul7HHk7DjLItTU5ab0u7FIWhfIUnklpcAaaSATyQ
 ZXkwUPHHP2RTX8mZAvg==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa90fdd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=YsbRjcmUuq6dkflYeO58cw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dfw2BTyuAAAA:20 a=IA0wh2spAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=BybPU-h1rPuJRbRll4sA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150136



On 9/8/2026 7:28 PM, Birk Skyum wrote:
> The Yoga Slim 7x EC returns an all-zero response to the reference-board
> thermal capability command. Probe fails even though its legacy RPM and
> thermistor queries work and firmware controls the fan automatically.
> 
> Select a read-only path for the Lenovo compatible. Expose its first RPM
> channel and thermistor through hwmon, validating the transfer length and
> RPM payload count and treating the thermistor's 0xff sentinel as ENODATA.
> Do not enable SCI, register manual cooling controls or send standby
> commands on this path. Keep the reference-board behavior and strict
> capability validation unchanged.
> 
> The transactions are documented by the Yoga's FC22 and FC29/TZ39 DSDT
> methods and Maya Matuszczyk's EC protocol notes. Anvesh Jain P's pending
> fan-profile series also documents the RPM query. This change does not
> include its calibration, LUT programming or temperature reporting.
> 
> Link: https://github.com/aarch64-laptops/build/blob/2e58842f5fa2f87771c2df017ae4d8c65225ef10/misc/lenovo-yoga-slim-7x/acpi/dsdt.dsl
> Link: https://lkml.iu.edu/hypermail/linux/kernel/2607.3/08806.html
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
> Changes in v2:
> - Move the platform-driver documentation to the laptop-driver guide and
>   update its index and MAINTAINERS entry, following Guenter's review.
> - No driver code changes.
> 
>  Documentation/admin-guide/laptops/index.rst   |   1 +
>  Documentation/admin-guide/laptops/qcom-ec.rst |  40 +++++
>  MAINTAINERS                                   |   1 +
>  drivers/platform/arm64/Kconfig                |   4 +-
>  drivers/platform/arm64/qcom-hamoa-ec.c        | 153 +++++++++++++++++-
>  5 files changed, 194 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/admin-guide/laptops/qcom-ec.rst
> 
> diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/admin-guide/laptops/index.rst
> index c0b911d05..44c9c7c08 100644
> --- a/Documentation/admin-guide/laptops/index.rst
> +++ b/Documentation/admin-guide/laptops/index.rst
> @@ -11,6 +11,7 @@ Laptop Drivers
>     asus-laptop
>     disk-shock-protection
>     lg-laptop
> +   qcom-ec
>     samsung-galaxybook
>     sony-laptop
>     sonypi
> diff --git a/Documentation/admin-guide/laptops/qcom-ec.rst b/Documentation/admin-guide/laptops/qcom-ec.rst
> new file mode 100644
> index 000000000..11f9f2347
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/qcom-ec.rst
> @@ -0,0 +1,40 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver qcom-hamoa-ec
> +==========================
> +
> +Supported systems:
> +
> +  * Lenovo Yoga Slim 7x (14Q8X9)
> +
> +    Prefix: 'qcom_ec'
> +
> +    I2C address: 0x76, instantiated from the device tree. No scanning.
> +
> +Description
> +-----------
> +
> +The Yoga Slim 7x embedded controller provides a fan speed channel and a
> +thermistor through a legacy interface. It does not provide the thermal
> +capability response used by the Qualcomm reference-board interface.
> +
> +On this system the driver only reads sensors. Cooling remains under firmware
> +control, including when the driver is unloaded. The driver does not change
> +fan curves, fan profiles, PWM settings, SCI events or EC standby state.
> +The exposed RPM channel does not establish the number of physical fans.
> +
> +The hwmon interface is selected by the ``lenovo,yoga-slim7x-ec`` compatible.
> +It is not exposed on Qualcomm reference boards by this driver.
> +
> +Sysfs attributes
> +----------------
> +
> +All attributes below are read-only.
> +
> +=============== ======================================================
> +fan1_input      Fan speed in RPM. Zero is valid when the fan is stopped.
> +temp1_input     EC thermistor temperature in millidegrees Celsius.
> +=============== ======================================================
> +
> +An unavailable thermistor reading returns ``ENODATA``. A malformed fan
> +response or an incomplete bus transfer returns an error, not a zero speed.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6215fcb07..c3c208602 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22440,6 +22440,7 @@ M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>  M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/admin-guide/laptops/qcom-ec.rst
>  F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>  F:	drivers/platform/arm64/qcom-hamoa-ec.c
>  
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index e32e01b2a..4f338c715 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -94,6 +94,7 @@ config EC_QCOM_HAMOA
>  	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on I2C
> +	depends on HWMON
>  	depends on THERMAL || THERMAL=n
>  	help
>  	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
> @@ -101,6 +102,7 @@ config EC_QCOM_HAMOA
>  	  control, temperature sensors, access to EC state changes and supports
>  	  reporting suspend entry/exit to the EC.
>  
> -	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
> +	  This driver supports Hamoa/Purwa/Glymur reference devices and read-only
> +	  fan speed and temperature monitoring on the Lenovo Yoga Slim 7x.
>  
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 4d2ad042a..3a4ca8a0d 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -9,6 +9,7 @@
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> +#include <linux/hwmon.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> @@ -16,10 +17,13 @@
>  #include <linux/pm.h>
>  #include <linux/slab.h>
>  #include <linux/thermal.h>
> +#include <linux/unaligned.h>
>  
>  #define EC_SCI_EVT_READ_CMD	0x05
>  #define EC_FW_VERSION_CMD	0x0e
> +#define EC_FAN_RPM_QUERY_CMD	0x22
>  #define EC_MODERN_STANDBY_CMD	0x23
> +#define EC_THERMISTOR1_CMD	0x29
>  #define EC_FAN_DBG_CONTROL_CMD	0x30
>  #define EC_SCI_EVT_CONTROL_CMD	0x35
>  #define EC_THERMAL_CAP_CMD	0x42
> @@ -76,13 +80,126 @@ struct qcom_ec_cooling_dev {
>  	u8 state;
>  };
>  
> +struct qcom_ec_variant {
> +	bool monitor_only;
> +};
> +
>  struct qcom_ec {
> +	const struct qcom_ec_variant *variant;
>  	struct qcom_ec_cooling_dev *ec_cdev;
>  	struct qcom_ec_thermal_cap thermal_cap;
>  	struct qcom_ec_version version;
>  	struct i2c_client *client;
>  };
>  
> +/* FC22 in the Slim 7x DSDT: command, fan ID; count, little-endian RPM. */
> +static int qcom_ec_read_fan_rpm(struct qcom_ec *ec, long *val)
> +{
> +	struct i2c_client *client = ec->client;
> +	u8 request[] = { EC_FAN_RPM_QUERY_CMD, 1 };
> +	u8 response[3];
> +	struct i2c_msg messages[] = {
> +		{
> +			.addr = client->addr,
> +			.len = sizeof(request),
> +			.buf = request,
> +		}, {
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(response),
> +			.buf = response,
> +		},
> +	};
> +	int ret;
> +
> +	ret = i2c_transfer(client->adapter, messages, ARRAY_SIZE(messages));
> +	if (ret < 0)
> +		return ret;
> +	if (ret != ARRAY_SIZE(messages))
> +		return -EIO;
> +	if (response[0] != sizeof(response) - 1)
> +		return -EPROTO;
> +
> +	*val = get_unaligned_le16(&response[1]);
> +
> +	return 0;
> +}
> +
> +static umode_t qcom_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> +					u32 attr, int channel)
> +{
> +	if (channel)
> +		return 0;
> +	if ((type == hwmon_fan && attr == hwmon_fan_input) ||
> +	    (type == hwmon_temp && attr == hwmon_temp_input))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static int qcom_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct qcom_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (channel)
> +		return -EOPNOTSUPP;
> +
> +	if (type == hwmon_fan && attr == hwmon_fan_input)
> +		return qcom_ec_read_fan_rpm(ec, val);
> +
> +	if (type != hwmon_temp || attr != hwmon_temp_input)
> +		return -EOPNOTSUPP;
> +
> +	/* FC29/TZ39 report degrees Celsius, or 0xff if unavailable. */
> +	ret = i2c_smbus_read_byte_data(ec->client, EC_THERMISTOR1_CMD);

For the thermistor, it may be better to expose it as a thermal sensor
and create a thermal zone instead of exposing it as a hwmon temperature
attribute. The fan RPM can remain under hwmon.

> +	if (ret < 0)
> +		return ret;
> +	if (ret == 0xff)
> +		return -ENODATA;
> +
> +	*val = ret * 1000;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops qcom_ec_hwmon_ops = {
> +	.is_visible = qcom_ec_hwmon_is_visible,
> +	.read = qcom_ec_hwmon_read,
> +};
> +
> +static const struct hwmon_channel_info * const qcom_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL,
> +};
> +
> +static const struct hwmon_chip_info qcom_ec_hwmon_chip_info = {
> +	.ops = &qcom_ec_hwmon_ops,
> +	.info = qcom_ec_hwmon_info,
> +};
> +
> +static int qcom_ec_hwmon_probe(struct qcom_ec *ec)
> +{
> +	struct device *dev = &ec->client->dev;
> +	struct device *hwmon;
> +	long rpm;
> +	int ret;
> +
> +	if (!i2c_check_functionality(ec->client->adapter,
> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_READ_BYTE_DATA))
> +		return -EOPNOTSUPP;
> +
> +	ret = qcom_ec_read_fan_rpm(ec, &rpm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read fan RPM\n");
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "qcom_ec", ec,
> +						     &qcom_ec_hwmon_chip_info, NULL);
> +	return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
>  static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>  {
>  	int ret;
> @@ -331,6 +448,10 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
>  static int qcom_ec_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +
> +	if (ec->variant->monitor_only)
> +		return 0;
>  
>  	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>  					 EC_MODERN_STANDBY_EXIT);
> @@ -339,6 +460,10 @@ static int qcom_ec_resume(struct device *dev)
>  static int qcom_ec_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +
> +	if (ec->variant->monitor_only)
> +		return 0;
>  
>  	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>  					 EC_MODERN_STANDBY_ENTER);
> @@ -356,14 +481,24 @@ static int qcom_ec_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	ec->client = client;
> +	ec->variant = i2c_get_match_data(client);
> +	if (!ec->variant)
> +		return -ENODEV;
> +	i2c_set_clientdata(client, ec);
> +
> +	/*
> +	 * The Slim 7x does not implement the reference-board capability command.
> +	 * Its firmware controls cooling autonomously. Only expose its legacy
> +	 * sensors; do not enable SCI, fan debug control or standby notifications.
> +	 */
> +	if (ec->variant->monitor_only)
> +		return qcom_ec_hwmon_probe(ec);
>  
>  	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
>  					IRQF_ONESHOT, "qcom_ec", ec);
>  	if (ret < 0)
>  		return ret;
>  
> -	i2c_set_clientdata(client, ec);
> -
>  	ret = qcom_ec_read_fw_version(dev);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
> @@ -410,6 +545,9 @@ static void qcom_ec_remove(struct i2c_client *client)
>  	struct device *dev = &client->dev;
>  	int ret;
>  
> +	if (ec->variant->monitor_only)
> +		return;
> +
>  	ret = qcom_ec_sci_evt_control(dev, false);
>  	if (ret < 0)
>  		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
> @@ -421,14 +559,21 @@ static void qcom_ec_remove(struct i2c_client *client)
>  	}
>  }
>  
> +static const struct qcom_ec_variant qcom_ec_reference = {};
> +
> +static const struct qcom_ec_variant qcom_ec_slim7x = {
> +	.monitor_only = true,
> +};
> +
>  static const struct of_device_id qcom_ec_of_match[] = {
> -	{ .compatible = "qcom,hamoa-crd-ec" },
> +	{ .compatible = "lenovo,yoga-slim7x-ec", .data = &qcom_ec_slim7x },
> +	{ .compatible = "qcom,hamoa-crd-ec", .data = &qcom_ec_reference },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
>  
>  static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
> -	{ "qcom-hamoa-ec", },
> +	{ "qcom-hamoa-ec", (kernel_ulong_t)&qcom_ec_reference },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);

-- 
Best Regards,
Anvesh

