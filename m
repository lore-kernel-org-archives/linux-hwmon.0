Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF516132A
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056767; cv=none; b=neEp8aCAWYm8LLIrY3vIJB7vojAxoc9UgVFitYgqs8y7cq/6p6Iky/AXbM9nESkAiU7TQSPvO7NmsvEya1pJVCMaKeC5sL/qokDCM+2lvNNwL0jLJ6F1kjOKVLiedJBsiAyh1Ow0XoF4+IZL3YfF5OktV71IIli9ffRffxyOazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056767; c=relaxed/simple;
	bh=PXfucc5rEQmtJkf0eN8p0n/+ROBJ23vHGffBJbsNsMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BBu9ZNOAev/ypC0aV3BBlzJepW6sDW7j7xoDFPxlKzDfQce62M9FQAniKQZ9re7jJ5hwYJo5dax4RUH+eNeHA2iKDnTPRrRm7/x6k3gs1BFvmorTnJwx01PsoDVPPV49UMkmouY2uPmIC+3wmV58RT4rFzVqLChx7rTe1ovqwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSRavRiS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSRavRiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2C61F00893;
	Wed, 10 Jun 2026 01:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781056766;
	bh=PXfucc5rEQmtJkf0eN8p0n/+ROBJ23vHGffBJbsNsMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GSRavRiSLNr+4BjS5PSWF0kphvYObgpxaWr4SjDYGP2psRUN5YlXPZ1TODuatPl6+
	 CV/TzqvFtfMj7R+03OgbmI7um2gBpS34tZNw/w+svls6gQnqONKAPvKM+QUmhiUdW4
	 9I8M7i69cOhJWEdlx721Z1DtEYVGrErfwVfzREGU9ErL9sD9JyZboqhfnVSmj8LDiD
	 KkX+hd5H7jJ8cmOk6P0BZ/Qop1CBwoGfPBSSQJPgdJ7TweJVM4Xr8Crspa/gJtjtVw
	 mUmvf31gdo5laMmgT2sSuW0llpZwaB9kfc5TxN0Mn7Zztyg34uBe3xvHSkBfpakLPZ
	 /FE7Ltgq0JRtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: (gpd-fan): fix race condition between
 device removal and sysfs access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pei Xiao" <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <4400828422cf3a88adad4db224d9efccdb1049d2.1781055639.git.xiaopei01@kylinos.cn>
References: <4400828422cf3a88adad4db224d9efccdb1049d2.1781055639.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 01:59:26 +0000
Message-Id: <20260610015926.8A2C61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781055639.gi=
t.xiaopei01@kylinos.cn?part=3D4

