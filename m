Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911C6EE14A1
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Sep 2023 15:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241735AbjIFPAF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Sep 2023 11:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbjIFPAF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Sep 2023 11:00:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE98BE49;
        Wed,  6 Sep 2023 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694012401; x=1725548401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K0zzGgMQikPv3yIIAmBS05foEO0ENZKMi/sYapbhWsQ=;
  b=IzbPYnC2DOZt+bINe1PiqicwDBdu8siLzLBD1VdjN3XouSZESZT/rUuk
   lAjUY7bt5eTjms0aoBuwYmvCvpvYj8z/L/Y0aeAW0HytuTcZfL7YcVTN2
   Eo0TXrZtzSkpvxhZ+zSz12GYd8v/8W7lIEp5jO6P6nGGqE7Gmk8ii5lMo
   Sl/4YbrNuCvU8ssJh+Au8XUtR9YlDm+PYHVPHvmT8uAdgZrb9oiAeasH3
   unmkXgXE+RBuZCa1yzH88M8TcH4OcU9UtS7OPRikaGgobWdh6LsLDyUFI
   C212Cbu13Ju5aMJJuVelYVXq362to/CpL+ClY1mfvyFZ+ol5dTo/3mbi0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367312076"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="367312076"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 08:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072412683"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="1072412683"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:59:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qdu0Z-006yBd-36;
        Wed, 06 Sep 2023 17:59:55 +0300
Date:   Wed, 6 Sep 2023 17:59:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 1/2] hwmon: tmp513: Add max_channels variable to
 struct tmp51x_data
Message-ID: <ZPiT606wpCDsNVPC@smile.fi.intel.com>
References: <20230905184252.222742-1-biju.das.jz@bp.renesas.com>
 <20230905184252.222742-2-biju.das.jz@bp.renesas.com>
 <ZPiPVZKXeDfLsU64@smile.fi.intel.com>
 <OS0PR01MB592218CADC2F90290B0B727D86EFA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592218CADC2F90290B0B727D86EFA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 06, 2023 at 02:46:37PM +0000, Biju Das wrote:
> > On Tue, Sep 05, 2023 at 07:42:51PM +0100, Biju Das wrote:

...

> > > +#define TMP51X_TEMP_CONFIG_CONV_RATE	FIELD_PREP(GENMASK(9, 7), 0x7)
> > > +#define TMP51X_TEMP_CONFIG_RC		BIT(10)
> > > +#define TMP51X_TEMP_CHANNEL_MASK(n)	FIELD_PREP(GENMASK(14, 11), \
> > > +						   GENMASK((n) - 1, 0))
> > 
> > Why do you need FIELD_PREP() for the pure constants here? Why can you
> > simply define the constants in the proper place?
> 
> I think one can clearly understand the bit definitions and value from FIELD_PREP.

I think it is clear over engineering. In the first one the constant can't be
more than the field, in the second the defensive programming that is discouraged
in the kernel.

#define TMP51X_TEMP_CHANNEL_MASK(n)	(GENMASK((n) - 1, 0) << 11)

would suffice and much easier to understand.

...

> > > +#define TMP51X_TEMP_CONFIG_DEFAULT(n)	(TMP51X_TEMP_CONFIG_CONT | \
> > > +			TMP51X_TEMP_CHANNEL_MASK(n) | \
> > > +			TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC)
> > 
> > This is better to read in a form of
> > 
> > #define TMP51X_TEMP_CONFIG_DEFAULT(n)					\
> > 	(TMP51X_TEMP_CHANNEL_MASK(n) | TMP51X_TEMP_CONFIG_CONT |	\
> > 	 TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC)
> > 
> 
> I just used the indentation suggested by Guenter.

But wouldn't my proposal be sightly better to read?

-- 
With Best Regards,
Andy Shevchenko


