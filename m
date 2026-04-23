Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9939658D
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 17:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776964468; cv=none; b=dour5VH11J9NXAtZeKxyu00Svxc/7GGqeY28UYfUK4510RJoMGOMdYLavIpSQjRYZUURVb2EUhtgCdWtXuHF5/w78OrP9IsLUgeQ9YL6GF3npSqvRpoORCBmTCcZuwkN24Fz6aOFIXa6RfqpG7Xsqh2daYAShx7iVW2Ln3oVUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776964468; c=relaxed/simple;
	bh=G9gYIqiJZH3x4Wd3FZ7K2/ftVazvrHlUq8wqIBa9t0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0kLdHKtTuLlDNhFR9uINE4SmHviA5xOv0whJ3LeNTMPYCLTXnnMJlm/ep7t35KZf/UA2gHd7GLiZZVbA1SNKd2WTqSHpx/ElQawykKnPBz3onQkFSZBOFEcODBWFLpGD9NaSP/GQszhOfXMmagWXiCWU7BCsKHLp+x4Er5Pfjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dflUQiqs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dflUQiqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776964465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkbEHhhMmACs3UZ26qAlaoK+RzA4GptAr5Mka9R5MuQ=;
	b=dflUQiqsC2hfgYqrKeXVfC8XERER+6tq9hOWMSrx55q1ZvWPQIT6zzdZSZ+/v/1K+Ozrdw
	CuAofpB3uj0bUst+YhbaVgLa1TnKGSOL/vJz2bM0aqGFOOHb9x4nntkz0phSgSvZMRbZtR
	hDBL8tXSlyzgOEJmwdVyVmE7WKqZ0Rw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-7wd5s6mJNduklnT4bWEKaw-1; Thu,
 23 Apr 2026 13:14:21 -0400
X-MC-Unique: 7wd5s6mJNduklnT4bWEKaw-1
X-Mimecast-MFC-AGG-ID: 7wd5s6mJNduklnT4bWEKaw_1776964460
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21DC81800DA3;
	Thu, 23 Apr 2026 17:14:20 +0000 (UTC)
Received: from [10.22.64.201] (unknown [10.22.64.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0DDEF19560B7;
	Thu, 23 Apr 2026 17:14:18 +0000 (UTC)
Message-ID: <de014167-693d-418c-a814-dc498ac89ba0@redhat.com>
Date: Thu, 23 Apr 2026 13:14:18 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/23] Drivers: hv: Use RCU to protect access of
 HK_TYPE_MANAGED_IRQ cpumask
To: sashiko@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, linux-hwmon@vger.kernel.org,
 hannes@cmpxchg.org
References: <20260421030351.281436-16-longman@redhat.com>
 <20260422030903.E1BFCC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260422030903.E1BFCC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


On 4/21/26 11:09 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 3 potential issue(s):
> - [High] Infinite loop causing RCU stall when a NUMA node lacks housekeeping CPUs.
> - [Medium] Mixing `goto`-based cleanup with scope-based `guard()` violates subsystem guidelines.
> - [Low] Unnecessary unconditional memory allocation for non-performance channels.
> --
>
> [Note: Due to recitation restrictions, this report uses a free-form summary
> format rather than quoting the original patch lines directly.]
>
> commit bc4398753271c194097795d20b6095f594c74b4c
> Author: Waiman Long <longman@redhat.com>
> Drivers: hv: Use RCU to protect access of HK_TYPE_MANAGED_IRQ cpumask
>
> This commit uses RCU to protect the HK_TYPE_MANAGED_IRQ cpumask during access,
> moving the cpumask allocation before taking the RCU read lock since the
> allocation can sleep.
>
> I noticed a few potential regressions in this patch:
>
> First, looking at the loop in init_vp_index(), if a selected NUMA node has
> no CPUs present in the housekeeping mask (for example, if the entire node is
> isolated), the intersection of available_mask and hk_mask becomes empty.
> The code then clears allocated_mask and jumps back to the retry label.
>
> Since the variables do not change state across retries, does this create
> an infinite loop? Because this patch places the loop inside an RCU
> read-side critical section via guard(rcu)(), would this spin result in
> an RCU stall?

Yes, it is possible that it becomes an infinite retry loop if the 
HK_TYPE_MANAGED_IRQ housekeeping cpumask does not contain any CPU in 
that particular node. I will post a patch in the next version to fix that.

>
> Second, the patch introduces guard(rcu)() in init_vp_index() while retaining
> the goto out_free cleanup path for free_cpumask_var(). According to the
> kernel's cleanup guidelines, mixing goto-based error handling with
> scope-based cleanups like guard() in the same function creates confusing
> ownership semantics.
Will remove the added goto instruction in the next version.
>
> Should this function be fully converted to scope-based cleanup, or
> alternatively, use explicit rcu_read_lock() and rcu_read_unlock() calls
> to avoid this mix?
>
> Finally, before this patch, the code used short-circuit logic to skip
> allocating the cpumask if the channel was not performance-critical. The
> patch refactors this to unconditionally call alloc_cpumask_var() at the top
> of the function before evaluating the channel type.
>
> Does this introduce unnecessary sleepable memory allocation and deallocation
> cycles for non-performance channels?

Will add the check for perf_chn before doing memory allocation in the 
next version. That should keep the current behavior.

Cheers,
Longman

>

