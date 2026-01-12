Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1F3806B2;
	Mon, 12 Jan 2026 18:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241316; cv=none; b=INSGD0/JHgg6wTH1W8y/5gvPr0Vk9ePv61RiIZlT7YRa0MRR9G03JOuyx41Z4TVVNyp0gbL+SK3tR+xWjWUH6mJgvjFR+H0+RL3aNnfBu48qtM2s94qjbl/z7X6azXiTQgJrMYrInTHkXg+KxpddHWsMz5kJPui9JRmIbL0RCU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241316; c=relaxed/simple;
	bh=NR0XOa5HitdinUSXh4ltE4RrUkyHrgEI0FBzFid4Fpk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iwrPYrlGcevUx8ihhbVAnUmlTvRk1XcryCOXckDOhetFMJIe7TRv4sR0Y3R0usNjOlHioajU6HPRttJnky2pPkahqPLi31T6FoBMS7AYl7w/z6Dul0b0QWvynFxG+sp2w59DOCF3Cl2i6cKLOycMUJd4lfE6Gw6QgTuf5ruMG4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+eYnnjO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+eYnnjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768241316; x=1799777316;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NR0XOa5HitdinUSXh4ltE4RrUkyHrgEI0FBzFid4Fpk=;
  b=E+eYnnjOs7+ER9kkKwTOjBgqBjgcznYFfmRJFF4i+bR8aFUxeSnjkuFN
   Un9Ghv/bVxMdD0SipHRChmxCg4lAdn5UYtglEge3Ru76/OG7RXERpcPWf
   b1nf04qRxWsm8oLt8CTwhUafB2OSSKQRLfWAxVu59saovtmSxTP/38vvG
   Sxoz6RmjA89FRy0RQsbVoupkME6MM0XrfJp+wtw8C66tR5552PVmRwkVU
   aTtr/IGoHq+D8K2s/0tIN8mpJFypLomJ+eSmux8hojBEFxXg9L3KDkUjo
   tP0i741zkKg63RFbeh88LHHkOYNpiTHuepwX5R43rrmdqsA1uhSFf711I
   g==;
X-CSE-ConnectionGUID: UXgm2ZkfShapF+fwobQqzw==
X-CSE-MsgGUID: KR6bEYjHR4ONvkGsf8ssxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68727017"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68727017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 10:08:35 -0800
X-CSE-ConnectionGUID: kejYe3AwT3u7402cqvwf8A==
X-CSE-MsgGUID: q14/Xq31SyCXzoHTKL7bMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208629735"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 10:08:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Jan 2026 20:08:29 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: hp-wmi: add manual fan control for
 Victus S models
In-Reply-To: <aWUvvzDCtVCOaBwq@archlinux>
Message-ID: <f6ca0445-431a-f9d7-eeee-0d437efa3c76@linux.intel.com>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com> <20251230145053.516196-1-krishna.chomal108@gmail.com> <20251230145053.516196-2-krishna.chomal108@gmail.com> <ce48f7b8-7d88-266f-ca8d-6af3b01815db@linux.intel.com>
 <aWUvvzDCtVCOaBwq@archlinux>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-100285923-1768241309=:1026"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-100285923-1768241309=:1026
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 12 Jan 2026, Krishna Chomal wrote:

> On Mon, Jan 12, 2026 at 05:13:05PM +0200, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 30 Dec 2025, Krishna Chomal wrote:
> >=20
> [snip]
> > >  #include <linux/string.h>
> > >  #include <linux/dmi.h>
> > > +#include <linux/fixp-arith.h>
> > > +#include <linux/limits.h>
> > > +#include <linux/minmax.h>
> > > +#include <linux/compiler_attributes.h>
> > >=20
> [snip]

Hmm, these should be ordered alphabetically and if the existing one=20
aren't, try your best (or add a patch to fix the order for all).

> > > +
> > > +struct victus_s_fan_table_header {
> > > +=09u8 unknown;
> > > +=09u8 num_entries;
> > > +} __packed;
> >=20
> > Please add #include for __packed.
> >=20
>=20
> __packed is defined in compiler_attributes.h, which is included in this
> patch. Please let me know if there are any other headers that should be
> included.

Sorry, I don't know why I didn't notice it (too much reviewing in a row or=
=20
too much multi-tasking I guess :-)).


--=20
 i.

--8323328-100285923-1768241309=:1026--
