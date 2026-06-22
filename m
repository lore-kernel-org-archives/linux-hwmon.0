Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457433B6E8
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145786; cv=none; b=X+iGXLWVdvlK2zFm/iofuAgF6TZ9oBRwhDdmeZIRZTVykE1nGugeOUkY4HSR2mtUV0lg+70tFZemh6d50kFywftRk0NlT92qruszai9MnbqQYex+WoEV15j4kqfobc2AofS/U8UOhMjLa4+tBh8a2gH9an3k08XRyZANQKvsXYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145786; c=relaxed/simple;
	bh=mvGpKlrwFHncD5jl964V4rj3HmMHhcnqhB2Wf1vJ2q8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=VDJ+yilospL0xjCsUfN6XP+9A8rEXpE/2NcDyYABSmXozPuKNm62hcRLk6mm23jkQbeHlOaH0AC7s1kJTVrnrMSHzb8BL29gkVx77ZDU6Mle5mvg2O0q70s8jYVv4VkzB/A9d+JfVuRW4AnWV/PUs7x4oE4xPnCwRf4cXiipwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSfIdpPZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSfIdpPZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49222b6e871so39759395e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782145784; x=1782750584; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT4x9AYClT9t28+ozEWKPRC7uYmzULjZEqq+oeNUuIc=;
        b=VSfIdpPZUJAkSGCIwK4lc66oUqaaZ/ASg4NFZcmPx61DCf32+U7NWWFoFMngZxdqwm
         gzx7185jIe5oWVl8MUt67eyfEnixBWqBDulfiVs16VTs6zbOsC4XWX+B/9hwnZyr8bbd
         kZ6FJOKn8IJQtZbgpdNaJDaZvAOiJ9GSYjQpAXQnmOqeGeUcS+DZ7nb2sBp/m2sEg+Hm
         NqyzlQ1OMb/GljNANQXmfYJlmMqhmWFfht/k6anc7+KH9Age9wf4LQdEQpSwhCyo4kC4
         KmlexAkrxCrD5KjVo5H/4VcmRoXsK1YIeAjfc2aVYfMs6EohRyb78dj5xGcPtiPWNool
         4DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782145784; x=1782750584;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GT4x9AYClT9t28+ozEWKPRC7uYmzULjZEqq+oeNUuIc=;
        b=T9UcpO1g/so9Q+wLmtGOKkuIjz4Gj756arBcFSUY3Ov9PIgp9KKdGwO5rabScXcnpO
         ZLnSbJciK/m9BDpBluHU7dmsSvpwDgmFJoNQLkMKXKWlcT+shGq5hVIJpBfupAerg1sx
         UlLgcWcV9dw5051pH+zmgRsaf9/q2ldtDrMAvJmS7o7hvjrFy3akze881fnziXAOGWdc
         Yxi+z2H1ISPKTNJI3hfCwRtIul+yuhSKm340kM+KHjkUqtyyyPZ3sqs9jmCn2aoYRv9X
         iqBJ85eB56VdIGNX+K2bHYp/GGx1DCPag+PgcAitiuat14zvKzKTrdVBe/3gjcJ3VF9E
         C2fw==
X-Gm-Message-State: AOJu0YyRISMyXp4N2XRi3XmFLTRcpZXg7lbv9kqy1teepWZv+jZp9kEl
	JdULeh8t6ABxR73kCcfHHBm2LceRIY+qNOJ0iP2Wvg83g4jl0OnStmDvl3Ejmaj7
X-Gm-Gg: AfdE7cm1ZL7sE+yAJ2K8n4cIBWOYjoWBmPXYOtfG0JDT/U83t/kVCRR4M9zFzruqyKo
	YhEnyA7AoEuBXbOXcc0zDo9RK4HI/AO+ygzdqGpvGPbzd/07KiRdO4uM1dD16dgiTAXsBEOaJtf
	QXV9wPHaUWO3yKc8s5q0rRxvaXP2/AtNRGLgIl9bsLXEtCg2DLiTOZaRSzOMbO1spJOk3iiOOaE
	nVuK9QN28wsQWdxGVG8oq6VENw/P1IFJUP1gCTC1UD95R7LvT34kXz0Op4JMi07tuJsInU8IQHj
	VDoTlqXnrTqV+C76tt703ZQYvXkgUlEwQO9lm+jzJBEfLQRGwTYdVizA16AYQ8LuWZ8LDmUwWEZ
	s2WhiYYPYFQTO3KCy+lx5uUPbwluydCkcdjAj5QtWs2sbKJ/eRJReAju4f9fVGUsQpku0Jmk5vb
	nho09i2tvSeEqCi4H79KRMzjh1PQ==
X-Received: by 2002:a05:600c:4fc4:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-49242582235mr223592595e9.29.1782145783378;
        Mon, 22 Jun 2026 09:29:43 -0700 (PDT)
Received: from localhost ([2001:4bb8:19f:d19a:c1d2:e9fd:1b2b:136b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm28998960f8f.12.2026.06.22.09.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 09:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 18:29:39 +0200
Message-Id: <DJFPYCV2FXW7.1BFG9DURPZRCC@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>, "Guenter Roeck"
 <linux@roeck-us.net>, "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
In-Reply-To: <20260622122200.14245-1-flaviu.nistor@gmail.com>

On Mon Jun 22, 2026 at 2:21 PM CEST, Flaviu Nistor wrote:
> Add support for an optional label property similar to other hwmon devices=
.
> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
> distinct names to each instance.
>
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> index 17351fdbefce..f00b5a4b14dd 100644
> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> @@ -33,6 +33,10 @@ properties:
>    reg:
>      maxItems: 1
>
> +  label:
> +    description:
> +      A descriptive name for this channel, like "ambient" or "psu".
> +
>    interrupts:
>      items:
>        - description: measurement ready indicator
> @@ -72,6 +76,7 @@ examples:
>                           <5 IRQ_TYPE_EDGE_RISING>,
>                           <6 IRQ_TYPE_EDGE_RISING>;
>              interrupt-names =3D "ready", "low", "high";
> +            label =3D "somelabel";
>              vdd-supply =3D <&reg_vdd>;
>          };
>      };

Hello Falviu, thank you for your patch.

Should we not add a reference to hwmon-common.yaml (with
unevelautedProperties instead of additionalProperties), as label is
defined there? I believe that Krzysztof Kozlowski did something similar
for the shunt-resistor-micro-ohms property. Could we follow suit here?

I am also not a big fan of a name like "somelabel", and a more
meaningful name from a "real" example would look better. I know that
some examples have already used "somelabel" as an example, but others
have used more meaningful names too.

Best regards,
Javier Carrasco
