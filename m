Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B741C79
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Apr 2024 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712916703; cv=none; b=jEv0u5cVh31KuN1XEXeNS5BfvXq+duWxzkiQAVI0QjBgPwQj12Qk8Gcpgw6UfEa3HkgeZsytLEJCAPPKC/F0XMp88Gf4ZmEiLKWiRrArtwSN5PX8XcG5H/mMlw0UgT3NbSE15Sxqt1/5Nb8j96/03wQMz0ItLXZNG7qf1Dbt1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712916703; c=relaxed/simple;
	bh=OEUfTmh2HUA6qtJBU3kyFu7/53z94QS3DODr5oz+A0Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sjlOoF2ai+c2jCG8BkN1ZATmusY31ak71NGlmRAanCmQMXxVHugJxp8jNse5DSiZcbx2J+bhLAnpkUSfqNI51oxiPjVpFrp7YlGsQTnZKdtN8UBDGZfZAbYXXXSIR8icSDbwEnOuuK4v6ZApzYTSwL82eAm9OIFXgCg4FUv09kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=RmT3VkBs; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="RmT3VkBs"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43CABBvj2286126
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 12 Apr 2024 20:11:11 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43CABBvj2286126
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1712916672; bh=1fMsPY0dJKRBp8TX+PUSrCJmLaY8Egg/n+4XZXYLkgY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RmT3VkBs0nq6ojH/y9zSi5rQklTWPhu0xGhs0M55mo19i1pAm5W/y4y7zM2KX6TF6
	 4CeQUG+8bMuNSQlZP42VfS3OLAb/sCwu/JexZqJt9AVGCIMsAn6bUYezYXMvTV94tS
	 okUxSoO6LTL569PhJaNarJCvWuMckfhlDydQ+UFaSzv0mAay1MTyV6iGLero/x8gH6
	 fQXyyopYOSowj1oKsYFPMyqOP2ojSMm7sx9bWc+HlrCNzLGgoo+VfRFTjJmMnnVC3A
	 WJykOE+PmN31Fil5tiVD1GnEGEYjykIvqtuhJI/BECqJeovPHPc4Vh2risV8XRfxLr
	 d8v+2vmtzCneA==
Message-ID: <7234a7e75e35c580a09f8952cd35a988e2f079cb.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date: Fri, 12 Apr 2024 20:11:11 +1000
In-Reply-To: <f9963bed-b669-4bdc-897c-3ca04d5162c0@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
	 <20240401025620.205068-4-frank@crawford.emu.id.au>
	 <0773b784-e552-4b31-b8c7-d68e058a2290@roeck-us.net>
	 <bfe6323c154ae4080a38a85e3601c7fe980dc10b.camel@crawford.emu.id.au>
	 <f9963bed-b669-4bdc-897c-3ca04d5162c0@roeck-us.net>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 12 Apr 2024 20:11:12 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On Thu, 2024-04-11 at 05:20 -0700, Guenter Roeck wrote:
> On Thu, Apr 11, 2024 at 09:08:19PM +1000, Frank Crawford wrote:
> > On Wed, 2024-04-10 at 08:17 -0700, Guenter Roeck wrote:
> > > On Mon, Apr 01, 2024 at 01:56:05PM +1100, Frank Crawford wrote:
> > > > Major part of the change for the new method to avoid chipset
> > > > issues.
> > > >=20
> > > > Perform an intial test if the chip ID can be read without
> > > > entering
> > > > configuration mode, if so, do not enter configuration mode and
> > > > continue
> > > > as is.
> > > >=20
> > > > If chip ID cannot be read, enter configuration mode, and
> > > > continue
> > > > with
> > > > previous code.
> > > >=20
> > > > Also update exit code to take account of if we entered
> > > > configuration
> > > > mode or not.
> > > >=20
> > >=20
> > > You describe the changes, but you don't describe the problem you
> > > are
> > > trying to solve. Even if configuration mode was already entered,
> > > that
> > > is not a reason to keep it active. We don't _know_ what is going
> > > on
> > > outside the driver and can not make assumptions. For changes like
> > > this
> > > you really need to explain the problem you are trying to solve,
> > > and
> > > the
> > > reasoning behind the changes. Just assuming that a set of chips
> > > would
> > > have its SIO mode enabled by the BIOS is just wrong. We don't
> > > know
> > > what if anything the BIOS is doing.
> >=20
> > In this regard, it is no different to the current code, which runs
> > SIO
> > mode enable, but does not ever run the SIO mode disable code.
> >=20
> > In fact this code is actually safer than the previous code in that
> > it
> > acts similar to the chip not being enabled or disabled, which would
> > happen if no driver existed.
>=20
> Not really. There is also the watchdog code which will happily
> disable
> SIO access after it is done, causing subsequent accesses by the hwmon
> driver to fail. The code also assumes that SIO access was not
> erroneously
> left enabled by some other code which we don't have any control over.

And unfortunately if I can't do anything about it, I can only ignore
it.  If something does come up we can see what can work out at the
time.
>=20
> You assume that the hwmon driver is the only driver accessing the
> chip.
> That is a wrong assumption. I understand that the underlying problem
> is really that there is no SIO access infrastructure in the kernel.
> In the absence of such an infrastructure we can not make any
> assumptions
> about SIO access control implemented by other drivers in the kernel,
> and specifically can not assume that SIO access won't be disabled by
> other drivers just because it was enabled when the hwmon driver probe
> function was running.

In this case the fact that it is the second chip may mean it will not
come up.  While I am told that the chip is fully functional with non-
hwmon functions, but currently it does look like most of those aren't
used.  While this won't necessarily stay this way in the future, we
currently cannot do anything about it.
>=20
> Guenter

Regards
Frank
