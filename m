Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315E1C00528
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 23:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjHBXcN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 19:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjHBXcM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 19:32:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE8B2685
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 16:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691019132; x=1722555132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wsbr/Lqy1eHdkS7ufvZr0sVg10Oh2t77yQEQ/F7Iaw4=;
  b=hM3mVuMM5458sdKVpFRS8C8wykaLqPpZbrohI5GpApKaPUY8fxGAR7Rw
   Qi83JiBf6gXDYqMelIIy5cBGnRykfG0xOv0hCeSygc18RDq4Tuf50zRhQ
   eky9jqkaog5zLX+JUGNcCdWWsPBg+Fqb2dBvqLVq27gHPEl+js6adnnh8
   1qfpn/IiTarFC6WwFWeIuQxT1ijww2n7MGxsfvekFL7xzcrsGl+3F8Fc1
   OM08SBMLZtXS4uhszln0FrhzdoAf/NKuoV1sQbNhnsFjtjJ0f4ZvhSK+l
   uNKefGlmNYNt2pWRNgIaO3/itYkqPx7j3Z8/qa+ABx/qxj3NMpOJ4hkNX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368625409"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="368625409"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:32:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764390190"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="764390190"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.38.55])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:32:07 -0700
Date:   Thu, 3 Aug 2023 01:32:05 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v3 4/6] drm/xe/hwmon: Expose input voltage attribute
Message-ID: <ZMrndXUXs4nB5fnx@ashyti-mobl2.lan>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-5-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802135241.458855-5-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>  	NULL
>  };
>  
> @@ -244,6 +254,18 @@ static int hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>  			      uval);
>  }
>  
> +static int hwmon_get_voltage(struct xe_hwmon_data *ddat, long *value)

one thing I forgot to mention also in previous patches is that
hwmon_* and HWMON_* as prefixes do not belong to the xe driver.

You should use an xe related prefix, like xe_hwmon.

Rest looks good,
Andi
