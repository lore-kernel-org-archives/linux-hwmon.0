Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6951474AB
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2024 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712833728; cv=none; b=V6N2Rg5zfnMeOeMgRrIdcWBm53CrhBnMr6t4ebwM8EHWhEsTQDilOHngqDxO5RyfBx8ZJMvDzfZ3Y0z8oBUD1dRC04unNAzYhaxNHaZ5Qh+xMzvZwGzVNz1rQ4giGjU0cjGNVCIXA8DO3EPfHx3C0q3WIFChuGeqljGvGXQh9cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712833728; c=relaxed/simple;
	bh=Ko/1Fn8s8xViwzpIipi/UhrPWNn65EOnR9UOEWh0fFM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XV7sWhRBbubPPuBP+NBOOhj7LV+rVmgLBVmFtXemyxXU9s3JwJJy0hfZuANPhyUMSa4MuoCde7/umBAD1/10RowfY701nDQdn2QjfDceEkzo6SfrWhhx33kTUqQAb7B0oQsnVC0m2NT/maPRd6LaSGrr9f9sDT6CT1A7voJWhfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=h9AxNDXv; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="h9AxNDXv"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43BB8JXc1804533
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 11 Apr 2024 21:08:19 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43BB8JXc1804533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1712833699; bh=Ko/1Fn8s8xViwzpIipi/UhrPWNn65EOnR9UOEWh0fFM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=h9AxNDXvnQwqDzP2Lt7c8kiTlPq6c9PiERG6rofuu6FpKlYPAf7i6BOOEOLtUPxd+
	 8lGhGZV8i/fHDKvxE/B98YYX0odY2MT5vbSbZFi3adwUydDa5KXlZrUtu0a4lBsj2/
	 1rdPW8PH4RNaDLXwBIfP25ZBQnyfcJWc0vF04t93vU3ftkKtkyHAwJRL3Em6UCA/Jt
	 W2GikakmDVm75UeS2hmCpK4z1/p1jnAzTy6Ih1KcVzXJLTJ7rewmKNtX5BoGV0lnCz
	 yt7aV+/BHNQyG5NAcbK8r6p+BiwutFsRZbwdWlplzE33YMXaeo9Lbl5fvr7xBGyDxQ
	 QEvz6MNUB+Bkw==
Message-ID: <bfe6323c154ae4080a38a85e3601c7fe980dc10b.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date: Thu, 11 Apr 2024 21:08:19 +1000
In-Reply-To: <0773b784-e552-4b31-b8c7-d68e058a2290@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
	 <20240401025620.205068-4-frank@crawford.emu.id.au>
	 <0773b784-e552-4b31-b8c7-d68e058a2290@roeck-us.net>
Autocrypt: addr=frank@crawford.emu.id.au; prefer-encrypt=mutual;
 keydata=mQGiBD+o6joRBADBLtTRHGwkCHLbpC5qU/cJL0mHf8wDGcoiy9jSlPHrlTp8qGyxBOsus917W0fd9tm1RPRdcYffVFRqdduxBwPdpXi7vTWZgNG5CS39IXw6V//oO1hi7swPm3bNjszq3D1TxVpIpK3EuL4oNcgweLJftXuPP30Mi0gbRgMSyn9SOwCgzc/nZ4i9iPEq7Jhyu+MptuFzNqsEAJPZYUk0MDmXrJjzvcydHoOePqxp9VIqxLOf1gqxy8wXg9D9R3oTAXh94ekLkIN+GimKdB0oCZu02PF9wDnJlQqOtk0Fz4hCetwsNNBsFdbSY7gfmIEByqHE4MicQnTl97JOV/4XQgovznJJKv4OiCC6n20aIPFe2OcKHsi4NlxIA/9lKO2a4ge8f6a6sQoHgrjBe0SQJ0RimXqVUKAxac2wKeDe62J8RJhDJ+Ghnm29w5kKb3YHr2muVJEVqHxz3VYqGXG4T+tleG6T8yeic3HbTghC6+o3HYXOJchGfciIw52S08xO0w4eowNznlS5i8td+aroFF7JiomZqnmyD6oqSbQpRnJhbmsgQ3Jhd2ZvcmQgPGZyYW5rQGNyYXdmb3JkLmVtdS5pZC5hdT6IeQQTEQIAOQIXgAIeBxYhBAPV1JdGtb85KnTrWEWq0knseWomBQJigar6BQsJCAcCAyICAQYVCgkICwIEFgIDAQAKCRBFqtJJ7HlqJqFLAJ9OZPRJxlFHCfDJ6iCL8i4IpINeuACgw1znVGjRZpfNx+YRELbLYdLvZKW5AQ0EP6jqPBAEANwthQvVRnrGQBCGCXBFZ6Dum/aQWXzEovvipgLH0MrVNJy3605GJt+aLGjnzPNvhjvCYGmNtdksqPQqsg8VnE/DgvQFJr+OX/q9IWnZhzEaZ4t6Itvqv9DhtVk6tX6XUgxkBVTX0mQOSwFIPRG+XgSve9dv6xgSRTeAjXRxzbrHAAQLBAC0atcs!
 Itf9FthDk
	6XJg9ZXtsXDctsVgV1BuSSDP/iynoMozuGpbqMkGXugBGqPmNOMHXw+XALd4yQ2/rPrznK5VFyaCupqzCgWtKfQ1zMczHUb9JvFCweP7I8ZbP2oXCvlHBySzGjVJVCNPxCYLQi0qriLv0aXmWIkHBLCpybDqYhdBBgRAgAdFiEEA9XUl0a1vzkqdOtYRarSSex5aiYFAmKBqYQACgkQRarSSex5aiYz/gCfUNAXafSyBey6z61HSG7l16anYfcAoKsrBxj7bE73wsjzjywqOWkJ9hjJ
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 11 Apr 2024 21:08:19 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On Wed, 2024-04-10 at 08:17 -0700, Guenter Roeck wrote:
> On Mon, Apr 01, 2024 at 01:56:05PM +1100, Frank Crawford wrote:
> > Major part of the change for the new method to avoid chipset
> > issues.
> >=20
> > Perform an intial test if the chip ID can be read without entering
> > configuration mode, if so, do not enter configuration mode and
> > continue
> > as is.
> >=20
> > If chip ID cannot be read, enter configuration mode, and continue
> > with
> > previous code.
> >=20
> > Also update exit code to take account of if we entered
> > configuration
> > mode or not.
> >=20
>=20
> You describe the changes, but you don't describe the problem you are
> trying to solve. Even if configuration mode was already entered, that
> is not a reason to keep it active. We don't _know_ what is going on
> outside the driver and can not make assumptions. For changes like
> this
> you really need to explain the problem you are trying to solve, and
> the
> reasoning behind the changes. Just assuming that a set of chips would
> have its SIO mode enabled by the BIOS is just wrong. We don't know
> what if anything the BIOS is doing.

In this regard, it is no different to the current code, which runs SIO
mode enable, but does not ever run the SIO mode disable code.

In fact this code is actually safer than the previous code in that it
acts similar to the chip not being enabled or disabled, which would
happen if no driver existed.
>=20
> Guenter
>=20
Regards
Frank
