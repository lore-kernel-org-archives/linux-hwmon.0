Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A863F9D9
	for <linux-hwmon@vger.kernel.org>; Fri,  8 May 2026 23:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284135; cv=none; b=eMmHIbM+WTOtx8KpbMfnRcsFP/Y6kqVV46FYMvE92s52+pVXArDUPoxi6WOT8tr/kxgV7rvQ8F530QYcpGRtRv8jAajZYuSDrW5SyPFsyN7Fx3PTMYR5FBT/DZv/Xcn30EEpMD+x0YbpqfFT26jYEHziE8iYpSXPMLGCkrTnWOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284135; c=relaxed/simple;
	bh=pN8WWCsIOmEErxl0YHBNvGHxxWfVaCR/0Gi//31+kQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L4lCtZoITbaLAeRkRqs0L2jLAAZKJQXLcCkYy2O+exdVRCLSDJ89qyJE3ZGSqYsIgUIhHQKbxpGpQbSVCoS6UTYSI0RBQ8uK2gaKj18Jo57b6zbyRYLwT6uuRBteY+EODGKz8QC2QbSy6OX9PBtT5WkgL1PODAhArty/D3pphbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4cdbaUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4cdbaUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BE4C2BCB0;
	Fri,  8 May 2026 23:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284134;
	bh=pN8WWCsIOmEErxl0YHBNvGHxxWfVaCR/0Gi//31+kQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=n4cdbaUdVmiZMuUPhIhjUeg4ikB+Tsp6/PhRIx2D5kK0tcki+QU3E58VOYJz8IPVp
	 A2ZOS01ikc5li256olwv8gyJlTkYE2ouZSjSigCpqR51jTGbGOmTuVDFxHX+493YpR
	 3vQLBH8XkNTXCMnTMMTZZ4Ultn4LbeURWilo1IIJm8SD9ByRjmhCtRrzZYj5+ceXEE
	 wZeJW6wz2D68lPo/C5f+520sxROVkxx63FOJdtY6q6CYrJpHt3rUZD6iwHIWtvgRI2
	 4yvxMhxiRaaF3cR7IHFrRkWhuxRtpjZHQXY1oWeZLGuCXRyRRMmGmmfGsf7mhPRnmx
	 Ij51V/kWuQXWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] hwmon: (pmbus/adm1266) use wall-clock seconds for
 SET_RTC
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260508-adm1266-v1-1-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-1-ec08bf29e0ce@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:48:54 +0000
Message-Id: <20260508234854.A7BE4C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Silent truncation of a 64-bit real-time timestamp causes Y2038 ari=
thmetic overflow.
- [High] Unconditionally overwriting the hardware RTC during probe destroys=
 retained state and defeats cross-reboot correlation.
--

commit 260e18847f33c3f0022668e0092b4f93049b2ea6
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) use wall-clock seconds for SET_RTC

This patch modifies the ADM1266 driver to seed the device internal RTC
with wall-clock time instead of monotonic time since boot. This change is
intended to allow cross-reboot correlation of blackbox records.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index d90f8f80be8e0..a86666c73a5e9 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -432,7 +432,7 @@ static int adm1266_set_rtc(struct adm1266_data *data)
>  	char write_buf[6];
>  	int i;
> =20
> -	kt =3D ktime_get_seconds();
> +	kt =3D ktime_get_real_seconds();

Can this lead to an arithmetic overflow? ktime_get_real_seconds returns
a 64-bit time64_t, but the subsequent serialization loop only processes
4 bytes:

    for (i =3D 0; i < 4; i++)
        write_buf[2 + i] =3D (kt >> (i * 8)) & 0xFF;

This silently truncates the upper 32 bits of the timestamp. Should the value
be clamped or bounds-checked to prevent silent wrap-around?

Also, if adm1266_set_rtc is called unconditionally during early probe, will
ktime_get_real_seconds return an uninitialized time near the 1970 epoch
if the system wall-clock has not yet been synchronized via an external RTC
or userspace NTP?

Overwriting the internal hardware RTC on every probe could destroy any valid
time state retained across a warm reboot, breaking the stated goal of
cross-reboot log correlation. Does this code need to preserve the existing
RTC state rather than seeding it at probe?

> =20
>  	memset(write_buf, 0, sizeof(write_buf));
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-adm1266-v1=
-0-ec08bf29e0ce@nexthop.ai?part=3D1
