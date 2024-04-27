Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75D4C3CD
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714218851; cv=none; b=ZWqUX1dSZQ8QgQHtQ98N4C4O2uuMRxmxzp7XNhpHH04x0U6xg9r7f73QDQ66GOMt3KSf0A3Thn9/vLraBrNEWIwhr2BLQD7ws/f86ZZBQo9Mv40mpH1PK3uOO6G8HcmZVAwaKg/4UsW1itjz4rut+C4lyeqQ1EARe/rXVf97nHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714218851; c=relaxed/simple;
	bh=on4MWmG8SEsvS2k/1kgqd4GfBtP2qNS4kdnWu/fvgAk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RPMqtg1uSCS1LfjgpqljmM+Itu4YMz+NJQ62ZFqBxGeNXIr2PIhNCNkA1/xxRxK2rRjDXok6nIdAu6S57IWYeBUAsHq/rMFaXspu2B6WAfHDcyy1EaJKcPV8D2unMP56vU1T5zhDU0x5ABOtcmsKCCtsBxHoPa8fVgGG4jN4zEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=MDy8e3wA; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="MDy8e3wA"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43RBrh7x3058078
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 27 Apr 2024 21:53:43 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43RBrh7x3058078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714218823; bh=on4MWmG8SEsvS2k/1kgqd4GfBtP2qNS4kdnWu/fvgAk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MDy8e3wAXPl5uLwBsGE49AkznH4Z37qa6PDZW0WWWvvPJOJeLAbjjohjeKnJChK1b
	 rcUq7IBh3pGRdzJXnNxz5gn7Geu7eaR77/73U57k860/ZLGWn8N4naWs22GTZSrnA8
	 7tnTeJAkzyjI8LV17bPmW6C0/2T9eUK2ayL3F/UyEHTk2DkuLEGAc4YiuyLjx3JEpx
	 xKOBfnuLWIEOFqcQmSyoEu2/mTxGY5UMldvW+V/gEtYBxueM3l+BYgz88qmP/N+K8C
	 r1537E6zjX3XXoQ3BwiwteMtdMVOH3xtsnR7/McMfFBR8pn1E+GpxJYyAc2ODXqyK/
	 ETrdeEDUnto/w==
Message-ID: <0886c52480f15d3b9754d43642c722fcd9b6e722.camel@crawford.emu.id.au>
Subject: Re: [PATCH v2 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Date: Sat, 27 Apr 2024 21:53:43 +1000
In-Reply-To: <8d9c9f7d-8a6a-488d-814b-807060aa8336@roeck-us.net>
References: <20240427083317.2077175-1-frank@crawford.emu.id.au>
	 <20240427083317.2077175-4-frank@crawford.emu.id.au>
	 <8d9c9f7d-8a6a-488d-814b-807060aa8336@roeck-us.net>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 27 Apr 2024 21:53:43 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On Sat, 2024-04-27 at 04:11 -0700, Guenter Roeck wrote:
> On 4/27/24 01:33, Frank Crawford wrote:
...
> > @@ -3144,7 +3186,7 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0=A0 }
> > =A0=20
> > =A0 exit:
> > - superio_exit(sioaddr, config ? has_noconf(config) : false);
> > + superio_exit(sioaddr, opened && config && has_noconf(config));
>=20
> If 'opened' is false, this could be an affected chip. Are you sure
> that it makes sense to pass 'false' as parameter here in that case ?
> Doesn't that mean that the chip might be one of the affected chips,
> but the superio exit sequence would be executed anyway ?
> Am I missing something ?

Ohh, you may be right, I think I have got myself confused here with
opened and how it is used in superio_exit.

I think it should be !opened, but I will just check I still haven't
messed it up.

>=20
> Guenter

Thanks
Frank
