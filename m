Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41887EEC3;
	Wed, 30 Sep 2026 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790732816; cv=none; b=QlvKolYr9yep2UicaOaLwZpEmQs23DLdHGBP4tveqr3zoLUrLioCFkW6NMzoiDjJMp79n8ENS73AXf1bo832znpDPzmIkz7gPuJfWhrAKaOZQfJbqeQP+eMED8aYPlkMchm4iGSIOjrHc+yvqBlxdG4VTW/hvGDZKMvdRGdWe3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790732816; c=relaxed/simple;
	bh=VduyeHGGUwbZ0dRAxOVma2vYdrW9OS43A/YU2H+eQiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUiYddACV+xTNsuTFXPKfjQzjDOaMseTnI67cMl064QdPUcJfSwkB+TivOxkXNZoCha8efvULfbPdwZKd6BW1+VOZ2PJpKMxwgly5bGkYLefmbHaeTkJz0yUdt0IxBxlhwxyuVPSHFbDEMLaUiIFMu2inaja7xkVsUr4tXUPCKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1198246|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0104511-0.00144256-0.988106;FP=17280763970463682555|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040074035;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jRwS5-q_1790732806;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jRwS5-q_1790732806 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 30 Sep 2026 09:46:47 +0800
Message-ID: <1d15d515-f5ee-4c33-a327-0da42ca7d0b1@open-hieco.net>
Date: Wed, 30 Sep 2026 09:46:46 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] x86/hygon: Add Family 0x18 DF node enumeration
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
 <20260921055603.25112-2-wanglin@open-hieco.net>
 <20260930004330.GFarxbMrS2DQKmC3_M@fat_crate.local>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20260930004330.GFarxbMrS2DQKmC3_M@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/2026 8:43 AM, Borislav Petkov wrote:
>> +		pci_dev_put(link);
>> +		return NULL;
>> +	}
>> +
>> +	return link;
>> +}
> So all your local structs and functions - above and below, they don't really
> need the "hygon_" prefix. This way, for one, you can know immediately from the
> name whether it is a local or an exported entity and, two, you're going to
> have a lot smaller text, much easier to read and so on.
> 
Agreed. I'll drop the "hygon_" prefix from the file-local structs and
functions in the next revision. The exported interfaces will keep it.

Thanks for the review.

Lin

