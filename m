Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C804442050
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 01:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780883262; cv=none; b=l6g2t9ZhiVxiE7TwSFqTW34DpPhZargCKbwfVsz48hIhRWQ14WrEIhR2nCWlqf5cqu/m+EVAxhefVJ1gS/50vmijNLxHBBacF0/JUCQvGEOT7w0yiqo284G2AIaF1AElFKkjBxp4PxkXbZerMDvJeIcCawYmdDcXmLHT6K/cnxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780883262; c=relaxed/simple;
	bh=Az+XnvA31HQGhUw99RalEDmWTOA8tnmFzie6SJdjRmg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QXL664fkg6+nlopEw7ZnUHs+GV11LwRmWCDh0/Yz+ODNtWX4k4MZsqwhpcxNoKUdhGeOpn6Ju9yqEHlmZKq/cIcNV2AjIUNCWUdfngdPQW2xc5IjjBB9+FbMjjFJZLRilTw9MOIgY8h/XT8Ys+4V9E3LH3jdSOUImr8C345F6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjQxsz8a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjQxsz8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5011C1F00893;
	Mon,  8 Jun 2026 01:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780883261;
	bh=Az+XnvA31HQGhUw99RalEDmWTOA8tnmFzie6SJdjRmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LjQxsz8acb309zJ8phGLFcURVuAWYuJainbYwoGvyyNssVOPeXCSdzYekZLIgigiF
	 ZqqrcYES5SsoYs1/smx19LGs1YBeSS2pda8026WKW9gqqaXdbRINKd8DR0X7Lzl24z
	 ZAHusEfRfRFlKbAvWE1znHzcty70kW+kmj39ca5X2A+fgr0gftAUM9sXfb5NKejHMZ
	 3UvrS5AtjCJ2NxVPrhuSw5kXgrSsNFBxfM1oDYLlzdgR3Hyu31zLtnZilr3GxIpkNy
	 jgBCorNzpKUyNXT5YEZXrW1Yy2RykI+qwpyTMmI+NkiNqmdXASj6VrOpPRO0oen5Go
	 ZVWng2905H6IA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] hwmon: (gpd-fan): fix race condition between
 device removal and sysfs access
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_A052CD0BE2646D6ED4152D429F1B9A4A1E05@qq.com>
References: <tencent_A052CD0BE2646D6ED4152D429F1B9A4A1E05@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 01:47:40 +0000
Message-Id: <20260608014741.5011C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Pei Xiao <xiaopei01@kylinos.cn>
>=20
> Replace the manual gpd_fan_remove() callback with a devres-managed
> action using devm_add_action_or_reset(). The original remove hook
> resets the fan to AUTOMATIC mode, but the hwmon sysfs interface
> (registered with devm_hwmon_device_register_with_info()) remains
> active until after the remove callback completes. This creates a
> race window where a concurrent userspace sysfs access can interleave
> with the EC I/O sequence, potentially corrupting EC registers.
>=20
> Using devm_add_action_or_reset() registers the reset function as a
> devres action. Due to the LIFO release order of devres, the hwmon
> device is unregistered (sysfs removed) before the reset action
> executes, eliminating the race condition.
>=20
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780880972.gi=
t.xiaopei01@kylinos.cn?part=3D4

