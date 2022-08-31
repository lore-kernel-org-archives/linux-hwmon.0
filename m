Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7220ECAAD4
	for <linux-hwmon@archiver.kernel.org>; Wed, 31 Aug 2022 12:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiHaMEn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 31 Aug 2022 08:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiHaMEg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 08:04:36 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCD2D2B09;
        Wed, 31 Aug 2022 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661947473; x=1693483473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3CNueT9cE9ZjKtPO6Y2P8yU/a/o9y/729VjZgtZX1o=;
  b=YjL8n5y5YNZr7qNOqY7eNWPrV8FF6AMWxVXvMBIgsZRpMi0tvyTHLKUC
   0Vo+Oy1EpHCfenXC9lZLJ4ViLX12IySrDUwvjAN5nJKaetc4rAK4R21Bf
   3zTNiGaFa/KdpgNjP+YMrf9mhfxE0Ndad4y9lgrNyG5aAqA4Tznok9xk9
   74WNGnZaUqy/+oItU4OuF+nHON/Ld/dcfMI4chA04zKOgdMnv9M+wrTXL
   9vhtbSQmzPv4soi75ZZdyX38zDP7VvDmtwu7ERIxnh23hOuTqYWh1F8Xm
   si2PfEdw3lCvKQxLI6EybE+tqCqoHBoAcZv/v6AdTTSKk6+3JrxgXgQKZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="359389648"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="359389648"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 05:04:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="857442606"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 05:04:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oTMSG-006MZL-1b;
        Wed, 31 Aug 2022 15:04:24 +0300
Date:   Wed, 31 Aug 2022 15:04:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Eliav Farber <farbere@amazon.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        p.zabel@pengutronix.de, rtanwar@maxlinear.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, talel@amazon.com, hhhawa@amazon.com,
        jonnyc@amazon.com, hanochu@amazon.com, ronenk@amazon.com,
        itamark@amazon.com, shellykz@amazon.com, shorer@amazon.com,
        amitlavi@amazon.com, almogbs@amazon.com, dkl@amazon.com,
        rahul.tanwar@linux.intel.com
Subject: Re: [PATCH v3 12/19] hwmon: (mr75203) fix voltage equation for
 negative source input
Message-ID: <Yw9OSJogapyla1Jr@smile.fi.intel.com>
References: <20220830192212.28570-1-farbere@amazon.com>
 <20220830192212.28570-13-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830192212.28570-13-farbere@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 30, 2022 at 07:22:05PM +0000, Eliav Farber wrote:
> According to Moortec Embedded Voltage Monitor (MEVM) series 3 data sheet,
> the minimum input signal is -100mv and maximum input signal is +1000mv.
> When n was small enough, such that PVT_N_CONST * n < PVT_R_CONST it
> resulted in n overflowing to a very large number (since n is u32 type).
> 
> This change fixes the problem by casting n to long and replacing shift
> right with div operation.

Fixes tag?

...

>  		n &= SAMPLE_DATA_MSK;
> +

Unrelated change.

-- 
With Best Regards,
Andy Shevchenko


