Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6605C41513
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 23:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjHBX2X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 19:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHBX2V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 19:28:21 -0400
Received: from mgamail.intel.com (unknown [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A4219BE
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 16:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691018900; x=1722554900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lvPt5xoVSDbxu16ASMYT5ia5isGd8PdyvCjZRgSh9jk=;
  b=SiZeIlSapTwI2drejxGIqR/YGTpM9oC/LfIdVM9bIPDvV4AHKSj7XUgu
   UMfBeFEF+wx5QqOU2wsU+gS1Mg8UC8EyHP6ZfUtsaXeqsRBJT3PNTpTW2
   B0WjumiCbqPreR2nTtbtR9kUBmUpnz1K80fLIQFvpZb7T4ghlI24pBS2l
   QvFbj/dAP5AaxwYC3lxMKzJDdV1kVvwENmc6Cz9gtDQ+bQNs0BOyx0bIh
   +iYzHNVRPPnRCDjorkO6+68ksvU5RhLLnCMvAsxO6myhjDP7+x92mqooL
   nvb7FPjH81WFgcXQo9h2Wmbifce8+W9ZV6KNu0g9HrUmIPh9Gnu8Jsx60
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368625052"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="368625052"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:28:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764389366"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="764389366"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.38.55])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:28:17 -0700
Date:   Thu, 3 Aug 2023 01:28:15 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v3 3/6] drm/xe/hwmon: Expose card reactive critical power
Message-ID: <ZMrmj9PsP4H0b+ZM@ashyti-mobl2.lan>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-4-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802135241.458855-4-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

On Wed, Aug 02, 2023 at 07:22:38PM +0530, Badal Nilawar wrote:
> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> 
> v2:
>   - Move PCODE_MBOX macro to pcode file (Riana)
> v3:
>   - %s/hwm_/hwmon_/ (Matt Brost)
>   - s/IS_DG2/(gt_to_xe(gt)->info.platform == XE_DG2)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 106 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
>  drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
>  4 files changed, 143 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index d48d98f903ed..ea60add73743 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
>  
>  		Only supported for particular Intel xe graphics platforms.
>  
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
> +Date:		August 2023
> +KernelVersion:	6.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +
> +		Card reactive critical (I1) power limit in microwatts is exposed
> +		for client products. The power controller will throttle the
> +		operating frequency if the power averaged over a window exceeds
> +		this limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
> +Date:		August 2023
> +KernelVersion:	6.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +
> +		Card reactive critical (I1) power limit in milliamperes is
> +		exposed for server products. The power controller will throttle
> +		the operating frequency if the power averaged over a window
> +		exceeds this limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index ce8dac2168f6..ceab142f6d42 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -12,6 +12,8 @@
>  #include "xe_hwmon.h"
>  #include "xe_mmio.h"
>  #include "xe_gt.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  
>  enum hwmon_reg_name {
>  	REG_PKG_RAPL_LIMIT,
> @@ -28,8 +30,10 @@ enum hwmon_reg_operation {
>  /*
>   * SF_* - scale factors for particular quantities according to hwmon spec.
>   * - power  - microwatts
> + * - curr   - milliamperes

Ah... it's a table...

>   */
>  #define SF_POWER	1000000
> +#define SF_CURR		1000

... you could add it on the side

#define SF_POWER	1000000 /* microwatt */
#define SF_CURR		   1000 /* milliamperes */

The rest looks good

Andi
