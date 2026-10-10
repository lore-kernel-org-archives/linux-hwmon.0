Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B490F38DC6C
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Oct 2026 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599181; cv=none; b=Gt5qxIwQrnh3attC87KE4dowIV6gxYL+nBn7K6Gt9UBtYlEKBkzVBYuJnl+rjwdTAAlRFrEu9H2IZA19RPD0mBaFCL44DyQI4HsgzJPU0/+elIIaHjM1PGkiO5Tgaqk+DfTuzkTEhs87eXfaWdgM82t9JCeh+PBxMmPS2OlAvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599181; c=relaxed/simple;
	bh=pnRWl9AYbCMha2BmQ30bdCmG7mvs7aMfEiQ0yVQUUdc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=g0YE7czS8KTFoXeThGQ/Iotfl2wXU96C0y7UW2chHJNd2NDfY4XBjZJkgU3zUHqm7aQG9sogYBv9uIO0RrzAoxL9QwYGGZC37R/zDoJLwJ8ImrzZT+iimCe4SvPTJKkCmNTicNVUtv28lh50hDK21E1LRQagRVRj5a+kDl6VnF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkVi5mK5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkVi5mK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2488C1F000FF;
	Sat, 10 Oct 2026 02:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791599180;
	bh=pnRWl9AYbCMha2BmQ30bdCmG7mvs7aMfEiQ0yVQUUdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkVi5mK5A0pEN66RRMgOx+//KO6uhuMP2pJ4Z2noPpC69njLKzEiFLF7cUXifG12/
	 FccuT0bEBeA7NBt30mb2GuE0IISiK2YhRtpuJAvbK+ReDvqQfUsIJTPMhOlSmJB40p
	 qWigUBk3QM2FbRBJWPVf0tb9LOUOYGchdI3RRXq02K4NPQykAj+pehet/n6eM1hNSr
	 jf+Lp86L5KVAe4L29mJo9cO9QFWCRusdFZtmD48gFr4QSiKm80k2ip0ADDn8bh5c1j
	 tdqsQDmUzo6kaCZLH22LpruPFtYNetTVe2nesUokyxRJuck1f0hPFHsYkyO6yMz3Aq
	 mELKwgiQY+xXA==
Message-ID: <sashiko-outbox-166213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] drm/nouveau: Fix memory leak in hwmon init error
 path
Reply-To: sashiko-reviews@lists.linux.dev
To: liupeng <liupeng01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261010022006.28263-2-liupeng01@kylinos.cn>
References: <b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com>
 <20261010022006.28263-1-liupeng01@kylinos.cn>
 <20261010022006.28263-2-liupeng01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 02:26:19 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> In nouveau_hwmon_init(), if hwmon_device_register_with_info() fails,
> the allocated hwmon structure is leaked because the function returns
> the error code directly.
>=20
> Fix this by freeing the allocated memory and clearing the pointer on
> the error path.
>=20
> Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except the hw=
mon interfaces to THERM")
> Cc: stable@vger.kernel.org
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: liupeng <liupeng01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010022006.2826=
3-1-liupeng01@kylinos.cn?part=3D2

