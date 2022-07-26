Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A44C00144
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jul 2022 21:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiGZVWF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jul 2022 17:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiGZVWE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jul 2022 17:22:04 -0400
Received: from mout.web.de (mout.web.de [217.72.192.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5152D2E9EE
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1658870517;
        bh=8wuuq69QnBbwa7EsYo4BTFLaZyWE/g0sgsuOTyYkSzY=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=HqyR86lUsi6owhmKWAE/bfY52XyGU0EDI/TWfi2h1Bvps3CosU9QuwCsajSnp8Vyy
         18tBVfaAA8beYpr47+h+FeRioegbVLXpBqt/Z2fjYfb1+mYGiQp1RKTht8DtBO2JzD
         R2oNFOmZDZxzfewVUYueLrNk8PznB3aCxqOju/1I=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from hydra ([84.154.253.178]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKdHC-1o24re25cK-00LDUT; Tue, 26
 Jul 2022 23:16:34 +0200
Date:   Tue, 26 Jul 2022 23:16:17 +0200
From:   Robert Schmidt <r-schmidt@web.de>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (nct6775) add ASUS TUF GAMING B550-PLUS WIFI II
Message-ID: <YuBZodZHOnDll5zy@hydra>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Provags-ID: V03:K1:vAjsY+3BDwOkCLhUDqOoeK7fN80CdXRhen3Vjo3qmXalH4leEVa
 lcI1SVcIFbLq3rW1cHwJEbXkIoBXsWhH5xex/gJsCbuHNKCNpDMnAcq5wek0vLtllZfVFp2
 cLXWGURTXnIMMN2bmwbtKVqdkEErKxF8mOEzr7rkowxwvyIcNYvnURyftTFN+Ytabio0Yot
 aJaTI8Ls0atY3/8cspKNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ausHQxPQ4VQ=:CbQ9EKp5/TZYUqaeePS/30
 zTc8EMVUVkh3lllBxGka9NJY3hfjbTRJo+OZ9bUdawpg1PdHP3dK9i5znm5j5k6dtaR6bAgJP
 zwiBF3mymXH+CvvcVhv7yerUwAPc/G5/yWbaE3eoM25mJkmJgDgrE/AsxBu8+rY6jktLZQFZ/
 1lInVQRazPzsaOzk7Z/Km+0u3gdl7dVdnEkBbifKlvfZecAj0NAUBJxfz1hV/TsuZoyM6xPQW
 iSAdVYRWCr861XaCxa9sRhvQmkBNKbEbJ95wsiI0u/+4hf1TE5Ck1iMrfVlG62yogKnwuqe2O
 XVvKvZrVkrKoajXNJVjvW66c431SNVEFphYIx+bBXcFpXS1DnxW4M/GcSkCUs4WeN+gv5S8a4
 c3PM0pjNswvn5wSysrPOReBP92YtZ1dHz6bF8UpL7Fxn8iU9s5H1U+f6rcdWTyNXd20lug4NS
 lOBw3NgR/85o4c8VrLE7HTsuk/nuQP8NGlnGSkBqRJwb7rhniWMnvyo0+ZZ6TBM3MnoBY2Gwk
 IumRo82LO6SWvJM8dtyUJ9vqIkFESHUza9p9n9vMJL8IMHt+AIbQca9MhtXCzWWRs2h5CeP+X
 N+ys6yogWU1zdZUXlWONJNMV0MxT+SPtsUnC4z0fQNbKtS6okrbbcNAmo6zW6cWLgEb2Gt3uY
 uumtUjOFaSKNBqE9/r0rPmmgY38NKHUAnFAkyy+WcgW7/p72uMKYSoaF+i059qrSZFsXfp17l
 GEPEoDS2Em5JAdHuHqzmkD/oxlvmdbeG/nb1W4i0t+E8inZLjSNcgDDhIuuPhoyzoDfFbK6OD
 HCUg8u71hrXwbsD0zcsactxUo95J1KcDFwJM5D+7gXT9lrAByGVAHRkQhrSDwnjcnEicli2Ke
 mqli59os8JjLBQ0dkhZ5YWsLNhIJA1xVx4+VY8L4BnC2WcMrdVfZL6sxC22KMELnf7q4hQvjb
 XbvpNRvFBmc7uYPlEfqH5d6SI6FWb9CQ4SwdGHzmPu7aFjYU3WJF701lq5MuSVfsnepzDoA2x
 7ZPWDQcaFfRVyPrj4I49tWgm9ggUjCi3QjIwG2Z6wHDQSlprefdEY7Um6pNQVXm5VKoD/KnXG
 bt2dV7a3lAmIdlpzvJ0dUfmypWa6KrsRLuVjjmBZdzgg58SyD1GrEMwcA==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add ASUS TUF GAMING B550-PLUS WIFI II to the WMI monitoring list
to enable support for HW monitoring on that board.

Signed-off-by: Robert Schmidt <r-schmidt@web.de>
=2D--
 drivers/hwmon/nct6775-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-plat=
form.c
index 6d46c9401898..adc9be817130 100644
=2D-- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1083,6 +1083,7 @@ static const char * const asus_wmi_boards[] =3D {
 	"TUF GAMING B550M-PLUS",
 	"TUF GAMING B550M-PLUS (WI-FI)",
 	"TUF GAMING B550-PLUS",
+	"TUF GAMING B550-PLUS WIFI II",
 	"TUF GAMING B550-PRO",
 	"TUF GAMING X570-PLUS",
 	"TUF GAMING X570-PLUS (WI-FI)",
=2D-
2.35.1

