Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976314;
	b=ShJMnkJiHxxoP+R3oGVMx/rz+D2CChkDFqA+86EK4vBl2O07TS1CGZvDzEwH4Gsw0Whe
	 XB2oFTAr25/lRIY3mElKYZw6OsGhPV5FBwnCnhWeXbRF9QDd6UqAAaiDP2S1X4GO2Qt6N
	 v/sKEbGye1y55N+GSdp1TWBBzW3D+s+bfbsKSKm4x+atTFiT8Q/U33/8lo2Nv6Sk6uCi9
	 L3PEs/ckeXe815jBTBl4+swIsABzR4Sjfc0G65mG/4PrSCx0w2bPcJEIfD0Anc7AFhCd1
	 BZ5yu7tkhVaJQUwhRFxrH2YBs4Goe9WHySz5Bs+p09Y3MBXkDXIq+vX8km9sOa37YQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=V6XEtkWxuej4IEYIwv0eUDHd5HsULUW/pPlJVdLGiWU=;
	b=DrZuMsBqGOIDon5VPd4838D8mVPrvUfwUyEN1rpG/gpykeugFJxISjqPAsTOH5HmwX+0
	 ag+Y5VSpTwGYd2Iyp/U7n+02CQbnreuqOt/0aBgPnBZD7gOWPDd4lS37ZX4q13krSdzpP
	 HxZblr4Ptynu/X5nIteWphKPkkGklxReDxmh/40H7a6/EpFjnEQ4cgw2EAGc4Y52umoxO
	 WPhbwJHC/PBwVMNpLDibfdCij3Ah30m/WGMC69bERJpl5ttAUJxInUpy7a4gsssRnVKs0
	 skX+0oDBkcd+xHrJK2kGCwhhaSekWuj3k8tTl123JXveOCqBDUGAAlOvS0NVhcMpN8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f+CAz1ZK;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C3C606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C3C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f+CAz1ZK
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a05b210703so925615b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976313; x=1793581113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V6XEtkWxuej4IEYIwv0eUDHd5HsULUW/pPlJVdLGiWU=;
        b=f+CAz1ZKWhBKwDsPwUx64Uky52lZvae9T64JKjHaNee/0bBgrRCJvH6GzFOuPRcqNJ
         fWNWnsv4fLDSSgDXv/1mStQdRmFa9tY44zaBzg6/xQeeDNcTYHTbfdzp+dmwLLRbsEtk
         BTRCD7wZYH9sOuf17HIgIq8Y4lOuZGRjLHYIdaeRLOv8oJw3rx84/DTPLOTxPCpiFZml
         EfOolz6iO7kdUQdV5abRQFVvcxrUw3RDv0LDhRAfEe24zkWqRlqF/Xea5VgZ+4zI69Gj
         qok77+IPJX8463Vi7CGb19Jdecyci/xtKFJLijT0b0kC3TgsgfF15SyAbrxo+odt/9cy
         g96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976313; x=1793581113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6XEtkWxuej4IEYIwv0eUDHd5HsULUW/pPlJVdLGiWU=;
        b=RpzxkjG4mjADwW1biXhvvBAwW64CYntqLUB2UakCPj991vvFwpn5Lg8L3mWAVrmYIH
         cIeeeWz8xHTqBhq7n8Q40Xj2wDKSxgebF4OObBUfZ01uV79oqqfcaIDZhFCq/ayxZHGZ
         1xwxCB5j8zqPwdPRENrJM//cjtIw+RipAwb3eeab6uD/8Y/9iUGXt+du4dIoCmDGzzWL
         Lrz2ZLqgYAVkb6MfFq2nvh4iUfI2t2z26BIoQFjjeKOhPr8H3VexI1d1Zvvm0kBpqaXl
         p4+1uQOXIDt/AJfev6T510XMMbN6qA7TzQdJiCKceWAL5teqEzuLDbAxRlfcCZu/zwde
         l/OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQez1UGru0e9F/od1FG6J0dE3ZUbHqOIoX8pfpjoIyhSh76ctLtq9TFTt+XskpLQ/2+VpZpi6/x/7SVg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIt8Amp7PpBxHynWASgCc/ZYf9Hes/trpeVt+5LLYX8Sma8jmZa
	kVdZXq88pEyJ0rheVJlLBySfzLOwDXINQXuotSnJuz3b/hphGYbTFCb8/BhuwQ==
X-Gm-Gg: AYBFou1Xider2bWqMhFHo9p1L4fqmPe4MSzsCQCSR0IerE8X37IHoB1lvOxZJkxUJOX
	0SVLew0bd+1vr2X97JvR0nYPk4if9tpjsrq8VH2GpwBUmdn/LwRIRnbd295NC169GHTIJHFmz7O
	WawyWiCocP0R6ZOS+YQfD3lC4bvbegJnRBVrPcY5nw6lXYPb9JgdykLJmRLmZoVn0Y6H+ccIiwl
	jObsgde/317b37bP/yJZck8O7E6EzyuoqCRgCJikOeKLt4Btw/cQXa5pbfNwuGgX3sCadI7Z8ED
	7CEi/8ZKc4ddlf9XuSFCgH4rWDDdONqZclY7gbin25MbtZJtcRlK99DhuOVCojFbZonOzyhlqDb
	6XYP4od0e8jDpzfmqHLMcfYorGHj/cTsUFyhKdp7bGIf8FzxmzzYwubb1CuIultib9udu/80kbV
	+bX5zBOnV5dz0zt/woa/xfoPzwzkC1F4wrKrAxgdkGWTdG2iofGZQtTNDTRZ1wB31HtNi0haZkm
	mIWjIffnOIv+2q6HnsP3FplaSA7RIz02xzQ9W/yBr2WicNXnwTHVPPIEi1PcHLzfKcGyw==
X-Received: by 2002:a05:6300:388:b0:3dd:85aa:4524 with SMTP id adf61e73a8af0-3e7bfac61c2mr3509972637.31.1792976313097;
        Sun, 25 Oct 2026 17:58:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccd4cfbsm1063454a12.28.2026.10.25.17.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:58:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:58:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiale Yao <yaojiale02@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (aquacomputer_d5next) reject short status
 reports
Message-ID: <aa00972d-b3d7-43df-bd0d-0778e3336a04@roeck-us.net>
References: <20261021120408.48495-1-yaojiale02@163.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021120408.48495-1-yaojiale02@163.com>

On Wed, Oct 21, 2026 at 08:04:07PM +0800, Jiale Yao wrote:
> The HID raw_event callback runs before HID core validates the received
> report length. aqc_raw_event() reads device-specific status fields at fixed
> offsets, including multi-byte values, without first ensuring that the
> received buffer contains every field. A truncated report can therefore
> cause out-of-bounds reads and update hwmon state with unrelated data.
> 
> The required length differs between supported devices and cannot be
> derived from the HID report descriptor. Define the minimum length needed
> by each asynchronous status format, select it while configuring the
> device, and reject reports that do not contain the last field accessed by
> that format. Keep the published length zero until probe configuration is
> complete, which also excludes legacy devices whose status is retrieved
> through feature reports.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Applied.

Thanks,
Guenter
