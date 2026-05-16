Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EE81F30A4
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 21:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778967413; cv=none; b=WQr9lvHBdPFJRFSS1GVyXKxGqFzn4VsKVPiBEbO6VXaqYFForKJOeI1u7kc1SNsJ9DRpRE+4izPvLDBJffgKgemc/6W4KKwFME/+2lzZ0SvywlZT9QPg1IQF38rgvwg0be+iKWtniS9Rz2pMiKvSkcw78UFEiqN4fGSqpSbwZUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778967413; c=relaxed/simple;
	bh=6JkT19hDe5XOclyoFiYWEi4XbHgrFYzhirJzGj/buKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8Nks9+fxqYWgrUSxMcSU1P85BSypsRfDIwfqlKt5BwueDHkJQP45Cgi7A4lf0umH0uGbZRHrbWS9jhKktNpww3RAViIO12L/xYgcj3zbIbffuolMILmk+IP8t7E+/Tq7v5ZbDIwArlodQItIrZ63qrqt5V8RYybF5zKGBTtnW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUSfquvP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUSfquvP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4E6C19425;
	Sat, 16 May 2026 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778967412;
	bh=6JkT19hDe5XOclyoFiYWEi4XbHgrFYzhirJzGj/buKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BUSfquvPdklN6Wp7aCWL8+Fhy/LRlvbP0Uq0MD0QzPrwyaZlhvmyN4KOR3HlVY5Ng
	 Q+cwUJ/AalEXj1W9sRoKUzvvkOaY90N1BoqZVP0Mbcr24FyjZbCEwHfKrzC4awRNhO
	 dnVyP4+Pyv+n3mgaEACSZNgXf6pA38Zpb1SmaCM0+Yvk4LdtwS3/sZg3xBtz8SSvYv
	 r1gNMCwOVd+OB6pijbDcmsBng6tWdo4g77JgLnsgJA3yWF4LVag9wFb35XKTmdHh1x
	 CoxuiiEVUV7KnAXSxUisRFRhWJ2bBPcogg+oyAqZOiFzbGa0quiAlNPu9gcvfzUrql
	 jsw4SIWr1M6+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adm1266) don't clobber GPIO bits
 before PDIO read in get_multiple
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516-adm1266-gpio-fixes-v1-2-38d9dd39b905@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v1-2-38d9dd39b905@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 21:36:51 +0000
Message-Id: <20260516213652.BC4E6C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The GPIO attribute callback performs I2C bus operations without ac=
quiring the required hardware monitoring subsystem lock.
--

commit d1b12bbfe7f9af4177e43676d5e90231b39df296
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_mult=
iple

This commit removes a redundant clearing of the bitmask in the GPIO
get_multiple callback, ensuring that both GPIO and PDIO bits are preserved
in the result.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 11f9a44f4361a..4dd67c02b412e 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -210,7 +210,6 @@ static int adm1266_gpio_get_multiple(struct gpio_chip=
 *chip, unsigned long *mask

Does this GPIO attribute callback need to acquire the hardware monitoring
subsystem lock?

The hardware monitoring subsystem guidelines require that drivers implement
locking for attributes registered outside the core, to serialize with therm=
al
and sysfs operations.

Looking at adm1266_gpio_get_multiple(), it issues i2c_smbus_read_block_data=
()
without acquiring a lock. Could this cause a race condition against concurr=
ent
PMBus accesses from the core?

> =20
>  	status =3D read_buf[0] + (read_buf[1] << 8);
> =20
> -	*bits =3D 0;
>  	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR)=
 {
>  		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
>  			set_bit(gpio_nr, bits);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-adm1266-gp=
io-fixes-v1-0-38d9dd39b905@nexthop.ai?part=3D2
