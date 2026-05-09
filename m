Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395232F8EB0
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 17:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778347576; cv=none; b=Wuic2S3EJmAvnDRGVQbDuXk4Jkyj2dPPfTaFMpN2oOu+oAlfpon8WWQ0/RqE2Y0M7CBsfeIHXk3RCBN7bAYQAjPfnPtRVdH40yaEoME6+Adzs8ym5BK0lxExPh13sv+w4rynbUG23a4bOIyVvicSeVAWniuGGMq08b0n5RfPc0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778347576; c=relaxed/simple;
	bh=l462U55PT64SV7/6J/PrglUYrWnvSBMER0UTA9BRUMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPH2TWm7u8P2bYl1vC9krJRYJM11mUtsamD6oEFcJ+dC601SN3Q0xJWQJoLA7g9cmv70U7DZ1VBjoUrp9PWTWQXGQdGlYqNUhwPkviFCr7hyqp6DCs/vml4dzioQUKujxN0ychlP5hEGZW3w4qVe5Nz5L3R0d2yKgyiSZjcU+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Nh7UoZey; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Nh7UoZey"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 32628C3CAE
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 20:26:10 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id A87EFC18FE
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 20:26:09 +0300 (EEST)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 0314B1FFBE6
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 20:26:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1778347569;
	bh=aaVLGWdALPBEsCmykSE9FJJUaBWJ7tM3Snl5Lo8yqac=;
	h=Received:From:Subject:To;
	b=Nh7UoZeyCSuLKXr29qnk8VBAGg/zK7qSzQjHFDeF0DAXUNI0+6zkhSjE/BOn5+L/+
	 D78yXTUpTeqOzJ+S0GNH8GpZysLl3nTqco46pNSwq4dxTvqhuIqbJ4h3M0oqIj/kZm
	 DQnoW1wBAZpfetkT3654X6GKIVrwALHOpZePRchBbddSBvG82VjoN3NvENrXqMgPHr
	 rJjbwPrunNZ6fh9AA9iYlQEd6aZHhL+Am/q/SfFPi7IkxUe+n/wRbBJAfSizx2hwr7
	 78HcjKS3+wkjwd0a9xp8giH/sf3tnVWIXRp/kkB2GPiYWto710by0SjyqCZR6ifCs8
	 lk017z8X3mHjg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2ba928852a5so20219485ad.1
        for <linux-hwmon@vger.kernel.org>;
 Sat, 09 May 2026 10:26:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8rivvqJ5AAFiPBcGjSwgN9Z7oBaiZ2kS/4aQfckS2k/quw87BaoOizVi0iaZRBOCykCZmTNy06znVE7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8IK+qHKZzQmSVxGaX2+1VP6H8aM9nbvmYvAsHJqedxR1WRnY
	PXyaAwDx0ynmKDTNbkiVOQ5R/52nVwAZb7QjLR6g24LPB7e/4prbFJBaAQ8tazZXuyp07WbLivY
	mlfGvmlkI5jlSCQBAGs7k6OP5C1o5Exk=
X-Received: by 2002:a17:903:1a28:b0:2b9:f8e9:70e2 with SMTP id
 d9443c01a7336-2bc7a990b6emr31487655ad.8.1778347567646; Sat, 09 May 2026
 10:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260508184104.623016-1-derekjohn.clark@gmail.com>
In-Reply-To: <20260508184104.623016-1-derekjohn.clark@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 9 May 2026 19:25:54 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFXDP+nQO8bkW01t_iSOYQ6OUQkfv35ULfHrnLjVoFZvg@mail.gmail.com>
X-Gm-Features: AVHnY4JBi-EFhXFTQHQXwlf5sV1Obpy2Ad4iTU3cNjmImPpDtrJiKAc9dKkWupo
Message-ID: 
 <CAGwozwFXDP+nQO8bkW01t_iSOYQ6OUQkfv35ULfHrnLjVoFZvg@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177834756922.2678364.8822577964454957156@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 8 May 2026 at 20:41, Derek J. Clark <derekjohn.clark@gmail.com> wrote:
>
> >This draft patch series brings into parity the msi-wmi-platform driver with
> >the MSI Center M Windows application for the MSI Claw (all models).
> >Unfortunately, MSI Center M and this interface do not have a discovery API,
> >necessitating the introduction of a quirk system.
> >
> >While this patch series is fully functional and tested, there are still
> >some issues that need to be addressed:
> >  - Armin notes we need to disable fan curve support by default and quirk
> >    it as well, as it is not supported on all models. However, the way
> >    PWM enable ops work, this makes it a bit difficult, so I would like
> >    some suggestions on how to rework this.
> >  - It turns out that to fully disable the fan curve, we have to restore
> >    the default fan values. This is also what is done on the OEM software.
> >    For this, the last patch in the series is used, which is a bit dirty.
> >
> >Sleep was tested with all values being preserved during S0iX (platform
> >profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
> >least for the Claw devices.
> >
> >For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
> >his new high level interface is merged beforehand, we can use that instead.
> >
>
> Hi Antheas,
>
> It seems this series is stalled for 3 days shy of a year now. I have an
> interest in getting this across the finish line. Will you be continuing
> development? If not, I will take what you've started here and finish out
> the remaining nits, keeping your original attribution of course.

Hi,
I plan to get back to this after the standby rfc is in a good place.
There are some issues with this series that need resolving, MSI
firmware is a lot more varied and unstable than other OEMs which make
it hard to pin down to a defined ABI.

For V2, we'd need to look into testing into at least some laptops to
verify shift mode behavior

Antheas

> Cheers,
> Derek
>
> >Antheas Kapenekakis (8):
> >  platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
> >  platform/x86: msi-wmi-platform: Add quirk system
> >  platform/x86: msi-wmi-platform: Add platform profile through shift
> >    mode
> >  platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
> >    attributes
> >  platform/x86: msi-wmi-platform: Add charge_threshold support
> >  platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
> >  platform/x86: msi-wmi-platform: Update header text
> >  platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
> >    unload
> >
> >Armin Wolf (2):
> >  platform/x86: msi-wmi-platform: Use input buffer for returning result
> >  platform/x86: msi-wmi-platform: Add support for fan control
> >
> > .../wmi/devices/msi-wmi-platform.rst          |   26 +
> > drivers/platform/x86/Kconfig                  |    3 +
> > drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> > 3 files changed, 1156 insertions(+), 54 deletions(-)
> >
> >
> >base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
>

