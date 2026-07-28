Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0322370A
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198896; cv=none; b=KHS8LbH/ZSxVFYL6kszdC7Y9B0pNc2fkcoVZwbz5cUFy2CTeNWl+Wgx6mj9IxyCRf+RecgEUkOKmKoD/0LzooLCbPKbBnHqtBk0m6w6uS8gIAsawWXYP5l3RcpGG7LnZwak8N6tSjbMq+4kY9Vbs2fD5xQY3CSM1HEuphBEtecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198896; c=relaxed/simple;
	bh=ifVp5Q1cisIhvd/6lPXIGBDd3oF5/OL1WDnal3e6s8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uJp2T1y4LfC7ybZpqMmcu/c495q5wC0LCWW3zQ6CeFJy6q7580km2pBLjykpcKLSgDQCA55tP23ZT1dZEtWWE51Lr4OSjojai6HaaIM62ulb/B0aSFDFPZ4cL+5BiG1ck+W/9rdgByxfmfrf4EQJQKr+cheQFy3t0Ho/Xna6WIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKWHMoZs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKWHMoZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590471F000E9;
	Tue, 28 Jul 2026 00:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785198893;
	bh=pDBANC9F/caPXtAG4GfS+ZddxfuD3ZUVXblB8gQ4q5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bKWHMoZsVUKeJ50pq828f1EY8fLmUoIfLB1J8UzwQBZF4YSSFC8nSS4/WUrSwqZ9K
	 2cWqbGGgypqejKSlIlOTfXlxmYCXFJZG46DWVuvD+S7rBPirYG1HaYYViSyyoy7upV
	 FsYHfJYbjsoofWrN1CMFEAsg4neyGPJ5hVJP9F1ESYeoMGElGCIyjPrHr4gZmKpo2H
	 PEAuHHxgE9oGOW3ICTo0s+MUXSpzcdNIM7xBlCnRnwvb0Orr+eM7hYyObyZ9bYdY53
	 8B6xA5BG9qTjLnxXoW5zbdkiR7FAg06YcGAaSKc/jCnBvNRMYadXnLK4hcbt8qJcar
	 rlTmC/tiw8REw==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 4/8] hwmon: (adt7470) Fix swapped PWM3 and PWM4
 auto mode masks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_fixes-v2-4-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-4-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:34:52 +0000
Message-Id: <20260728003453.590471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but there is an inva=
lid bitwise index check in `hwmon_temp_alarm` leading to incorrect or missi=
ng temperature alarms.
- [High] This problem wasn't introduced by this patch, but a typo in `pwm_a=
uto_temp_store` mistakenly assigns to `data->pwm_automatic` instead of `dat=
a->pwm_auto_temp`, corrupting driver cache state.
--

--- Patch [4]: [hwmon PATCH v2 4/8] hwmon: (adt7470) Fix swapped PWM3 and P=
WM4 auto mode masks ---
commit 5ed1ddc6459d007f79bfd20aad146b331e6158a6
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix swapped PWM3 and PWM4 auto mode masks

This commit swaps the values for ADT7470_PWM3_AUTO_MASK and
ADT7470_PWM4_AUTO_MASK to correctly match the datasheet. The driver
relies on the modulo parity of the channel index to configure the hardware,
so this fix does not alter driver behavior.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 0b19b0925d1c7..a34635526aaa2 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c

[ ... ]

[Severity: High]
This problem wasn't introduced by this patch, but there is an invalid bitwi=
se
index check in adt7470_temp_read() leading to incorrect or missing temperat=
ure
alarms:

adt7470_temp_read() {
    ...
	case hwmon_temp_alarm:
		*val =3D !!(data->alarm & channel);
		break;
    ...
}

Does this code use the integer channel index directly as a bitmask against
the data->alarm state? If so, sensor 0 would never report an alarm, and
other sensors would report false alarms based on incorrect bitmask evaluati=
on
rather than a bit shift like (1 << channel).

[Severity: High]
This is a pre-existing issue, but a typo in pwm_auto_temp_store() mistakenly
assigns to data->pwm_automatic instead of data->pwm_auto_temp:

pwm_auto_temp_store() {
    ...
	mutex_lock(&data->lock);
	data->pwm_automatic[attr->index] =3D temp;
    ...
}

Is this assignment intended? It appears to write the parsed temperature
channel mapping value to the PWM enable state array (pwm_automatic) instead
of pwm_auto_temp. Writing to pwmN_auto_channels_temp would silently corrupt
the cached pwm_automatic state, which tracks whether the PWM is in manual
or auto mode, potentially causing subsequent reads of pwmN_enable to return
out-of-spec values to userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_fi=
xes-v2-0-598e38a46ba6@gmail.com?part=3D4
