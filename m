Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F133FFAB5;
	Thu,  4 Jun 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569217; cv=none; b=TQwiA4+6/4NKETu9/fcK0dP6V+2xDQdzDpqa7fHb52aQyr8tUyWZ9bNE60h6qg3Zn3L/OISdn/mpmtZdMHt6vgmsP1SYT0fDLZW3lWdKA0eP2F5NVDxMzZ9twjfW7TaSF1IEs/1FJaOg000bkETHzK9N5W/IbXDL7R1fm6XUW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569217; c=relaxed/simple;
	bh=3nwdCQ3zaD1JqgjGGQOezS8GRGUjfU8Do8N2eAP1PaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSqBd4p2vIhEM3VfFM6r6D62q6PCIMwMOZF0kNw+MtHn+MYppmlBPh8r4GDtr643nzuRrWO0aNwzgyOnVCgRNNk4hhGfAA8I8Mad+VhMtR8miA/tjE8H4QgvhdBC47hojA+n42d/UZ9iYFltyqnQKKPYPXnCAz8ShJl/VRsSmTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HAPtL0u2; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HAPtL0u2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780569209; x=1781174009; i=w_armin@gmx.de;
	bh=NOkA9QgwCzYWgXGxpZvQo61c+kmOYZsIGFDwD1r0Cjk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HAPtL0u22OI4pNxSSSEqUgpRC/SnbMxHCa6f+7D0LOVq1fMjj5EvyFtVdQrZ/PWG
	 99YQ/h9J8v5u2rq7WSUKDRh4XPkK8Zah+GYNft8bq4JTaGu7aBy9JZApIaHJCx74G
	 SvGh0XyGVcMOaX7226mMmPTIvZjpT+NDIGmNVIM5KekMm/gBczOVGBSsYfXHsRZ2Q
	 DxK0YAYA3UeuGeAqIRxH7kw9ui93cDtmuG5uSZ8HjR4jn28GC+qu1hFavx/BpD+AM
	 /Hjgm2Thhmslz67M3I8cg+zY/rbDoos0POshCQPpGmfKL7JmyHcE6ZZfk62iHlzzt
	 vaYtvWnQBHM8yRTn1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lc9-1wVMdf2iQN-0081ec; Thu, 04
 Jun 2026 12:33:28 +0200
Message-ID: <8b8f5a9f-4a44-4e93-9ff6-c2e13a6b8797@gmx.de>
Date: Thu, 4 Jun 2026 12:33:27 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
 <87825203-0bbb-46a4-8939-a904f5a546ab@gmx.de>
 <6a4a2d2c-4717-4cc9-8dd3-05f8b0905865@t-8ch.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <6a4a2d2c-4717-4cc9-8dd3-05f8b0905865@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+uFlDecc9QOKyoVde3RIsrK7maIt8VNx7/TA95IeSfx2j18WkxU
 hFKlwLf+08gSMRHF5mzCag5NIlq7L1WF7V787aD/YvU5caBaeYrmJT3+yU7ZgL54Y8vYYRQ
 SI7lvGPAsT+CE5vGHOlUsxou/5iKtVnu9DCp0WThrnnYIeQkIAFEgbI6tymUqrQwO+XKu1A
 VtSi8PnPpXx7lLYWI5m6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rLxSn2090xs=;k4M3hS6QWBJ3gh0erGc5Z8Jl2z/
 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

Am 04.06.26 um 11:04 schrieb Thomas Wei=C3=9Fschuh:
> On 2026-05-30 18:37:32+0200, Armin Wolf wrote:
>> Am 29.05.26 um 22:31 schrieb Thomas Wei=C3=9Fschuh:
>=20
> (...)
>=20
>>> +static ssize_t temp_auto_point_temp_store(struct device *dev, struct =
device_attribute *attr,
>>> +					  const char *buf, size_t size)
>>> +{
>>> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(att=
r);
>>> +	struct cros_ec_hwmon_priv *priv =3D dev_get_drvdata(dev);
>>> +	struct ec_thermal_config config;
>>> +	u32 *temp_field;
>>> +	s64 temp;
>>> +	int ret;
>>> +
>>> +	ret =3D kstrtos64(buf, 10, &temp);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	temp =3D cros_ec_hwmon_millicelsius_to_kelvin(temp);
>>> +
>>> +	if (overflows_type(temp, config.temp_fan_off))
>>> +		return -ERANGE;
>>> +
>>> +	guard(hwmon_lock)(dev);
>>> +
>>> +	ret =3D cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index=
, &config);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
>>> +		temp_field =3D &config.temp_fan_off;
>>> +	else /* temp_fan_max */
>>> +		temp_field =3D &config.temp_fan_max;
>>> +
>>> +	/* Only allow values which are more aggressive than the current ones=
 */
>>> +	if (temp > *temp_field)
>>> +		return -EINVAL;
>>
>> i think it would be more practical for users to increase and later decr=
ease the fan curve values.
>> Could the driver copy the original fan curve configuration and use that=
 instead? This would also
>> require to restore the original fan curve during shutdown and removal.
>=20
> That would be possible. We would would have to expose these limits
> through a new UAPI as otherwise the user has no way to know about them.
> Restoring the original on shutdown shouldn't be necessary, as the EC
> will reset the curves at shutdown anyways.

(And what about kexec?)

Ok, i myself would also interested in having a UAPI for communicating=20
fan curve constraints to userspace as i am planning to add a similar=20
feature to the uniwill-laptop driver.

I can think of two approaches:

1. Clamp the values into the supported range, userspace will have to=20
read back the written value to know the current setting.

2. Introducing a new tempX_auto_pointY_temp_min attribute to communicate=
=20
the constraint to userspace.

Guenter, do you have a preference for one of the approaches? Personally
i would prefer approach number 2.

>=20
> I am not so sure that it would be generally useful though. Let's hear
> what other people think about it.

The uniwill-laptop driver will (likely) gain support for a similar=20
feature in the future, so having such a UAPI would be beneficial.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> +
>>> +	*temp_field =3D temp;
>>> +
>>> +	if (config.temp_fan_off > config.temp_fan_max)
>>> +		return -EINVAL;
>>> +
>>> +	ret =3D cros_ec_hwmon_set_thermal_config(priv->cros_ec, sattr->index=
, &config);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return size;
>>> +}
>=20
> (...)
>=20

