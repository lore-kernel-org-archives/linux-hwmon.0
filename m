Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88339C47083
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 12:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CAF6613BA
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 12:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhFBM2q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Jun 2021 08:28:46 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:58990 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbhFBM2q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Jun 2021 08:28:46 -0400
Received: from localhost (ip-78-45-210-72.net.upcbroadband.cz [78.45.210.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 5CD2F40006C;
        Wed,  2 Jun 2021 14:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622636822;
        bh=GZEbzmZQJc2iJLlq6S5ektwa0kg6aq8sGKSxC6P6LZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=UkvZxlIoiiSXY8WjOKxlKZN8UFy83SlY4BI4jA5tT5o2HYsw4eKouqufKZMOHwOae
         Eo5Y+AjAM6LoxmJCUmkZSS0zVSZoMBgWuJW3TUxRf2AtRF4gqk1iIYCUlsQ2j8h9/W
         5CZOl99i+pDJ2epIxrQDK01L92j+IfkPPK9hdrbK7nii8QLmIZBB+8UDgdEIuP62JV
         2uinXH0ZwZMyhEZiqWcKTTjsx6GgVNLXecxj8VeHyl1oKOX/1EX8XyGa0yYy4ulfnX
         jGIOdc4cXIttdtpP5bt54dU7ph8G/nM/BI9pboj1I/YSvUa9DVBazWt7tMTXAEAAyj
         s9ETImcxXGy4Q==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        <kubernat@cesnet.cz>
Subject: Re: [PATCH 1/7] hwmon: (max31790) Fix fan speed reporting for =?iso-8859-1?Q?fan7..12?=
Date:   Wed, 02 Jun 2021 14:27:01 +0200
MIME-Version: 1.0
Message-ID: <aac9fe15-f123-460c-8583-65f96103a1c6@cesnet.cz>
In-Reply-To: <20210526154022.3223012-2-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
 <20210526154022.3223012-2-linux@roeck-us.net>
Organization: CESNET
User-Agent: Trojita/unstable-2020-07-06; Qt/5.15.2; xcb; Linux; 
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On st=C5=99eda 26. kv=C4=9Btna 2021 17:40:16 CEST, Guenter Roeck wrote:
> Fans 7..12 do not have their own set of configuration registers.
> So far the code ignored that and read beyond the end of the configuration
> register range to get the tachometer period. This resulted in more or less
> random fan speed values for those fans.
>
> The datasheet is quite vague when it comes to defining the tachometer
> period for fans 7..12. Experiments confirm that the period is the same
> for both fans associated with a given set of configuration registers.
>
> Fixes: 54187ff9d766 ("hwmon: (max31790) Convert to use new=20
> hwmon registration API")
> Fixes: 195a4b4298a7 ("hwmon: Driver for Maxim MAX31790")
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

Cheers,
Jan
