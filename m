Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E914D956C
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167398; cv=none; b=oA8N+s+lk1gHSray3aGCu4xVmqYJ3LRwxe7lXwT6zyUcbz2laR4EOpisJoEVrt6E0yLtQZeYcKmRT2hVTPilsJvQfkNXqicDoRJHSfE74q51JVH2vqo/VMbVJSQqXLgHN09w0mynbXd+csLBtEgy5eZl6R6mlbU5zYZNN2CDofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167398; c=relaxed/simple;
	bh=SnxQm2OWqBd/MnGlhTYEtXgeUhrXi+JwGOdsFKiHwlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/Crso1jmDqTCd/OgmBb/YWBn/GW62P1BSc3FMSnhUGJspWEPqDuJRpv+M2LpQKV+linA0coWVwlqpg6p5ZO5S32cZRkDTDhu/O8sBzt1F8WaMKy404iKvgSD0J7OpKDA4mnXgJDL0J93OgDLE0Hd9hMNYxzS3DlKK9hnJnQHmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZdrd36z; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZdrd36z"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd60d155070so76545a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792167392; x=1792772192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV426IXemjCo0tARnAuCDYkrcxzdrOKgQiA5hnmvVlM=;
        b=iZdrd36zqi3z2d90QZXYvQ+CfwjBKTGkbChvM/W2lb8b72ZCuK89bqFggHB9PUUptP
         hs5RZbHcA/cCQwxI5od64b2x3RvN5op5GtCSdV6RJUT/23dVvlj6Un8aZxy+Ikt9HH07
         Qi6fQ+qu4eRJRWBxMutx/EGArcd+FS2XY7PJcQFs73PInu0SS30pSFg5dI74+YmhY5pN
         +uz967gj3dJSnzdGffzYyAckiXsGCnGSinWe2a+kX0CMthsCs8RQIN6YrOiDX2n9aBp4
         BLCo30Ayn5BFqPoGNgzpDTZ25eUQIJPgfUH+ORjTllSa2SCpiDsNeZZNxpQ7XgTAe3f/
         P6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167392; x=1792772192;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bV426IXemjCo0tARnAuCDYkrcxzdrOKgQiA5hnmvVlM=;
        b=RQaLOvrGkFkcMe3qx2GvWQUVzUjLHK+KIDhvf6yDmB3CaoOfUNJyjSNkKWeQ1FZO0G
         WsD9kdW4cOX3/3PuWX/uODzga5I11Vu7Gd8ki0dt0NV90M8zthq6FmVxKbFNXdAceWjG
         jIL1e9L8zFskf9m7vNSIJzarCP89RSwsAMyAm/TlC7T+D+FiWIQ03PJIcjSzHGZDXacD
         Sz3Cvfi95tX+VvzYPoePB5YLgyr2pC/xqFOvm1Wy9Y/YB8RdEqfb0+38F1kUbj35v3h/
         e8oQpSESre9hZ9OZvVnULhfm3I55kq5moJGszinyO7GQy2fJVi/chVTOMBfRqBsh+xOx
         /rbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsF232adR1ONQ53GNplTcD0nG0by+Vr6ZE6ppZh+ACGHtBx6ZTs+8SGO4Hmc29xwKZ7yJ4r9EYtvMQXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLgrulRH58qQMER0QFfwEj9KNz8DUh0gjh1lEX5v/I31XZ6kq+D
	tKNB1nnMmfrBh1ygj8XmkF7g/EaQQdBdcb3aARrIdJELt6VBMf8INIvE
X-Gm-Gg: AYBFou1cx7cM2A26B2NRujS9XJfRzBMH5HxsN+NegUXZbWhl4S67JVJwNVFTHE1srxJ
	jwGT9axiqAhh9RVohHUM8HdcXtyxsMtvZGw82yCvHo6WGRpSocdTkyU31uJ+fr7zWBPNQ7MoENm
	0dtsOWR28VkqOHHfpx8SIJXruW6onJIXKk9yY6aR/1z18DLq+OA1Xs4nVY3L6PEaM1URaOdgCwG
	oBEzHRFSyGoaT4w6wLlvT7exTIR4Fj78Egzd4OMD3lcG74V8E6RlbtpfUZcGzRIk3v+je/0Zd2F
	uRLiu+CaHnvFMtP9NBmFQ2iayVMTgwxd1h/SQDZPfRJCUbngmGhMYiGyLANIEvWy5J0eOVX+SK8
	SatEAufVaQXwG+UP9RKXOwsccy6/St4cIkQ8XXmvLUQdvos3tFCCf7DEEJnHQ9yQBvtHWnHlDlG
	5hYWvlBV0lwPYlxQZi4xxoharmi1VmuAmy2jkCQCOtZMb4e3AUsnzXs4QLnv1LtQPP2SprrATV9
	vYYxRyxi4M2cV6nDQuQyKlo8Ss3/vQBf+oagdF5ZvbnL3/c
X-Received: by 2002:a17:90b:4d0a:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3acef293029mr284201a91.24.1792167391616;
        Fri, 16 Oct 2026 09:16:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947d2706sm9807829a91.16.2026.10.16.09.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:16:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <818d5dd7-4b8f-488d-ad99-3ce114027262@roeck-us.net>
Date: Fri, 16 Oct 2026 09:16:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] rust: hwmon: rework hwmon abstractions, add TMP108
 driver
To: skxby <2374604267@qq.com>
Cc: Donjuanplatinum <donplat@barrensea.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512155747.10136-1-donplat@barrensea.org>
 <9c2fa543-525a-4e43-9f73-7caf13b98039@roeck-us.net>
 <tencent_576573331343805F032731492D63C12D7E08@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_576573331343805F032731492D63C12D7E08@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 00:24, skxby wrote:
> Hi Guenter,
> 
> [1] Positioning
> 
> This series follows up on Donjuanplatinum's RFC [1], which proposed basic
> Rust abstractions for the hwmon subsystem. Your reply [2] noted that Rust
> support in hwmon would have to wait for someone else to pick up
> maintainership, and the thread has been quiet since. I am not re-litigating
> that decision here. I have taken the proposed abstractions, reworked them
> against the current rust tree, and written a real driver on top of them
> (TMP108, mirroring drivers/hwmon/tmp108.c). I am posting the result so the
> work itself - the shape of the abstraction and the driver built on it - can
> be looked at on its own merits, whenever and by whoever takes the
> maintainership question up.
> 

By now I add a new concern: Much of the Rust code I have seen as been written
by or heavily guided by AI. I even heard the argument that Rust code written
that way would not have tho be runtime tested since its inherent support
for self-tests and the ability of AI code review would already ensure its
quality. I do not believe that hype. Others will have to accept it.

Guenter

