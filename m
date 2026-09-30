Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A11B808;
	Wed, 30 Sep 2026 00:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790729042; cv=none; b=snAFOnaGX5QkKsegeLnRMAXj1nM29iAh4R7xjZ627sQiUy3Rrb5njxi445c9lBjRyimZIlBD6aBhILyHjUkBFYb/mgHfsQG48otj9yKBBlZmehldSTGSwHvwE6YxJuFd0bT2aLPq+Nii6NwRsTOh854uiYKxnVUTyGYvnqG9XHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790729042; c=relaxed/simple;
	bh=rl4Qx+qtoAfq2cxPcDbflqm2zgtP/bl103eZOj/otiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVMP8UBe+RcR1d3ON4A4PEYe2aSILNTN39fXk/rakE84ou7/7dCVzECvKSBkOGfPxErATmjPhj02nt+VJn2DV1Astnx1StnxI+goHmtUY16011Kdpjp+tpoGeKF7AIrLnWsvm1WxoJkWzQuRU8NkXeTLfhjbQTSULCNQHV4qRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LL1SVkBw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LL1SVkBw"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9FE3B40E015D;
	Wed, 30 Sep 2026 00:43:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IvAP7ibQI9aD; Wed, 30 Sep 2026 00:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790729028; bh=ZUlgwV/afSHznTvFxQ9i/lBj+6Iqx5Z24VHQdaNz5qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LL1SVkBwaPaER8S+bj3M1tQc5OJ44HAXotSKCiKXs21ECmyF9DbUQ0PyulBpfG0x9
	 NplicTr9qrW5MS4vfSRUr/AHHOdKb+A1nVrdoPK6GDmjLavnzonuTE/TFU5/gUfjwn
	 lrsPZgVDItwiwtU5MuVC7QTwekD5rvm4jqYC02fd5MrxvpKB0HjqAXzC/4dWf7UG7Y
	 NIeqF/z6RSjDpTIgCtSMQ5Gh0QJ+QQqwotr+G0Fk6S819sFTNSK+hGd+WGKQh4eaNS
	 UVzVADCjtj8BLlEiJdCUkuCNX71dgwYk/kxiVWjIo/HCv1kUaYZlB0zcsq54u08D52
	 YszmB3ZLVCIDZAO3uCRM+b2hzzA0cSN7yB7FFKUTIRdkbz4wD4zT4ZsLhQU8dCdHXz
	 oVHZMF3V9EmpSOQF33OJO/F6VJPUkZwziCTyn+h43X1Za2JBusfKKjyeZFgA30hQW2
	 g3lut5u4QJawGRwDJXXVz9TlAptp+4iHiqkvVtGpt7NL8ua2OKMjHbxHOQ4k/xl41Q
	 N1k/1CXmDNVTONvuZ9GTQ3Z3EbtvJknW4wrBJapu+XG3YPdArRfluw1I07hjvDfDNK
	 kVAGS/c8gGwBCLtwXD5lWZC0H7zSKtLgiwv3Q9/k9XH7lJ1axwr6ZOHD5j9yRqyn4e
	 kMO45F6/GtJ0z9SyXT+7FFoY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1D59E40E01B4;
	Wed, 30 Sep 2026 00:43:33 +0000 (UTC)
Date: Tue, 29 Sep 2026 17:43:30 -0700
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
Subject: Re: [PATCH v6 1/8] x86/hygon: Add Family 0x18 DF node enumeration
Message-ID: <20260930004330.GFarxbMrS2DQKmC3_M@fat_crate.local>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-2-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921055603.25112-2-wanglin@open-hieco.net>

On Mon, Sep 21, 2026 at 01:55:56PM +0800, Lin Wang wrote:
> +struct hygon_node {
> +	struct pci_dev	*misc;
> +	struct pci_dev	*link;
> +	u8		socket_id;
> +	u8		dfid;
> +	bool		is_cdd;
> +};
> +
> +struct hygon_node_cache {
> +	struct hygon_node	*nodes;
> +	u16			num_nodes;
> +	u16			num_cdd;
> +	u16			num_sockets;
> +};
> +
> +struct hygon_df_id {
> +	u8	socket_id;
> +	u8	dfid;
> +};
> +
> +/* DF sibling device IDs used to read node identity. */
> +struct hygon_df_cfg {
> +	u16	f1_id;
> +	u16	f5_id;
> +};
> +
> +/* DF misc (F3) device IDs for all supported Hygon Family 0x18 models. */
> +static const struct pci_device_id hygon_nb_misc_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_DF_F3) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_M04H_DF_F3) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_M05H_DF_F3) },
> +	{}
> +};
> +
> +/* DF link (F4) device IDs for supported models. */
> +static const struct pci_device_id hygon_nb_link_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_DF_F4) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_M04H_DF_F4) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_M05H_DF_F4) },
> +	{}
> +};
> +
> +static const struct hygon_df_cfg hygon_m04_df_cfg __initconst = {
> +	.f1_id	= PCI_DEVICE_ID_HYGON_18H_M04H_DF_F1,
> +};
> +
> +static const struct hygon_df_cfg hygon_m05_df_cfg __initconst = {
> +	.f1_id	= PCI_DEVICE_ID_HYGON_18H_M05H_DF_F1,
> +};
> +
> +static const struct hygon_df_cfg hygon_m06_m08_df_cfg __initconst = {
> +	.f1_id	= PCI_DEVICE_ID_HYGON_18H_M05H_DF_F1,
> +	.f5_id	= PCI_DEVICE_ID_HYGON_18H_M06H_DF_F5,
> +};
> +
> +static const struct x86_cpu_id hygon_df_cpuids[] __initconst = {
> +	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x04, &hygon_m04_df_cfg),
> +	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x05, &hygon_m05_df_cfg),
> +	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x06, &hygon_m06_m08_df_cfg),
> +	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x07, &hygon_m06_m08_df_cfg),
> +	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x08, &hygon_m06_m08_df_cfg),
> +	{}
> +};
> +
> +static struct hygon_node_cache hygon_cache;
> +
> +/*
> + * Iterate Hygon PCI devices, returning the next one that matches @ids.
> + * Follows the pci_get_device() convention: @from is consumed (its
> + * reference is dropped) and the returned device has an elevated
> + * reference count.
> + */
> +static struct pci_dev * __init next_hygon_dev(struct pci_dev *from,
> +					      const struct pci_device_id *ids)
> +{
> +	while ((from = pci_get_device(PCI_VENDOR_ID_HYGON, PCI_ANY_ID, from))) {
> +		if (pci_match_id(ids, from))
> +			return from;
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * Find the DF link (function 4) sibling of a DF misc (function 3)
> + * device.  Both functions share the same PCI bus and slot.
> + */
> +static struct pci_dev * __init hygon_get_link(struct pci_dev *misc)
> +{
> +	struct pci_dev *link;
> +
> +	link = pci_get_domain_bus_and_slot(pci_domain_nr(misc->bus),
> +					   misc->bus->number,
> +					   PCI_DEVFN(PCI_SLOT(misc->devfn),
> +						     HYGON_DF_F4));
> +	if (!link)
> +		return NULL;
> +
> +	if (!pci_match_id(hygon_nb_link_ids, link)) {
> +		pci_dev_put(link);
> +		return NULL;
> +	}
> +
> +	return link;
> +}

So all your local structs and functions - above and below, they don't really
need the "hygon_" prefix. This way, for one, you can know immediately from the
name whether it is a local or an exported entity and, two, you're going to
have a lot smaller text, much easier to read and so on.

Other than that, that patch LGTM.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
