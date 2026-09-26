Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E034F24C;
	Sat, 26 Sep 2026 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790460920; cv=none; b=BLGZ6C8xH21Oi08Pv00azhLF76/VxEfOEgJNT/Mo4SkoBehO1YPQGDSGXQ8AGNhx9OYUGHTjfi/g0rkyg6i8NcDMTZCD1/MyF7VVLN0nfGYodPKHzUhegqy1jWJwer9y2e5rYPWYrAmCay75Z9HCiWjW3C85ffHz/k4Pf+d4CAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790460920; c=relaxed/simple;
	bh=3BbPYjemdXEWPMr4jBZuCTND32GsnCx7p9ChW7jJl7c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxLFGZ6x9SJhnET4/CD/Te8OMn5SKy0m0wU+jkGaRhns5iRoVr1ggOPMD0H6A65HcsPReYpbDTw73ptbJ3C3PgeznVew/6WpZcmKXKW83t8znW6LKmlSCpjX0YUpKT9wpJqhQMknS0tuQWHI/XMwJhAooF0ERLoaHG3GZmE/Oow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jFAhr5qK; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jFAhr5qK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790460914; x=1790720114;
	bh=3BbPYjemdXEWPMr4jBZuCTND32GsnCx7p9ChW7jJl7c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jFAhr5qKIjINouvKnWdkw7tmoo1Gv935ImcmruzeGfFiqNU0IT393Pat7E3SW4dNh
	 lUIaKRa5iODZ+8LtxNP5EFrNN4FVPS6k+UXYwQnvTmii1gRokiPAAToTG+vGzr6MQR
	 5kCr46vf9xZHOYJNElkETlb/MBRMnG/sH4K+GRK0lHU4LyzJhWkVG6A5kLX5CUwHgI
	 5BLAFN/pdSngKPuD6fv1ETnforJDUajJTwFcLwSBiwNjWGyNdWNoBoWpj1tNEGLdf9
	 ek+LK4CrmzbZqHKadpPIoRprI4KKCDoUJ9paFoWFYsg0qYC0WKxnz6c1S7NZ/oPxYR
	 XpPk/61PVMdBQ==
Date: Sat, 26 Sep 2026 22:15:10 +0000
To: Antheas Kapenekakis <lkml@antheas.dev>
From: Alexei Solcanu <alexei.solcanu@pm.me>
Cc: Guenter Roeck <linux@roeck-us.net>, Cryolitia PukNgae <cryolitia@uniontech.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD Win 5
Message-ID: <QSDYmpltVygiY2PJ_y1ySG-1KUVxaRFdsR4fOPLjy3SNL8Phr0Cplf4Hk1Q3rdpKh-ev80AA3e4hdCOrIlxEpY9yKjx-jDB65k0rDLWwINg=@pm.me>
In-Reply-To: <CAGwozwG+JrZCJ-zkAB7yGCOgQPKDgQOu+oeXiSM9aVB-EbfYsA@mail.gmail.com>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me> <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me> <CAGwozwG51ZAWEbhmwAfbU1RNu2QCJ-cnQhXcuKQb8e7bWKVeDQ@mail.gmail.com> <1BPT38hSheXA0fiDcjiUhe40l_nA8P9jiPQG4TfQCki6CMVZJr0V2DjfbEvQl1gD1UdajSdRKAlJwAVUWgODbxDTML6hk5lLxkaQeKN0e48=@pm.me> <CAGwozwG+JrZCJ-zkAB7yGCOgQPKDgQOu+oeXiSM9aVB-EbfYsA@mail.gmail.com>
Feedback-ID: 211386292:user:proton
X-Pm-Message-ID: 159a4f4fc4987ef5ab40d52338e913a13ee5ae75
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 26 Sept 2026 at 23:52, Antheas Kapenekakis <lkml@antheas.dev> wrote=
:
> Actually, recalling what we said last year duo had the new layout but
> only one fan if I recall. Cryolitia can confirm. Then, only Max 3
> needs confirming but even then you still need the new quirk so most of
> this patch is good as is

Cryolitia confirmed the register layout last year in the out-of-tree
driver [1]: the Duo has two duty cycle registers but only one RPM
register, while the Win 5 has two of each.

So v3 keeps the separate win5 board data, inlines the helpers as
ternaries, and adds win5 to gpd_module_drvdata so gpd_fan_board=3Dwin5
can be used on the Win Max 3 until it has a DMI entry.

[1] https://github.com/Cryolitia/gpd-fan-driver/pull/21
