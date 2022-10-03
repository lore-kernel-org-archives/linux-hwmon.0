Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D81C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 21:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJCVkb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 17:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiJCVka (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 17:40:30 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D3914033
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 14:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664833229; x=1696369229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lruElgHMC8LZXpqnpQb5NpXNJP5vB9bXAVMMtoZ+X1Y=;
  b=bp59r1sb84BKO7pqBMzfwuw0adWJ6H06mHKcb+krhjWEprcx+YOiQOag
   7CwLN4YuQDgq0te9IgK1Xup7xvzyiI+Rlzy2lO04p9fHQl5SLDqnzVC3R
   oYQBgIktrAcd3RPjorIWOdP0WQurRMwsyJj5SS+2f8mpVvhIYtCCdQBNh
   9UXvm4PaazyJ619yIOeL1p6PEzPHbfa4UhU8SYQ03Uju2rNn73oMjsVPD
   KiZ+wXvu5jTwXwf97CrA9T0wjSZabAsf83DLopRAybwXSHtJea8Egy8iM
   Lb2tQsp4p40nX8hHbN7Fh57PlIozG/DQSSVaJozjNmGpg0V7Rho6K3xVs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="389056737"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="389056737"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 14:40:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="618895118"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="618895118"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com) ([10.213.7.91])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 14:40:27 -0700
Date:   Mon, 3 Oct 2022 23:40:24 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915/hwmon: Extend power/energy for
 XEHPSDV
Message-ID: <YztWyHxlVH2hrw6F@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-8-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-8-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 27, 2022 at 11:20:20AM +0530, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> Extend hwmon power/energy for XEHPSDV especially per gt level energy
> usage.
> 
> v2: Update to latest HWMON spec (Ashutosh)
> v3: Fix review comments (Ashutosh)
> v4: Fix review comments (Anshuman)
> v5: s/hwmon_device_register_with_info/
>     devm_hwmon_device_register_with_info/ (Ashutosh)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

This last patch is making me thing that the hwmon should have
been under gt rather than under i915. We leave it to a later
refactoring.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
