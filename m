Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2EB12FB1B;
	Thu, 24 Oct 2024 18:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729794736; cv=none; b=rOt8BHQHf/E86wnNFltyFDCX08Nk7h0qcJq8dG5wItweAADOBJvFaaTioyJGSXnAgIwgzagvnbwWv7drbWPmD4ir7k5ct+gQcJXNpniRDdpmOJ2Fi/kONdidf5a/J2D75tyO1uYWT6AKPIoqOQJ2mcEVeBCKkbRmBiuUhwWdDfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729794736; c=relaxed/simple;
	bh=x5TMrkcwVFwITI+kj6H73SBtq079kG0wMhxTYuJpNWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEHJ+0c+2J4AO1gYuyc+XzZS7fOd+ZsV/yxJa7nGMTZPDm9slx5J43t8o8Cgi9DBg96nf19f/2iIfcdYy8v4ww2c9W7nOMhDU3kWMvlC77CMaCKTvKRDITTMDsEsmid/Fk1NYwjzyTE6EbmXsJDC9uuq4eYft8El33+iScXgkdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ei+G5WtI; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ei+G5WtI"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5e98bfea0ceso619250eaf.0;
        Thu, 24 Oct 2024 11:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729794733; x=1730399533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gRKHkVHowCvUdaOL63DeqZvn2vxTeBbKPQmJOLnaQLU=;
        b=Ei+G5WtIj5wCcQS0z2hrTd5zdwHCmeYU6PYVnl7gEVch8kRXuu3rHdMTaybCKYOTEi
         ub13b9QUIAMKhY+WA9Zwqou+wbqqpoHkF2/a5/UksK6us56HMtX66jFLRqwoCaXWU29O
         YzJ1nG4uGpL4Kaa0o4w6433q2U8pbrgKJz6KV0Yh2XHd2mNFiQEG98nF9LzwTQUsfWvw
         t+DVOnvFlNtfY+tunuXKcMPodabDqnGRB5I1/4Ek3taX7pJcEFqcu1SxAEheoLxRzXFT
         sPwUR+7t1OzMtFDfAxAJa0/pzLMKlZqTN7gkMjQVmouqRJTu+ElaaHbHPOhv/IbfhdrO
         I5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729794733; x=1730399533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRKHkVHowCvUdaOL63DeqZvn2vxTeBbKPQmJOLnaQLU=;
        b=NJYJbWxBH+o18C5vnSDo8l9eG3YgYPdGtrj1bp6eoYp4EuVQjVnsW9d2L+4/VEEajU
         UFVR+vuwucHtOZZpJCD3gifu0QZPXlLBC61lhQtuVjG7EkMrYggO4W9rvcPSreJxbSMT
         IcKkqUduA15tqvbYq8cllC/0fGPDwfxVmNdw93vDjCD9TWwD5982r6+P73LB+hKNk+gM
         FIZJERIxDj3xf+r5VwDgKksz3jR06OywYiYmNW38wtYul66Tq6fVNnK1QHWbaPkntNcC
         aJvPPuqo+6QEU8EdPfCXh2kYLxSq4j141URpvcvrw+r9Vj2KNA2d2aja2i7tk4t+Ri4B
         TJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCUqjZLRFUEI7Tdfd5+wAuARmcL2bh7lKEMhGjHPAM7ga+bghnHG18tRtuLgn/7hOGkcjJ3am5uBbTcaxDo=@vger.kernel.org, AJvYcCUtzNXWXkmqMrMjrET3HibrA8hIYT/+eLCOUAYgMpxGOdwQZh7PMf3PIXI1TDa7LootANyXyyp+b65B@vger.kernel.org, AJvYcCV5ZjcvUR9fz8eDB02gSFrYAuncDUFVwnkSD1IeQEFS5npCCjnbvTDJJQm08sjFZkPuyYEr8qw36/SJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwUCCXOdwnGpwy4LEvg2Se6/+ss8qhgYHsuagnWShNECA067ncO
	/tuuyx2PiX18DVHzsjvGZmH1Q4QCyJw3yfyaNACws4Sucq8f8mpt1Ln1kP8b
X-Google-Smtp-Source: AGHT+IE4AC5dww3WVXBCkrX1t76OvrQk3DQ3teSiOoE+Z3M+gzefPD7Exfv1+/fP+4a4xqIE5xEj2w==
X-Received: by 2002:a05:6820:610:b0:5e7:cb2e:e01c with SMTP id 006d021491bc7-5ebee96e08dmr6199210eaf.7.1729794733384;
        Thu, 24 Oct 2024 11:32:13 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec02aee518sm449494eaf.4.2024.10.24.11.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:32:11 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:32:09 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com,
	brandon.howell.jg@renesas.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	jic23@kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <ZxqSqcN11fTambT4@raspberrypi>
References: <cover.1729715599.git.grantpeltier93@gmail.com>
 <2cc99616ff3dd9bcecb1309cd4d103d70aea862b.1729715599.git.grantpeltier93@gmail.com>
 <20241024-corporate-faceted-811e8e5a8c58@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-corporate-faceted-811e8e5a8c58@spud>

Hi Conor,

Thank you for your review!

On Thu, Oct 24, 2024 at 06:01:11PM +0100, Conor Dooley wrote:
> On Wed, Oct 23, 2024 at 03:53:51PM -0500, Grant Peltier wrote:
> > + [...]
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,isl68220
> > +      - renesas,isl68221
> > +      - renesas,isl68222
> > +      - renesas,isl68223
> > +      - renesas,isl68224
> > +      - renesas,isl68225
> > +      - renesas,isl68226
> > +      - renesas,isl68227
> > +      - renesas,isl68229
> > +      - renesas,isl68233
> > +      - renesas,isl68239
> > +      - renesas,isl69222
> > +      - renesas,isl69223
> > +      - renesas,isl69224
> > +      - renesas,isl69225
> > +      - renesas,isl69227
> > +      - renesas,isl69228
> > +      - renesas,isl69234
> > +      - renesas,isl69236
> > +      - renesas,isl69239
> > +      - renesas,isl69242
> > +      - renesas,isl69243
> > +      - renesas,isl69247
> > +      - renesas,isl69248
> > +      - renesas,isl69254
> > +      - renesas,isl69255
> > +      - renesas,isl69256
> > +      - renesas,isl69259
> > +      - renesas,isl69260
> > +      - renesas,isl69268
> > +      - renesas,isl69269
> > +      - renesas,isl69298
> > +      - renesas,raa228000
> > +      - renesas,raa228004
> > +      - renesas,raa228006
> > +      - renesas,raa228228
> > +      - renesas,raa229001
> > +      - renesas,raa229004
> 
> Damn, that;s a list and a half, innit! Looking briefly at the driver
> change, the match data implies that quite a few of these actually would
> be suitable for fallback compatibles.

Yes, there are quite a few part numbers (and likely to be more in the
future). My intention was to make the driver more user friendly since the
variants listed in the driver do not map to something in any of the
datasheets. So using those instead would require users to inspect the
source of the driver instead of simply referencing their part number(s).

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^channel@([0-3])$":
> > +    type: object
> > +    description:
> > +      Container for properties specific to a particular channel (rail).
> > +
> > +    properties:
> > +      reg:
> > +        description: The channel (rail) index.
> > +        items:
> > +          minimum: 0
> > +          maximum: 3
> > +
> > +      renesas,vout-voltage-divider:
> 
> There's already a binding for voltage dividers: voltage-divider.yaml
> That said, I have no idea how that would work with an extant driver for
> the hardware like we have here. I'd imagine it would really have to be
> used with iio-hwmon? + Peter and Jonathan, since I don't know how the
> driver side of using the voltage divider works.

In his recent revier, Guenter requested using a standard voltage divider
schema as well. I see there is an implementation in maxim,maxim20730.yaml
but that differs from the one in voltage-divider.yaml. Should I opt to
match maxim,maxim20730.yaml?

> 
> > +        description:
> > +          Resistances of a voltage divider placed between Vout and the voltage
> > +          sense pin for the given channel (rail). It has two numbers
> > +          representing the resistances of the voltage divider provided as
> > +          <R1 R2> which yields an adjusted Vout as
> > +          Vout_adj = Vout * (R1 + R2) / R2 given the original Vout as reported
> > +          by the Vsense pin.
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 2
> > +        maxItems: 2
> > +
> > +    required:
> > +      - reg
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
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      isl68239@60 {
> > +        compatible = "renesas,isl68239";
> > +        reg = <0x60>;
> > +      };
> > +    };
> 
> Without any channels, what does this actually do? If you've got no
> channels you cannot measure anything making this example invalid?
> 
> Thanks,
> Conor.
> 
> > + [...]

The channel structures are optional to allow users to arbitrarily define
voltage dividers for any particular rail. Omitting the channel definitions
still allow the device to be instantiated and probed as an I2C device
along with all related hwmon PMBus telemetry dictated by the part variant.

Thanks again,
Grant

