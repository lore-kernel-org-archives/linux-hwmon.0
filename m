Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3667B366DA1
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331820; cv=none; b=oT45Wj4Jgn5v2jj8iO5/E7HpWobtpqm2z50f1ncce1qtgGC+Ryx2QeKF1bijuAfphNPIOd2r9Ve3MC1kH9HlOdwE7aJSQmQWRVDp9NlttzPGSkVE8GFmEtUMRMoNvToP7SYw19lk7pv6wrTXOl6zKqiWr8WMVl+/sH3fdnD8tDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331820; c=relaxed/simple;
	bh=7iF44TNN5Tk73PcNzhOvREnMVxX3d/qo25ltxNUFHJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0M4dE3e1y9jveuIJgI8MqKTwcgZYI64eeMwt8xn7GEF5mP5AhlONG9GKO5IfyXznwsN2SvVK/66kKNQ+THcEhE4VlRsX3e48w6N1shbY5pFYaE0YEnrjRq3mAJzEryaJIXM0HT8ulez9yzRTzwQg9pFa4f4F3Tbfnk1OdfCKnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B14oDiAN; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B14oDiAN"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-123320591a4so770254c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 11:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768331818; x=1768936618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stsg0Oif8YoC5rlxj18cSFU0+gmD+OT6kM7lvFjKvLw=;
        b=B14oDiANixFRVYnLg0VoQWsQOdmTOvdABQf+842kwMltkHCAEPGuliT2njaWF0j2UG
         CXecAA4ovRbNNmPALHTJWj1ZxzIeBYpS+6omjnSlFFMqQfWkdAeVvJ57mtQu3TZFa/iX
         xsRqHh4cUu0KIzkApupKKAoBJPc6l53DrQZULfrbH4DBmrHgp5CsRtbIqfQOIBBGak8C
         DunvvvuSR+1HVmmZQb2mhDdKQNch8pWeZDpxWiJt4c2JhD5BndN19Fr7PmUCffTdNhA9
         XOiRJpOksHYywbmJA92QdoEPL+6NCqL6boq/SaDYB0gbP070x15NT52nl5sITDJithbi
         bdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768331818; x=1768936618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stsg0Oif8YoC5rlxj18cSFU0+gmD+OT6kM7lvFjKvLw=;
        b=oyJfguXDgLoa4BLk2+EOPuSDINvqjb56oQMfhCdhH3y72c95lvRlRooeDwjmCZ6OzP
         QCBh+HZqOfd/MUoDfmLaLqdtaAqXrtQmh4HAFomy+lEssPpikyesKSXm7xCgHDcZGkxD
         6lpuUuxkEeHGzePPp7BvxpAZzz6oPXB0mTb5N7+2iE2eYRoz2s9s369GKHPsYWuE66ez
         4l6h6d9plRsbKimQy8Lcn0INHzqNDHUY0E/meT6WrzwTAhgQVGpaEOVfQgW0bB81Ue3b
         xj/OECF5y52ptm2I/u28ZPbEsY9uytkl4wzVGyoAEuNJV6LwoSL32R8awtJ55jaui1Pi
         U6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZduXEqyDg9AWoY3CDJStfH2ty4R6ieTVkw/ms/9C3RCCE/v/DMoTELJYn8jUCTJTZkyG66mDa0QM6qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9Emj+6tMj/6Suonfb8VIAXydMP1H5vFsoHx1CSnhC7cXfX5k
	at2meJUGiQ/0RJdwZ5uWm7EQYbvt3TUAnUPiXPzFgi3ZsVThkUiCGzkiq9IBxibfqsQI/If45Lo
	LELlJb3dfPKmBnu7hWPpoPHAmNTqsI9jGsgNJ+5c=
X-Gm-Gg: AY/fxX4v1S2G7TNPB0QVe1YyySZswt5z0Hecqc5aZWlBxLib3gZxCuHxv0e+CNfGqOJ
	vZqoF/0nYwg/ozxXk0WI9sD9GH3cialC2aOXmesAr4A0CjLNHPqu5XRcAPfPy+HnhpxG0sbEOjK
	S9alrluvpKORh2afyo87jr7qMgkl/Iqdgi51EpvTcyKrMZTU5JHYFgRoCnT7uRIiRJC9WlL7thI
	aTGO3SceJl7qmbCvVkYgMS+xidxfesj10D/nDlxPPsXtkMVjTwLw6+cCf6vEgmvgdRpUcnX
X-Received: by 2002:a05:7022:3b0d:b0:123:3407:106a with SMTP id
 a92af1059eb24-12336a7c9d3mr69814c88.32.1768331818261; Tue, 13 Jan 2026
 11:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <d08f3edd-f5bd-4e6b-b174-e768d42df281@gmx.de> <6da5b1c1-bbe5-40a8-8363-3213265fe848@roeck-us.net>
 <a43a785a-2b43-4588-8fbf-5eaec398acb9@gmx.de> <43ea9f60-aa92-4c2f-b263-6a952a837a19@roeck-us.net>
 <2469185c-a1f9-42dd-a03f-5755c3d5ac09@gmx.de>
In-Reply-To: <2469185c-a1f9-42dd-a03f-5755c3d5ac09@gmx.de>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Tue, 13 Jan 2026 22:16:41 +0300
X-Gm-Features: AZwV_QgQlfFbCXK7hVVGVWz-2hbAi-VdqgtgS5wDGiQfE8i6s0ZQNp-bYmGOv1Y
Message-ID: <CAJ12PfPR0enKBN_AU_u7ac6Cqwsfsit+J2LQcm8MvTDjpDTdTw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Armin Wolf <W_Armin@gmx.de>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 9:22=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 12.01.26 um 19:17 schrieb Guenter Roeck:
>
> > On 1/12/26 09:46, Armin Wolf wrote:
> >> Am 12.01.26 um 17:36 schrieb Guenter Roeck:
> >>
> >>> On 1/10/26 14:27, Armin Wolf wrote:
> >>>> Am 10.01.26 um 18:19 schrieb Tinsae Tadesse:
> >>>>
> >>>>> SPD5118 DDR5 temperature sensors may be temporarily unavailable
> >>>>> during s2idle resume. Ignore temporary -ENXIO and -EIO errors
> >>>>> during resume and allow
> >>>>> register synchronization to be retried later.
> >>>>
> >>>> Hi,
> >>>>
> >>>> do you know if the error is caused by the SPD5118 device itself or
> >>>> by the underlying
> >>>> i2c controller? Please also share the output of "acpidump" and the
> >>>> name of the i2c
> >>>> controller used to communicate with the SPD5118.
> >>>>
> >>>>> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> >>>>> ---
> >>>>>   drivers/hwmon/spd5118.c | 8 +++++++-
> >>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> >>>>> index 5da44571b6a0..ec9f14f6e0df 100644
> >>>>> --- a/drivers/hwmon/spd5118.c
> >>>>> +++ b/drivers/hwmon/spd5118.c
> >>>>> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
> >>>>>   {
> >>>>>       struct spd5118_data *data =3D dev_get_drvdata(dev);
> >>>>>       struct regmap *regmap =3D data->regmap;
> >>>>> +    int ret;
> >>>>>       regcache_cache_only(regmap, false);
> >>>>> -    return regcache_sync(regmap);
> >>>>> +    ret =3D regcache_sync(regmap);
> >>>>> +    if(ret =3D=3D -ENXIO || ret =3D=3D -EIO) {
> >>>>> +        dev_warn(dev, "SPD hub not responding on resume (%d),
> >>>>> deferring init\n", ret);
> >>>>> +        return 0;
> >>>>> +    }
> >>>>
> >>>> The specification says that the SPD5118 might take up to 10ms to
> >>>> initialize its i2c interface
> >>>> after power on. Can you test if simply waiting for 10ms before
> >>>> syncing the regcache solves this
> >>>> issue?
> >>>>
> >>>
> >>> It seems to be highly unlikely that this code executes within 10ms
> >>> of powering on the memory.
> >>>
> >>> Guenter
> >>>
> >> AFAIK the 10ms are associated with the VDDIO supply, the VDDSPD main
> >> supply is different from that.
> >> I just want to test if this device disables VDDIO during
> >> suspend-to-idle.
> >>
> >> I have another theory: if the SPD5118 somehow looses power, we might
> >> still need to manually put the
> >> device into 16-bit address mode using standard 8-bit i2c commands.
> >>
> >
> > Uh, no, we can not do that. I tried. Changing the access mode causes
> > bad hiccups at least
> > with some boards. They interpret that as a memory configuration
> > change, and the next warm
> > reboot will end up in the BIOS. Then, after the RAM configuration is
> > updated, a cold reboot
> > will again detect a configuration change and BIOS will be entered again=
.
> >
> > That does make me wonder how the problem shows up in the first place,
> > since the BIOS
> > usually does access the SPD5118 during resume, at least on my systems
> > with DDR5. Granted,
> > those are with AMD CPUs, but I would assume that Intel BIOS versions
> > are not different.
> >
> > Guenter
> >
> During suspend-to-idle the RAM stays active, so the firmware does not rea=
lly need to access the SPD device.
> I meant that if the SPD device is configured during boot to operate in 16=
-bit mode and looses power during
> suspend-to-idle, the firmware might not reconfigure the SPD to continue o=
perate in 16-bit mode after resume.
>
> Thanks,
> Armin Wolf
>

Hi Armin,

I tested whether firmware reinitializes the SPD5118 by comparing key
registers across cold boot and s2idle resume.
Register values remained unchanged across resume cycles, suggesting
firmware does not reconfigure the device during resume.
To avoid introducing platform-specific regressions, no attempt was
made to restore SPD5118_REG_I2C_LEGACY_MODE.
