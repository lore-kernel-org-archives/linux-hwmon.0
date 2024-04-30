Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F27C12C47A
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714475472; cv=none; b=Ykkos8wpVgKgKpn0zmV/lxoRD9gk1GhHnOooRQ2Hc0ra11mNkrjc4sfX2wXbpUbdNr1zPkwJCgIkEKro/986TYe9So4WhhIRQaoJ5wwzjk/B0dUM/p+su5iwODziefZoJ+jmkjCquAmpYClc11n4nDuDsLC6B2feewIIiQ55i2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714475472; c=relaxed/simple;
	bh=Pb7S4zC86I12ZWbtdCd3G1XPuIrMOQCglvOVP54YDqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7Z43DWdyyuCj260+sbmb5qY3uVhRsWiT9MMOf8mOo1fUnae724kj/5BYcSWhfAX5GAk8tZqhFlyub3AISaHO1KbSpqRDc+BYb8XYX9Ds20zcQdB4ZSgnghgwk2IFbthyKaJnsnYEfBmjrf634viiGDALZRqTPToVGZDJipw6BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDUuTqcl; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDUuTqcl"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2dd6a7ae2dcso88312241fa.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714475469; x=1715080269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb7S4zC86I12ZWbtdCd3G1XPuIrMOQCglvOVP54YDqM=;
        b=CDUuTqcl5P5CyXOo4JyYumKE8NH0g2gsv902PVzO+KapI5Y+cBm4817K8EQAx2tGHT
         wfP7Tcgtmz2DPHHY/J+0jke5i60ouccYoAmXqtXrw05cOBU/uIeVvoA9TVA5QBQIqET1
         zGHYS6gEf7eBbufkCfGbnodlnccy3nJ5ZV7Klhh29PDSH2LVzj93zBflrSNsOD3P419g
         IVWt7uH8QhsewwM+noloYaHnvSvk/Q8ISJhqNpa/C2k740maQ+dNhb6i9yT3W6VTeD2P
         GCICIPB+wEY2G1PH15NYTeIC14iXkP16cz9cM1FAcQhjXcKOlLumvK59k6jTj41tUKm6
         lANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714475469; x=1715080269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb7S4zC86I12ZWbtdCd3G1XPuIrMOQCglvOVP54YDqM=;
        b=RfaVKpr8qO8buklQXHBhyprXW8qI4ZI0zZC+FUxboEQ4Y92UmTafH8eil0iR48vkuS
         H3lxrc5hkCIF0Uel6wJwTseZL3ZmlFbNVk4sHhyTD/tOtLwWk2Nn9vERKTtbkY+bf+zd
         ToTMfxgcgqSCM3rNNmetmgAU4TFw1ql4P7Mn5xZwj/bm0rnh+4Rqv+rLR5k6Iny0/LmY
         94IJTPafZd8I9HJZ5ZQ8X9hRSP3libOpxbXCYxI2M22Ad/N7zXSIsUZTism4S8QSOD3J
         KfldtfTsb6FIgsC2CW9g86EXMhvUI89tRAAxMyxQiNiwlPobLmUoIvhhCaDpbXM9j2Qe
         9Wpw==
X-Forwarded-Encrypted: i=1; AJvYcCW0f8HbxxDUOJw/GpCPPa9pCEii6GXSj4ou9w8AsOcjPI2fK+9YCqq8u2Yi1it5rvgRwvNV5fwj3BIMGZb69kkMLw9pmEyH/FDiVI8=
X-Gm-Message-State: AOJu0Yycqju99ejVA5oWUDF2VF9/yf8S9zgmOUXaHJssZfHoQcvbOp90
	1q25o4WgWAdfwvV43fX3COmDkaUxn6jQFhLIHKXD1Ryz3WdftH3yETV/OrsuRkqqv3MVV7GpoNy
	Yaj9pYimUR9WwayECGnkTzs+KcQ9ZvA==
X-Google-Smtp-Source: AGHT+IGNNsTxmgHkLcCrleYVDXXnzxAdR68MVBA71GpvCHUNv9oZG7J6zSBSPzzGWTmIaZjxBsbJwbl2mXpjXDum1AY=
X-Received: by 2002:a2e:b162:0:b0:2e0:69b4:d65c with SMTP id
 a2-20020a2eb162000000b002e069b4d65cmr5377890ljm.7.1714475469160; Tue, 30 Apr
 2024 04:11:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426140937.609172-1-lars.petter.mostad@appear.net> <6ea4da26-e20c-45f5-a0b4-85773ae178fa@roeck-us.net>
In-Reply-To: <6ea4da26-e20c-45f5-a0b4-85773ae178fa@roeck-us.net>
From: Lars Petter Mostad <larspm@gmail.com>
Date: Tue, 30 Apr 2024 13:10:57 +0200
Message-ID: <CAC-Dm27uxQR1k0bbpCDNQLiWum8d4B-3xgFqRgSOHYnUhuovxw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (emc1403) Add support for EMC1438.
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
	Lars Petter Mostad <lars.petter.mostad@appear.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 28, 2024 at 8:15=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> > -enum emc1403_chip { emc1402, emc1403, emc1404 };
> > +enum emc1403_chip { emc1402, emc1403, emc1404, emc1408 };
>
> There is no EMC1408, and if there was it might not be compatible with
> EMC1438.

Yes, using the name of a chip that does not (yet) exist is not good. I was =
going
on the apparent pattern that the name emc140n was used for things common
for all emc14xn chips.

> The 8-channel chips (emc1428 and emc1438) suppport signed data
> and limit registers. This will need to be handled.

I see that my glance at the EMC14xx datasheets was way too brief. EMC1438 l=
ooked
like a straight extension of the currently supported chips to 8 channels.
I totally missed the sign bit.

I guess sign_extend32 can be used to handle two's complement for signed chi=
ps.
This I guess would mean putting some extra info into thermal_data to let th=
e
show/store functions know whether they are handling a signed chip or not. T=
his
might make the driver unnecessarily messy, as apparently nobody else has be=
en
interested in support for the chips with signed data. If so I withdraw this
patch.

Should this driver be kept unsigned only?

Regards,
Lars Petter
