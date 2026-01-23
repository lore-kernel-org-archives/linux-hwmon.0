Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FDA1B808
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769173077; cv=none; b=K/J+aCDQCDgT6FVcOB3n3gxPNgoV5n/Vu/8KU0xeQVn7+bctYnvlb6C3cQ0En3QpVZqQbI7F8SLabqcODhxMcVeAk6rqpsfQku6lwLzx6JanKHTr5kShFsFXbWCEnPGQPYoIWvSuDJIcj/nTFB+CNHlnc/4qXiKtMOLLMbnGDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769173077; c=relaxed/simple;
	bh=rWBVAuGP12n99DDYOBAxK5U9/YbnI5jCL2Vby+G7PXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMPvVzkr8H5pZTvgaOpPEVce1OG9HXX/uPAdWLcYygMSS8EKz3SxJXXJh2odQNUWM4oBdLxjeVuWd+PBvOLDjCIX47gkTRaB48L0M9ylR8n88C1S/JI1Nr3Mz3UGSxYBW6LA1ycdsgyG/UmNsksNCrw4XJPVPpwK7lsaOVP6gkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5ZkSIHD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5ZkSIHD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1909932f8f.3
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 04:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769173073; x=1769777873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23k0nL5or/g/Ncq6j1GNEPEPQgp73ML8YdFMHnjI+yo=;
        b=N5ZkSIHDhZPBddUJfdU9EfuCEnHl8TiV2V8NQFHhiuygKucbvSurg0S2oSgUfnwTfQ
         qLm+ltiHKcOC85AQ925Ih31PDx7HMMcFba3KCxCyKNQwgGQV9PmiEaPqqQ9a6kiwoi4L
         y9wkSfF4KjJvjY9cdr5EtzKdbIMIiIn/P8XDnPQmqglODAplxRxaE7blJlIGFrkWt7rb
         3wD5Z5VCpM2oUrUKVeAdOPx1EJFcGgGb8y7X4Yox4avMEFcWztUyUQZ6s51krOD9II0y
         QxENnM+GDtR+bKUmMwKZoMprfbQg/wZsYH//n9Iwms3OC2ov6VpXBK+vFdNw0I4IuALF
         VOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769173073; x=1769777873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=23k0nL5or/g/Ncq6j1GNEPEPQgp73ML8YdFMHnjI+yo=;
        b=ZbCRw6teAlVezxnNIk+aEUnS9zW0JSCXiXB3xqj2qlpb8I6w3Sy9albaxPj5HJ+xZP
         eAhrH0UEMtUNWVqpcr15SFVuzHm7LRUFthVm76UDvB/8gfcsuCEIWbR/1kE2S9WN0uce
         0wotk99lVuCY+jrNK74U4W5dYPM8tvVsk29NalUeAZLnqbr8DNtFl3H0T4oX86uItzt5
         OKyko0afUbtWywqzbv6WlBsJyMYT5dDkFIXF21wh2Uvxh6sXaYVX79srE5l60eLQRM4/
         eHypvVYNdYmvBvTBwwdUbDNsi+V62ia7cejB4AiTtShZ7KfZXon5J//KsT+Iq4FervLw
         agVA==
X-Forwarded-Encrypted: i=1; AJvYcCWg/rTx5awXTVikLSVmvHGL0LsQOnKg4JrL2FtKC9YVf6PInLxc6vaRQ3wPut+9Wt7JzTcgruvTHKfAkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydRnEjMQXxnPMujglpvDjdx0Mtut8UNCn/BK0G0jmDikB7MDV/
	65k9GM9yTp7u0vNB2IIPiuWyqGgFeTeUjVtz3l1DEmMV2J6hUcn+B1oJ
X-Gm-Gg: AZuq6aLn3VH2zSJGxIw4Ly1TrDNDDK/Sg7anIfZL904pDnrmL9PuwFjH12Qyhxgpqdv
	3vYRqi++hDfRZd2uwMxtgcU/5Ej9YIcEJvc+dhemvFXfxNJaBmcdRxxV1Gghv40wX8QYZK9a6sn
	aOJlRiIMRUdzYPVn8gkeamegACWQEOqgZF1SxC8s83iGFQ1CbFytge4LIjlt+AppEfBQ6h07iWR
	OGhaLWIFBtC4LDHs6bG9gm9Xk75bHAE7eQS4pQq3QHBcTe862vgdyRr66+zu6xFC8qY6dx08WDg
	jFz3NQzFN9zTIhBiM68cX1hyy42fsmOUhhV2Dh/riLt2z0tO7yw+XD0gY3II79cdRNZj9c6aOVx
	7qBYjUUBeeM2SEphEFj2w6j0v6H0xH1YYVJg+H2xIYneb3bO6ZrAmGWBx1QPoYQu+2J236gN3Cz
	8lW4zzl9gfaEoqHvEAW0EIZ1EfrNgGJPJdsgoKZkg54GIQN/7lfypCjOyLJRE=
X-Received: by 2002:a05:6000:22c1:b0:42b:38b1:e32e with SMTP id ffacd0b85a97d-435b160587amr5594957f8f.46.1769173073087;
        Fri, 23 Jan 2026 04:57:53 -0800 (PST)
Received: from flaviu-Aspire-E5-572G.. ([5.15.64.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e717cbsm6573336f8f.24.2026.01.23.04.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:57:52 -0800 (PST)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: tmp102: Add TMP110 and TMP113 devices
Date: Fri, 23 Jan 2026 14:57:47 +0200
Message-ID: <20260123125747.4270-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929170730.8285-1-flaviu.nistor@gmail.com>
References: <20250929170730.8285-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 08:07:43PM +0300, Flaviu Nistor wrote:=0D
>On Mon, Sep 24, 2025 at 19:12:26 +0100, Conor Dooley wrote:=0D
>>On Wed, Sep 24, 2025 at 08:55:39AM -0700, Guenter Roeck wrote:=0D
>>> On 9/15/25 10:18, Conor Dooley wrote:=0D
>>> > On Mon, Sep 15, 2025 at 08:08:18PM +0300, Flaviu Nistor wrote:=0D
>>> > > Add a compatible string for TMP110 and TMP113 devices.=0D
>>> > > =0D
>>> > > Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>=0D
>>> > > ---=0D
>>> > >   Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 2 ++=0D
>>> > >   1 file changed, 2 insertions(+)=0D
>>> > > =0D
>>> > > diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml=
 b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml=0D
>>> > > index 96b2e4969f78..840b5306a8cf 100644=0D
>>> > > --- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml=0D
>>> > > +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml=0D
>>> > > @@ -13,6 +13,8 @@ properties:=0D
>>> > >     compatible:=0D
>>> > >       enum:=0D
>>> > >         - ti,tmp102=0D
>>> > > +      - ti,tmp110=0D
>>> > > +      - ti,tmp113=0D
>>> > =0D
>>> > The driver has no match data and no compatible based decisions added =
in=0D
>>> > your patch. Why is a fallback to tmp102 not suitable?=0D
>>> > =0D
>>> =0D
>>> That should work for tmp110. However, tmp113 does have additional regis=
ters, and it=0D
>>> might be desirable to report the content of those using debugfs. Fallba=
ck for that chip=0D
>>> would work for now, but that might have to change later if support for =
the additional=0D
>>> registers is added to the driver.=0D
>>=0D
>> In that case, only the driver would need to change not the binding.=0D
>> That's fine though, of course.=0D
>>=0D
>=0D
> I am a little confused and I would appreciate some advice if I should lea=
ve=0D
> the series as it is or send a v2 only for documentation and Kconfig updat=
es,=0D
> droping the binding update?=0D
>=0D
>>> =0D
>>> Guenter=0D
>>> =0D
>>> > >     interrupts:=0D
>>> > >       maxItems: 1=0D
>>> > > -- =0D
>>> > > 2.43.0=0D
>>> > > =0D
>>>=0D
=0D
After some time (probably to much) I went through the patch again and=0D
based on Rob Herring response:=0D
https://lore.kernel.org/all/20250922162004.GA199858-robh@kernel.org/=0D
and a similar example for sensirion sh20, sh21 and sh25 sensors, =0D
where individual compatible string were added in the binding and the=0D
driver even if there is no match data:=0D
https://lore.kernel.org/all/20250908-sht2x-v4-3-bc15f68af7de@gmail.com/=0D
https://lore.kernel.org/all/20250908-sht2x-v4-4-bc15f68af7de@gmail.com/=0D
I think that the patch can stay as it is for the binding, so different=0D
compatible string can be use in the device tree in order for the real=0D
hardware to be describe.=0D
=0D
Flaviu=0D
