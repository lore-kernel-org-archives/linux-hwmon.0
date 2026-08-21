Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928A1DED49
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324447; cv=none; b=gBYw1N4EQAOalit32Gujqgdh4NI5Yp2LJM8yj5Soj2GSU1MdnSCOf3ARZ8LKt989B12BNvZSsTgbhw9NfeWMTzWi8/MXlKHojpQoEDsoyHygnUbYyZ1xBXq3DtTpB22UdgZpEVnEstAeuQ6tqRI2PyGEsoUhNMiHlMBD4AOfEfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324447; c=relaxed/simple;
	bh=Nseqxm6L+fBpR8Q6sd/EQeE6GhBSsHVTHI9zwjvFMjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lHZpqd84EBoiWQVRf2s13nyZWy16/pV+CZydheQ/wjDZwDGcx8B+alQJjbV4/Ej0krfb4X5oT3FAUX+lw7btmm9er0ZKE7F6cjNwYXsaDqwWNP4sUXMNvF/HAUB/9BrvZfgOKdvmKl2iPbv09ngJ6VSgTIn6tuICY5hcMxPikIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkNqn2Td; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkNqn2Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349B01F00A3A;
	Fri, 21 Aug 2026 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787324446;
	bh=Nseqxm6L+fBpR8Q6sd/EQeE6GhBSsHVTHI9zwjvFMjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IkNqn2Tdk1OjDFP4VH1e3jeTtabCoicfn0nvcnfmAaUD7HzThwFj9AbOWeR4NHCSh
	 aNwwWNR2FGDvvfonCRLdfYQ5k2FolXRkwt+wCgzISj8c4LGkGswKbvqIiZy3jN/tp9
	 zdj4zYSdWSVwtXlriz56fDp31xF1mCm0ZnIYjyeSX3gzssqcD2KDPX0zc04Jnfl7wj
	 yH8UWgbAR4Z6y/yCudvI61el1tP+k6KyfY4agUMoK+LlUCObXwvXut+W1HBe5or6pn
	 H2+BebmBGt3X26H1tRTsDzD5+4jOHK9T25wwn1k4pY+Jofs8JHETKFmLxxyEyFlo26
	 FXWXWs4Mw3tmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (sht4x) Add missing locks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821144916.2889031-1-linux@roeck-us.net>
References: <20260821144916.2889031-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 15:00:45 +0000
Message-Id: <20260821150046.349B01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Sashiko reports:
>=20
> Heater sysfs callbacks (heater_enable_store, heater_power_store, and
> heater_time_store) are exposed to data races without the hwmon lock.
>=20
> If a user-space process reads hwmon data while another process enables
> the heater, heater_enable_store() executes without holding
> hwmon_lock(dev). This can interleave I2C commands and mutate shared
> state (data->heating_complete and data->data_pending) concurrently
> with sht4x_read_values(), leading to corrupted I2C sequences.
>=20
> Fixes: 53dfa12299c1 ("hwmon: (sht4x) Rely on subsystem locking")
> Cc: Alessandro Zini <alessandro.zini@siemens.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821144916.2889=
031-1-linux@roeck-us.net?part=3D1

