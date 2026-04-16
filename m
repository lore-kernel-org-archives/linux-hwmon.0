Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA682391507
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344559; cv=pass; b=t2TtsBt0T1DwircTxSy4CpeknqxFLDdyhx+b0ZesLeYffZX56cEKZqCCFSGv5OmH/nj8dEL07xOzGDru/Q8bMiFS1WVbF69OhyKRGVX2RlpDUM22Bzh3Es1+jaa2xxC4vw25QxfNF7Ns7h22eYm8QqnKMV4WRaiBdLzskGz3jqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344559; c=relaxed/simple;
	bh=BfQXFZ/HjdcyaSH/dFi13ajZQYKDRhVss+JCyz3jJu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAbojWt2545Z8pD0fhIm0fVZwxoo2pXIj6TtfkSBe76dF9RAlt8WXA54MiqCYEUsdmQRibXKsm3QAyN1ysD2OMswCqd+2R7QWlesEqxb0tRihFghy+fNqBkJYbdLSY0PcDaIPvppKNeJhCe50Lt6Ocg9IKLwvx4fWEhniCcQsi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY9jj+jg; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY9jj+jg"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-423b7100bedso5804004fac.2
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 06:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776344557; cv=none;
        d=google.com; s=arc-20240605;
        b=ZaNoJbnmY/bRLdRr/2+P/jfSaYRmRV/aGXko9n9OrrWm7odmm90oWSnSp74hc2GV6l
         z4QeI+zK7BXSdDVBp3uDi7QbdWiFm3G9clt1DDADQuBiFYBG0FyTt7r85GkRBCNKDOTR
         /PlGqXyskpncEpRjJPe1hAm3l/qzEiJ2PVbMlW3OxvlPbxP0IZbHpn1P8Br+4f7RXmeW
         k+Wf8pG4B3PvvLhFxjKm+dyda5//L4nJ7Nkc9ttdbAsJjVKv5v0MNaoOEgq0drplzRE5
         NIR8NdkjM/8L3Hcvh4ay4oEX3IVXCUywi/CSDKYdjZRMtiuoimkss0gAkXHmQbHuERzv
         ynEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W9FpxBxwQfLvLwFkmMeMjlLjY4/9LE5fqelrbsenVAA=;
        fh=LIRAVtNkvFebIJTmd3sXQRhyI56KpQNcHjhAac0CiC0=;
        b=JAkwq/JRpndZL0A2Yt7RxOLJEoXcJpw8dSl6bj7RqpP7XpKKrNKj9GuWPmfY0R6Iac
         xTxp6RqWaL8TaU72WPWsPugW9CWvYUCYa1+HZQLkj4isG0XzTO8rYGLfr7FN6WmqvKHE
         ebb9T3PKwLzaetKMfxSfsPFHiNam2t+Dmtvp/GgJVfXBbOOKQI+WwssOGMjlaSD76oy8
         r/PJPAU4ZQi/yuG+BVEf9peceh9k0zYzX/DYS2ChmFWIHZmfzh/gFWj5f+QF+4KIkYtw
         Bt09Yy/n2vkH1DIDXKv4olKCfHtFVuihfFyIyoAwKW86dRBkkuzVN3eYH6bTVku1SA+P
         yegw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776344557; x=1776949357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9FpxBxwQfLvLwFkmMeMjlLjY4/9LE5fqelrbsenVAA=;
        b=jY9jj+jg3sIlPbIQJpMFGJ0bCOXIOpbNYJwojdAsDGpSDWXCqbk7HOOcjwO5VkQNBd
         CxsUbM9lztk/IPynVvGgBWiQQwGQ2WK12TbzJlEvHvxmfbF/z+Ss0PDxSg6UVpWlWFef
         s5FJjOtBPXQC1EBilsOG8x8rZcD/rxtyqVsR320XK6E73wVzQRoOnn98PuooVCIv10Na
         +rOo2WA4TOL+/WIkJQAvH/SqbFBqnd9mE3t3yxKzO/DWc3WWllVur0UqQJGY2A0RoBYI
         uBfDu3FBjJVbKa8bNOxpV1GuKzSwaEhBli1MUdiSO4gxGwQIRQ2N//XhhiKbBeLkRGmm
         X63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344557; x=1776949357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9FpxBxwQfLvLwFkmMeMjlLjY4/9LE5fqelrbsenVAA=;
        b=ny5zRM9HpWiQUkPlpvfuCrgRSCXLeJhu/QlYOSt2/e+vCF6nhiUJlwp6/rbblvXlAQ
         kR6klseZnl/grKx1y7BDeztZ7SuWXIfoymXnwSI+E5AaN56GGU/zuxEHspTgK4iLwFtR
         ZDX8nfGtC7cUs5nsbCrFVeq8AXXTfyX+46L1133YcOhkUT/+U4aqVMFfrPk1MVzSjBLy
         Zi+gUpQiJmTOl9zF6k2kDa8F0MhgryjB223IGYKP+0yYEOiVB9sED12QdY9y8mt8MLK9
         HPvlPv0IZqN/TANMZtRRUkQZsL4uWshPU6w6p8ZwC4uj8e7ZK6/qifLejQzpeRKPSr5h
         a+Jg==
X-Gm-Message-State: AOJu0YzKYoG/bC/2U0tF93wBwMlN8KjNdHKngow3MO/sTr9EKW0feTSA
	iassrLURDa7lvBE/fPWAe/8TKFnifqobX09HKv1cwo5KawxDV32tNvAHaf7eXg3GO1nmOjPk7d6
	/G6QCYXlXz2UAgDZNYOXWfUv/HXREyTS3HlFC
X-Gm-Gg: AeBDieuF+99w2Q9X64ijFVQe0aqUesDsdMRFLrfSTQjxe1TCjItX2EQvOTJE4sk6Q3Z
	XOoNTpRqsW60kvksU4EsgA8KJiW/mE42vhZcSLnwks6pgRKz76bB3smVY4fzKxw02IV1yuMfF8+
	mbVqRrRmD9jZCNLYizTqNgMNEiMc4imKAqXfwNCVutVVKPzoMPXB2w8Zby4zPCXAsYwcvYehmDK
	hVM+WddN3cmn9xlCTflwFaDFfEgXl0no0YtONpUNp5Ar3+B46o5+S88yaqSOTYtMiw5PUBGlodr
	At9A+aYknTxc2JTYwm6BFjY6ItyXgPfIzBK4a+VRNAuqL7Vs7/RBZD0LYCvaexRHtIfkiqRqMoU
	AjgSsrW/UDrQvDogSXjpdk1vSYpcc
X-Received: by 2002:a05:6870:2b1a:b0:40a:605b:518a with SMTP id
 586e51a60fabf-423e108440amr14891269fac.27.1776344536584; Thu, 16 Apr 2026
 06:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416091754.310-2-hanguidong02@gmail.com> <20260416115716.CBDAFC2BCAF@smtp.kernel.org>
In-Reply-To: <20260416115716.CBDAFC2BCAF@smtp.kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 21:02:05 +0800
X-Gm-Features: AQROBzDhU4y7kpl2Cd-6gRhXM378oMdGfa9xdqKEsjcelqHCo_AnbsiZOd4Gmmc
Message-ID: <CALbr=LZjZ4t-FCafzSg-JDApz6F31EFXpXtwPXV3adBqM5SbSg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwmon: (adm1031) Hold lock while reading cached data
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:57=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Store functions like fan_auto_channel_store() read uninitialized=
 cached values, which can silently disable hardware monitoring.
> - [High] auto_temp_max_store() corrupts the temp_max cache and causes reg=
ister desynchronization.

Thanks for the review.

The existing code here does look a bit weird, but I need to study the
driver more carefully to be certain. If there are indeed bugs, I will
address them in a new, separate patch.

Please note that these are pre-existing issues and were not introduced
by this patch.

> --
>
> commit 8f551aed0a746551e7fda3272d5c7e3fcaa2b090
> Author: Gui-Dong Han <hanguidong02@gmail.com>
>
> hwmon: (adm1031) Hold lock while reading cached data
>
> The patch addresses TOCTOU races by holding data->update_lock while
> accessing cached values in sysfs show and store functions.
>
> Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+X=
YSTU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/
>
> > diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> > index 0551f815233d9..887fba9ea149f 100644
> > --- a/drivers/hwmon/adm1031.c
> > +++ b/drivers/hwmon/adm1031.c
> > @@ -350,9 +350,8 @@ fan_auto_channel_store(struct device *dev, struct d=
evice_attribute *attr,
> >       if (ret)
> >               return ret;
> >
> > -     old_fan_mode =3D data->conf1;
> > -
> >       mutex_lock(&data->update_lock);
> > +     old_fan_mode =3D data->conf1;
>
> This is not a regression from this patch, but does this store function re=
ad
> uninitialized cached values if it is called before adm1031_update_device(=
)
> has populated them?
>
> The driver allocates its data structure with devm_kzalloc() during probe,
> initializing the cache variables (like data->conf1) to zero, but
> adm1031_update_device() is not called during probe to populate them.
>
> If a user writes to this sysfs attribute before any reads, the store
> function performs a read-modify-write using the zeroed data->conf1. When =
it
> writes data->conf1 back to the ADM1031_REG_CONF1 register, it clears the
> ADM1031_CONF1_MONITOR_ENABLE bit (0x01).
>
> Could this silently disable the chip's hardware monitoring and thermal
> protection?
>
> [ ... ]
>
> Additionally, there appears to be a separate pre-existing regression in
> auto_temp_max_store():
>
> drivers/hwmon/adm1031.c:auto_temp_max_store() {
>     ...
>         val =3D clamp_val(val, 0, 127000);
>         mutex_lock(&data->update_lock);
>         data->temp_max[nr] =3D AUTO_TEMP_MAX_TO_REG(val, data->auto_temp[=
nr],
>                                                   data->pwm[nr]);
>         adm1031_write_value(client, ADM1031_REG_AUTO_TEMP(nr),
>                             data->temp_max[nr]);
>         mutex_unlock(&data->update_lock);
>     ...
> }
>
> Does this corrupt the temp_max cache and cause register desynchronization=
?
>
> The calculated new automatic temperature limit is assigned to
> data->temp_max[nr] instead of data->auto_temp[nr], corrupting the cache
> used by temp_max_show().
>
> Because data->auto_temp[nr] is left stale, if auto_temp_min_store() is
> called before the cache expires, it will read the old data->auto_temp[nr]
> value and write it back to ADM1031_REG_AUTO_TEMP.
>
> Could this cause the hardware to silently revert the max temperature limi=
t
> just set by the user?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416091754.31=
0-1-hanguidong02@gmail.com?part=3D2
