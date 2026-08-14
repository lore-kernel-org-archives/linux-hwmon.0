Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C9618D636
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670461; cv=none; b=jgyTs9qbXa49bwNLPyJQjmjR0reTC2MsUrtnQsxt8pbkiSRcBtzUfFD2lXYyRMW+5oUgx7e4xJjZvIbS5SRb9z2Hdcn2X5B1Z0gM+nzsgWSaZHOH13c/n029UY3JG2ogkmM8RTXxEDG5gUqomGg3SZHx8W4IsZWordu0KK1GgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670461; c=relaxed/simple;
	bh=ClMv62YAfJ/EqAeflEZYI3PYWSuMUIujNwkWecER5Xc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tiIS49rLspSL+57Wkb+/tsAAopqeudt3u3rMd2hK08KsBEJnJq6VLrYrR1ujkJ0upBfCYp+YqH3jLOueKkn/54+4FON9O3dxjg4HwllBDjM8l2vASAekEiF3wWj/va/tUjlDk0tKl19962uNj0Irvf2bLtGNckzgWApV0szWJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1XXJCLK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1XXJCLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC2F1F000E9;
	Fri, 14 Aug 2026 01:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786670459;
	bh=YyFrLTm1JcMqHVOTy6KK4fTJad1YRPxre1r2Wv7ZawI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H1XXJCLKWNmL6ZBTzHVlDaHSyrxgj/emEBbqeX5qxTJjXV0/B18dmzvoegjba1TE5
	 Uloo99sVnLt69Uai3VUkrgC8P8KPQdHvq+YYFblsKAp+cmW/BMcHsFbWvczRBk3S/d
	 gj6/PJn14LXDCDJx+5wiAp5Moz+4ca4q/4cGPz9ZNwgU8h3ljJp4uPDZtTeuCtRX0h
	 8TgZChVPzjbSiWt4I4uHO7XHCTtzM3vVwp6lcqCUBe5PbgEiYaX15Jk6dt/NRvG42U
	 RVrzOi71NYIWJ9Xxtl0SX/jRJMSpORvK7u8FlrRWTAMAinGUDH27T/WRAXDYpwx4tm
	 Qv9Ons6wsRLGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: Add support for currX_emergency and
 inX_[l]emergency attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260813211433.879638-1-linux@roeck-us.net>
References: <20260813211433.879638-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:20:59 +0000
Message-Id: <20260814012059.CFC2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Internal ABI breakage in the habanalabs driver caused by inserting=
 values into hwmon enums.
--

--- Patch [1]: [PATCH v2] hwmon: Add support for currX_emergency and inX_[l=
]emergency attributes ---
commit 618b70e656b029d918a4d90557dfadbd253324dd
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: Add support for currX_emergency and inX_[l]emergency attributes

This commit adds new emergency limit attributes for current and voltage to
the hardware monitoring subsystem. It updates the hwmon core code, the
enumerations, and the sysfs ABI documentation to support the new alarms.

> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index dd713e193d0c3..a3a7d27f3b5ff 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -134,6 +134,8 @@ enum hwmon_in_attributes {
>  	hwmon_in_max,
>  	hwmon_in_lcrit,
>  	hwmon_in_crit,
> +	hwmon_in_lemergency,
> +	hwmon_in_emergency,

[Severity: High]
Does inserting these elements here break downstream drivers that rely on the
historical integer mapping?

For example, in drivers/accel/habanalabs/common/hwmon.c:adjust_hwmon_flags(=
),
the driver performs a hardcoded bitwise shift assuming the Linux hwmon enum
values perfectly match the firmware API shifted by 1:

    flags =3D (cpucp_flags << 1) | HWMON_I_ENABLE;

By inserting elements into the middle of this enum, all subsequent values
(like hwmon_in_average) shift by 2. This causes the habanalabs driver to
incorrectly map firmware sensors to Linux hwmon attributes. For instance,
inX_highest will map to inX_average, and reading from these incorrectly
mapped attributes via sysfs will fail with -EINVAL.

Can these new enum values be added to the end of the enum instead, or does
habanalabs need to be updated to decouple it from the hwmon enum ordering?

>  	hwmon_in_average,
>  	hwmon_in_lowest,
>  	hwmon_in_highest,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813211433.8796=
38-1-linux@roeck-us.net?part=3D1
