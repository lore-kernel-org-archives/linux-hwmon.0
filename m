Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776E351C1C
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970560; cv=none; b=A24eed1/N13M8PYOw/zgWvxJT+/WSCSY4iG7cGvVrDiJqw6C9MIjzdi7sC8XPmxt1P41GIhTWA/8/uipGiyLOuQRaGQTFXry9nDLyk4Ij4O+TAKhlmuI7p0eKpxr4rnfOMfV0cAAo0Izig/502ZsafG7vxsnL4iOqPnEB017Cg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970560; c=relaxed/simple;
	bh=2isBYX2ojPXZb4CZTGYJDmkQ7hzcA3bEaxdb1Mfz+FU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ux9g2mAlB0hpwBRKRZvnZzIHu7lVOxYuV1H1Sf9/UN6w0kBK6NJ+YPr5cMhK/3ot5v4Sg+p7wmc9sHVIJcpv818OJdxHSrrEGA+s6SsdUJpQVjarqmksTm0OBQn3ZDsAhRl6cFecjz1S2+JeJP8wCcB3GZ1McHzcVql7f1peoCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXqlaAaj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXqlaAaj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E346B1F000FF;
	Mon, 21 Sep 2026 06:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789970559;
	bh=2isBYX2ojPXZb4CZTGYJDmkQ7hzcA3bEaxdb1Mfz+FU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXqlaAajSETPK+sGuRbDE8gzFIocoZ1mJPuIXGqEkvGJLOT1bqQS94jPDe04pK3wT
	 DfQ0DqLrun9V92Mq8xS90GmDQmAyj8KZ9T6XYw74//78XxpnhjTpbavrs08iNM60BY
	 oZXEVatHeMDjPvv0yfvtX0kZtIP7dxbRZlVQpuNKfWZbAM0YoXEDgDeOQQvyk3xCjk
	 /gPQlPm5fP+qXKedn/54gQFfVCbgs33tvC9Uy6HQwB8qKHYiDa8/0lk1p6Pexucz3a
	 mEk7XeyAQYhfxCI7wQQQN5T5SyxRmb88y1WL+jc7pVQOoIRriqbFtpIDWLcJjIJZXn
	 GDZTOmHfIixZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/8] x86/hygon: Add Family 0x18 DF node enumeration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921055603.25112-2-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-2-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:02:36 +0000
Message-Id: <20260921060238.E346B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The AMD node code locates function 3 for node N at PCI slot 0x18 + N.
> Hygon has no equivalent node-index-to-slot mapping: DF F3 devices are
> discovered by PCI ID and the PCI BDF is only an access point.
>=20
> Add a Hygon node cache that enumerates DF devices by PCI ID and obtains
> the socket ID and DFID for each node from DF configuration registers.
> Validate the enumerated socket set against the hardware-reported socket
> mask before making the cache available.
>=20
> Place Core and DDR Dies (CDDs) before I/O Dies (IODs) and order each
> group by socket and DFID to provide dense node indices. Export
> interfaces for node counts and identity, F3/F4 lookup, and PCI
> device-to-node lookup.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921055603.2511=
2-1-wanglin@open-hieco.net?part=3D1

