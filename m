Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370812BEFEF;
	Wed, 30 Sep 2026 03:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790737236; cv=none; b=A8lxwMxCqX6Z1zVkfOuGFe3tL8lFGZ/qChQ3X/nEo9svDg8oDwZEjYLXhQfRGXcDlOgxs/0QUxVL0JzQRrYnBwEQskP+oV6Qibnr4L0/gpiMqne2dMrCYBSwl+NOvBff8DOPJ03CtNRhmLyRGaRPEBJUzuiVSnhD+/tp2YMWWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790737236; c=relaxed/simple;
	bh=CVMMrShCxhenuW9o0KdqnNkD6BS3Dmorg3Sfym0XP0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8UwjrJ2wUqBpzCaSavXWHW6nUS69OcGSUfk84my+guTwryFMOcnprR0Vi1fXDgAAKRmzP6m+O3/XUAUfQnCnBvLOCWCitQJ51Eomme3w6iUeBuxP5VNZV+jhOthN3nEKX4WsarzKzOS9suGICPuW0joE+WVrWkIqgCnl2ZJW4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=AzCsVltY; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="AzCsVltY"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D029140E01F9;
	Wed, 30 Sep 2026 03:00:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DobpoUm-NcaF; Wed, 30 Sep 2026 03:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790737223; bh=tPKVmMRG/COTl6Eha0+3dWgLO9+BT5CKWJKsIEdZx7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzCsVltYB3ZPvMurNm4ndw87o/+yDci4TM14kxshyVBQ//hMae6C403egHWF9kf8j
	 rgqSvacQT6HX4ORCzphHrXk00WSZUuk309ekqqU4QqvxxHwmtG/9lqm29asQvQoytd
	 LLhkY9OHFuNS8ifBGJgayIdNdRYIXfijgZnQMsjADwcgTFZ0oaVMc/h1kwF58bYzEL
	 Rkqk1IPrimpSUFZACsPe+sEl0Y02WZJMlLKd7hzr7MgZZNjsPusrOz3hmvz9bbBY9O
	 K9938/Zul10T/D2TZEkbM8kCWyMfkHLjTpMeuhghFGWYCPnFmLD7/xIO/85LbGaqmx
	 OrCUo/k2GcujnzzLofmZxhcNkRZdvTEzkllW3GHJDYZ3recbkdkwrTxxr6P1LJBaoh
	 d9YdxY3ixIpDnIKWRqTfmEVuw0brOuuoiERin5efPmt/J1p26GQENIKBG2pDFVj+HS
	 hX2FIsSEDJIkYLh4vTjHptEAYG94lyn5tRvdF+vaoOgxhTih4BOPpVIkuCesHpRzbK
	 NxFGPOGHKtfvM53TPeZ2MuJm+Xqxl9v+QPokNM83Nw5JTr9b2YFMLtXzwo+uqN/7rf
	 VTvf5ZsRfsPn/44hX8pNopcfQR7S6J4EoiQRjKI73blRMNsgZQtX4T9cy+coXFmTP4
	 g4B38o2lTmEOa0ly2eNAXZw4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 71A6340E015D;
	Wed, 30 Sep 2026 03:00:07 +0000 (UTC)
Date: Tue, 29 Sep 2026 20:00:04 -0700
From: Borislav Petkov <bp@alien8.de>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Guenter Roeck <linux@roeck-us.net>, x86@kernel.org,
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/8] x86/hygon: Map CPU NodeIds to DF nodes
Message-ID: <20260930030004.GGarx7NIIToO-fWAww@fat_crate.local>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-3-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921055603.25112-3-wanglin@open-hieco.net>

On Mon, Sep 21, 2026 at 01:55:57PM +0800, Lin Wang wrote:
> +/**
> + * hygon_cpu_to_df_node() - Map CPU to dense DF CDD index
> + * @cpu: CPU index
> + *
> + * Hygon Fam18h exposes sparse physical node IDs via CPUID 0x8000001E
> + * ECX[7:0].
> + * This function translates the per-CPU physical node ID into a dense
> + * DF CDD index in [0, hygon_cdd_num()). The NodeId reported by CPUID in
> + * a guest may not describe the physical DF topology, so the translation
> + * is unavailable in guests.
> + *
> + * Return: DF CDD index on success, -EINVAL if @cpu is out of range,
> + * -ENODEV if CPU-to-DF mapping is unavailable or the physical node ID
> + * does not map to a known DF node.
> + */
> +int hygon_cpu_to_df_node(unsigned int cpu);

arch/x86/include/asm/hygon/node.h:81: * hygon_cpu_to_df_node() - Map CPU to dense DF CDD index
arch/x86/include/asm/hygon/node.h:95:int hygon_cpu_to_df_node(unsigned int cpu);
arch/x86/include/asm/hygon/node.h:138:static inline int hygon_cpu_to_df_node(unsigned int cpu)
arch/x86/kernel/hygon_node.c:586:int hygon_cpu_to_df_node(unsigned int cpu)
arch/x86/kernel/hygon_node.c:600:EXPORT_SYMBOL_GPL(hygon_cpu_to_df_node);

So why is this function in a header and exported to no one?

Pls export it only when you need it and until then, keep it in the .c file
only.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
