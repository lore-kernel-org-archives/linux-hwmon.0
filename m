Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E11A2392
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Jan 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767523425; cv=none; b=Zbg8r2V9wufbxmOULKdi/+/x8PnICuf68CCfVrVNQLPexqpZ2AFPnXzXUbUnGxKxL6wim/6Sgw3lifvXm18mzFilIrU+5/HBhQ8lmLKqkH5k2hNflrE121UUYW4a4poTRica+EAbAkpnyeE46wQ9j4LYXcPOT+2tNDNcOM+YL/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767523425; c=relaxed/simple;
	bh=1UA+RzAgyQNneV2pnS9404+cwsXR29aAIGZBmDbQw+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwI9k9Vtf26vxX13m40mAP8jCaBICMFMLwz6EMxn5tME9EvPQecjT/Eoz1Fy93WtWULMFNvL1p4Kz0Yu0xyQaOaE5ipFRx9ORwotwkL2ERSskjVHFJEIAjZWcpehGdGStxi4BYaIqu7PpLXcs3ZXZVMDX6hvf/iMhUiqZ8SKXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdYAH9Is; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdYAH9Is"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc0d7255434so7823516a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Jan 2026 02:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767523423; x=1768128223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cIcru5c73ZTEYjCIBQFzBj8coUaPhFQ3F4S/B4jQZY=;
        b=hdYAH9IsUXdPeaOiGPYSPwyk/DEe7iHZs+zi3Hvq/55GCmp+z2uuZpa4UgmBLBi1H9
         Xl0oTbDVpLNBu3DIu3c5KLl7AWR2PADxF1ADjUYlADN7raNjwjU5DaeXOzaEtEM/OCGH
         qsrkkOMZciBkND1kulwILeNE3RUIbYAyKCePqGGoAtDUlGI4ZV9w0JZWWozQKGHFKkMK
         HkIk2Xooezi6ZwTM+edmy7m5hYcRL7zDXsNGtxZX1zWNclXKwNkCe4E+lKEqDq1YeQBI
         1XJT7eq8VGmpu45T27k7E1vfNaizbbY40iDG+1IGI/kwDq0T11FdTFGBXkyeWQH7y9rL
         MY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767523423; x=1768128223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0cIcru5c73ZTEYjCIBQFzBj8coUaPhFQ3F4S/B4jQZY=;
        b=lqfVyKaMo+IO8pS/mkMhtPmoexnmtKyeKzhTz7nMRxDQuQJsEz8eIOm5cbO/WfFr2d
         8PlEFgsVLQ/JswE2ywcSJrn6u3Z9LFqb3iBoYuTHqqTssVkLssN+Rh5vU345cTWqtV44
         7/Ch9xs8FQyNx4ubnAZkwZU/XyppXcLSrplCcYL/C0UsS0ZIlKO78DSconeVTRGpDeup
         WFBqzUikn9gHl+hwHcfUjeuFCeFBJla2RImRoYlllmu5re/vM1NgdBpOogE7+jfZJ5/b
         V4s1d433wyuVfpJprIRsdxGx+k3OUzhue6oa3zTQNFwEC7u23ti0E8xH626YC5E6qayy
         Nx9w==
X-Gm-Message-State: AOJu0YyMCMhqcfsuHvilqroEwkFIiA4iNbU64f3Wlz9c48leIVJ76c5H
	5Q6Fny/Tx/eBangWZiVjwbyX1Hxg9NToaIOf3WpDfBxQiALh8ZklAgCepyydPlpEid3Kg2SxHen
	QdYCE+kCIHjryZGGnuS5FDaZzRXg+OOk=
X-Gm-Gg: AY/fxX595MeUAK/AiBqmK5ZQfQRlat2x/KSDl7TEY1LptiGyVdyJc0y4IdPewGS5bgs
	3hj6KYzjMY5k/oq8Sqz3B0UbsiG8vBGzm8KPfQuL/vBzdFgIZKVXOdD2JFbXz9iVO+Wr1AVEw2L
	2CQPWkmx1QKfPdT8fRfVlWPiifcA+R+y7Ym6nnFCSYEyxeIn0UmsFGx7SFEuYMh8Na4U/3DBrhd
	IHiZx0v2j9TJJL7ajxpjSnr0MwHFowNevGCdWf9Q+qAG+VC6AO1wYb3dMmNcLs9k7YcnwdbOjP/
	bdhlGbx5DzAVlPigo+b5oubqNY3a
X-Google-Smtp-Source: AGHT+IFnBSS50Fb15sAmtkVhsZB1YVVz2LAEb5fuLplMKOPz2C/YwRRurIA1EnpV6vhrPNMFCxQE8zDV8mt/SczzwNE=
X-Received: by 2002:a05:7300:a21e:b0:2ae:5ddf:e223 with SMTP id
 5a478bee46e88-2b05ec04ae0mr34177412eec.15.1767523423277; Sun, 04 Jan 2026
 02:43:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231105503.77881-1-Ashish.Yadav@infineon.com> <2ee75453-0869-4348-ad92-f7ff71aca75d@kernel.org>
In-Reply-To: <2ee75453-0869-4348-ad92-f7ff71aca75d@kernel.org>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Sun, 4 Jan 2026 16:13:31 +0530
X-Gm-Features: AQt7F2rY4cDdSmOvghYHYgFKjNCefk66iMCSi3c-4GIZ6BmnGPbzJoa_eWkiHwU
Message-ID: <CAJKbuCYisQ2CxcXsoT7bPuuJTc=662tgoKcQi-AQu1pWHTj+Qg@mail.gmail.com>
Subject: Re: [PATCH] hwmon:(pmbus/tda38740a) Add driver for Infineon
 TDA38740A/TDA38725A Voltage Regulator
To: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof and Guenter,

Thanks for your time for providing your valuable feedback.
It helps me a lot.

Please ignore this patch.
I will release two new separate patches for DeviceTree and Driver Code.

Thanks & Regards
  Ashish Yadav

On Sat, Jan 3, 2026 at 6:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 31/12/2025 11:55, ASHISH YADAV wrote:
> > Add the pmbus driver for the Infineon TDA38740A/TDA38725A
> >        voltage regulator.
> >
> > Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> > ---
> >  .../hwmon/pmbus/infineon,tda38740a.yaml       |  73 ++++++
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
>
> >  drivers/hwmon/pmbus/Kconfig                   |  16 ++
> >  drivers/hwmon/pmbus/Makefile                  |   1 +
> >  drivers/hwmon/pmbus/tda38740a.c               | 223 ++++++++++++++++++
> >  4 files changed, 313 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,tda38740a.yaml
> >  create mode 100644 drivers/hwmon/pmbus/tda38740a.c
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda387=
40a.yaml
> > new file mode 100644
> > index 000000000000..07c8eb94807e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.=
yaml
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
>
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740a.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740A and TDA38725A Synchronous Buck Regulator wit=
h I2C
> > +
> > +maintainers:
> > +  - ASHISH YADAV <Ashish.Yadav@infineon.com>
> > +
> > +description: |
> > +  The Infineon TDA38740A/TDA38725A is a 40A/25A Single-voltage Synchro=
nous Buck Regulator with
> > +  I2C designed for Industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/assets/row/public/documents/24/49/infineon-=
tda38740a-tda38725a-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38725a
> > +      - infineon,tda38740a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vout_multiplier:
>
> Please read DTS coding style carefully.
>
> Also, missing vendor prefix.
>
> > +    description: |
> > +      If voltage multiplier present at vout, the voltage at voltage se=
nsor pin
> > +      will be scaled. The properties will convert the raw reading to a=
 more
> > +      meaningful number if voltage multiplier present. It has two numb=
ers,
> > +      numerator ie vout_multiplier[0] and denominator ie vout_multipli=
er[1].
> > +      Therefore, the adjusted vout is equal to
> > +      Vout =3D (Vout * vout_multiplier[0]) / vout_multiplier[1].
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +
> > +  regulators:
>
> No need for this node at all.
>
> > +    type: object
> > +    description:
> > +      list of regulators provided by this controller.
> > +
> > +    properties:
> > +      vout:
>
> Neither this. Just fold the child into the parent.
>
> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        type: object
> > +
> > +        unevaluatedProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        tda38740a@40 {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
>
> > +            compatible =3D "infineon,tda38740a";
> > +            reg =3D <0x40>;
> > +            vout_multiplier =3D <75 70>;
> > +        };
> > +    };
>
> ....
>
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, tda38740a_id);
> > +
> > +static const struct of_device_id __maybe_unused tda38740a_of_match[] =
=3D {
> > +     {.compatible =3D "infineon,tda38725a", .data =3D (void *)tda38725=
a },
> > +     {.compatible =3D "infineon,tda38740a", .data =3D (void *)tda38740=
a },
> > +     { }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, tda38740a_of_match);
> > +
> > +/**
> > + *  This is the driver that will be inserted
>
> Drop, completely useless comment.
>
> > + */
> > +static struct i2c_driver tda38740a_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "tda38740a",
> > +             .of_match_table =3D of_match_ptr(tda38740a_of_match),
> > +     },
> > +     .probe =3D tda38740a_probe,
> > +     .id_table =3D tda38740a_id,
> > +};
> > +
> > +module_i2c_driver(tda38740a_driver);
> > +
> > +MODULE_AUTHOR("Ashish Yadav <Ashish.Yadav@infineon.com>");
> > +MODULE_DESCRIPTION("PMBus driver for Infineon IPOL");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
>
>
> Best regards,
> Krzysztof
