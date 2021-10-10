Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78211C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Oct 2021 21:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61AF360F38
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Oct 2021 21:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhJJVUb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Oct 2021 17:20:31 -0400
Received: from mout.gmx.net ([212.227.15.19]:46551 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230364AbhJJVUa (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Oct 2021 17:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633900694;
        bh=jmVZUXPmdCiEgO6u5ym0QxqayUatd2aFOH5bMO0wRjU=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=PSC4/nUmlyFEMPeygSQXnrMAQde9chOKgFBnolLp8cTMAFNP/o62x91OlmVH7so6p
         ReGPt1bAcgDhQnxC1QENjOTSkB6WV7ae2l23CLzIfP3FkyGq2gZ+MPlCj79DpxozDa
         mHbqQRQs7ZW7kNhnDA7GQnIQwE7a+PDgWK5s7SB8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.42] ([91.137.126.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6Zw-1nG91s25hm-00hahm; Sun, 10
 Oct 2021 23:18:14 +0200
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
From:   Armin Wolf <W_Armin@gmx.de>
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
Message-ID: <6345229a-6cd2-042e-398b-d57cf45520bf@gmx.de>
Date:   Sun, 10 Oct 2021 23:18:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210926221044.14327-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:Uq0g6osyusfRWxl3nLQursgTia00nyKcWDorXHh67//17Z52BO/
 SmsPAusCaoHZWj9ppKeDN0FWVPzgGfNowKOmy42O5RWhq+pHI/1nB4QsMSSkl685qc/Wif/
 kQBdNErD0ULFFup7ZyNSm7mS/l2pi9DiS71HWxhjrm/O6jjezIrPwVTE1nmFD17kfPiBBLA
 6WRcI2iKxaq1yRchocOQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k9aLI2LsK74=:r1LMLxssD8/uTTYblU1xnY
 z4R2WRonBsLvVUj2e8Fi6ZEg1l2eBmoyv7JMJNMhjDbA9OwO/OPatjtxJGWZ2Eygt2GWJVVse
 2YSFJqoEwbsCD0+gfgaG6q0bHB6wz1WOGGvUYdBqbMfOwtidhcdLVsTePKfer3fKuVSPpXTD5
 hjMLFW4EbJC0F+rUJdoPoKkKMZb0n1Aa5GawOgplWVBeZv5QXbnByIG5k0mWdVSItQPQoRdVA
 mMcy7v6QTZGCBMImKSHZJcfiOXbI1bfCBgipcMbJNcigfcCW2GCAx7iUMtIRGdXLhNfM3dhF+
 0BnoU6gpU4BPeBP9F21fFNiU5CNdDfJZnMpALEwiExjnmI06f58CxHru0LlXVm8BP1AyPefUY
 Sz1vW3qb8So2jcEjhXM/Cjqjy5Ca5qZARWTS0exc+dig3yFbakkOjrAOXCPWA3kNw15hRifEp
 V2n4FjzqwlIo0QECPIZKDFw5+0mdkvggU3t7gcaPh/g/e39ydNApaVb3QdSiv55vvJD5lSN2J
 rp9gzDirLttEHZNOgQs0aArwsUXfk2EKyEYNNxIK3HF0RDDklCgaICAAo+sc88zQvhfDGoIFN
 FEWYexJuxSensE778JUUtQBEMNywf+99CEKwfyZ6tSPQgjtlZTUjk/9/0k9Ue2ZZz7pFLJ5tE
 AkvaJBfcPIYdFWU6O/uaxMSQvM6IMIwHqIaljiZiJg4/9QhG7G9DEFBiewjrbciPjdGfPdUhv
 t6OuSL40KZgNgyptd3ek5d036E4pfX+Iic1sGP31J7DgPmHRVV+qgaoHxQDHmaS7Vhk0PblWj
 l+aaB9PKGsa35LafyybLIxvTZmbtp4ZU6VM9zNYs4iEHluP8Hhc64GozHiX0cpFfysHGsfkks
 bm8tIkluIa7y/RGMgAaW6FBUHFvpPWlcoWsxoXGTx7iiUQaV32RjlvT3F2in+O1BEzdttO7io
 vDSel2Z7G9i0z2JZGpP8ODYzo1a3WMQ2XY/fKU387scJ/DbrYO72zrARmxDy62STyM76XVnjY
 0EAryhutgA3kP5s9Z57ftnwM6ROythClvP68U+pELtrPJLZ7W+jIh3eA8TXhHzS5AQulKwtIB
 tVqFqFPZuxGkos=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 27.09.21 um 00:10 schrieb W_Armin@gmx.de:
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
>   Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
>   drivers/hwmon/dell-smm-hwmon.c         | 61 +++++++++++++++++++++++---
>   2 files changed, 58 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmo=
n/dell-smm-hwmon.rst
> index 3bf77a5df995..beec88491171 100644
> --- a/Documentation/hwmon/dell-smm-hwmon.rst
> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
> @@ -34,6 +34,9 @@ Name				Perm	Description
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>   fan[1-3]_input                  RO      Fan speed in RPM.
>   fan[1-3]_label                  RO      Fan label.
> +fan[1-3]_min                    RO      Minimal Fan speed in RPM
> +fan[1-3]_max                    RO      Maximal Fan speed in RPM
> +fan[1-3]_target                 RO      Expected Fan speed in RPM
>   pwm[1-3]                        RW      Control the fan PWM duty-cycle=
.
>   pwm1_enable                     WO      Enable or disable automatic BI=
OS fan
>                                           control (not supported on all =
laptops,
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwm=
on.c
> index 774c1b0715d9..476f2a74bd8c 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -76,6 +76,7 @@ struct dell_smm_data {
>   	int temp_type[DELL_SMM_NO_TEMP];
>   	bool fan[DELL_SMM_NO_FANS];
>   	int fan_type[DELL_SMM_NO_FANS];
> +	int *fan_nominal_speed[DELL_SMM_NO_FANS];
>   };
>
>   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
> @@ -673,6 +674,13 @@ static umode_t dell_smm_is_visible(const void *drvd=
ata, enum hwmon_sensor_types
>   			if (data->fan[channel] && !data->disallow_fan_type_call)
>   				return 0444;
>
> +			break;
> +		case hwmon_fan_min:
> +		case hwmon_fan_max:
> +		case hwmon_fan_target:
> +			if (data->fan_nominal_speed[channel])
> +				return 0444;
> +
>   			break;
>   		default:
>   			break;
> @@ -740,6 +748,25 @@ static int dell_smm_read(struct device *dev, enum h=
wmon_sensor_types type, u32 a
>
>   			*val =3D ret;
>
> +			return 0;
> +		case hwmon_fan_min:
> +			*val =3D data->fan_nominal_speed[channel][0];
> +
> +			return 0;
> +		case hwmon_fan_max:
> +			*val =3D data->fan_nominal_speed[channel][data->i8k_fan_max];
> +
> +			return 0;
> +		case hwmon_fan_target:
> +			ret =3D i8k_get_fan_status(data, channel);
> +			if (ret < 0)
> +				return ret;
> +
> +			if (ret > data->i8k_fan_max)
> +				ret =3D data->i8k_fan_max;
> +
> +			*val =3D data->fan_nominal_speed[channel][ret];
> +
>   			return 0;
>   		default:
>   			break;
> @@ -889,9 +916,12 @@ static const struct hwmon_channel_info *dell_smm_in=
fo[] =3D {
>   			   HWMON_T_INPUT | HWMON_T_LABEL
>   			   ),
>   	HWMON_CHANNEL_INFO(fan,
> -			   HWMON_F_INPUT | HWMON_F_LABEL,
> -			   HWMON_F_INPUT | HWMON_F_LABEL,
> -			   HWMON_F_INPUT | HWMON_F_LABEL
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET,
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET,
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET
>   			   ),
>   	HWMON_CHANNEL_INFO(pwm,
>   			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> @@ -910,7 +940,7 @@ static int __init dell_smm_init_hwmon(struct device =
*dev)
>   {
>   	struct dell_smm_data *data =3D dev_get_drvdata(dev);
>   	struct device *dell_smm_hwmon_dev;
> -	int i, err;
> +	int i, state, err;
>
>   	for (i =3D 0; i < DELL_SMM_NO_TEMP; i++) {
>   		data->temp_type[i] =3D i8k_get_temp_type(i);
> @@ -926,8 +956,27 @@ static int __init dell_smm_init_hwmon(struct device=
 *dev)
>   		err =3D i8k_get_fan_status(data, i);
>   		if (err < 0)
>   			err =3D i8k_get_fan_type(data, i);
> -		if (err >=3D 0)
> -			data->fan[i] =3D true;
> +
> +		if (err < 0)
> +			continue;
> +
> +		data->fan[i] =3D true;
> +		data->fan_nominal_speed[i] =3D devm_kmalloc_array(dev, data->i8k_fan_=
max + 1,
> +								sizeof(*data->fan_nominal_speed[i]),
> +								GFP_KERNEL);
> +		if (!data->fan_nominal_speed[i])
> +			continue;
> +
> +		for (state =3D 0; state <=3D data->i8k_fan_max; state++) {
> +			err =3D i8k_get_fan_nominal_speed(data, i, state);
> +			if (err < 0) {
> +				/* Mark nominal speed table as invalid in case of error */
> +				devm_kfree(dev, data->fan_nominal_speed[i]);
> +				data->fan_nominal_speed[i] =3D NULL;
> +				break;
> +			}
> +			data->fan_nominal_speed[i][state] =3D err;
> +		}
>   	}
>
>   	dell_smm_hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "del=
l_smm", data,
> --
> 2.20.1
>
Are there any problems with this patch? I already tested it on two
models, is there something
else i should verify/change?

Armin
