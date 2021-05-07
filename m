Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3727DC43460
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EEBB613ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhEGVZp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 17:25:45 -0400
Received: from mout.gmx.net ([212.227.15.18]:43551 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhEGVZp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 17:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620422669;
        bh=YJ8cNBerAjDCcGPEFV4x35/XKy0GtDDhKMbVKjU4Sdg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Liu+9iafeC3EyEyfTjoIDHU44TNhbh4admo6akDH/oQVm/dvo8V11Jx/rpkzVdyUQ
         qOJbR422KDMJJA4vN5GrWlZtumhKpkI+gRlShdh4jBpwZShleLojSfKc6u1+JXDKNU
         Iq/vx4kKOy3jY9EzX14+7F3NArcUpCz0n8G6Got4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.209.175]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mlw7V-1lEptm1Vbv-00j1bH; Fri, 07 May 2021 23:24:29 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH 2/4] hwmon: (sch56xx-common) Use strscpy
Date:   Fri,  7 May 2021 23:24:02 +0200
Message-Id: <20210507212404.6781-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210507212404.6781-1-W_Armin@gmx.de>
References: <20210507212404.6781-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WLQk0VeuNWd9kknB2Dgx4QXxRrk7+LtKA5w2Jwfbx0yvPbeqgLy
 qBbDhIIzdo0VmtJSQ2E/lbO4fVAk2SNz1EG1/qUYWGAIH3utofPn0sOPjIGtr7SiBQNK+uA
 t4mXsV7t8aHVt/I1OsmFtTcdHPcBJhQ2FW3Fv1qjraQRfvWvmqOyX7vTLuP0wbQs1X9hVB5
 yvVuX9ERA9i7OeeEEWXZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xDjfMRsDwPc=:Yl4+Ya14DwoKMkyBwnxnAh
 sT7+j1uW+u4O6e/sTbqNAjwqKMFXHX+tU2CiDbm0wacl8aIdhi1gZVGj98U2z4iR8R7N12T69
 h2y+eQ7CkuA95AOA1km73FGoFp97HN884D1qYVL2MSMLV5Z36X1zNfdV1jC9sjuAJLHrjt6Ye
 QNZBMZaJdCx5zUuwmOMvQMuvs5on+WKPTfoFNBLl51VfC7xSp3EDZ0Pvo+JgOXgPSPoq+IySW
 a6ifMdlIVNz+vc/9sJu5bvxH7c9bDKJF9zS6aNJcoj2yV596uVcMMuen93dEADYA3YpVRJjja
 kzhj1g/QippleaG3GdBucH1dq454Dyfw1DxBw83o7eFAvVkSjumcW7P2SXOZu3xoyLccGSmaK
 +mVt2909lUA92Do1qwMyNAObGjewJG7RpXkIFgP/VAMa+bwVKay9m0d/7sMPnb+pMdOmyRmnA
 F6Ojkl2ImCjLpbvj+aKe/4439rbmRHR70BJVB7YO1RH9Yhg5joYCiU8ubwj4xY7Mb/GoTvOX5
 kmUrv3KOBXNhC5f+IEuU/+WtOZfQCtcDyNYEX6SiG3Z+tfD5NxWo5a+/8J57F/sffTmFL7a5B
 qTd37+7lwrl+jbiI8GSnNssUezJslmLao544oUb4zJxRfsKmV5womD9utgLxi9d+NS0FXdCaE
 DajBgsi8DMbeNt1/tnyXwOwypEIZVL2BgLfvlb66F+bAawjGks8ahf9G5qTGCH3D1YNMoUaBR
 n0EFpDiOs8QKCTP894VhW4uW6XxJ6uG9pvckFEwNQTiZo3ks4Lz/Yqx1WHQjIZotJtz6H8OfP
 dAIzKkllKO25326S66HflM0pX8BRXQHo0iXZlWu1mjXfQJcOBqtjwwM0yzPTCR0hhsi+GH1+2
 x4llkmw40VRZAZLZZ6+vZ+PzW3uR3DDhtpSKIrwH7ZJjc0XcFq0njuleOyYTTZHmjDUZAiSBG
 StaW3wFYRZT1SxNm7gQPgb5si02x5GhP1ySB79PxVL1OY6a6U5abW8iQkNcCH4K1VUY/N93Bs
 YJC7PpN2A3ioufGWZCFZEXqXy/wyHnv6H3TLcvyhFAp5Tt89MKANTwwHwb0bXPOrql+RejUvs
 MWUL8B2KHdb9922apc62qsO+LC4g0Z2C0NGbB+q71Nj0oe+GHqT1xUEF/J4DlYHBysdk13NLT
 Q7/3gZo3p/CsYl8YGcgkJIEFOW4boA+I4LrkSbNFdYXzHDrHgC2AeSb6Nt/cL8LPplV7o=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

strlcpy is considered deprecated.
Replace it with strscpy.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch56xx-common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common=
.c
index 9c884fd0beb2..2d7bf017b2df 100644
=2D-- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -408,8 +408,7 @@ struct sch56xx_watchdog_data *sch56xx_watchdog_registe=
r(struct device *parent,
 	data->addr =3D addr;
 	data->io_lock =3D io_lock;

-	strlcpy(data->wdinfo.identity, "sch56xx watchdog",
-		sizeof(data->wdinfo.identity));
+	strscpy(data->wdinfo.identity, "sch56xx watchdog", sizeof(data->wdinfo.i=
dentity));
 	data->wdinfo.firmware_version =3D revision;
 	data->wdinfo.options =3D WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT;
 	if (!nowayout)
=2D-
2.20.1

