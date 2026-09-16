Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367124886E;
	Wed, 16 Sep 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574438; cv=none; b=tFat+06vRCQ53TXa8ys3BonE7PHBBMxN4MDj8BZVyO0La/sGyW0bcwfwpbwMMmG4kyJZcfAR1k46V59WeH89nOy+eeEglFzzQyjbUQJMaEdqFC7ydKXjJ7DuQ178WmXNo28EXoCS3EgJHSTyD+J/ZxCSnliWARHrK2nS2kLAyxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574438; c=relaxed/simple;
	bh=GHdhcu2Fzga0ZT4BsriYfEoIiEckq9fEim3YXDjIyyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lg8yBcztc5L0bsT+mI4pZLd0mLsNGCDD2748RoZbRqifhOY+GqDIGgBbCynPeuHdXqABUvSazIadevc1ZmExFxVX8XIvjrXts/hlXNocLtF0NIYLcjlcu8b3WmHdbvgKH+YV+FKijpJz7xv0f2CGDa6lOWWHqqgRR7Ku6ecFItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fMKQE9kv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fMKQE9kv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A27B540E022C;
	Wed, 16 Sep 2026 16:00:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FMO6eo6vP5J4; Wed, 16 Sep 2026 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789574415; bh=VhBXz8iUfZiZKp7U7NIYUPZWL1BpaHmabXO0Jw0Rm/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMKQE9kvpqtYfy18piC+NRwzDIuE6812sWel8qizaefesZZORBwMe2n5lvYE0Z5r6
	 mtgfdMvDT8nKFQcUkSV/79iv6Cx4HlC7lPoS10iB8oT595ixyDnGIoAQYfffZLGoIb
	 7PPO8wvLvfEbt50WU0iwd8XhoE5noP2VBTuxoKCojc540TjPoUiAxU5jdSUxTlV4s8
	 oyAQuMH+O53RfboI2GAAd3iBgO2+ZMSgT9YTHW1zXI+iFgtG4Llv/Aqkr+4I8/3ZFE
	 4X1+8LoBwV5CxeMr4Trwl0QDC0RdtjZa5Rp0Ekm9QcvOG3op8og19c/lc3ANp2RDAz
	 2k+m2+L0FT1CcLi8gngnuQBJijr6CgRWOgoha6cQEGIEUItljR9jG8QTh6r4hx0LFv
	 UqJKz1MomghTRAUqWbPkTEmF3M586CZJhEaCKauMqZY3GbJtPgJ287OfIxr7NqQ1Ps
	 G4dlTvaXdTbWZtKTj0TXv3+ogXXjpHDSF1k6bgHC8DZQzWliVi0nAJdXhPbq3XNmN7
	 gfMSyuDUTKRLE3sXvh/vX5vHby21dSHoAHym0Dhnoe28MMWrx1HsFutDvE3nKuw9SF
	 ZxlWDRFMYN6Z7nw3ceJQgWQY7uSD1nKVGmtw8sxn9Cm9dmTncAyDib/e3QPoDsswFa
	 1q1TiNEylgXUmGnVDRqOUU+4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DB16E40E015B;
	Wed, 16 Sep 2026 15:59:59 +0000 (UTC)
Date: Wed, 16 Sep 2026 08:59:56 -0700
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
Subject: Re: [PATCH v5 1/8] x86/hygon: Add Family 0x18 DF node enumeration
Message-ID: <20260916155956.GBaqq8_BsuLkBKp-Ia@fat_crate.local>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-2-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910082734.3771675-2-wanglin@open-hieco.net>

On Thu, Sep 10, 2026 at 04:27:27PM +0800, Lin Wang wrote:
> +/*
> + * Cached identity for one DF instance.  After sorting, CDDs occupy
> + * nodes[0..num_cdd-1].
> + *
> + * The PCI BDF is the access point for a DF node, not its identity.
> + * socket_id and dfid, read from DF registers, together identify the
> + * node in hardware.
> + */
> +struct hygon_node {
> +	struct pci_dev	*misc;		/* DF function 3 */
> +	struct pci_dev	*link;		/* DF function 4 */
> +	u8		socket_id;	/* F1x200[30:28] */
> +	u8		dfid;		/* model-dependent DFID */
> +	bool		is_cdd;		/* DFID >= 4 */
> +};
> +
> +struct hygon_node_cache {
> +	struct hygon_node	*nodes;		/* sorted: CDD first, then IOD */
> +	u16			num_nodes;	/* CDD + IOD = total */
> +	u16			num_cdd;	/* CDD only */
> +	u16			num_sockets;
> +
> +	/* Set after DF node collection, sorting and validation complete. */
> +	bool			ready;
> +};

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:76 [+	struct pci_dev	*misc;		/* DF function 3 */]

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:77 [+	struct pci_dev	*link;		/* DF function 4 */]

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:78 [+	u8		socket_id;	/* F1x200[30:28] */]

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:79 [+	u8		dfid;		/* model-dependent DFID */]

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:80 [+	bool		is_cdd;		/* DFID >= 4 */]

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:84 [+	struct hygon_node	*nodes;		/* sorted: CDD first, then IOD */]

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:85 [+	u16			num_nodes;	/* CDD + IOD = total */]

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:86 [+	u16			num_cdd;	/* CDD only */]

verify_comment_style: WARNING: No tail comments please:
 arch/x86/kernel/hygon_node.c:101 [+	u16	f5_id;			/* 0 = not available */]

From: Documentation/process/maintainer-tip.rst

Please peruse that doc.

No tail comments (see below):
       
  Please refrain from using tail comments. Tail comments disturb the
  reading flow in almost all contexts, but especially in code::

        if (somecondition_is_true) /* Don't put a comment here */
                dostuff(); /* Neither here */
       
        seed = MAGIC_CONSTANT; /* Nor here */

  Use freestanding comments instead::
       
        /* This condition is not obvious without a comment */
        if (somecondition_is_true) {
                /* This really needs to be documented */
                dostuff();
        }

        /* This magic initialization needs a comment. Maybe not? */
        seed = MAGIC_CONSTANT;

  Use C++ style, tail comments when documenting structs in headers to
  achieve a more compact layout and better readability::

        // eax
        u32     x2apic_shift    :  5, // Number of bits to shift APIC ID right
                                      // for the topology ID at the next level
                                : 27; // Reserved
        // ebx
        u32     num_processors  : 16, // Number of processors at current level
                                : 16; // Reserved

  versus::

        /* eax */
                /*
                 * Number of bits to shift APIC ID right for the topology ID
                 * at the next level
                 */
         u32     x2apic_shift    :  5,
                 /* Reserved */
                                 : 27;

        /* ebx */
                /* Number of processors at current level */
        u32     num_processors  : 16,
                /* Reserved */
                                : 16;

...

> +static int __init hygon_collect_nodes(struct hygon_node_cache *cache)
> +{
> +	struct hygon_node *nodes;
> +	struct pci_dev *misc = NULL;
> +	struct pci_dev *link = NULL;
> +	u16 capacity = 0, count = 0;
> +	u8 observed_socket_mask = 0;
> +	u8 socket_present_mask = 0;
> +	int ret;

The tip-tree preferred ordering of variable declarations at the
beginning of a function is reverse fir tree order::

	struct long_struct_name *descriptive_name;
	unsigned long foo, bar;
	unsigned int tmp;
	int ret;

The above is faster to parse than the reverse ordering::

	int ret;
	unsigned int tmp;
	unsigned long foo, bar;
	struct long_struct_name *descriptive_name;

And even more so than random ordering::

	unsigned long foo, bar;
	int ret;
	struct long_struct_name *descriptive_name;
	unsigned int tmp;

Please audit all your functions in all patches.

> +
> +	while ((misc = next_hygon_dev(misc, hygon_nb_misc_ids)))
> +		capacity++;
> +
> +	if (!capacity)
> +		return -ENODEV;
> +

...

> +int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
> +{
> +	u16 i;
> +
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	if (!hygon_cache.ready)
> +		return -ENODEV;
> +
> +	for (i = 0; i < hygon_cache.num_nodes; i++) {
> +		struct pci_dev *misc = hygon_cache.nodes[i].misc;
> +
> +		if (pci_domain_nr(misc->bus) == pci_domain_nr(pdev->bus) &&
> +		    misc->bus->number       == pdev->bus->number      &&
> +		    PCI_SLOT(misc->devfn)   == PCI_SLOT(pdev->devfn))
> +			return i;

Something happened here to that whitespace.

:)

> +	}
> +
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(hygon_pci_dev_to_df_node);
> +
> +/*
> + * Build the Hygon DF node cache at fs_initcall.
> + */
> +static int __init hygon_node_init(void)
> +{
> +	int ret;
> +
> +	if (!hygon_get_df_cfg())
> +		return 0;
> +
> +	ret = hygon_build_cache();
> +	if (ret) {
> +		pr_warn("DF node cache build failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pr_info("%u DF nodes (%u CDDs, %u IODs) across %u sockets\n",
> +		hygon_cache.num_nodes, hygon_cache.num_cdd,
> +		hygon_cache.num_nodes - hygon_cache.num_cdd,
> +		hygon_cache.num_sockets);
> +
> +	return 0;
> +}
> +fs_initcall(hygon_node_init);
> -- 

Sure looks complex... I hope you know what you're doing...

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
