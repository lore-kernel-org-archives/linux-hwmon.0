Return-Path: <SRS0=20hN=X7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA58C10F14
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Oct 2019 15:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6659C2173B
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Oct 2019 15:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgCQrz/8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfJFPMo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Oct 2019 11:12:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33328 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727058AbfJFPMk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 Oct 2019 11:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570374758;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ayjqkd+6F5tmm8AS54Re2o3Pyp4pTiT6+zdlOJcfMbk=;
        b=OgCQrz/8idZ4gcgJItTJwII7/1uCrDMs7+fXLhqnCuNS6gbzxL1asRt6VREIP+4zpdNrvw
        33dsq8D1g84c+xHrZBBlkVYN/o+L/yeomy5P+fsedSn/J6xvuiZRxR1lQDpg/DXUYH0+d9
        rcALpOHMoCWQbMma9zEdl9414r3CRdA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-xg9Twwd8PdWR1HjeRYFIKA-1; Sun, 06 Oct 2019 11:12:34 -0400
Received: by mail-ed1-f70.google.com with SMTP id w12so7338925eda.6
        for <linux-hwmon@vger.kernel.org>; Sun, 06 Oct 2019 08:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BuDpUhvI7aRpTgMipmKvy1072necfiHV1oVcWtdfdWk=;
        b=SPtnBlAgc4BICgMxzKGduV/cjwP3RjApGv6w2Kd2yRF+Sz2hbjDhBLXPCo+Lrv3nY2
         QccljuJJgb6fadzNFWWcOODaf7re6Ep7x9egbC40+2KzH1FacyRfzwaAWcMpVE32g45K
         WBCVSPAWm1KjpMmTPK9gmBgphKQzSWuvIUxDLD7mVP+czOeM8poTPHsNLn3EUAUPA8b8
         9k5IuwQNbmD9LYW4I8uBKy03Hvj2kI2WpTplsenG9oKnXPftgF9vnuRUBpQquVN1i6Bk
         9w04HcKIHnZAF+2xaCprRL9vac5v+zyTrSP/EIzOvN/3McPdPj+OOpSO8QPaTCr6ZStD
         whNA==
X-Gm-Message-State: APjAAAUKIsE54oXJFsHvfsDxZ2VudfUbDLzYsExCkuk/GtECQdNAH/85
        LYvZPtAduAByXVc/p+FGML137PCLpVx6Lb/7+s8qjcKVI/ELtaIS5QIx3tF9OXG6o9IQirmdcQB
        RdX2vUatiOrcY4Us7yjKBWZk=
X-Received: by 2002:a50:d5c5:: with SMTP id g5mr25262076edj.57.1570374753788;
        Sun, 06 Oct 2019 08:12:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8xuAN6JoJIhDgzdot8v327ojmhlD04wuzq2pbA3tEuFPmtIbMqOD0YWQ9GkC5Sgd5GtB9dw==
X-Received: by 2002:a50:d5c5:: with SMTP id g5mr25262061edj.57.1570374753598;
        Sun, 06 Oct 2019 08:12:33 -0700 (PDT)
Received: from localhost.localdomain ([109.38.129.160])
        by smtp.gmail.com with ESMTPSA id n10sm168731ejr.82.2019.10.06.08.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2019 08:12:32 -0700 (PDT)
Subject: Re: [PATCH] hwmon: abituguru: make array probe_order static, makes
 object smaller
To:     Colin King <colin.king@canonical.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191006145231.24022-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1f7b29da-27f4-8dbb-c18b-e6cdc094d1dc@redhat.com>
Date:   Sun, 6 Oct 2019 17:12:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191006145231.24022-1-colin.king@canonical.com>
Content-Language: en-US
X-MC-Unique: xg9Twwd8PdWR1HjeRYFIKA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 10/6/19 4:52 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Don't populate the array probe_order on the stack but instead make it
> static. Makes the object code smaller by 94 bytes.
>=20
> Before:
>     text=09   data=09    bss=09    dec=09    hex=09filename
>    41473=09  13448=09    320=09  55241=09   d7c9=09drivers/hwmon/abitugur=
u.o
>=20
> After:
>     text=09   data=09    bss=09    dec=09    hex=09filename
>    41315=09  13512=09    320=09  55147=09   d76b=09drivers/hwmon/abitugur=
u.o
>=20
> (gcc version 9.2.1, amd64)
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/hwmon/abituguru.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
> index a5cf6b2a6e49..681f0623868f 100644
> --- a/drivers/hwmon/abituguru.c
> +++ b/drivers/hwmon/abituguru.c
> @@ -1264,7 +1264,7 @@ static int abituguru_probe(struct platform_device *=
pdev)
>   =09 * El weirdo probe order, to keep the sysfs order identical to the
>   =09 * BIOS and window-appliction listing order.
>   =09 */
> -=09const u8 probe_order[ABIT_UGURU_MAX_BANK1_SENSORS] =3D {
> +=09static const u8 probe_order[ABIT_UGURU_MAX_BANK1_SENSORS] =3D {
>   =09=090x00, 0x01, 0x03, 0x04, 0x0A, 0x08, 0x0E, 0x02,
>   =09=090x09, 0x06, 0x05, 0x0B, 0x0F, 0x0D, 0x07, 0x0C };
>  =20
>=20

