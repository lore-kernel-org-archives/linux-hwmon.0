Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B9CC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 May 2022 14:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347589AbiEVO7J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 May 2022 10:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245431AbiEVO7H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 May 2022 10:59:07 -0400
Received: from smtpo62.interia.pl (smtpo62.interia.pl [217.74.67.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4748E2CE3C
        for <linux-hwmon@vger.kernel.org>; Sun, 22 May 2022 07:59:06 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Sun, 22 May 2022 16:59:03 +0200 (CEST)
Date:   Sun, 22 May 2022 16:59:00 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: Re: [PATCH 5/8] hwmon: (lm90) define maximum number of channels that
 are supported
Message-ID: <YopPtA631mX1UgpP@t480s.localdomain>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-6-sst@poczta.fm>
 <20220521023642.GA2890194@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521023642.GA2890194@roeck-us.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653231544;
        bh=lkEAOqHn49tSQFJ8mmuuwONyCBOh2vB/tAcuMusICyo=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=J5LgdXpRrofCIEPMILsub4QMYPOkn7l1QLCoA9e5fME034jt2biO+lsEZ80pIBgjW
         hi5T7dIhcGddwBR29lmuBqq3N51N5YpmJOogslFP9PvWeE7XcnmxjGGFHXobJ3dghr
         Fm08hOEVxWnPGT34rbCxIf5+UGwNCSVNHMzJg+/Y=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 20, 2022 19:36, Guenter Roeck wrote:
> On Fri, May 20, 2022 at 11:32:41AM +0200, Slawomir Stepien wrote:
> > From: Slawomir Stepien <slawomir.stepien@nokia.com>
> > 
> > Use this define in all the places where literal '3' was used in this
> > context.
> 
> The literal '3' does not always reflect the number of channels.

You caught me.
But besides this problem with struct hwmon_chip_info the '3' was used in context of
max number of channels.

> > 
> > Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> > ---
> >  drivers/hwmon/lm90.c | 29 ++++++++++++++++-------------
> >  1 file changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> > index 00fd5734f217..f642c6fd1641 100644
> > --- a/drivers/hwmon/lm90.c
> > +++ b/drivers/hwmon/lm90.c
> > @@ -93,6 +93,9 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/regulator/consumer.h>
> >  
> > +/* The maximum number of channels currently supported */
> > +#define MAX_CHANNELS 3
> 
> #define<space>NAME<tab>value

OK

> > +
> >  /*
> >   * Addresses to scan
> >   * Address is fully defined internally and cannot be changed except for
> > @@ -521,9 +524,9 @@ enum lm90_temp11_reg_index {
> >  struct lm90_data {
> >  	struct i2c_client *client;
> >  	struct device *hwmon_dev;
> > -	u32 channel_config[4];
> > +	u32 channel_config[MAX_CHANNELS + 1];
> >  	struct hwmon_channel_info temp_info;
> > -	const struct hwmon_channel_info *info[3];
> > +	const struct hwmon_channel_info *info[MAX_CHANNELS];
> 
> This is wrong.

Yes, sorry for that. I have not checked struct hwmon_chip_info description.

-- 
Slawomir Stepien
