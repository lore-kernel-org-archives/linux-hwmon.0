Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EBD3EB80D
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138333; cv=pass; b=GNpsDfENRTxh1T3VlUxmqsh8+EA4NaroywvExZC+4GbYnOeHsx5NQBl5u0JeJLV/Ngo9E7SBsOciKz4fGrcGtMQjlGq7a46v5lr9TjLCpkoVzU9HJRSdLACJrrsBH7KiHCbFG6zMJVwMcOzdSCV6JTCuCf7MJ8LheJHFJCLybmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138333; c=relaxed/simple;
	bh=MuxLGyy0UpsBOYdgd2XPZnijLjNR9TCllHUYIN2aEx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGMsdrOG/nD72MG592KXz6KrZY8VvuxXPkJgOTrfzum4IBwHtuubClk4L3fwgRTv+3BPfYV4mawCqZefPjb0wYQ8EQMqXau/A5xTnMYmNSlwOEtdUMwCo/Wde3HRkGzxx1VaFuXKzqYUckqEIYS3w7NcKsyEwArad5reyMa/7Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkzX2F6O; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkzX2F6O"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso866582eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Apr 2026 06:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775138330; cv=none;
        d=google.com; s=arc-20240605;
        b=b9tM1RkRV7Co6xF1xnkCk3lv/bn4lGIy022SpvDI2Fm1uD3aG7mVeo1jThF9/7q3dO
         hTDJKHuRy3S5YcW2hriwDKcVKwFvYkU9tQwNDjkJO7OikUuE0XpjGDo8GF+UqHd9ziEJ
         vYVmgYgtyvE5exgTiWUTQJpcqfQjaN9MDlOezrKuyN9/GlZiuFnkmHh2PcnRG6kKfvAu
         xY/mqgT+v42d1s50H3+vPoZxWit/mFMxj4d+NKx1REaEU1LvvWd6xHMte7ICct1IoVPd
         n5B60zJkM4SX0iUbKkKxGWjWZppdYbhB7JiIPCk36Ythm1xUl8PUiRGQv4wXrT7BqCOQ
         U1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egjpBljD5amBzEJap42Vm0ePRWfauJeguPCZGqRPuqg=;
        fh=wtcqf4ofMknZ0AcYzLxhalAPmRUfrJBMUSdZ88PnuxI=;
        b=FMDaj/gLnxWwjIZ4T9m7s81AEpJ7+e0qBmcqcJrtjb1UUXUo7Fkns2I8Kzzt3fPH76
         culBdfgksN/FNX8e+RVJ8wPBEaVa0t/TXBUxbuXDDJj8fXBZ29pzdzRYyG9c036+Oa9G
         iIbk/+HqZ3W7JNjtWCpVhDMjF9JRNLauaHXscuPYZ/abdhRb9hV/a5M+4+////l+zz8R
         1f9CBob6jz7ODbj+vQ/J73tuSOMKFYRv5293mdsrSXRlvv3ijInG6VNJ4IvivYGrP3pP
         B4bw2Wj85V3LfMngwPNqvcVVruLandKhWLpacGNaYuXTQpmYRMzgu2NasPAlsL0su8bl
         uQvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775138330; x=1775743130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egjpBljD5amBzEJap42Vm0ePRWfauJeguPCZGqRPuqg=;
        b=BkzX2F6Ow+GT0NaIGuubM5YzB7AltV4eZdq/BB1xtSQkJAgqMplEIkkOQsLRiyV0Y+
         RR+zM11uRjiZu8zmoZZuJqIuPAbbeIgZXmzfEvFX/3+0+HKUiQ6gAI3NC4BJDWupQ9ux
         MJj+6g2kSmTtgwlRCwxPQHFSmFeRz/FEOCfUZhnLDxlsXqd3Jqe5VxYaQURdQ1Ejyf/e
         wC/eUKlCyOp1IVwDW2cTUwZznwCe4zD/nEe2NRPltbTgHbVz63pI3yq494W8F7sxz9Kh
         +zeB7pXY1nGi5R8KUUzrqTRYUrMrogIGjPAqBS10CNnKli5D8HetAI4OZduWLV49amn6
         fbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138330; x=1775743130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egjpBljD5amBzEJap42Vm0ePRWfauJeguPCZGqRPuqg=;
        b=AafhCsd4domoG37MBmOruhMUIP0TrVEsFEYuU0jMWSpuLQVxnE0oCpE8r5jazSJoZ1
         s/TLyth6GIfwpk0jbhtYdTrLDqF7dUsuYfMnLKAX/kXAeaP3xpNrEo2d7XjqXq6Xe0hX
         xXpLWbakWsOuXaqR0e1zDWvSJGGXmJqlw0xkkv+YKhoryWfryiQLOmYhEFJDp5gwPztZ
         fkVjhr0au5weEgddfFUG7zh7vEsFKKU0EL0umvnsh+MAnTQENGXwLQKO53x18zy1EVI0
         GDEXvNQ0qX+ad5vckyU6d41tgSR14gcKj2F1E31oppFZKc8p1+3pkkg+kbxoOWhniFgS
         eD/A==
X-Forwarded-Encrypted: i=1; AJvYcCXhHi8X4j2Pzx8jswGKmiyPx14zgAJs/bHTdtT0xj6DqQIp3bpHayjmaTq+K6hB650hXcIo4o4ptGPc+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKXHZF38Hygfoh3tFyTZoU5G0MNwlTb3dcPDjes3kbdaQBU4X
	aZ2cnNSGEU7/BAvHSy97j53wGbiyqzRNnjYvbSmSTqp0rLSrawk0DaRHZeNkMsFxQFhv4/K+Rdo
	glVLnLwQ3k7FIIYmix5RBvas9egAYaMo=
X-Gm-Gg: AeBDietPERSb5IWsn6FeW3WVWZ3E69dcSDjO4Y3A3B9WgrQVCZQojsQxY9GIN1oqhdM
	XrSIfVLGZyCMUvq3frL9MIBnqFaSQGDfTT5wBQlaLVSRezBsiagV3+twefMawDRoj2a81nxW6bH
	r71rfTfNOkwYLGwFYADHNlLVG2ITqfIo/url7Z3/bJ0jYHCjKJTrHvhw32LOsi/wol9UkfBzCTL
	n3Ei/iBEwAElLF15pk1UWzunwhuvS2JRvbflYnFYKHB98+az1RloPzh3veItHJuCG1lBbkHPhZz
	rZJ+3eQPaFl+Kb4I
X-Received: by 2002:a05:7300:fd18:b0:2c1:74ad:2ce1 with SMTP id
 5a478bee46e88-2c932fb1ceamr3858039eec.28.1775138329593; Thu, 02 Apr 2026
 06:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
 <20260401104550.115715-2-Ashish.Yadav@infineon.com> <20260402-enlightened-analytic-leopard-ddc512@quoll>
In-Reply-To: <20260402-enlightened-analytic-leopard-ddc512@quoll>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 2 Apr 2026 19:28:37 +0530
X-Gm-Features: AQROBzCeSV-f8plt_LehmRZiHg0cu62n3ej4GjQqzEFgRQwD_gP-JIUq4OFXLks
Message-ID: <CAJKbuCbs42aMKBXypkQeMNoBwp03aK2rzJp9as0NpZo==Ospng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for your valuable feedback and time.
Please find my response in-line.

With Best Regards,
  Ashish Yadav

On Thu, Apr 2, 2026 at 1:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Apr 01, 2026 at 04:15:49PM +0530, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add documentation for the device tree binding of the XDP720 eFuse.
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> > This patch introduces a YAML schema describing the required and optiona=
l
> > properties for the XDP720 eFuse device node. It includes details on the
> > compatible string, register mapping, and rimon-micro-ohms(RIMON).
> >
> > The RIMON resistance is installed between the Imon pin and the ground
> > reference.
>
> Why are you adding second commit msg? Hardware description goes to
> commit msg. Redundant parts go to /dev/null.
>
>
  ACK.

> > ---
> >  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,xdp720.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp=
720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.ya=
ml
> > new file mode 100644
> > index 000000000000..bbde8ff92ae9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yam=
l
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon XDP720 Digital eFuse Controller
> > +
> > +maintainers:
> > +  - Ashish Yadav <ashish.yadav@infineon.com>
> > +
> > +description: |
> > +  The XDP720 is an eFuse with integrated current sensor and digital
> > +  controller. It provides accurate system telemetry (V, I, P, T) and
> > +  reports analog current at the IMON pin for post-processing.
> > +
> > +  Datasheet:
> > +     https://www.infineon.com/assets/row/public/documents/24/49/infine=
on-xdp720-001-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,xdp720
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,rimon-micro-ohms:
> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.
>
ACK

> > +      The value of the RIMON resistor, in micro ohms, required to enab=
le
> > +      the system overcurrent protection.
> > +
>
> Missing supply
Could you please provide more info here.

> > +required:
> > +  - compatible
> > +  - reg
>
> Here as well, most likely.
>
Could you please provide more info here.

> Best regards,
> Krzysztof
>
