Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B803380FD6;
	Thu, 30 Jul 2026 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426709; cv=none; b=SoS8CnR0JXnTEWv4nIs9riaN5CQ4wDR4PvkweFm/CT2odzPYG1+zVmDinWTQFSX8tk8ZWavES45k5WZyj3twj+41KOQ8ZqOrhBv6Wh8idlshu5+U8MNsSSVKAhlaFs531BF9uC96hhUK1fT4DfUx2vIDX2TJ4gm1KcSWQ/3p5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426709; c=relaxed/simple;
	bh=8b64Au8rnbNEQ+TI5ftrTb12jrzoU8d3ji4eL5tydDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OEA7YUm0pnGIdLQc+8WwAuk2GfAPmuhf5AZZa+YnIQSSKjFG7G4wXUQV+lcnxRMFu+nZCP8t7mUD6IOErSqABYtvkt8YvdShOcaU3t35h0NwdaSu1+1x8AuFNIrMYwfjfIEb7XHHLa5iqoASX5VMoUJ7822Ob9x/21Qlxj7DjBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBa/ffgt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBa/ffgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD331F00A3E;
	Thu, 30 Jul 2026 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426708;
	bh=8b64Au8rnbNEQ+TI5ftrTb12jrzoU8d3ji4eL5tydDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nBa/ffgtMAsFLVhFNP/ldwxcaOKWO/2Y+xcSFGFAvHe6O4Te4fDL5QfWjZA24WwvH
	 w02HKvY7Q5Q8TgQp5KaUpIXD5U84AGNTTzhF044O7d6O9OMniyVsNjQuBpuRajWM5j
	 N6V9cnQu0jve/GiWsf7KGszTTx0ur6j86XeC68Pv6/sngjMkTyVvRC+cXJPAlp/F6X
	 DZN43ekLWi5jIE1XeifsDtacBvhaRuR83E4z2yW04xouEbwQnKx1fE8BthieJFLxH9
	 M0RV/zbnd+pHS94yYScZfQZnhWoE+S8FPpLpYNOi08JDy83pU+/xqLJwFQvCQs9GdM
	 xztnemd649I4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] hwmon: (pmbus/core) export
 pmbus_check_and_notify_faults()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-mpq8646_v0-v7-1-e7c7ad768d5d@free.fr>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-1-e7c7ad768d5d@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:51:47 +0000
Message-Id: <20260730155147.9FD331F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Factor of pmbus_fault_handler() into an exported helper so
> drivers can notify sequence from a polling work item on boards
> for which the chip's SMBALERT# pin is not wired to the
> CPU. The interrupt handler becomes a thin wrapper.
>=20
> Like the SMBALERT# path, the helper notifies and then clears the
> latched faults unconditionally, so a polling caller inherits exactly
> the interrupt semantics.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-mpq8646_v0=
-v7-0-e7c7ad768d5d@free.fr?part=3D1

