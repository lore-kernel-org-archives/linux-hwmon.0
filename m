Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A7FECAAD1
	for <linux-hwmon@archiver.kernel.org>; Wed, 31 Aug 2022 09:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiHaJql (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 31 Aug 2022 05:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbiHaJqg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 05:46:36 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E5321277;
        Wed, 31 Aug 2022 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661939195; x=1693475195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Xi7o9GnLADLCDdpRDKrMf0eI0IgUSuC6dOuVUW2aLo=;
  b=lq1JTL9wKDUDfUNY+j6sc74JwSjPG6VbXi81Q/ERptWwZySQYRyJbP2a
   XzxNRMuUmMoovcszLw55uPr0S2l48Rc6hkQg77s9RZeE0SiMA6+Bzl1LC
   QK3PeHK9gDF9kNwFVMR+pLCNlB+RvD/XHOR+atGweYKTF9DLv4HHEZzdL
   mbLYNwALvAT5pqDG8/h0JNSPfpkn3ifXdablRO+NsX6fUn+jxOMZ/yMl+
   0p8sAF6NWFKwkPEyvc9e+4R77mMSCNkIC2h5UhG0+1dfz/UPSirwwWj08
   GQe0oMWUhbb95ibTfRMjwu1CMsxMDvXdakWy20yCFQeRtw3QqUscS7pMr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="359372187"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="359372187"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 02:46:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="715637341"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 02:46:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oTKIk-006Jne-2e;
        Wed, 31 Aug 2022 12:46:26 +0300
Date:   Wed, 31 Aug 2022 12:46:26 +0300
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
Subject: Re: [PATCH v3 06/19] hwmon: (mr75203) fix multi-channel voltage
 reading
Message-ID: <Yw8t8v9rdeR4wAIK@smile.fi.intel.com>
References: <20220830192212.28570-1-farbere@amazon.com>
 <20220830192212.28570-7-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830192212.28570-7-farbere@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 30, 2022 at 07:21:59PM +0000, Eliav Farber wrote:
> Fix voltage allocation and reading to support all channels in all VMs.
> Prior to this change allocation and reading were done only for the first
> channel in each VM.
> This change counts the total number of channels for allocation, and takes
> into account the channel offset when reading the sample data register.

...

>  	struct pvt_device *pvt = dev_get_drvdata(dev);
>  	struct regmap *v_map = pvt->v_map;
>  	u32 n, stat;
> -	u8 vm_idx;
> +	u8 vm_idx, ch_idx;

Can you keep it sorted by line length?

>  	int ret;

...

>  	const struct hwmon_channel_info **pvt_info;
> -	u32 ts_num, vm_num, pd_num, val, index, i;
> +	u32 ts_num, vm_num, pd_num, ch_num, val, index, i;

Ditto.

-- 
With Best Regards,
Andy Shevchenko


