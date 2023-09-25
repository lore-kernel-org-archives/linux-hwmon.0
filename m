Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B27CE7A94
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 11:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjIYLtz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 07:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjIYLty (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 07:49:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36D49B
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695642588; x=1727178588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VCN2e5xdiiG7txEAnPBrcuAfaaYBHGqBdD5y+41cyfQ=;
  b=Vf9+XslbmxyP2E7QdUgVMJBcBRIz6Usp7NPT120FTTk1PgCO2ucr/yxR
   oRoZwFprVJhC0527BGzJayDZo5Cg9ea/qjousYRjCZYdDR6CKo0gaKTet
   k6Miw2VOyQL4sn+fnIeRxWFiUgzdVSoARSa6e8mzavAFuKAKjcpV/Oh0Y
   AViwJuHSMFHymN2l8mF7i/nlC7Mk488PUnOom0i0vEWCd+ns7+Xs+0xcn
   oUcbasCMdJPH7oy3TNBObZ7QI4nlwFsoD1qqVHKaR7gnfK95Nm5mfWIQA
   ZDpMMIBLSuWq5Ay+4Y3RVQCCVTp7y25yyLJESOMDVvUBCiAmNDHZQ4e48
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445340371"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="445340371"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="863852567"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="863852567"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com) ([10.213.34.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:49:30 -0700
Date:   Mon, 25 Sep 2023 13:49:23 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: Re: [PATCH v6 4/5] drm/xe/hwmon: Expose hwmon energy attribute
Message-ID: <ZRFzw4BJNhb0v5mu@ashyti-mobl2.lan>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-5-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925081842.3566834-5-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

> +/*
> + * xe_hwmon_energy_get - Obtain energy value
> + *
> + * The underlying energy hardware register is 32-bits and is subject to
> + * overflow. How long before overflow? For example, with an example
> + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> + * a power draw of 1000 watts, the 32-bit counter will overflow in
> + * approximately 4.36 minutes.
> + *
> + * Examples:
> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> + *
> + * The function significantly increases overflow duration (from 4.36
> + * minutes) by accumulating the energy register into a 'long' as allowed by
> + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + */
> +static void
> +xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)

can we call it rather xe_hwmon_energy_update() as this is not
sending anything, but just updating the energy values.

Anyway...

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
