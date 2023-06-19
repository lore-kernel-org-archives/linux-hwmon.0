Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8870EB64D9
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jun 2023 14:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbjFSOAD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Jun 2023 10:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjFSOAC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Jun 2023 10:00:02 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B7510D;
        Mon, 19 Jun 2023 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687183202; x=1718719202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aNx8S4OIFY8xE2BLxsMN2xAvre7uW5zou6Scu0EBKkE=;
  b=QTaLGw1AuAgsc3zyDYHaMjhM52kh5746k89HNWob7CBFAAg2il3ZlsGj
   DPlpDzjojDacYbuiNq1YxAteWmqE+jcu1lhsujrrU8TuT3puuABflohJD
   DoNLzx42R8Ok2VVWVLoItVApRdo5nBoYwPVqqr+N1R1fc0jZgNKi2SpHt
   2lafXHyE+J8x+/BevKDVGK9VsevB/HepdQkiSeKscfMfRYJj3rpzGN2rs
   jqyc7ESHmJ5Ibjh5D8HNgPFBTszuyObnSunaZJgbFh6Tn/Hw7YOakgPSb
   vajyMM19SQtMlvwXI7+1uZW0IuiWju6jR3FxjbGY2VUA/oPdi/9veXeng
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349356663"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="349356663"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 07:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="713688032"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="713688032"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 19 Jun 2023 07:00:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qBFQE-0050XJ-34;
        Mon, 19 Jun 2023 16:59:58 +0300
Date:   Mon, 19 Jun 2023 16:59:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 1/1] hwmon: (nct6775) Fix use of undefined variable
Message-ID: <ZJBfXlRXmdL/RJ4a@smile.fi.intel.com>
References: <20230619133257.57569-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619133257.57569-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 19, 2023 at 04:32:57PM +0300, Andy Shevchenko wrote:
> It's unknown how, but in one place in the code the undefined variable
> is still in use. Replace it with the respective bitmap API call.

zOMG, it's against internal patch. Sorry for the noise.

-- 
With Best Regards,
Andy Shevchenko


