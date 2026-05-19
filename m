Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7989261B9B
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151841; cv=none; b=fwyzPxT4ACE5EU7b2sTZCtT+TKmNPpZ0M8H2ZAWGiOqgbvgjo7veNRFz/n2gQ6sIpyriWK7lVpU9ucJqTGdzEcmx0/ppfS/es++oxSuU43c99H+n7jeih5Q7YxFtA2akJKAMxsv6nGy1OCCuVV7r4Ml0XPwxgXOO5EguCQRZwkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151841; c=relaxed/simple;
	bh=PnOorzYYabHeSc3XxBftXhuC64icwN+rEkBLBJ5Sddw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=e4WHLKQuhDDtg1OXpjuEbV3hYvfkNw9GkgSyO8kW0oTW9mMJUniqWRt2Kpu4YvKv3yFRWqyjOpkqQktCQLiPL00htTYKfK8qh87M+rxgL0cCF27mnKePKKo2tiZ/ZK3H3Pin7vxLcEROFoBrJdpyp6f3PVVczgk5nQIECZ66uuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=AtSx4k1S; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="AtSx4k1S"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30246cfd41aso848067eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151836; x=1779756636; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tXl/22rkVvhZ4nUM4MbQlEreFWYdxVzxn1gtAZs1eA=;
        b=AtSx4k1S/w4HtbRht68BANm4Se3ny9ye+1bDz738CYbmowcNhTd+eawQPKsji13bh2
         Q1HiGT7EDb5DgWh8o76LC3JfPOkp4fk9e9S4ThVoz63Cm+ZFrzlTJ/XVu0gOlXO8gfzP
         TtwYD8skqLMq23vqI3ljKLyiljdlR9hePg4QNyFxP0iHqyFVDQZwDOd+xe0BLbpv6tvq
         O9pViAtqamwce0nE8h955nImgrk4D8qjY/t7gkkvd3Q0PoJPH5/Kru+zSNYUPCU5JFqc
         ojySzmukTH8rxRW6A3VLJRiQbTfSOR0HnyAKcM1D79QcH7SttJx+lJcoVi58jO1nwQsL
         y/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151836; x=1779756636;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tXl/22rkVvhZ4nUM4MbQlEreFWYdxVzxn1gtAZs1eA=;
        b=pGMSwP/ljcBGofN/2FYTMaNSuxvOayTApwg7k6QsjZjvL95VAAd48jkPcZSolZ9IL7
         /M21Pb9GSHlPaPcFatjVHq19lnRWBMg3InAAx9aZXcEYLxy2XkLYfgnBZaLpIQU+gDlK
         r+tmexZLAL97yTxPp3ViVkBzDJm/9Jj4MEdNlKIlaW/gttvYLNEc2mV3PQSPn4kx6QG+
         YoO5uTLj0Z7ZDaYuMM9SNliCLX4Uq6ZpFE4p9cww3pmpTfIzF22WsmFNMhdY51xB8hZP
         c8y2yBomk4Y9JH8HLN1kFBOtOBZMhNzkFPiXVH0V4JTRgl+bYkMAYuTyYaLLPEZqCwDY
         jS7g==
X-Gm-Message-State: AOJu0YxXLL/sL5ZVrJUdnPo59TGghpglM6CQhi8t8uPCUVEYUHoDgA2l
	bbohOIFboxqX6rGljSiBdU//Dfms671kdGMSRAkxHhPxanZHsNEbkFfim3GOZI73q7s=
X-Gm-Gg: Acq92OHZQtQqxP0j0q11ZjP/7eveUpcvXiOJk3DWy/i8cUobMs9uCJAcC0w3oe2KZtG
	E+IKz8GRCkyUsshDWK3r87Swu1dFGtq+taDN+cCXZ8mTHuQfYLfIrz3IM0Dkxl+NKx26XUM2+cy
	z03TPYm1JRohIn5omwNqbXnKekZIYFz7aOm9F/QoatpZxOryPwXhKBVQ7NggO9nqTt2ALZDxJxo
	pPn+NT7bFFSxpzIyXUN8iZPjkHkVRzdTx3Mx0GYy40viKMG8btdv4Wi4pXPFDP8qDcuUzfQD7MZ
	qQsBnHHQxW/yyhT4jSCgn6lNREbcaRJVUg5aOk8F2rWttZVAPdtwWI3arfVaSv76o7pRJ0nN9Gg
	fxmdvhZyF7shVQjw+B55h9YK3Dttux/0ka9LCvqa5NWGOUTRvJmYjJZTZ7RYS7PK7Nt8jvdjfHQ
	olAnuBZrlFxiKbJENmwMix6TY=
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id 5a478bee46e88-303986b7f00mr8980852eec.34.1779151835662;
        Mon, 18 May 2026 17:50:35 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afe8dsm15256199eec.27.2026.05.18.17.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 17:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 17:50:34 -0700
Message-Id: <DIM8OTDD82P1.V7SRZ5IA5CDL@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Alexandru Tachici"
 <alexandru.tachici@analog.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH v2 0/5] hwmon: (pmbus/adm1266) GPIO accessor fixes
X-Mailer: aerc 0.21.0
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
 <6ec6270c-595e-49b2-8465-31b5019de87c@roeck-us.net>
In-Reply-To: <6ec6270c-595e-49b2-8465-31b5019de87c@roeck-us.net>

On Mon May 18, 2026 at 3:08 PM PDT, Guenter Roeck wrote:
> Hi,
>
> On 5/16/26 16:18, Abdurrahman Hussain wrote:
>> Five pre-existing bugs in the adm1266 GPIO path that all landed when
>> GPIO support was first added (commit d98dfad35c38).  Each is
>> reachable any time userspace queries an ADM1266 GPIO/PDIO line via
>> the gpiolib char-dev or sysfs interfaces, or reads
>> debugfs/gpio-<chip>.
>>=20
>> Patch 1 caps the PDIO scan loop in adm1266_gpio_get_multiple() at
>> ADM1266_PDIO_NR (16) instead of ADM1266_PDIO_STATUS (0xE9 =3D 233, a
>> PMBus command code that ended up in the bound by mistake).  As
>> written, the scan walks find_next_bit() up to bit 242 across a
>> 25-bit caller mask, reading out of bounds and -- if any of that
>> incidental memory contains a set bit -- driving a corresponding
>> out-of-bounds write to the caller's bits array.
>>=20
>> Patch 2 drops a redundant "*bits =3D 0" reset that sits between the
>> GPIO and PDIO halves of adm1266_gpio_get_multiple().  As written,
>> the GPIO bits the first loop populates are immediately discarded
>> before the PDIO loop runs, so any caller asking for a mix of GPIO
>> and PDIO lines sees the GPIO half always reported as 0.
>>=20
>> Patch 3 adds the missing "ret < 2" length check after the three
>> i2c_smbus_read_block_data() calls in adm1266_gpio_get() and
>> adm1266_gpio_get_multiple().  A device returning a 0- or 1-byte
>> response would otherwise compose pin status from uninitialised
>> stack memory and leak it to userspace via gpiolib.
>>=20
>> Patch 4 moves adm1266_config_gpio() past pmbus_do_probe() in
>> adm1266_probe() so the gpio_chip isn't registered (and reachable
>> from userspace) until the PMBus state the GPIO accessors depend
>> on is initialised.  This is a prerequisite for patch 5.
>>=20
>> Patch 5 takes pmbus_lock at the top of adm1266_gpio_get(),
>> adm1266_gpio_get_multiple(), and adm1266_gpio_dbg_show() so the
>> GPIO PMBus reads can't land between a PAGE write and the paged
>> read pmbus_core does in another thread.
>>=20
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> Sashiko reported a number of additional problems. As far as I can
> see those are real. Would you mind fixing those issues as well
> as part of this series ?
>
> Thanks,
> Guenter

Sure -- v3 (sending shortly) folds in everything Sashiko flagged on
v2 that isn't already covered by the "buffer-bound and timestamp
fixes" series you applied to hwmon-next:

  - New patch 5: register the nvmem device after pmbus_do_probe();
    same probe-ordering hazard v2 patch 4 fixed for the gpio_chip.
  - New patch 7: take pmbus_lock in adm1266_nvmem_read().
  - New patch 8: take pmbus_lock in adm1266_state_read().
  - Patch 1 commit-message wording fix (Sashiko corrected the
    "27 unsigned-long words" arithmetic; no code change).
  - Reviewed-by tags from Linus Walleij (patches 1, 2) and
    Bartosz Golaszewski (the rest).

Thanks,
Abdurrahman
