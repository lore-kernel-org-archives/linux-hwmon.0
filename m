Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C625B3CB2FC;
	Sun, 14 Jun 2026 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781457169; cv=none; b=RJCKU+9et5z8CuOYe0F/1waqb/ULnP3ZHm9l0ichkorCucz+hHB4bjAq5VZOPCzD5Rj8xw2wsKgFVQOMet+NSYpdtkYK9TKFzhXy/ziDHzxtYZaMTs7ubV1hnV3R0ia0HT4MFu8J0RAmHHTrtZtx5XKmkz5j/6RElzpHCEUCIIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781457169; c=relaxed/simple;
	bh=h1PBmhhP2hRrBEQrmRgb8zWrPfSa9LiNoSU0rlny114=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvNr23JdwV0fntzY3W8x46E7HRQ6uDZzse/D6aBiyvmmtsel4+CH39MlEM9OUgakwOPFr8dmoZVouxSsTZy/k7xNftDMwxwcAHHMMgE2WInNekSCl4EW044vh80ta4Ne/J9cXyDkhZ+DKN1FjV5n7oqcMc2gziDaTk7IqdyVH4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XHC5b4gn; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XHC5b4gn"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A915A40E0177;
	Sun, 14 Jun 2026 17:12:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DGC_WwXamhow; Sun, 14 Jun 2026 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781457150; bh=9ASJL9sEbeOJeyxr/gqy6V7Qh+4ywEqXDGybm2Apzj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHC5b4gnimou3diRaoM8OdYJophjWIYmvIuqG2L7eaZvHowuEUxXq8EaZY+Sk47ji
	 TT3/Jm8mBb1crSp++vgc+xEi1BXhbVXNDlwhODsxMkFI4Pg35gVcqVoyN/OhA0k2JI
	 BgN1SqfjkjUFyowJZzsWwV8f6XeKgQSIH2jxqqOfR6ljleh9uXV21Vz2/4+NV3/ZsQ
	 GWfCbTfOloShS2SOqzxvoeJ967TLOUyPio0GijuP36+xhA2prnQjE+VxD4FUXbgXxy
	 W6PGpCMYiWhUOAn8cQ8zEUcO44NLBBhBNpZ1IFSel0I7lCNckk5q9mSNBSmHN0TOjh
	 Kx9i7KUHPbMmNyQykxg+p3yDXP22mnvSlvdR45ttnidwMqxVGgjTehkZfK57C/f1Mv
	 9wGw3LRvRnmaTeh3ZFH0zy5HCKmekqZIlAJ1OItI0ANGAD83gc/JjAmi0TSWJAvYyu
	 5MD+cB8+MdfQEl3bgrrNa7wjNWOZCrR5a0V7eS/Z4CzgaUtIEbY2/xjyHoqpnQI3/X
	 ti6H7Ixpc2tF1ktqIZ+93tsrtc70m5G35TFRyFQ31QDoxsT7908v5kDrvFEvGQWIAW
	 Xdj9LRAyZdpwDHtshSzHKE8AH9woHGQZchPFmxx4s4ql1RPifxx9hJfLo1S3E1eox2
	 X6XgfTHJsM6XYnyC5L6xtSo0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 73C5740E01B3;
	Sun, 14 Jun 2026 17:12:23 +0000 (UTC)
Date: Sun, 14 Jun 2026 10:12:20 -0700
From: Borislav Petkov <bp@alien8.de>
To: James Seo <james@equiv.tech>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, bugzilla-daemon@kernel.org,
	alessio.oliviero@aol.com
Subject: Re: [Bug 221652] New: platform/x86: hp-wmi: Add fan control support
 for HP Victus 15L Gaming Desktop TG02 (board 89D8)
Message-ID: <20260614171220.GAai7g9OdJi51PprxI@fat_crate.local>
References: <bug-221652-6385@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bug-221652-6385@https.bugzilla.kernel.org/>

Switching to mail.

On Sun, Jun 14, 2026 at 01:36:12PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221652
> 
>             Bug ID: 221652
>            Summary: platform/x86: hp-wmi: Add fan control support for HP
>                     Victus 15L Gaming Desktop TG02 (board 89D8)
>            Product: Platform Specific/Hardware
>            Version: 2.5
>           Hardware: AMD
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: x86-64
>           Assignee: platform_x86_64@kernel-bugs.osdl.org
>           Reporter: alessio.oliviero@aol.com
>         Regression: No
> 
> Created attachment 310322
>   --> https://bugzilla.kernel.org/attachment.cgi?id=310322&action=edit
> Full output of $ sudo dmidecode
> 
> The HP Victus 15L Gaming Desktop TG02-0xxx (DMI board name: 89D8, also known as
> "HP Erica8") does not have fan control support under Linux. The hp-wmi driver
> recognizes the device and exposes /sys/class/hwmon/hwmon*/name = "hp" and
> pwm1_enable, but writing to pwm1_enable returns EOPNOTSUPP (error 95). The
> platform_profile interface is not registered.
> 
> On Windows, OMEN Gaming Hub correctly switches between Quiet, Balanced, and
> Performance thermal profiles. The Quiet profile noticeably reduces fan noise.
> This functionality is unavailable on Linux.
> 
> ## System Information
> 
> - Product: Victus by HP 15L Gaming Desktop TG02-0xxx
> - SKU: 9V3N1EA#ABZ
> - DMI Board Name: 89D8 (HP Erica8)
> - DMI Board Manufacturer: HP
> - BIOS: AMI F.30
> - CPU: AMD Ryzen 5 5600G with Radeon Graphics
> - GPU: NVIDIA GeForce RTX 4060
> - Kernel: 7.0.0-22-generic (Ubuntu 26.04 LTS)
> 
> ## Observed behavior
> 
> Writing to pwm1_enable fails:
>   $ echo 1 | sudo tee /sys/class/hwmon/hwmon3/pwm1_enable
>   Operation not supported (error 95)
> 
> platform_profile is not available:
>   $ cat /sys/firmware/acpi/platform_profile
>   (file not found)
> 
> ## dmesg (relevant lines)
> 
>   ACPI Error: Aborting method \_SB.WMID.WQBZ due to previous error
> (AE_AML_BUFFER_LIMIT)
>   ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
> (AE_AML_BUFFER_LIMIT)
>   hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not supported"
> 
> ## WMI devices present
> 
>   wmi:2D114B49-2DFB-4130-B8FE-4A3C09E75133
>   wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4
>   wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C
>   wmi:988D08E3-68F4-4C35-AF3E-6A1B8106F83C
>   (+ altri 7 device wmi)
> 
> ## Expected behavior
> 
> The board 89D8 should be added to the appropriate DMI table in hp-wmi.c (either
> victus_thermal_profile_boards[] or victus_s_thermal_profile_boards[]) so that
> platform_profile is registered and fan speed control via pwm1_enable works, as
> it does on other supported HP Victus/Omen boards.
> 
> ## Notes
> 
> This is a desktop machine (not a laptop). Most hp-wmi fan control work has
> focused on laptops. It is unclear whether the WMI interface for this desktop
> model is identical to the Victus S laptop series or requires a separate quirk.
> 
> Similar issues resolved for other boards:
>   - 8BD5: https://github.com/betelqeyza/victus-control/issues/2
>   - 8BAB: https://lkml.iu.edu/2602.2/00043.html
>   - 8BCD: https://lkml.iu.edu/2602.2/02656.html
> 
> -- 
> You may reply to this email to add a comment.
> 
> You are receiving this mail because:
> You are watching the assignee of the bug.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
