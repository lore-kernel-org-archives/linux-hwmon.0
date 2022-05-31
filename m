Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7282EC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 May 2022 07:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbiEaH1B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 May 2022 03:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242971AbiEaH07 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 May 2022 03:26:59 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BBCFD12
        for <linux-hwmon@vger.kernel.org>; Tue, 31 May 2022 00:26:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2964521B17;
        Tue, 31 May 2022 07:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1653982012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SsdhK0fO8xQDufAj1jAx2Hj9NS5X3yuQXuy9TjbjM9o=;
        b=t2hDRfu/wiYIMo2LiQI1jV1qbbnohPA/2yB0Fhy4wA7HYwdqSF0X2LcXv/RvtDwYynptpJ
        dZ44GDgdzCoovw92rPOEU/SNbKvw/StGRJ4tsrPZxSDKWbFRxXbQuejuuc+D2Ry8yKirPC
        qcHyloOmc2itQXb4Z79vX7nnjgLjJ+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1653982012;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SsdhK0fO8xQDufAj1jAx2Hj9NS5X3yuQXuy9TjbjM9o=;
        b=EAqX0eKHv7cSYuCJ5ORjtQCVyEHRqV7Z6I+ddm4hLnAl4T9tRHr5aCgr6sPlU0FwTG0HWX
        7KdmQBgJg9q1igCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1640132F9;
        Tue, 31 May 2022 07:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +zdFOTvDlWLfUQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 31 May 2022 07:26:51 +0000
Date:   Tue, 31 May 2022 09:26:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: Allow to compile ASB100 and FSCHMD on !X86
Message-ID: <20220531092650.07e543cb@endymion.delvare>
In-Reply-To: <20220527153445.1871086-1-u.kleine-koenig@pengutronix.de>
References: <20220527153445.1871086-1-u.kleine-koenig@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 27 May 2022 17:34:45 +0200, Uwe Kleine-K=C3=B6nig wrote:
> The two drivers compile just fine on ARCH=3Darm. Allow to select
> these drivers if COMPILE_TEST is enabled.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/hwmon/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index f2b038fa3b84..ccd0df5e6b5e 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -378,7 +378,7 @@ config SENSORS_ARM_SCPI
> =20
>  config SENSORS_ASB100
>  	tristate "Asus ASB100 Bach"
> -	depends on X86 && I2C
> +	depends on (X86 || COMPILE_TEST) && I2C
>  	select HWMON_VID
>  	help
>  	  If you say yes here you get support for the ASB100 Bach sensor
> @@ -621,7 +621,7 @@ config SENSORS_MC13783_ADC
> =20
>  config SENSORS_FSCHMD
>  	tristate "Fujitsu Siemens Computers sensor chips"
> -	depends on X86 && I2C
> +	depends on (X86 || COMPILE_TEST) && I2C
>  	help
>  	  If you say yes here you get support for the following Fujitsu
>  	  Siemens Computers (FSC) sensor chips: Poseidon, Scylla, Hermes,
>=20
> base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f

Reviewed-by: Jean Delvare <jdelvare@suse.de>

--=20
Jean Delvare
SUSE L3 Support
