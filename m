Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080760;
	b=KwLk3UFkxe1YoBqBd9HHjoYjxc7C1bDevqW3MlSS4SHyJWlzQFvB6X9K5rsZf+p3yx/a
	 Iumfe3WgIgJ1Kw5j54zx4Fg3Y1ZCFbby6kFEw6Am2spMfZxtVY0Ei2WO09Xi/IQCNKeak
	 VTDJxIuO8fTYfwNrLkeXHFIZxazCamnTigsrOPl+auI1mivIwy42jj/jg/kxcKu85PZJa
	 CCTWniMMa/ock5YtHLGLE5WOiV3wxbSTYTKC2w1h6aiOhbT50Jg2UywT/ycycs9VmZzj5
	 OOhFc1+yz5i171eimggravouEZwFYsF1JTtJ05XyYVlbS0yKLGpnQBzZ+8iVRa0l6ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080760;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4Npgbsf5Mz673d0bNT8s36i4OiK8JwGRnxwUCUdpj1Y=;
	b=zfyS76iiKlkyeIoEqWGCakGOv9Yh2ZIvYiAsBCJwy/JQPBN0u1JripTq0rVz1iZJLdwM
	 WGKRzkoyrKk6n7fGkrsz8Ra/dW0NUPBdcqTz1YriyV57VZEiBJQnCdWASVgxVgo4myhpE
	 UW5kYzJ+9k0RlsLhSvW5t0zItUwGSwbleChct84oPLdmxC3WpLCaTEyxhopy300lBMVgU
	 6v4oAXVpV8erIc5SoVEOoJ/USNVG2SIRArptnextC+d+wIssBiIBEASchWCWM8s+LaIVb
	 QNlLb9dqzsY9stliYjT4cAun0TahUr0WC9vM2MFS12QJF7tmOJvSw3bQThaxQDVVrsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2316B606A31B;
	Tue, 27 Oct 2026 05:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2316B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08090112|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.034835-0.000669236-0.964496;FP=7602957257888359646|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jqW1159_1793080746;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jqW1159_1793080746 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 13:59:07 +0800
Message-ID: <7e086025-c74b-4808-bc8e-ea66c9eb0a88@open-hieco.net>
Date: Tue, 27 Oct 2026 13:59:05 +0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] x86/hygon: Add Family 0x18 DF node enumeration
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 x86@kernel.org, linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-2-wanglin@open-hieco.net>
 <20261024151527.GB1164@yaz-khff2.amd.com>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20261024151527.GB1164@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2026 11:15 PM, Yazen Ghannam wrote:
> On Thu, Oct 22, 2026 at 03:42:11PM +0800, Lin Wang wrote:
>> The AMD node code locates function 3 for node N at PCI slot 0x18 + N.
>> Hygon has no equivalent node-index-to-slot mapping: DF F3 devices are
>> discovered by PCI ID and the PCI BDF is only an access point.
>>
>> Enumerate Hygon DF devices by PCI ID and read their identities from DF
>> registers. Build a dense node cache with Core and DDR Dies (CDDs) before
>> I/O Dies (IODs), providing node counts, identity and PCI function lookups.
>>
>> Guests may expose a supported CPU model without DF devices. Suppress
>> the cache-build warning for -ENODEV in guests; keep other initialization
>> errors visible.
>>
>> The node lookup helpers remain local until Hygon consumers are added.
>>
>> Signed-off-by: Lin Wang <wanglin@open-hieco.net>
>> ---
> 
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> 

Thanks for the review.

I'll send v9 to fix the SMN root-array leak reported by Sashiko in
patch 7.

Thanks,

Lin

