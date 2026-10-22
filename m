Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655553;
	b=H0RbHHygX7pkJ16qfFupQHua//BN1wYSnRwA/t9asPAGE/jfYwfEeKycivJT/IcVhJOe
	 0G0biEVmgwdabI1V49dtgjQMazO1r/1W1Tr7ShGVfwAB7W+YKLQMytmW350KmXVKmvD20
	 dMjUJMDhpihO+M7bzIo8axd2KVl+fiXnWQUECgvBqILWP52kB12r5CDHlk0yn+/gkXDvy
	 bdNffWat47HDdH39vR6PBDWYBunToneGoiGpqq7i42sm/lC4uQYWlibGPbjdm/3q2LaGL
	 V9uzFi56lbfwsHjxvJ2MIx95AfCsb0vpizyorY2MrGo+QCmoW0rJ/ms+wAb9q7v/HEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655553;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QvLCQpnEb8flW3sm1RyfRloOgi7gNgoyLD4tV8QQ0wA=;
	b=pubBHxktLKahFcmYWmP0mYvigi8yLvrQnuS7YBqt93zspNFOe+mbqmyKcf0AreztSPQI
	 did6PNfpYhUJjKE4Su4VzxT4VLUDzsLfWxU4C59V/XqGPIMLHN+wBWt+1tTa2XOufdO7v
	 Oa97LOWO6AON9PtM7DPSvMqU1xumXt5yHrTQIPD+k6lbr+G8JUwOlqNCkuuWNtU9RTvtJ
	 MwffpyijflI9yikhGntSPQFS0UhfzQ7HQsyEeP4Ix5lBwNVvj85A53KQP/E/OfAyaJV6u
	 3jrYIcGgTID48w0ZGOXIdio53CbBtxMnkVq68mTDem16n4zAQqYwpVJKezgz2F80tJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Al0IG5rX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DB606A31D
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Al0IG5rX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D151F000C2;
	Thu, 22 Oct 2026 07:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655552;
	bh=QvLCQpnEb8flW3sm1RyfRloOgi7gNgoyLD4tV8QQ0wA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Al0IG5rX22V1NV1LwuP5U+D37bF7bplx6RF9SRQ29gsqv8/c83/GFay5j6BJRqY+n
	 7ch+Dkdz5sOltAyKtFuzdg5jDWOJrEVJ6QET1G28d+ZV6z84WbYs4JBhvWcXtsgIEZ
	 Wl7IpMjYs0DjNEZj12B8nsMDntMcLvXWBMRB0xszKwIO+VvjGlTGdG/cPjeE3sEPUZ
	 +0qrUzYeUGt6dBsjP/EvyEpJa1dvuuWwIyz6XQNIKThhfGyVGSHoTe1E9wYY13H5Rn
	 0DSaQfQn+ujqwlNh/GxopgwiNg71stcIR6RnW+joHuTSKChIUrOxC6phtrC4GRQQFM
	 v7Q3deJl76yMQ==
Message-ID: <sashiko-outbox-181145@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/7] x86/hygon: Add Family 0x18 SMN access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261022074218.667049-8-wanglin@open-hieco.net>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-8-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:52:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] x86/hygon: unreferenced reserved_roots allocation in smn_setup()
--

commit 9932a3551c6b7f805f9889c0454dbe666f4f46a0
Author: Lin Wang <wanglin@open-hieco.net>

x86/hygon: Add Family 0x18 SMN access

This commit adds system management network access support for Hygon
Family 0x18 processors by mapping data fabric nodes to per-socket root
complexes and providing serialized read and write helpers.

> diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
> index 03c723aab97e3..7b0a18cd7027a 100644
> --- a/arch/x86/kernel/hygon_node.c
> +++ b/arch/x86/kernel/hygon_node.c
[ ... ]
> @@ -629,6 +631,229 @@ static int __maybe_unused hygon_pci_dev_to_df_node(=
struct pci_dev *pdev)
[ ... ]
> +static struct pci_dev	**smn_roots;
> +static struct pci_dev	**smn_reserved_roots;
> +static u16		smn_num_nodes;
> +static DEFINE_MUTEX(smn_mutex);
[ ... ]
> +static int __init smn_setup(void)
> +{
> +	u16 num_roots, roots_per_socket, node, num_nodes, num_sockets, reserved;
> +	struct pci_dev **reserved_roots, **roots;
> +	struct pci_dev *root =3D NULL;
> +	u8 socket_id;
> +	int ret;
[ ... ]
> +	roots =3D kzalloc_objs(*roots, num_nodes);
> +	if (!roots)
> +		return -ENOMEM;
> +
> +	reserved_roots =3D kzalloc_objs(*reserved_roots, num_roots);
> +	if (!reserved_roots) {
> +		kfree(roots);
> +		return -ENOMEM;
> +	}
[ ... ]
> +	for (node =3D 0; node < num_nodes; node++) {
> +		socket_id =3D df_cache.nodes[node].socket_id;
> +
> +		if (socket_id >=3D num_sockets) {
> +			ret =3D -ENODEV;
> +			goto err_release;
> +		}
> +
> +		roots[node] =3D reserved_roots[socket_id * roots_per_socket];
> +
> +		pci_dbg(roots[node],
> +			"is root for Hygon node %u (socket %u)\n",
> +			node, socket_id);
> +	}
> +
> +	smn_reserved_roots =3D reserved_roots;
> +	smn_num_nodes =3D num_nodes;
> +	smn_roots =3D roots;
> +	return 0;

[Severity: Medium]
Does df_node_init() -> smn_setup() in arch/x86/kernel/hygon_node.c leak the
reserved_roots array once initialization completes?

In smn_setup(), reserved_roots is allocated with kzalloc_objs() to track
reserved root devices for error rollback via release_reserved_roots() and
to populate roots[node]. At the end of smn_setup(), reserved_roots is
assigned to the file-scope static variable smn_reserved_roots, which is
never read anywhere in arch/x86/kernel/hygon_node.c.

Because smn_reserved_roots is a write-only static variable with internal
linkage, the compiler optimizes away both the variable and the store to it.
Once smn_setup() returns, no reference to the reserved_roots allocation
remains in memory (as smn_roots only holds pointers to the individual
pci_dev objects), which leaves the array leaked and triggers a kmemleak
report.

Since the device references from pci_dev_get() and the config space
reservations from pci_request_config_region_exclusive() are held by the
pci_dev objects themselves, could smn_reserved_roots be removed and
reserved_roots freed with kfree(reserved_roots) before smn_setup() returns
0?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022074218.6670=
49-1-wanglin@open-hieco.net?part=3D7
