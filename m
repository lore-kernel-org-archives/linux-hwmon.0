Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7310B36A361
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046552; cv=none; b=Wa1dz1nrSPlc6kBxMm3MeHdq1tsr4oiYaIYLXUQoN8LFrLRBbn6IpssNh2VCZ2cfQ5fpzHQi4EiigsK6bvniP4aNsaoAAQpLNHWZK6wQUC2zLCLVE9s6TZ6It2Zs0NGrDIzEpDauamOH55XxZKT5CYeOayAB+lPIiqdc/rbmFiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046552; c=relaxed/simple;
	bh=tmV9dJLMu0sRKJzLUgwpdlqw+ZSXnLB7bB+l1ToG4zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjUuf4nbfND5aVFVfKmI9BM3yqTyA2bS42YPtfbqM9DsQkF0yvl0HirCxpOthdOqM8o80i2v0EeRITN6hxmRKkV3lXLDVDkZJ7i31+GgETV8kpvx+nhP9ZNMxIwdYhE7e0sMrTPNGuNcjSdi9G7wzkhdlUkgi26L3Pxw9nDmlwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4ybf+qK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4ybf+qK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso21323518a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 02:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780046550; x=1780651350; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPOdFtlxbAd+SCXAV1KKChh2WjDpaHhM9mfLcDgn5rk=;
        b=g4ybf+qKa1VTMJdBG9uYTFQcTV9+jntB3Uiw0Pkbsu/W0LqdY5Y0wWybT3NyYI+cXH
         3kEMpD/dbStEC8z0SOMbpW8Elu2J3/X4x+EvVGlY/Jef3tIayxKgb6r107VB+dZJnpE2
         tH1Ic6eWkWh2eJyL9L76OvVtoOPL9NT2g2uyNAdwS3qVG+mU5cgNllkfNhA0rBDMdk5Y
         ixelQYwrTHzvZwhtb5yY/NHop9umxe+JATUfe3QW95sk4fGkZODab8IplRPZHQS6nDvn
         GM2MeCKP42gtGevcYUTzUveyvRhctLZA8NnRiRLx+4Cul4bDHgHLSglgg4PWn1l9+It+
         q1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046550; x=1780651350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPOdFtlxbAd+SCXAV1KKChh2WjDpaHhM9mfLcDgn5rk=;
        b=Vt0NpfrBxr4iPd6R9EbaQTqv7AaTIC92ZT18kZfHK0A8JYFte4F8Caw/S6zl1iielr
         n28fkI3ZxNlvM6F8sN63AizRV39Vj8JF6/rH2pZbeN619TButtHJF3gm6vOgRJ6sSMji
         faGn8/qw8J6S/SDGdJ4sV0vLPbmclulnHq0PEyt05X1idyF7UgmPVr/RCsIQXM1nbTDZ
         G8I3PeZFXhwPaRGhPp2XwaHRSatz7jVbWzEB7MJth6rIwL4jeGkne3E444j9jq/1ZLSq
         fjUou131/MHFtSZV9EPYAhXRtzeX5wKnyZwq6ykFdZVqS1t2VaWtwqjEcf9INJE4dpFk
         3Bfg==
X-Forwarded-Encrypted: i=1; AFNElJ+WJPwD1eLYlJGVpOVkqeY+QRW7Nna2xgt7Qu/dAEhmkUCPus7hjZwI7PvKFhQFIx++nW4NEILCVNDGRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvlLkY+rVMOykUGwE1f2eqj2dO1mHghCohtyQNJzhePtq7fFAI
	UNiM0z9yjlKnuh4H/kAzDmMeaAKI94mlfeMq6C61kCBFkqrcCF3sQAgU1TXXTw==
X-Gm-Gg: Acq92OH+6mtPmlu68n8U38IY9ADuh+rtgS98sj1kiq//YLQQd67Zhp3/d4/ZawOda8+
	29v56IIM12P3mZhHkpBUbrY0onVH80bES2XzJ+lUYWthjqwScvnqWOxQKvHRcxTGwdrkhr98ikb
	tRoKuynD3uMjE+T6gedSne/vz8c0wFzUioRs+nx50oK4ZWjOpF90PLk9JloizLeXIdvpClsTdPc
	VAgBOJgm9RVfznBmGBMxrgEW6YPFxaTvQwYvjG2ZdWWbVoGD3lC6IBKhIUICH7YCUvNYrLMrai6
	9OfT3/+XjVFk5xzCd8eEJcpPq7ziet46rJ2Y63zFf7OBb1hAVqaFi/wTgeJuoCMXdUWrU3UkLS8
	V3QN407dU8ZjtMZScvbUpXdbS8u9LLns5HktFMTya6CN8pEG8jiZy+PgJkSMalEaBJ19VSLp9tl
	gdWpYjNeoPwtdZSn5GOwdZF8A=
X-Received: by 2002:a17:907:2d29:b0:be3:a586:8b87 with SMTP id a640c23a62f3a-be9cf69ae25mr95650466b.42.1780046549756;
        Fri, 29 May 2026 02:22:29 -0700 (PDT)
Received: from nsa ([45.94.208.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d27f49a9sm49646966b.10.2026.05.29.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:22:29 -0700 (PDT)
Date: Fri, 29 May 2026 10:23:26 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: "Pradhan, Sanman" <sanman.pradhan@hpe.com>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Syed, Arif" <arif.syed@hpe.com>, Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Message-ID: <ahla7zM8f3yFYnsv@nsa>
References: <20260528173424.87503-1-sanman.pradhan@hpe.com>
 <20260528173424.87503-2-sanman.pradhan@hpe.com>
 <20260528-paging-alfalfa-9c3837635192@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528-paging-alfalfa-9c3837635192@spud>

On Thu, May 28, 2026 at 06:41:31PM +0100, Conor Dooley wrote:
> On Thu, May 28, 2026 at 05:34:36PM +0000, Pradhan, Sanman wrote:
> > From: Sanman Pradhan <psanman@juniper.net>
> > 
> > Add devicetree binding documentation for the Analog Devices MAX20860A
> > step-down DC-DC switching regulator with PMBus interface.
> > 
> > Both "adi,max20860a" and "maxim,max20860a" compatible strings are
> > supported. The MAX20860A was originally manufactured by Maxim Integrated,
> > now part of Analog Devices.
> > 
> > Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> > ---
> > v2:
> >   - Added allOf regulator.yaml reference and unevaluatedProperties
> 
> >   - Added "maxim,max20860a" as alternative compatible
> 
> No, please delete this.
> I don't remember what the policy that ADI use for things that used to be
> maxim products, but just pick one compatible for this device. I have a
> feeling they want adi to always be used in these cases.

Yes, adi should be the prefix.

- Nuno Sá

> 
> pw-bot: changes-requested
> 
> > 
> >  .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 47 ++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> > new file mode 100644
> > index 000000000000..f7eeb30f11b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20860a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices MAX20860A Step-Down Converter
> > +
> > +maintainers:
> > +  - Sanman Pradhan <psanman@juniper.net>
> > +
> > +description: |
> > +  The MAX20860A is a fully integrated step-down DC-DC switching regulator
> > +  with PMBus interface for monitoring input/output voltage, output current
> > +  and temperature.
> > +
> > +  Datasheet: https://www.analog.com/en/products/max20860a.html
> > +
> > +allOf:
> > +  - $ref: /schemas/regulator/regulator.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,max20860a
> > +      - maxim,max20860a
> 
> And for future reference, please use fallback compatibles when dealing
> with devices that have the same programming mode.
> 
> Cheers,
> Conor.


