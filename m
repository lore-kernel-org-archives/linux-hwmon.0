Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E644C3B47CD
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 02:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776910462; cv=none; b=NbRgiJjnRbF4LzeTa+zAIcRGWftMOP3jSLn9E+XibIfnIBzj+o78mWv+HuzVxTCUcbq2GKAkTFfwHaGDLnNHEfoY18gzKat4kIbKi/KWKHU5U36G/D8hjOXrcrOgP4eZ6YpxmgGkljC8ERVfAdf3uRM9ORpSn+cCfAh+HBmPBNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776910462; c=relaxed/simple;
	bh=tgBQwpJ139wlLIX/bGdV4fcLSjzSA1eq++a34H/dG1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C41VlKnHygIobQwA6wf6Xoqu5GEFbopo5vJMVcjOcGtl3ogSQnE6iKcmkpoY97H/CyEmAn3BpjrWxCQ4IKei1H8vSAYUkWAG38nrerF4OhMGAh5lb6mOfse+jOQDes8b1sJKN6CNN1Xrova96eR/azB98FXbWCQ7EtN0hwQDun0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K+BoR8+K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K+BoR8+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776910459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbtkQ/En4TGiieD7CE8+o4iewO8NWypLTpf0FItlbgc=;
	b=K+BoR8+KPAfUq3WfguSnYJ+iqUMekb4ujkhW+UMHciw80bNND4k0B86f5sNvf4gnxmYC84
	+s9szLErV9nmKmQXDN0eOnM1HaE/rkO7muOn8dqctiqTUgajAZ1C5KyTYC3ckNH8XJsR/k
	ew+LZi0yj6PXecuLgraYFawuqlDDHgo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-5gEcmS43MYKsB0d2BDSZwA-1; Wed,
 22 Apr 2026 22:14:16 -0400
X-MC-Unique: 5gEcmS43MYKsB0d2BDSZwA-1
X-Mimecast-MFC-AGG-ID: 5gEcmS43MYKsB0d2BDSZwA_1776910455
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 037001956065;
	Thu, 23 Apr 2026 02:14:15 +0000 (UTC)
Received: from [10.22.89.141] (unknown [10.22.89.141])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E4143180047F;
	Thu, 23 Apr 2026 02:14:13 +0000 (UTC)
Message-ID: <f547a35e-1b42-4680-b25e-a022fe477eaf@redhat.com>
Date: Wed, 22 Apr 2026 22:14:13 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/23] watchdog: Sync up with runtime change of isolated
 CPUs
To: sashiko@lists.linux.dev
Cc: mkoutny@suse.com, linux-hwmon@vger.kernel.org, tj@kernel.org,
 hannes@cmpxchg.org
References: <20260421030351.281436-8-longman@redhat.com>
 <20260422030858.040D5C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260422030858.040D5C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


On 4/21/26 11:08 PM, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] Silent overwrite and clobbering of userspace `watchdog_cpumask` sysctl configuration.
> --
>
> commit c51e1c592377490b0da49dd889417304c34badc2
> Author: Waiman Long <longman@redhat.com>
>
> watchdog: Sync up with runtime change of isolated CPUs
>
> This commit updates the watchdog to exclude isolated CPUs at runtime by
> adding a new watchdog_cpumask_update() helper. It modifies watchdog_cpumask
> and watchdog_allowed_mask when the HK_TYPE_KERNEL_NOISE cpumask is updated.
>
>> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
>> index 7d675781bc917..f35374abf457c 100644
>> --- a/kernel/watchdog.c
>> +++ b/kernel/watchdog.c
> [ ... ]
>> +/**
>> + * watchdog_cpumask_update - update watchdog_cpumask & watchdog_allowed_mask
>> + * @isol_mask: cpumask of isolated CPUs
>> + *
>> + * Update watchdog_cpumask and watchdog_allowed_mask to be inverse of the
>> + * given isolated cpumask to disable watchdog activities on isolated CPUs.
>> + * It should be called with the affected CPUs in offline state which will be
>> + * brought up online later.
>> + *
>> + * Any changes made in watchdog_cpumask by users via the sysctl parameter will
>> + * be overridden. However, proc_watchdog_update() isn't called. So change will
>> + * only happens on CPUs that will brought up later on to minimize changes to
>> + * the existing watchdog configuration.
>> + */
>> +void watchdog_cpumask_update(struct cpumask *isol_mask)
>> +{
>> +	mutex_lock(&watchdog_mutex);
>> +	cpumask_andnot(&watchdog_cpumask, cpu_possible_mask, isol_mask);
> Does this unintentionally discard the existing sysctl configuration for
> kernel.watchdog_cpumask?

Yes, it does, as documented in the comment above. However, except for 
the transitioning CPUs, the watchdog activities in other untouched CPUs 
will remain unchanged until the next time one of the watchdog sysctl 
parameters is updated. I will certainly welcome any suggestion of a 
better way of handling this kind of conflict. I should update the sysctl 
parameter document to highlight the expected change.


>
> By using cpu_possible_mask as the base, it looks like this unconditionally
> overwrites the entire watchdog_cpumask with all possible CPUs except the
> newly isolated ones.
>
> If an administrator had explicitly disabled watchdogs on CPUs 1-6 using the
> sysctl interface, and later dynamically isolates CPU 7, would this operation
> silently clobber the user API contract and re-enable watchdogs on CPUs 1-6
> when they are next onlined or reconfigured?

As said above, the current watchdog setting of other CPUs will not be 
affected until when another watchdog sysctl parameter write.

Cheers,
Longman

