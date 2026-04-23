Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E923BB9F0
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776909951; cv=none; b=ZHQ4CIF8GnP0Z1fUMOoU9Z2p+owMbIOu9ULsV5LvUxPCwJM3ZXXm+s2fZ6bvEZ3J0JY/gSPZLXl/mF6Aje7/E4NpW964JVk3kaLx0vClnaaoAUSj6ZZlRfzqyWMhm0xiJnK+6WqytAZIoqBqEV8lvNgHOi049ceBNDcLUKmbecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776909951; c=relaxed/simple;
	bh=Tb3P+t2T8KQ7G57rTRrkgAaqvUEf0PZfxlH7fZ2B4gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjIEec8BHydLPA9GiJpfDFE9lL7CBG4hdMPSOMpZyBhVp9YdfSiq6Ud7Rg7bcFtKC4TtdoJka1QErDLvGzm0IGBjB1MNNpaPFICd3Pf/VzyX35xPUGBgtTlfLWUFQNY5soJvyPrcxs5zYdKBhhnaDY+6VxmVHs67rK3ftB0tbeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ma4yudQk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ma4yudQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776909949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vl69fnGMCWF0TcipYSEju5cXinWC+MmiZcTtQ5ZWnos=;
	b=Ma4yudQkcZdSTk0R/yQnASHM7MEe2IMYACA1CMZFrDz2tTqt5G9NQudZ2SADU1mcV3Zo9k
	tL1n50uyX1iYE8ILteFAYwbedddDAfjMG5VtED0b3RPccKS5heDh9sQAicdL8GKiph4puj
	I9Fot0tfxar/xMwWhl0HmBhVGkacUok=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-RrjzcX0vMIedDoXYiQyoKA-1; Wed,
 22 Apr 2026 22:05:45 -0400
X-MC-Unique: RrjzcX0vMIedDoXYiQyoKA-1
X-Mimecast-MFC-AGG-ID: RrjzcX0vMIedDoXYiQyoKA_1776909944
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 699971956061;
	Thu, 23 Apr 2026 02:05:44 +0000 (UTC)
Received: from [10.22.89.141] (unknown [10.22.89.141])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6810D30001A1;
	Thu, 23 Apr 2026 02:05:43 +0000 (UTC)
Message-ID: <9b164822-b4f3-4a97-b602-e49c495b54b8@redhat.com>
Date: Wed, 22 Apr 2026 22:05:42 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/23] rcu/nocbs: Allow runtime changes in RCU NOCBS
 cpumask
To: sashiko@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org,
 linux-hwmon@vger.kernel.org
References: <20260421030351.281436-7-longman@redhat.com>
 <20260422030856.4C8BEC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260422030856.4C8BEC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 4/21/26 11:08 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] Dynamic RCU NOCB update attempts to de-offload online `rcu_nocbs=` CPUs, triggering a WARN_ON_ONCE and leaving isolation state inconsistent.
> --
>
> commit a58a92fdc96e43de871fd44a78e4e6da373179d5
> Author: Waiman Long <longman@redhat.com>
>
> rcu/nocbs: Allow runtime changes in RCU NOCBS cpumask
>
> This commit enables dynamic runtime updates to the RCU NO-CB CPU offloading
> state when isolated CPUs are added or removed. It introduces a new helper,
> rcu_nocb_update_cpus(), which is called directly from housekeeping_update()
> to synchronize the offloaded CPUs with the HK_TYPE_KERNEL_NOISE cpumask.
>
>> diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
>> index 2d06dcb61f379..b2daba1e5cb98 100644
>> --- a/kernel/rcu/tree_nocb.h
>> +++ b/kernel/rcu/tree_nocb.h
> [ ... ]
>> +void rcu_nocb_update_cpus(struct cpumask *cpumask)
>> +{
>> +	int cpu, ret;
>> +
>> +	if (!rcu_state.nocb_is_setup) {
>> +		pr_warn_once("Dynamic RCU NOCB cannot be enabled without nohz_full/rcu_nocbs kernel boot parameter!\n");
>> +		return;
>> +	}
>> +
>> +	for_each_cpu_andnot(cpu, cpumask, rcu_nocb_mask) {
>> +		ret = rcu_nocb_cpu_offload(cpu);
>> +		if (WARN_ON_ONCE(ret))
>> +			return;
>> +	}
>> +
>> +	for_each_cpu_andnot(cpu, rcu_nocb_mask, cpumask) {
>> +		ret = rcu_nocb_cpu_deoffload(cpu);
> What happens here if a system booted with explicit rcu_nocbs= CPUs, and
> later a user dynamically updates an isolated cpuset?
>
> It looks like this loop assumes the active rcu_nocb_mask should identically
> match the new isol_mask. If the boot-time rcu_nocbs= CPUs are not included
> in the new isolation mask, this loop will attempt to de-offload them.
>
> Because the cpuset subsystem is unaware of the independent rcu_nocbs= mask,
> wouldn't those original CPUs likely remain online?
>
Yes, the code should properly handle a pre-existing "rcu_nocbs" boot 
option with a different CPU list. I will update the patch to add a boot 
version of rcu_nocb_mask and make sure that CPUs that are in 
rcu_nocb_mask_boot will not be de-offloaded.
>> +		if (WARN_ON_ONCE(ret))
>> +			return;
> If rcu_nocb_cpu_deoffload() is called on an online CPU, it returns -EINVAL.
> Could this unconditionally trigger this WARN_ON_ONCE and abort the rest of
> the update loop?
It should only be called for an offline CPU. The WARN_ON_ONCE() is there 
to just catch unexpected bug in the code.
>
> If the loop aborts early, since housekeeping_update() already committed the
> new mask to housekeeping.cpumasks[], does this leave the system in a
> desynchronized state where the scheduler assumes CPUs are isolated but
> RCU callback offloading is not properly updated?

Any triggered WARN_ON_ONCE() is a bug that needs to be investigated and 
fixed.

Cheers,
Longman

>
>> +	}
>> +}

