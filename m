Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80063793A8;
	Fri,  4 Sep 2026 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558400; cv=none; b=YKm1XiP/HgqFQe32euvQm7wsqnfgMKoNRwB0gOm0l0tVPZj5S+F09L1eYUnEKRVdgxvnvzVcl+laitPkIFDWL+E0Irv15iMMkyLDbbtdhZg/777fFg9ercj0BY4AhraDNhMJGM57NWJ7p4PN8nB9YLkL8KOxtNksVXvKAC7r3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558400; c=relaxed/simple;
	bh=rqKjNfUuwX5VnmLe2NH2KoMFXFc8L4scXD5nNv1v5e8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jGnao0iX0S965pefcpIpjxlj3qNsvh3MV5Sh+bzTVoT80sJY+D4eLe4Ep+emlhWywOsR0MNp79zHbEu9pYDK6F45CSXPfgD1HMZSbk2SF8XHyjrkANRUuE7Hve8pVZ65ccIecT7pCl+DVNL5oxTrXRXD+vGXuaa8H5mEhgjrXqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYTJpXH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYTJpXH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF231F00A3D;
	Fri,  4 Sep 2026 21:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788558399;
	bh=B4vd/mtS/RKg2aP5BcidTPB1uratbFRjzPJr/6Uddss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YYTJpXH6QXE3GPk38CmqG9yjFTr7K+iFtsHZGwxHbcR6fKHf24pAnY9JiYwuFDoHJ
	 ek2URpVq+apBMMPxjDXnzRwnVlTGuM6vdhSeOOFvf5qcD/w7MKTx7HB90VCEz2E+8S
	 MDasZuJ1jLqNL1gX4dgki9C6XWR0ynWkhi6fHxbR5bEywYFF+F2LO/4lEd+r1+UeXS
	 IDl+DI8Kf7JQL+Fq9H7is7xlGfyKmx11pWJzGjoUEmsoTtVtQZhMKsZ30z6LPlzYtm
	 PwN9LXqmiJRayIjysiBDpbsx+soL6/v2Jv1Vcii+loj4VXzwPD9Rogtzrg/WggkT4a
	 k0WRzyqMgGo4Q==
Date: Fri, 4 Sep 2026 14:46:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: limzhineng2@gmail.com, alexanderduyck@fb.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Subject: Re: [net-next,v2,3/6] eth: fbnic: cache hwmon sensor readings
Message-ID: <20260904144638.65481b26@kernel.org>
In-Reply-To: <178840584931.3394541.12792852899042444344@kernel.org>
References: <20260831212234.1212971-4-limzhineng2@gmail.com>
	<178840584931.3394541.12792852899042444344@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 03 Sep 2026 03:24:09 +0000 netdev-bot+sashiko@kernel.org wrote:
> > @@ -25,26 +26,32 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
> > +	if (*cached != FBNIC_SENSOR_NO_DATA &&
> > +	    time_is_after_eq_jiffies(cache->last_read)) {
> > +		*val = *cached;
> > +		return 0;
> >  	}  
> 
> [Severity: Medium]
> The cache validity test uses the wrong end of the jiffies helper
> family. time_is_after_eq_jiffies(a) expands to
> time_before_eq(jiffies, a), i.e. it is meant to be applied to a
> deadline that lies in the future, but cache->last_read is a timestamp
> in the past (it is assigned plain jiffies right after the TSENE
> response is parsed). It happens to give the intended "valid for the
> remainder of the current jiffy" behaviour only because
> time_before_eq() is a signed difference that goes negative one tick
> later.

This may be theoretical but it's also easy enough to fix.
There's no reason for us to use time_is_after() when
we want an exact comparison
