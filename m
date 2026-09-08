Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FAF381AE4
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849115; cv=pass; b=JVSwu+/NB4RQhw67J/Hs0nr84qbDT2xvVZ0UUI1NwwpZkSuyP3GIRkQvublNXE5K4ZkNhl9CJU8fH2LGZ25IqGaOF9y2OJpBwQsBc5J1GHjXAyz+TYiS7szB8289gFKCjguKT+Y7Vl9dq0b2B6eNRhAzprWZJ94DWCXbqEUau8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849115; c=relaxed/simple;
	bh=K1DnQZh7RTksEY/PnpmATjYf26gyDYwEwJXUsGJdA6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAiXAiPp9GY1Px/fMEFZ37OsEBnjaYU6iKpuF4abAnJytW/nyKh/j/UuTpmlWMuNxwlMD1w/M6jZ28zBhvMPto43NQImWrIhNt1ySmqF0UOGpdUHAejxlQHc92xxyf6/4n+hgEonE6H1JA/Zw0t5LXPRpqrvmvp2p2bID6vmOpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/oV6L8e; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/oV6L8e"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so1088527241.0
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Sep 2026 23:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788849113; cv=none;
        d=google.com; s=arc-20260327;
        b=oCDYAPGZpyk/wRf+V+xyLe1jBMkDSpwrzv0UMYEOExfcrUNJnhPUDSGOhNZTLosG9g
         sNARC4C5JWuddkZQFgMZJfa4Itdh+AKoLuZX1Lf4vtACqjqfjsgEbiYfVetIGc4ewkR7
         piOT2hZlSZUJc5FEnVcXzVTzzLtWTrYzVdTLJpqo9zHmHmEpxSdYKoPOqGlR7SMHEANT
         iXMzkVtyKOdZxkieDutkXnwCAICgSKC5JFgPY/VoTaTRmu8Hu4FdpR5vcSJBkh+TU+MR
         y3Gd+/6SOx/GPATRC+3g5qGlFUqstG8h3otmSlfZqEQy8Nfi02VGq/sqsYjXbbRH2oTO
         9jdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        fh=iCPd9qpQJwG1RKFb8C6V3G3jBXcP8lhg3hFjZzQ37/c=;
        b=VAxiZCz1WJNSICenypRpuMue6eJKS1IGoMXZc9fCXNgx4L9K1Ynz5raPePtpmqs7oj
         piL8yNsoWNGlZl6Pg8jFIjMrOw8DB4f8EVxpSgh7M9qqZcY3UJvgOwnhCQ+6oMtUdd7t
         i2l1mo7gQQYu3++vTvUmsRU2KyIRqyLfIuSFX/UQXwyE3bBZqT/1SCVyMhY4XDw2muft
         8OIWpz7jSWMq0Cewh85C7Rz167PhMKaVjRogdVJqOFGNHx+Qj/pgZLWz/xi33cmuRHMY
         iDDqTIj0+r7Ncn1xL4IE/hask+9L+kgfNEOOSL5lmYBId4IJU4T+WSMQaRRsL2xKtJRX
         JXSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788849113; x=1789453913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        b=E/oV6L8e1aiLfGoBq7YwMle5u91Ur4uTXXkB72MF4JI6VtnAYx6NITO/tu2PmL5Uf4
         +TerQDVMNv53kBymdWmftUuluJhkxtzfEWKq6zxVqMcBiIHa9xksCuoZ3nV7PUlgoEzQ
         0qmuVsm/ZlFjkwonIKMPC/m5uL+NCOMSrD+y3K62v4JIFX0UD7l8ijoZ1IiwI0ZptScS
         DqaYol1xgwnx+9eHMtOyxlDf7MMfqImxU1L9dWFhvIFgVJ/yAvjzN8P1kHy0XHYI9zKu
         9SPBUP5E6NIjDjVz3QIfjCzVS1km7LdAfHE9uOFpVDCEscvz0PuweOQyL5uKVexOjP3c
         24IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849113; x=1789453913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        b=jpxDFcJFbYU2SbUlAbl5RzXKCoRS4naqdWybZlpUg3Yk9aGt4iwdOspXuUSJ22Pngo
         SQzbbuVD88O3d68aXxBh+NjuZ7SfGtK0Y+N0b15ozxxNulvsZ24ykTX9euNkNl1lHD9N
         Tich+kVwrQYE0jNkX8yrouimbcwujD8HYY0uAgQAYC1kxZGwgCYulwHno+bvBBZMPOzW
         1IWxc6bY0QP61YWZXbbpHqJYkbbsx/6l06tsocJ5swoZgO7HYFyciVrSdKq2iN7QpBfk
         7077Cl3H41yWsgkq5ybTD1ufpvhZjMg2/XukiwrPgAwEziy+6/nN7hC6Wkm+ULJEC0lB
         KeTg==
X-Forwarded-Encrypted: i=1; AKwUvBw+wmjAmzUslAwU6ORU8RNH/xrpfjvdC9mihGaPjqD4NaDQUkIhA2ToupGxKnzXAu/Ukr/YMKUd5OIbew==@vger.kernel.org
X-Gm-Message-State: AFuF++krTFfZMxhrgEPEYmDMrZ8d8mqXa8Jp8iMlcxz7rpXrMq9wj6lD
	BY6xBisGln3xyxz+VKeEu7Mkk6LNxftDbF37MW94Bt+UUMqVaI5a8ejz391rJtx7Sw+LLX3Pw1B
	1+t1bzxAdyze4TLS2dTvJJMlitPprDEM=
X-Gm-Gg: AYBFou2oxK1tXGEzeyI4rbPabo21t1YXpVXKz3awyVTJJC8oHy7LPviVAI7DtcvrvFH
	1fVhwvb53+VjQZ47SGGfYhc3vdGzhFyL9VZPwrw4HluqHnntkgZA8g/Wqr283uZP2gqySyd4L+o
	jowixx9ZDpppW1FcwVu2uKo5S4ncj9z26LcdjOKVAjfQzenBunCcS8feJv4WSqHf3GGnp67vs22
	g1M/v01C4ucEvBcUvLEB1qw4lPO6B6LN0WWogSITsbOWvzfM4OSX6CpWY9yz1W+EScTV57RNiZY
	iEIgd8uPHQRT7NnHBfcR4FebAHEiEDRPKW++pHWjBtnYkNk=
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr9190993137.9.1788849112904; Mon, 07 Sep 2026
 23:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com> <20260907-chimp-pectin-20f4ea3b772c@spud>
In-Reply-To: <20260907-chimp-pectin-20f4ea3b772c@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 8 Sep 2026 14:31:40 +0800
X-Gm-Features: AcwNN1VlTv2SntxcoxVK5N-Ex2mESc274Ua-5DjlQCs8MlAthNoLCriEU_XA3R8
Message-ID: <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add Device Tree compatible strings for Renesas RAA229639 and
> > RAA229640 PMBus devices.
>
> Driver change suggests fallback compatibles could be used.
> Why aren't they? If they can be, add them. Otherwise, explain why not in
> your commit message.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Hi Conor
  Thanks for the review.

  I didn't add a fallback compatible because I only have document for
RAA229639 and RAA229640
  and could not verify full DT level compatibility with any existing
supported devices. While both devices
  are handled by the existing raa_dmpvr2_2rail driver variant, I don't
have sufficient information to establish
  a compatible fallback relationship.

  I will clarify this in commit message in v2.

Thanks.
Colin
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 +=
+
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl6813=
7.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > index 8216cdf758d8..3537c7ddfb09 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > @@ -60,6 +60,8 @@ properties:
> >            - renesas,raa229001
> >            - renesas,raa229004
> >            - renesas,raa229621
> > +          - renesas,raa229639
> > +          - renesas,raa229640
> >
> >        - items:
> >            - enum:
> >
> > --
> > 2.34.1
> >
