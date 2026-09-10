Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614B37E5D1
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029831; cv=none; b=O6OLsJhLLcvcMdynJ49IWOeYPruuNhJXvgy2JrSL4DEFE78j8oBcbwVF5gyvfoqv0Ufp2kRR4tTKt29rgmhXhTejJM7rqanLd0QSkXPIJWJwOtWUYaS81TuyMWXkIbqes8CbfBjFIOm4Cm9NovYRB6lqvraWt4MQnEDVJDbTtAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029831; c=relaxed/simple;
	bh=HmALqKx2xd8LF9w02zxcd4+EWzduNgIl1mLi5+/A3GQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fLtwDvlvyuw2yS5+PVLbz0kc36qyZyVpSSELZXYsL+TI3kDf8Am7UttrGJDVYmmejGpAEQt6J4mSrN6zlj9fNmj6nvHvfuNjf6w+5D09LGv4gllCJb9hTRTrpDYvvzRHthISTVMzlPIz9y3VdQiGR0Hx1YfEer9sACU5EJKpMSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGSDxmXg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGSDxmXg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1768A1F00893;
	Thu, 10 Sep 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029830;
	bh=Rjcy3IYhJtlUtgjp0jYfab0EOc8NvPU92VjTKIilTbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RGSDxmXgrl+KPPhQRpkGQWHA7qX0Edo6ywVdbZytbPrI/Rzss9baxK2DZXepfsWCD
	 7r0VNSZL+CN5I8Hr0LYs7AWL7V8Ns80Y7EZMtyjwkRcuBxnoWQHmWzdJmUhlNh4LxK
	 R4caGfTYZUnn4G8fciGvJWL9hRwLhyGi3scklkGwLwF8iM3wjuW79Q3pS7zgtTlXSF
	 Pz93grZUuJLxZs2vSdBsj671mmSZ/RgJtUwxhnnBGihclOtcto7Mgxw9yTYGIYg1Um
	 kEX3vc4efOysOexL8i/gvZ25AkanLCsXb31X4S1kwtOsGErxGe00aMpDncOnSYI+W8
	 V8MP67PC05kKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] x86/amd_node: Restrict SMN setup to AMD CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910082734.3771675-8-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-8-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:43:49 +0000
Message-Id: <20260910084350.1768A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `amd_roots` array stores dangling pointers to PCI devices beca=
use their reference counts are incorrectly dropped during the iteration loo=
p.
--

commit 263066910679f0796c85e4dd7d844bda35fa7403
Author: Lin Wang <wanglin@open-hieco.net>

x86/amd_node: Restrict SMN setup to AMD CPUs

amd_smn_init() divides host bridge roots among amd_num_nodes() entries
in PCI enumeration order. This restricts AMD SMN setup and root discovery
to AMD CPUs.

> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index 762585775b5a2..a7190cec69954 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -229,8 +229,7 @@ static struct pci_dev *get_next_root(struct pci_dev *=
root)
>  		if (root->devfn)
>  			continue;
> =20
> -		if (root->vendor !=3D PCI_VENDOR_ID_AMD &&
> -		    root->vendor !=3D PCI_VENDOR_ID_HYGON)
> +		if (root->vendor !=3D PCI_VENDOR_ID_AMD)
>  			continue;
> =20
>  		break;

[Severity: High]
This isn't a bug introduced by this patch, but does the amd_roots array
store dangling pointers to PCI devices because their reference counts are
incorrectly dropped during the iteration loop?

This function delegates to pci_get_class(), which by design drops the
reference count of the device passed to it. In the second loop of
amd_smn_init(), a newly matched root device is stored into amd_roots
without acquiring an additional reference:

arch/x86/kernel/amd_node.c:amd_smn_init() {
    ...
	while (node < num_nodes && (root =3D get_next_root(root))) {
		/* Use one root for each node and skip the rest. */
		if (count++ % roots_per_node)
			continue;

		pci_dbg(root, "is root for AMD node %u\n", node);
		amd_roots[node++] =3D root;
	}
    ...
}

In the next iteration, the loop condition root =3D get_next_root(root) pass=
es
that same root back to pci_get_class(), immediately decrementing its
reference count. This leaves the amd_roots array populated with dangling
pointers.

Conversely, the reference count of the very last device retrieved is leaked
because the loop terminates when node < num_nodes fails before it can be
passed back into get_next_root().

While host bridges are typically not hot-removable in this architecture, co=
uld
this be a structural use-after-free and reference leak?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910082734.3771=
675-1-wanglin@open-hieco.net?part=3D7
