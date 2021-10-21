Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EC4C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF029611CE
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJUSo5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:44:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:42314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhJUSo4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 14:44:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DC336120C;
        Thu, 21 Oct 2021 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634841760;
        bh=mWq+HNH7jhpFw0qyayM/Tf8vgynZGUVPL3JRK4UbEI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bnuu7kdt/lgdlkGrQ5AETr3KB7LCTbR5YXo2uRkM/eAu8rcfttFSgiCIf+1FY20vQ
         bdkQ1iatXXEDbQ5PiDe/4/n9Rmdk1JrJhQkOpWs2h8tzVfIJhrGr6yJokU02mdNGDt
         wGYuRM2ClaoFqnxKzuBizvW2HKQE0voQzhKl27dsVerr6GBijpRYBQbFemq3YdlUfl
         jz2YUQy/dxcB+vo1CKRoYF9k5tNPXAi7TCYCvreKTs7It8O4GSp0R9l+ftDrgR5fKp
         HZalfMbCSwGAjSWwfNQqSaDYuG8JGdbj8hNVdKtX31G61Y0I1yFmXvvAkpSZNckBgS
         dlQk99zRo0jRQ==
Received: by pali.im (Postfix)
        id EE54D85E; Thu, 21 Oct 2021 20:42:37 +0200 (CEST)
Date:   Thu, 21 Oct 2021 20:42:37 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (dell-smm) Add Dell Inspiron 3505 config data
Message-ID: <20211021184237.ysvhawhmpw3vnsa2@pali>
References: <20211021175447.5380-1-W_Armin@gmx.de>
 <20211021175447.5380-5-W_Armin@gmx.de>
 <20211021180521.a5l2shvor4qwesfe@pali>
 <02f9b445-cc5d-0699-7bac-cbd28d1ea35f@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02f9b445-cc5d-0699-7bac-cbd28d1ea35f@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 21 October 2021 20:36:16 Armin Wolf wrote:
> Am 21.10.21 um 20:05 schrieb Pali Rohár:
> > On Thursday 21 October 2021 19:54:46 W_Armin@gmx.de wrote:
> > > From: Armin Wolf <W_Armin@gmx.de>
> > > 
> > > After checking the fan speeds reported with the
> > > Dell Diag UEFI ROM, its safe to permanently
> > > set fan_max to I8K_FAN_HIGH and fan_mult
> > > to 1 for the Dell Inspiron 3505.
> > > 
> > > Tested on a Dell Inspiron 3505.
> > Hello! Are there any issues without this change on Dell Inspiron 3505?
> > Because i8k_config_data[] array is there for machines which need some
> > hooks and do not work correctly (e.g. allowing to use I8K_FAN_TURBO).
> The Inspiron 3505 works fine without this change. If i8k_config_data[]
> is only there for applying
> device specific quirks, then this change can be removed.

In past when autodetection of fan_mult started working, I removed
machines which was tested that do not need hook entry anymore.

We really do not need special entry for every possible Dell machine on
the world in this table.

Hm... Maybe some comment for this array could be add to express why it
is there or why entries here are needed...

> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   drivers/hwmon/dell-smm-hwmon.c | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > > index 5f0338b4a717..2579dd646b20 100644
> > > --- a/drivers/hwmon/dell-smm-hwmon.c
> > > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > > @@ -990,6 +990,7 @@ struct i8k_config_data {
> > >   };
> > > 
> > >   enum i8k_configs {
> > > +	DELL_INSPIRON_3505,
> > >   	DELL_LATITUDE_D520,
> > >   	DELL_PRECISION_490,
> > >   	DELL_STUDIO,
> > > @@ -997,6 +998,10 @@ enum i8k_configs {
> > >   };
> > > 
> > >   static const struct i8k_config_data i8k_config_data[] __initconst = {
> > > +	[DELL_INSPIRON_3505] = {
> > > +		.fan_mult = 1,
> > > +		.fan_max = I8K_FAN_HIGH,
> > > +	},
> > >   	[DELL_LATITUDE_D520] = {
> > >   		.fan_mult = 1,
> > >   		.fan_max = I8K_FAN_TURBO,
> > > @@ -1030,6 +1035,14 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
> > >   			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude"),
> > >   		},
> > >   	},
> > > +	{
> > > +		.ident = "Dell Inspiron 3505",
> > > +		.matches = {
> > > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > > +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 3505"),
> > > +		},
> > > +		.driver_data = (void *)&i8k_config_data[DELL_INSPIRON_3505],
> > > +	},
> > >   	{
> > >   		.ident = "Dell Inspiron 2",
> > >   		.matches = {
> > > --
> > > 2.20.1
> > > 
> 
