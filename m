Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C419CE7A81
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 08:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbjIYI7M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 04:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbjIYI7M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 04:59:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17918FF
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695632346; x=1727168346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DpzYbxHKQe8xTQumEp2zADmckU9uFjL6UbWNWPbpHvU=;
  b=PbW8JTo/eUez/NrA2afcszhmHU2+jxfY8WhQG5Y3fMcK00U94zJNlk2q
   muUsViDodsPmyXzbO5z/7gH8nVb5IuaFxHUG5w+bM6BaHTU7GgG1kMIIH
   jzCY6kpq2OnUjfz1zXWLtRIyD89hY2M/gGsRhplC7ptgVWU9ssAvJUvpf
   W2sHRXY70WYlA+uJ9W8WwoBy0+Ml1qwA7R4XJ7ZpjNBPxIhvKSMbN4gzP
   Y7o95TlkeoBseXjG5kLZsxJH1eduBGpvohuednByT834GEsZXLx1KQpHO
   LnHKDxPdhO8j8lc8hetdYqr0Bu7pTay8RYEjBvXEg8Virgb3CqsEyCgXt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380078849"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="380078849"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 01:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="863794257"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="863794257"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com) ([10.213.34.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 01:58:59 -0700
Date:   Mon, 25 Sep 2023 10:58:52 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: Re: [PATCH v6 1/5] drm/xe/hwmon: Expose power attributes
Message-ID: <ZRFLzPsgGroff9/a@ashyti-mobl2.lan>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925081842.3566834-2-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

On Mon, Sep 25, 2023 at 01:48:38PM +0530, Badal Nilawar wrote:
> Expose Card reactive sustained (pl1) power limit as power_max and
> card default power limit (tdp) as power_rated_max.
> 
> v2:
>   - Fix review comments (Riana)
> v3:
>   - Use drmm_mutex_init (Matt Brost)
>   - Print error value (Matt Brost)
>   - Convert enums to uppercase (Matt Brost)
>   - Avoid extra reg read in hwmon_is_visible function (Riana)
>   - Use xe_device_assert_mem_access when applicable (Matt Brost)
>   - Add intel-xe@lists.freedesktop.org in Documentation (Matt Brost)
> v4:
>   - Use prefix xe_hwmon prefix for all functions (Matt Brost/Andi)
>   - %s/hwmon_reg/xe_hwmon_reg (Andi)
>   - Fix review comments (Guenter/Andi)
> v5:
>   - Fix review comments (Riana)
> v6:
>   - Use drm_warn in default case (Rodrigo)
>   - s/ENODEV/EOPNOTSUPP (Andi)
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

looks good to me:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
