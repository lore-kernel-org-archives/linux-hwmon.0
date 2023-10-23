Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5CBC001E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Oct 2023 11:36:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234048AbjJWLgm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Oct 2023 07:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbjJWLgj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2023 07:36:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EB21A4;
        Mon, 23 Oct 2023 04:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698060997; x=1729596997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1hNtJkrhOMeQ/kBhDBZ7GUWDWrwRTz6hQAoZ3cKYKLo=;
  b=b12uDo+xxDFlwb14aPqOdrsOH26FD3/2bC0JvlOiU0VLTsO/WecVCZHN
   vgn8C0epmY0puDHYeIAk1HxolWCZ0jGoW/MbxvAmFC+ybJP919DpEm6RO
   mbW4Gey6r4JuHdqQGPsqrBa/IpOTZl/aEG+XLqROfRJDxO4dOmvASeqGR
   uvh0rC9knaaS+oe8Y+4iF5pXliEafxqG+47OdW2FT8j1/Dx/W4adAWnIa
   GmpjhxzmFObICcR5auXWEsAngXc3rbBOYNr7IP+PknRT6qpQXvAsS4Oh0
   x/4V6qvmMh8qqtntADVW2rkQkAfCJZtlQ3w/SgYTNqB4Ta916zsqxGB/c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="8375803"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="8375803"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="758120931"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="758120931"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:36:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qutE9-00000007vHP-3msa;
        Mon, 23 Oct 2023 14:36:09 +0300
Date:   Mon, 23 Oct 2023 14:36:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raag Jadav <raag.jadav@intel.com>
Cc:     rafael@kernel.org, len.brown@intel.com, robert.moore@intel.com,
        mika.westerberg@linux.intel.com, mark.rutland@arm.com,
        will@kernel.org, linux@roeck-us.net, Jonathan.Cameron@huawei.com,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, bala.senthil@intel.com
Subject: Re: [PATCH v2 4/6] ACPI: x86: use acpi_dev_uid_match() for matching
 _UID
Message-ID: <ZTZaqf6Y+kDJOWK6@smile.fi.intel.com>
References: <20231023053530.5525-1-raag.jadav@intel.com>
 <20231023053530.5525-5-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023053530.5525-5-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 23, 2023 at 11:05:28AM +0530, Raag Jadav wrote:
> Convert manual _UID references to use the standard ACPI helper.

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Please, drop this tag, since I disagree with patch 1 implementation.

-- 
With Best Regards,
Andy Shevchenko


