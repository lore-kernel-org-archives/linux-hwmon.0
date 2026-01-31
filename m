Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220382F691C
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769858824; cv=pass; b=eaJS81gg0y2mzrZRHesBY+oTmW9y9n1CIRmNuJ7AcJV56jK+eFnQTsQO+2sdjIbxCFT0VYeHoZVDNYa/XzOK2sOR1WUwweOOjM9Q14OWIhztxhmKKnIo240pELn8xdI9oKUkaVWhNKqK/6zxlEdOzZgJxeh2US6GIxBNE4ai/g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769858824; c=relaxed/simple;
	bh=8NF5Czr5HB95GgXmJi488Rbic/OEJ/kfrcwwpR4aC/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sojQ9/76ZgWdkWs113nfCpjHl1n17G7+f7ekbW8z5hQPNDICbEbwlQrxCgpEZKBZNr8pXQrmYJvWqYuJQSwDQEmxCsU7GHDuT19aJwDyWYlygoCwnl7/W5CFs6AinC4yBGnm07R829W+uyCqB6Gtrh8smjSmVoER3wb0tdX/j5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mv04fydH; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv04fydH"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124877d78a6so3620191c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 03:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769858822; cv=none;
        d=google.com; s=arc-20240605;
        b=F1tSWjBZ5yh9E9KPiiwGZssb8GrKdar9jBjBh22H5p+7RVyK5mOC97op+Ap39aCRGs
         1g9+aKzI4mTQZarwlb4d09NIsPJJdEujzLO9Mtt66y/uTlBQAgE+1SnTUwF/NwgoIpt9
         p9pI5zy0I8XtulGXwBKNb6CGlElULFjFecemk6we3ulRGb0g/2g7ZE6vNmcT6O87twk7
         tRmqWMNSGmpRbdQHP9bcVDH1wbM4J4kU3QYRz4NtUXfiN1M2vbv3Fu9qMF8QxTnR2uwk
         Bm/N9iyfy/c9ktaHqAr4U6iCy9ygpKWzjWDOcWCaITssiKxg+H9fxkk84gEHhekpWzCO
         2wjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+t7rslSvC33skwab4GIl+M5MT8JgCNgHezgpW59ywq0=;
        fh=wLGbUpy1UzlR91QXBOJ1FkXxiEnFSdTl8Z2iDd6DOV8=;
        b=e/+pfkHRyGyTrsUaYCHSAhIBFplnIY16kEa65zK9nCYsVibuenOsso98/TiVFd0kU4
         +vTlZyOPInnRCX/J/MwC0I7D9LH4bPCirHTHhzFM9sBZt3k27aoDsrltDXjXs2+5gxM2
         HtHisC4QXDh8VOTvy+6Egh9eyF7+gWCPmgwS/gQtBsnRFVmUK6WpLDI1lZ6y/8XoQqH3
         Glo1gyJ2pD0UoDkujJ9uhJNJeYFm78WwOlMbH/mcnuy7VkKVjkuZpjXvr1rFE7ZKl+hY
         0zS8SvLMhUt3ucd/1noX4tBXKCyUutNAmG5alFwksy3DxXnum+Iq4ewUKL9ynQoLtt5k
         mpEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769858822; x=1770463622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t7rslSvC33skwab4GIl+M5MT8JgCNgHezgpW59ywq0=;
        b=Mv04fydHL+ICaG1q2gmPOjoXy4cTmCRb/M+H7wlm/5gq/X5oKNSR5sRhw0z603SYnq
         7Fl/Elgoy14X4NpNOk3iNiQSblaIIIYggYKsIuQCboGqYC6XM6OU0ztEVHFTMAuRfBlY
         DipnQmnZ97NvZTnjUM4wSmlutFwUVHb9ypU4QLNfhJl/YGn2uEI7YG6Bd0a037vLL1E9
         aMkx6bGmQ+u9HchS1Pf5+kgCzVuEEAWkSGpjndZAUy1c7o1+k4CKkx5qB04R/sS/BtQJ
         eYOhpgrkkqKdJI8vOej+MolbNxf0qjsNQgNJ0LRcf73LctdvIz5IOvfIV8qySStQaGR+
         8P6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769858822; x=1770463622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+t7rslSvC33skwab4GIl+M5MT8JgCNgHezgpW59ywq0=;
        b=BG2nNmgL7CcQfO5HM61xYwnwwBGgpZf/K2y9lx2maPY+Uvb21ltS97i/83rn3b49fO
         W5AuMRgoAmNSIh36M0youPIIqPv7ghPKD3MFiKvCXb0L6JSZS+ZwlpuF41Sb2ZKR6Jh/
         nn1M2Zk7TTch4rp/x72ydDpGjz8039h2sTZjaL5Y9zJrwuVh+dPQnxF1CBvGYKQWGHwb
         IyzQTU0FBBKFihY9gtC9dTFia+HmI2rMWNZ3PNYemLlGyQiJ+bFAKdLgKvJIzSxd09f8
         ZtRw+zV8wWnOHsVDoNqSrEvq3/79v6jDo4cNSK0cDGJeEoPSTunOQNssSxYfFV7dMZLJ
         TjSA==
X-Forwarded-Encrypted: i=1; AJvYcCUOxE2fw7hZehf/JWkjhgLgyhXP8JIoSh2RP8uP3CrY6DqBQ6kxtcuoftPxyPdva6YtmZL/9KkJRgpnNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSu8cZHJ2Hr0fG7jFOSVYmzw/GBbZHVA57YixVFF7F0zooWff
	WBuZQtg1zwVhT5o/+p41F7LPzlKIH1uwrZg/5NPXlcG5qvdQKDWJ2pLzYh2ifCchGDDMvfw5fke
	xTSzuN9CskJJOFdZYE1YZVcvhJnvisqM=
X-Gm-Gg: AZuq6aIkIpR4NDOb9dylNDrxL9ljh4z8Ed2RS5eIr2/YcejYcLxOFEooxofRIcL1Doz
	XzkXaL72l5sgNVEqpUnK4oXk78pq9VjqsjCGG7bZBg2I8Wpvl40f2uW8hnryCax7+7++/3JCrV+
	3EJFH1GCMWUw9vuMX5CKXd0pNPm7LXOcv7FMOlXw+h/FCqWguTfId80n+XkZhmpukk59mXTLG5+
	hNGoqtrhxp3U1wLovmTsDfX6rcc9ZJmSOidbhkfPoDOYVr+WX340wV7OtMnX1FwKiNyBqha3KaA
	dQfMQ40=
X-Received: by 2002:a05:7022:fa6:b0:123:330b:3b5 with SMTP id
 a92af1059eb24-125c1000d2emr2587106c88.30.1769858822066; Sat, 31 Jan 2026
 03:27:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net> <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net> <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de> <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
 <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net> <CAJ12PfODdy+rgBumHv5gUeaqikUGMkADg-UoBLuZPrtBanF40w@mail.gmail.com>
 <f6c1e5d5-61ad-44ba-aa7c-231334d3e821@roeck-us.net>
In-Reply-To: <f6c1e5d5-61ad-44ba-aa7c-231334d3e821@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Sat, 31 Jan 2026 14:26:45 +0300
X-Gm-Features: AZwV_Qiv8Quu_NK4PPkULPCn4NRyUm6WxT5kWD4cwaEf5qBBE-VLDN6mOWzoJpc
Message-ID: <CAJ12PfNFtrKOiQRzh9T+VPa3FDK6VdG8y_xBqM4B6BD50pQzWg@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 2:41=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi,
>
> On Tue, Jan 27, 2026 at 10:23:24PM +0300, TINSAE TADESSE wrote:
> >
> > Disabling CONFIG_SENSORS_SPD5118_DETECT completely avoids the issue on
> > affected platforms,
> > even without any code changes. This confirms that the failures are
> > triggered specifically by automatic
> > SPD5118 instantiation on systems where the i801 controller enforces
> > SPD Write Disable.
>
> Thanks for confirming. Can you try if the patch below fixes the problem ?
> It is a wild shot, but it might be worth a try.
>
> Thanks,
> Guenter
>
> ---
> From b44c31c2c779a67827e3144b818cf21f5efacea1 Mon Sep 17 00:00:00 2001
> From: Guenter Roeck <linux@roeck-us.net>
> Date: Tue, 27 Jan 2026 15:32:32 -0800
> Subject: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor in
>  probe function
>
> Instantiating the driver does not make sense if the temperature sensor
> is disabled, so enable it unconditionally in the probe function.
>
> If that fails, write operations to the chip are likely disabled
> by the I2C controller. Bail out with an eror message if that happens.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/spd5118.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0..3e0e780014f9 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -552,6 +552,11 @@ static int spd5118_common_probe(struct device *dev, =
struct regmap *regmap,
>         if (!spd5118_vendor_valid(bank, vendor))
>                 return -ENODEV;
>
> +       if (regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
> +                              SPD5118_TS_DISABLE, 0) < 0)
> +               return dev_err_probe(dev, -ENODEV,
> +                                    "Failed to enable temperature sensor=
\n");
> +
>         data->regmap =3D regmap;
>         mutex_init(&data->nvmem_lock);
>         dev_set_drvdata(dev, data);
> --
> 2.45.2
>

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 5da44571b6a0..ec77930bbc7a 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -552,6 +552,14 @@ static int spd5118_common_probe(struct device
*dev, struct regmap *regmap,
        if (!spd5118_vendor_valid(bank, vendor))
                return -ENODEV;

+       err =3D regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
SPD5118_TS_DISABLE, 0);
+       if (err < 0) {
+               dev_err(dev, "Failed to enable temperature sensor: %d\n", e=
rr);
+               return -ENODEV;
+       } else {
+               dev_info(dev, "Successfully enabled temperature
sensor. Return value is: %d\n", err);
+       }
+
        data->regmap =3D regmap;
        mutex_init(&data->nvmem_lock);
        dev_set_drvdata(dev, data);

Hi Guenter,

Thanks for the patch suggestion =E2=80=94 I tested it on the affected syste=
m.

The probe-time write to SPD5118_REG_TEMP_CONFIG returns 0, and the
temperature sensor is enabled as expected. However, this does not
prevent the suspend/resume failures.

This is due to the missing 'force_write' flag passed from
regmap_update_bits() to the regmap_update_bits_base() function.
If this flag is missing or has a value of false, the corresponding call
to _regmap_update_bits() will just return the result of the preceding
register read operation (which will always work).


[   27.018685] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
size=3D8, addr=3D0x52, read_write=3D1
[   27.018709] spd5118 14-0052: Successfully enabled temperature
sensor. Return value is: 0
[   27.031170] spd5118 14-0052: DDR5 temperature sensor: vendor
0x00:0xb3 revision 2.2

Sorry for my late response!
