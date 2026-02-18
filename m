Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FCF347BA7;
	Wed, 18 Feb 2026 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771443010; cv=none; b=Sefwr13iQ2jq7zCVCN/FGlKeQ8KOQgjW5ujtDarbaqifAo0gbFkuYT+ZYxP5wFmV7l54ilGpOU6aF5MlRH5sABJkVx3W/ezAAceMmywm/TEknklXPHijvylWe9FzIsBnta/vVYl1kc/Lk0kmaITeTHCnozpy1zaVoMM4gmYp2GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771443010; c=relaxed/simple;
	bh=zrFRbht4ecVfwb3Aq+wsNKWqdkQUklyJej63/BrDQOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq3FKdipX/3DCucOhBUlLXnUSdT2IW5x/iDaUCoe+aEZmHxr6yUYTGqVeDDyZk4NwY8Lb+e9Hi10Zgxp3ESldGurbfD90Yb/68bJG31/WVTp0snf5LlKYCs4ftjaaR3L9lvp9tiXf7ge87kNc6mlRQINrtVKdZZtAQEfmi6zASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnnifNcA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnnifNcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771443009; x=1802979009;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zrFRbht4ecVfwb3Aq+wsNKWqdkQUklyJej63/BrDQOQ=;
  b=WnnifNcATl8hfx083Rb+QS1LoO44kCi8OssLPUwQ/z7WvwmMvLFERB07
   4cS75vdIijbq1xQiozWEVIhlLZ8I9pQExrHmhSH23pS/QOK1n/+tUJdWY
   oxyEQhHBGvPVeqoKGZEBJEDINpC+G5LxKV6tNusDttVQTjz00RW6K6tUj
   9B82LxbFq7ViPf9PATwSVbhFIbotlP84yhhXFNbTPsa4aPadQHTBq79Mf
   0drEAM4K2CNiHbXliAjcUU/JC3FssQTbW9HogTSU1eBTWsZMOlNdGrt+5
   k6ii59Y71+n4P4hTJCpXzEM4Y9RI6tlWnRFvVLOs0CfFvHmdc7WAYFfhL
   g==;
X-CSE-ConnectionGUID: GDq6ncgwTpKEuOBvPUsA3w==
X-CSE-MsgGUID: vcOfFippQWq80bZ9pxjMuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82850814"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="82850814"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:30:08 -0800
X-CSE-ConnectionGUID: o9IBGgdeSWayRQIFCqHHpw==
X-CSE-MsgGUID: BFA0vf5MTiqLfGBnm/DhCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="212350098"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.109.224]) ([10.125.109.224])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:30:07 -0800
Message-ID: <5cfea5f4-1ced-4559-8de1-4e96116536f4@intel.com>
Date: Wed, 18 Feb 2026 11:30:06 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] peci: Remove dependency on x86 CPU variables
To: Sohil Mehta <sohil.mehta@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, Guenter Roeck <linux@roeck-us.net>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org, Thomas Gleixner <tglx@kernel.org>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org
References: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
 <02494c50-8239-4e9d-b653-451728e5b5fc@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <02494c50-8239-4e9d-b653-451728e5b5fc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/18/26 11:26, Sohil Mehta wrote:
>> diff -puN include/linux/peci.h~peci-sanity include/linux/peci.h
>> --- a/include/linux/peci.h~peci-sanity	2026-02-18 08:19:42.371396743 -0800
>> +++ b/include/linux/peci.h	2026-02-18 08:19:42.388397383 -0800
>> @@ -72,7 +72,7 @@ static inline struct peci_controller *to
>>  struct peci_device {
>>  	struct device dev;
>>  	struct {
>> -		u32 x86_vfm;
>> +		u32 device_id;
> 
> There is a kernel-doc comment on top of this struct as well that needs
> to reflect the change.

Thanks, I'll fix it up.

>> diff -puN include/linux/peci-cpu.h~peci-sanity include/linux/peci-cpu.h
>> -#include "../../arch/x86/include/asm/intel-family.h"
>> +/*
>> + * These are in the format of and match the values of the x86
>> + * CPUID.01H:EAX[19:4]. They encode the model and family of
> 
> Can we include the extended family bits in the *comment* to say
> EAX[27:4]? I expect Family 19 (DMR) will be added soonish, which will
> make the comment stale.

Right now, all the constants are 16 bits long, that's 19:4. If a future
CPU model needs more bits, they'll make all the constants bigger and can
change the comment.

>> + * the CPU with which the driver is interfacing.
>> + *
>> + * All driver functionality is common across all CPU steppings
>> + * of a given model, so the lower 4 stepping bits are excluded
>> + * from these IDs.
>> + */
>> +#define PECI_INTEL_HASWELL_X		0x306C
>> +#define PECI_INTEL_BROADWELL_X		0x406F
>> +#define PECI_INTEL_BROADWELL_D		0x5066
>> +#define PECI_INTEL_SKYLAKE_X		0x5065
>> +#define PECI_INTEL_ICELAKE_X		0x606A
>> +#define PECI_INTEL_ICELAKE_D		0x606C
>> +#define PECI_INTEL_SAPPHIRERAPIDS_X	0x806F
>> +#define PECI_INTEL_EMERALDRAPIDS_X	0xC06F
>>  
> 
> The _D has been used in Intel official product names such as "XEON D".
> AFAIU, The _X notation is specific to intel-family.h. Should that be
> explained in the comment above?
> 
> Something like:
> 
>  *	_X	- regular server parts
>  *	_D	- micro server parts

I think I just verbatim copied the intel-family.h names and added PECI_.
Are you seeing something different.

BTW, we should probably comment the naming scheme and at least mention
that it should be consistent with the x86 code.
