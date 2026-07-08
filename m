Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B842E3FE
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541135; cv=none; b=JKAINg9xpcaVBN6J4i4cWFuE5pXU7qqukWLYFyYWUmO5JDonY/k7SK6It/JpnlIfaGr0pxuoXo8i9hoAPoxZV0V0AJTPGIk/tnCL689Wxqym0A7uldgK/SWzgFN9tvFUWQwF43eA6qDLPtFhmjBS7Z8/tfaWThodh0ebNlc8L90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541135; c=relaxed/simple;
	bh=EkbzQLQBesNIk/reNjZ4wlDPfW3vwid7gM5bnCQA1No=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yh1g3cRJY0V+xfz6p/1xXyuJ/o7bE+TSM5CY7CQTgVq1YdX0rQSXobt4DbvbtHghPhAu9JwDw2p320UhkgfPx2kajaaza+RF52elf0XUb9RcqHW/nP6oOsB/VjpB0EYku8A7WifLss2DQ3iKWuZ0BsYE66DLlKqzTfdtNXsDeUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcalYUmu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcalYUmu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0861F000E9;
	Wed,  8 Jul 2026 20:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783541134;
	bh=EkbzQLQBesNIk/reNjZ4wlDPfW3vwid7gM5bnCQA1No=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lcalYUmuxLNfwt5BG2rnEFDHrMEquyBy9ESTcdQtClSoHnprWw+hqIn82OcItIdCo
	 v0ZMvJEMVTmWfXNjoH/E70q0/wEmN9LNk7gBfIBbzkX/3O9MYo6OKWhfqXDqV20tyT
	 kEKiCMHGiic2pe0kOArHUHNCKag3SqIwXyEFEzMi/2uYzWklImZMMwTvonEVjlQ3xy
	 rJ0Ifz6wmwRTs4Q2BC7+xiuchTXhXjfIR1M7ehF7V2tV0PwjMmWyHkFsdFrOTkv01q
	 yE3rvl+EJCotaN4yV9T5ph6kU35Sg/16eembBxxmq0HQAB6SEfSA5S6DOqlfjwT5ah
	 p2v3ObRdQ9ilg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus_ec_sensors) add ProArt Z690-CREATOR WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708195638.1324168-1-eugene.shalygin@gmail.com>
References: <20260708195638.1324168-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 20:05:33 +0000
Message-Id: <20260708200534.5F0861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
>=20
> Add support for the ProArt Z690-CREATOR WIFI board
>=20
> Signed-off-by: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708195638.1324=
168-1-eugene.shalygin@gmail.com?part=3D1

