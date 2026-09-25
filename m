Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E237B3F2
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 06:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317907; cv=pass; b=BA09sozdi/INiFVJHhU9oU+kaAbJxMdC8S14MLVsxpWWQfSgtMJNtrWbXJlkMMxaxFkq/W1zhrRaB0ixHsv6C1u4GTQeCsAhaywDhUIj33lbWadiXZPdN+ipXwN9vKf+A0Hj9ILleB+jt2hErgvj5iWELkVv3tcbSS5Xe584ZwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317907; c=relaxed/simple;
	bh=hFhKrEvSZBpW410acqJJcTqqpIltVfjmIiS3oeslrDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FP8AxTgT60u5faxOiW4XQVWfYJmio/OLBsqRr8mPun9a9vNWsKElwq1Af8ti6s/FGseGg2fvvO5ozGIsh4na9YwKliwN7zGHrHNh5akiO85uFW0liD5szx7vuQ4umkho2zIjSNU3NkaFwPE95pI7HURUJWvHtx2wzQYsYmflID0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3UorOf1; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3UorOf1"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e62211987so591761eec.2
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 23:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790317899; cv=none;
        d=google.com; s=arc-20260327;
        b=XhceXkvJPk9KGI7ac/vk28xOFUsAuUIkn01p6h0DjaLC6J6JyN1DlR8TKPdkkLxLzi
         Ub1EV84zjNjPJehhTXCA+Rtw2i1vxglrzxBF1zOc8Ipt3KNdhSlcNnzFvHxgS5Dmb180
         uCZAgUq3vOb06Eq1xX4epu2X+2wbsVJIgFv5QBSgQalWS8neh6Klf8YoRvDo0ps4ahQS
         73pnKkglOyeKWJvYficsStv20PM/ygbv7/tKrGywadwijl9aI604942V3YTo/KcCbymP
         Xt3TboOnEd2XnIIkLIUWM6XhOeRzbSbml3G1S1a6f9iDvp7EEYOJtQnyodUPodGct0nm
         9j0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        fh=qYetX5wLV7pV72kgRll1rkWfqqGzWY6CoEliCrKRR/w=;
        b=c5hUI2VAj+OoqbdRO4PXIYmuUaKj+ecco6iR9Aqz0EipncSCaqDvscLj683uI+4C8a
         i8KviI00aoaQ2wYvw5ecQWEwSCvk4MEYbp+ZRWn+eawWw1074TPxa2CJ3gxumyUZVHKV
         HSU3BwG2i4eY59oM5XUpYfVCRKt67vf7Q7V2QrGVFiErDRm9etPgjWIfnVHJ3XsTFlhC
         P1dBIJRIx5P8H8W7VUW9j9XeGg2zGEdBzbTZOiyp9Tc2HN310+BapY9rDDMlyrSNq1Zw
         iq/M0qAZxrRFsy/3JlBgWfXa54htADVEil44LXgasv9Jon81hdASEL/qbqj+ecWetIZr
         Z1ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790317899; x=1790922699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        b=O3UorOf1qV5JIsqsIqmitfKsyx84ASkf1290p06d2IASL8ooh/gp9ytTZRi7eBojlB
         hUdMfuRfNMsuSlTMU4ekxduvpje/WFQ6uXygRVEz6nF5dp1S+B5sQSfHeSQIMbMJ797R
         +V3C+PGyufpBLMdmhuTO1NPm38ukbFqyog57snL/J2q7+v2Ye7UyFdfJPPnaSE0ENePa
         8VydY8L/xNvtQ2GUZwieMlqtNgLy5N737t/xV8IvaBJ9AtVTDHAa9dBVL7iSX1cRemJZ
         Em46WIeCMNi5L7ft9vaYvzkzp1/1eWWdYJ264lPkb/RsZdZL3DrEzD1HeL9rbmnLshJc
         HSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317899; x=1790922699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        b=NuuXE4WQrKkiGId/9UtkY3nKR+ew7qxnIyYWC5jCxvgmssL97pSQsZv9ZY/HaJppom
         4a6mkfHPxvwflT8QTWPATtE3AiHSv5seDmUReUWANvQqSTnBJDSbu8NhA3iZqUZgX+JX
         MTIMQDnz2gN55goPJ3nhajJ3Rpv2NZVW2ZEF+vJ4Pr4uwyi4NOhlwSqYt8jsvQN81YDV
         91K2CgxrVVvywLq9zLdl69r4I1oWSqWBXP/qloNOVT7StBNH6FNnPNM8SDedM3OMLwdA
         jKFDf7+ubh7uAwHGvH6gPnSxV3iGlrmd97DMXKRfJ+SbMW+/e1sLWcO38RmX8IYApBK1
         MVdw==
X-Gm-Message-State: AFuF++mAgqjx1AilmLVO+f63TpmGH1SKBHDq+6qW4wAgeb43VuejruyV
	DoVSXsqiwXxpJA0A/Z4LmhhEbjeTB1KGAi5MPhPhCyYcP5AobmtfF8IdIRyMrZySxCNnNIcr1W+
	aoq1zcrfi+WSutaYjZGnNJV468UDE1Ds=
X-Gm-Gg: AYBFou0tf7REYELM9LauMBrw314zfFp8J9UAscMyrIHCqveVgKmTf2x+z9CJNZ9dmpl
	tC82kUZGoRZio/bxjLjW3gASUCAC41JCUWaevjDMKpsxEP8Y+n6I2XBtHflY9MsfTvkQmitYZus
	5myWwKFNrBvXuR19ie5RAi8iHI78qpc/GrU168x8eMZ+FEO195p6n+OWXXnYEKPPzLXdZu8fTo3
	Nzc40xFBmmTmuHmigzvusIRC4yfifCO8RIfvoQTBtEy+iXLT2PwTP8nnTumhc2DMAWYdJfwlgaz
	WedHDSK91sxq05mcmidKjEdaM7EfUJDJssWfGraSkbCSYWt+2+ZFAXeO
X-Received: by 2002:a05:7300:169b:b0:340:dca6:f34e with SMTP id
 5a478bee46e88-340dca6f75fmr2420984eec.40.1790317899352; Thu, 24 Sep 2026
 23:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
In-Reply-To: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Fri, 25 Sep 2026 12:01:28 +0530
X-Gm-Features: AclHuK-KyM2-sTWnkjehqT7295KW9AXgH1dDi83R9qL68ibmWBqVLHdfx79TEc0
Message-ID: <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital Multi-phase
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

I hope you are doing well.
When you have a moment, could you please look into the patch to add
support for the XDPE1A2G7C voltage regulator?
I would highly appreciate your review, feedback, or any guidance on
next steps when your schedule allows.
Thank you very much for your time and continued support.

Best Regards,
Ashish Yadav


On Mon, Sep 21, 2026 at 12:27=E2=80=AFPM ASHISH YADAV <ashishyadav78@gmail.=
com> wrote:
>
> From: Ashish Yadav <ashish.yadav@infineon.com>
>
> Hi,
>
> These patches extend the existing driver xdpe1a2g7b with support
> of xdpe1a2g7c model.
>
> With Best Regards,
>  Ashish Yadav
>
> Ashish Yadav (2):
>   dt-bindings: trivial-devices: Add support for XDPE1A2G7C
>   hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c controller
>
>  Documentation/devicetree/bindings/trivial-devices.yaml |  1 +
>  drivers/hwmon/pmbus/Kconfig                            |  4 ++--
>  drivers/hwmon/pmbus/xdpe1a2g7b.c                       | 10 ++++++----
>  3 files changed, 9 insertions(+), 6 deletions(-)
>
> --
> 2.39.5
>
