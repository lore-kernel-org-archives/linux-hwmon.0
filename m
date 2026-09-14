Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7324429CF5
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377780; cv=pass; b=b925BzzFEF1V3K0yp2SCs756A6M0dEi1FN70xcVq28RpV8KD9mA6WHYV+bQAuIVACSZhZFdyjUOns6X6QJreqYaGQDB8xjrTG/biCtaOtycZ8vAnjxiDO2hQwmiJ93WtpxXA0bSpxXWN6f/PHJnBPdGMIr824vhn/GxgMHtClGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377780; c=relaxed/simple;
	bh=OQIDM3IadPguqK9CTcDIpxeqUSPP28I07Cp1akqRRk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e19Z2tHLM2zCX1G8yqnl0D/NBTg4bdan92iFB2qrSbNx6/1ROedF6Mu++socVfcXVTA12imdMqJqqlI91pB4/9SsqIzOszRhqquOv6Z6w8GLpjRY7BrtYWgi07gHV8lks+L57F/o4scGMs6hu7a4aJ2ihPpQVePnKkKfiaUDLo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN9yXWj2; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN9yXWj2"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5168ceso699002e0c.3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 02:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377776; cv=none;
        d=google.com; s=arc-20260327;
        b=aDBdv5IRL6GhNWjTEF1F9SdZG3ydE0tJHUPophhp8X7d4RKX+QUT+q69HqmAU95jdE
         EYu1MyVhvRSjL9hDA5IGaw2t0Q0gPNajyN/gLvz8QOfWndUOUyNGsyCxl89CZJwhRiUW
         jX7EtP7RWS07guV3YB6HxCPT5A8n+XFO1a8L02CR0WKewcAP2lDZ2VWd6QJJvA5geYbg
         Q9ZQUcculBD1y8LzNVIsC++wNpeYlh4MNsDNAMtSSqSdUu7SI0jh4kJ7nuumY0hVUeCA
         TgqidATtuYvz4hJYxQVHhzlLHnG4g5J8dTi4bMZ8NupzZXjtq1io19sLZJFNEMUcRp8N
         pQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        fh=99Q329VNhZ8nD+1dHNjHC792Nf3OfYFqt+hUoY/3XRU=;
        b=EdURQfD9dfenj0Mzs5WbLPFVtY4kSCVBnEDyrneCQaI/mUe3hSJZaWd509e/aKq6WC
         C6AcCakqDEj9LnC+2uxOMbFj59/TUaOPJU2dk+egOgSfg9LrUm/3s0BJjInUA89j+rg3
         nZUUX8HLWg40pJvgmgBch8MxtO5UcAKdzzQu2ckiOHIm5+7knYSjVFqR0w4M+D/CHrGx
         l+wDuik6Ch0gcB3LzBFZJdJIUGftsV7ZlqaUp0SVEleJq2QMCOuK+jRRybXZtLpOw4xy
         HsZlAI5csx3ZvKSL0sA68J2UZorYYmi7ZQv4J1Nb1b+3lAFRYgnE9I9tVzE42K7wszyh
         rUQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377776; x=1789982576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        b=gN9yXWj2NwLeAygJFikNXoAQYCoJ++oqeZ0Y5hC7wNvahvx3+BU6UIP8KB2Wd9G+ha
         z+ppUR8y4ILjC4GZ+mhAqrXxcFu677LT5zmmzXqdmjjJ5v7PQCTFqPBGgjQUVfBOtHao
         JqKeeHpxuHbQsGO3UmboepPwIDyzYXHN//94WiD+d9zzbwxgPrCmTyVXEFgF12CzZCrZ
         eDsDH2CSNepnrpT0GZauLSwYMjN+wTiQo6bt0x9peP01nvXAUEGQE7Wg7ktK841UTmPr
         3XKTHe8qOpa9lnfhV6DjIS1DQ45n9nRqZzHutlRG1bJZjgnR/+AXmcXORoxq2/kxsiXp
         iNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377776; x=1789982576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        b=Sg6XLi8nVn8tCFmz5yS89Wl/HXZH3SorBRu7FkD+/n67sDuBU92e6ySJ6uIt6SJdMk
         FfHgovyN4+EJZyuLFySNcGKvq1dVt7M7pV/lj6+y/DiE+UIe/SWJPtumbEOzkfk8MgLh
         j4n2rJwbNSYg5t+A+TBti2FzH5gKXAfSwoFM6GX2kATo72Ee0nB1Nq+posQYW3Euuleb
         9ABbP8fBKVt1k/Qx7INR0zHpxjgdsmHaZLHftqr4seEOzFmLjKvAv0KYM9RfES2oMyNE
         MMqWkwcpQ29g6T6A26LIpLbjoQWuNvpms/ZR0yYUWm0R0BN5FiZnrXOr26TA22tRvH+K
         TkdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTH5rViIjr/C+7Zb8J0b7izHg2KdACVaW8UMubpcmruUzvGl9q6JFzA9kmxkHkep/32IuKH1KPMkLzcQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n076Xt8jAH+qZSFg/yJ16yxiO+614zLk9ieewk4kOAZXxsadG5
	yskjyaD3fa0rvqWYdu+X2qbM/AmWY3GJyx5X/ljkzTKK3C0yOe63VU/clY4ff9SEY85nyg4jvql
	pYYMq0OXRZWKYsqM4hB4feuwoIaCuVFQ=
X-Gm-Gg: AYBFou2jMSSKfkWL2XO7KhgFYYUM6XNeZHLAp6fZTsxbPsB2XfoVbHg7GMKavEW8MPL
	ZnMBrrptKdDuD0kYZDowPDlxQJy7+TxXkgh9q6uyS3toBRZvXuGQySNXdfo92tOa3ccGFjNj178
	kgbUHLZ3aS39a4OngUFTCEmSJ93ISDicnFlf/M7zH6RNPlq+KpkVfByo2a4ov7zszBytXjMLrFU
	Fsly/hDU8Dan2/ZueuLQZ7lGQshSKr7oRHYLHrYXSUYz+hqyH1JH2ENpc2sh/ao057DVbKcgSHA
	aDX5GEm2u/k2gKcMh/I961u9G/b4m4npjLDcRkIMxvrPK27q1zfpEGCvhw==
X-Received: by 2002:a05:6102:3a0c:b0:790:2ae8:32c3 with SMTP id
 ada2fe7eead31-79b58093728mr573931137.6.1789377776433; Mon, 14 Sep 2026
 02:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com> <20260911-placid-clever-lizard-de1258@quoll>
In-Reply-To: <20260911-placid-clever-lizard-de1258@quoll>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 17:22:44 +0800
X-Gm-Features: AcwNN1Vq0GUYmtB80Y3cnrvTLaVxABwghCq2riX6lN5HPRWReqpu9nIst8JoDro
Message-ID: <CAPBH0A_-fUYsbweGEu8gkUEYNHp=dXxupxW0bqNkKKr2vJH--Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8811=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:49=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Sep 10, 2026 at 08:35:50PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 46 ++++++++++++++=
++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..28eeb85f13df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
>
> There is no blank line here. Do not come with own style (like your
> version 1).
>
Hi Krzysztof
  Thanks for review.
  I will remove this blank line in next rev.

Best regards,
Colin Huang

> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
> > +
> > +maintainers:
> > +  - Colin Huang <u8813345@gmail.com>
> > +
> > +description: |
> > +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchrono=
us
> > +  buck regulator with a PMBus interface designed for industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/row/public/documents/24/49/infineon-tda3874=
0-tda38725-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38725
> > +      - infineon,tda38740
>
> I don't see how you responded to Conor's feedback.
>
Thanks for remind.
I have responded Connor's feedback today.

Best regards,
Colin Huang

> Best regards,
> Krzysztof
>
