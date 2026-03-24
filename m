Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC41D35FF50
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 01:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315058; cv=pass; b=MvFHBvqAgNYAx3px9l94tl97MSHfwTe3z0plGScZXAP19wemHl4BXM8A2LiRcYOIq8QcGt2+Ioqu4PGf538PkBTRvFKLF0NiNnYY8nCVvQVeiDeD264bKnoG1Rm08g+tiiBA/3dlFjH6n+jgJcBqCQWCzK1pWYWu7AzaFP0/QmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315058; c=relaxed/simple;
	bh=TgqMFATpHhW+nEiJqSEEUReQS498sWbvY8+dfg1d0lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmpjOs05m383eTUvpAHdm0X9pIFuJxt0A6qgc5/Ynv0Mf+HVH2ND2/N31mhXdIGsKhme00M+hgpOlTmgOXqlQql93GOMCzKLSR8cCmhHQxX0zp71bj4plQrTE1Zr4WPXJxxWQeMCFvO9spPHjsbHhMHWHkljl0qjplwth8N7UcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vvgZn9Gt; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vvgZn9Gt"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a67221fe8so21788081fa.3
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 18:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774315055; cv=none;
        d=google.com; s=arc-20240605;
        b=e21sPBLmA0lpQocWfEh92bf/5fS5Aaymyf7oRrxw99tIE3gwWO5Ok1UyQTRntqh3LC
         vp1oJ3+zwqQ9WZWvkV2CgJXylnhCKur3r5Bk5IaZ1EUtYGLAesAkEs8KlELLrUexSWqr
         nRHEAxQkDNUHiiodNtSA6d30ExfJDiDjh75b8/1/wqdwgC8IwOE6dkEG1WVz6yjDXUid
         WkwRS0dNavVkPASXFURExBeTaNv8EMUGS8Dyc9hSgPrs+ViR1aeQQkpjXdyQJrfSYHpl
         qf6SiJHlkv2IqMwcSJa2Oxm7iVz4czT4n8a3taWxKWsi4EumaYZA+e1hH/tp5IVwxtsQ
         GBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        fh=sCTTeiB80OX8Mj9AIFkodNOrgDCXBjxvjR0iFy19WP4=;
        b=LWbkXkKg5EtpQQnUDs4gPxHhPq39TWBp2OQ63CBEFj+xbRzhHoNp6qa1FiFTPD4QYB
         aqAM4kPtuzGeNaoAO1VMQ0qx4q+/pI3fzsX5FwisLFJBVPsC4oagAcO6jia2zYBfKDQ2
         R54HvZAvX8q1cigmuGPHcc7nv/WfUipMKksv5qnHfCQhKqYm/7ef2ZXdGz0WZyaE+DSN
         svb4LUR00k2dv4Dj25xGfJCQRpmTYgB/QBTzc5+zLaMZODHSK08O66MrsjQVYzuT1/vy
         lXn8IZvAGn3DEH0W5kRf5VE+jqBNc5JLh94nUE65woHeMXDDmQUmsmzjA2Gr+Txgto5J
         3ZVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774315055; x=1774919855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        b=vvgZn9Gt0bNMu6GOdlDS9AOVNUllGJtTVkw0sXEMaONMD+IejYnJuYCB3uQDmX4sls
         otMcxQZd8w7QR8dSbEmONY5m1plWutWA4f9jON804oyK08LJt7i61Nv2hesFbP0rpYqT
         STToKFphq1AN/euxb34koCN1lUkwLfwgs2GT0PlZTWT4DvSahDTQ6Ww1F017jZ/wVLIY
         gZZrqhL9eCqmkJscd9nhuMzH3xuVAaKGa2bJ3uaIaDtlrEzGMEImmwg6K+gay7RCnoBo
         5dRHL5qcAd5ONvXdIZWKVfSejPCZPOJlhmnI86r9XOT3e1SGQT+dve4e6LbT6DBwFlef
         doxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315055; x=1774919855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        b=MFAlqxM76vqzroLI1lf3sag2Qru+dhyO1AvHycphDGXx6l57+pK6nBjU7i+DHFwFBS
         gUqdFgq7Tw7YRcsw+hq6/ULLIh5O4tXFyFRiNsA12P8FyI7S947kYKZBAZQX+l8Bh9h9
         Xx1cdvwZFORDiH8XWU6UazAq/HsnBfG0GPgoh0kEmDOWcj9ZPj8s/MZ1ediCPE7s8Wb+
         AoIl+tIbnc5QAs3VHo9WOwxlPbB8FcZhfcdZ/iPQxFQsAfTxsrSANKenHmU04huZr6KB
         XPK+FRxf7nyJ9wC1u79C7+w1YFL9eahfWmSclLZgNjo9TaiFrcVXPsVLQ/PQlsbJffEJ
         vGhg==
X-Forwarded-Encrypted: i=1; AJvYcCUgSCDSFNubxeJNKSilJA7WAPtMPCvyHA+R77UzpdvDU/G8vAkbtl7DjfvkzhNQCWbggDpd4EgHtO0+4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZFMKXnzcc07Juf6HkiPMq+p4UUxoYlbGRVmbV2fpiBEqGe718
	AxwTapMiiMLPEiaUMWyWKC8rGqgEMxsKGX6XVNRh2/QsNk7Cd4TTnKmNzezWFq106nX193kIysB
	P3GF1LqsyZLwoKpmux0jhC8+vjPqA6ILpMhV4f6e15A==
X-Gm-Gg: ATEYQzxjjIEMI2IXx8rDupovHsVKQkdmAtipkvwxGi5wRNR1J3rLxWijD/I9fnaM0+q
	JM+lvHhZVemKpXDijtxuX6U8LOSxmvC25uNH3aul/qST2lafIounxCX54KHKXoHM+BmZNyt2pVe
	mUolyUrHNARoPxrjZ+kcwKOijqhThQYIO8MC1YjNLA42/MD8mopzTDHZgqCah062jrq0NcFy5Xi
	21qxZtVfpyzNDdcECYe8LKPdOT/8txZgMxCHPHkl4nuH4yAFKXL9ko3eT+Jole2w2tGkYNZbihL
	G0x0Ma+dcXSbhZhAfWWI3u+UO0qPJ8HZUHqGaIncjQP7rfrLdlufk8Q3OX02OCrRJ0k=
X-Received: by 2002:a2e:9850:0:b0:383:20cd:52fe with SMTP id
 38308e7fff4ca-38bf9703849mr32962451fa.17.1774315054476; Mon, 23 Mar 2026
 18:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-3-sbogdanov@baylibre.com> <326f3dad-b2d4-44fb-a4b1-d09fb0dc5024@roeck-us.net>
In-Reply-To: <326f3dad-b2d4-44fb-a4b1-d09fb0dc5024@roeck-us.net>
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
Date: Tue, 24 Mar 2026 03:17:23 +0200
X-Gm-Features: AaiRm50e7_vyqNaw6KGozZtyUIdxEAYNqIIQFD0h6In8lfXt_wnxCUYyWj3o8V4
Message-ID: <CAJ83Ew5RN2LPXzezqGEgneajS6RWDK-cGNej_DM8ukYc7fz1WA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
To: Guenter Roeck <linux@roeck-us.net>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:31=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Tue, Feb 17, 2026 at 10:12:02AM +0200, Stoyan Bogdanov wrote:
> > Add device compatible support for TPS1689
> >
>
> The title and description of this patch are really misleading
> since they don't mention that support is added to ti,tps25990.yaml.
>

I will add in next revision

> Also, the "title" field in the .yaml file still refers to "Texas
> Instruments TPS25990 Stackable eFuse" which isn't really accurate
> anymore.

I thought it should stay as is since driver is still tps25590, but yes
it make sens
to be changed. I believe this should be acceptable

title: Texas Instruments Stackable eFuses



> Guenter
>
> > Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > index f4115870e450..973ee00c2c49 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > @@ -16,7 +16,9 @@ description:
> >
> >  properties:
> >    compatible:
> > -    const: ti,tps25990
> > +    enum:
> > +      - ti,tps1689
> > +      - ti,tps25990
> >
> >    reg:
> >      maxItems: 1
