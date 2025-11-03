Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6E27FB0E;
	Mon,  3 Nov 2025 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762188690; cv=none; b=dvQqZ70/C8I//MRkDhznVZ7AExbDXicicI4Gn2xaJWie3H1Oje4gnu0Ra5WdTEQTqpfCOQklNUTCLtFLe8cZTjiimN+E+71mSRgi+T/UKwuvjnM2+62OjLK1azmsRnoriVIUdp3WYELGtFO1CJ9EBfBZ+oOeOJ7954/YbrnkAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762188690; c=relaxed/simple;
	bh=sN+98ByzUm8Os03m/cZBXr3Td4C41MX5sIc3TY8J9Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmohlTvVc8zNB+xxFNRqj2OayjOovW4ztgPngyJb9vTgryCpq3+QLYkeZZMlaW3SVwU0spnTDUvVmPqyFdbHXGUlhfxGatB72OwGbCSgPcYqNDpcg+ehUnj8uvC539RhUS2Amo5MAjJudLPDdYtYP86+9cxBwC2+2PXSR5n+HW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHyUfYpU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHyUfYpU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71A9C113D0;
	Mon,  3 Nov 2025 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188689;
	bh=sN+98ByzUm8Os03m/cZBXr3Td4C41MX5sIc3TY8J9Vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DHyUfYpU9kkzwADlRGsWDkQ0q3DQDUEp2yey8cyG8jNH8ertLKSPzurpNNUVTZQr5
	 okAsr/owmllkRmJHXAXmURVzM7hTUJxJRLvjlDy3TMFLsdwHVnph6YSRACpxFMyfYw
	 oPtJhxuEIEWIa+d3NEXw3EPvfogbih/HT/C7i8jKnIIFgV/alpWbIDxbCCp48kIqcK
	 LZRtNn3EWVqewOEWJ/uOMmIhHCwA1e82sRBdLL7KoVLIj1sXmGwCg8yaA6GIrufELB
	 5sZhKD5mTmIduXYh09qIdtZi3a6pOOLEtKXSUh7YA4JRHnKN6tGIkFh0VBfNd7oDMN
	 +0UcExpyBd/Ew==
Message-ID: <4c06dc85-9b16-47b3-9622-58e699c700c0@kernel.org>
Date: Mon, 3 Nov 2025 10:51:27 -0600
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
References: <20251031163651.1465981-1-lkml@antheas.dev>
 <20251031163651.1465981-7-lkml@antheas.dev>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251031163651.1465981-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/31/2025 11:36 AM, Antheas Kapenekakis wrote:
> The Ayaneo EC resets after hibernation, losing the charge control state.
> Add a small PM hook to restore this state on hibernation resume.
> 
> The fan speed is also lost during hibernation, but since hibernation
> failures are common with this class of devices, setting a low fan speed
> when the userspace program controlling the fan will potentially not
> take over could cause the device to overheat, so it is not restored.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/ayaneo-ec.c | 73 ++++++++++++++++++++++++++++++++
>   1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> index 9548e3d22093..e1ad5968d3b4 100644
> --- a/drivers/platform/x86/ayaneo-ec.c
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -41,6 +41,8 @@
>   #define AYANEO_MODULE_LEFT	BIT(0)
>   #define AYANEO_MODULE_RIGHT	BIT(1)
>   
> +#define AYANEO_CACHE_LEN	1
> +
>   struct ayaneo_ec_quirk {
>   	bool has_fan_control;
>   	bool has_charge_control;
> @@ -51,6 +53,9 @@ struct ayaneo_ec_platform_data {
>   	struct platform_device *pdev;
>   	struct ayaneo_ec_quirk *quirks;
>   	struct acpi_battery_hook battery_hook;
> +
> +	bool restore_charge_limit;
> +	bool restore_pwm;
>   };
>   
>   static const struct ayaneo_ec_quirk quirk_fan = {
> @@ -207,10 +212,14 @@ static int ayaneo_ec_read(struct device *dev, enum hwmon_sensor_types type,
>   static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
>   			   u32 attr, int channel, long val)
>   {
> +	struct ayaneo_ec_platform_data *data = platform_get_drvdata(
> +		to_platform_device(dev));
> +	int ret;
>   	switch (type) {
>   	case hwmon_pwm:
>   		switch (attr) {
>   		case hwmon_pwm_enable:
> +			data->restore_pwm = false;
>   			switch (val) {
>   			case 1:
>   				return ec_write(AYANEO_PWM_ENABLE_REG,
> @@ -224,6 +233,15 @@ static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
>   		case hwmon_pwm_input:
>   			if (val < 0 || val > 255)
>   				return -EINVAL;
> +			if (data->restore_pwm) {
> +				// Defer restoring PWM control to after
> +				// userspace resumes successfully
> +				ret = ec_write(AYANEO_PWM_ENABLE_REG,
> +					       AYANEO_PWM_MODE_MANUAL);
> +				if (ret)
> +					return ret;
> +				data->restore_pwm = false;
> +			}
>   			return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
>   		default:
>   			break;
> @@ -474,10 +492,65 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int ayaneo_freeze(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> +	int ret;
> +	u8 tmp;
> +
> +	if (data->quirks->has_charge_control) {
> +		ret = ec_read(AYANEO_CHARGE_REG, &tmp);
> +		if (ret)
> +			return ret;
> +
> +		data->restore_charge_limit = tmp == AYANEO_CHARGE_VAL_INHIBIT;
> +	}
> +
> +	if (data->quirks->has_fan_control) {
> +		ret = ec_read(AYANEO_PWM_ENABLE_REG, &tmp);
> +		if (ret)
> +			return ret;
> +
> +		data->restore_pwm = tmp == AYANEO_PWM_MODE_MANUAL;

Why bother with the temp variable in the first place?

You could just make the data type of restore_pwm a u8 and then:

ec_read(AYANEO_PWM_ENABLE_REG, data->restore_pwm);


> +
> +		// Release the fan when entering hibernation to avoid
> +		// overheating if hibernation fails and hangs

Multi-line comments should be done with /* */

> +		if (data->restore_pwm) {
> +			ret = ec_write(AYANEO_PWM_ENABLE_REG, AYANEO_PWM_MODE_AUTO);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ayaneo_restore(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	if (data->quirks->has_charge_control && data->restore_charge_limit) {
> +		ret = ec_write(AYANEO_CHARGE_REG, AYANEO_CHARGE_VAL_INHIBIT);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ayaneo_pm_ops = {
> +	.freeze = ayaneo_freeze,
> +	.restore = ayaneo_restore,
> +};

Why are freeze and restore special?  Userspace is frozen for the suspend 
sequence of any flow.  Hangs could happen in suspend just like they can 
in hibernate.  If you're going to protect users from this I would expect 
parity for "regular" suspend/resume.

Can you just use SIMPLE_DEV_PM_OPS and rename the functions accordingly?

> +
>   static struct platform_driver ayaneo_platform_driver = {
>   	.driver = {
>   		.name = "ayaneo-ec",
>   		.dev_groups = ayaneo_ec_groups,
> +		.pm = &ayaneo_pm_ops,
>   	},
>   	.probe = ayaneo_ec_probe,
>   };

