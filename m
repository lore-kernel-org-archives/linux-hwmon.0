Received: from out28-49.mail.aliyun.com (out28-49.mail.aliyun.com [115.124.28.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007E445AFC;
	Wed, 30 Sep 2026 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751852; cv=none; b=HCDrlp1b/ofE4KoUae5fdyWhYzEaJ2F4nq3iBfpgrL6c5YK9E+5xAA0znlWveX4ClW/9dBcGT9piWmCS3tGw78HGHsghS+Nz0jS7D24ec3Vt8MQsRwv2BbACwyJaCVSc6zHVe819vN4+OFuYKK/QPafAdz10HP7WViS/Gjdrtvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751852; c=relaxed/simple;
	bh=Cm2/40osqJcIeeBGxlyJWWFCuIFIM+wGPhLTFCkARwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBsr2pK2WjjXcMTJoWvHuhzcH/tQqvTrjTi8vNMXiOwbH9ds1M1Ni68ReA35nyAZhOtRmKii/56mdlDfBGI5hJjeGcvI8fq6zxniioA0+KQmO+4DNmrY2U0qG3mHJhVcYp9IwjpPg+i3b/38TLOIuYznJa/c3Q6cM0G1d+4Nsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1388332|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0553599-0.00509708-0.939543;FP=7278710166377978061|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033022149254;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jS1YStn_1790751828;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jS1YStn_1790751828 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 30 Sep 2026 15:03:50 +0800
Message-ID: <82811325-5386-4956-aff7-56da37d898aa@open-hieco.net>
Date: Wed, 30 Sep 2026 15:03:48 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] x86/hygon: Map CPU NodeIds to DF nodes
To: Borislav Petkov <bp@alien8.de>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, Clemens Ladisch <clemens@ladisch.de>,
 Guenter Roeck <linux@roeck-us.net>, x86@kernel.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-3-wanglin@open-hieco.net>
 <20260930030004.GGarx7NIIToO-fWAww@fat_crate.local>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20260930030004.GGarx7NIIToO-fWAww@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/2026 11:00 AM, Borislav Petkov wrote:
> arch/x86/include/asm/hygon/node.h:81: * hygon_cpu_to_df_node() - Map CPU to dense DF CDD index
> arch/x86/include/asm/hygon/node.h:95:int hygon_cpu_to_df_node(unsigned int cpu);
> arch/x86/include/asm/hygon/node.h:138:static inline int hygon_cpu_to_df_node(unsigned int cpu)
> arch/x86/kernel/hygon_node.c:586:int hygon_cpu_to_df_node(unsigned int cpu)
> arch/x86/kernel/hygon_node.c:600:EXPORT_SYMBOL_GPL(hygon_cpu_to_df_node);
> 
> So why is this function in a header and exported to no one?
> 
> Pls export it only when you need it and until then, keep it in the .c file
> only.
Right, there is no caller yet. I'll remove the declaration and stub
from node.h and the symbol export. I'll keep the translation code
private to hygon_node.c until a consumer needs it.

Thanks!

Lin
