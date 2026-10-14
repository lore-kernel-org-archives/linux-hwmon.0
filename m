Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1D64A9D7D
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 23:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020971; cv=none; b=pIQ1sbre7p8U166I3Px7h2I7hw8eEfiPKJQwK+/qX4R0NJ4XQvIZuHg5qIWcUUwckafpDyiRL/tIAqerH8uxkbl87PJqEJf8QxSwvU8l7cgmVfbA4uN9wDS0l5e6QydxteabZY/O5hoXPv+a+UIWK5aCrEIiDXdgGlSqAG2fC1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020971; c=relaxed/simple;
	bh=PdKGOMgdBiNR3TBd4M2/ZRk0ppBPNO8ixsk/JCtbgco=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qT2i44HAt1PxhF9LsoTfuxyr3D+sV71UTIWayfzNofwnzX12iyCkl8u3lSmIy2D7+F1rD3l0DOHIwxxWVqzEdfRAntOle7tQeWwGbcIIXFM8qN8z36b6C40OM+RVXCwMFNAlmixOdwipjS19qj0JFIxl9mo7ODIj/zCqztwrQTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhvTHNmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhvTHNmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42AE1F000C4;
	Wed, 14 Oct 2026 23:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792020970;
	bh=PdKGOMgdBiNR3TBd4M2/ZRk0ppBPNO8ixsk/JCtbgco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YhvTHNmOKuhMPXXaCR25rqPte/b28QlIY3ajmfXp6NhhnCuTcn4HGm/1JCjfuYS/K
	 kfR9gN9MdRD56XsEKfditI+9IO5yLF+DGEAq4QTdu7uGAQ6voPGWN4Q9eokb/37Qwd
	 jy+UC3wg96XZcX6MZHzuiht3v9i8pqbPk/fSnIBVQSxlzp6pXA6JzQt83xDz08X+XD
	 Ev6aBZPXHJ31+8FJuz+qAlRvae6TOSkNzjJF9cIuakSCFn2YwfLLXff+f6J+hzUjVz
	 VK5vLhUXjmzH6XWwSw3y8NNRcSrfvTFlMLsB8PLncV+S1GQB6i3VmW9oTkkGoY3HX6
	 uZRYzLChvoU6w==
Message-ID: <sashiko-outbox-172022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus_wmi_sensors) Drop misleading BIOS upgrade
 advice
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qian Xiao" <heyheyco@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014233318.34567-1-heyheyco@gmail.com>
References: <20261014233318.34567-1-heyheyco@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 23:36:09 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Known Issues section suggests that upgrading to a BIOS with WMI
> method version two or greater should rectify the problem. However, the
> driver refuses to bind when the BIOS reports a version below two, so
> every system using the driver already meets that condition and the
> advice does not help.
>=20
> Remove the sentence. While at it, fix a typo in the preceding sentence.
>=20
> Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nh=
qj9mose60t+Rrry1aPvw@mail.gmail.com/
> Signed-off-by: Qian Xiao <heyheyco@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014233318.3456=
7-1-heyheyco@gmail.com?part=3D1

