Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DF58C15
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Apr 2024 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712998086; cv=none; b=Z11OWs6MjE4Kp4dESNAl077I5y8fd3EJ0GNdrxtV30vMrweroi/fT/sbo2zkemPem2xcU5CLN+IpU3n5AdP4ZSiGPhZ1L+rvnogpzG1eF/37amK7gEf9G2yxVgNscLhCU48jQhkjIa33NUdTIWUNmRo94yWt8Ge9cSC7DTiwKhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712998086; c=relaxed/simple;
	bh=lTxltq6WqMGnQwcID2A4FCHulYsljImQG8UdSk3BQz4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eKMQSW4yEAtXaYi0lxzVRSXdEHwUmBAlcc0ApDCWnjXiDJCtS2hMoULiPnhfkx3uReUntyUTgwIjbG4rEYfqwPtB8XQfJWJy+y3ylieRQqErlWxtpjfOtQona/PuByVpZ0INzThcSfgdn+vc8Ut/Drdz1anFZvaYpyV3anxjKMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=fL82ms4u; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="fL82ms4u"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43D8lTpk2747950
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 13 Apr 2024 18:47:29 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43D8lTpk2747950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1712998049; bh=3U09zviF2FKeGVDUvx7+cwoLgphXdGcAP4+n3/H80MI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fL82ms4uhqSFBna6o2lEgzVIpo2Vg4r5DSpAnysfDIYcQnxofAqk6WKW9pp2/Sx9/
	 hornG8q4ZsLv3Qk72Vu4xsbs8YNpnzLopsA/zAgBy3JD6pYBER+gLyqYQnCmzTyNeO
	 pUe45b8R2+/8XMDIaxilL4xxZZDyV3irP4jQMVFe3Y0rC2CwL0AAT8GpHwFvXDO8PN
	 v2+3VI6OElB2qnYQuy1QtBEtIw1xfzdLphiqAm9lGqg25LVDVCtdONDvkANWm+LTrv
	 IAC5RKNamoUob/Q2RMKymtAjySmJ9oXHHEGEhIMBx2Br9tuqQVBKAQlnzhYGmA2ivg
	 bXz3S9sH/l5sw==
Message-ID: <3e29a0238b6cfae2945495593b05c782793a3734.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date: Sat, 13 Apr 2024 18:47:29 +1000
In-Reply-To: <78ef79b3-e5de-4b73-8588-1d29ca4dcda1@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
	 <20240401025620.205068-4-frank@crawford.emu.id.au>
	 <0773b784-e552-4b31-b8c7-d68e058a2290@roeck-us.net>
	 <bfe6323c154ae4080a38a85e3601c7fe980dc10b.camel@crawford.emu.id.au>
	 <f9963bed-b669-4bdc-897c-3ca04d5162c0@roeck-us.net>
	 <7234a7e75e35c580a09f8952cd35a988e2f079cb.camel@crawford.emu.id.au>
	 <78ef79b3-e5de-4b73-8588-1d29ca4dcda1@roeck-us.net>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 13 Apr 2024 18:47:29 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On Fri, 2024-04-12 at 05:48 -0700, Guenter Roeck wrote:
> On Fri, Apr 12, 2024 at 08:11:11PM +1000, Frank Crawford wrote:
> > >=20
> > > Not really. There is also the watchdog code which will happily
> > > disable
> > > SIO access after it is done, causing subsequent accesses by the
> > > hwmon
> > > driver to fail. The code also assumes that SIO access was not
> > > erroneously
> > > left enabled by some other code which we don't have any control
> > > over.
> >=20
> > And unfortunately if I can't do anything about it, I can only
> > ignore
> > it.=A0 If something does come up we can see what can work out at the
> > time.
> > >=20
> > > You assume that the hwmon driver is the only driver accessing the
> > > chip.
> > > That is a wrong assumption. I understand that the underlying
> > > problem
> > > is really that there is no SIO access infrastructure in the
> > > kernel.
> > > In the absence of such an infrastructure we can not make any
> > > assumptions
> > > about SIO access control implemented by other drivers in the
> > > kernel,
> > > and specifically can not assume that SIO access won't be disabled
> > > by
> > > other drivers just because it was enabled when the hwmon driver
> > > probe
> > > function was running.
> >=20
> > In this case the fact that it is the second chip may mean it will
> > not
> > come up.=A0 While I am told that the chip is fully functional with
> > non-
> > hwmon functions, but currently it does look like most of those
> > aren't
> > used.=A0 While this won't necessarily stay this way in the future, we
> > currently cannot do anything about it.
>=20
> This patch affects all chips, not just the second one. If any chip is
> in configuration mode when instantiating this driver, configuration
> mode
> won't be enabled anymore, no matter what other drivers may or may not
> do.
> That includes situations where other drivers (or the BIOS)
> erroneously
> do not disable configuration mode.
>=20
> I understand your reasoning about not enabling configuration mode for
> certain chips, but that does not explain why it would be necessary
> to do this for all chips all the time.
>=20
> Sure, there is something we can do: Unless there is a known problem
> that affects _all_ chips, drop this patch.

Ahh, if that is the impression you have from my description, then I
will need to improve it, as that is not the case.

The actual update does the following:

1) Lock the memory, but does not perform a SIO entry (previously it
would have performed an SIO entry).

2) Attempt to read the chipID.  This should be safe no matter which
chip we have.

3) If step (2) fails, then perform SIO entry and retry chipID read.  If
it fails, act similarly to prior to this patch.

4) Set the sio_data->type, similar to previously.

5) If we have not performed an SIO entry, and this is not a chip type
with the NOCONF feature, then it will perform an SIO entry at this
point.

6) Proceed setup as prior to this patch.

7) Any following access to the SIO registers will invoke the SIO entry
and SIO exit steps unless it is a chip with the NOCONF feature set.=20
This was set up in the previous patches in this patchset.

8) There is also some minor update to the failure exit based on if it
had performed a SIO entry or not, in addition to the previous tests.

>=20
> Thanks,
> Guenter

Regards
Frank

