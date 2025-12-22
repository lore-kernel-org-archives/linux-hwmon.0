Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6D29B783;
	Mon, 22 Dec 2025 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406967; cv=none; b=eJkYgrDfaZE4afhGC+vT7tP77eh4F3XqhTYDHKTus9fs4Di/ayriiqGVpmzMYK9pb+o0XerhTEJxnXqoXuqUeiOmuGCZuF8suFooWciHU6dcDWEajadhujoY6Y9wOIJGGJwbIsjjmSg2WnI43U0Ge+IXKnQxtbXYwuhi53KFpAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406967; c=relaxed/simple;
	bh=nIH+NsXa4+h7nGBSaebOmJMrEPvMQfPemgMYnq2c5K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P27IfqrnUeZyMmscxNB5dW8iCdUF/nD9ypcpHjxDTCmJpsJMjqpLQOki0AWQl9BvQUcwhQWWWiWAqkqmiMyX4cXZD8+/TsepqKELpMLBGHqRPDsOVutTOTUGOtbi0+GR1NgtSYtrz5tYXQmWYPaCC3J89bhFajkNMTsIkL4jIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTBzU4Az; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTBzU4Az"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95E5C4AF09;
	Mon, 22 Dec 2025 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406967;
	bh=nIH+NsXa4+h7nGBSaebOmJMrEPvMQfPemgMYnq2c5K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qTBzU4AzMXAeQTGZeGkwxZrYYqzUyChWzDSHi9PKwc1tXmZo4wrlxTT9e7id1DfNt
	 CBWtzTrvEHxs64c2wqoqqyUwCR0FOE1Vu1cAzmMlWRTDD2Nv3vZlnD0qEtoLH6D/At
	 jIwHCVQbGCdkd/d1xA2TYywwyqbtltETaZR3Z4sTGbqzUW2JPIKUYLxdG53OXFSGt9
	 etghbKy3BGy4HOSJXL/R2E8izdvX8EeHgVfk6548cBXos7KA2/9eRSUQIrtsOUwAss
	 yAvpQWiCGh9QTt6p14ajU78tWx+Eoqb6ovhnRWHi6nrfPQmoTHjd0HFdY1jgkXOlFP
	 1hiytBYlB6nPw==
Date: Mon, 22 Dec 2025 12:36:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: Add TPS65185 driver
Message-ID: <84fdaf7c-4d4b-491f-975c-ebb14350fafd@sirena.org.uk>
References: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
 <20251222-tps65185-submit-v1-2-34986b504d5f@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iQ7ovkCqm/hmlKcA"
Content-Disposition: inline
In-Reply-To: <20251222-tps65185-submit-v1-2-34986b504d5f@kemnade.info>
X-Cookie: Be different: conform.


--iQ7ovkCqm/hmlKcA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 22, 2025 at 01:18:31PM +0100, Andreas Kemnade wrote:

> Add a driver for the TPS65185 regulator. Implement handling of the various
> gpio pins. Because the PWRUP (=enable) pin functionality can be achieved
> by just using two bits instead, just ensure that it is set to a stable
> value.

The reason for having GPIO controlled enables on devices with register
maps is that it's generally substantially faster to update a GPIO than
to do I2C I/O.

> +static bool tps65185_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case TPS65185_REG_TMST_VALUE:
> +	case TPS65185_REG_ENABLE:

Why is the enable register volatile?  I can't see anything in the
datasheet that suggests that it should be.

> +static int tps65185_runtime_suspend(struct device *dev)
> +{

Implementing runtime suspend in a regulator is *very* non-idiomatic and
is leading to large amounts of open coding throughout the driver.
What's the story here?  I'm very surprised that this wasn't in the
changelog.

+       if (data->wakeup_gpio) {
+               ret = gpiod_set_value_cansleep(data->wakeup_gpio, 0);
+               if (ret)
+                       return ret;
+       }

This would usually be used for system suspend.

+       if (data->vin_reg) {
+               ret = regulator_disable(data->vin_reg);
+               if (ret)
+                       goto reenable_wkup;
+       }

Can the device really operate without power?

> +static irqreturn_t tps65185_irq_thread(int irq, void *dev_id)
> +{
> +	struct tps65185_data *data = dev_id;
> +	unsigned int int_status_1, int_status_2;
> +	int ret;
> +
> +	/* read both status to have irq cleared */
> +	regmap_read(data->regmap, TPS65185_REG_INT1, &int_status_1);
> +
> +	ret = regmap_read(data->regmap, TPS65185_REG_INT2, &int_status_2);
> +	if (!ret) {
> +		if (int_status_2 & BIT(0))
> +			complete(&data->tmst_completion);
> +	}
> +
> +	dev_dbg(data->dev, "irq status %02x %02x\n", int_status_1, int_status_2);
> +
> +	return IRQ_HANDLED;
> +}

This unconditionally reports an interrupt even if none was detected.

--iQ7ovkCqm/hmlKcA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlJOzIACgkQJNaLcl1U
h9BdWAf/aaJAXtASiig1NF1BNU+vIdzE+WjHcRuV9fbXIdqaPlscqCQQz9OVUTzK
b/+kwtQefZQKYS6kxJOdIWFBVV978V5gx5GXqqJ+FjZNnwf9/GDqu2AS0InrE93H
l6LoR3wyrn7mpR/ohN4lnoMsBKNMAB00U7VGIt2r1NYwVBbsa2UCIpON7H50dfiA
aFwfBYFhYlb9LJsdRxBb+hIwHB/88sBi5v5DNtmbi2p5xXZb8xdQADo5rWpwk/5h
aPCxTS90+pZN/ewXLj6JiytyjBRlHWvtFpXRDYhma/WbNPcb4icLT+5G+YkomZKO
rusEDsvtcpLvnWnURo6GEs7a9NYF0A==
=KpCb
-----END PGP SIGNATURE-----

--iQ7ovkCqm/hmlKcA--
