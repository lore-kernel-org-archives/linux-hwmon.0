Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793086344;
	b=cticoQBePbLfEgcduRWNRj5EW1PQRtzKhsxH88ix2UupT1yOsVVcW0yjfGs57gSmA7pz
	 ZXCBpWPAftleczhK6PlMGL1OmzN3fMVgwNZEwe1VdiDU/tiCMZ3Odb8S16jiN86dyDDq3
	 3JKdA3abUs7MHkRkMEJEwmdKZOc6oRYWs9b13okBr1LtXIK1TDK5kIIgy76TxT0nqxGUO
	 HPMV2Y8FtzdbgyXOfOlq1Oz/OvDy4AxmLCBjmx/MZhWob2ftF6fRhx0SSrWX4BfKntK6/
	 PxuJtSd70PGE+DVwhyYwgUpFgjD/Qmcs10wHEpyH2l8kmQD0syvNxvAElCn8Lngsf9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
	b=GFDGgCon6FjhK0FMZ1OqxuJ+R6faG39bbQzdrqjNaUEBFKm8F56M6yu8zKx3Xq6o6Or2
	 IXD+kXs5eOqm1dcO6xA6ptsFxrb9KmRysupl3ZEj+gtzFiYc8FaEnk3m5DNfYUukU9+Or
	 mB4NhRrXrKpulQ4GHUcXaYPul0z66W6wFWSYVSl7ZMksh98BA32eusUwcyJ99GNWbmoRX
	 5qCFh/tLGDaABebVd0xi4wxBxWRYY00fOY8fDpORbD5c8D49Wy+xEM1Yu1WrmvILb/fPV
	 9SgHuWk9ubKanfAdaF97HBGlYKxGQwL6EXipjpMfc2VIbU3e0sz3ghypDsqtPZDaQ7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YL8BP8wy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3B9606A31B
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 07:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YL8BP8wy
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e940d5d2beso14610955ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 00:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793086343; cv=none;
        d=google.com; s=arc-20260327;
        b=Zjdq24cstt1XtX+pXEBomVGThoTx2rr/ulqNq8Q1rt5GhnoepiQwmWez557XkTG6/R
         lKxw+Cd6cbsJj+iPa0L3IUN7y9VThkKTxdCoSrpSIQ8A90Oy7woDThqkDLeDCMXGlWYo
         RGbbaM6r2I02LcC4Lf/iupgD6BVMEvHvOWZL2yt0DQ6ooDNKBpHrspe2EqYR2IyZmbSO
         fGg+7OCjhaAR24RP+nVc8QC3d8oOXx2UU1isa0kUisFE9lACl8UYfAulVNzrIr+1FNqB
         ZDOpwymlLj8USCkejwPcjChI+12K1vMlrjHM6cmDu3zFI0mj9YJlkroJOL4uNqShnK9M
         XrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        fh=NJxMHcQVAERToMfbVTN0ydUaDcbOW1PYVaEvQOEd1UY=;
        b=X2K0MU5papjVtcOXKkDDA65AN1Wsm0epCn3jELTD2huxOeV0ojBgJrRFxA6GZ1Zw1H
         byymsu78jTOlWB1tZhd6V94GwfoxaRQK4mgyTg+egmUqta/xXBehokOq4vTaMPbfNveJ
         1WoxbztOXk92gqqYJ6hwiMcdspViIj49YJXzUBH8xh19p6bDGxbfDjc8+G88VqwX5vdx
         1xp6P8dgiLYu8p7L535fEa0BTKgJ5WMfeTe0hOQ02FI6ahJP5P++UCdHkRvALRnTN8Cv
         tdBm+hp9+pHuuCEc0GkHPN8ox0Ns0lFdEPb/hU2fypIpycioIeMcmg0oJJUPKoVQDTdD
         YplA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793086343; x=1793691143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        b=YL8BP8wyexK/8SFCO6OfsU0UaXLGTHRdaSjVBfthdxT1em3vn+LU1OwRwHpjjKSe85
         xbIdgiqC24a71dwg6nLRJ7AevpIiXtaYPBBBdaBeMo6O3nDYhQbxz1T3IpcSrbMhz1aD
         TT/dNLYNXzXVACoviOpQfR7Iu8F63ueoQLTIDvqkLM7qMSpfMiWi/xBwCbBKZry0pY7r
         epkz7daeoH6cBlCntkg02KdZJI06KQEb4XOjHfUVbPMkO+PNv//rpRqVQkIkD23g0qEE
         ORrDS6JnsryHSsbuv7pubZi/pecDF1pFQB5PyYuagf2LBpPEZDaiYFzNzQiJzfHTEHAb
         WpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086343; x=1793691143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        b=jfcKZJcyfuV6m4wZ90zAHDcQ1CScisJokXuDiGNZv7ZSQNjL6pEvaGkGHGxJ2V/eq+
         Ksql87GbQP7wc051ov2+ra5atQdREeO0EkRulQoPaesdA29fdvMFMIdUpW68z35N8N4f
         ig9EKwldy63H1pX2BGOqyGv/r//yTgq+gAYgaaCdmJsWnqvBudxYTnVIAzpm5r5m3lP8
         NetyuY+/9wVm416h5aAMW/6nxbY/UdDlnCk0O16Jv0gBxQmhzyBT9/oALSuwCPUNneri
         bZyuHSBOWDTE0bQa9K3FkITF7CqaLcRCzw+2Hr8uXSc9eEHhBPyTAjUobFdhwkUjgphJ
         Ir4w==
X-Forwarded-Encrypted: i=1; AKwUvBwUjt1UWtXqclfpSvE54inmsoUxh3/GZrRsE++dYYwyf3pNnSYTVh0AQuY1iRg4VY88a4q+4lDK2IytaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLDnNMbFeXy8OcZXBBQjWpsV6bn3jEBiXopoXZemhyBM5yH1fIM
	5j04r3bOVXEprtwrh0Jy9YvZMqu8FmN1Jm0GQRNznp1Obk/sC8MUjR4XZqpIZggSDBrmE+hOqc7
	cAnwDU0Y6bY1OI+9bVCebTV+IbFsdYnk=
X-Gm-Gg: AYBFou12uDih9Uzy3aaHZ+bTFmWzWo3RPytn0KUEVaXC7bRfh/ls98A639wMRYha4sB
	0SjNCGMqD/s5jgdDYv6QvebZ/OaBAdEYdjQJms+y39F9+7GbuYckA7jZbCCGCNxUc/yH4tFuRNz
	y47EUh156CplSL7pZebHvuzB6jV9/nbA2tlo0EIh7HMKjuQjYj1xZgEU5QnaZf6ilyJooD4XZ0U
	J1KSBdSzC1QmBbYZV2bfeCVi0IxJhHxbdmT+neD3MlwhKaRqx6NiwLqdyFSMApxy55TSjLIK304
	dDQxYa6nk2RA+TCXZNlgzFq0i9Ftk3tjdbaMDW5/AC/xTQj3OPIj6H8yCFWGhKxDYZqw5Okoblb
	uU/iho4S732e8x3luPkJbdgD4TiMSlcWrdESui1FG4KsuPzstIaKr
X-Received: by 2002:a17:902:cf12:b0:2e9:66c4:1713 with SMTP id
 d9443c01a7336-2ea9c917ba4mr66194015ad.58.1793086343005; Tue, 27 Oct 2026
 00:32:23 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-6-pmazzini@gmail.com>
 <f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net> <20261027002635.6b831c0b@kemnade.info>
In-Reply-To: <20261027002635.6b831c0b@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Tue, 27 Oct 2026 07:32:14 +0000
X-Gm-Features: AclHuK8Ysr_hMD-q4J-bxGC_qjlgkxL35TncLn6mKe9lS8sJrvJ37KNEcPQTV5s
Message-ID: <CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
To: Andreas Kemnade <andreas@kemnade.info>, Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter, Andreas,

On Mon, Oct 26, 2026 at 07:35:24AM -0700, Guenter Roeck wrote:
> This is going the wrong way. The correct solution would be to convert
> the hwmon driver to an auxiliary driver.

Understood. In v2 the hwmon driver stays in drivers/hwmon and becomes an
auxiliary driver of the regulator, which binds the I2C device directly.

On Tue, 27 Oct 2026 00:26:35 +0100, Andreas Kemnade wrote:
> But it introduces another race condition.
> The temperature might be read too early.
> 1ms delay should suffice.
>
> The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before
> reading the temperature. If that register does not reset to zero
> but just keeps the temperature last read, then we have no problem.

Good points. For v2 I read power good (0x07) and the temperature (0x08)
in one I2C transfer, and return -ENODATA unless power good is set, so no
locking is needed.

Thanks,
Pablo

On Mon, Oct 26, 2026 at 11:26=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
>
> On Mon, 26 Oct 2026 07:35:24 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
>
> > On Mon, Oct 26, 2026 at 12:39:16AM +0000, Pablo Mazzini wrote:
> > > The separate hwmon cell enables VCOM at probe. Report the temperature
> > > from here, as the TPS65185 and FP9931 drivers do, and under the chip
> > > name as they do: read it while the rails are on and return -ENODATA
> > > otherwise. Boards that need the rails on mark VCOM always-on. Drop th=
e
> > > hwmon driver.
> >
> > This is going the wrong way. The correct solution would be to convert
> > the hwmon driver to an auxiliary driver. I am not going to approve
> > this patch. I am not giving an official NACK (yet).
> >
>
> First we need the problem defined, then the solution, and then we can
> talk about what is the correct solution. The commit message does not
> name a problem.
>
> So what we have:
> one bit to turn on a bunch of things,
> after one time to sample (< 1ms), fresh values are provided on the ADC
> register periodically.
> after some more time (max. 50ms), several voltage outputs are ready.
> Powering on those things is expensive, so you would not use this as an
> ordinary temperature sensor.
>
> The problems I see in the sensor driver this patch might want to solve:
> - problems if the regulator driver is registered earlier.
> - not having powered on the regulator all the time (that is described
>   in the cover letter)
>
> The way the patch handles it does not require any structural change,
> availabitily of the regmap is given. So it would be a separate cleanup
> patch.
>
> But it introduces another race condition.
> The temperature might be read too early.
> 1ms delay should suffice.
>
> The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before
> reading the temperature. If that register does not reset to zero
> but just keeps the temperature last read, then we have no problem.
>
> If not, there needs to be some synchronisation between the regulator
> part and the sensor part, probably a mutex saved in a common structure.
> And in that case, structural change of the drivers is needed which
> I see the following possibilities:
>
> a) non-simple mfd driver
> b) aux device as a child of the regulator driver.
> c) regulator driver containing everything.
>
> No strong personal opinion here.
>
> Regards,
> Andreas
>
