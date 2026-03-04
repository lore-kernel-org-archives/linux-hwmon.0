Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B306B351C1F
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772648791; cv=none; b=XD96qQz1Pm8ZFZCvsr2XT1F5AHQMbgw1HBhqt6ONvd5fc2TYap36s5GVrRh58jsUuEmGOkO55IaqGmEZ1obn9WS5AX6774zAGk32KI6UKgvDJ5wcLhYguQ2p7K7YYqF15ObD03Br03AoQDcmF++v4bUilLO2Pa0YZsFRlKEjUVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772648791; c=relaxed/simple;
	bh=fNKyRO1gPqw6zYWBoPZwENPPeuYaGXp64QH4jS53Xiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOSPp/UrLvZlJhVC0vfXijGreALiwUM7ly+Awne1o+IanTd5yglHrVbCqacrK2Ok2ZuvFw4V8dgXZMhssWK3TNbjGzoNBUGy13FZk8I9VVMsrE7GWTA3jpxKB+HDzbsY549lYSYZhMU9gmUrdevjoW+2seyB5v5UcxXQ4WWkO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgwiz3fq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgwiz3fq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B9DC4AF09
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772648791;
	bh=fNKyRO1gPqw6zYWBoPZwENPPeuYaGXp64QH4jS53Xiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sgwiz3fqpE2qESw4427/wkVFOlBeEMsvtO17Cuqy3eZiRse9/VommaFGJmPkp9mXy
	 PqltkmU28CtHrA86jGN1/6lGYZpeIfhXnyI+EiZv30mKnOh6WBm1wWHXNUVzlsz1iC
	 OW8+AQ7A+E0+wjn2XYv6jyc1MdMbBV2NJA1oXJ1ggr1QLtHlWS1s6k7iXEjaBU9dEn
	 e+w5c3B8hTLIwEE8fXnLkMWFkXre/KUIrkCZZ13Und8GXZ9pVlOue/uZRyNdHBpkWj
	 bW7+y4BayCZ1tyl1SUg0Y0Bs9iHva9c8EkZcgxBSGCw1Ms2XMbvBGgvagF6cdT4VFQ
	 88QZNXhL7f85Q==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b935ff845c8so926216466b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 10:26:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/CYn73i+/Fzsapsk7odM+7aCk7p3DfdW6YBmNFMIXd4bwDwvsa4zHsmh06eDz1U8ufmayYGTQHjjoDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FnyGq6mGAMX76cW/VSUWQoilpNNph4RuXKadHLyXD7+KwS83
	IZXU6fenlAUkIFN/auzB5oLTwIOamp3kY85LhNqXa8BGl/LnjBLXjhjlo5xnurR4SBDTp9HB9UX
	jwdumk+JDeUzH+QyTI7e3ztRVWyqvPA==
X-Received: by 2002:a17:907:3f13:b0:b8f:a32d:b90e with SMTP id
 a640c23a62f3a-b93f1386a88mr188119866b.34.1772648789974; Wed, 04 Mar 2026
 10:26:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de> <177254885509.3251575.14819823286886805862.robh@kernel.org>
 <aacH7NmkOzZued0Y@pengutronix.de>
In-Reply-To: <aacH7NmkOzZued0Y@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Mar 2026 12:26:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJztUNizCcn=VCoGfmaMy3r6wDTLwZH5r6vj7kh6q9qAA@mail.gmail.com>
X-Gm-Features: AaiRm50b3Z7cXqKPeUT8jNyjdFvKC1SEvnQlt0VXwEdiHP3kMnXQAyPbfyLH6Y0
Message-ID: <CAL_JsqJztUNizCcn=VCoGfmaMy3r6wDTLwZH5r6vj7kh6q9qAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>, Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 10:10=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> Hi Krzysztof and Rob,
>
> On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:
> > >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++=
++
> > >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> > >  2 files changed, 196 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978=
.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc3=
3978-pinctrl.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' d=
oes not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> >       from schema $id: http://devicetree.org/schemas/mux/mux-controller=
.yaml
> >
>
> Folding the mux node into the parent as suggested [1] causes this error.
> Because the parent now has #mux-control-cells, the generic
> mux-controller.yaml forces the node name to be mux-controller. Since
> this chip is primarily a switch/GPIO controller, naming the parent SPI
> node mux-controller@0 is misleading.
>
> What is the preferred way to go here?

I think there was another series dropping the mux-controller node
name. Not sure what happened to it, but that's what we need to do
here.

Rob
