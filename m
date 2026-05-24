Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5233382DC;
	Sun, 24 May 2026 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779656895; cv=none; b=Inm7WZ6vlLFl496WSE7zc9f77V7EUaiXcZOf6tEqt7/c6Asoo+mqFe4l5B7N0tsVrRHHfrs5/mJw0M+gheubUb7u3z5vOC8WF13giq2pxwCWmf478Z+UZTNmYG13uk7dibR3fKvk6iTsoMkvaCT4oVNJ5OifErq5ehic0bvJe/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779656895; c=relaxed/simple;
	bh=EcdAKWvGXDcDeBYHq/BRTvgnLbwI1es/UsWXWT5WTTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BsehSh+9uIVJ/BEky5DoX/sFZ0j8xk6rtrZ+XvA4gHUK5CV8TCNljVVAmk9dB6C2gjtqhZDkNg0kdnnnc1866stPaHEZ5gtjB9OTilGMOOKIdu/OCfhQ4NzQo9MmPhxauNOPcCeKVNX6Ul++cU73IjcBOUShJpCSqG8TpU5sZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQQgs6iR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQQgs6iR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7510B1F000E9;
	Sun, 24 May 2026 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779656894;
	bh=ptT+8waT4oskw5av9rKOB2AlBkH9KDIp95lj33RWbsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQQgs6iRDdidGJEoqBDwo3URvkBa+vCZTZx5TISqMzMSx1bxKlT0pESSKIZ+8cYxZ
	 iTbeaDKwHmhY+MbX49Htl2Bk1vI80BtJ9VCymkx3o3MaHG9SIWlAd4Ofh6LwS+5N+K
	 KahLU2iWB7iQ4bLeZjOZ5GnTFiYbIHf+rKa1+Qf0lthEOwOWLGF92dTbdtDYUkTbDl
	 SEpqvQjDBB/DAhZbZRXEKx+zNthvTE5KZzR5s7EgZ3EnFKyDVo3xlWNicXABnb1Pcm
	 0v4i2APPzcyCDh6QN4mn/LsQNlKuFFZOC5SkSmXnzsvEmquAc7+svIxz0lYPpNvvxi
	 cEleE5sd4WcrQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260524205112.26638-2-wafgo01@gmail.com>
References: <20260524205112.26638-2-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 21:08:13 +0000
Message-Id: <20260524210814.7510B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Wadim Mueller <wadim.mueller@cmblu.de>
>=20
> Add a new IIO channel type for liquid volumetric flow sensors.  The
> unit exposed via the standard _scale attribute is litres per second
> (l/s), so drivers reporting smaller native units (e.g. ml/min) only
> need to set a fractional scale.
>=20
> Update iio-core's name table, the iio_event_monitor whitelist and
> the sysfs-bus-iio ABI document to match.
>=20
> Signed-off-by: Wadim Mueller <wadim.mueller@cmblu.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524205112.2663=
8-1-wafgo01@gmail.com?part=3D1

