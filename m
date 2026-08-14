Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7061F419A
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 01:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670376; cv=none; b=ofNq4KJpWJmG7F5WqvyutxUrOD3or+6i+2FI5N9yfRlx1Pm/9+YWoEig2B5LNSKWbX4M8gNxBQcJcH3bb1pibGTgPTHyE6elnIrI27+uRG3jMsaHjj4mYkD9qvF+hzAHSRw8hA0Po0gG/xXA3iOTUYYEwWWWKN2E8EakBiXmDIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670376; c=relaxed/simple;
	bh=8ZFPHijIrkU9g4fjVe3T0rJF1XeMbRlqy22/+K5+i8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j0jhxW/+/PdYD45A2lFec4btoygLTFON6K3IKV29q0LNn36xoiLYuGbEvivxrmaLYbX7EpjxYm0rFMWYYTRePqrXGahLSLkscGcanFMnnFYHvaGaj+i9nTSG3a1kEjsewxkIMcNcmHsTLgpChUqe9qk1lXU7LWl3VP7Ib94RaT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YboriuId; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YboriuId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B271F000E9;
	Fri, 14 Aug 2026 01:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786670375;
	bh=PENXvGfLy5k1KJqy9K/VgxeIAHINUzx4OmCnGetoHA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YboriuIdFEl1rhPn4iHfwu8UtsBz9KQEogfxceru45EGeUdY3fwhi91Adxjko92Cw
	 1lzsblrDJECGsOcM4kAECw0OacchUhK3WUhx+hhj9YN/cazKqLA6Va+iVwa+0KmigO
	 xylmz4hkbHLxMLN865XE/JCRlq5D0LvnPje6XcmHNlOe+gZ3m6OmEH1l8gcr9PBUAz
	 3iNmZ4vvzeHyZT85bkUXAU5zwZxj7C+sPsllR4x7Ewh1FZPsfhKjtYE0INrAvrCaOU
	 Qb8kvhnPVtC7TK37KeUnmGwBaS4jv/N4MnRbXM5XUfhmNxl48zmjfHaDfs5natCuyM
	 RGKEADKODwDeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627hf) fix out of bounds read of PWM
 register array
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mark Sercombe" <sercombe.joel.mark@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260813211950.535148-1-sercombe.joel.mark@gmail.com>
References: <20260813211950.535148-1-sercombe.joel.mark@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:19:34 +0000
Message-Id: <20260814011934.E6B271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims to fix a runtime out-of-b=
ounds array access and hardware register read, but this vulnerability is a =
static analyzer false positive and did not actually exist at runtime.
--

--- Patch [1]: [PATCH] hwmon: (w83627hf) fix out of bounds read of PWM regi=
ster array ---
commit 541d179df68e1d4e07bc936b67920fc0623c9326
Author: Mark Sercombe <sercombe.joel.mark@gmail.com>

hwmon: (w83627hf) fix out of bounds read of PWM register array

This commit replaces a hardcoded loop bound with num_pwms in
w83627hf_update_device() to prevent an out-of-bounds array access reported
by a static analyzer. It also updates num_pwms to correctly account for the
W83627HF having two PWMs.

> w83627hf_update_device() reads PWM registers in a loop bounded by a
> hard coded "i <=3D 2", i.e. three iterations, for every chip type. For
> the W83627HF, W836X7HF_REG_PWM() indexes regpwm_627hf[], which only has
> two entries. The third iteration therefore reads regpwm_627hf[2], one
> element past the end of the array, and issues a read of a non existent
> PWM register.

[Severity: Medium]
Does the loop actually ever reach the third iteration for W83627HF at runti=
me?

Looking at the loop body in w83627hf_update_device():

drivers/hwmon/w83627hf.c:w83627hf_update_device() {
...
		for (i =3D 0; i <=3D 2; i++) {
			u8 tmp =3D w83627hf_read_value(data,
				W836X7HF_REG_PWM(data->type, i));
			/* bits 0-3 are reserved  in 627THF */
			if (data->type =3D=3D w83627thf)
				tmp &=3D 0xf0;
			data->pwm[i] =3D tmp;
			if (i =3D=3D 1 &&
			    (data->type =3D=3D w83627hf || data->type =3D=3D w83697hf))
				break;
		}
...
}

It appears there is already a conditional break that stops the loop when i =
is 1,
meaning the loop never proceeds to a third iteration where i would be 2.

Could the commit message be more precise that this is addressing a static
analyzer false positive rather than an actual runtime bug?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813211950.5351=
48-1-sercombe.joel.mark@gmail.com?part=3D1
