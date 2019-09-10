Return-Path: <SRS0=z2fx=XF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CA2C49ED7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Sep 2019 19:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8A552168B
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Sep 2019 19:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbfIJTMI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Sep 2019 15:12:08 -0400
Received: from sender4-op-o14.zoho.com ([136.143.188.14]:17417 "EHLO
        sender4-op-o14.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbfIJTMI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Sep 2019 15:12:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568142707; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=HrXsz7EXTnAX3ys8KSWoPaCe4IrMiqt/SLTwjwYNcu6kRrM7CSAv48IVDk3FU8yxfp9EhjybNDDRv6549RIITvPlhoBiyPydC0msEG6zgPb5oIEQwkTBoudaYh+gTs3XVx0OUbPIVAVC0+QBMpH8NLV+qVdIh+7V6/IEtDT4j28=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1568142707; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=2KixVFz3zUH3aRk89aBsxoD9j3vrNyhgobZ/pSZ76YI=; 
        b=cATRhGn9VLW0Wakh8YnTMTECkkBxHYlR5bCzHSr35/kbIBHkvuL/2ZxxduBc4Wg4ByGk4JKCllHFR+v2EvlrgCpiTK003jn5Dy4w+jKKxDbOYCRDtzSXvduY7w1MaTYBOPFO5tSdZPAOJcLZHuhyKYOV2FTcW6Y4wlH3ct1cPy0=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=dlrobertson.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie (pool-100-15-144-194.washdc.fios.verizon.net [100.15.144.194]) by mx.zohomail.com
        with SMTPS id 156814270601350.123367764763316; Tue, 10 Sep 2019 12:11:46 -0700 (PDT)
Date:   Tue, 10 Sep 2019 18:57:54 +0000
From:   Dan Robertson <dan@dlrobertson.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/2] hwmon: (shtc1) fix shtc1 and shtw1 id mask
Message-ID: <20190910185754.GA28430@nessie>
References: <20190905010130.15019-2-dan@dlrobertson.com>
 <20190905014554.21658-1-dan@dlrobertson.com>
 <20190905014554.21658-3-dan@dlrobertson.com>
 <20190910184352.GA29644@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20190910184352.GA29644@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Awesome. Thanks for the feedback!

Cheers,

Dan

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEF5dO2RaKc5C+SCJ9RcSmUsR+QqUFAl138jIACgkQRcSmUsR+
QqUvhRAAm0LWduTAAeuk0nNC+FYLCaJaODbCn2/6GgIs6hlYlCEnNk6CtXPvqn+Y
0vs9xZ2BFskp72Dwlnorg2oyQI35LYuZ+Yfgyih4f0UlId9FNgLoY2FFSovAcMVV
iRC8TqlNyN8wFOywSx02ABG88TDoSVxGkHPrfgfd1q2N5o2YoLuMCHAqho634Ip6
m657KyzBqndSfLdGJdNDzvcPnz5o+c5dn5FI/NydtvZCindvQBAd/DzRJ4Ca1cWx
xg4zpjmIbJ3VQDr10bEAyIICoK0oqnQMgM89Mn2rPMfypgMoju67y3Xd8KleyQnv
va3ZHEwtA6UgtsVY9WVNwPqIjBZdkeOGoFRgLLO/K3YuQy8Rwqz7FkKEJi1IHmIp
rXNEAivX3rPqsLr7c9GhN2B09CE5bWvoDMkpnEqHejlAsGRalKH5kVbYR440LKWd
GWsXnELUnCHlygZobVjvM/utHgkLcgXaYmxBB4r69YQuIn9UYYVb9XlPaebyeBFi
MiGOmdap73aN/FvORe2VjkHxpKS8te0lGP0KLYOkVX2oRoVA+iLP1ng9xzfQtqtn
KDDJWAF+QKI9aMJowuMocSqYgbBALXloZSalBe1/CCIdUYJUJv46esI5D7vLSGfB
v9Hsikhz7zYPBMipTTSsJ+BoSuSEu0G5L8kzIg40T7hDIuBR/pA=
=sbpi
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

