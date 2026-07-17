Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE05D3C13E7
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 06:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270989; cv=none; b=MlI/oxXJsZovFjvSyU1IURVJph/a5xwl+anznsQAngrNKliGoM7r62tbFBptwM7ocCYsy7bcGsCzzLABBicvH+RRHmXtu7GkdSrQ3pOxIZxcbgxqAV/7M6ExeWZhpmZ4tQdgFXlraMO8xEJrMdHD1H90+mdwyowB9exnJh40+Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270989; c=relaxed/simple;
	bh=mtne+AkaIFF4QhTXO80UfqPZZO0N3e+Obw7VBjqbjzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J4mhYc9wA1Sow/wFhe2qVqIlPIiKMx9MZP7slgdwB7NIwrsogGSkU+DL0bTRYsaQc+06uLwGKBL6b2+QEEYzY194lRaeIwixyN+tH52gyywzHIP4aiU0cqAzgqZLtqo1I+t/57zXFTUTynYOpbxK+levTJ2gaI0kpV7Rxh0KXoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kx1ZHMEC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kx1ZHMEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824201F000E9;
	Fri, 17 Jul 2026 06:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784270987;
	bh=ExQDm9oleNzouiboGwgKqq0FWNuWU7L6L31dNzEk2+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kx1ZHMECtEvkxRFK4QEAypbE6RD+SFENtrVkhdhi5qMjPb7z4z4msVUQG9cUlVbKR
	 ijG0cVwvD78gb5EMnRG8nfr9+d3f1F7JH1pZkK3Cd1x8pwa8m9c44T1T7fPw6w8DQn
	 UrtaEa7iykBxpeZQrIT1tWAw2wgr4FzhSLMh9p8ofgFUM+d5D5WpBRtWg5Xlb2DgEy
	 jggyrobgj/qo5uXSdO4yvnhY8zCWnBFqXU3XVZuVjQjUOZWwtzJ2Ru+uJB2tHCbhkZ
	 KRsbJn2Pq9z+qzO1nEPzokm8mAfUqUnsWtAQBqzKLgi/o49ntiRnAIjUeChN0ChK4u
	 0HveboNlR93yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260717063730.5617-1-flaviu.nistor@gmail.com>
References: <20260717063730.5617-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 06:49:47 +0000
Message-Id: <20260717064947.824201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Incompatible pointer type causing build failure

Pre-existing issues:
- [Critical] Sysfs read triggers NULL pointer dereference via uninitialized=
 hwmon_dev
--

--- Patch [1]: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode AP=
Is ---
commit 3d5d792e5529b3545ccefc21f7dfd9c2acecc999
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

hwmon: (lm90) Switch channel parsing to fwnode APIs
   =20
This commit replaces OF property handling with fwnode APIs in the probe
function to read channel properties. This improves compatibility by no long=
er
limiting it to Device Tree.

Link: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail=
.com/

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 4b9c0ccdf2609..7d4b8e61bec51 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
[ ... ]
> @@ -2701,27 +2701,27 @@ static int lm90_probe_channel_from_dt(struct i2c_=
client *client,
[ ... ]
> -	err =3D of_property_read_s32(child, "temperature-offset-millicelsius", =
&val);
> +	err =3D fwnode_property_read_u32(child, "temperature-offset-millicelsiu=
s", &val);

[Severity: Low]
Will this cause a build failure or compiler warning?

In lm90_probe_channel(), val is declared as an s32, but it is being passed
to fwnode_property_read_u32() which expects a u32 pointer. This pointer type
mismatch can trigger a -Wincompatible-pointer-types error in modern builds.

[ ... ]
> @@ -2887,12 +2886,10 @@ static int lm90_probe(struct i2c_client *client)
>  	/* Set maximum conversion rate */
>  	data->max_convrate =3D lm90_params[data->kind].max_convrate;
> =20
> -	/* Parse device-tree channel information */
> -	if (client->dev.of_node) {
> -		err =3D lm90_parse_dt_channel_info(client, data);
> -		if (err)
> -			return err;
> -	}
> +	/* Parse channel information */
> +	err =3D lm90_parse_channel_info(client, data);
> +	if (err)
> +		return err;
> =20
>  	/* Initialize the LM90 chip */
>  	err =3D lm90_init_client(client, data);

[Severity: Critical]
This is a pre-existing issue, but does this create a race condition that
results in a NULL pointer dereference?

In lm90_probe(), the sysfs files are exposed when calling
devm_hwmon_device_register_with_info() later in the function:

	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->name,
							 data, &data->chip,
							 NULL);
	if (IS_ERR(hwmon_dev))
		return PTR_ERR(hwmon_dev);

	data->hwmon_dev =3D hwmon_dev;

If an unprivileged userspace process reads a sysfs attribute before
data->hwmon_dev is initialized, it triggers lm90_temp_read(), which schedul=
es
data->report_work.

The asynchronous work runs lm90_report_alarms():

	struct device *hwmon_dev =3D data->hwmon_dev;
	...
	if (st & LM90_STATUS_LLOW)
		hwmon_notify_event(hwmon_dev, hwmon_temp,
				   hwmon_temp_min_alarm, 0);

This would pass the still-NULL hwmon_dev to hwmon_notify_event(), causing a
kernel panic. Should data->hwmon_dev be initialized before the device is
registered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717063730.5617=
-1-flaviu.nistor@gmail.com?part=3D1
