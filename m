Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD139FCBC;
	Wed, 26 Aug 2026 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770669; cv=none; b=DXjYrRu+p0RnEJIwKm8E5jtL4aHjeYWfqDwk+m7OU2lZDVssN+lrd4bV4uTQUHJWm0yOCB4GTmdYfy++J0+E+QYk4gAkf4nO4q6cRr/Z7J6YRitf3aHHZaCuPItDe+bnuYKxrPsaTQZYqTFclhGeXNZnfGift/5hVbdJaq67x30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770669; c=relaxed/simple;
	bh=tYGCUxSH/diOKnynz1PhtWTSN3fRh4y3akr9yWAY04I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aAQY72pYiN6yCv7SvkgcXWPu8l/BAAZGy23zEiJDvhFcsg5dE1ku7nCVtrwnAkmQOGT4sZVXEKpRx/yFcbsscbPd4OWnEGz/xWGTxC+f6GBdagNrJ1H6Zs0bD3+2EiURY1mTAYdnQVfUEq7GK26rdDlMraM9B6RbZEpOCvphoko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWaG9Nso; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWaG9Nso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CD01F000E9;
	Wed, 26 Aug 2026 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787770663;
	bh=2yETj7ryTA9IUG5gLtQZvMB2cdpXBrvGZGytkcIfJyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KWaG9NsomqtdyKrNuCcJ1P22AZZI9GIHZWUElGGYY7HxSnsUnvfIB8olfRGcGG8kb
	 uD8Joxk5HgEVRNNbolxETAQlHgyoymRsmHo+1RJqREBqCMdxWXKUqgwh823qpNM0JS
	 KG362Mayq8mIrqgPJIGiZUkBA1kUBVmDQjxDQhRNvQEKSUEbZVFBVw4Hp8lLJfFMij
	 /8w73q3EgWJiElh9NnMH+PDpfqTMCWjH+q0zOYiloVPlm3Nt1fXVWb8rMPQt0Sw9JY
	 tYPq9TW0FgmgBqcQXzMEda0AO6qKp4Mpm0Hdp3BbJ6JKH9YIeA2/cWh9zNCh/szluj
	 dz+GFE96GRuqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (lm90) Reject channel 2 on chips with
 only one remote sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826184750.4798-3-flaviu.nistor@gmail.com>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-3-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 18:57:42 +0000
Message-Id: <20260826185743.58CD01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect format specifier '%d' used for 'u32' variable.
--

commit dbab4ee8e2d548c97ffd31b1a3d640af352905b1
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

hwmon: (lm90) Reject channel 2 on chips with only one remote sensor

This commit validates firmware channel definitions against chip capabilities
and returns -EINVAL when channel 2 is configured on devices with 1 remote
channel.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 1c603272538aa..3faeb2c6ab01b 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -2712,6 +2712,11 @@ static int lm90_probe_channel(struct i2c_client *c=
lient,
>  		return -EINVAL;
>  	}
> =20
> +	if (id =3D=3D 2 && !(data->flags & LM90_HAVE_TEMP3)) {
> +		dev_err(dev, "channel %d is not supported for this chip in %pfw\n", id=
, child);

[Severity: Low]
Does this code use the correct format specifier for the id variable?

While passing an unsigned 32-bit integer to a %d specifier works for small
values (since id is guaranteed to be exactly 2 on this path), it is
semantically incorrect for a u32 variable and violates format string
contracts, leading to potential compiler warnings (-Wformat).

Would it be better to use %u as the format specifier for a u32?

> +		return -EINVAL;
> +	}
> +
>  	err =3D fwnode_property_read_string(child, "label", &data->channel_labe=
l[id]);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826184750.4798=
-1-flaviu.nistor@gmail.com?part=3D2
