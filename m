Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4363BFAC8
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 04:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126612; cv=pass; b=JrBpkvsBSuyoUoUD/47GD7MQEQgfcKVJRywkJxlizMC+YNkfWRaK+qqQ1p52tWUx32izc9U8xZhVx99pK7rpFN7o6VmQ7E3s71GywpJrQt+MclC4jL2suEFS37rI2BngWH62Ih7ZMXC5WkCvsYiXnR24pnXbJt2oeR/Ehg1ySzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126612; c=relaxed/simple;
	bh=KCEGnS0iUf3IHmlt99E/30/3AnZCRVZ21VN+7LHjlag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJxlwlHhhhCEh2/pO7pGxMhgTmMdGtmRctvQI0MnqJ9dT7TsKGzKnMav5Yl4fReo0wZRm+uiPdTKDOX7Ob8GuEYMgbsYVPiqLK5lp5aiGFi1e3oAuyfIwL4VKbDFJ/1GcA0vXLP9j4F8sxFLh6I3jNbOxh4vwiEXl3MnjwYuAfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnOHx+yt; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnOHx+yt"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1600d040e4so310707966b.1
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 21:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785126609; cv=none;
        d=google.com; s=arc-20260327;
        b=sH4sZN2C5nx5iQKZxkOrwLGUODVbLRpWvXt8sG6X6X2Tt1CF0MW7wAK70Lk3kFkB/Z
         fmNqihcXFqYHrAW6bQwO+LtXm9DtM7P4uEckkmTOVr7W/m+ZZ6BeVb5Kt8GfLx/Vowm+
         B4ftibobuJoKv3/Iyqde6mE9LVLW/S4aGtNMWjg3gEDR4OlzbamLgRo+3iRGlp9NFLUK
         9uj6YGvCN4ay/6kJJFQDAIgIpKY8iUHQdMX4shHWZ8adwLzneqkY2AqxmSjP8cRVH7ty
         kM6r1Um8Z6kbblOXNYyd1SBFYYbdlhfNMf6ZM3OWToadvktAd8uMwBhk7sP2rY372g63
         QG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KGnrduvUoH+RkUqeyoTUCKk7g0hsKjiB0Vz1x11ZXgA=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=OUQGv4nqiAxR4mNt8g/dC2etzKABBDXVGqagP6QU7+/6dygyQkB5rSvaMeCA+NFQ3J
         UtFa7lUYWqLefjWN3Rxw3vF3UTPtRTbfEXoNJcftTUkwVAHIxL+XXnMtmJxYjXSqN+uO
         JdlcVHKvcAxPlMI+2oaNe4k+Z1z1N01C0sd262rkZHcEV65X7LTnl9wFZ2Dbxk80ObMO
         vDmc//klE5qT7tB+r10mlr1MjKhjkt+Stm8wwNQzOu7aYA4NQkJl/BtTN91zxz+tLreg
         4i9e4w752AENHHs5Y+5X+8JzHS/ag57NdTDMXOqVT/7sAxoAMcDa5MRXCVn/yIrEEUOb
         nwaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785126609; x=1785731409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGnrduvUoH+RkUqeyoTUCKk7g0hsKjiB0Vz1x11ZXgA=;
        b=lnOHx+ytOs+bfRoe3nlMrj6JO6xFJeGO1c+GtL/5b6Hoxlt6HlRm4OftW3pkrAy5sh
         we11iDagVwKFdZC/0PXNjiKPFV9uKU/tpARbcxRYU+ARoFqKk8AW00ix5ZXH54PujIm7
         MTsSXlQQRQomDr+Ict1bI/7oYSJ/CC4k/ootSz2Tj4Cjot/54OgRuzuvXgdatx33nFDE
         sqhcazH3bnFuUX0CmeTSHLgux6LzyQtNcFAN6ZuruY8jBNIlpCTOp3r+GjiFWNal+YhA
         +LYZN15KFl3eKkE4uUuu8WaQBj0GygNlP6GT/FGt+KliqOSFOmd6UD0G56eugEqwXf5M
         9Dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126609; x=1785731409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGnrduvUoH+RkUqeyoTUCKk7g0hsKjiB0Vz1x11ZXgA=;
        b=oBlQEgwXZ0ewVc4xYsYsrHQKGdZk3SwtdtJuzkulLCYnc/oOlx2bQrYsJhCYByDKmZ
         rMUdU+0LtwGiv+QO4xdvk1Ya9WgK66jjCzafEA16YQGqW5/+Iv501WSUxOQxVNvh1r15
         GXxLCZTsN8vGY2RoKhgyS8pwuR2Gs9rOGMaShQNFmi2V1qGeazU40hMIJS9Ps4g9ZCHK
         jCGWdbWBI78hLqG0SGrjj9wIbxZVm+0g/IuSXaDyd9ad7h+810E+PXcax7ZMhm5qd2/l
         Llxq74yQE9nLHM1UsK4Rq9nMPcZoEWI75yRrOET19ATm65N4A1pu/jnCZ8HozcC3RjZ5
         fHBw==
X-Gm-Message-State: AOJu0YyAEoqcUM2UYMwY41rZmT7Adj9HCBh+mq7FknJrhazfPetbcKc0
	X/Np0hXtEbK/B59hhUHnsCbJx1rMzyOTxBYOTfeO9rCfAMbZHUmTSGc9HOZKQwFQqThBPd0XRqS
	HkbnHugy/vg0E5CPYlr3rpVuTRcarnQp0+H36t4w=
X-Gm-Gg: AR+sD12+Sidqyh6U1+0kCiFVP5nvOo2sUqwJLbChjWvTx3eMgRmJbqmnF3ve9Y9iJym
	HHPUJtEwRfG/O/yGiL+PQhoIFoCmlK6b4X8ib+oFz6Uaw/Soq2frxybaspRf6bnxu/pzo+4y2gU
	tXJ0OuylEl6j2YkrPm8ST51kcmyvkSXH5aUmWN8kaU+LYb86BeB5iAKy7gbXFE6dtMhnAQjSK9Y
	gWUwbB3vAuVwzjqmn7IV08j2Iwh01CyWuqszM/MYKl4JjM9q9gHimU6qlpMCui29h9OBB56WObA
	Y8//jPUf/OY/w2mzUMw=
X-Received: by 2002:a17:906:eec4:b0:c12:525b:4e7d with SMTP id
 a640c23a62f3a-c1f1fd8d0fbmr303340666b.15.1785126609241; Sun, 26 Jul 2026
 21:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-5-21424d550c3d@gmail.com> <20260727034440.2CA821F000E9@smtp.kernel.org>
In-Reply-To: <20260727034440.2CA821F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 01:29:56 -0300
X-Gm-Features: AUfX_mx1H-Jm7ldxyuG3MsrwXJYggwfPdPWOAvWQeznd4uyWrVsyILYWpFXltfA
Message-ID: <CAJq09z46WOmZeYXOWpUz1trfNEEjHofocwZgJqOhah-45vwBPA@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 5/6] hwmon: (adt7470) Fix temperature alarm logic
 in hwmon_temp_read()
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +             *val =3D !!(data->alarm & BIT(channel));

> [Severity: High]
> Does this bitwise calculation map correctly for higher channel indexes?
>
> If bit 7 of the alarm state is the Out-of-Limit (OOL) global flag, it
> appears channel 7 will erroneously report the OOL flag instead of its act=
ual
> alarm state.
>
> Could this also cause an off-by-one mapping for the remaining channels,
> where channel 8 reports channel 7's alarm and channel 9 reports channel 8=
's
> alarm?

Sashiko is right here:

       err =3D regmap_read(data->regmap, ADT7470_REG_ALARM1, &val);
       if (err < 0)
               return err;
       data->alarm =3D val;
       if (data->alarm & ADT7470_OOL_ALARM) {
               err =3D regmap_read(data->regmap, ADT7470_REG_ALARM2, &val);
               if (err < 0)
                       return err;
               data->alarm |=3D ALARM2(val);
       }

The BIT(7) is the hint to read ADT7470_REG_ALARM2. So the bitmap is
not a direct BIT(channel) for channels 8, 9, 10.
The data->alarm is also used for fan alarm:

        case hwmon_fan_alarm:
               *val =3D !!(data->alarm & (1 << (12 + channel)));
               break;

It is too confusing to use the same variable for two different uses
and it is exposing the HW bitmap instead of translating it.
I'll introduce temp_alarm and a fan_alarm and keep the bitmap simpler.

> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_=
thermalzone-v3-0-21424d550c3d@gmail.com?part=3D5

Regards,

Luiz
