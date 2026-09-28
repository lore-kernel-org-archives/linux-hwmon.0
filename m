Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB5315D32
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 04:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570077; cv=none; b=US4pi5wuTsLN2oRp1v0VbdQFg9nfiqcpQ3fs+o84vyqBbmXWnldkNwFSNk/S5ZiAZvDyBR12aXeOyL9pa5hv0PjV6outyre8fstG1vQ7PuFcEMKWYmw1Hi7Hjep5AqlVZBUxUlt0M9yqctTNbwjIojRnwyfbTTxGhkFSGH9hXsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570077; c=relaxed/simple;
	bh=HHlRKiU/7XqJxhDWpcK12mA1DmBafMa0IdOFAnZsOrQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tzkEputCP3neimwv7bubeeyLlllPwx3Xa4aTVKVqDCU9qzA4s1Z4YJ4dghFPxPGmK9QKcQV8lARUe0tXOZ3WhRUP0KvjVBZFacxJvKljR9kTwpu5iWDIEjrL/Da3iDNIFKPiEVz4Wk6XgvqxidCYMriexpGGsIYUK1a8m86UfpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nymYxs1N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nymYxs1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9081F000FF;
	Mon, 28 Sep 2026 04:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790570076;
	bh=HHlRKiU/7XqJxhDWpcK12mA1DmBafMa0IdOFAnZsOrQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nymYxs1NBoVvsv3ITRZ7Hh/QV+7WPi5EgCLx0DOHBpcYLN/VxZQD1EuUovWKMpZc8
	 c9VoTeJ3imDpuP5i805tlWxZkOF0lcjb0QoBhen+OLTEEDijlCy68qXWuVGeWEUD02
	 9cAPMzdBjgUB7ZO+o5Rf41vrPZ3fBldJjj1KbtFRBvyjgUYpCdkic1uoAWh4jZf7B5
	 shA/DugKr+E2v5TMHM0dzeWxJHalAV75sE3iF0EDKRqbrQG4ptkvsYIeq/EmL8srcG
	 f9zvND/kYU3feKR8lEQg7G59rdiBIfZn6WYZlrPB35VHgKZiTWTNSMsD7+moGLInqK
	 EbYQLZ4x+7psA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support for adpm12886
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>
References: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 04:34:35 +0000
Message-Id: <20260928043436.1E9081F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> ADPM12886 is a 1/8 brick DC/DC converter that provides up to 98%
> efficiency at half load. Can sustain output power of 1200W. Uses PMBUS.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-hwmon-next=
-v1-1-55b6c5cd8e2e@analog.com?part=3D1

