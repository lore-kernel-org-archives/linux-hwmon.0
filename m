Return-Path: <SRS0=hA7Y=ST=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E81C282DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 17:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 478A3206B6
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 17:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="paLNZ0h7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731227AbfDQRqy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 17 Apr 2019 13:46:54 -0400
Received: from mta-01.yadro.com ([89.207.88.251]:39080 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbfDQRqx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Apr 2019 13:46:53 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 249B241908;
        Wed, 17 Apr 2019 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-type:content-type:in-reply-to:mime-version:user-agent
        :date:date:message-id:organization:from:from:references:subject
        :subject:received:received:received; s=mta-01; t=1555523204; x=
        1557337605; bh=5ck0o+lDCp9n42MjOWJmwXgXlqEkiX1Ls6lrr8qmEpI=; b=p
        aLNZ0h7MTUWH4JNgoUwyH8I0TTylFNyw3N+l4g+ng3jV0zfxtZwXhyTzSuZE2T5K
        U2MTouEeYTN1esPV1KYx3stEFzzlH+VhicwejcUzoAl+bRYHzi+w4B8m/0j8QNC4
        5yABUh86ZWOSweNLSQAp2pmds1P4HVzRLEFBJ5rgrA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zKlzMJte93Ap; Wed, 17 Apr 2019 20:46:44 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 8CBD6418FC;
        Wed, 17 Apr 2019 20:46:44 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 17
 Apr 2019 20:46:43 +0300
Subject: Re: [PATCH 1/1] hwmon (occ): Add temp sensor value check
To:     Guenter Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <openbmc@lists.ozlabs.org>,
        Alexander Soldatov <a.soldatov@yadro.com>,
        "Edward A . James" <eajames@us.ibm.com>,
        Joel Stanley <joel@jms.id.au>
References: <1555500396-11976-1-git-send-email-a.amelkin@yadro.com>
 <87cd75da-8d15-4b1f-47a2-cb55ed214df9@roeck-us.net>
From:   Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
Date:   Wed, 17 Apr 2019 20:46:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <87cd75da-8d15-4b1f-47a2-cb55ed214df9@roeck-us.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="Xg14fBko5y6wWKHg1cggrnGcuwBLf0c2V"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--Xg14fBko5y6wWKHg1cggrnGcuwBLf0c2V
Content-Type: multipart/mixed; boundary="osggnWIvSftauDqExjtY9gqfI4nJlMyoX";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, Alexander Soldatov <a.soldatov@yadro.com>,
 "Edward A . James" <eajames@us.ibm.com>, Joel Stanley <joel@jms.id.au>
Message-ID: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
Subject: Re: [PATCH 1/1] hwmon (occ): Add temp sensor value check
References: <1555500396-11976-1-git-send-email-a.amelkin@yadro.com>
 <87cd75da-8d15-4b1f-47a2-cb55ed214df9@roeck-us.net>
In-Reply-To: <87cd75da-8d15-4b1f-47a2-cb55ed214df9@roeck-us.net>

--osggnWIvSftauDqExjtY9gqfI4nJlMyoX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

17.04.2019 16:03, Guenter Roeck wrote:
> On 4/17/19 4:26 AM, Alexander Amelkin wrote:
>> Inspecting the OCC sources for P8 reveals that OCC may send
>> a special value 0xFFFF to indicate that a sensor read timeout
>> has occured, see
>>
> occurred

Yup. A typo. Will fix.

>
>> https://github.com/open-power/occ/blob/master_p8/src/occ/cmdh/cmdh_fsp=
_cmds.c#L395
>>
>> That situation wasn't handled in the driver. This patch adds invalid
>> temp value check for the sensor data format 1 and handles it the same
>> way as it is done for the format 2, where EREMOTEIO is reported for
>> this case.
>>
> ETIMEDOUT ? Though that is really a corner case, so I guess both are fi=
ne.

We just reused the error code used for the same case for format 2 in comm=
on.c:309 (inside occ_show_temp_2() function).

We thought it would be strange to report different codes for the same cas=
e in different format versions.

Besides, it's quite a remote I/O error indeed.

>
>> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
>> Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
>> Reviewed-by: Alexander Amelkin <a.amelkin@yadro.com>
>> Cc: Edward A. James <eajames@us.ibm.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> ---
>> =C2=A0 drivers/hwmon/occ/common.c | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
>> index 4679acb..825631c 100644
>> --- a/drivers/hwmon/occ/common.c
>> +++ b/drivers/hwmon/occ/common.c
>> @@ -235,6 +235,10 @@ static ssize_t occ_show_temp_1(struct device *dev=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D get_una=
ligned_be16(&temp->sensor_id);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 1:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If a sensor timed out l=
ong enough,
>
> "timed out" is sufficient. "timed out long enough" is difficult to unde=
rstand.
Agreed. That's a weird wording, but I double-checked before submitting th=
at it was just a copy-paste of the wording from the OCC sources for this =
case. You're probably right though that it's better to fix it.
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OCC retu=
rns 0xFFFF for that sensor.*/
>
> /*
> =C2=A0* This is how multi-line comments look like
> =C2=A0*/
>
> Please run checkpatch on your patches.

Mea culpa. Didn't check. Will fix tomorrow.

>
> Thanks,
> Guenter
>
Thanks.

With best regards,
Alexander Amelkin,
Leading BMC Software Engineer, YADRO
https://yadro.com




--osggnWIvSftauDqExjtY9gqfI4nJlMyoX--

--Xg14fBko5y6wWKHg1cggrnGcuwBLf0c2V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJct2aDAAoJEOiTWHtbdBeNIt8P/2jUYiU06wzZy1Tu+uWeIBzf
kCoB5iE5SeJP1JDOeWJa4EMpAoY0MIfzOqNT+RbakrGdwwOxikj9wlRbf/H5zr8i
y+kg39Pm4ypevexfERGDdvrirUVG42kcQgmh24XnBsn5a30A5vPR9ytyW3KcMxkg
21xrHdIVYS7nTJQkHaPGl8WgSjDcYh/6u9yhnT58h8akRkme0yXMLH4q4iUKYPYd
cbD+Agwu0vIQRn4XT+xQiyawDErFTPXNRGZ9cumVT18LjwYQ3netGDLSGyaIcIwq
xN7xsNBWKZAI9QCTjpVGvWmrCwAKG5LPak2DjFkqmNp0tQZjyf5a/fnQQCLwFJ01
JyEwcBWsj7fYgNwM8zHk1RRfW790L0N6aDaBpwuBWp/fW6n+1OFGdJon4BdOBMfj
zsyD6IWxtpOo0LYxRzCB+9w9By7mDk7u2zY17CGuAffeSMn28bIATSRdqKFBAKvk
Eu997nufRlZT46eMhXel8BWJs9BFA2RqTdJFTmBlH6/G7KUfooToSCpUCL8BG8Wg
VY1z7odE1zXUGu2Ft+ARL6S9c395Ku7xrFf1ZKC9K14eVHLZExA3UG1TxHTUWA/D
T+CKitvd65G2U07n+VdKeElRntAY2B8cJKczmQXJouSEP4uiMODfj/h+HphUpcHP
eMY3YNk2IG9CT5oD/Dit
=Auxs
-----END PGP SIGNATURE-----

--Xg14fBko5y6wWKHg1cggrnGcuwBLf0c2V--
