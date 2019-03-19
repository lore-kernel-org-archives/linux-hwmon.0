Return-Path: <SRS0=Q+NP=RW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69F0C43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 15:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7ADAA20850
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 15:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9gKpajK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfCSPON (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Mar 2019 11:14:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53258 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfCSPON (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Mar 2019 11:14:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id e74so17179224wmg.3;
        Tue, 19 Mar 2019 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KfdZtfalOYr2DxGxAC8Zik0XE9qaSgIgDrtajlp8Mwk=;
        b=U9gKpajKLQTXw3CGRH8eCEHdU3yD/BT4yhpU1e1wWlBnbpL0o1oZ+CBa2RQDGjL+zp
         VzXOzIWxYwI0Bg/mdmaUZkdiT6AXoVP1rp/AdhExJVelk5H6eU08qjQq9ojfPQ7FZ2NK
         0ZSzi61qgtPP00N6iSFFImgI2k4FlFIL75WakVLgqpoWRooR2kxyyUyTjvEYUlDs72SE
         unoGAEa7XUGMR3Cp6y/mZJwj2LaVAQva6eNgHxwX7ZGKBQyq3YX5xpf8O1O/u6zJHCrp
         hHnE/co3IIa0YLr1KsstpOAmEYg+qoGpcRo0xgfU5fmmdblYNMHPtxRNzlkAW4/Xmy/B
         J10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KfdZtfalOYr2DxGxAC8Zik0XE9qaSgIgDrtajlp8Mwk=;
        b=Vr/BP9pdkpeIztBT1U6flukSIShvpLLe5+xd2lE/zS8DgelGQfpUyijfY7aXaiXx/W
         qOhxjw4tkNUEnqiwMGa3H9DLgLa755Hl0aqymfhRQyVQ5kEk8TJd02Pdfbh72d+emsPW
         efDGZLf+jIt3ayLFftVgTgRKkR3Tz7wMpqyr/I0ofSOt2MeFq6fOQXP/w5xkp9sN0C9x
         uzbTSEOLZf/KWJPQmEQSxgoNZlS2ruHku+xwg6TCidGBDQBy179fRaA+HIphLzTIBxwq
         T6RIkwnq/k4y/72dnk8T6Whn1Wyv9jJ0XnFlKmm8JPir3+Gc9ACF2HXa46bMaQ6Ji4j4
         un4Q==
X-Gm-Message-State: APjAAAVw9Gg3kCN1TjPI/avIsettmLyRUF2UoOMavRcrTYI8tC9lZ4m2
        VOg15JTVlYvWhu7LXGXPTeE=
X-Google-Smtp-Source: APXvYqxYFWOOFGHtEJc8GpRsDIFrbgyh/0kF0UtrWTVD7M4db/Q8tX08DM8hsF3qfucA5veWfWiWYg==
X-Received: by 2002:a7b:cb8e:: with SMTP id m14mr3802466wmi.64.1553008450413;
        Tue, 19 Mar 2019 08:14:10 -0700 (PDT)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id p12sm9023218wrx.50.2019.03.19.08.14.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 08:14:09 -0700 (PDT)
Date:   Tue, 19 Mar 2019 16:14:07 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     linux@roeck-us.net, jdelvare@suse.com, kgene@kernel.org,
        krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        jonathanh@nvidia.com, heiko@sntech.de, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon (pwm-fan) Remove dead
 "cooling-*-state" properties
Message-ID: <20190319151407.GA30117@ulmo>
References: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 02:54:04PM +0000, Robin Murphy wrote:
> The old "cooling-{min,max}-state" properties for thermal bindings were
> ratified to "cooling-{min,max}-level" by commit eb168b70dea5 ("of:
> thermal: Fix inconsitency between cooling-*-state and cooling-*-level"),
> which were later removed entirely by commit e04907dbc259 ("dt-bindings:
> thermal: Remove "cooling-{min|max}-level" properties").
>=20
> The pwm-fan binding, however, was apparently in-flight in parallel with
> that ratification, and so managed to introduce an example of the old
> properties which escaped the scope of the later cleanup and has thus
> continued to be dutifully copied for new boards despite being useless.
> Clean up these remaining undocumented anachronisms to minimise any
> further confusion.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>=20
> Presented as one big hwmon patch for simplicity, but the DT changes
> can quite easily be broken out by platform if maintainers prefer.
>=20
> Robin.
>=20
>  Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 2 --
>  arch/arm/boot/dts/exynos4412-odroidu3.dts           | 2 --
>  arch/arm/boot/dts/exynos5410-odroidxu.dts           | 2 --
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi  | 2 --
>  arch/arm/boot/dts/imx6qdl-emcon.dtsi                | 2 --
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 2 --

Acked-by: Thierry Reding <treding@nvidia.com>

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyRBzwACgkQ3SOs138+
s6FiOA/7BkzGBW7hWW2KtXIWUMWewb3SleBXsp/dx7l2U0rsm77sHX9lHnWCfAxE
fSkK6n+ND8WLb4Yqy4B/ZF1JDQ5PXW3OLhjZUymh3re0hdEN7c0GCeN6Byyu7WJt
IT0tMp5eS6jRxdOYa2AYYs2goG0DAb//TN3Fa4gXb327uNyjApiHKCgM8c1h1yxv
lU57rksIdG3Q/JfovZrNvqHQD4/CxG4szOXpFmLpBCBHG8cTL9Q5DbKgeLQGspqB
dmIIXg8xoVxTm20PgSDneSkkNuAXV0FykBqbrbeDDeV8QCli0e/YCAYEjLN9MCIi
3jEt+oxVaHDgGaYsGzExDx/i1JmNV4ZnVcHPWcTKoUB1Cw+m95gBYF/T8mdMA4kc
CX7Ifbb/15Dw3HlVEquOtXILdNHdv2zJ7/4uQStf22J+ilQDqA86gjynEYF0VSQY
EYSUmTPBoQCEd79W/pBG6pMIihhcLC1sQ55rFkL9lt42ZSZWF7Y6t3aA5SjmLUdB
Kx79+1pkA/XyiQSc6njs8lzm30Rr9I43ShYJsfwVLqeosGM5ahZqD0fvr+Ixo6AU
kLVoT2AKNkN6YOja9znodLUNLA9GfNGBdzuDs4HKxA4nPBtqw7NokLSRYFNjbpyo
Z6oIa9cbLjGpeBskG3xSH7/OYixfQB7yXdjTWj2+QdjWdhqwCyY=
=GdJ9
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
