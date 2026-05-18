Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3732F8E85
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114886; cv=none; b=jErr7IUnZTjitj6ZNhWB4K1klF+kMEPlrUZQ0uG6e+Hm0nQXFvrPmF6vMAXleiIsvMPVtbL59CFdXaRYcRpKof22qcBanxkNHjqH8JU5FTE1fCS5IphcfYqDvS81lFfOkaTgFuVkkEz/KHegCbMonVzVmfABEmgxXuYFClU/YNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114886; c=relaxed/simple;
	bh=kEzuKrjF9DSnzIGSuxEBMLoh+RMcJn51uHfaxO6O+xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PA+6eAPPexqfEKV6lel0UpdyB2h99P6eCcy+2hcF0CvI6kHy23Sdk4fVqeaBxm8a1VS2ct8RIuy5YQ0LgN8H9uT57mTk7W4lNGyGZNlWUhfp80A+YkWOSJdryNWtQTsZy/tQWL3qKAGT37FKe71U2BEI1c4gj6PzwsApopRo0/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgDTBoSp; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgDTBoSp"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f3c623322bso7521077eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114884; x=1779719684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tq/tMENDugKK+/odHb7mfz+FK++239XdK53ZrKDvh54=;
        b=SgDTBoSpws2SDVMRrRxojLj96c+lQx1NUDLHEG+6HZx9roYmYejcK8XiLrv7rByJSD
         lWTYGPeHVh1eztkpzvvPeYgpb/LejNF+EgF/L6GEqegTZH+BKQEa9empMRzGmuqhyOmU
         HcSw8XBnO5dNug7ufATn7eK/D6uxtwqGrq8QAuh8FErC5P4WHtw3++wprUJz5u3/L06h
         b7rIxMamP1BHJYYOn/vZeuOIunnsK8jGnB6snu5GqiXGVik3lOy9VaR5pGE//psRUQ6A
         6bIzEuWhgbtvaCfcXX3/RRVzJJ+0sTXvT+CQTdafWe59c330SJJXSCEntpju1nhR1+ji
         LA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114884; x=1779719684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tq/tMENDugKK+/odHb7mfz+FK++239XdK53ZrKDvh54=;
        b=Rma74eVkOko3bxSBSnmpZ6+/B/7vCi032fo6KkVFt33OtdnC0mqrFoVpzCuuUB+x/B
         XkNPxY3Ty3uXj0Pu8fTlmks39oSNLe92932S/Q0eWlB/bAVESRh0gVgGMGlhhlHKlamO
         gO3cmKdH8QFfQ9NqjscWdIcZCEKw+gWNObMquLxwOR2kxx6igSdLMHFfKh56vz+Y2NyK
         oh7pyp5XOeorKs7wa4uW0LsIU/5NTfotkU2ZYZb3irNkysCsRe6gzNiNYJIvn0W5wHIx
         Q4tAP8DA7QYcCKE/KIxmmi9F414HZpDlXxtseyRZb6prFmQ7EQrnqI+nUlYiaGBBHs4x
         TMvQ==
X-Gm-Message-State: AOJu0Yye7HxKGCCr47VMc+H/ZdP8uqDURdMTvh/ogAzDWO4vLGRxrYvI
	MK1Z2oLriHD+5eVL4sdsPB2z0AkHvyIV2OVnnFJoS04YPUn2rHz1OoXr
X-Gm-Gg: Acq92OEcRKBrC0ke/aeIqtazIHPlh+TKkzRiR6oTNR+k/YZFdSwQht9dAAMrItLrW6b
	SfsJ0tgQNpE4GFWsdwWg2EWarVidKP5gQMfwJbfo+PtoYIAho3ijfsbVrKqWHD4vS45r7r7WdbJ
	+V4pKYPEJFLgqT03V6LUO79PNX5pLRCxvdkOfNYiYLIaWbLTma0sPL0mkCZqzCwTai3m0ImjJAx
	YAMKuphj+kyRPOeWQ7voHMRUB/O/9353yzAp7oku0E0bG7CS2vCKTPZhSBZX9iBP2kH77CmwjEB
	CtTmkKS+D36mIIOQI2V3gOccDH2vUJF2XX3+/koHsjskABtZ1QIvkSDEBBRNnBAU48bLdECAvCW
	ybEDMl89GzgRoIXbQuaWtiQxOw/bZlYOraRjOuLZgFI8drQPbPZI00QN2D5iByAOVZy07vQM143
	qdpu2uKqQ3W0MPOdMpU9sUWBqguN8ByO2SynZ4
X-Received: by 2002:a05:693c:3282:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-303986b1633mr6802967eec.33.1779114884385;
        Mon, 18 May 2026 07:34:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc458sm16627652eec.18.2026.05.18.07.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:34:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 18 May 2026 07:34:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (tmp102) Drop unnecessary __maybe_unused
Message-ID: <9ed1938c-8cd5-4617-a776-5d148044ba97@roeck-us.net>
References: <20260518122210.10288-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518122210.10288-1-flaviu.nistor@gmail.com>

On Mon, May 18, 2026 at 03:22:10PM +0300, Flaviu Nistor wrote:
> tmp102_of_match is used unconditionally in tmp102_driver, so there is no
> need for __maybe_unused.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

I'll squash this patch into the preceding patch.

Thanks,
Guenter
