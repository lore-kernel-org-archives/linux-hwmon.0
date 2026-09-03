Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85449CF24;
	Thu,  3 Sep 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440172; cv=none; b=Avz1VXXT0XBoComeY/Z9Pk4bQAm8gyIsEUSqYlaqPZ59X9B6HUIG0a/m16N94zx88eKgRr6S3n+nX6I1+pOSyDA7jHMzKXEI1AzPYxTI8v+QZEl1+KCcvuRifTozJifVLNmuAXBBJGYpVBVu6/5qriOPejLfyKYU5COuivIyOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440172; c=relaxed/simple;
	bh=ipSLO2XbXUIHbamkefG624xhFVMemxrJePevsZE9eGk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iIVrYqGVOVOCCzusTtzL/eOscBVALOFUPdm+HA0B8sXQMPQexHsyqRjKQ9KH0o2SCYEw1/rYqazKxxOL2Lw3ODe2jNq+kyu5sm/cfryGvQzLfzO1nzvd+BSt1gWrMogArwjgS3XSFMVlH4cr5/LU7DlmfZNiBTLw8E+rqVcPvqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENtR/oHa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENtR/oHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788440170; x=1819976170;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ipSLO2XbXUIHbamkefG624xhFVMemxrJePevsZE9eGk=;
  b=ENtR/oHaZ+5d0iNGA/myQG6/Tj/JBIBEHbN16kbOAhC1FEnYEc72DUgp
   xc3EdN14tFZhGUAO/gZGETsL0cbYKOJymoO4VaurmhJtOJ1fm1Ubkb16W
   xEI3JEyCJGfCtd4zr7Oz/RoV8wHgTNR6ruUbPeP4l98rGcFB8s1U+O3cQ
   ai3UQfcjaQKN+YHOXsqxITYaeAsVfb2bTRPBOacvSZ47AQ/qewtkvDItS
   MKQE55xtajLQH/jYzTXuDuF5yvXF3TRPfl3Bcp8tGrBTm/eb6iCMpolgs
   kOCDD23hx+JXtzKC+ZztkVEdMyuzpG7ZF0zOB07KOSkP0Ylp2VsH8JVOz
   w==;
X-CSE-ConnectionGUID: bGXpcMwGQ9iRrhhHkL7HTA==
X-CSE-MsgGUID: Jj/WX1DhTimz3FhcIio6eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100435012"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100435012"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:56:09 -0700
X-CSE-ConnectionGUID: xD9F0zU/QSa8XSTIp130Kw==
X-CSE-MsgGUID: TVJxToJwQvOTsEFVBAEn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="266483690"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.119])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:56:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Sep 2026 15:55:59 +0300 (EEST)
To: Xilin Wu <sophon@radxa.com>
cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-hwmon@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform: arm64: Add Radxa SVC GLINK driver
In-Reply-To: <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Message-ID: <135c74d2-5f66-83ac-4ffe-a214c735ccec@linux.intel.com>
References: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com> <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Aug 2026, Xilin Wu wrote:

> Add an rpmsg client for the RADXA_SVC_ADSP_APPS firmware service used
> on supported Radxa boards with Qualcomm SoCs.
> 
> Expose fan control through the standard hwmon pwm1 and pwm1_enable
> attributes. SET_PROFILE only changes the fan curve, so map its quiet and
> performance curves to automatic modes instead of platform_profile.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  Documentation/hwmon/index.rst            |   1 +
>  Documentation/hwmon/radxa-svc-glink.rst  |  32 ++
>  MAINTAINERS                              |   8 +
>  drivers/platform/arm64/Kconfig           |  13 +
>  drivers/platform/arm64/Makefile          |   1 +
>  drivers/platform/arm64/radxa_svc_glink.c | 735 +++++++++++++++++++++++++++++++
>  6 files changed, 790 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9955a525436a..08a2062b4f84 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -234,6 +234,7 @@ Hardware Monitoring Kernel Drivers
>     pwm-fan
>     q54sj108a2
>     qnap-mcu-hwmon
> +   radxa-svc-glink
>     raspberrypi-hwmon
>     sbrmi
>     sbtsi_temp
> diff --git a/Documentation/hwmon/radxa-svc-glink.rst b/Documentation/hwmon/radxa-svc-glink.rst
> new file mode 100644
> index 000000000000..c464b130a4e4
> --- /dev/null
> +++ b/Documentation/hwmon/radxa-svc-glink.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver radxa-svc-glink
> +=============================
> +
> +Description
> +-----------
> +
> +The Radxa SVC GLINK driver communicates with the ``RADXA_SVC_ADSP_APPS``
> +firmware service found on supported Radxa boards with Qualcomm SoCs. The
> +firmware provides fan control.
> +
> +Fan control
> +-----------
> +
> +The fan controller provides the following attributes:
> +
> +=============== ======= ======================================================
> +``pwm1``        RW      Current fan PWM value. Writes are accepted in manual
> +                        mode and use values from 0 to 255.
> +``pwm1_enable`` RW      Fan control mode, as described below.
> +=============== ======= ======================================================
> +
> +The supported ``pwm1_enable`` values are:
> +
> +  - 0: fan at full speed
> +  - 1: manual control using ``pwm1``
> +  - 2: automatic control using the quiet curve
> +  - 3: automatic control using the performance curve
> +
> +When manual mode is selected, the driver starts with the current fan speed. If
> +the current speed cannot be determined, it starts at full speed.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..9e4685759194 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22719,6 +22719,14 @@ F:	Documentation/ABI/testing/sysfs-bus-rbd
>  F:	drivers/block/rbd.c
>  F:	drivers/block/rbd_types.h
>  
> +RADXA SVC GLINK DRIVER
> +M:	Xilin Wu <sophon@radxa.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/radxa-svc-glink.rst
> +F:	drivers/platform/arm64/radxa_svc_glink.c
> +
>  RAGE128 FRAMEBUFFER DISPLAY DRIVER
>  L:	linux-fbdev@vger.kernel.org
>  S:	Orphan
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index e32e01b2a9bd..60c1e541fe89 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -103,4 +103,17 @@ config EC_QCOM_HAMOA
>  
>  	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>  
> +config RADXA_SVC_GLINK
> +	tristate "Radxa SVC GLINK driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on RPMSG
> +	depends on HWMON
> +	help
> +	  Enable support for the Radxa SVC firmware service found on supported
> +	  Radxa boards using Qualcomm SoCs. The driver communicates with the
> +	  RADXA_SVC_ADSP_APPS service over rpmsg and exposes fan control through
> +	  the standard hwmon interface.
> +
> +	  Say M or Y here to include this support.
> +
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 7681be4a46e9..327acb7b983c 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>  obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
> +obj-$(CONFIG_RADXA_SVC_GLINK)	+= radxa_svc_glink.o
> diff --git a/drivers/platform/arm64/radxa_svc_glink.c b/drivers/platform/arm64/radxa_svc_glink.c
> new file mode 100644
> index 000000000000..1c91bfabcd12
> --- /dev/null
> +++ b/drivers/platform/arm64/radxa_svc_glink.c
> @@ -0,0 +1,735 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Radxa SVC GLINK driver.
> + *
> + * Copyright (c) 2026 Radxa Computer (Shenzhen) Co., Ltd.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/rpmsg.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +
> +#define RADXA_SVC_MAGIC		0x58444152 /* "RADX" */
> +#define RADXA_SVC_VERSION	1
> +#define RADXA_SVC_TIMEOUT	msecs_to_jiffies(5000)
> +
> +#define RADXA_SVC_MAX_TX_PAYLOAD	64
> +#define RADXA_SVC_MAX_RX_PAYLOAD	2048
> +
> +#define RADXA_SVC_OP_GET_VERSION	0x02
> +#define RADXA_SVC_OP_SET_PROFILE	0x10
> +#define RADXA_SVC_OP_GET_PROFILE	0x11
> +#define RADXA_SVC_OP_FAN_GET_STATE	0x50
> +#define RADXA_SVC_OP_FAN_SET_CONTROL	0x51
> +#define RADXA_SVC_OP_FAN_GET_CONTROL	0x52
> +
> +#define RADXA_SVC_PROFILE_QUIET		0
> +#define RADXA_SVC_PROFILE_PERFORMANCE	1
> +
> +#define RADXA_SVC_FAN_CONTROL_FULL_SPEED	0
> +#define RADXA_SVC_FAN_CONTROL_MANUAL		1
> +#define RADXA_SVC_FAN_CONTROL_AUTO		2
> +#define RADXA_SVC_FAN_PWM_MAX			255
> +
> +#define RADXA_SVC_PWM_MODE_FULL_SPEED		0
> +#define RADXA_SVC_PWM_MODE_MANUAL		1
> +#define RADXA_SVC_PWM_MODE_AUTO_QUIET		2
> +#define RADXA_SVC_PWM_MODE_AUTO_PERFORMANCE	3
> +
> +#define RADXA_SVC_CAP_PROFILE		BIT(1)
> +#define RADXA_SVC_CAP_FANCTL		BIT(5)
> +#define RADXA_SVC_CAP_FANCTL_CTRL	BIT(6)

Add include for linux/bits.h.

> +
> +#define RADXA_SVC_REQUIRED_CAPS		(RADXA_SVC_CAP_PROFILE | \
> +					 RADXA_SVC_CAP_FANCTL | \
> +					 RADXA_SVC_CAP_FANCTL_CTRL)
> +
> +struct radxa_svc_hdr {
> +	__le32 magic;
> +	__le16 version;
> +	__le16 header_size;
> +	__le32 opcode;
> +	__le32 seq;
> +	__le32 status;
> +	__le32 payload_len;
> +} __packed;

Please add linux/types.h and include for __packed.

> +
> +struct radxa_svc_version_resp {
> +	__le16 major;
> +	__le16 minor;
> +	__le32 caps;
> +} __packed;
> +
> +struct radxa_svc_fan_state_resp {
> +	__le32 profile;
> +	__le32 running;
> +	__le32 emergency;
> +	__le32 cpu_valid;
> +	__le32 cpu_stale_ticks;
> +	__le32 cpu_temp_deci_c;
> +	__le32 gpu_valid;
> +	__le32 gpu_stale_ticks;
> +	__le32 gpu_temp_deci_c;
> +	__le32 current_duty_ns;
> +	__le32 target_duty_ns;
> +	__le32 pwm_channel;
> +	__le32 pwm_period_ns;
> +	__le32 loop_count;
> +	__le32 fault_count;
> +	__le32 last_status;
> +	__le32 control_mode;
> +	__le32 manual_pwm;
> +} __packed;
> +
> +struct radxa_svc_fan_control_req {
> +	__le32 control_mode;
> +	__le32 manual_pwm;
> +} __packed;
> +
> +struct radxa_svc_fan_control_resp {
> +	__le32 control_mode;
> +	__le32 manual_pwm;
> +} __packed;
> +
> +struct radxa_svc_glink {
> +	struct device *dev;
> +	struct rpmsg_device *rpdev;
> +	struct device *hwmon_dev;
> +
> +	struct mutex xfer_lock; /* serializes request/response transactions */
> +	struct mutex fan_lock; /* serializes multi-request fan configuration */
> +	spinlock_t rsp_lock;
> +	struct completion rsp;
> +	bool pending;
> +	bool shutting_down;
> +	u32 pending_seq;
> +	u32 seq;
> +
> +	u32 rsp_opcode;
> +	int rsp_status;
> +	size_t rsp_len;
> +	u8 rsp_payload[RADXA_SVC_MAX_RX_PAYLOAD];
> +	u32 caps;
> +};
> +
> +static int radxa_svc_request(struct radxa_svc_glink *svc, u32 opcode,
> +			     const void *req_payload, size_t req_len,
> +			     void *rsp_payload, size_t *rsp_len);
> +
> +static int radxa_svc_get_version(struct radxa_svc_glink *svc,
> +				 struct radxa_svc_version_resp *resp)
> +{
> +	size_t len = sizeof(*resp);
> +	int ret;
> +
> +	ret = radxa_svc_request(svc, RADXA_SVC_OP_GET_VERSION, NULL, 0,
> +				resp, &len);
> +	if (ret)
> +		return ret;
> +
> +	if (len < sizeof(*resp))

Remove the empty line as this too is error handling for the call.

> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int radxa_svc_check_version(struct device *dev,
> +				   const struct radxa_svc_version_resp *resp,
> +				   u32 *caps)
> +{
> +	u32 missing_caps;
> +	u16 major;
> +
> +	major = le16_to_cpu(resp->major);
> +	*caps = le32_to_cpu(resp->caps);

Add include.

> +
> +	if (major != RADXA_SVC_VERSION)
> +		return dev_err_probe(dev, -EPROTONOSUPPORT,
> +				     "unsupported service major version %u\n",
> +				     major);

Add braces to blocks with multi-line constructs.

Add include for dev_err_probe().

> +
> +	missing_caps = RADXA_SVC_REQUIRED_CAPS & ~*caps;
> +	if (missing_caps)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "service missing required caps 0x%08x\n",
> +				     missing_caps);
> +
> +	return 0;
> +}
> +
> +static int radxa_svc_get_profile(struct radxa_svc_glink *svc, u32 *profile)
> +{
> +	__le32 resp;
> +	size_t len = sizeof(resp);
> +	int ret;
> +
> +	ret = radxa_svc_request(svc, RADXA_SVC_OP_GET_PROFILE, NULL, 0,
> +				&resp, &len);
> +	if (ret)
> +		return ret;
> +
> +	if (len < sizeof(resp))
> +		return -EIO;
> +
> +	*profile = le32_to_cpu(resp);
> +
> +	return 0;
> +}
> +
> +static int radxa_svc_set_profile(struct radxa_svc_glink *svc, u32 profile)
> +{
> +	__le32 payload;
> +
> +	switch (profile) {
> +	case RADXA_SVC_PROFILE_QUIET:
> +	case RADXA_SVC_PROFILE_PERFORMANCE:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	payload = cpu_to_le32(profile);
> +
> +	return radxa_svc_request(svc, RADXA_SVC_OP_SET_PROFILE, &payload,
> +				 sizeof(payload), NULL, NULL);
> +}
> +
> +static int radxa_svc_fan_get_state(struct radxa_svc_glink *svc,
> +				   struct radxa_svc_fan_state_resp *resp)
> +{
> +	size_t len = sizeof(*resp);
> +	size_t base_len = offsetof(struct radxa_svc_fan_state_resp,
> +				   control_mode);
> +	int ret;
> +
> +	ret = radxa_svc_request(svc, RADXA_SVC_OP_FAN_GET_STATE, NULL, 0,
> +				resp, &len);
> +	if (ret)
> +		return ret;
> +
> +	if (len < base_len)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int radxa_svc_fan_get_control(struct radxa_svc_glink *svc,
> +				     struct radxa_svc_fan_control_resp *resp)
> +{
> +	size_t len = sizeof(*resp);
> +	u32 control_mode;
> +	u32 manual_pwm;
> +	int ret;
> +
> +	ret = radxa_svc_request(svc, RADXA_SVC_OP_FAN_GET_CONTROL, NULL, 0,
> +				resp, &len);
> +	if (ret)
> +		return ret;
> +
> +	if (len < sizeof(*resp))
> +		return -EIO;
> +
> +	control_mode = le32_to_cpu(resp->control_mode);
> +	manual_pwm = le32_to_cpu(resp->manual_pwm);
> +	if (control_mode > RADXA_SVC_FAN_CONTROL_AUTO ||
> +	    manual_pwm > RADXA_SVC_FAN_PWM_MAX)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int radxa_svc_fan_set_control(struct radxa_svc_glink *svc,
> +				     u32 control_mode, u32 manual_pwm)
> +{
> +	struct radxa_svc_fan_control_req req;
> +
> +	if (control_mode > RADXA_SVC_FAN_CONTROL_AUTO ||
> +	    manual_pwm > RADXA_SVC_FAN_PWM_MAX)
> +		return -EINVAL;
> +
> +	req.control_mode = cpu_to_le32(control_mode);
> +	req.manual_pwm = cpu_to_le32(manual_pwm);
> +
> +	return radxa_svc_request(svc, RADXA_SVC_OP_FAN_SET_CONTROL, &req,
> +				 sizeof(req), NULL, NULL);
> +}
> +
> +static int radxa_svc_fan_duty_to_pwm(u32 period_ns, u32 duty_ns, u32 *value)
> +{
> +	u64 pwm;
> +
> +	if (!period_ns)
> +		return -ENODATA;
> +
> +	if (duty_ns > period_ns)
> +		return -EPROTO;
> +
> +	pwm = (u64)(period_ns - duty_ns) * RADXA_SVC_FAN_PWM_MAX;
> +	*value = min_t(u64, DIV_ROUND_CLOSEST_ULL(pwm, period_ns),

Add include for DIV_ROUND_CLOSEST_ULL()

> +		       RADXA_SVC_FAN_PWM_MAX);
> +
> +	return 0;
> +}
> +
> +static int radxa_svc_request(struct radxa_svc_glink *svc, u32 opcode,
> +			     const void *req_payload, size_t req_len,
> +			     void *rsp_payload, size_t *rsp_len)
> +{
> +	struct radxa_svc_hdr *hdr;
> +	unsigned long flags;
> +	size_t tx_len;
> +	u32 seq;
> +	u8 *tx_buf;
> +	int ret;
> +
> +	if (req_len > RADXA_SVC_MAX_TX_PAYLOAD)
> +		return -EMSGSIZE;
> +
> +	tx_len = sizeof(*hdr) + req_len;
> +	tx_buf = kzalloc(tx_len, GFP_KERNEL);
> +	if (!tx_buf)
> +		return -ENOMEM;
> +
> +	mutex_lock(&svc->xfer_lock);
> +
> +	if (!svc->rpdev || !svc->rpdev->ept) {
> +		ret = -ENODEV;
> +		goto out_unlock;
> +	}
> +
> +	seq = ++svc->seq;
> +	if (!seq)
> +		seq = ++svc->seq;
> +
> +	hdr = (struct radxa_svc_hdr *)tx_buf;
> +	hdr->magic = cpu_to_le32(RADXA_SVC_MAGIC);
> +	hdr->version = cpu_to_le16(RADXA_SVC_VERSION);
> +	hdr->header_size = cpu_to_le16(sizeof(*hdr));
> +	hdr->opcode = cpu_to_le32(opcode);
> +	hdr->seq = cpu_to_le32(seq);
> +	hdr->status = cpu_to_le32(0);
> +	hdr->payload_len = cpu_to_le32(req_len);
> +
> +	if (req_len)
> +		memcpy(tx_buf + sizeof(*hdr), req_payload, req_len);
> +
> +	reinit_completion(&svc->rsp);
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);
> +	if (svc->shutting_down) {
> +		spin_unlock_irqrestore(&svc->rsp_lock, flags);
> +		ret = -ENODEV;
> +		goto out_unlock;
> +	}
> +
> +	svc->pending = true;
> +	svc->pending_seq = seq;
> +	svc->rsp_opcode = 0;
> +	svc->rsp_status = 0;
> +	svc->rsp_len = 0;
> +	spin_unlock_irqrestore(&svc->rsp_lock, flags);
> +
> +	ret = rpmsg_send(svc->rpdev->ept, tx_buf, tx_len);
> +	if (ret) {
> +		spin_lock_irqsave(&svc->rsp_lock, flags);
> +		svc->pending = false;
> +		spin_unlock_irqrestore(&svc->rsp_lock, flags);
> +		goto out_unlock;
> +	}
> +
> +	if (!wait_for_completion_timeout(&svc->rsp, RADXA_SVC_TIMEOUT)) {
> +		spin_lock_irqsave(&svc->rsp_lock, flags);
> +		svc->pending = false;
> +		spin_unlock_irqrestore(&svc->rsp_lock, flags);
> +		ret = -ETIMEDOUT;
> +		goto out_unlock;
> +	}
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);
> +	if (svc->shutting_down) {
> +		ret = -ENODEV;
> +	} else if (svc->rsp_opcode != opcode) {
> +		ret = -EIO;
> +	} else {
> +		ret = svc->rsp_status;
> +		if (rsp_payload && rsp_len) {
> +			size_t copy_len = min(*rsp_len, svc->rsp_len);
> +
> +			memcpy(rsp_payload, svc->rsp_payload, copy_len);
> +			if (*rsp_len < svc->rsp_len && !ret)

Doing !ret, without preceeding call nowhere in sight, is bit of a curve 
ball. It would be better to name the variable differently.

> +				ret = -EMSGSIZE;

Is it correct that this just proceeds?

Does this even want to do the memcpy() when it returns error? Why?

> +			*rsp_len = svc->rsp_len;
> +		}
> +	}
> +	spin_unlock_irqrestore(&svc->rsp_lock, flags);
> +
> +out_unlock:
> +	mutex_unlock(&svc->xfer_lock);
> +	kfree(tx_buf);

Please convert this function to use __free(), guard() and scoped_guard(). 
Hopefully that makes the function a bit more readable (as is, I didn't 
even bother trying to follow the code flow).

> +
> +	return ret;
> +}
> +
> +static int radxa_svc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
> +				    int len, void *priv, u32 addr)
> +{
> +	struct radxa_svc_glink *svc = dev_get_drvdata(&rpdev->dev);
> +	const struct radxa_svc_hdr *hdr = data;
> +	unsigned long flags;
> +	size_t header_size;
> +	size_t payload_len;
> +	bool do_complete = false;
> +	u32 seq;
> +
> +	if (len < sizeof(*hdr))
> +		goto bad_msg;
> +
> +	if (le32_to_cpu(hdr->magic) != RADXA_SVC_MAGIC ||
> +	    le16_to_cpu(hdr->version) != RADXA_SVC_VERSION)
> +		goto bad_msg;
> +
> +	header_size = le16_to_cpu(hdr->header_size);
> +	if (header_size < sizeof(*hdr) || header_size > len)
> +		goto bad_msg;
> +
> +	payload_len = le32_to_cpu(hdr->payload_len);
> +	if (payload_len > len - header_size ||
> +	    payload_len > RADXA_SVC_MAX_RX_PAYLOAD)
> +		goto bad_msg;
> +
> +	seq = le32_to_cpu(hdr->seq);
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);
> +	if (svc->pending && seq == svc->pending_seq) {
> +		svc->rsp_opcode = le32_to_cpu(hdr->opcode);
> +		svc->rsp_status = (s32)le32_to_cpu(hdr->status);
> +		svc->rsp_len = payload_len;
> +		memcpy(svc->rsp_payload, data + header_size, payload_len);
> +		svc->pending = false;
> +		do_complete = true;
> +	}
> +	spin_unlock_irqrestore(&svc->rsp_lock, flags);
> +
> +	if (do_complete)
> +		complete(&svc->rsp);
> +
> +	return 0;
> +
> +bad_msg:
> +	return 0;

??

> +}
> +
> +static int radxa_svc_fan_get_pwm_mode(struct radxa_svc_glink *svc,
> +				      long *mode)
> +{
> +	struct radxa_svc_fan_control_resp control = {};
> +	u32 control_mode;
> +	u32 profile;
> +	int ret;
> +
> +	ret = radxa_svc_fan_get_control(svc, &control);
> +	if (ret)
> +		return ret;
> +
> +	control_mode = le32_to_cpu(control.control_mode);
> +
> +	switch (control_mode) {
> +	case RADXA_SVC_FAN_CONTROL_FULL_SPEED:
> +		*mode = RADXA_SVC_PWM_MODE_FULL_SPEED;
> +		return 0;
> +	case RADXA_SVC_FAN_CONTROL_MANUAL:
> +		*mode = RADXA_SVC_PWM_MODE_MANUAL;
> +		return 0;
> +	case RADXA_SVC_FAN_CONTROL_AUTO:
> +		break;
> +	default:
> +		return -EIO;
> +	}
> +
> +	ret = radxa_svc_get_profile(svc, &profile);
> +	if (ret)
> +		return ret;
> +
> +	switch (profile) {
> +	case RADXA_SVC_PROFILE_QUIET:
> +		*mode = RADXA_SVC_PWM_MODE_AUTO_QUIET;
> +		return 0;
> +	case RADXA_SVC_PROFILE_PERFORMANCE:
> +		*mode = RADXA_SVC_PWM_MODE_AUTO_PERFORMANCE;
> +		return 0;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static int radxa_svc_fan_set_auto_mode(struct radxa_svc_glink *svc,
> +				       u32 profile)
> +{
> +	struct radxa_svc_fan_control_resp control = {};
> +	int ret;
> +
> +	ret = radxa_svc_fan_get_control(svc, &control);
> +	if (ret)
> +		return ret;
> +
> +	ret = radxa_svc_set_profile(svc, profile);
> +	if (ret)
> +		return ret;
> +
> +	return radxa_svc_fan_set_control(svc, RADXA_SVC_FAN_CONTROL_AUTO,
> +					 le32_to_cpu(control.manual_pwm));
> +}
> +
> +static int radxa_svc_fan_set_pwm_mode(struct radxa_svc_glink *svc, long mode)
> +{
> +	struct radxa_svc_fan_state_resp state = {};
> +	u32 duty_ns;
> +	u32 manual_pwm;
> +	u32 period_ns;
> +	int ret;
> +
> +	switch (mode) {
> +	case RADXA_SVC_PWM_MODE_FULL_SPEED:
> +		return radxa_svc_fan_set_control(svc,
> +						 RADXA_SVC_FAN_CONTROL_FULL_SPEED,
> +						 RADXA_SVC_FAN_PWM_MAX);
> +	case RADXA_SVC_PWM_MODE_MANUAL:
> +		ret = radxa_svc_fan_get_state(svc, &state);
> +		if (ret)
> +			return ret;
> +
> +		period_ns = le32_to_cpu(state.pwm_period_ns);
> +		duty_ns = le32_to_cpu(state.current_duty_ns);
> +		if (!period_ns) {
> +			manual_pwm = RADXA_SVC_FAN_PWM_MAX;
> +		} else {
> +			ret = radxa_svc_fan_duty_to_pwm(period_ns, duty_ns,
> +							&manual_pwm);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		return radxa_svc_fan_set_control(svc,
> +						 RADXA_SVC_FAN_CONTROL_MANUAL,
> +						 manual_pwm);
> +	case RADXA_SVC_PWM_MODE_AUTO_QUIET:
> +		return radxa_svc_fan_set_auto_mode(svc,
> +						RADXA_SVC_PROFILE_QUIET);
> +	case RADXA_SVC_PWM_MODE_AUTO_PERFORMANCE:
> +		return radxa_svc_fan_set_auto_mode(svc,
> +						RADXA_SVC_PROFILE_PERFORMANCE);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static umode_t radxa_svc_hwmon_is_visible(const void *data,
> +					  enum hwmon_sensor_types type,
> +					  u32 attr, int channel)
> +{
> +	if (type != hwmon_pwm || channel)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +	case hwmon_pwm_enable:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int radxa_svc_hwmon_read(struct device *dev,
> +				enum hwmon_sensor_types type, u32 attr,
> +				int channel, long *val)
> +{
> +	struct radxa_svc_glink *svc = dev_get_drvdata(dev);
> +	struct radxa_svc_fan_state_resp state = {};
> +	u32 duty_ns;
> +	u32 period_ns;
> +	u32 pwm;
> +	int ret;
> +
> +	if (type != hwmon_pwm || channel)
> +		return -EOPNOTSUPP;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		ret = radxa_svc_fan_get_state(svc, &state);
> +		if (ret)
> +			return ret;
> +
> +		period_ns = le32_to_cpu(state.pwm_period_ns);
> +		duty_ns = le32_to_cpu(state.current_duty_ns);
> +		ret = radxa_svc_fan_duty_to_pwm(period_ns, duty_ns, &pwm);
> +		if (ret)
> +			return ret;
> +
> +		*val = pwm;
> +		return 0;
> +	case hwmon_pwm_enable:
> +		mutex_lock(&svc->fan_lock);
> +		ret = radxa_svc_fan_get_pwm_mode(svc, val);
> +		mutex_unlock(&svc->fan_lock);
> +
> +		return ret;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int radxa_svc_hwmon_write(struct device *dev,
> +				 enum hwmon_sensor_types type, u32 attr,
> +				 int channel, long val)
> +{
> +	struct radxa_svc_glink *svc = dev_get_drvdata(dev);
> +	struct radxa_svc_fan_control_resp control = {};
> +	int ret;
> +
> +	if (type != hwmon_pwm || channel)
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&svc->fan_lock);

Use guard() so you can return early.

> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > RADXA_SVC_FAN_PWM_MAX) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		ret = radxa_svc_fan_get_control(svc, &control);
> +		if (ret)
> +			break;
> +
> +		if (le32_to_cpu(control.control_mode) !=
> +		    RADXA_SVC_FAN_CONTROL_MANUAL) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		ret = radxa_svc_fan_set_control(svc,
> +						RADXA_SVC_FAN_CONTROL_MANUAL,
> +						val);
> +		break;
> +	case hwmon_pwm_enable:
> +		ret = radxa_svc_fan_set_pwm_mode(svc, val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	mutex_unlock(&svc->fan_lock);
> +
> +	return ret;
> +}
> +
> +static const struct hwmon_ops radxa_svc_hwmon_ops = {
> +	.is_visible = radxa_svc_hwmon_is_visible,
> +	.read = radxa_svc_hwmon_read,
> +	.write = radxa_svc_hwmon_write,
> +};
> +
> +static const struct hwmon_channel_info * const radxa_svc_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info radxa_svc_hwmon_chip_info = {
> +	.ops = &radxa_svc_hwmon_ops,
> +	.info = radxa_svc_hwmon_info,
> +};
> +
> +static int radxa_svc_hwmon_init(struct radxa_svc_glink *svc)
> +{
> +	svc->hwmon_dev = devm_hwmon_device_register_with_info(svc->dev,
> +							      "radxa_svc_glink",
> +							      svc,
> +							      &radxa_svc_hwmon_chip_info,
> +							      NULL);
> +
> +	return PTR_ERR_OR_ZERO(svc->hwmon_dev);
> +}
> +
> +static int radxa_svc_rpmsg_probe(struct rpmsg_device *rpdev)
> +{
> +	struct radxa_svc_version_resp version = {};
> +	struct radxa_svc_glink *svc;
> +	int ret;
> +
> +	svc = devm_kzalloc(&rpdev->dev, sizeof(*svc), GFP_KERNEL);
> +	if (!svc)
> +		return -ENOMEM;
> +
> +	svc->dev = &rpdev->dev;
> +	svc->rpdev = rpdev;
> +	mutex_init(&svc->xfer_lock);
> +	mutex_init(&svc->fan_lock);

Please use devm_mutex_init() + don't forget to add error handling as it 
can fail.

> +	spin_lock_init(&svc->rsp_lock);
> +	init_completion(&svc->rsp);
> +
> +	dev_set_drvdata(&rpdev->dev, svc);
> +
> +	ret = radxa_svc_get_version(svc, &version);
> +	if (ret)
> +		return dev_err_probe(&rpdev->dev, ret,
> +				     "failed to read service version\n");
> +
> +	ret = radxa_svc_check_version(&rpdev->dev, &version, &svc->caps);
> +	if (ret)
> +		return ret;
> +
> +	ret = radxa_svc_hwmon_init(svc);
> +	if (ret)
> +		return dev_err_probe(&rpdev->dev, ret,
> +				     "failed to register hwmon\n");
> +
> +	return 0;
> +}
> +
> +static void radxa_svc_rpmsg_remove(struct rpmsg_device *rpdev)
> +{
> +	struct radxa_svc_glink *svc = dev_get_drvdata(&rpdev->dev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);
> +	svc->shutting_down = true;
> +	svc->pending = false;
> +	spin_unlock_irqrestore(&svc->rsp_lock, flags);
> +	complete_all(&svc->rsp);
> +
> +	mutex_lock(&svc->xfer_lock);
> +	svc->rpdev = NULL;
> +	mutex_unlock(&svc->xfer_lock);
> +}
> +
> +static const struct rpmsg_device_id radxa_svc_rpmsg_id_match[] = {
> +	{ "RADXA_SVC_ADSP_APPS" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(rpmsg, radxa_svc_rpmsg_id_match);
> +
> +static struct rpmsg_driver radxa_svc_rpmsg_driver = {
> +	.probe = radxa_svc_rpmsg_probe,
> +	.remove = radxa_svc_rpmsg_remove,
> +	.callback = radxa_svc_rpmsg_callback,
> +	.id_table = radxa_svc_rpmsg_id_match,
> +	.drv = {
> +		.name = "radxa_svc_glink",
> +	},
> +};
> +module_rpmsg_driver(radxa_svc_rpmsg_driver);
> +
> +MODULE_AUTHOR("Xilin Wu <sophon@radxa.com>");
> +MODULE_DESCRIPTION("Radxa SVC GLINK driver");
> +MODULE_LICENSE("GPL");
> 
> 

-- 
 i.

