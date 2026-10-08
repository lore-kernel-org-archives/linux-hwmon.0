Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F013939DB
	for <linux-hwmon@vger.kernel.org>; Thu,  8 Oct 2026 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493543; cv=none; b=k+K97LRNWV7jXWXOpUspWBzP797lB4U4gLlGJOImTvNlwFWoZ+1CKKBfF2F1uALjSqJ+IFb++wPx4VWXKflEMdk7ZVqb2XffKBij3tNLcpfvLP0GKBdDinr3GIfazjcAqS0QUQjLw+93Zl2UbrljiUBaU4cmPyKxdc6yYUp9HAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493543; c=relaxed/simple;
	bh=2HrPDmijIBAa9LOcoxg2wWHo6E4HdkDXMtqkEiIWB5s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tDnyGqX4n4/Ml6UhSiA+eFn3H1OICABAauy6DMRF9hvMfTlqjJjP3/OT06TUPmvPtUpV/oMXtq/y4iye0VQTnuW817PcwIJvmUtq9okx4ybQaPHdkjmcsavKB5aCW6pIM4LfHH87JPR4g0gPu7ax/EEOMEQnSCsr0rqd9f7bGVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQFl/I+W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQFl/I+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B771F000FF;
	Thu,  8 Oct 2026 21:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791493541;
	bh=ixdsfL2wLj+8HtyeokxFS1yzjkwwL4gWUYEz3joTbsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQFl/I+W0siUbJxy8+pIwavEnx27FfukOc9vdtP5dWqBKuBu6N9ufTxnHWKDXD25T
	 Qyeb8g3rcgQ9wZJV1Zk0biUxXZMvWjDyMbB/hU3i92X/I+Z/1E6ajD/cQtwZY3FsID
	 zUcgJeB1I5gCgrXP3JfMTudW3JFtcUjV8oeDwr2TSHXtRLozIpJb4nImdJ4cBvYA7+
	 yhc0mo1Yyntsae/19NJcz3C4BakiyNVsn2S4ACepEpWo8WWMZjWw+94hcwPhQovhur
	 NDaiDJu+dzM6fBiAjNYyoj67nt221B1lUb8CdutUYLiVu5RH7noOD7igGBM4XMDJlD
	 RgcHA0TtvvBxA==
Message-ID: <sashiko-outbox-164595@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (corsair-cpro) Make wait_input_report_lock IRQ
 safe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sanan Hasanov" <sanan.hasanou@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261008205310.30832-1-sanan.hasanou@gmail.com>
References: <20261008205310.30832-1-sanan.hasanou@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 21:05:41 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanan Hasanov <sanan.hasanov@ucf.edu>
>=20
> ccp_raw_event() is the HID ->raw_event() callback and takes
> wait_input_report_lock with a plain spin_lock(). This callback can run
> in very different contexts depending on the transport: from process
> context (e.g. uhid, via a write() to /dev/uhid) with softirqs and
> interrupts enabled, and from URB completion, which is softirq context
> for HCDs using HCD_BH and hard interrupt context for HCDs that do not
> (e.g. OHCI, UHCI).
>=20
> Taking the lock from process context with softirqs enabled while the
> same lock is also taken from softirq context can deadlock if the
> softirq interrupts the lock holder on the same CPU. Lockdep reports:
>=20
>   WARNING: inconsistent lock state
> [ ... ]
> Fixes: d02abd57e794 ("hwmon: (corsair-cpro) Protect ccp->wait_input_repor=
t with a spinlock")
> Reported-by: syzbot+0f98b0c0bdeaab2dc2fd@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D0f98b0c0bdeaab2dc2fd
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008205310.3083=
2-1-sanan.hasanou@gmail.com?part=3D1

