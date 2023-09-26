Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67814E7E648
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Sep 2023 15:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbjIZP21 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Sep 2023 11:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbjIZP2Z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Sep 2023 11:28:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660A5127;
        Tue, 26 Sep 2023 08:28:18 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDD1C433C7;
        Tue, 26 Sep 2023 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695742098;
        bh=hSOEVOWea523UX/QfWwrg+we3FwfmY8yKPzRrMa/z+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hN1oBoDNZy6mYj3C8h3AHV7JtrkEr3E7FHxjaAQVQHkbZyp4CzkPh0qsI1tSf8QJv
         aSCQEjRhoceNgjng9c+9CA+R9XWApaM74QlmXjCfQJueJ9Y58jbL84eXcDU8gkqrEf
         FlZn67k0g3MFNVoiSXuOL+Fx9o60vdFJfoAz6pS0bsqIQXIwOTyCyCfXw+ePNGlQwV
         si4jWXqLi62JzR69X/TOTmgWsvxdoByvdDulJhm4ofTt58fLI47J981E3vEUEGf1Q6
         9h3/7A2cL4y/32X6x08js9dFo3vKsHVUn/G1nHktZgz+wKxOXvZuwBGoxR7+WQApSk
         mc83FHgPt0KKQ==
Date:   Tue, 26 Sep 2023 17:28:15 +0200
From:   Mark Brown <broonie@kernel.org>
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     zev@bewilderbeest.net, Liam Girdwood <lgirdwood@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4] regulator (max5970): Add hwmon support
Message-ID: <ZRL4j32syAhYVu0y@finisterre.sirena.org.uk>
References: <20230919054824.3368656-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="D7NHTPFU49baGh6R"
Content-Disposition: inline
In-Reply-To: <20230919054824.3368656-1-naresh.solanki@9elements.com>
X-Cookie: Save energy:  Drive a smaller shell.
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--D7NHTPFU49baGh6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 19, 2023 at 07:48:23AM +0200, Naresh Solanki wrote:
> Utilize the integrated 10-bit ADC in Max5970/Max5978 to enable voltage
> and current monitoring. This feature is seamlessly integrated through
> the hwmon subsystem.

Guenter, are you OK with the hwmon side of this?

--D7NHTPFU49baGh6R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUS+I4ACgkQJNaLcl1U
h9BzPQf/YzgBcer+Nsw83myWQLXtT0qP8jgd0C2x3Xa+imwR01JSdP+taPRlb95L
Qx7TISlXwFF2aG2wqgOJH8rbhDmBccwBdhh6pEA/nLZSx+PyGeNr6z3Ljmz3VE+6
FqOW9JNtGlD5kdcE1E8AKVIYFGY4T118hB6C8gbB40Q3lO6EiPilj/slsv2K2HZZ
0zeWOxbWRJPOnAFztMMELQ57MQhPBOQ7zFtKE3l1dCS+AN0XjSXqL9ThurrMTa2l
aIW9DXOvb41jOJf91dl99geafpJONONBRyi7N7Yid5uwQTUj+82MvJt1SXMxnceZ
ChOByu+d3l6z2Amfhh1M2cTBvQcUSw==
=ctRE
-----END PGP SIGNATURE-----

--D7NHTPFU49baGh6R--
