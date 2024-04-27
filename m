Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CAA38DD3
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714211958; cv=none; b=oDa8gGgMsWvbH1ltsw21T9aGBTbKc0lG47IvqKsZpktcAAn6Hyq3gRK1SVN+MyN3A7/0PR/4Nt+nKzSMotjV4HpMHY2YPCiuGaoMKgjaa7HN/y35nq5cxXc4P3LSwRi6uzEMAuECYr60qf+zO5ljYmBn1fp5a/DTCkTRHF2+uKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714211958; c=relaxed/simple;
	bh=Eiidt9813FfhVTD6aoE1xn37kiI5VAqvG9mwFFOOD2M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sWInNnUkyv8JOCi2G6AOJyyVzQwf2KgMSeL8XX+EnolUHbnXMYpkOl6p/lWWxGp+gReWAR/H7w/NSJrlF/PuDgigfk6qzk4Awo3jBOmJFc22fwbtKuWyDSh0Q/LLz/C3UIBeF2+AN75zjc2pCV7fCRKXzJLrUP/r2oahYUtirkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=UOyZmUHs; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="UOyZmUHs"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43R9wmkO3032938
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 27 Apr 2024 19:58:49 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43R9wmkO3032938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714211929; bh=Eiidt9813FfhVTD6aoE1xn37kiI5VAqvG9mwFFOOD2M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UOyZmUHsSHSigegTbAkyMc43dZ1YObogvkonWroOflu1gbzPk3r9NxGbmI+BY+Sql
	 WhS6JOy4nBg4hQjccaOM59OAv0JYDZwTdV2Si9r4U7GkVdnV+h+nc4MJmW9M0hBNYu
	 xh3OlO+MHfWaw1sd4RaGpssNi4fLLesiQe48CZAvtZE8AOfGeG1OHUrJfjWbiCJCrq
	 Mm3N/H6OMMBama/Xw/LOgcEPdOnhckzPQjEQ7nhhOOiF/kU4bhvKSLLS4qD/tenLLg
	 kaPtBgjEy2aFE8N3FmrJIK75JdegDhjHsZ9czjLicSpk3uLRutlbccxdy9ij/F9inq
	 syAoKUDZ3fZgw==
Message-ID: <67469410c2cccaf993171bbfcae5b7f0de94d674.camel@crawford.emu.id.au>
Subject: Re: [PATCH v2 0/4] hwmon (it87): Correct handling for configuration
 mode
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Date: Sat, 27 Apr 2024 19:58:48 +1000
In-Reply-To: <20240427083317.2077175-1-frank@crawford.emu.id.au>
References: <20240427083317.2077175-1-frank@crawford.emu.id.au>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 27 Apr 2024 19:58:49 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On Sat, 2024-04-27 at 18:33 +1000, Frank Crawford wrote:
> On various Gigabyte boards, incorrectly entering configuration mode
> causes the second Super-IO chip to generate LPC bus access errors.
> This was preivously fixed by ensuring that the second chip receives
> the
> code to enter configuration mode before the first chip.
>=20
> On discussion with people who have access to the specification
> documents
> it was noted that this is wrong, and you should not enter or leave
> configuration mode for the second chip, as it is enable during
> initialisation and should not be changed.
>=20
> In particular, this was found to be the case on the Gigabyte X670E
> Aorus
> Master board, where it was reporting a totally wrong chip ID (0x8883)
> using the previous method.=A0 This was corrected by not entering
> configuration mode, and this has been found to still work with older
> boards.
>=20
> ---

Sorry, I forgot to add what the changes are since v1:

- renamed the feature to FEAT_NOCONF and macro to has_noconf.
- reworked patch descriptions to be more explicit about the actions and
remove any reference to the BIOS.

There is no code changes of any significance.

> Frank Crawford (4):
> =A0 Rename FEAT_CONF_NOEXIT to FEAT_NOCONF as more descriptive of
> requirement
> =A0 Do not enter configuration mode for some chiptypes
> =A0 Test for chipset before entering configuration mode
> =A0 Remove tests nolonger required
>=20
> =A0drivers/hwmon/it87.c | 127 +++++++++++++++++++++--------------------
> --
> =A01 file changed, 61 insertions(+), 66 deletions(-)
>=20
