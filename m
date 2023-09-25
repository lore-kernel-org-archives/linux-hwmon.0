Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6181CE7A89
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 09:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjIYJFS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 05:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjIYJFS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 05:05:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA049B
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695632712; x=1727168712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EEWZ0EeqzOB2C0Vpo++IaI9ugxEkMrrby8NqcJ6b2u0=;
  b=UkBu21RYOAoT2v2XdRxEYWgAxKulM93NE+rnzdDNOKrZCqiEN82H1YgH
   Ao8OY2sKvAyRJZPPJeQUoqb3HcPnrNwqKNpPVZugC7W6pVUwwB9W5pO5c
   AcvTEA+hz6PLdOMczoHZqQL6AVRE+KBmSBuBDOCcTgh51idCWz1I76s9L
   O+sRfPrI7wW7DHpzMZtPuro489QtbeJOVDI3n9YcsiQyfgqoWe68GCMiS
   FNk95HFdSMEisjqbKrKKv2QRZtjxkpA5s1ZcA4FK+EdgHAt0X328SEgby
   KcPqm5gKzkFnhfDzuQn9K5Rzzj6yrH2ZbyWI3sWd8ggnLirxH5j6lT8GZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360586830"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="360586830"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 02:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="891596865"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="891596865"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com) ([10.213.34.118])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 02:04:03 -0700
Date:   Mon, 25 Sep 2023 11:04:58 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: Re: [PATCH v6 3/5] drm/xe/hwmon: Expose input voltage attribute
Message-ID: <ZRFNOv82woWkWF/h@ashyti-mobl2.lan>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-4-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925081842.3566834-4-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

On Mon, Sep 25, 2023 at 01:48:40PM +0530, Badal Nilawar wrote:
> Use Xe HWMON subsystem to display the input voltage.
> 
> v2:
>   - Rename hwm_get_vltg to hwm_get_voltage (Riana)
>   - Use scale factor SF_VOLTAGE (Riana)
> v3:
>   - %s/gt_perf_status/REG_GT_PERF_STATUS/
>   - Remove platform check from hwmon_get_voltage()
> v4:
>   - Fix review comments (Andi)
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
