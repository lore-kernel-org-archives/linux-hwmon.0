Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0632B11E;
	Sat, 30 May 2026 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159057; cv=none; b=ebPdkKas+fXp810MlBykAZsv9/nvVAt/39C4LP4Z8fhklJ5v8AR3d6HxljwvS80AluTCJ/4KUrMB0ulgOX5e6Q8cQ7uW3sldEBF8p/J6lpbO5bwhJt3V8ZZDqxxjeXUzljz7qkT0wysjM58yfvIkTQ1SnO3JAdZn42fNAFt47BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159057; c=relaxed/simple;
	bh=bAVRJ9KJ9/5uJ6SykHR1Uihf3pZRlLDaAoWBn9SwIXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Or3n7IXg53orzQE4gg2AkSxQbbv/0l44CvYrhZKGuRT1YyJ21Tcy86hKYHJgF23o+874kIarWUeSl3XTU1VuLVazFZKPNQmCqNKXJPLjfQ9W/sU/S33gR7Kru/M67X9e1mYTwChnJDenXZm9OfomIWHL/pdp+QmPmhvncjkFXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=T/XGCwNJ; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="T/XGCwNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780159053; x=1780763853; i=w_armin@gmx.de;
	bh=y0B73XMFMMuj0Mte69VZybEH/jsCp9Az/UdfVog0f1E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=T/XGCwNJXdf+9vrzbfTCvg7pm+LrYMbJVDOpnMIotUsgEY9J3Dn1ePVUothmVZel
	 9RyM+m9EktBDPK4PLxmOqbJwSRtkOHc2UIPbOEYRBhw9B1PV/gnDGzZPBa7sPO/Y2
	 N+v8/AzPMuUdfLIf2QKlIcZSY/NJpDlDshA48YELK3aKY1MSMREcyBIMAz24RbDw+
	 rj1kgu02hHY7wkk0jQdUDW6cC0Ui0YkbDfC5lCmDe4Awhmks5WDOk1KELf6XWNm6j
	 oZotwafEwRhk95+AiuCESlw8/m0tGZTuWEP5mfSsZpJ30bN2no7CQpqPTE+1pQN8/
	 pAfmE+Lukno+a5RZmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQiS-1wckcl2kxq-006tRU; Sat, 30
 May 2026 18:37:33 +0200
Message-ID: <87825203-0bbb-46a4-8939-a904f5a546ab@gmx.de>
Date: Sat, 30 May 2026 18:37:32 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VOCrwdZnoHRBGLFwt8h113pkgxerxe4AqyOaZRw19uGfwRx39qC
 fjCSjArn9u51+NRpcHFbvBs3zNEqboohnyhXPmImRTxgKUltT5uMZqSrvwG2bZzJn1GIE0g
 l7l1XwyrjAhnRmcaMK/AgPxZTuKfzHTEWe0F3iRM4i2uAfp/0XxNsK8jIkf7V2fI/GmXNEA
 NvlusNejttTeVJZbrA8tA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EDilQ0+aDzg=;lVvyef9DWToj+PEB2idiI61sZGs
 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

Am 29.05.26 um 22:31 schrieb Thomas Wei=C3=9Fschuh:

> The fan curves used by the embedded controller can be configured.
>
> Expose this through the standard hwmon sysfs ABI.
>
> Only allow the curves to be made more aggressive than the current ones.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   Documentation/hwmon/cros_ec_hwmon.rst |  2 +-
>   drivers/hwmon/cros_ec_hwmon.c         | 68 +++++++++++++++++++++++++++=
++++++--
>   2 files changed, 67 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon=
/cros_ec_hwmon.rst
> index 7a8683227252..a3d0e43c8833 100644
> --- a/Documentation/hwmon/cros_ec_hwmon.rst
> +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> @@ -48,4 +48,4 @@ PWM fan control
>       in the thermal framework as well.
>  =20
>   Fan curves:
> -   If supported by the EC. Reading only.
> +   If supported by the EC. Reading and writing.
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon=
.c
> index 731143f8c6b2..fb73a00ebeeb 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -8,9 +8,11 @@
>   #include <linux/device.h>
>   #include <linux/hwmon.h>
>   #include <linux/hwmon-sysfs.h>
> +#include <linux/kstrtox.h>
>   #include <linux/math.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
> +#include <linux/overflow.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_data/cros_ec_commands.h>
>   #include <linux/platform_data/cros_ec_proto.h>
> @@ -135,6 +137,22 @@ static int cros_ec_hwmon_get_thermal_config(struct =
cros_ec_device *cros_ec, u8 i
>   	return 0;
>   }
>  =20
> +static int cros_ec_hwmon_set_thermal_config(struct cros_ec_device *cros=
_ec, u8 index,
> +					    const struct ec_thermal_config *config)
> +{
> +	struct ec_params_thermal_set_threshold_v1 req =3D {};
> +	int ret;
> +
> +	req.sensor_num =3D index;
> +	req.cfg =3D *config;
> +	ret =3D cros_ec_cmd(cros_ec, 1, EC_CMD_THERMAL_SET_THRESHOLD,
> +			  &req, sizeof(req), NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int cros_ec_hwmon_read_temp_threshold(struct cros_ec_device *cr=
os_ec, u8 index,
>   					     enum ec_temp_thresholds threshold, u32 *temp)
>   {
> @@ -417,14 +435,60 @@ static ssize_t temp_auto_point_temp_show(struct de=
vice *dev, struct device_attri
>   	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(=
temp));
>   }
>  =20
> +static ssize_t temp_auto_point_temp_store(struct device *dev, struct de=
vice_attribute *attr,
> +					  const char *buf, size_t size)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr)=
;
> +	struct cros_ec_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	struct ec_thermal_config config;
> +	u32 *temp_field;
> +	s64 temp;
> +	int ret;
> +
> +	ret =3D kstrtos64(buf, 10, &temp);
> +	if (ret)
> +		return ret;
> +
> +	temp =3D cros_ec_hwmon_millicelsius_to_kelvin(temp);
> +
> +	if (overflows_type(temp, config.temp_fan_off))
> +		return -ERANGE;
> +
> +	guard(hwmon_lock)(dev);
> +
> +	ret =3D cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, =
&config);
> +	if (ret)
> +		return ret;
> +
> +	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
> +		temp_field =3D &config.temp_fan_off;
> +	else /* temp_fan_max */
> +		temp_field =3D &config.temp_fan_max;
> +
> +	/* Only allow values which are more aggressive than the current ones *=
/
> +	if (temp > *temp_field)
> +		return -EINVAL;

Hi,

i think it would be more practical for users to increase and later decreas=
e the fan curve values.
Could the driver copy the original fan curve configuration and use that in=
stead? This would also
require to restore the original fan curve during shutdown and removal.

Thanks,
Armin Wolf

> +
> +	*temp_field =3D temp;
> +
> +	if (config.temp_fan_off > config.temp_fan_max)
> +		return -EINVAL;
> +
> +	ret =3D cros_ec_hwmon_set_thermal_config(priv->cros_ec, sattr->index, =
&config);
> +	if (ret)
> +		return ret;
> +
> +	return size;
> +}
> +
>   #define CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(_idx)					\
>   	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point1_pwm,		\
>   				       temp_auto_point_pwm,  0, (_idx) - 1);		\
>   	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point2_pwm,		\
>   				       temp_auto_point_pwm,  1, (_idx) - 1);		\
> -	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point1_temp,		\
> +	static SENSOR_DEVICE_ATTR_2_RW(temp ## _idx ## _auto_point1_temp,		\
>   				       temp_auto_point_temp,  0, (_idx) - 1);		\
> -	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point2_temp,		\
> +	static SENSOR_DEVICE_ATTR_2_RW(temp ## _idx ## _auto_point2_temp,		\
>   				       temp_auto_point_temp,  1, (_idx) - 1)		\
>  =20
>   #define CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(_idx)					\
>
