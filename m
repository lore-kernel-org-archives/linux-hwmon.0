Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B11A23AA
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Feb 2025 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869052; cv=none; b=EfHOhignvfMc2G3kaSFAYsrohbM4mLSEdDLCt6NXORnlKGpTk9aj9+VX1AcD1DuYbefkGRlmsfzBO4x6xOMxKyXaVqihBZWlvsH41Q882K5NGrq3MgeMNwRK9/HZ7uXrL5YPP26GrmjwD4KATysx9tGyM9zSKYPRr4dvtr1Gnbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869052; c=relaxed/simple;
	bh=Rw38SpIt5uaeLx57DCBwOaHp6ovZGG6NkUErrYKysTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKs6V66ry+4rB0vVB8ChI+1E90O6OITZHoVC4cXnPMKt8rNFjWwZGAvIUaUPTn2uYjMQjhBEvZYACjkmihXLrMkLY0OdzMQTLzzMUT6UyzzEAHuS3dWZ/ev31mcWyX0AYs7tnGZa+Eb8+xp3ymkSS7dMQAWYexcsrPnEGKijg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=EhUia/Qy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="EhUia/Qy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2166f1e589cso32667965ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Feb 2025 11:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1738869049; x=1739473849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bNn7LdmJboFjQmS9MjWVlCya0ZGknTKf2rksBbu/dXw=;
        b=EhUia/Qyfgkt4DJDmi+rK5mba4Eo68jXozAkS0mGjhG98F37Ejjv8UTQSfXNdzBG2V
         XgWK+DmQiyr2oVyHaugKS6GiW5sXHYmgA6AT/toNefswg2nyGPkAW5ihSYMBTpWm+HNe
         42N3Z9IlNMpxOxJkOxLU3bzdgsJYrBDy5Z2P5ZdTxQcY7CjsMPZWufU5XZGdEXkUvv8O
         nT8nZS8QKVVjuHHoTj+Cq1lOl011AJQecom/NVfbD2uaeuVUxH1xI2I54LxsWyl6AqAn
         1UDqeAwlWEBiRFV/mosIWDeJHNnkWaeG19Esv7dIjhqr8lBjCdXIAE16J+PcNuaLBL1x
         OPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738869049; x=1739473849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNn7LdmJboFjQmS9MjWVlCya0ZGknTKf2rksBbu/dXw=;
        b=KM8j7azbnCtqu7e5tsj3EdqQtsjKf9YV29Kqz4YIFnDlK29AYCIBo/RA0Exq2bIIml
         fUjQyFMVAO/j+o93r3S67aVSA3N7uUppp6jSqp88SxYqPaYXNDmIdaTiqelMP3PNVDxg
         PZDWZ7TZ6urK2y87vfNFdxb5CGT/0ANW6J2niNHYdPFIvYDpvZJplQLjiZHkkLOfLdJJ
         vsW0HvDALbuxAmug/EazTKqlxI43OeJcdgfnsWmWu+43WhrgyVN9tvyP/eZmxXpqNdxM
         AcNEmHIN6uZkALYGtqjP3/QPUEhKA7pxxJk47CE2+0JyAQZgPW2bMfYQ8dLnr1ptEpEh
         NVCA==
X-Forwarded-Encrypted: i=1; AJvYcCU6vkts06d2lTuyxQl8Wn2tbVy+e21HRTsGGMYeke4KHZqVuxfjfifp7ku98qWcAgtFGN3tFkNFFLxnFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+e2K/34FxndNZot1PPnEA4gXouOX16D36uRkuKpovYchwqHOm
	7u3udTenL6vr/uG63cqXxhU3wSrygQG3+4cUPuLSYCmnkoR+FI+MCtlLQM8+jRqhoo5rf9mcAmq
	2MQFRlqOV3o+OeQGvwoBfUxzYKB5HarRcEoLeZg==
X-Gm-Gg: ASbGncsTDM526VKUpJ77vXTGUz7ie+haCg8yvPU05TLEgN5vmLBRr9q6hjMG2aAIBjI
	ia2Uv5MNNWoMJTAawfyelvDzYp7y6L+QBtyJtCuwfsO2JFmAt7YFua0pdSKN1jy+YfpXcZ+k4
X-Google-Smtp-Source: AGHT+IHP+CHPnFHvmgqlXfNQqJhyMOHR72ISXkpTk5Ua7uO05H5Z2+wc+Rr40xnBTgiwHLxEycHnPKu+z+SExZwq2iA=
X-Received: by 2002:a05:6a21:100e:b0:1e1:bdae:e045 with SMTP id
 adf61e73a8af0-1ee03a9b2d5mr962803637.23.1738869049673; Thu, 06 Feb 2025
 11:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
 <20250204-mulled-evaluate-8a690cdfbd4d@spud> <CABqG17jHKfwJEfZxto_YA4opS8=QwqTqfNdkku8kcEv2_iW+XA@mail.gmail.com>
 <20250205-purge-debating-21273d3b0f40@spud> <CABqG17j4tKXnMZ5=vcjBvfe6JwCLQ6NbkQmJC9ySK_bmGEv=iQ@mail.gmail.com>
 <20250206-camera-mashed-48cf0cf1715f@spud>
In-Reply-To: <20250206-camera-mashed-48cf0cf1715f@spud>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Fri, 7 Feb 2025 00:40:38 +0530
X-Gm-Features: AWEUYZldmdFaTS15rPgQinK4lS3TTxIDBTf4Zx-zGv_Kv2dykSc9igq6QKOYQNk
Message-ID: <CABqG17iyRXW2_jvTVkFAEhW+TZZ-SAABm+6efqt0ZWHgYbiUMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, broonie@kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Thu, 6 Feb 2025 at 23:39, Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Feb 06, 2025 at 09:23:03PM +0530, Naresh Solanki wrote:
> > On Thu, 6 Feb 2025 at 01:43, Conor Dooley <conor@kernel.org> wrote:
> > > On Wed, Feb 05, 2025 at 03:51:25PM +0530, Naresh Solanki wrote:
> > > > On Wed, 5 Feb 2025 at 00:52, Conor Dooley <conor@kernel.org> wrote:
> > > > > On Tue, Feb 04, 2025 at 11:33:03PM +0530, Naresh Solanki wrote:
> > > > > > Move dt binding under hwmon/pmbus & align accordingly.
> > > > > >
> > > > > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > > > > ---
> > > > > >  .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++++++++
> > > > > >  .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
> > > > > >  2 files changed, 61 insertions(+), 45 deletions(-)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
> > > > > >  delete mode 100644 Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..e1f683846a54
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
> > > > > > @@ -0,0 +1,61 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,ir38060.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Infineon Buck Regulators with PMBUS interfaces
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Not Me.
> > > > >
> > > > > How the hell did this get merged!
> > > > >
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    enum:
> > > > > > +      - infineon,ir38060
> > > > > > +      - infineon,ir38064
> > > > > > +      - infineon,ir38164
> > > > > > +      - infineon,ir38263
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  regulators:
> > > > > > +    type: object
> > > > > > +    description:
> > > > > > +      list of regulators provided by this controller.
> > > > >
> > > > > Can you explain why this change is justified? Your commit message is
> > > > > explaining what you're doing but not why it's okay to do.
> > >
> > > > This is based on other similar dt-bindings under hwmon/pmbus.
> > >
> > > Okay, but what I am looking for is an explanation of why it is okay to
> > > change the node from
> > >
> > > | regulator@34 {
> > > |   compatible = "infineon,ir38060";
> > > |   reg = <0x34>;
> > > |
> > > |   regulator-min-microvolt = <437500>;
> > > |   regulator-max-microvolt = <1387500>;
> > > | };
> > As I have understood the driver, this isn't supported.
> > >
> > > to
> > >
> > > | regulator@34 {
> > > |     compatible = "infineon,ir38060";
> > > |     reg = <0x34>;
> > > |
> > > |     regulators {
> > > |         vout {
> > > |             regulator-name = "p5v_aux";
> > > |             regulator-min-microvolt = <437500>;
> > > |             regulator-max-microvolt = <1387500>;
> > > |         };
> > > |     };
> > Above is the typical approach in other pmbus dt bindings.
> > Even pmbus driver expects this approach.
> > >
> > > ?
> > >
> > > Will the driver handle both of these identically? Is backwards
> > > compatibility with the old format maintained? Was the original format
> > > wrong and does not work? Why is a list of regulators needed when the
> > > device only provides one?
> > Driver doesn't support both.
> > Based on the pmbus driver original format was wrong.
> > pmbus driver looks for a regulator node to start with.
> >
> > Reference:
> > https://github.com/torvalds/linux/blob/master/drivers/hwmon/pmbus/pmbus.h#L515
>
> Then all of the in-tree users are all just broken? They're in aspeed
> bmcs, so I would not be surprised at all if that were the case.
> Can you send a new version with a fixes tag and an explanation that what
> was there was wrong?
Sure. I will add an explanation in the commit message.
I'm not sure what you meant by 'fixes tag'

Regards,
Naresh
>
> Cheers,
> Conor.
