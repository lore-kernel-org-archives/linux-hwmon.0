Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4193932DB
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951722; cv=none; b=PaaYmDEhmPrG3CJkxQeNy56sa+d4uh7AhwveWfEovyUWooeG9/05zCmgjeNKe75dyyIgpdLFc4GV9HsKg/RbsfamCbA3uWT7foviuvzz5ixxTWT1xvZkI9P7Ygpr0RD6DXry+JyQT/kPTHgzcpDPSY6ii1p7cU9edX08DCUB2V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951722; c=relaxed/simple;
	bh=DZkacl0LYj3A25+z1d7Cuy+PCvVB8P5B8rNSW1GpetI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwTVUHKN8IGPEs3GrWk7RZdJHcM+OYlFiWN5lsKKe7Wr0fPKT0sP9TJB9gJ2mzDVRarub8fRPcTf3qFsLwN8uAyywa9mdqXRSceJDdN5UVnZXZGiNBU/ILAT+BCuW9502BxrQ/8NR8JpkK5m6adA1fK4WdSAV1fxP38/dDS7kFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=IDluv7OJ; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="IDluv7OJ"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 533683FF0E
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 17:41:51 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 418243FA75
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 17:41:50 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 1E97C1FD77B
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 20:41:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1785951709;
	bh=vj/5gBDVK0oBuvLw+3g3cE7T59jtDMK52gvvyGpaH5A=;
	h=Received:From:Subject:To;
	b=IDluv7OJ6kXxKzX+FOz0ewoPC6JlWKEQijr+ZxFFE+cd+JGitGy7yw6INbSCHCGvN
	 PbSZumHOGvKOfPAzYRWhbIkE2coHCWZeLf6mD5Mpw6yFLLDHbjroP6HtqBjPdAC9Ga
	 IgkUedoJP0ollpRdodqpdWfMAEIuot8CSjCyJ8m7JDRWBX6HZYSqtoUys+/OkGClcr
	 O/RvGjsY2oPg5mqCnIYiiEBv1r6JIPD7pYXu4+88ArMRPwsF+zEOHMXy8Lp7uC5DuW
	 QH57XlMeeYrVJLPt6NuscMSpSySt9vhSPhAdZCdVciPly2oMN/AAa17G7i/ZdKZy8t
	 nQnJC0Cl4A3+A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2d02b4c3601so15864825ad.3
        for <linux-hwmon@vger.kernel.org>;
 Wed, 05 Aug 2026 10:41:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Roml4v7WRKo8O6XSyqIhfiaXk87/1Xhg07Xb6PNAc8wMsskW2CiZtZTRoC6Ca9eN9PGIdtl06rSlKoLDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtcoH57Zlikku+yXyRHMujqCIrAgtxW5CHrk8fRWESOfa1wCrn
	3lOHE1u+cbSggXx2POCWw1vQfM9bMTtcHOJcxalNaRi2IY7pynbpQoyidHZStCWPfiBNntvhTIy
	oOHlpZrtUEUK6rkuNQCy81RBNiuWadgE=
X-Received: by 2002:a17:902:e88f:b0:2ce:b7b7:30e3 with SMTP id
 d9443c01a7336-2d0ca9904femr93820805ad.17.1785951707537; Wed, 05 Aug 2026
 10:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 5 Aug 2026 19:41:36 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwF0JBxHSw8=aiFnxgZs-C_0HhsCdfRXsuvoz9MqJJvtoA@mail.gmail.com>
X-Gm-Features: AUfX_myFrIlrgkMgfNSrYbVrvXa1nImqzA89CKFbt3dMEk0RnDyE2R_oYdnqERk
Message-ID: 
 <CAGwozwF0JBxHSw8=aiFnxgZs-C_0HhsCdfRXsuvoz9MqJJvtoA@mail.gmail.com>
Subject: Re: [PATCH 0/6] Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform:
 Add fan curves/platform profile/tdp/battery limiting
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <178595170954.3026395.4290865263123340283@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.5 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 4 Aug 2026 at 00:16, Derek J. Clark <derekjohn.clark@gmail.com> wrote:
>
> While tesing this series, multiple issues were found that cause crashes
> or compilation warnings. Additionally, since this was first posted, two
> new models have been added that each have a unique feature that must be
> managed before TDP control will be used. Given that Antheas indicated he
> still plans on sending a v2, I'm posting these so they can be
> incorporated in the next version, and so that distro's packaing this out
> of tree can get the fixes and additional functionality in the meantime.
>
> A summary of the changes are as follows:
>
> - Patch 1 detangles a guard with a switch case that violates cleanup
>   rules.
> - Patch 2 removes an unused err variable.
> - Patch 3 teminates the quirk table with a null entry to prevent
>   unquirked platforms from crashing when the driver is loaded.
> - Patch 4 cleans up the device quirk names, fixes a bug with when buffer
>   data is copied as a payload, and adds separate PLx limits as indicated
>   by the windows DLL, if pl1 and pl2 are set to the same minumum it can
>   cause instability.
> - Patch 5 adds support for gen 3, the AMD Strixx version. In order for
>   manual TDP control to funciton the STAPM flag must be toggled off.
> - Patch 6 adds support for the 8 EX Ai+. This device uses a new shift
>   mode, called "manual", to enable TDP adjustment. Since this could
>   conflict with the existing "user" mode, use the quirk table to
>   specifiy which mode is "custom". As a consequence, "custom" must be
>   checked outside of the switch case as it could be one of multiple
>   values.
>
> If you incorporate any of these changes in v2, please add the
> appropriate attribution.
>
> Thanks,
> Derek


Hi,
of course. Its good to have this chain series for anyone that needs it.

I will note that for patch 1 and the missing {} I am aware of those
fixes and implemented them myself to the downstream patch I was
carrying. I never resent a V2 because I did not address Armin's
comments. The missing {} was exposed when Armin fixed the
autodetection. So I cannot attribute those to you. Patch 2 is a review
nit, so after I fix it you can add Reviewed-by. I will make sure for
the last two patches especially to attribute those to you and if
possible keep you as the main author / not add myself if they require
no changes.

I do not have access to my Claw until the middle of August. Once I
have access to it I will have a closer look.

Antheas

> Derek J. Clark (5):
>   platform/x86: msi-wmi-platform: Move guard out of switch in
>     platform_write()
>   platform/x86: msi-wmi-platform: fix: Remove unused err
>   platform/x86: msi-wmi-platform: Clean up devices
>   platform/x86: wmi-msi-platform: Add MSI Claw A8 support
>   platform-x86: msi-wmi-platform: Add Gen 4 device
>
> Matthew Schwartz (1):
>   platform/x86: msi-wmi-platform: terminate msi_quirks DMI table
>
>  drivers/platform/x86/msi-wmi-platform.c | 151 ++++++++++++++++++++----
>  1 file changed, 127 insertions(+), 24 deletions(-)
>
> --
> 2.55.0
>
>

