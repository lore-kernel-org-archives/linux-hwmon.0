Received: from mx8.mail-out.lima-city.de (mx8.mail-out.lima-city.de [91.216.248.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022E15622E
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Aug 2024 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724051401; cv=none; b=BFSVg00KCOUV20Uld0pXelWMz57sCSEYbHJBHxmZY512rIoeMNsBhXUnmmEJG2m2UWZ4XkBpfOx9OQ6yQQI1B5VASwC70vWuyY4sG/0q3iRJZww+Ejkpnui7kb3MshZ6KivKycPZpIl3TgtLbnsHH2JfjxPSezyYRZq8K/ijkOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724051401; c=relaxed/simple;
	bh=wnWvi1Hl5xlc8Acw/SrsRmO2s1GbIUOcKSgtlVx4yHA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=eUtpLVSkUhjV4S2N2s7xowGsCnDvexj7MTPhn1xT7l3dzozyhIN9evSkpAelQxnwexg8u4/DaPBIKadHU7BfkHj/9hnT4sNsczNYi7ApRVd4kQwBE7rp4toN5TFWpTgzK3dWeuUYGZKASVKe6KbruyFSDUW5gkZi3kMJajHKQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=johanneskirchmair.de; spf=none smtp.mailfrom=johanneskirchmair.de; dkim=pass (1024-bit key) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b=oxWf/Z5Z; arc=none smtp.client-ip=91.216.248.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=johanneskirchmair.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=johanneskirchmair.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b="oxWf/Z5Z"
From: <mailinglist1@johanneskirchmair.de>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=johanneskirchmair.de;
	s=securedbylima-20161106; t=1724051389;
	bh=wnWvi1Hl5xlc8Acw/SrsRmO2s1GbIUOcKSgtlVx4yHA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
	b=oxWf/Z5Z4ikpkYmC5oX0RwCzGJ1zKFtqV9RVgDst8ruqkxLQ/k4ChHgtds6b00u6y
	 +V8vNak5gMoKrlFYHphl8qaysqOXJrfulbwrsIbypGuzhanarXe3XUVi0UXy73yE71
	 Tx0QF0owWO2CGSuZDpk3U4m+IV7xq2Ksaj9fRwGY=
To: "'Guenter Roeck'" <linux@roeck-us.net>,
	<linux-hwmon@vger.kernel.org>
Cc: <jdelvare@suse.com>,
	"'Johannes Kirchmair'" <johannes.kirchmair@skidata.com>
References: <20240816063656.275918-1-mailinglist1@johanneskirchmair.de> <767fdc63-af2f-4234-a887-d34348e0cd15@roeck-us.net>
In-Reply-To: <767fdc63-af2f-4234-a887-d34348e0cd15@roeck-us.net>
Subject: AW: [PATCH] hwmon: pwmfan: do not force disable pwm controller
Date: Mon, 19 Aug 2024 09:09:51 +0200
Message-ID: <000501daf206$c9903e10$5cb0ba30$@johanneskirchmair.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: de-at
Thread-Index: AQIHUyWwHWDq46/jiPpNC3txnX987wF3GqwCscmuSZA=
x-bromium-msgid: 1f544850-76f6-4dac-8b1f-f565df0ccaf0

Hey

> -----Urspr=C3=BCngliche Nachricht-----
> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> Gesendet: Freitag, 16. August 2024 16:21
> An: mailinglist1@johanneskirchmair.de; linux-hwmon@vger.kernel.org
> Cc: jdelvare@suse.com; Johannes Kirchmair
> <johannes.kirchmair@skidata.com>
> Betreff: Re: [PATCH] hwmon: pwmfan: do not force disable pwm =
controller
>=20
> On 8/15/24 23:36, mailinglist1@johanneskirchmair.de wrote:
> > From: Johannes Kirchmair <johannes.kirchmair@skidata.com>
> >
> > The pwm1_enable attribute of the pwmfan driver influences the mode =
of
> > operation, especially in case of a requested pwm1 duty cycle of =
zero.
> > Especially setting pwm1_enable to two, should keep the pwm =
controller
> > enabled even if the duty cycle is set to zero [1].
> >
> > This is not the case at the moment, as the pwm controller is =
disabled
> > always if pwm1 is set to zero.
> >
> > This commit tries to fix this behavior.
> >
> > [1] https://docs.kernel.org/hwmon/pwm-fan.html
> >
> > Signed-off-by: Johannes Kirchmair <johannes.kirchmair@skidata.com>
> > ---
> >   drivers/hwmon/pwm-fan.c | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c index
> > a1712649b07e..10c4e9bcf10c 100644
> > --- a/drivers/hwmon/pwm-fan.c
> > +++ b/drivers/hwmon/pwm-fan.c
> > @@ -167,7 +167,7 @@ static int pwm_fan_power_on(struct pwm_fan_ctx
> *ctx)
> >   	return ret;
> >   }
> >
> > -static int pwm_fan_power_off(struct pwm_fan_ctx *ctx)
> > +static int pwm_fan_power_off(struct pwm_fan_ctx *ctx, int
> > +force_disable)
>=20
> Please use bool.
Just send v2.

Regards,
Johannes
>=20
> Guenter


