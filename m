Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0893254BB
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 18:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771986; cv=pass; b=Whhc1id2O9lG1lIFiNQZtbYiBOdEvhO8TBfcTeVFB9HLzD7iPr047Epw/vt8aheLtjS0cmv+grBAwvYcWu/YsRiwzACIZ7H4jBohpFdORhQ3g6Cp/omiw1m/D4hhWIAdikG1yVQv6xw0vrPup3nT40HPcWHJ4Ict7+lFlCAGSF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771986; c=relaxed/simple;
	bh=uJ8SKncTVpS3Tl7xSmBTPvmJd/DmUmBR+sRT2wqL8mE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwWwnPy35Dckd3t59mlIA5NAb3FWqjIv+jGmD/nSjjf8sk/ch6qheS39u/NPZ4L9uhj3aolCdb6uMf8qttz7SAa6TuDpbFz0s/uOeCDO8tCLuVo/FbaTChf5ZJbsqGka5n1F6zvxn1C5kFovXOPuHRfNxV8NFpXsJpLGXeNuHUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=08tgcsxB; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="08tgcsxB"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso8856373a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 11:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773771982; cv=none;
        d=google.com; s=arc-20240605;
        b=PUz2HntqN51a/jg/MiOeUCNT3EtRpsl2WZGbf1wyJn4IODAqF2VgCEzByObWQgS6Tt
         KgytUPNbxL8OP1TrCDTg7esMf9EWf8WxnXS4R8yT4O87WrScDWLwnvPc3RAJMGdXmoAE
         VfRi8iwPC6YWF7CJ0YUF6jCO/N9b71/5PXKZm4Cs7seB8WqNDA/jIfPFX1Dio4NQZdp5
         z0qkTodJIy4juIShUnpDK5hnHybSDO1yNu0LB9lf1NYCC0O+pRkBYS/sg8NQ5SAFhmzT
         LUZ72ZzJNsEu70xZuM6YlPJ/lCleGsndjd2K74VEGCXe5qZ2x7hBqZvwgaVnKJiyV3iB
         WC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GR869RoNS13LgEOS3n88g+nd04mb0AZjtf/yAKe2QY8=;
        fh=1ZfBm0uXBrvm3PlBWsiujN3NBjPEalTASCmsC1OgQ48=;
        b=L51SAx4sLSQWYiHyyFmgQaJFHr9cQnDmP57z45J3IGGK9Os7++ECOo135AJ/iZvbrv
         EnZ6LnmRc4lxXalFsuwnKy7Gt0vozMxIfL02TYwxp9KBwr6PRRWP5d46eHnZmsfqHcUQ
         kOIkzraoDJP+hHsD9uNs83A1o5p9pr3yeydBoeNqa6Mz6+6F2EvMruvea4Lfw5zmwl4P
         bbF221+WkRv1df08kYT+wvXzWX5j6WkQovy0n0wONeGHlx0rnNhF/ndqac9LIVIJeJz7
         ekpyBvZ/66y5KPPZY2SD+FLytRy/mFHRpFVDZDDNxfInTIrfSbE+HF4uWQyi7Oc5JP3Y
         P3wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773771982; x=1774376782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR869RoNS13LgEOS3n88g+nd04mb0AZjtf/yAKe2QY8=;
        b=08tgcsxBj/WktNNqL3QHrzHq6bFmPl0cunV3szSv3bU04mcfed0KcxFPfWpI5JS9vN
         d8/HKzCSzEpULfwOvmWR9/IrdeX1WW8kGIpTfh3wG/eWyu9R1FjWywkaoLpTmGk2/pE8
         Tw7FhjSndY75NnbgpmmqLT/lIK7cdiSIA0logXTYV4CRNfgwfdgfsedplB8CeT0qYkAL
         gv2QGh+3jmNbFmKqiOsM2lpL9fMJeBFx4Hb5U3vyBfO5zoh12UBoWv8DSpzBFUi17lvK
         nvmha09i2/eRrAcbes9imbHPqXwR9NA6l38dlqxSGXXZT4ciqul56ALrXKCPvHjQiyk5
         96hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773771982; x=1774376782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GR869RoNS13LgEOS3n88g+nd04mb0AZjtf/yAKe2QY8=;
        b=ANK+LoJOatNLctTaB9gGzn9expXsxSed60IvXcobXQKwI4TSZ3QIok9CbyYxmVO7EX
         iZq8jouezU5vQz62yvczOVLnEfaJhkZLd+2ZrMB3UvcWTZwVLrwuBQScMcgVyRKgZtY2
         Gj5BirLDX03TKtpIa5Sm6zHHL9KrD2ektHucCg75PEjU1Z3qgVAfyC8IR7/5v1Jy0vXq
         +TgIUYCps44/ma9Dt/Cf1ee0QaOwcESrUf/SfM3A/O/S7wXG7wHeg9oRp96Qh2VnTJx6
         lk2UsaBW+EABUceETF9Ib/D8//CshlHITrDOFo+M6j7y2SxQpqICatSfGWyBQvmUs2Th
         Tu5w==
X-Gm-Message-State: AOJu0YxTArlZvbHzhOmSb3gn+6BOuD2vaAq1Om2GMOnpCCIIlu5ZgAM1
	5DrjUzn2rI+Tg3jNRzeQb0PWVTaVuLQJneOt8CBM2IbtM2B5L7nNH6yItfvScJmcUeNflVg8q5h
	4R3lvUYhFaSLO2gPyn1PFOigQYcjG7U8qz8w05qfPWX1u52sh2VWUvbE=
X-Gm-Gg: ATEYQzz6XwDe0uFepW0rzyyjCmvOPSFog4Z8emRUEGBSWdBcULbgjSxcTF019fGn/DR
	0VJ2XCXAZDH3Pys6ZAfkmuJo0i1JSNoG248N9Y/Ouqms/39ErXwowpjDkY9riatC5oAbqL/JKkh
	dikothf38ZNIL0nLaepIUma4lMrsjxvrVq/6L1yUJrCLzXn9Q7GHX5pnMTZX+oiG7N+7xlUXeyI
	d+AvNzHtQwYftYuHP+X4g3XpNG6Aqdn6BQc5BULhhNaAaQylei0d395uKT0o9WwuBUpeOlvHKDd
	sYXQh1w=
X-Received: by 2002:a17:907:9622:b0:b97:b3bc:f6ba with SMTP id
 a640c23a62f3a-b97f4ab1584mr15626366b.39.1773771981874; Tue, 17 Mar 2026
 11:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-ina4230-v3-0-06ab3a77c570@flipper.net> <20260310-ina4230-v3-2-06ab3a77c570@flipper.net>
In-Reply-To: <20260310-ina4230-v3-2-06ab3a77c570@flipper.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:26:10 +0400
X-Gm-Features: AaiRm50SxHUa1Q-LFc3UN_pckObV1Gd_taVdOY_hKO4zUofz-f-MzaimZJIB4IM
Message-ID: <CAKTNdwEvy8jTO-106RvVi9zW-vR9hTkfgSmK0MTH6-g39EQpow@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: Add support for TI INA4230 power monitor
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 3:43=E2=80=AFPM Alexey Charkov <alchark@flipper.net=
> wrote:
>
> Add a driver for the TI INA4230, a 4-channel power monitor with I2C
> interface.
>
> The driver supports voltage, current, power and energy measurements, but
> skips the alert functionality in this initial implementation.
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  MAINTAINERS             |    1 +
>  drivers/hwmon/Kconfig   |   11 +
>  drivers/hwmon/Makefile  |    1 +
>  drivers/hwmon/ina4230.c | 1066 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 1079 insertions(+)

Hi Guenter,

Would you mind giving this one another look? I've addressed your
feedback from v2, and no other feedback arrived in the meantime.

Thanks a lot,
Alexey
