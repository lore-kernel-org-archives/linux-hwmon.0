Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2242DF121
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397730; cv=none; b=MU3uzopkyCqE8bXcVto56bW6amY9UonQMk5zeaPXG8brdCgQ2MAsqne6NYSRB/zWv+uzosf5ayFXUxKY5ckCWcSvTPZIp03ZdxY8qMMFII3tS0TU6xOBsPCh5L8h0H/9Q2C2gqvGPCAOoMRfAfi09YuHJ3v1gghFkc2RZCk/QDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397730; c=relaxed/simple;
	bh=imvnZblUSrpZcsW4pokAVw/zA8KP2AcKX04/i83COMg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=l98PX74ka0m9LS+Ddp4xMra2RyDWMBUKh7qNPHld8SO4QvkWRujf4SYmNZkl1SiZkA7J9n7pmUtF7ZEdDAuzMDGh2pOQpOVieZ7mXrPPQ4JWrv53ws/O+nFfRVedi2hvsEoN4tjbLnNtvVBoYSQFGQIrl3yDJruUegZEkYB+5eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=miarUF++; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="miarUF++"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=edGp6rScHzQJ7Ep22rKQIT4qNnfBHU12CPlBCBsjSpI=; b=miarUF++H/dN/Qy0BrsN2lsQlL
	EiaeOev7rUeME+k5Edp31XLVFQ+0Te7XG4Os3Z4J4XrrIJIJtP+dUsswgVg0tIdgz7a0BWobLVKzH
	nqDsGoEd9Ts7/2dCGbrphBRbsVnyOUWLIoIglmefnsOqxRiMjhzcdvNVjsB5KHqdIgAqlSVPcPm7q
	cBEWXniY/ssYHSZNjInJJT0az6koLOlcikIZC+ECvCEdjoCPwFk2uDSbASyjlr1q3V0Z7u8+mOsFo
	FZcaCtm4lhWK/0H5hPtMCAzfHbi9QEFmN1mHE72CtoNhFcXR1uhMZglPz/gvAgUSAZIKIoSYGPBD/
	Qn5/T9iw==;
Date: Mon, 17 Nov 2025 17:42:14 +0100 (CET)
Message-Id: <20251117.174214.275632644162861879.rene@exactco.de>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] add Via CHA ID to via-cputemp
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <9e761121-91f7-43b1-9f7f-866acf1fb7ad@roeck-us.net>
References: <20251117.133746.173713564005237147.rene@exactco.de>
	<9e761121-91f7-43b1-9f7f-866acf1fb7ad@roeck-us.net>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 17 Nov 2025 07:44:04 -0800,
Guenter Roeck <linux@roeck-us.net> wrote:
...
> Your patch does not apply to the tip of the upstream kernel
> (v6.18-rc6). Please
> rebase before sending the next version.

strange, does for me with patch, anyway, will rebase.

...
> > @@ -273,6 +274,7 @@
> >   	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_A,	NULL),
> >   	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_D,	NULL),
> >   	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_NANO,	NULL),
> > + X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_CHA, NULL),
> >   	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 7, X86_MODEL_ANY,		NULL),
> 
> The hard-coded numbers were changed to defines with commit
> 5cfc7ac7c1bf6 ("hwmon:
> Convert to new X86 CPU match macros"). I don't know why that commit
> did not also
> change the case statement above. Either case, I'd suggest to either
> use defines
> everywhere or not at all.

As this warnings also annoy me quite a bit:

rene@centaur:~# dmesg  | grep depre
[    0.992068] via_cputemp via_cputemp.0: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    0.992249] via_cputemp via_cputemp.1: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    0.992443] via_cputemp via_cputemp.2: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    0.993148] via_cputemp via_cputemp.3: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    1.003503] via_cputemp via_cputemp.4: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    1.004619] via_cputemp via_cputemp.5: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    1.005364] via_cputemp via_cputemp.6: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    1.006004] via_cputemp via_cputemp.7: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().

I can finally fix that while at it, too.

Do you prefer a 3 part series fixing this, the defines, and cha001 on
top or is one patch okay for this relatively simple changes?

Thanks,

	Rene

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de
