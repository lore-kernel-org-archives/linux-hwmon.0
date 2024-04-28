Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C20837C
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 04:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714278708; cv=none; b=rOoYI1bsQ4huk0iaqCi0PLyJrUOzADdR+/MFYdIikEZXpZGok3KnCUUL0+UhNlzPPMd/xQ5wIdG/HomaJsuF1YQbooTR6dQ3U2YGwJdktKw77CtNIYkgLzhpIcUYE9u7cIeOTYxF9SLNjwM7h54ete7S/cGMTSMWQLWZ4tbmj6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714278708; c=relaxed/simple;
	bh=UgnlHChC735UPXFYLf7RqN8cHbWVQxBDqDpy6NvyISU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rm3X0kUjdNDS2lqhqlUP3bdAck8d71Ul5wRzxvDg+b58BPhwgvo96ncKcUEhduAaaIFq+CYRX79g00IizkbL+vwMWN5XFNUGldvRSqsT4N2tH3PHd5PTewaRZcEwbCIho+YnQ3J9eIvqlPA1Bpws50ovYN1zdD0PnRisx9KYie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=N+whKkap; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="N+whKkap"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43S4VHw43502643
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 28 Apr 2024 14:31:17 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43S4VHw43502643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714278677; bh=60rj5Lc6yD4xaJ4cU63EK+IbO7LjhJDqZVo5J4Nn7p0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=N+whKkapsr4s1XC4geYO7BaDw2zw2dv5cCAgDZ1hZMAFvmEInbsiOxkgfxHaBPc/t
	 rQ2RrN3i4kAGUXI/I7doKFkWSbIhw0SuDJ+XXSVzXofnQAt5aAHeoYsOxzl2WH+R/J
	 cRALpBvrVBugxyAALMmOFAulDw8FcF9dCAgPMmr8BKl30v246belK6hXat07WlARxn
	 ACT9MHsFAbLa2EMsuBNvrTnnOx75Dnfp/g5wOV0VLjaDjxUs6l3ur+DRPo0re9OdfX
	 imRmwoq9bqyezTRcHJFw+H04OlLrxaiATR0YilIUHoH4MpC6FZNRhrdAVJgvQHk/CI
	 5DykmsZRXPzIw==
Message-ID: <cbc45f7c7b55471c3c1519340c5a087f3e7af1ea.camel@crawford.emu.id.au>
Subject: Re: [PATCH v2 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Date: Sun, 28 Apr 2024 14:31:17 +1000
In-Reply-To: <8382458d-2208-41ad-a0e5-dce77c1fc286@roeck-us.net>
References: <20240427083317.2077175-1-frank@crawford.emu.id.au>
	 <20240427083317.2077175-4-frank@crawford.emu.id.au>
	 <8d9c9f7d-8a6a-488d-814b-807060aa8336@roeck-us.net>
	 <0886c52480f15d3b9754d43642c722fcd9b6e722.camel@crawford.emu.id.au>
	 <8382458d-2208-41ad-a0e5-dce77c1fc286@roeck-us.net>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 28 Apr 2024 14:31:17 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean


On Sat, 2024-04-27 at 10:00 -0700, Guenter Roeck wrote:
> On 4/27/24 04:53, Frank Crawford wrote:
> > On Sat, 2024-04-27 at 04:11 -0700, Guenter Roeck wrote:
> > > On 4/27/24 01:33, Frank Crawford wrote:
> > ...
> > > > @@ -3144,7 +3186,7 @@ static int __init it87_find(int sioaddr,
> > > > unsigned short *address,
> > > > =A0=A0=A0 }
> > > > =A0=A0=20
> > > > =A0=A0 exit:
> > > > - superio_exit(sioaddr, config ? has_noconf(config) : false);
> > > > + superio_exit(sioaddr, opened && config &&
> > > > has_noconf(config));
> > >=20
> > > If 'opened' is false, this could be an affected chip. Are you
> > > sure
> > > that it makes sense to pass 'false' as parameter here in that
> > > case ?
> > > Doesn't that mean that the chip might be one of the affected
> > > chips,
> > > but the superio exit sequence would be executed anyway ?
> > > Am I missing something ?
> >=20
> > Ohh, you may be right, I think I have got myself confused here with
> > opened and how it is used in superio_exit.
> >=20
>=20
> It took me a while to understand as well. The double negation of the
> 'noentry' parameter makes it difficult to understand.
>=20
> > I think it should be !opened, but I will just check I still haven't
> > messed it up.
> >=20
>=20
> Maybe it should be something like
> =A0!config && !opened || /* no or unknown chip, not enabled */
> =A0config && has_noconf(config) /* chip known to be affected */
>=20
> which would translate "don't disable configuration mode for affected
> chips
> and for unknown chips if configuration mode was not enabled".

In fact, I think in this case that entire expression can be simplified
to just "!opened", as we only want to perform the exit code when the
entry code was given, and it is only set to true in those cases.

The only points where there is some "concern" is where it is an unknown
chipID, in which case we should not send the exit unless we previously
needed it to get a chipID (so probably a valid chip we don't know
about), or in the case of an error, which almost certainly means that
sending the code will have no effect, and is actually the same as
previously anyway.

>=20
> Btw, I think "enabled" might be a better variable name.

Yes, it probably is.  I'll rename the variable.

I'll send a new version of this patch with those updates.
>=20
> Thanks,
> Guenter

Regards
Frank
