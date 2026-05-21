Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0385335677C
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 03:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779333699; cv=none; b=PKG0JWK3x+IKeM2OnSQ0gs6dqFhAP2SsN5A7eJK9eurF6XQJrfe6Epwb0rfrY7/lSTxmznS7CD2w6fSMXDAnK+HdtJDQ2daCRqVbvQ1spLPgeojQm3EITnzFak46vN9t5on80H1UccsoPcXeElugjpVjhLXExd7wLdnzmFn/H4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779333699; c=relaxed/simple;
	bh=7vKJfReVHTqlLDtTCR60wcc4317N0UuwLu664Gww9bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOxydF7v3Vv7FISw0BVtZuhxjXxEuG3n1t3evnrYEekgRqhvR6B/pVA9ofToxj91atcZUk8uTlQpR/f7Gua/L3Wrj10maq4Q+HxiAOgixuSDQZWLXYWTbqcWqfPnEfEZExGOQ0rfYWjdPmd1wZ4JvusBj0+PnCwb2GJcdXWe+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KESInHVA; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KESInHVA"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1363fe80fe8so22533c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 20:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779333697; x=1779938497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZ8txBXaIoej+lGMf0Ak8SbcwyYcdQI+h52688H57Sc=;
        b=KESInHVAGq4CXfbGghUFThvJzOEnIh28zGfd2n/HF/H+RI7M2e9+CIoyukiPA85RNq
         bMaCNVMbs7+rG3wFVZU5lywY9Gq8lBCIUOT0HevgpnnZsuoWAGabBE8Ij0EdWI2Qm1xY
         4VmhUWIioPz0J8UlO+EtNIYWMRRBEQ7snWXWfjeH1G8EPegDJyrHYrq1snc2M4PK9rvV
         oalzfsPEmjQQ+3HfFxKpv03c7Q34qayIzTfUOYEZh5DG8yAamZ7GIcLRA4tY2UgN5/Oi
         TZ/sGywRdCjiJT+ciX3GiXXPSD0FycWv4JEBVrnmMe0GwQAJwNWWLKtdnFIC+iZnSPc1
         ICYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779333697; x=1779938497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dZ8txBXaIoej+lGMf0Ak8SbcwyYcdQI+h52688H57Sc=;
        b=rJ0kgW+sIvk/lIUdwxHxZpChQBQ7qEMnCs//ZuTke1suUEdQ7Ts8l5/y+zffdH28Ft
         eVS6iFpjzu+i9KIp0fwLPzwwXUYjnazEpTjUiCSqjdlyVazN6XOSAMHxq4hvnhtwMC70
         c/MAfzg/3+xB01hzOzSsyQjJ+eNa4+fYvcbMDAwIQ2y0Lpqn7VBZv4Co+YCAgLLTjklN
         lR1tRBiMPEEcorkPgpDo1+06q8SRjwQDPDZXlxDnnhuBxGpNQEOdrkGwao8wthMdlBKI
         lWwCpv9uZT/pNDTUtN9rEa//1rTIw/9dTc0iJkFPhR6c+/m5h9C69jhDdRKtTHv3jPho
         ygqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vONYEwLskJdg+giRvsvwgnLE46+HLV2RWekjLgL2sHV6hsTEjfKim0Bgc059ESOq4xODjGx4L762pzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt0p9yUD2KQ1qI4Rj8AvhhjLrPa86Z/LicmL+y0cp9ppWZAzJS
	J2OQnGir7lCNgcbzwtuGoUtRYvXMQBnPttmvAu82GN0k+Y38SP5czaN/
X-Gm-Gg: Acq92OG3NW3ImWhClVAB1Jn06kVA5N8pZEyFkOU3jmucj8jwpIfCsiP8Tl0oTZWJE4r
	7Zf4bWtfdg8FEo99OXM5saYhcgQUruzqIIGKu/uKDRVZMebuk8tRPVGs/VukahfnSLfpZnc4vHI
	IYSwRrCIRsFE4KFWvgisvwNUSLk3INcU+M8iNiHAORL6kvCkD9PqiMsTJJUxp/0KxaXtOY/aLQX
	aHqFsSIsXnL+4gagNCNmcuem19usiXo+Cwzt7lbC+CI3QlnRp0+8Pl0VcJG7v3qIi744isUGmDg
	pGNycYspiJ5LAoI38pAYiN1fvmEbJsQvyDaZEqrzYcb4/MiKJLMYxxxr2i1yyk9hBKoQalbmmyi
	jWzvLwDfDf78QVFnkMw1INn0xqWYSWv6zSwhI8cQsutHjyjJO7PoGbAjgnqhjq3RTz4YukHY44i
	sb4uTNCSWw9laejxKybJUnchK3uOsJaJ7iIiPu
X-Received: by 2002:a05:701b:241a:b0:130:73ed:214 with SMTP id a92af1059eb24-136327e4904mr301506c88.1.1779333697030;
        Wed, 20 May 2026 20:21:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm29418937c88.7.2026.05.20.20.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 20:21:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 20:21:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] hwmon: (pmbus/adm1266) add powerup_counter
 debugfs entry
Message-ID: <1da8e9c5-2b41-4f96-b572-f9047e842e32@roeck-us.net>
References: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
 <20260520-adm1266-v5-2-c72ef1fac1ea@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-adm1266-v5-2-c72ef1fac1ea@nexthop.ai>

On Wed, May 20, 2026 at 03:42:41PM -0700, Abdurrahman Hussain wrote:
> The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
> (0xE4, datasheet Rev. D, Table 93) that increments on every power
> cycle and cannot be reset by the host. Each blackbox record already
> embeds the counter at record time, so the standalone live value is
> primarily useful for matching a captured record back to the boot it
> came from when correlating logs.
> 
> Expose it as a read-only debugfs file alongside sequencer_state. The
> block-read returns two payload bytes in little-endian order.
> 
> Take pmbus_lock around the block-read so the access serialises with
> any pmbus_core sequence that sets PAGE on the device. Without it, a
> PAGE write from another thread could interleave between a PAGE set
> and a paged read elsewhere in the driver and corrupt either side's
> view of the device state machine.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Assisted-by: Claude-Code:claude-opus-4-7
> Assisted-by: sashiko:gemini-3.1-pro-preview

Applied.

Thanks,
Guenter
