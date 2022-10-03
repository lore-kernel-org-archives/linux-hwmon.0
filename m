Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D697C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 21:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiJCV2R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 17:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiJCV1U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 17:27:20 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1AF5BC29
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 14:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664831902; x=1696367902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W5ktSIXhzy/XlJEAIhWRzO7M1dFIO9XfN3vvhR8jSVQ=;
  b=XeZQxHgMQahTM12AI7uXxgSE5vGHG5rdojxEw3Ti36sITvQf+D2PIRFQ
   JBJB3Ql1CPz7/4rRfgl4XpHkyMd9L54HvUaQSNpHMjfxUYLi5D9mrcOGb
   P0BF3EPi71CjTuo7UUwTfs2IUx7oKxs90Qr5xx7LjIzUZ5iQ82c+9Y8rS
   /T6LtpU3TPwZU+aSjbv8RuQhKq0SGPi752dvgQIOYRP0FzPn+Fkojnzpf
   J82Qj2p5ZnyYGX2egGHrGrujsjiTiroxiX2BTVJ+EalKRoYLa3UhPaRx/
   TxcIOk/YWkKGDduYnG8oHscEdu9gd6oKl+qJYWBW/11OvA0AlAL/getmS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="300364470"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="300364470"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 14:18:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="618888983"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="618888983"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com) ([10.213.7.91])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 14:18:19 -0700
Date:   Mon, 3 Oct 2022 23:18:16 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/hwmon: Expose card reactive
 critical power
Message-ID: <YztRmDRnabDpxTaD@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-6-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-6-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 7525db243d74..f9d6d3b08bba 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,32 @@ Description:	RO. Card default power limit (default TDP setting).
>  
>  		Only supported for particular Intel i915 graphics platforms.
>  
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +
> +		Card reactive critical (I1) power limit in microwatts is exposed
> +		for client products. The power controller will throttle the
> +		operating frequency if the power averaged over a window exceeds
> +		this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org

same question here, why dri-devel and not intel-gfx?

Andi

> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +
> +		Card reactive critical (I1) power limit in milliamperes is
> +		exposed for server products. The power controller will throttle
> +		the operating frequency if the power averaged over a window
> +		exceeds this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>  What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
>  Date:		February 2023
>  KernelVersion:	6.2
