Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477693D6CBC;
	Wed,  1 Apr 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037996; cv=none; b=G+4STfm4bY8L3pbamkM7JXQCKXam6TBgYYfms4CBZ/Juf01vVK/8Vo16fIXVOpjxLHxS++b/QtOtMAWA3NopSf2dy+I3G848kaz1uixcxVMY4cQq3UzidI/KaU0uwlzP8bQnz9BKf9O4nYgL4PMTLMDnEFOOdwkYryBR1aDqtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037996; c=relaxed/simple;
	bh=tTl+LiKdRfM5EY4YgjlkRcZAt+GwZ+qS71q9V2mLXjM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y+pkA7c29qERLEo5iBsrpnoGXxMefitXunMERBFzztA0hPWAVBum5H1p2/ZM+MuScTASmmeJLmsNRoNhYEgObLtGP2nVMJsRYgPnpvjlg1pe4qV3BFzh+pJOXXmyP60bAY0O8V9z+CcBKzpia6HJrYckrV/nQ3yL4XPHBQ7XX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPg8w7JQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPg8w7JQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775037993; x=1806573993;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tTl+LiKdRfM5EY4YgjlkRcZAt+GwZ+qS71q9V2mLXjM=;
  b=VPg8w7JQPGbLrR+u1LFaufG4ANbW2fXp/deidoXznr+ebzLSa50dDOLX
   9X2XHjsdhD+Pg+z7Txkhf2y1eeXlNMIg2RFZ5gyYx+twUkL9QryRb7SzH
   aPzIlXaYVkfIhB3NRvGEYXg/OB/98p1tNkTtdT4Ng1xl9avlZpFt0QXJx
   aYusTou0LMkx3oyLk/gEZJq6UodFY140Uo8dGJF19yMhL+B84qQQpoHjt
   brVY84JsKzqK+b5nnwq+Svh1DvwprF3eObTjZT1giohhr6F6zFWMQVP5j
   VeOK5U0ErvYLxY0eK0eM9Az20xZ9CP2sACiteJ2JzAUtI8mqLE+3XZhPP
   w==;
X-CSE-ConnectionGUID: UwwTSvTDTTeSQFuYa56apQ==
X-CSE-MsgGUID: czSOpZIkQAO9Ggn5v1M/fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93652372"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="93652372"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 03:06:32 -0700
X-CSE-ConnectionGUID: FZnUPzJWSGS1KpYZxnj0Vw==
X-CSE-MsgGUID: PelI1L3GTv65Ih7/V1xtkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="257121865"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.192])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 03:06:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Apr 2026 13:06:24 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v3 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
In-Reply-To: <44633ad0-2b80-40db-9655-e0eddb3fa02a@gmx.de>
Message-ID: <2446bca3-d524-bb17-11a6-e03bda3d5c6a@linux.intel.com>
References: <20260314175249.16040-1-W_Armin@gmx.de> <20260314175249.16040-2-W_Armin@gmx.de> <658006e6-bbfe-03b4-f788-8f041adda03d@linux.intel.com> <44633ad0-2b80-40db-9655-e0eddb3fa02a@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-336855237-1775037984=:973"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-336855237-1775037984=:973
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 31 Mar 2026, Armin Wolf wrote:

> Am 31.03.26 um 11:44 schrieb Ilpo J=C3=A4rvinen:
>=20
> > On Sat, 14 Mar 2026, Armin Wolf wrote:
> >=20
> > > Use the new buffer-based WMI API to also support ACPI firmware
> > > implementations that do not use ACPI buffers for the descriptor.
> > >=20
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   .../platform/x86/dell/dell-wmi-descriptor.c   | 94 +++++++++-------=
---
> > >   1 file changed, 47 insertions(+), 47 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> > > b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> > > index c2a180202719..fe42eb8bbd79 100644
> > > --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> > > +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> > > @@ -7,7 +7,7 @@
> > >     #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >   -#include <linux/acpi.h>
> > > +#include <linux/compiler_attributes.h>
> > >   #include <linux/list.h>
> > >   #include <linux/module.h>
> > >   #include <linux/wmi.h>
> > > @@ -15,6 +15,24 @@
> > >     #define DELL_WMI_DESCRIPTOR_GUID
> > > "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
> > >   +/*
> > > + * Descriptor buffer is 128 byte long and contains:
> > > + *
> > > + *       Name             Offset  Length  Value
> > > + * Vendor Signature          0       4    "DELL"
> > > + * Object Signature          4       4    " WMI"
> > > + * WMI Interface Version     8       4    <version>
> > > + * WMI buffer length        12       4    <length>
> > > + * WMI hotfix number        16       4    <hotfix>
> > > + */
> > > +struct descriptor {
> > > +=09char vendor_signature[4];
> > > +=09char object_signature[4];
> > > +=09__le32 interface_version;
> > > +=09__le32 buffer_length;
> > > +=09__le32 hotfix_number;
> > > +} __packed;
> > > +
> > >   struct descriptor_priv {
> > >   =09struct list_head list;
> > >   =09u32 interface_version;
> > > @@ -88,76 +106,58 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
> > >   }
> > >   EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
> > >   -/*
> > > - * Descriptor buffer is 128 byte long and contains:
> > > - *
> > > - *       Name             Offset  Length  Value
> > > - * Vendor Signature          0       4    "DELL"
> > > - * Object Signature          4       4    " WMI"
> > > - * WMI Interface Version     8       4    <version>
> > > - * WMI buffer length        12       4    <length>
> > > - * WMI hotfix number        16       4    <hotfix>
> > > - */
> > > -static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
> > > -=09=09=09=09     const void *context)
> > > +static int dell_wmi_descriptor_probe(struct wmi_device *wdev, const =
void
> > > *context)
> > >   {
> > > -=09union acpi_object *obj =3D NULL;
> > >   =09struct descriptor_priv *priv;
> > > -=09u32 *buffer;
> > > +=09struct wmi_buffer buffer;
> > > +=09struct descriptor *desc;
> > >   =09int ret;
> > >   -=09obj =3D wmidev_block_query(wdev, 0);
> > > -=09if (!obj) {
> > > -=09=09dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
> > > -=09=09ret =3D -EIO;
> > > -=09=09goto out;
> > > -=09}
> > > +=09ret =3D wmidev_query_block(wdev, 0, &buffer);
> > > +=09if (ret < 0)
> > > +=09=09return ret;
> > >   -=09if (obj->type !=3D ACPI_TYPE_BUFFER) {
> > > -=09=09dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
> > > +=09if (buffer.length < sizeof(*desc)) {
> > Hi again,
> >=20
> > Thinking some more of this...
> >=20
> > Since many of these drivers will need to do this size check and assign
> > into some variable that is different from the one passed to
> > wmidev_query_block(), would it make sense to move those into generic co=
de?
> > It probably requires a macro so you'd have access to type information.
>=20
> You mean something like wmidev_block_query_sized(wdev, instance, size)?

So this would return ERR_PTR() as I see no out param given to it?

> Personally i see little benefit in having the assignment handled by a mac=
ro.

I was not so interested in assignment itself but getting the size=20
information from the output type directly but if you prefer writing=20
sizeof(*xx), not a big deal to me.

--=20
 i.

--8323328-336855237-1775037984=:973--
