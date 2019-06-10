Return-Path: <SRS0=Dm/l=UJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A45FC282DD
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Jun 2019 11:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7154206BB
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Jun 2019 11:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0AGAJKA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389356AbfFJLdm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Jun 2019 07:33:42 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:40820 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389491AbfFJLdm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Jun 2019 07:33:42 -0400
Received: by mail-it1-f193.google.com with SMTP id q14so11491239itc.5
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Jun 2019 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ZK2t632vgS5TB0NwOxJCymhWECRpYvSMa+UnWwm0568=;
        b=Q0AGAJKAzu5xcduRJBzNcl3reR5hrciEXbWx3YajsX9/qelyNznzzlUCheyq9oHAWk
         UjJDKcPik44+6td41YvnVz3MO8hESPzE07lfyoLlWtdcdqTkrKgLJmpsge0ZvOiTQDYp
         1IEEdTNqxfP4xRgEe0AtqmEO/VQlSZWd45bbYZJZZJstTlq9+dMh1kMpHAM936jtGwB/
         T2geeUvlHTAgrNKZX56fkjLRGGbPTaKYqjbQKelpG4ZJ/1XShnfwIYUjiHeYe7sY7pzr
         lsq63aTJY2ydDVu/JV0g+ttSZ1dw4C53kpVI3lUewmf59NXQTHq8D1G5ruxIkGU918sj
         OxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ZK2t632vgS5TB0NwOxJCymhWECRpYvSMa+UnWwm0568=;
        b=kkRIe4kzQHrRmQeIC7iIcen/yQcy5Orhi+1i3UdF9jelbYgdiDBr2tu+EYzJfwvP+0
         gDIqWCCGHLa1xadb/Iu5wOy6x3lL53vJfqi9KIpGVqMjbU2H09Bl/QQgar3+o5ru+HYL
         KeB0YHFC4eCT1/+7l6SF7j5YBJ1wJYke/9H+GhXbMoJ99d7BrdryYktjm1Jk1VdL1adh
         5HFooVvXWp+3Sv4klAENNYDjSqI3Bp1U0S5jeGthtTy9AMkh/8kKYIuYiwOYjfZbU02H
         hHALxJrT3OjBEnjcUxV4Bp0YxUp1ZILZlPanj9RCbMMR8b+krodBDXJUB7uIcW1xk3hH
         ItFw==
X-Gm-Message-State: APjAAAVRg5r6GqnWkUAJ5d1ZQrPLhbK8QxAEoEpGjcm72u2fb3kac9Jy
        0jtIPml3S/kjE02ochNPqvk4HHHWoTo=
X-Google-Smtp-Source: APXvYqyOsyD52wRTtoE46GKgoZN5Z4a7iWcymi3SpEqwD/3GbjnIqlLEGp3SxV8hwsVGfJKbE3NTEg==
X-Received: by 2002:a02:77d6:: with SMTP id g205mr14623082jac.13.1560166421563;
        Mon, 10 Jun 2019 04:33:41 -0700 (PDT)
Received: from ?IPv6:2605:8d80:5a0:5cb6:7047:4e9:e50b:c922? ([2605:8d80:5a0:5cb6:7047:4e9:e50b:c922])
        by smtp.gmail.com with ESMTPSA id u26sm3694077iol.1.2019.06.10.04.33.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 04:33:41 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2 04/10] hwmon: (max6650) Declare valid as boolean
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <1559928205-14030-4-git-send-email-linux@roeck-us.net>
Date:   Mon, 10 Jun 2019 07:33:39 -0400
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7EFD58F1-4603-41BA-B7BE-472EF3301F7C@gmail.com>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
 <1559928205-14030-4-git-send-email-linux@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

> On Jun 7, 2019, at 13:23, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> Declare valid as boolean to match its use case.
>=20
> Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: No change
>=20
> drivers/hwmon/max6650.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
> index caede4d3e21a..90565318aafb 100644
> --- a/drivers/hwmon/max6650.c
> +++ b/drivers/hwmon/max6650.c
> @@ -104,7 +104,7 @@ struct max6650_data {
> 	const struct attribute_group *groups[3];
> 	struct mutex update_lock;
> 	int nr_fans;
> -	char valid; /* zero until following fields are valid */
> +	bool valid; /* false until following fields are valid */

Is there some compiler configuration that ensures this non-explicitely =
initialized function variable will be zero'ed?

> 	unsigned long last_updated; /* in jiffies */
>=20
> 	/* register values */
> @@ -183,7 +183,7 @@ static struct max6650_data =
*max6650_update_device(struct device *dev)
> 							=
MAX6650_REG_ALARM);
>=20
> 		data->last_updated =3D jiffies;
> -		data->valid =3D 1;
> +		data->valid =3D true;
> 	}
>=20
> 	mutex_unlock(&data->update_lock);
> --=20
> 2.7.4
>=20

