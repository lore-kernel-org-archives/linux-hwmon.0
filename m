Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8F917D6
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780846975; cv=pass; b=GnyQI6zGG+3C7FZ/c8P/W50sjNdxHfgWW07/apVztElrc2wM94UWFXBalz59P0eCt/sSL5rbXUBIyjgJFLdePvew2295iG4i1x+AqcoqlpFl8Jusf3XVoNLpGwnlLk1PGv+56bmlYaYUrX8Qs/stC9N7a7WZw06rFjCym8k6t8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780846975; c=relaxed/simple;
	bh=XCkHV8ZeNsUm5lPYgRn5fehEBmeWytVYAVnjilzGzk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSfFIDsrvF9P9hDapdwugUxnfxMkYIBCVj68ci+RynYv0bwaBQPUf0TX9Y+4DHtBH/F+irlMqrin/i6bqaBVOgwk0nxVcD50oDkJ6ITDbFxdPjbxSQVZLQqKwg8dvQLjQpBgnHCNTLNq0bp0jRaUQt5/Wmk9EkBdn5hk05ttQGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CX2mmSrh; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CX2mmSrh"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so23671875ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 08:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780846973; cv=none;
        d=google.com; s=arc-20240605;
        b=hP9GJxJfVJewv/JBrSymdcANZb/ZAIu6IwKID94UO7SMdYscoFEciLS/G0Z2VbxdH+
         pvmn2rYLy2EuIDgzyW4n6nHDzTr6RyGLc8L2kdpnK7Zy/sqf/WVqE25blkwbyT0ExLRO
         zvhXX6IJJEmTldG9+9xEcErdpmC6ZpQy0WwE6jOefgaEkCsxEzVGR4Re/yB9upEyB26b
         aYG/0/onZDyE0Q4Q+WFjb1hQAtve8jyI0AVSLSNqA79yd2d3HA3QseOiyndGrJ3Hffvk
         h+fxV4Ncx0rPcVUHFB9j27rvlhb400UwhZr9DRkll1dCNKrTW4JbBH2BokwugbkZWjlz
         Ibsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45MZ8afngvd7K1ygn3gw3ZGKK+4IuTNrYGUdSONsW8E=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=g59fZZNljScplypaDbtHDi/77uuSL18LqKFYgxC4KxssjlQlHNBFy5WIKN4BpOWaJ9
         Umtos6NX6FXorIoO9X01FoxM4IeoYiE9lQgNotQzR7z6Id/8Uj/tSBFTOpcxPb5uVWzR
         bXBEsLWw24SWc0XkDXDFLEuBzZW3S1PLBGUbAapOhvFY1+LiVmGrcnnsvcERIxfLfFsH
         VyAadGLPSrLNDtLVQAhPMsjxQKIrUV0hO8RIKxDc0kX/WfM5p9pMlg3E+aefQVGIre6W
         vKTOkJP1Os1+H+xvp5JsVHZoBn6FmsLZ2pyV8oTvxJeMqmrGsjzjy9pYkYw/m1Dimz7V
         tHXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780846973; x=1781451773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45MZ8afngvd7K1ygn3gw3ZGKK+4IuTNrYGUdSONsW8E=;
        b=CX2mmSrhQu97vJeNC+XE3qL2Dm++RFhb1ok4Tk/2rGv+/x39Da7e/AlP9IRE6hGR/9
         TXpaaC65r/NqvSxLVJ9kq0ag5KrshAFHhOjsr7T5BOH4MD7a+8CRPW0i9W/pkv9zosC2
         bgPDfDkCxBlBDRD7/itZ0gITA6SG97SsIYoUVzl8qiYmDosmYE0r+FL7kCJ8wnXgnKtZ
         XZrD7qdRek3fJ8MGohccfemcjS+mc8myys7KbrCDz/sYktEhIriPoB2kFBV5ZhzLGeGZ
         Go4Lwyvy9+YYKQu7xv1picVjPrsl193UQ1HRXCRzsje4F10HsjJF/C0B87CR0jTkp1f/
         w2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780846973; x=1781451773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45MZ8afngvd7K1ygn3gw3ZGKK+4IuTNrYGUdSONsW8E=;
        b=TrSZHdIB1923H5P46Ok9RtsOj7SqU/Chzx+CGaQOf8To6D50i02gZVD8qBW+N7usRR
         PuoT1VqLmxgVY3HMwVqCv84R2RL+uME3wicUHiJMl3EMnafUzRMaCHMqCUkDQKncEixh
         53mOhngTdy/cGFxonA+spzAtcyvdUn6e+WACtyMIe8kIlX6FqRNY/wO06F9A0Iy+TORn
         +rUlHVyGG8mIh3joAAPxQg2EOvg7IcciKs21LHXS0GHmLcPXnAao9ge+Wb3xQJKzBQ6X
         /PqpRu6898qCcjF1LH0vuDR9TSgU/OVAUWW6XZttEA8UsvKJmyL9UuJ7k8NhnNHhUYgp
         BK1A==
X-Gm-Message-State: AOJu0YxpzYOqhBpvwrBgcTtf5N9QM5szQkI2FPrZ4emd2wl5d6MOdQoH
	A4PLGmPJ7N9uiWYHdeyZ/bLOO9S9nlME+eiWwok6CQKE82ZKqg5560XPAvBtXyjVH/kOOHWg0qT
	IwFIGBU+hFTRM7AD7r26Lzx9KuKtj8gb2fGFIq114nw==
X-Gm-Gg: Acq92OGCsgZ9b30Y0tAkq7fCk5biA2/aUbkYxkPq4LVJa97volkW3Z911MXlV7tD16d
	8oem20Lmqc5Pe5bd3e3n/kUAn66+osnxElUFdb3l3f2zCQaec8rtj48FtwwWJouRmfNCjD94bS9
	A91nuCs9xp7AK8Z9PO3Ar0m8fgYrQj5Z2lDH7a36ftGoSOg8AFMXMPHnt77iiBY7K5fO5QrMXNG
	cjRW2fGWsrVSEuVt2s1dWvqUz6kyyCCTulVA8i1ZoLxUkucbVP0trT6y6K6Qvm408uZJo/HAggr
	c7dnSVEb4JUQ11M+zmUGXs0EbVO62dgvbClmY4Un19fhXXKbfrI=
X-Received: by 2002:a17:903:3d05:b0:2c2:343:88b0 with SMTP id
 d9443c01a7336-2c203438bcamr79596615ad.19.1780846972505; Sun, 07 Jun 2026
 08:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607144238.128259-1-eugene.shalygin@gmail.com> <20260607145912.558FF1F00893@smtp.kernel.org>
In-Reply-To: <20260607145912.558FF1F00893@smtp.kernel.org>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sun, 7 Jun 2026 17:42:40 +0200
X-Gm-Features: AVVi8Cc2WdM1NlzuL36qde311cEr23kQJqMzFvmX39CF_vJU9xTuXAY9Qst8XrQ
Message-ID: <CAB95QATYOcHgYKi73M2cQOXUD1Z7rLPU0XZYAZivaVrcxohm_w@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I fell into the same trap again :( Thanks, Sashiko!

On Sun, 7 Jun 2026 at 16:59, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing sensor metadata for ROG MAXIMUS Z790 EXTREME causes re=
quested sensors to be silently ignored.
> --
>
> commit 409e24c49843127f834ed70831b89be991b9e50c
> Author: Brian Downey <bdowne01@gmail.com>
>
> hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
>
> Add support for ROG MAXIMUS Z790 EXTREME
>
> > diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-se=
nsors.c
> > index b5d97a27f80d3..34f96aba5cb99 100644
> > --- a/drivers/hwmon/asus-ec-sensors.c
> > +++ b/drivers/hwmon/asus-ec-sensors.c
> [ ... ]
> > @@ -514,6 +514,13 @@ static const struct ec_board_info board_info_maxim=
us_z690_formula =3D {
> >       .family =3D family_intel_600_series,
> >  };
> >
> > +static const struct ec_board_info board_info_maximus_z790_extreme =3D =
{
> > +     .sensors =3D SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
> > +             SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
> > +     .mutex_path =3D ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
> > +     .family =3D family_intel_700_series,
> > +};
> > +
>
> [Severity: Medium]
> Will these water sensors be successfully exposed to userspace?
>
> The newly added board configuration specifies SENSOR_SET_TEMP_WATER and
> SENSOR_FAN_WATER_FLOW. However, looking at the sensors_family_intel_700 a=
rray
> used for family_intel_700_series:
>
> static const struct ec_sensor_info sensors_family_intel_700[] =3D {
>         [ec_sensor_temp_t_sensor] =3D
>                 EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x01, 0x09),
>         [ec_sensor_temp_t_sensor_2] =3D
>                 EC_SENSOR("T_Sensor 2", hwmon_temp, 1, 0x01, 0x05),
>         [ec_sensor_temp_vrm] =3D EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x=
33),
>         [ec_sensor_fan_cpu_opt] =3D
>                 EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
> };
>
> This array lacks the initializers for the requested water sensors. Becaus=
e
> they are not explicitly initialized, their definitions default to zero an=
d
> they will be silently ignored during sysfs creation.
>
> While the driver safely handles zeroed structs without causing out-of-bou=
nds
> reads or sysfs corruption (because get_sensor_value() returns 0 when size=
=3D0
> and hwmon_genattrs skips attributes without templates), this regression
> means the requested water sensors will not be exposed to userspace.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607144238.12=
8259-1-eugene.shalygin@gmail.com?part=3D1
