Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FDE325709
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 01:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824468; cv=none; b=qz8uWg9Z6kdF4IscdaVw2+leCag2IncFNzSpxGuxHRMk5sbIUcImgjul65HF6hIW+PSN7Lu+cwIs6nQCBPsWRKpE3Bv/ng9eJUUNgsmxpHiDdkMQnUFhlY/Tx/oWitqpAJbrHh8ypId41QFniogtlNC3i7/vVHJHXBPH42WVafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824468; c=relaxed/simple;
	bh=b89r8oNyxy1f9uIIykaRIblOj8oqKw7wVVQlUEVUVUU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kmr3UaC1TEDquCFcfJjVnmGwhuC3b8IoLWyMlqV70914ceAz8kahztf8blBIvXdc9ddV6mRK6sYis3/zMONcy09TLRAhBGEkdzwJ/38vyKNF5RQLi5AJjlao3BSID6zmpNWaXAJPbYFRmswCZu+Ja0e76RKadGGrRjwTqGMHXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jA1FSprI; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jA1FSprI"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56376c3e866so1964321e0c.3
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Jan 2026 17:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769824466; x=1770429266; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7HwHD9oJM+lpMAOjIcUYMNhaahqoW4TeyZpr/y0yGY=;
        b=jA1FSprIyLilP5kkHQxTw/fKYXuAZHs7sPvKPaY+O4LAao0o6DhuUakeEipcpWGnAm
         9QCOHDDkDs6AbrXTRNxF97wbhGnxaA3bjOADHmqy6XGt7mos2STP4y4+MREpnziEs1YA
         iNaYclXWvDaHS6YfTY1WZlgtxIjHR/biPyaGBDq8ieDG1RaJdtZMWkcJ+TNtUmtZH3RQ
         9JO4Yr0n/y7yMLGxxooTxrti8gD/b4INic4QDDXl4moohQxPQPlrPl8dtH0DsQrnnyE+
         PqfjNUlSAcTu+wx7p96241MdM0AVgGRSuYu09rAwvJjw+9W1CraQgZF2Wl/Sav+H+A9H
         c5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769824466; x=1770429266;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7HwHD9oJM+lpMAOjIcUYMNhaahqoW4TeyZpr/y0yGY=;
        b=RSbbppIUzm7ztRtbmRfZcR+ySIlEdtOJruwoe9gDeWAxcJKVyEtvbWUe5ceHdSpEK1
         7MwehSg2IWJ6iIRs2lV+5wmQF1lwjUq0gCWGri2hUu/pnQAGmjBm6cIldwsLTtoUM7dd
         tF3ghdLAr5o9z7vF5rPw5j2pmmC0dZdsLX+1Z+JPNTw75i8+aAJIhBR7c4fAzbqyR8T+
         idKkjQCriiGtMPsuIkb2VLmF/eO4HoZnB3wSemwVAcwnBKrf090mE7cHNWB+JsvlCL1U
         ei1eyBGPO41o6rWBlwP/4tT01rDzx21xC5/edbyQ2KFiHLxxgbDXvDqaia3sp4ZKjZ66
         xNLw==
X-Forwarded-Encrypted: i=1; AJvYcCUaOO/N3Uuup/IeSOsafCqF891vMEwETwMAEKp2u5aYbrXFutzicBw43/Rk1VlWhItJe/+5djGktAJBiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+h2dGKQlOQN9AXaeFbubA9ditCOiYx/NbRa42Vk0NZhcwHYSv
	G/2SMKmo+WxJVbEJcyoKGDKwwqnA1fKBthwxzgyatCTpItIP3v5BqCne
X-Gm-Gg: AZuq6aLGxIFPy4znb8UMXIUzptG71/6g2LI1SC1xdgKowLcRIf6/CUjPc8mlsEK6PIU
	i1stPUZl62o5C4XEtFsPRiqpFf7uBKmxfnULRGtDj9x3EO4YFWaU2aIKAciaAcZbK856B8yuBZn
	yYu7G049pOoJJ0fAcxWGPq0ZrX8V1PHfHbNS8uz7TahtWXHnVzYFy0L6GChNxfZs63mhI0t/6Ti
	Gw9prONHWjQxMjPwK69kpgIXExWwUo4UgoPbpcdfOovl+5icf5i2Mjmd/pg2HaqfWq1J2tVT5Y5
	3Hy0KTs/LtgJgIzMNirSBuOrdHYbEr0JRfMFkrUc+xC0kpibmYe6nT28YxQtAYVaJUDskIr7y9x
	5ntEUwZdiJ5Uq1i1Ws8tyZI307nXAqtAs2yyztyHKyGJiSCB3TawCVaidByiKuN6jzcLutfoJFs
	f2echNaw==
X-Received: by 2002:a05:6102:370a:b0:5f7:24e9:ece2 with SMTP id ada2fe7eead31-5f8e25eab13mr1493517137.28.1769824466299;
        Fri, 30 Jan 2026 17:54:26 -0800 (PST)
Received: from localhost ([2800:bf0:150:1112:fd48:bce3:7e1d:77e2])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9489e3bfa6csm579444241.1.2026.01.30.17.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 17:54:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 20:54:23 -0500
Message-Id: <DG2EEU6SXFFE.20DWQUV1BW9QW@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Guenter
 Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 "TINSAE TADESSE" <tinsaetadesse2015@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com> <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net> <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com> <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net> <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com> <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de> <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net> <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com> <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net> <CAJ12PfODdy+rgBumHv5gUeaqikUGMkADg-UoBLuZPrtBanF40w@mail.gmail.com> <f6c1e5d5-61ad-44ba-aa7c-231334d3e821@roeck-us.net> <DG2D60UNIM2J.3BXEHP4RJU0BL@gmail.com> <f9a4e815-bb21-468b-9568-b4acfd792527@roeck-us.net>
In-Reply-To: <f9a4e815-bb21-468b-9568-b4acfd792527@roeck-us.net>

On Fri Jan 30, 2026 at 8:21 PM -05, Guenter Roeck wrote:
> Hi Kurt,
>
> On 1/30/26 16:55, Kurt Borja wrote:
>> On Tue Jan 27, 2026 at 6:41 PM -05, Guenter Roeck wrote:
>>> Hi,
>>>
>>> On Tue, Jan 27, 2026 at 10:23:24PM +0300, TINSAE TADESSE wrote:
>>>>
>>>> Disabling CONFIG_SENSORS_SPD5118_DETECT completely avoids the issue on
>>>> affected platforms,
>>>> even without any code changes. This confirms that the failures are
>>>> triggered specifically by automatic
>>>> SPD5118 instantiation on systems where the i801 controller enforces
>>>> SPD Write Disable.
>>>
>>> Thanks for confirming. Can you try if the patch below fixes the problem=
 ?
>>> It is a wild shot, but it might be worth a try.
>>>
>>> Thanks,
>>> Guenter
>>>
>>> ---
>>>  From b44c31c2c779a67827e3144b818cf21f5efacea1 Mon Sep 17 00:00:00 2001
>>> From: Guenter Roeck <linux@roeck-us.net>
>>> Date: Tue, 27 Jan 2026 15:32:32 -0800
>>> Subject: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor =
in
>>>   probe function
>>>
>>> Instantiating the driver does not make sense if the temperature sensor
>>> is disabled, so enable it unconditionally in the probe function.
>>>
>>> If that fails, write operations to the chip are likely disabled
>>> by the I2C controller. Bail out with an eror message if that happens.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>   drivers/hwmon/spd5118.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>> index 5da44571b6a0..3e0e780014f9 100644
>>> --- a/drivers/hwmon/spd5118.c
>>> +++ b/drivers/hwmon/spd5118.c
>>> @@ -552,6 +552,11 @@ static int spd5118_common_probe(struct device *dev=
, struct regmap *regmap,
>>>   	if (!spd5118_vendor_valid(bank, vendor))
>>>   		return -ENODEV;
>>>  =20
>>> +	if (regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
>>> +			       SPD5118_TS_DISABLE, 0) < 0)
>>> +		return dev_err_probe(dev, -ENODEV,
>>> +				     "Failed to enable temperature sensor\n");
>>> +
>>>   	data->regmap =3D regmap;
>>>   	mutex_init(&data->nvmem_lock);
>>>   	dev_set_drvdata(dev, data);
>>=20
>> Hi Guenter,
>>=20
>> I'm experiencing the same issue reported in this thread. This patch does
>> not fix it for me :(.
>>=20
> Thanks for a note. Well, it was a wild shot, so it is not entirely surpri=
sing
> that it didn't work. I suspect regmap doesn't actually write the register
> if the value is unchanged. Another option might be to try writing a value

I tried forcing the write with

	bool change;
	err =3D regmap_update_bits_base(regmap, SPD5118_REG_TEMP_CONFIG,
				      SPD5118_TS_DISABLE, 0, &change, false, true);
	if (err)
		return dev_err_probe(dev, err,
				     "Failed to enable temperature sensor\n");

and it fails to probe

	spd5118 17-0051: error -ENXIO: Failed to enable temperature sensor
	spd5118 17-0053: error -ENXIO: Failed to enable temperature sensor


> (e.g., 0x01) into register 0x13 or 0x14. Those are "clear status" registe=
rs.
> If that fails, we would know that the chip is write protected.

I'll try this later too.

>
> Thanks,
> Guenter

--=20
Thanks,
 ~ Kurt
