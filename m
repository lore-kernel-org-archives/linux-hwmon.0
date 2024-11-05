Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25D1CAA4;
	Tue,  5 Nov 2024 18:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832126; cv=none; b=BvkdaDCDzBq470iUmip+aqeSfGPSi7YgN1hAbMAr4X2G3yxMpSHNsys6dXA9WwordJhH6cXx9m/pjbMLIQZequgCirOgrDcvZpBwxbrMwZqVCipmwJvw6DgflFKp03W/+bWbnrFnblWZosDmwScOFmn9mkS58B1DNf35cORwob0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832126; c=relaxed/simple;
	bh=QzP2bRViQ/TcbaNgdOaaGba2JIDq/ZR9CWshGbNoVnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tibwL6Po8VlI7E6FXzBR498YlqTPWaUH87ome583GmqqNO5I6Z7QLVezQad7SyU097sK8ZPVCj+5bpRk35dHtlp4+WZyloHIISX/YBIJXURDorU0qpvRr5L77i0WhEvw64gHD5gH3V1nEjA48jShKuTBdEO7YsMVg+26EhfirS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so4754831276.3;
        Tue, 05 Nov 2024 10:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832122; x=1731436922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSnGoCT2pZT0OF0fjiepGD9oIfM6c69suXwNMvqD0iA=;
        b=NVADob1gPKhZuBKx3XucRNtv+ht1ES/O0D2kWZE6+ubuuy2vn3LIz/0PWxEEeSYcQP
         QpXoKhsxOsjHhVXvCLtd323JVeeeXD+hfiL7o5Sp3ZpIX5SKC9WdnnjOQ7iZ3u8vvjmg
         LWXv8L49OutiQQWuOdhUjjNlGI7PS9R7X7y6x7ISB9U6p3bhOLzOcurtu6WYAhLMaMZk
         9f1mTj19ZVDbwrO1LM8m197xGn+QoPBQZZaZ+1LEW1OMawHNMuZI+0MvmX0JG0hGTDHq
         UPc5DPnNnp8WH3NYxKlZYRuXSg/fQe2FNrbNT0yLZL6Jfjyi5UHOh1APJDL74c+9O0v8
         8QXg==
X-Forwarded-Encrypted: i=1; AJvYcCUFD3bI8eOvSL/Id+vVkUmV7IIPRmNzTIFILVTD9niNbLptVfN0byg1jt5qSvFJDWZvq9qNAud5MOzDVIo=@vger.kernel.org, AJvYcCURZns9sVzSQNTJLjy5r5a+/KH/7ftkf3v0sUUVNjGRCPlJ49yi7vFqZSNRWBDrM0HYW7tnW8QIxJXj@vger.kernel.org, AJvYcCVvqRk98NtNiQBxup9+jr7aFzDZ5Lm6m9XF+8L7gnIkv0xd8Kcs8KESqUxXYnvaIhii31wg8kWT0e8w@vger.kernel.org
X-Gm-Message-State: AOJu0YyXybjJWq6aXmmjm7PtcDE5iSuIGkSFz/OcX5ldlv7Xs9dJuuPz
	SDoA82lZMSf8n+SwrEZdtfNp4kvT5v4miHSyZ3fXZpzEf2cI//CvvAsohndP
X-Google-Smtp-Source: AGHT+IFuv5zUEhaor/uGFFmP2r5OxhKjribmEkAhrQSABm9le2kuhEiluwLYezgLC2v+BmOyGohZkA==
X-Received: by 2002:a05:690c:16:b0:6d3:f283:8550 with SMTP id 00721157ae682-6e9d8b001dfmr332473067b3.28.1730832122542;
        Tue, 05 Nov 2024 10:42:02 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm23848947b3.15.2024.11.05.10.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 10:42:01 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11398927b3.3;
        Tue, 05 Nov 2024 10:42:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJWTtESAcXvX7VLE7+M+vgdOy634hj2Hvb/9e23nREttBOKavEIBAzAjt99SkwWrHXekGeDB9/wDkZ@vger.kernel.org, AJvYcCWUeBZK6BHThPkFbve5aJvSUPdQHW0cgQ7YXjgyg9G50HwUMSBk/IVn7exhefbOZzovzABgodBbPlaF@vger.kernel.org, AJvYcCXrFZ2w3nVGjDpiwZltfrMVx219MI2itIKc+sa+cFOOZi3W1c40UJKJS6ycheQtAf+kskvzSpjKA11ZP2A=@vger.kernel.org
X-Received: by 2002:a05:690c:4b8d:b0:6ea:7831:e436 with SMTP id
 00721157ae682-6ea7831ec21mr136922067b3.12.1730832121695; Tue, 05 Nov 2024
 10:42:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730326915.git.grantpeltier93@gmail.com>
 <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
 <CAL_JsqJqhxcMu2yeqvJvUOJ_g3uDv3t1JwaMxAfZQGXFj3rAvw@mail.gmail.com>
 <0f855c81-ce0e-41e8-ae08-5f653d3ca8b0@roeck-us.net> <CAL_JsqK=kgoKvusMMqdtx7b4z2aveE5O9Q=UHXCgook5UBS4bA@mail.gmail.com>
 <2afabeb7-9cf7-4092-965d-55a9c0762948@roeck-us.net> <20241105-imprecise-unharmed-ec1474ad1acc@spud>
In-Reply-To: <20241105-imprecise-unharmed-ec1474ad1acc@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 19:41:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUV5XfbTgJ+N=QgS7VVb2Ao5z6SY5hahHKfvUboH6f8Pw@mail.gmail.com>
Message-ID: <CAMuHMdUV5XfbTgJ+N=QgS7VVb2Ao5z6SY5hahHKfvUboH6f8Pw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Grant Peltier <grantpeltier93@gmail.com>, geert+renesas@glider.be, magnus.damm@gmail.com, 
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Tue, Nov 5, 2024 at 7:35=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
> On Tue, Nov 05, 2024 at 07:45:38AM -0800, Guenter Roeck wrote:
> > On 11/5/24 04:19, Rob Herring wrote:
> > > On Mon, Nov 4, 2024 at 7:20=E2=80=AFPM Guenter Roeck <linux@roeck-us.=
net> wrote:
> > > > Turns out it is also documented as "isil,isl68137" in trivial-devic=
es.yaml
> > > > (together with isil,isl69260). Both are referenced in .dts files. H=
ow should
> > > > that be handled ?
> > >
> > > Move those compatibles here. And this file should be renamed to
> > > isil,isl68137.yaml or some other actual compatible value.
> > >
> >
> > I guess that is a bit more complicated since Renesas acquired Intersil.
> > Is there a common guidance explaining how new compatibles should be def=
ined
> > in such situations ?
> >
> > Anyway, I had the patches queued in linux-next. I dropped them until
> > this is sorted out.
>
> The old ones with existing compatibles should keep their names, the new o=
nes
> should probably match whatever is in their datasheet so that people can
> have an easier time.

Renesas seems to have a document about that:
https://www.renesas.com/en/document/gde/intersil-part-code-nomenclature-gui=
de

But of course that doesn't help with the vendor prefix...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
