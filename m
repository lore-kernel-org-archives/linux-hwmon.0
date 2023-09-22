Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58BACD4F49
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Sep 2023 10:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjIVKF0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Sep 2023 06:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjIVKFZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2023 06:05:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569F791
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Sep 2023 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695377119; x=1726913119;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=tYN+o+I8EIG+D1a/pR1gSeXmcRMUQP5nXay1NTWrajY=;
  b=bz/csUFiz09F9e+07huaVlQly8YT6WTlas3QwwVbaUs49DrxTh1s0wrb
   VPotjZaqAu/XefwNR4Ju58dRmvQLxouW2ZHUATSmmb8JRgZiOlIxK5sbR
   lU8GxwdXQ/hsVD0WQc/gKyp5ImFA5+w7FHmCOkQHgnLDZd8tSG2m1nvWZ
   f+eDxML+x+sr8LmSEX1E2diXRALTlhBOAF5UIkubcOsRngECJPGWMK9b7
   36NK8ch7amdE4ra9jZQZfIIs5EN9iKkaqnqBPcusB2kWCdS8cf2Aa3w9W
   88JjjQ+wzCyag5czHLmZRLUW1lbBiTcJo1t7RJ3JkPChs7WeaHwGGh07g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="380690649"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="380690649"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="1078314522"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="1078314522"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.50.131])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:05:16 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
        linux@roeck-us.net
Subject: Re: [Intel-xe] [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
In-Reply-To: <5653e0cb-93d9-f576-e8c6-2ef4d43ac2bb@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
 <ZQxpTss3+OYdbJks@intel.com>
 <5653e0cb-93d9-f576-e8c6-2ef4d43ac2bb@intel.com>
Date:   Fri, 22 Sep 2023 13:05:13 +0300
Message-ID: <87lecyo752.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 21 Sep 2023, "Nilawar, Badal" <badal.nilawar@intel.com> wrote:
> On 21-09-2023 21:33, Rodrigo Vivi wrote:
>> On Thu, Sep 21, 2023 at 03:55:14PM +0530, Badal Nilawar wrote:
>>> Add XE_MISSING_CASE macro to handle missing switch case
>>>
>>> v2: Add comment about macro usage (Himal)
>>>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_macros.h | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>>> index daf56c846d03..6c74c69920ed 100644
>>> --- a/drivers/gpu/drm/xe/xe_macros.h
>>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>>> @@ -15,4 +15,8 @@
>>>   			    "Ioctl argument check failed at %s:%d: %s", \
>>>   			    __FILE__, __LINE__, #cond), 1))
>>>   
>>> +/* Parameter to macro should be a variable name */
>>> +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>>> +				__stringify(x), (long)(x))
>>> +
>> 
>> No, please! Let's not add unnecessary macros.
> This was suggested by Andy, in fact he suggested to reuse existing 
> MISSING_CASE macro from i915. As I couldn't find common place to move it 
> I went with creating new one.
>
> I will drop this patch and simply use drm_warn.

Please use drm_WARN() or drm_WARN_ON(). With panic_on_warn=1 in CI,
it'll oops the machine, and we'll actually catch these as opposed to
just leaving them as lines in dmesg.

I guess the main purpose of MISSING_CASE() in i915 was to unify the
behaviour, though I think that was also misused.

BR,
Jani.

>
> Regards,
> Badal
>> 
>>>   #endif
>>> -- 
>>> 2.25.1
>>>

-- 
Jani Nikula, Intel
