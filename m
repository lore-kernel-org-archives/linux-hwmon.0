Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70B46EC82
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018775; cv=none; b=evJrNEVMVmlI+sjLKZGcsJuD9fSukMLGskBsHagALyb3/S6B6/9smSCeEILhSyOk40osYnRaHinWGxmBN1lEoLrepHdHSwNYJT8+1LLrIRj0lNqf7mQySr/Awxcpdn7Ar/U0ew7nl39RHzFq2rHcaaH5mxJ0MpqKTaZYG37GUAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018775; c=relaxed/simple;
	bh=dUnhpNpWhf5nfX5w1cR0b1hVBw3lm01KdqHBtn/M2vI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GlHnZ7JSMZ3cXslwHkaYR32EF4xZzBrxt4Z2YtQ6WOdvfivSXuxqjpOR5pWSobeaLoGpPEU4wJphHLCHHX+zKSN6htYVDJz6PLw0g8RUQmQ3aaj0AOjD2jOnWlCI8aRsdW9lMRFTawjs+VpSaESOMiXXbTVEPfPCRHpf0S1xLl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=GgNSYcSf; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="GgNSYcSf"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EF150240028
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 14:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1786018763;
	bh=NCgVn0w3xHeum5jT0tKu6lneE9g+gQGA34HfDE6xD8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=GgNSYcSfDOt6WvlJh9uCIdryzQCTkTYocuAbeShv37CDmQR/Boeegptfx4Fglt8Y9
	 K6swpis+Qa+q9VNKG49hf2X3wy9UT8Aaht+1qHMAK043Z9dyXHBBy4FohFH/RSGM1J
	 dg0EJLdYqqvn8GBy02oeSF5e3N8CSBfORoarw/p2DxM1T9cLklm9MeeKSYfVszf6Ra
	 7ls6GRiGyyWS9Uf+ymh76MV01XLLnmdPlZHnakBEFmN0QatdoZv8AkEhNzIDaCyzFj
	 H30Izsd/giLvAuVbHcbpLYLRshiQl/OBFVPrdJAFeKs5QVY4DXf3ZQelxUOco7fVc8
	 G/IDgaoRqzWdA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hG5tg24Hrz9rxF;
	Thu,  6 Aug 2026 14:19:23 +0200 (CEST)
Date: Thu, 06 Aug 2026 12:19:23 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ali Ahmet Memis <ali@iusegentoo.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
Message-ID: <20260806141922.5cf6875a@posteo.net>
In-Reply-To: <20505360-0780-4f74-8627-8135a40d9401@roeck-us.net>
References: <20260802123653.19532-1-ali@iusegentoo.com>
	<20260806072337.15496c74@posteo.net>
	<20505360-0780-4f74-8627-8135a40d9401@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Aug 2026 02:23:16 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 8/5/26 22:23, Wilken Gottwalt wrote:
>=20
> >=20
> > That does not even compile on a current 7.1.5/7.1.6 kernel. Though, not=
 sure
> > yet, what that is. But I can not risk running a trunk kernel on my work=
station.
> >=20
> > /usr/lib/modules/7.1.5-arch1-2/build/include/linux/cleanup.h:302:9: err=
or: unknown type name
> > =E2=80=98class_hwmon_lock_t=E2=80=99; did you mean =E2=80=98class_task_=
lock_t=E2=80=99? 302 |         class_##_name##_t var
> > __cleanup(class_##_name##_destructor) =3D   \ |         ^~~~~~
> > /usr/lib/modules/7.1.5-arch1-2/build/include/linux/cleanup.h:422:9: not=
e: in expansion of macro
> > =E2=80=98CLASS=E2=80=99 422 |         CLASS(_name, __UNIQUE_ID(guard))
> >        |         ^~~~~
> > corsair-psu.c:667:9: note: in expansion of macro =E2=80=98guard=E2=80=99
> >    667 |         guard(hwmon_lock)(priv->hwmon_dev);
> >        |         ^~~~~
> > corsair-psu.c:667:9: error: cleanup argument not a function
> >    667 |         guard(hwmon_lock)(priv->hwmon_dev);
> >        |         ^~~~~
> >=20
>=20
> You'll need commit d1e720c7328e ("hwmon: Support guard() and scoped_guard=
 for subsystem locks").

Oh, I got that confused. I saw the commit was added to Torvalds repo in May.
But I wasn't aware that it is still not part of the official kernel release=
s.
Ah, I can just add the two lines from the commit to the headers of my local
kernel build files. I will test it.

greetings,
Wilken
