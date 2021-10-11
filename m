Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD3DC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 16:11:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C1AF60EB6
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 16:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhJKQNI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Oct 2021 12:13:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:49250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhJKQNH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Oct 2021 12:13:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A20560551;
        Mon, 11 Oct 2021 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633968667;
        bh=YJQr5L6lCFODlbTxcIIBtksmFapESXkuBS8qBniLadI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s84ROLygMlBxt1OI1EEMjyMAIfCfeGc6HpM6Pd2d8cNeFW2KRsQfy0+/gHyeLV0gm
         VOMZTVWM1JkyjCBFa9omVIqFogyZc7LRBfoVXA2mSapr53LsF0HF9JVS4faPMrbXr5
         oV7i/Xe+F5CDr27Vk6DXX3WqCTX9jjfd8QmLcAJ55NGijCGCvPOCPykqmQoYtHp3PX
         OssAKVcQP1ZL6rneFDqIRCvZlNmpxNihOGOLxA3rHcl96oDUV4GTfS02X31LlmF5T3
         fSbdw278Fbnyz5qoArFNPtdpiobSE5WTf4Fx8ANtsorK0x4x8ut+u6jOjga6IYKq9p
         zZM6DxNtf/MOg==
Received: by pali.im (Postfix)
        id 1065C7C9; Mon, 11 Oct 2021 18:11:01 +0200 (CEST)
Date:   Mon, 11 Oct 2021 18:11:01 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
Message-ID: <20211011161101.s7lojsh2ugsnbuzh@pali>
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926221044.14327-2-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Monday 27 September 2021 00:10:43 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> The nominal speed of each fan can be obtained with
> i8k_get_fan_nominal_speed(), however the result is not available
> from userspace.
> Change that by adding fanX_min, fanX_max and fanX_target attributes.
> All are RO since fan control happens over pwm.
> 
> Tested on a Dell Inspiron 3505 and a Dell Latitude C600.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
>  drivers/hwmon/dell-smm-hwmon.c         | 61 +++++++++++++++++++++++---
>  2 files changed, 58 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/dell-smm-hwmon.rst
> index 3bf77a5df995..beec88491171 100644
> --- a/Documentation/hwmon/dell-smm-hwmon.rst
> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
> @@ -34,6 +34,9 @@ Name				Perm	Description
>  =============================== ======= =======================================
>  fan[1-3]_input                  RO      Fan speed in RPM.
>  fan[1-3]_label                  RO      Fan label.
> +fan[1-3]_min                    RO      Minimal Fan speed in RPM
> +fan[1-3]_max                    RO      Maximal Fan speed in RPM
> +fan[1-3]_target                 RO      Expected Fan speed in RPM

Hello!

I do not know API / meaning of these 3 properties, so I looked into
hwmon documentation at:
https://www.kernel.org/doc/html/latest/hwmon/sysfs-interface.html#fans

And in documentation is written that both 3 properties (min, max and
target) are RW.

I'm somehow lost as I have not fully understood what is the original
meaning of these 3 properties. Guenter could you help?

After reading I understood it as that these properties are for HW which
supports controlling directly fan speed via RPM (and not PWM). And so
user can set lower and upper limit of fan speed (via _min and _max) or
can set exact RPM value (via _target).

>  pwm[1-3]                        RW      Control the fan PWM duty-cycle.
>  pwm1_enable                     WO      Enable or disable automatic BIOS fan
>                                          control (not supported on all laptops,
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 774c1b0715d9..476f2a74bd8c 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -76,6 +76,7 @@ struct dell_smm_data {
>  	int temp_type[DELL_SMM_NO_TEMP];
>  	bool fan[DELL_SMM_NO_FANS];
>  	int fan_type[DELL_SMM_NO_FANS];
> +	int *fan_nominal_speed[DELL_SMM_NO_FANS];
>  };
> 
>  MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
> @@ -673,6 +674,13 @@ static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor_types
>  			if (data->fan[channel] && !data->disallow_fan_type_call)
>  				return 0444;
> 
> +			break;
> +		case hwmon_fan_min:
> +		case hwmon_fan_max:
> +		case hwmon_fan_target:
> +			if (data->fan_nominal_speed[channel])
> +				return 0444;
> +
>  			break;
>  		default:
>  			break;
> @@ -740,6 +748,25 @@ static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type, u32 a
> 
>  			*val = ret;
> 
> +			return 0;
> +		case hwmon_fan_min:
> +			*val = data->fan_nominal_speed[channel][0];

When fan is turned off then it has speed 0 RPM. So should not be minimal
fan speed always hardcoded to zero?

> +
> +			return 0;
> +		case hwmon_fan_max:
> +			*val = data->fan_nominal_speed[channel][data->i8k_fan_max];
> +
> +			return 0;
> +		case hwmon_fan_target:
> +			ret = i8k_get_fan_status(data, channel);
> +			if (ret < 0)
> +				return ret;
> +
> +			if (ret > data->i8k_fan_max)
> +				ret = data->i8k_fan_max;
> +
> +			*val = data->fan_nominal_speed[channel][ret];
> +
>  			return 0;
>  		default:
>  			break;
> @@ -889,9 +916,12 @@ static const struct hwmon_channel_info *dell_smm_info[] = {
>  			   HWMON_T_INPUT | HWMON_T_LABEL
>  			   ),
>  	HWMON_CHANNEL_INFO(fan,
> -			   HWMON_F_INPUT | HWMON_F_LABEL,
> -			   HWMON_F_INPUT | HWMON_F_LABEL,
> -			   HWMON_F_INPUT | HWMON_F_LABEL
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET,
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET,
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET
>  			   ),
>  	HWMON_CHANNEL_INFO(pwm,
>  			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> @@ -910,7 +940,7 @@ static int __init dell_smm_init_hwmon(struct device *dev)
>  {
>  	struct dell_smm_data *data = dev_get_drvdata(dev);
>  	struct device *dell_smm_hwmon_dev;
> -	int i, err;
> +	int i, state, err;
> 
>  	for (i = 0; i < DELL_SMM_NO_TEMP; i++) {
>  		data->temp_type[i] = i8k_get_temp_type(i);
> @@ -926,8 +956,27 @@ static int __init dell_smm_init_hwmon(struct device *dev)
>  		err = i8k_get_fan_status(data, i);
>  		if (err < 0)
>  			err = i8k_get_fan_type(data, i);
> -		if (err >= 0)
> -			data->fan[i] = true;
> +
> +		if (err < 0)
> +			continue;
> +
> +		data->fan[i] = true;
> +		data->fan_nominal_speed[i] = devm_kmalloc_array(dev, data->i8k_fan_max + 1,
> +								sizeof(*data->fan_nominal_speed[i]),
> +								GFP_KERNEL);
> +		if (!data->fan_nominal_speed[i])
> +			continue;
> +
> +		for (state = 0; state <= data->i8k_fan_max; state++) {
> +			err = i8k_get_fan_nominal_speed(data, i, state);
> +			if (err < 0) {
> +				/* Mark nominal speed table as invalid in case of error */
> +				devm_kfree(dev, data->fan_nominal_speed[i]);
> +				data->fan_nominal_speed[i] = NULL;
> +				break;
> +			}
> +			data->fan_nominal_speed[i][state] = err;
> +		}
>  	}
> 
>  	dell_smm_hwmon_dev = devm_hwmon_device_register_with_info(dev, "dell_smm", data,
> --
> 2.20.1
> 
