Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7B757EA
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774175334; cv=pass; b=D29EmuDIv+n87owFMbWrGe6RhhUXQG+SeZ4jKBMm+zk54jqpTMXp5ogGNtSYrnVbjw8Zqs9rB98bXcvrJ84U26T0UgW71FrlmuZgi0dCr0CRsHk4HMInAwz8Bhrf8cym1Yw5E5q7idIth+TNvK+QOF3Q21BkbPGtUfkPzAEWYCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774175334; c=relaxed/simple;
	bh=v47EJn/kU7yPCqr5LvpX1/aD/tlYt1h3dsqODYDVgyE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qd7TsdfATc+c8/p1IBpAoSvYYNyntgfZb0HIlQBs8nXyloeHfEqMK02rexNQEkypr2S/mRXRE0CLubwz/rN9X9vsy+ZdO7mvmSh2Cd0ajkaD9+DW3ZlJDWnX3vXEaWNw9nZvGrb0zf5I/fF2HaATzNlqVAc27ahR4g/E/uuxAQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guyboldon.com; spf=fail smtp.mailfrom=guyboldon.com; dkim=pass (2048-bit key) header.d=guyboldon.com header.i=@guyboldon.com header.b=Qx76WBgZ; arc=pass smtp.client-ip=23.83.209.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guyboldon.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=guyboldon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=guyboldon.com header.i=@guyboldon.com header.b="Qx76WBgZ"
X-Sender-Id: a2hosting|x-authuser|gb@guyboldon.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6F4F880056A
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 10:18:53 +0000 (UTC)
Received: from nl1-sr2.supercp.com (trex-green-4.trex.outbound.svc.cluster.local [100.113.227.94])
	(Authenticated sender: a2hosting)
	by relay.mailchannels.net (Postfix) with ESMTPA id 86464801157
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 10:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774174732;
	b=d+9VJm0cHHbq/GUEPH7DtJM7QRe07Jy3AoY/Ccf0wPVCu8YCb/9plEQ34+gNYnLacY0LVP
	eZ/9oMbpDTBagXWU+iRqLkOJUu3ZSrQR7SC4gK4Cf9j/Vtb6FzvmD+bpOcAvFz+t+ho7G5
	UGxwV3BpssGbducHS1wWpqna1d5Fr3pNTWak1mGosH4wy6UmK3FZQMpzzIQuMGr+/KuSq+
	23yWjW5xJJihEh6EY40IoSjWCknN9OPnK+zFViFSLJZwgfI/Pmf+Z3AvP8BtazPo5ONuys
	thi8rMvjNr5bQ9nXrd4TqVDrspg6Pa5RK2m120F7HeSesIEaokUK65gLUA+dTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774174732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=v47EJn/kU7yPCqr5LvpX1/aD/tlYt1h3dsqODYDVgyE=;
	b=YPCGOV+aUEViXqf50z8WK3oceLaoZWLrvI9l09YEI7zfrsAxWcBhLASi9QFYrpFJqolfC0
	r1m39lth8g920YJ1KOpwNIW7V9juDuI3PUIogOn9l1eqbop1zuV7+VzpfR1HaJFRYDMPzG
	hZDsLbTUre4gfoqkMFQm2Q9ZSsEdqYqir3aEY1OW0sifRJT8AnnZNjep1nVcaUBbG0+oQz
	gV32l46mHxYR3slBFIrGjNcj0gqw6iTuRC83A0Wr5pFgQVTk4vkxlvly2dCE9WinTJrntF
	Dpg62K+HLrIqWqysdEhq+0Mu8sWjyME0vcuTgxnggyNSo33/AfjDZfQEfSTbeQ==
ARC-Authentication-Results: i=1;
	rspamd-6d4cb6745-wtrg2;
	auth=pass smtp.auth=a2hosting smtp.mailfrom=gb@guyboldon.com
X-Sender-Id: a2hosting|x-authuser|gb@guyboldon.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: a2hosting|x-authuser|gb@guyboldon.com
X-MailChannels-Auth-Id: a2hosting
X-Shrill-Thoughtful: 4099a78a6ca5a101_1774174733237_1534262079
X-MC-Loop-Signature: 1774174733237:3891133390
X-MC-Ingress-Time: 1774174733236
Received: from nl1-sr2.supercp.com (nl1-sr2.supercp.com [68.66.248.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.113.227.94 (trex/7.1.5);
	Sun, 22 Mar 2026 10:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=guyboldon.com; s=default; h=In-Reply-To:References:To:From:Subject:Cc:
	Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v47EJn/kU7yPCqr5LvpX1/aD/tlYt1h3dsqODYDVgyE=; b=Qx76WBgZuxuFZ7bMh5xZaRdiS+
	VdpgoEajpIy43UKq8hXu6+DaCjb7j2GzzlS8dYd3CrYIwgaK3uYV7/voBklzb4DjJ3PEGxYr+wXIM
	lNWf5yY1o0UpgM7fm1R0DepqUr+o+JmP5fURPShW7uqAxtXPCE9YA+2SBNWkLw4B1gNDK2X+/iivN
	DGJAkPxYeaQHVdctFygXAnKYcWKWqomwj0liZKBrYg4tdLJ6kS/UJU/IyL2gVkMMD79TcHvFAP3m2
	wmhzQvl/gkAODar4CsgrYZj9km8Jh0ylNkSq6HY4SXr4li/pldOQ3UIDdDrejkTl5A/sNT+uAfKV6
	a4TaGyyA==;
Received: from mailnull by nl1-sr2.supercp.com with spam-scanner (Exim 4.99.1)
	(envelope-from <gb@guyboldon.com>)
	id 1w4FtS-000000006SY-2LQm
	for linux-hwmon@vger.kernel.org;
	Sun, 22 Mar 2026 11:18:50 +0100
X-ImunifyEmail-Filter-Score: -2.89
X-ImunifyEmail-Filter-Version: 3.8.21/202603171242
X-ImunifyEmail-Filter-Action: no action
X-ImunifyEmail-Filter-Info: UkNWRF9UTFNfQUxMIEJBWUVTX0hBTSBBU04gTVZfQ0FTRSBJRV9WTF9
 	BR0VfRE9NQUlOXzJXIElFX1ZMX0FHRV9FTUFJTF8yVyBGUk9NX0hBU1
 	9ETiBUT19ETl9TT01FIFRPX01BVENIX0VOVlJDUFRfU09NRSBWRVJJT
 	E9DS19DQiBGUk9NX0VRX0VOVkZST00gTUlNRV9VTktOT1dOIFJDVkRf
 	Q09VTlRfT05FIE1JTUVfVFJBQ0UgSUVfVkxfQUdFX0FDQ09VTlRfMlc
 	gQVJDX05BIF9EUlVHU19NTV9NQUxFIFJDVkRfVklBX1NNVFBfQVVUSC
 	BNSURfUkhTX01BVENIX0ZST00gUkNQVF9DT1VOVF9GSVZF
Received: from ip588648bf.dynamic.kabel-deutschland.de ([88.134.72.191]:52722 helo=localhost)
	by nl1-sr2.supercp.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gb@guyboldon.com>)
	id 1w4FtR-000000006S0-2J9F;
	Sun, 22 Mar 2026 11:18:49 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 11:18:49 +0100
Message-Id: <DH98GAR01T3A.2T18C7CAX3Q0Q@guyboldon.com>
Cc: <W_Armin@gmx.de>, <jan.claussen10@web.de>
Subject: Re: Weird Dell SMM bug since 6.18
From: "Guy Boldon" <gb@guyboldon.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Guy Boldon" <gb@guyboldon.com>,
 <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
 <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
 <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>
 <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net>
 <DH4H9QQI4OQ9.30PQ935ZJERT0@web.de>
 <62d86acf-6a3f-4bb2-9d81-cf47bd1461e9@roeck-us.net>
 <fd277150-af4b-4bd5-af7e-868c9678eb1e@gmx.de>
 <20260319094944.239871-1-gb@guyboldon.com>
 <c25f34cb-6069-42c4-a7af-bca27c6a411f@roeck-us.net>
In-Reply-To: <c25f34cb-6069-42c4-a7af-bca27c6a411f@roeck-us.net>
X-AuthUser: gb@guyboldon.com

Hi Guenter,

Thank you for the explanations, much appreciated.=20


On Thu Mar 19, 2026 at 4:52 PM CET, Guenter Roeck wrote:
> The use of -ENODATA in hwmon to report that a value is not available is
> relatively new and isn't even fully documented in the sysfs ABI (admitted=
ly
> a major oversight). The major driver for its use is that it more accurate=
ly
> reflects reality as reported by the "sensors" command if an attribute val=
ue
> is not available (sensors reports "N/A" instead of an error message if it
> gets an -ENODATA error).

Ah, it seemed somewhat new and that makes sense. -ENODATA converts to
a clean N/A without an error message. We will adjust to handle -ENODATA=20
going forward.

>> As a related point: gpd_fan returns -EOPNOTSUPP rather than -ENODATA
>> when in auto mode, and documents that behavior in the kernel docs. The
>
> Please feel free to submit a patch to fix that.

I'll submit a patch for that.

> The best we can do is to find a means to improve consistency, but as you
> can see here even that is difficult because different people will have
> different opinions on how that consistency should look like. Error respon=
se
> will vary, as will attribute visibility.
>
> If you would like to get actively involved, please feel free to submit pa=
tches
> improving the documentation (Documentation/hwmon/sysfs-interface.rst,
> Documentation/ABI/testing/sysfs-class-hwmon, and or driver specific
> documentation) as well as driver patches to help improve consistency acro=
ss
> drivers.

I agree and I would like to help improve consistency for the interface. I'l=
l
look at the docs as well. CoolerControl is a direct consumer of this interf=
ace
across a large range of drivers, but improving consistency, I think, benefi=
ts=20
anyone interacting with more than a handful of drivers.

Thanks again,
Guy

