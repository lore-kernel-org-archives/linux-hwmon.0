Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043537C923
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560971; cv=none; b=YfOqn3HaO6qmbfcp9FfpoEBDLsRVfX0dozeIW1vImAtlU0mxD8GEFoxuLlRISkzgxj1AsysE8V2gFeg1LPHrpfwpkVeBbzKBcVTSYQBjrA+qSi8YFXQ7LvyDbBQKGRIoet9YtPR3oupdkkOcdH9kd9xCM06C4ywZl4RBsYUTCV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560971; c=relaxed/simple;
	bh=CLrG9ASnPKRLQKEOhhMfkPQOrgdEUxuFkfOQc/gX4ls=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=p6svxe2s6tOKkVApNG6RXK3iin67ItTLUzCTn9AAATtYJ/8XzWyr0K6pcAlzj64khHPQxtph9sMG5YyW0VAB4tlSBP347k3k8jX3Lhbu6Sofs3bTbttLYZ+GTycfBTM4KgfkWqqduQQTm7JzhQfMZUCt3NXZmdV+KOxiORWvEYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbB1XUs6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbB1XUs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3791F000FF;
	Fri,  9 Oct 2026 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791560968;
	bh=lg6fw+qRGKPyIQWuMnzHaTBv3zhtW1SflUe+fCbAmR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CbB1XUs6VPqsMMOB9SG49YlD6t0ok13cGJqqpzspUVyOYavRsiqZjTDqqreLMHJWp
	 aToybL5zDBtFbempkCK9tGxTFi3ungL9wzSO1jXxOptHLPMJZMpNPktwaxHz6HBfqs
	 Ao241NIJ3JevVEkB7csecZw7CvqVc/Yj2yNCZch0BIZmXUQUqHqLfZY9z13L/R/X8r
	 ui/MFqCvACvCKVzPWhkOzD6UpUdrng/JMbGdefBJuzuhmF4AWATXaG06gX/ZJT3OqE
	 LuN4Wxw/fQT0Jme2oegB1DkVMjgsqn45cMdeKv6JcPlx+4lVCfvQ4fSd2nUYdTTLfB
	 Wer/wR5ItHhKA==
Message-ID: <sashiko-outbox-165799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] hwmon: Export sensor and attribute definitions to
 userspace
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <583573c30df45e4498737a89138e6f4f8911c631.1791559095.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <583573c30df45e4498737a89138e6f4f8911c631.1791559095.git.hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:49:28 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: UAPI exposure of hwmon_max sentinel and internal bitmasks
--

commit bbc47a707f27865e8c59d7c4ea18a1b742278dfd
Author: Jihong Min <hurryman2212@gmail.com>

hwmon: Export sensor and attribute definitions to userspace

Move sensor types, attribute identifiers and configuration bits to
linux/hwmon.h in the UAPI so kernel and userspace drivers share them.
Keep existing values unchanged and use userspace-safe bit definitions.

> diff --git a/include/uapi/linux/hwmon.h b/include/uapi/linux/hwmon.h
> new file mode 100644
> index 0000000000000..274f9c9dcb87e
> --- /dev/null
> +++ b/include/uapi/linux/hwmon.h
> @@ -0,0 +1,372 @@
[ ... ]
> +enum hwmon_sensor_types {
> +	hwmon_chip =3D 0,
> +	hwmon_temp =3D 1,
> +	hwmon_in =3D 2,
> +	hwmon_curr =3D 3,
> +	hwmon_power =3D 4,
> +	hwmon_energy =3D 5,
> +	hwmon_energy64 =3D 6,
> +	hwmon_humidity =3D 7,
> +	hwmon_fan =3D 8,
> +	hwmon_pwm =3D 9,
> +	hwmon_intrusion =3D 10,
> +	hwmon_max =3D 11,
        ^^^^^^^^^^^^^^

[Severity: Medium]
Could exporting this expandable max boundary integer to the stable userspac=
e=20
UAPI header lead to out-of-bounds memory accesses in userspace applications?

If a userspace program statically sizes an array based on hwmon_max, and a=
=20
future kernel release adds a new sensor type (incrementing hwmon_max), the=
=20
program could index past the end of its array when receiving the new sensor=
=20
type.

> +};
> +
> +enum hwmon_chip_attributes {
> +	hwmon_chip_temp_reset_history =3D 0,
> +	hwmon_chip_in_reset_history =3D 1,
> +	hwmon_chip_curr_reset_history =3D 2,
> +	hwmon_chip_power_reset_history =3D 3,
> +	hwmon_chip_register_tz =3D 4,
> +	hwmon_chip_update_interval =3D 5,
> +	hwmon_chip_update_interval_us =3D 6,
> +	hwmon_chip_alarms =3D 7,
> +	hwmon_chip_samples =3D 8,
> +	hwmon_chip_curr_samples =3D 9,
> +	hwmon_chip_in_samples =3D 10,
> +	hwmon_chip_power_samples =3D 11,
> +	hwmon_chip_temp_samples =3D 12,
> +	hwmon_chip_beep_enable =3D 13,
> +	hwmon_chip_pec =3D 14,
> +};
> +
> +#define HWMON_C_TEMP_RESET_HISTORY _BITUL(hwmon_chip_temp_reset_history)
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Is it necessary to export these configuration bitmasks to the UAPI?

These bitmasks are strictly used by the kernel-internal struct=20
hwmon_channel_info and provide no value to userspace. Exporting them allows=
=20
and encourages anti-patterns in userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791531025.gi=
t.hurryman2212@gmail.com?part=3D1
