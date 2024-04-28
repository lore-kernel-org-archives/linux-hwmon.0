Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0E12AE95
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 07:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714289752; cv=none; b=lt5tyRyhcdeiHKncwBLBvJiWneU/xaTVl8YgkbZp/r5yeerGBqgNOm4Wrv0bPG3Ca2O3RNpx6nRYAlGfq7NKtF0WT+UP3BKNNr9/MzmRWAZM6hz0VxoTYmqDmXfMVvZDplvPtOgJmglE10ckS5fGbg/ujutLHSR1g3wAvjnNeKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714289752; c=relaxed/simple;
	bh=By4kAc/yiE07CGrbXwFrycrRozsUafIM94w8Sn0dypU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R1+ZA8n7U1YK/KEkemNqcPPuvlkKjENZipWPksuqnpPs8CYIyFltKbqi2Xpdb831albH3n797kavPl6pOf65vsyBILqkh/MXL2yZkfhqFCgW51RKFijodv1cjUwbyxuubyG9SlzfpPtAjCyOebfwudUwWJw/2XT1p95tVHM2Rok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=Uj/zdjT4; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="Uj/zdjT4"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43S7ZOso3545667
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 28 Apr 2024 17:35:24 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43S7ZOso3545667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714289724; bh=zRkzwMCcr4MzAc1yr9y5U826f5lxBhvZ7YdFzM/TL2o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Uj/zdjT40tR/h2DWy6unD6erBURzW28q5sA+XBSLsS0OS1Os0NZTLY85MbyUZPzh8
	 8qt84FRxVWuRM7/4s00LoUXHreXoNNJSaSoZA2UA2nRH6aGFVpeu24podF3ZnDWrJL
	 G4MIig9tH1LHxFCD5BV6c/hp1BFUThzhfWwsKNuBu89o6kRHBe42smS4RnEAPxpV/r
	 UB4uYFyLBMqjG5UoUuvSPk8ECpo4ngYnSS9Ior1rKq63/XSIjFse5qeAJBlw69x1mL
	 7vcPBONQ5yhAFkwiTtxhuOLFbogeVa/SdiObrQojVajU9dV9oS+KHFtzvmiSuNZLn7
	 VxztQeXzIFhXQ==
Message-ID: <f155d740ff3def717c16d8a215359479a9fb6526.camel@crawford.emu.id.au>
Subject: Re: [PATCH v2 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Date: Sun, 28 Apr 2024 17:35:24 +1000
In-Reply-To: <46cd36bc-83f1-4d4e-ac1d-1524882e9b52@roeck-us.net>
References: <20240427083317.2077175-1-frank@crawford.emu.id.au>
	 <20240427083317.2077175-4-frank@crawford.emu.id.au>
	 <8d9c9f7d-8a6a-488d-814b-807060aa8336@roeck-us.net>
	 <0886c52480f15d3b9754d43642c722fcd9b6e722.camel@crawford.emu.id.au>
	 <8382458d-2208-41ad-a0e5-dce77c1fc286@roeck-us.net>
	 <cbc45f7c7b55471c3c1519340c5a087f3e7af1ea.camel@crawford.emu.id.au>
	 <46cd36bc-83f1-4d4e-ac1d-1524882e9b52@roeck-us.net>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 28 Apr 2024 17:35:24 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On Sun, 2024-04-28 at 00:03 -0700, Guenter Roeck wrote:
> On 4/27/24 21:31, Frank Crawford wrote:
...
> > In fact, I think in this case that entire expression can be
> > simplified
> > to just "!opened", as we only want to perform the exit code when
> > the
> > entry code was given, and it is only set to true in those cases.
> >=20
>=20
> Not really, because it is at least theoretically possible that it was
> necessary to enter configuration mode to determine that the chip
> is one of the broken ones. I'll leave that up to you to make the
> call,
> though.

I guess it is theoretically possible, if some other driver has done
something, but as well I guess this patch is different in that it
doesn't do the second chip first, and so is still different.

However, in the only chipset we have been able to reliably lock up
lately we haven't been able to read the chipID even after trying to
enter configuration mode, when we have locked up the chip, so I don't
think this issue will actually happen in practice.

I will still try to get hold of the configuration documentation, to see
any additional notes from the vendor.  I don't expect that soon though.
>=20
> Guenter

Regards
Frank
