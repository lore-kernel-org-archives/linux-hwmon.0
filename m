Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828D36B17
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Feb 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708351888; cv=none; b=rb7jcPEqAk0khWHwnso+3/8nHWetqVkFmeNxRp8xQE2sxMjPUtRMUlhtrJ1nFrH8hFzSGHVjl5tC/qlAeSjS0lgKUqCD+kWtCH0EaQ2ZkxIwIQYktdqqEtaSwdJ92oSB+fQeYE0VWvXHa/OfGE8H+3hA039X17JZNuX1Rn9ItVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708351888; c=relaxed/simple;
	bh=AL5wPKCohpQ2yiWdCvAfraFWUPzLoyX4xAACLyQi/3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPJKSGKrfFUQEQDRji2/54tUziFbeP+v/pzVkYHV3LdSAqb2q+T6fj92HRNDMy4rCyWG6lAr5YvBPQ7Q2ObPcudYRI0/oEKf3TyHpSQI7tMBruU9+Kz1SOoM+23to0RldE7Q6eHnqTc2X1UqH6rqeYY3dVVFOfNtMB7YGJMVtxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofwXhxnc; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofwXhxnc"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so3876520276.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Feb 2024 06:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708351886; x=1708956686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLWue9ycIOQi61G3VhAa/UT0phNqo7WitTTg69VFfzg=;
        b=ofwXhxncZ+RLtd3LUTHnaNto2ucA2DnyFFN7l/uC6YZ91b8slLEVkrogxnycQAQqZY
         QpfmhKD1ffifQAH6n+Qwnb9VZ/XQjn63tgGGfY6NEv2WDKxTTpiB9p0moMN/WIFZXQRd
         CpEiZ1b3NaHuW57ekigQC7zuE1IhKkciUD0hDlOIHYRs5CG9uMSjskIRV3pIz6+k5TSA
         fDeDHAR1kPQmuB3neP1C1vCKHbOX/KhoioADwRryeBp9KNDXZlsauNdZjlAQj9LAOJoZ
         63r8wGvIyIYh7Bj8I+7SRmOs7c/6G/DVfytUhFVqIP1WhzCeYkLYJkOochOxIsHgWwxm
         GX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351886; x=1708956686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLWue9ycIOQi61G3VhAa/UT0phNqo7WitTTg69VFfzg=;
        b=SLOKLGJOwls3NNGFhbCsLP8g6A49UVMeej+kr1r/uN+whOojut7irhoG7w3qja01A5
         RUVVWffbbGlXOfwAkFx6Erh8xKDI3le8dwlIVB9C7JEzLRkF0sezmP3dn7scSOAPecJl
         ELc2sSMyJc9z4oWbAFzqmL5behPPHivAXMBbLj8peICDTvgh8LWlz2759rz5KMjerxOb
         Q+XmHTmOvjDiiMQjigUoWA2EK4GGgfinyS93sB5uoTicxJuf4duhRpYEgl129GD2novH
         04MOQqGxyLlTWbaCg3hjsSzMkk4xQHSyCs03Ud9fmOF5x2EWBoMpBDnX48r2pMESwJC+
         JiUA==
X-Forwarded-Encrypted: i=1; AJvYcCWssZQdbiSA9j8UJgDiN8P0qQfNqKepko3+XlksHQ9i6KYQy1xQMBq8wzKjnET+G26QBfPPBkDm9ihDUfVwzS9y4Rc4gh8vmYUPnLc=
X-Gm-Message-State: AOJu0YySXKTR2yuDxg5GKUuSCbSs+7HhfUIb0K27A/rYBtp62T4JQeDy
	gu0gLWZp8uDfUmlBZmLh4k0A4GXk8AJ8cg3zu5sBy+xNG6LeXuzzqOQSVPVx6mtNemQB91Xn9mB
	PvzIVOZtyCQtVhO8wTY332rkor+KwVWXKQcS6mg==
X-Google-Smtp-Source: AGHT+IEyZLci8obwFdop3kZF7Pd3UOHq57xrv0s6peR9LNlh8VjmZu/Hfi8U9om9ebeFZisu/0Ryyvpi+AcjByuGjXU=
X-Received: by 2002:a25:4156:0:b0:dcd:49d0:eece with SMTP id
 o83-20020a254156000000b00dcd49d0eecemr10314098yba.60.1708351885246; Mon, 19
 Feb 2024 06:11:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:11:14 +0100
Message-ID: <CACRpkdbmQLAL-W_2y_T4sBJtZN-DRXMsYhODP=sXSJ4ysUKpxQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] Add Mobileye EyeQ5 support to the Nomadik I2C
 controller & use hrtimers for timeouts
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

>  - Add a new compatible to support Mobileye EyeQ5 which uses the same IP
>    block as Nomadik.

Sweet! I'm amazed ST Micro licensed this "ARM PrimeCell" to Mobileye, but
it's a well tested IP and used in eg ST automotive SoC:s so it's a solid
product.

It feels worth it for all the time I have put into maintaining it, finally =
some
real users again! :)

Yours,
Linus Walleij
