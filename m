Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292605;
	b=kevpGE/7Jdkryw2fFlgCxhPMU9Is7nuwCzTqqQlC+Q9h/4VyfawOGF0wBSAs7oM7ibcH
	 FndmAItkxZ5FP/5AgtDRbnwZAnqINDP7kJ27XO/9Fhr27Y7+ly1CWjlVC7IBBJh4fvDx0
	 F7fyKMfSj+muHXHZTtvGLLXvyK5qvGYTIcbGDiTnRJ96ClVxEptZY31mjoYn6ibtbjuBw
	 45NZRg8qlIm/1plWynCF9qGguyo1O+79fnQWRhgxncCmG+BV2e2lIteXY+lGn0jE3U1Wc
	 y7UvqOJA98dhY2SZSAud+O5WNTy9rD8VZvzoLpNnWX58U24acfOcc2HGuOvw46oqaVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292605;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pa0vkJzj0k3zZLL/20GlQy9JpgmBB2nzAtp9OHFpta8=;
	b=WMAB8e0Zxci9rJNHMel7PzVRhAN/PNHusa4a93NwxJUyH1ZJYObKrUpCoM+lT8euSB4n
	 WwiWPQWBUFQSAOlWRvDpSjEOGc47TQdupuaBpQWJx403VwRqIbMkXwbTnWp45aTs2iNWi
	 dqkJAxsNfqtk3FfejSnvENQrMB9bdCzdOCgshpsZGXitXavI9NzblKUvTqT/MSr6gKxqc
	 H4joBuoDCXftBA15NfZupUFEg5VuhoH1Je2RdQs+m+Z9G0sOh6DF0wb52Vvf4QRgvAfMq
	 83ulkSUbtZBM/J7Z0FYieSfQRUVP40gk6EPRtDKG0nTteWgS/CyUQSY00/vZSGNRwhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUzZmyq4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AB5606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 16:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUzZmyq4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201301F01816;
	Thu, 29 Oct 2026 16:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793292604;
	bh=Pa0vkJzj0k3zZLL/20GlQy9JpgmBB2nzAtp9OHFpta8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XUzZmyq481DVF40OONEbXfTOGi0gu+W9J1nq/yfJXFA8ML998aX88/NasRLnXjVx6
	 cQuQBfM6uu7L+fDZQ3nOhvbhgVoVL2QPtY8lyGNKMZ65FloEQPtkn27XhsGeFFesBu
	 aevRLXDFmBS4KjApbgo83O2zwKGGLkKPKzRWjVYaFiOENV+9olDVlbXU+dJ228ooJj
	 kWxVA1pv9rBPCwG/rQcxo3GSlO5a4k/peqhFNPuxraK9tmDJiM4BO7rmd2b8Tjkuj4
	 jSwK7anYtxdRwvlmUM+tzIpRH64L1IB3OCkmfYTvb65Tuv1yHzPNTLcqph5p0cWhxc
	 weIKllRUjA0ew==
Message-ID: <sashiko-outbox-189682@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (lm87) Check I2C errors during detection
 and setup
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFlayBLeXUsIEtpbQ==?= <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261029164016.338450-4-pocj8ur4in@gmail.com>
References: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
 <20261029164016.338450-1-pocj8ur4in@gmail.com>
 <20261029164016.338450-4-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 16:50:03 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] hwmon: (lm87) premature devm_add_action() in lm87_init_client() on =
error path
--

commit c6264ca6c303f980a5123962ced0900012b6d8d6
Author: Baek Kyu, Kim <pocj8ur4in@gmail.com>

hwmon: (lm87) Check I2C errors during detection and setup

This commit adds error checking for SMBus read and write operations in
lm87_detect(), lm87_restore_config(), and lm87_init_client().

> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
> index a66d486b314cf..32ec44f583eb8 100644
> --- a/drivers/hwmon/lm87.c
> +++ b/drivers/hwmon/lm87.c

[ ... ]

> @@ -989,7 +994,12 @@ static void lm87_restore_config(void *arg)
>  	struct i2c_client *client =3D arg;
>  	struct lm87_data *data =3D i2c_get_clientdata(client);
> =20
> -	lm87_write_value(client, LM87_REG_CONFIG, data->config);
> +	int err;
> +
> +	err =3D lm87_write_value(client, LM87_REG_CONFIG, data->config);
> +	if (err < 0)
> +		dev_warn(&client->dev, "Failed to restore configuration: %d\n",
> +			 err);
>  }
> =20
>  static int lm87_init_client(struct i2c_client *client)
> @@ -1013,16 +1023,26 @@ static int lm87_init_client(struct i2c_client *cl=
ient)

[ ... ]

> -	data->config =3D lm87_read_value(client, LM87_REG_CONFIG) & 0x6F;
> +	rc =3D lm87_read_value(client, LM87_REG_CONFIG);
> +	if (rc < 0)
> +		return rc;
> +	data->config =3D rc & 0x6F;
> =20
>  	rc =3D devm_add_action(&client->dev, lm87_restore_config, client);
>  	if (rc)
> @@ -1033,28 +1053,52 @@ static int lm87_init_client(struct i2c_client *cl=
ient)
> =20
>  		/* Limits are left uninitialized after power-up */
>  		for (i =3D 1; i < 6; i++) {
> -			lm87_write_value(client, LM87_REG_IN_MIN(i), 0x00);
> -			lm87_write_value(client, LM87_REG_IN_MAX(i), 0xFF);
> +			rc =3D lm87_write_value(client, LM87_REG_IN_MIN(i), 0x00);
> +			if (rc < 0)
> +				return rc;
> +			rc =3D lm87_write_value(client, LM87_REG_IN_MAX(i), 0xFF);
> +			if (rc < 0)
> +				return rc;
>  		}

[ ... ]

>  	/* Make sure Start is set and INT#_Clear is clear */
>  	if ((data->config & 0x09) !=3D 0x01)
> -		lm87_write_value(client, LM87_REG_CONFIG,
> -				 (data->config & 0x77) | 0x01);
> +		return lm87_write_value(client, LM87_REG_CONFIG,
> +					(data->config & 0x77) | 0x01);
>  	return 0;
>  }

[Severity: Low]
In drivers/hwmon/lm87.c, lm87_init_client() registers lm87_restore_config()
via devm_add_action() before writing the sensor limit registers and before
updating LM87_REG_CONFIG at the end of the function:

	/* Make sure Start is set and INT#_Clear is clear */
	if ((data->config & 0x09) !=3D 0x01)
		return lm87_write_value(client, LM87_REG_CONFIG,
					(data->config & 0x77) | 0x01);

Now that lm87_init_client() returns early when any of the limit register
writes or the final LM87_REG_CONFIG write fails, devres cleanup will run
lm87_restore_config() during probe unwind even though LM87_REG_CONFIG was
never modified. On an already failing bus, that issues an extra write to
LM87_REG_CONFIG and logs a "Failed to restore configuration" warning.

Should devm_add_action() (or devm_add_action_or_reset()) only be called
after LM87_REG_CONFIG has been successfully modified?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029164016.3384=
50-1-pocj8ur4in@gmail.com?part=3D3
