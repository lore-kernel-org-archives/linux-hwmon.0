Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D47535B8
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Apr 2024 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712917253; cv=none; b=SRs/2E2w6WW8aynfgnPPAS7vQL0kM3XOuWaniD4eHEe5T72562DDEZn45H4lL1bOcRCOI/YJPwXJGbBBRU7DElTY3N0k11+fbTU+Zd3crqXH4wa4V9cNjRRL0lcu83G1GDewPtzrLgsIbuPAnp870jqFXR8Fj+QgkEWxdTEtd5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712917253; c=relaxed/simple;
	bh=Io5tI6OiRDDkr/EzQb883ru68dRwUaZ9GmB0LWo67b8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JXMaGrHlfE7QOU/klpomaU9dScrVjLfhzYDHmqKfSobHBJJWvA0QoTpqvmq5AZjutX3vcsCk8tiiDVETVTcVxn0nZM3jaDPi8N/pOgDSnjI1JLT83YT9la76P1Wve/n7XB/Arp+31jVeAxKGpbEgj/tOOvLAupcCsoj1JL0kiP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=eQOR3FZY; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="eQOR3FZY"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43CAKQ8i2287908
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 12 Apr 2024 20:20:26 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43CAKQ8i2287908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1712917227; bh=Io5tI6OiRDDkr/EzQb883ru68dRwUaZ9GmB0LWo67b8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eQOR3FZYspSzRCZEHVWWBzK6cBtQT+IhN+rGJaoxvP8wMAZTI8M9EFKT//Eg8F2Go
	 5fz8HxNflRzSZ4PAEMabt8m0k1YHgfgSEwqTcRLkrmLrcKRGQi+Ut2vqd38E8dXxrV
	 c0L1hW6GasebJEh+YXAJ0q+ybwMfUHW8AF9KUE9ILzYv+NCAV937qEaqqsqPS5wN8s
	 UuOzsammLkQOdDL1zCpkqQUqHdh7zqhztoyv3Q2J/hP/XZ6BsbkekDB634A6zuX/GC
	 2RM0ce3UgvS6IEqNcc/dnlEd2PG3z+12f6qzg9gt+MNs9Y6XHlQpP2HrrGZc4zfqlc
	 GHsXPqHiHafmA==
Message-ID: <af375a4a39a3b9e20aac4cebe5c3ffd81e4537d6.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 1/4] hwmon (it87): Rename NOEXIT to BIOSOPEN as more
 descriptive of requirement
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date: Fri, 12 Apr 2024 20:20:26 +1000
In-Reply-To: <4b3c04f8-49eb-436b-b5ed-0ade6f1d48a1@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
	 <20240401025620.205068-2-frank@crawford.emu.id.au>
	 <f4efa185-7312-4116-a843-a6d7e0c22c79@roeck-us.net>
	 <c3c69b27c61702b50f99f866c30f91f44ca23945.camel@crawford.emu.id.au>
	 <4b3c04f8-49eb-436b-b5ed-0ade6f1d48a1@roeck-us.net>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 12 Apr 2024 20:20:27 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On Thu, 2024-04-11 at 05:31 -0700, Guenter Roeck wrote:
> On Thu, Apr 11, 2024 at 09:03:06PM +1000, Frank Crawford wrote:
> > On Wed, 2024-04-10 at 08:10 -0700, Guenter Roeck wrote:
> > > On Mon, Apr 01, 2024 at 01:56:03PM +1100, Frank Crawford wrote:
> > > > Rename previous definitions to match the new information that
> > > > they
> > > > are
> > > > preinitialised by the BIOS and should not receive codes to
> > > > enter or
> > > > exit
> > > > configuration mode.
> > > >=20
> > >=20
> > > That is wrong. NOEXIT is needed for broken chips where two chips
> > > are
> > > on the
> > > sio bus, and disabling sio access on the broken chip results in
> > > sio
> > > access
> > > errors. The description is also wrong, because SIO mode still
> > > needs
> > > to be
> > > _entered_.
> >=20
> > As noted in the patch group write up, this change has come from the
> > technical specifications for the chips not for the board.=A0 If by
> > SIO
> > mode you mean the sequence "0x87,0x01,0x55,0xAA" then it should not
> > be
> > used for these chips according to people with access to the
> > specification documents.
> >=20
> > Unfortunately, I don't have direct access to these documents, so
> > cannot
> > quote the full description.
> >=20
> > Now, the macro name may not be the best (BIOSOPEN), and I'm happy
> > to
> > change it to something better, but the current name of "NOEXIT" is
> > also
> > wrong.
> >=20
> > However, for the chips that this relates to, and are defined to use
> > in
> > the it87_devices structure, you can access the chip details without
> > the
> > the superio_enter sequence, as that is specifically the read that
> > occurs to find the chipID, and I have tested it on a number of
> > different chips, both of this type and older ones that do need the
> > entry sequence.
> >=20
> > What makes this a little more difficult is that the chips that it
> > affects also only ever appears to be the second chip on the bus,
> > which
> > may be by design, or just current usage.
> >=20
> > I will add that the use of enter sequence has been confirmed to
> > fail
> > and cause the exact chip lockup concerned about on the Gigabyte
> > X670E
> > Aorus Master board.=A0 While you may say that we should only do this
> > for
> > that board, the information I have received is that it is cause by
> > incorrect access to those chipIDs, not board specific.
>=20
> It looks like you fund a better source of support than me. All I ever
> got was "we do not support Linux".

Yes, although they do have a commercial arrangement with Gigabyte, so
they cannot release too much specific information without risking their
agreement.
>=20
> Anyway, please find a better term than BIOSOPEN. I don't really care
> too much what it is as long as it doesn't suggest to be related to
> something that it isn't. FEAT_NOCONF or something similar might do.

Okay, I will update the macro name and work on making the descriptions
better, and then submit an updated patch set.
>=20
> > >=20
> > > Also, a BIOS open mode, if it indeed exists, would have to be be
> > > board
> > > specific, not chip specific.
> >=20
> > Now here my description may be wrong in it being BIOS related, but
> > rather it is specifically the chip initialisation, but the details
> > on
> > access came from the chip specifications.
>=20
> Well, again, BIOS suggests that the BIOS is involved, which would
> make
> it board specific.

Yes, I'll correct that issue in the description.
>=20
> Thanks,
> Guenter

Regards
Frank
