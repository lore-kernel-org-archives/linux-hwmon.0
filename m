Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2260B149DF1
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783854127; cv=none; b=VfsVUS4O8vpqqrNVw1d11jljI12JgJ/J+E/+RM7aSly9JUJFMeSRJEFTYU3IO6X6pygZ8bNNnYyK0J9KVGmLakZZdEgeCtSwp45PSNh3nJ5Eala9pqf+ZeWqIQ32xb+TgHIMkO1LaFdGrs5ycl+Cr5voGkPxU/YqTTPr4SV9RMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783854127; c=relaxed/simple;
	bh=x72vLYL/thDPQEEulW9p3CPzsjUNQHmskSJDkzyXVtY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EfTfMLhVFsjxahq5t+bXLISpSooMSLDwGI6X4elvtDgytD3zfamtF8ZcoE2ATHVdmQucWksnGl3cAllRYMwwXbVK23HWAwj1oi7c4Hd1zDm2QC7BGIGbyuPi4kcLgyFECMJCa/9InGbcA9kod/4foki7nBs2w/BKzcLQK2jwnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Agw6Blu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Agw6Blu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CC61F000E9;
	Sun, 12 Jul 2026 11:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783854125;
	bh=yMdHbdzc8Kuk6lJ0Lq5lpsr5SnSKD4K7SuCFVK3FQk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Agw6Blu3w5Jc8Vuzs+J6WX/+6dHgBDptUXGCfDVEuy2IrsyPWZI+XjDoyqP/Ez5xH
	 O+m/e2jQxul1XZy81c1/6uhXsI937xEuWK8IT9hIIwdOmJn8OxtFCjQGfdMFmovZH+
	 8XntLg1nYscZxBEyvDvepE0EM4FLjZJglrYd9EGTEBwtTWD4QECU9a9quSGtjMOTRx
	 UkaWefOEgPl8rErSTwxHLFYM4QZ9FiWzyXk7eEYbVTCavQ1K/wPkP9GxBLSazxiMUW
	 8XZNPFotIfLnLkcQ2gHMkO8DVspI3CuydcvgZw5QmLayYMXBb3l4iPjTypBmvDLEmo
	 YLrQqvf16LbXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) fix EC read intervals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260712105422.920360-1-eugene.shalygin@gmail.com>
References: <20260712105422.920360-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 11:02:05 +0000
Message-Id: <20260712110205.A3CC61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional advancement of the update timestamp masks hardware r=
ead errors, causing silent propagation of stale or uninitialized data to us=
erspace.
--

--- Patch [1]: [PATCH] hwmon: (asus-ec-sensors) fix EC read intervals ---
commit 6080114048f396c35a55a9a09a1833289acbf3be
Author: Eugene Shalygin <eugene.shalygin@gmail.com>

hwmon: (asus-ec-sensors) fix EC read intervals

This commit updates the driver to take INITIAL_JIFFIES into account when
setting up the next update time. It changes the last_updated tracker to a
next_update timestamp and advances it by HZ prior to performing hardware
sensor reads.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..4746c3718664b 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c

[ ... ]

> @@ -1278,13 +1278,12 @@ static int get_cached_value_or_update(const struc=
t device *dev,
>  				      int sensor_index,
>  				      struct ec_sensors_data *state, s32 *value)
>  {
> -	if (time_after(jiffies, state->last_updated + HZ)) {
> +	if (time_after64(get_jiffies_64(), state->next_update)) {
> +		state->next_update =3D get_jiffies_64() + HZ;
>  		if (update_ec_sensors(dev, state)) {

[Severity: High]
Does unconditional advancement of state->next_update before verifying the
hardware read succeeded cause stale data to be reported to userspace?

If update_ec_sensors() fails (for example, due to ACPI mutex contention
returning -EBUSY), the timestamp remains advanced. Any subsequent attribute
reads within the 1-second timeout window will bypass the update check.

These subsequent reads will successfully return uninitialized (zero) or sta=
le
cached_value data with a return code of 0, potentially disrupting thermal
management policies.

>  			dev_err(dev, "update_ec_sensors() failure\n");
>  			return -EIO;
>  		}
> -
> -		state->last_updated =3D jiffies;
>  	}
> =20
>  	*value =3D state->sensors[sensor_index].cached_value;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712105422.9203=
60-1-eugene.shalygin@gmail.com?part=3D1
