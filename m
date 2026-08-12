Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A0D2ED84A
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 00:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786495214; cv=none; b=EBG2Vd3BgDP2XhgX4bN8izQtevq+wt/fK0fWg62iNv8jMiaD9053JUI/j32SPx4/J+oS/CfCKJdJ+jPrfuFkpQUVuOtwbgGfWp05uE0PJMMq6ioAZ4biScVYVdCFYsOIMl8nrMdV2yGzDmju7je/R9vI8CUdJdqUBI/APIdacEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786495214; c=relaxed/simple;
	bh=QFXwVFTdu/gBgOsr19Rhq4KXu25u8pjyakbZtcj0cxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iqlyb75DUbWPHxFTKzpGIaNcxbWc2DilffEZag8G6aO7mqtJK3PM6vhnaDQ3GKa55QUztQSpRlWNd4FnKJf3KftL4TA5P3NH0QOU2U4gAMf37pKFrXw+QcUkEwUPTWdbYLED9iQs1oMKcvBBncoFHyDmPsKkpAHAOFtlG4EYp/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ph7gw+QL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ph7gw+QL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4B71F000E9;
	Wed, 12 Aug 2026 00:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786495213;
	bh=QFXwVFTdu/gBgOsr19Rhq4KXu25u8pjyakbZtcj0cxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ph7gw+QLcfsxIhPiglnlykxHais9xQcLmwWgkf8AfencKbdRoKmWOt0AnCzcPkwhU
	 YFfp7j/WEoAUHr/UIgxdZCJ6aR3XwCS+mbvrIW1cO6J5QcmpuTLBKVtnS1/Jsuee2J
	 AogA+729acuv+LLf6vjrwRYBdZOLZmV2cwFOXPz+E/ZFsYdzpwDloibpuL/KmboWRv
	 J9fYC1D8Yq/eBELdXc/XjT7kpsZWvn0WSn4OjjrcUHhQIO6EY6hJu7iUq+7NqkFbrX
	 kqGdt73NHkUx/Zo36w1TSL4HR++P47FIqwKNRM1senka8o2YET3IxT/Kak4jjFU4tT
	 5gPvBy5KYnkzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
Reply-To: sashiko-reviews@lists.linux.dev
To: rahlquist <rahlquist@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260812003234.93924-1-rahlquist@gmail.com>
References: <20260812003234.93924-1-rahlquist@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 00:40:12 +0000
Message-Id: <20260812004012.DA4B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Lenovo Yoga Pro 9 16IMH9 (83DN) exposes its fan tachometers at differ=
ent ACPI paths from the generic Yoga configuration. Add a model-specific tw=
o-fan configuration for the PC00.LPCB.EC0 namespace and document the correc=
ted mapping.
>=20
> Tested on a Lenovo Yoga Pro 9 16IMH9 (83DN) with BIOS NKCN35WW: the patch=
ed module registers fan1_input and fan2_input, both reporting 1800 RPM at i=
dle.
>=20
> Signed-off-by: rahlquist <rahlquist@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812003234.9392=
4-1-rahlquist@gmail.com?part=3D1

