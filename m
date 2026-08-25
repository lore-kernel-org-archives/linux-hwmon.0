Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581E22370A
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650694; cv=none; b=qyW/LFyBqsgLeK62rlGJRqxq7UlYb35h8wBEGT+KZvjwB+vXfJWQJLiwvAvy+9/vMY9v0bm7w4uW98q614IT87qygTrws74Jy6hnrQj5klYxsBE4FJkxHqSrCZXofkF+G6/pJWoJEBrw6H+yeo93Jgwlx7WlCRpmCdzfxE82Urs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650694; c=relaxed/simple;
	bh=z3g94CUg8rGepDYkVhvsyCTgPkRpRzzOF0lTN91+yh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=le/UXc09mZXfC6ZLNfQyRa2tRL4YAOYh7dWRCkR8F5JxiGK3depdqf++sguqLlDJqiSOUWsHMH3mrT89AyC7LkXCs5xx/UjvZpcj+rd0AsO0hFT518y0EWOFzR+j1tTgweT3HCiSOL4E1dxzHi0F4cFvHT4FBD8F50+X9aChfXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbiP+oMx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbiP+oMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD761F000E9;
	Tue, 25 Aug 2026 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787650693;
	bh=c/FMt0AnjZ6SC6sPekiByp3ydHz/9vCvb5iIRu5dR7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BbiP+oMxE76Dr7ApMBQOvnYXT7KghnpNvCLaJQEmHHVKolPBEtDE8rYlGr9zBB2Vk
	 c+IyWI5nqI2MBlgcHE1TEwdJJxU4hf26YYSGT3oU1aU/3WoFYAgG2AmFgO4TWqum+Y
	 sYzJvOzeKOP74L/qtyF3+bmjcghPFYsBkk9SzycXrvj68A+Su/t64oyzdDByPOo3iI
	 MnL3BTMtbn3hH5r6TdOr7kTm51u91H5P0aEXPQJUm3ZFz0sQ/jOo9qSytwOIFxcn6q
	 y4M8f1Vx4oCsHhe4d/YuIAnjAWsrIq+5N7uiQt3LBC83AJMp/A8jcmkiU3H0o7t1s9
	 bm3E7ay1TQRjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] hwmon: (nct6683) Enable pwm control on ASRock B850
 Steel Legend WiFi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260825092546.669450-6-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-6-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 09:38:12 +0000
Message-Id: <20260825093812.ECD761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The sysfs show/store callbacks for 'pwm' and 'pwm_enable' attribut=
es incorrectly cast the incoming attribute pointer to `struct sensor_device=
_attribute_2`, causing broken behavior on Big Endian systems.
--

--- Patch [5]: [PATCH 5/5] hwmon: (nct6683) Enable pwm control on ASRock B8=
50 Steel Legend WiFi ---
commit 098ac72f5515df05870f944950a3f04a964252c2
Author: Johan Dahlin <jdahlin@gmail.com>

hwmon: (nct6683) Enable pwm control on ASRock B850 Steel Legend WiFi

Fan control has been measured on this board: with a fan in manual mode the
applied pwm value tracks what is written, and the fan responds
proportionally from 337 RPM at pwm 60 to 933 RPM at pwm 255.

Allow pwm writes on this board.

> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 6825e6c3af34f..df28055b1a1c4 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -972,7 +972,8 @@ SENSOR_TEMPLATE(pwm, "pwm%d", S_IRUGO, show_pwm, stor=
e_pwm, 0);

[Severity: High]
This is a pre-existing issue, but since this patch enables PWM writes for
a new board, is there a type punning bug in the PWM sysfs callbacks?

SENSOR_TEMPLATE defines these attributes as struct sensor_device_attribute,
which has an 'int index' field (4 bytes). However, the callbacks like
show_pwm() and store_pwm() cast this attribute to
struct sensor_device_attribute_2:

drivers/hwmon/nct6683.c:show_pwm() {
    struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
    int index =3D sattr->index;
    ...
}

struct sensor_device_attribute_2 uses a 'u8 index' (1 byte). On Big Endian
systems, reading the 1-byte u8 from a 4-byte int will yield 0 instead of
the true index, so all PWM attribute accesses will incorrectly target
channel 0.

Does this need to be fixed to use to_sensor_dev_attr(attr) instead?

>   */
>  static bool nct6683_has_fan_control(struct nct6683_data *data)
>  {
> -	return data->customer_id =3D=3D NCT6683_CUSTOMER_ID_MITAC;
> +	return data->customer_id =3D=3D NCT6683_CUSTOMER_ID_MITAC ||
> +	       data->customer_id =3D=3D NCT6683_CUSTOMER_ID_ASROCK8;
>  }
> =20
>  /*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825092546.6694=
50-1-jdahlin@gmail.com?part=3D5
