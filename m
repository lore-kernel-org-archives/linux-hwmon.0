Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFD93F88AA
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779881456; cv=none; b=h1qBRelFYEjcckwhp5FzWzk11VmPzFWtFFlVgY1EWRZNoz4ZFQur3NGbGoWONOEFsvgm2YKPALc3dTykNG2jH1SGDizzNOQ6qQtUcGpSKjsDc3tq+IntwrxbyRKpMsFZkjAijV515rP/zJ+2U1KCcd8SZcxHfebTZz9uPX6TXd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779881456; c=relaxed/simple;
	bh=fw1Ongqrs+/2rMX8REiIJn3RFmBpt5FlhPmSGnaC6ks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VZgYAQMgFXHdCD5LQ0KFWYCqZ4n47vAAsqz8L1QBWVaRtDnWROCr+l8zLPui3ETYTDoXCzWSr8yalQbdOwOsPCZu9vOKdB9h9eUoHYkju8jRy6Q/+lhBsFfa1lEYEgGPJ8H3CS212p1T2sIdMju491B4U5fyHVLxa87nb4cJOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmlbJ4DO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmlbJ4DO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E5E1F00A3A;
	Wed, 27 May 2026 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779881450;
	bh=fw1Ongqrs+/2rMX8REiIJn3RFmBpt5FlhPmSGnaC6ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TmlbJ4DOeK/N4HKSVxoZBBXCDFPt1zeemSRr54RbOVTvXkbriMNc5O/MkzSYU4pxX
	 eS/sO1JlQRL256XhZlg29bahCAluf6TSl4X7fpk2VGiIQ7ksEQkEqS+ldejjfeNt3z
	 Zi1+2geUw9jELQV+8dhz3nws5ctGM57JMeV9ixOrp8uD2IxFaEC4IycSD7UR4okkYk
	 tZ55rmfxDeftRDZMr79g5Z8nIfDaqJyqiPdzv45NrbbsduSet0Gb67eTyCvVi8FRNZ
	 CfNAs9x2WjlfNa2ogi9aRceT00FE8D6m2TRZkfCtpMUM3SI3hV36q30cnERPJptOF4
	 nl5W7KppFX34g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] hwmon: (gpd-fan): fix race condition between device
 removal and sysfs access
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_395A116FDCB95475901B5E5C27237380AE08@qq.com>
References: <tencent_395A116FDCB95475901B5E5C27237380AE08@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 11:30:49 +0000
Message-Id: <20260527113050.05E5E1F00A3A@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779876412.gi=
t.xiaopei01@kylinos.cn?part=3D4

