Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57EC44C50F
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986257; cv=none; b=cbTlFwxRJv6mSwyPK9cADDqOVsn5joOEkvqfMEDTWBHJet8JTbeMtPDsXsho4/GtyNdapIMmqcuorWXPFLm92iC7UnafMCBc9945SyqohtQ59YUNqWB+aqkwgvXCS8u5W64g1l6lxrHQdgZF46156qyV21lwNjwRVKlbpjrRJQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986257; c=relaxed/simple;
	bh=w7vuzUxgvn7FuBavqC5VDuuNUy7Z1XurV0odL82RbSw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fyAPSJ6R7FMyDzDerwmsBEpsKvcBREYTbIrAnfVrd/TsaOg1ul/COFkQhqVgoiNUpsMVlEPTbNtIUIzwFKGeMAQD3u18n7ldqFRjKhRr83WYJSavLh91ntxZl7J/pv1mkbpg24UPT1/NRHkUkZ9Gdp9qkANeXpXlaJUysZ42rwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bungeetaco.com; spf=pass smtp.mailfrom=bungeetaco.com; dkim=pass (2048-bit key) header.d=bungeetaco.com header.i=@bungeetaco.com header.b=pUlCLN35; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bungeetaco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bungeetaco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bungeetaco.com header.i=@bungeetaco.com header.b="pUlCLN35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bungeetaco.com;
	s=protonmail2; t=1786986243; x=1787245443;
	bh=2lE4/VSD0XA1DC34UUn9+JDK6X58pZKe+alrg/VekYQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pUlCLN358IXAkvJDAfNF05iEEACkSZL3YL90G/Rnad+Vp6rvjj4zt/9Ib+M5qdJJG
	 Wzd8LUlPIh+rj4DlEM+f+wPLF6q8MaRkh5EuMrv7xEVVdR0CxiYoc+YfA4MvDP8lMA
	 zbOUZ5HSL4PlSOOSebqrmBMNk+ozxyO291DVPCKAqD5X8Uml2NglJ43IadcHxaH6EQ
	 EbjSMvNP8a2+1UUEsezO6XhLjAj464LsxtDR8ozx8c7bixjM4ANviG2rSgc42uO3cK
	 x1068ITb7hSiooLbBQEVbaNg09outHf9grAkD3iWgxAdQhUub+Gpnv/+BZh4ekglUb
	 6iSyk2z0CLZJQ==
Date: Mon, 17 Aug 2026 17:03:58 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: GG <ggirouard@bungeetaco.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected hubs
Message-ID: <jjJPzuDEBRVJ3kZwlt43bdlePFCpQRMREjsEVngkNZLaCQDi9wBEEZb4U-2nvZ67qskaP8WSEbux8AmWenQGHT0WIvFQ6ZU2G4zQl3Lb4Vw=@bungeetaco.com>
In-Reply-To: <1050e9b0-ef6a-4bdb-9510-572c2a93b485@roeck-us.net>
References: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com> <vPlYOTmuxKCPw1cRvxIWJfqFl7p8endHIMWS9DZwINEUCPql8VLF7GBkmEBMokDKtHop6K5TAPUAlk-17CFWlA8extBUV7XGnuVx1KJK3iU=@bungeetaco.com> <1050e9b0-ef6a-4bdb-9510-572c2a93b485@roeck-us.net>
Feedback-ID: 11328688:user:proton
X-Pm-Message-ID: c91c786420a8938b2adfe5c574823ea7a0d5e86b
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Understood - thanks for explaining the page selection part, that makes sens=
e. I'll blacklist it for now.

Appreciate you taking the time to get back to me on this!

Gabriel G

On Monday, August 17th, 2026 at 12:58 PM, Guenter Roeck <linux@roeck-us.net=
> wrote:

> On 8/17/26 09:42, GG wrote:
> > Sorry - I should have searched the archives before sending my last emai=
l. I've since
> > found this from February, which is the same problem:
> >
> >    https://lore.kernel.org/linux-hwmon/20260205102942.28745-1-tinsaetad=
esse2015@gmail.com/
> >
> > And I missed the obvious clue sitting in my own boot log:
> >
> >    i801_smbus 0000:00:1f.4: SPD Write Disable is set
> >
> > So my kernel already knew. Apologies for the noise.
> >
>=20
> Unfortunately that knowledge is not passed on to the spd5118 driver.
>=20
> > One thing I'll mention in case it's useful: that series above has spd51=
18 refuse to
> > probe when writes are disabled. On my machine that would lose me two wo=
rking
> > temperature sensors. Reads are completely fine here, I get correct temp=
s,
> > and my temperature limits read back properly. It's only writing that fa=
ils.
> >
> > Happy to test anything on my hardware if it would help.
> >
>=20
> That can not be done, as I mentioned in my other e-mail.
>=20
> Problem is that accessing temperature sensor data on spd5118 compatible c=
hips
> requires a write to select the correct chip page. If writes are disabled,=
 and
> the BIOS selected a page other than page 0, temperature sensor data is no=
t
> accessible. Since the BIOS can do whatever it wants and may have selected=
 a
> different page after a suspend/resume sequence, one simply can not trust
> the status when the driver is loaded initially.
>=20
> Guenter
>=20
> 
