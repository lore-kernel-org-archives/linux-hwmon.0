Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com [115.124.28.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C0A370ADA;
	Thu, 17 Sep 2026 01:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608959; cv=none; b=Mt9dQWQ3mgeGT50SCK/EhQ3e7WzjehJeyGyq4885APuHq7uimlCiNYa7q5qXxxnDCTZlPXSS6IMb2Hbys57d7Ec5+bI5CD3biNKTgdjLI6MCib4HHnW/tLJGD4JoQTtfo9goTYtVFEu/4S5zYcviboet7Jx/RbS2givLfOVvi3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608959; c=relaxed/simple;
	bh=Ome7Gk0Tt3hdoRY+QE32yAcZgb9luM7ODxuACCA2TfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8rGcCw250mKXC/EWSvaOTVWwDak9wAiofhf+Z3Hz+bgOKuIIiCNfXmyk88cVIJ/satcGmoFlC69TMGNlmQrDekI10DBSBO/PbK99/p+/0JIpDxkz5KCrwtJscbyBdntfJCc1nBDBU3yW3n69xWkpmTSHQ90k4DmvjxjaK6o9Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08136705|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0345639-0.000977598-0.964459;FP=5483459200127977306|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jFRRQ.z_1789608623;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jFRRQ.z_1789608623 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 17 Sep 2026 09:30:24 +0800
Message-ID: <46f33617-53c0-4d5f-a073-879fcf7b9070@open-hieco.net>
Date: Thu, 17 Sep 2026 09:30:23 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] x86/hygon: Add Family 0x18 DF node enumeration
To: Borislav Petkov <bp@alien8.de>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, Clemens Ladisch <clemens@ladisch.de>,
 Guenter Roeck <linux@roeck-us.net>, x86@kernel.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-2-wanglin@open-hieco.net>
 <20260916155956.GBaqq8_BsuLkBKp-Ia@fat_crate.local>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20260916155956.GBaqq8_BsuLkBKp-Ia@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/2026 11:59 PM, Borislav Petkov wrote:
>> +	ret = hygon_build_cache();
>> +	if (ret) {
>> +		pr_warn("DF node cache build failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	pr_info("%u DF nodes (%u CDDs, %u IODs) across %u sockets\n",
>> +		hygon_cache.num_nodes, hygon_cache.num_cdd,
>> +		hygon_cache.num_nodes - hygon_cache.num_cdd,
>> +		hygon_cache.num_sockets);
>> +
>> +	return 0;
>> +}
>> +fs_initcall(hygon_node_init);
>> -- 
> Sure looks complex... I hope you know what you're doing...

Thanks, Boris.

I'll go through Documentation/process/maintainer-tip.rst and fix the
comments, declaration order and whitespace throughout the series. I'll
also simplify the node cache code where possible before posting v6.

Best regards,

Lin
