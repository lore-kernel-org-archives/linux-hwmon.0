Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B28OisGt"
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA02FA;
	Mon,  4 Dec 2023 23:00:45 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-35d51e12369so15014465ab.0;
        Mon, 04 Dec 2023 23:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701759644; x=1702364444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05mL6nQB0kmsMzok8JrG8EBnmPynqlEzYqjSwwPxQ04=;
        b=B28OisGt4eMSdEU5J4+4R8tD3bDvxS7hr3jvikaPoGhGVfyP9g5F3c0d5qJjcEzNTQ
         mLJBI7b20wp072UBpziX1tizplNDCFVQlDe//EEBbh+1USwJxc+U8yrRBatO5eu2Pogn
         4wZLg0QJNaB+AyAHCm6r3cOs7oZY3l6tQorLc6oJSa8s3e1iaYgclBi0QmmzEQWpX0t9
         FCDBFyxujc9St4EHaHMzLpoy4YAvT0SDBbJ9NyVaXdMSsNsHxxHw6p4eLhQ4IRelDPPi
         AVyJb6ed69EVEYgC2AjRFnPuAdwXqDX2JNrrFDreJWiI3JIcNBhRHP6QTUHe5LQfR2mX
         YJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701759644; x=1702364444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05mL6nQB0kmsMzok8JrG8EBnmPynqlEzYqjSwwPxQ04=;
        b=UIQ9Uan5dbaO20rwk7LU2pMozzSWKZnVqj/uCRxEYC2j3UrBypWcJ+uQBXefb/yRWI
         S8RgdFb5GgKlOo2eUo6S3/qZsD4F0KJhAe3wYZS84Xn0NDPxM5damq0Cvb9FnM53djob
         qg3e5D0IskroybnASxYYGiqQXGRKEthAbmaEF3uqbFw1GWTpQCMlCG/T7xXgZOed0A99
         NWnfscvlSDUziWOr8lluvqYBf1a4I/+eTulXMfHTMO/N6MzJnsBXjG/cKrISsv3hqHG+
         IBBKg5ozEcrXuETHKPByMDUn7WuWFRzW51hDUKGY/A4t1Fo9s27dQldt5szRNTLjJyJH
         v99A==
X-Gm-Message-State: AOJu0YwDVJxXqpX4+k+cfZMNSSjOBVrrujlBYzzYDksOMJi2Pf2/M94m
	Aklki+HV3RbMFnscQ6b0vmlJkYKrS+6ZHt2EIWs=
X-Google-Smtp-Source: AGHT+IH3xBXpdyxfxq6RHrZRZr8Sfcij2ART6xdO1vYzdZF/04NJSAXA4HVb2lE9a+fQJwx+pDieUZ97w9KBBOSKhDI=
X-Received: by 2002:a05:6e02:11a5:b0:35d:6740:763a with SMTP id
 5-20020a056e0211a500b0035d6740763amr2390155ilj.68.1701759644536; Mon, 04 Dec
 2023 23:00:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204055650.788388-1-kcfeng0@nuvoton.com> <4d978188-b924-4f43-a619-fb5307828440@roeck-us.net>
In-Reply-To: <4d978188-b924-4f43-a619-fb5307828440@roeck-us.net>
From: Ban Feng <baneric926@gmail.com>
Date: Tue, 5 Dec 2023 15:00:33 +0800
Message-ID: <CALz278ZsD2HWVEYkbQbvxaLkrWnmJd5ZcepH5PD8oxRBKrQePA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] hwmon: Driver for Nuvoton NCT736X
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, corbet@lwn.net, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, kwliu@nuvoton.com, 
	kcfeng0@nuvoton.com, DELPHINE_CHIU@wiwynn.com, Bonnie_Lo@wiwynn.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 3:04=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 12/3/23 21:56, baneric926@gmail.com wrote:
> > From: Ban Feng <baneric926@gmail.com>
> >
> > NCT736X is an I2C based hardware monitoring chip from Nuvoton.
> >
>
> No, it isn't. Such a chip does not exist. The chips are apparently
> NCT7362Y and NCT7363Y. No wildcards in filenames, variables, etc.,
> please. Pick one name (nct7362y) instead and reference both chips
> where appropriate.
>

This driver is based on nct7363y, so I'll rename all to NCT7363Y in v2.

Thanks,
Ban
