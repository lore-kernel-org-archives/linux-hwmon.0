Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221A2D3225
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446575; cv=none; b=VGwVheROY+PmBPiRy2QKA6HrUt7GT6H0IFED/UadoD4MNzLNCSInugFE+si8FjaA6XrqN3OAAtpxAjLG8viZ8/MqlCJbK278xoNEeXc6QhMfGxy8N043gMR1wPMq9vQ8ssS7CR7gijwpxeYzwVgWSUIyQLg6HzJGmaUEjsWQKK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446575; c=relaxed/simple;
	bh=f1r7DKM/n0FhcdoAYtEk1jUa/w0sFRcIhw0rpTmJzCo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qg/mY7JCJpRlzBeUdtjZwOEsI1vZywR12BY7i5eMW2w39Rza2OcEcOkdd7WpVhOIE8GT0hlJ7phVXvdnuRZspjrWoGOaoJX0bPC4WTgz3W8WC1kQ/Uy9iKGOViXQ78YhmzxVaiXq8DfcsAOopcmCHi0YuydXgfrKOKjkfDlv1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM6ZrHon; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM6ZrHon"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486b96760easo22353165e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774446572; x=1775051372; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4RaLx6E7E7q4OH4hwv8i+VQD+/HBlkeXtXO4eT0St8U=;
        b=nM6ZrHonAIwAt7ZbcUlvTtlGw0KXHAW/loz+z8Kf6GhahiSPSwnjIQcqzNt7Pkvm57
         5WEU+LsTkFAYs8pru0eWWZAZnjdwcnfdJ4liG5DNh0uEhm2T906oVFO1swYH0VcC3aOQ
         Zm8rOLEVLOEaehCx/uzb+UGcz2iLeJv4HOdKRWOKwH2MPBM+BUbWjCqn2VT0wTjdYz1S
         6wkFHG2QHJc20Mo3vXz76d8Gr248QmwAUtUZe58bVDAHaIHm2SLS86f2gmPYm18jz4bZ
         Bb4ykTA22THKEAQ/flmy7revvWXDJJZZzozaKaOU3bPUlXaoCz0a3VwRBDwkgm0ipVJ7
         EXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774446572; x=1775051372;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RaLx6E7E7q4OH4hwv8i+VQD+/HBlkeXtXO4eT0St8U=;
        b=kpJygkGecQBldq9vOiXp9ao1rheg37GcbBDG1QQ2IE1pFxaemR/7BcyAlaNlkmtRaA
         hT/6Si+D6pif4FoW1qdNz5x55+4Y+pXQYGLPQgWTNKTcbQ0zV+Nw0ApHfRdr+2lqmEh+
         3Lku5akFOQQPEH9SBmDYkWcQe+wVqv/TUh4fpkKOvU2RhRJWcJAMzKvtL3QYOubGh9I9
         qzCGAKj8KpKhKtWDhDhYv8hyudk3hEXMmsn6lZR/y0eLQB/tMeju1p94pOqhLyQpJhwv
         LpMWPlxVK/AZMdXwtn49YlKD53Of4YSnOyz+KVy50Up2hmrKzm2wP/sow/1/LDnzHBkk
         +CYg==
X-Forwarded-Encrypted: i=1; AJvYcCVGf9GbJL+ZSf8o45YtQjnrIBqm/XvUQd0QqnKs0rAcg4p7IXeAKvs9S0bk+FNbSzbzDdcRs2WkPApwQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypK9Ha38AfMzdgKee4zrjDQRpJ74lQUCnjzAOq5dPCb064nujN
	yDQVM2o/fleuQ0YazKAAMzNBCJSP/fWGF2shlaWXmNcOkZFzNf0TikH3m5QOJn5TPEU=
X-Gm-Gg: ATEYQzy6qi9G7+BKnqQe9CTuVqONUETrTEwhhzcJHoJyQnmGl7qz6+o8gYS4a9vSF4a
	cxmZS65L2s87GlHJpNgFHP82hR3r/1Py4ovB1H2erjc9Mimt+nttyg505qaSbOxtvvQJBdADtj7
	ixQqkLjkk0qXoiawxvUmWwQ+kM81uY68no/urGkxKqbl6SsggQM5I+sWlg+E38ZT6G1GP8D1r56
	DXrHHmoqiyS8nTbWHhBIMDbkxwwd7C/HLYpwt3KTcajoVDaXZXHqNU7FHkcRs3zRTZfiMlAlMrZ
	OlaUzWlTX96F0sEx0/zc1KbFM+elc+s5Ct8crR9nffQvq3eWlzv2CjjgjJj+W+UjqsWCaXYItS4
	j6VJMcIMDKMxty1aLPp8W8RxyfZtj8sQa/0YIWYOQhD7ljbN153KC9CYv/+0igU9WEUtrSf0xsW
	woy6U3KhvURrlvvJiEKSgb4RvXzxd4OuE=
X-Received: by 2002:a05:600c:34c1:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-48715fd47a5mr49925115e9.2.1774446571958;
        Wed, 25 Mar 2026 06:49:31 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871661f0b5sm26549425e9.9.2026.03.25.06.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:49:31 -0700 (PDT)
Message-ID: <c63fbd18ffd7233f9fa3f14ecdb626c2c27d49c3.camel@gmail.com>
Subject: Re: [PATCH] hwmon: adm1177: fix sysfs ABI violation and current
 unit conversion
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, "Pradhan, Sanman"
	 <sanman.pradhan@hpe.com>, "linux-hwmon@vger.kernel.org"
	 <linux-hwmon@vger.kernel.org>
Cc: "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>, 
 "beniamin.bia@analog.com"
	 <beniamin.bia@analog.com>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, Sanman Pradhan <psanman@juniper.net>
Date: Wed, 25 Mar 2026 13:50:18 +0000
In-Reply-To: <f460f5cb-ff67-4644-9bb1-db772ff60b70@roeck-us.net>
References: <20260324182231.228195-1-sanman.pradhan@hpe.com>
	 <f7069532401720fda1ca6e70b72742526fc79dec.camel@gmail.com>
	 <f460f5cb-ff67-4644-9bb1-db772ff60b70@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-25 at 06:46 -0700, Guenter Roeck wrote:
> On 3/25/26 03:37, Nuno S=C3=A1 wrote:
> > On Tue, 2026-03-24 at 18:22 +0000, Pradhan, Sanman wrote:
> > > From: Sanman Pradhan <psanman@juniper.net>
> > >=20
> > > The adm1177 driver exposes the current alert threshold using
> > > hwmon_curr_max_alarm. Per the hwmon sysfs ABI, *_alarm attributes
> > > are read-only status flags; the writable threshold should use
> > > hwmon_curr_max instead.
> > >=20
> > > Additionally, the threshold is stored internally in microamps
> > > (alert_threshold_ua) but the ABI requires milliamps for currN_max.
> > > Convert appropriately on both the read and write paths, and
> > > propagate the return value of adm1177_write_alert_thr() which was
> > > previously discarded.
> > >=20
> > > Clamp write values to the range the hardware can represent rather
> > > than rejecting out-of-range input, and use DIV_ROUND_CLOSEST on the
> > > read path to minimise rounding error during the uA-to-mA conversion.
> > >=20
> > > Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controlle=
r and Digital Power
> > > Monitor
> > > driver")
> > > Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> > > ---
> >=20
> > For the AI comment, typically these applications don't go to ohms for r=
sense so, in practice, it
>=20
> Limiting rsense to a reasonable value (1 Ohm might do)might just be good =
enough.
> That is really unrelated to this change, so it should be a separate patch=
.
>=20
> > might be that we never get he overflow. But I would still play safe giv=
en it's so trivial. I
> > also
> > see you only replace hwmon_curr_max_alarm with hwmon_curr_max. It would=
 be nicer to first fix
> > ABI
> > and then support hwmon_curr_max_alarm (properly). Though might be a big=
 ask if you don't have HW
> > to
> > test it. Anyways, after AI feedback addressed:
>=20
> Ah yes, good point. The chip _does_ support actual alerts, so that would =
be desirable.
> However, that should also be a separate patch and, yes, it would be bette=
r to have an
> actual chip at hand to make sure that it works as intended.
>=20
> I'll apply this patch as-is.
>=20

There is a v2 already which I also missed at first. And the AI comment I me=
ntion refers to that
patch. I replied in there but FWIW, I do agree with all of the above.

- Nuno S=C3=A1

>=20
> >=20
> > Acked-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> >=20
> > > =C2=A0=C2=A0drivers/hwmon/adm1177.c | 16 +++++++++-------
> > > =C2=A0=C2=A01 file changed, 9 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
> > > index 8b2c965480e3f..8742b8b5314b6 100644
> > > --- a/drivers/hwmon/adm1177.c
> > > +++ b/drivers/hwmon/adm1177.c
> > > @@ -10,6 +10,7 @@
> > > =C2=A0=C2=A0#include <linux/hwmon.h>
> > > =C2=A0=C2=A0#include <linux/i2c.h>
> > > =C2=A0=C2=A0#include <linux/init.h>
> > > +#include <linux/minmax.h>
> > > =C2=A0=C2=A0#include <linux/module.h>
> > > =C2=A0=C2=A0#include <linux/regulator/consumer.h>
> > > =C2=A0=20
> > > @@ -91,8 +92,8 @@ static int adm1177_read(struct device *dev, enum hw=
mon_sensor_types type,
> > > =C2=A0=C2=A0			*val =3D div_u64((105840000ull * dummy),
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 * st->r_sen=
se_uohm);
> > > =C2=A0=C2=A0			return 0;
> > > -		case hwmon_curr_max_alarm:
> > > -			*val =3D st->alert_threshold_ua;
> > > +		case hwmon_curr_max:
> > > +			*val =3D DIV_ROUND_CLOSEST(st->alert_threshold_ua, 1000);
> > > =C2=A0=C2=A0			return 0;
> > > =C2=A0=C2=A0		default:
> > > =C2=A0=C2=A0			return -EOPNOTSUPP;
> > > @@ -126,9 +127,10 @@ static int adm1177_write(struct device *dev, enu=
m hwmon_sensor_types
> > > type,
> > > =C2=A0=C2=A0	switch (type) {
> > > =C2=A0=C2=A0	case hwmon_curr:
> > > =C2=A0=C2=A0		switch (attr) {
> > > -		case hwmon_curr_max_alarm:
> > > -			adm1177_write_alert_thr(st, val);
> > > -			return 0;
> > > +		case hwmon_curr_max:
> > > +			val =3D clamp_val(val, 0,
> > > +					div_u64(105840000ULL, st->r_sense_uohm));
> > > +			return adm1177_write_alert_thr(st, val * 1000);
> > > =C2=A0=C2=A0		default:
> > > =C2=A0=C2=A0			return -EOPNOTSUPP;
> > > =C2=A0=C2=A0		}
> > > @@ -156,7 +158,7 @@ static umode_t adm1177_is_visible(const void *dat=
a,
> > > =C2=A0=C2=A0			if (st->r_sense_uohm)
> > > =C2=A0=C2=A0				return 0444;
> > > =C2=A0=C2=A0			return 0;
> > > -		case hwmon_curr_max_alarm:
> > > +		case hwmon_curr_max:
> > > =C2=A0=C2=A0			if (st->r_sense_uohm)
> > > =C2=A0=C2=A0				return 0644;
> > > =C2=A0=C2=A0			return 0;
> > > @@ -170,7 +172,7 @@ static umode_t adm1177_is_visible(const void *dat=
a,
> > > =C2=A0=20
> > > =C2=A0=C2=A0static const struct hwmon_channel_info * const adm1177_in=
fo[] =3D {
> > > =C2=A0=C2=A0	HWMON_CHANNEL_INFO(curr,
> > > -			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_MAX_ALARM),
> > > +			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_MAX),
> > > =C2=A0=C2=A0	HWMON_CHANNEL_INFO(in,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0 HWMON_I_INPUT),
> > > =C2=A0=C2=A0	NULL
